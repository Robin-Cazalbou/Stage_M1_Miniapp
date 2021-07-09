
#include <iostream>
#include <vector>
#include <cmath>
#include <cassert>
#include <omp.h>


struct distributed_sparse_matrix_entry
{
	int column;		// global column index
	double value;	// value stored in the matrix
	distributed_sparse_matrix_entry* next_in_row;	// pointer to next entry in the same row
};

struct distributed_sparse_matrix
{
	// the data structure for a distributed sparse matrix is a 1-d threaded list
	// a set of pointers called row_headers point to the first entry of each row
	// each row entry in turn points to the next entry in the same row

	// but a distributed matrix needs more data than this
	// there is a list of data transfer instructions
	// these instructions are to be followed whenever a mat-vec product is needed

	// each processor also stores 2 entries start_row and end_row
	// it is assumed that all processors store contiguous rows of the distributed matrix

	int start_row;
	int end_row;
	int local_nnz;

	std::vector<distributed_sparse_matrix_entry*> row_headers; // list of first entry of each row (nullptr if the row only contains zeros)

	// Overloaded constructor :
	distributed_sparse_matrix(int start, int end) : start_row(start), end_row(end), local_nnz(0)
	{
		row_headers.resize(end-start+1, nullptr);
	}
};

void distributed_sparse_matrix_add_to(distributed_sparse_matrix* M, int const row_idx, int const col_idx, double const val)
{
	// implements M[row_idx][col_idx] += val
	// man, in the distributed matrix world, this simple thing takes such a lot of effort!

	if ((row_idx < 0) || (col_idx < 0))
	{
		// check for negative indices
		// useful in cases where you want to ignore the ground
		// because the ground is not really a node

		return;
	}

	if ((row_idx >= M->start_row) && (row_idx <= M->end_row))
	{
		// ok, so the processor that's supposed to store M[row_idx][col_idx] is here
		// navigate through the fellow's threaded list and do the needful

		bool inserted = false;

		distributed_sparse_matrix_entry* prev = 0;
		distributed_sparse_matrix_entry* curr = M->row_headers[row_idx-M->start_row];

		while ((curr) && (!inserted))
		{
			if (curr->column < col_idx)
			{
				prev = curr;
				curr = curr->next_in_row;
			}
			else if (curr->column == col_idx)
			{
				curr->value = curr->value + val;
				inserted = true;
			}
			else
			{
				distributed_sparse_matrix_entry* entry_ptr_1 = new distributed_sparse_matrix_entry();
				entry_ptr_1->column = col_idx;
				entry_ptr_1->value = val;
				entry_ptr_1->next_in_row = curr;
				M->local_nnz++;

				if (prev)
				{
					prev->next_in_row = entry_ptr_1;
				}
				else
				{
					M->row_headers[row_idx-M->start_row] = entry_ptr_1;
				}

				inserted = true;
			}

		}

		if (!inserted)
		{
			distributed_sparse_matrix_entry* entry_ptr_1 = new distributed_sparse_matrix_entry();
			entry_ptr_1->column = col_idx;
			entry_ptr_1->value = val;
			entry_ptr_1->next_in_row = curr;
			M->local_nnz++;

			if (prev)
			{
				prev->next_in_row = entry_ptr_1;
			}
			else
			{
				M->row_headers[row_idx-M->start_row] = entry_ptr_1;
			}

			inserted = true;
		}
		// Insertion of the value is now done

		return;
	}

	// that was easy!

}


void scal_prod_OMP(std::vector<double> const& u1, std::vector<double> const& u2, double& res)
{
	assert( u1.size() == u2.size() );

	#pragma omp single
	{
		#pragma omp atomic write
		res = 0.0;
	}

	#pragma omp for reduction(+:res)
	for(unsigned int i = 0; i<u1.size(); i++)
	{
		res += u1[i]*u2[i];
	}
}


// Compute alpha*A*x + beta*b, and store it into y
// A BLAS/Lapack routine DGEMV can possibly be used instead of this function (with some modifications)
void sparse_gaxpy_OMP(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> const& b, std::vector<double>& y, double const& alpha, double const& beta)
{
	unsigned int start_row = A->start_row;
	unsigned int end_row = A->end_row;

	assert( start_row == 0);
	assert( end_row-start_row+1 == x.size() );
	assert( x.size() == y.size() );
	assert( y.size() == b.size() );

	#pragma omp for
	for(unsigned int i = start_row; i <= end_row; i++)
	{
		// Compute y[i] = (A*x)[i] :
		y[i] = 0.0;

		distributed_sparse_matrix_entry* curr = A->row_headers[i];
		while(curr)
		{
			y[i] += (curr->value)*x[curr->column];
			curr = curr->next_in_row;
		}

		// Multiply by alpha
		y[i] *= alpha;
		// Add beta*b
		y[i] += beta*b[i];
	}

}


// Compute alpha*x+beta*b, and store it into y
// A BLAS/Lapack routine SAXPY can possibly be used instead of this function (with some modifications)
void saxpy_OMP(std::vector<double> const& x, std::vector<double> const& b, std::vector<double>& y, double const& alpha, double const& beta)
{
	assert( x.size() == y.size() );
	assert( y.size() == b.size() );

	#pragma omp for
	for(unsigned int i = 0; i<x.size(); i++)
	{
		y[i] = alpha*x[i] + beta*b[i];
	}

}



void arnoldi_OMP(distributed_sparse_matrix* A, std::vector<std::vector<double>>& V, std::vector<std::vector<double>>& R, int const& iter)
{
	// Some asserts to protect the code
	assert( A->start_row == 0);
	assert( (unsigned)iter <= R.size() );
	assert( V.size() == R.size() + 1 );
	for(unsigned int i = 0; i<=(unsigned)iter; i++)
	{
		assert( (unsigned)(A->end_row - A->start_row + 1) == V[i].size() );
	}
	assert( R[iter-1].size() == (unsigned)(iter+1) );


	// Compute A*v_(iter-1) and store it into the V[iter]
	sparse_gaxpy_OMP(A, V[iter-1], std::vector<double>(V[iter-1].size(), 0.0), V[iter], 1.0, 0.0);
	// Compute scalar products : h_0, h_1, ..., h_(iter-1)
	// and substract h_0*v_0, h_1*v_1, ..., h_(iter-1)*v_(iter-1) to A*v_(iter-1)
	// This loop has to be executed in order, from h_0 to h_(iter-1)
	for(int i = 0; i<iter; i++)
	{
		// Compute h_i
		scal_prod_OMP(V[i], V[iter], R[iter-1][i]);
		// Update A*v_(iter-1) as : A*v_(iter-1) - h_i * v_i
		saxpy_OMP(V[iter], V[i], V[iter], 1.0, -R[iter-1][i]);
	}
	// Compute the norm h_iter := ||A*v_(iter-1) - h_0*v_0 - h_1*v_1 - ... - h_(iter-1)*v_(iter-1)||
	// i.e. ||V[iter]|| now, after its updates
	scal_prod_OMP(V[iter], V[iter], R[iter-1][iter]);
	#pragma omp single
	{
		R[iter-1][iter] = std::sqrt(R[iter-1][iter]);
	}
	// Compute : ( A*v_(iter-1) - h_0*v_0 - h_1*v_1 - ... - h_(iter-1)*v_(iter-1) ) / h_iter
	// i.e. V[iter] <-- V[iter] / h_iter
	saxpy_OMP(V[iter], std::vector<double>(V[iter].size(), 0.0), V[iter], 1.0/(R[iter-1][iter]), 0.0);

}



int main()
{
	std::vector<std::vector<double>> V(4, std::vector<double>(3, 0.0)), R(3);
	for(int i = 0; i<3; i++)
	{
		R[i] = std::vector<double>(i+2, 0.0);
	}

	double norm = std::sqrt(36581);
	V[0] = {180.0/norm, 41.0/norm, -50.0/norm};

	distributed_sparse_matrix A(0, 2);

	distributed_sparse_matrix_add_to(&A, 0, 0, 1);
	distributed_sparse_matrix_add_to(&A, 0, 1, 5);
	distributed_sparse_matrix_add_to(&A, 0, 2, 9);
	distributed_sparse_matrix_add_to(&A, 1, 0, 9);
	distributed_sparse_matrix_add_to(&A, 1, 1, 10);
	distributed_sparse_matrix_add_to(&A, 1, 2, 5);
	distributed_sparse_matrix_add_to(&A, 2, 0, 10);
	distributed_sparse_matrix_add_to(&A, 2, 1, 9);
	distributed_sparse_matrix_add_to(&A, 2, 2, 1);

	std::vector<double> b = {180, 41, -50};
	std::vector<double> x0 = {0.0, 0.0, 0.0};

	int iter = 1;

	#pragma omp parallel firstprivate(iter) num_threads(4)
	{
		arnoldi_OMP(&A, V, R, iter);
		iter++;
		arnoldi_OMP(&A, V, R, iter);
	}

	std::cout << "V =" << std::endl;
	for(auto& vec : V)
	{
		for(auto& val : vec)
		{
			std::cout << val << " ";
		}
		std::cout << std::endl;
	}

	std::cout << "R =" << std::endl;
	for(auto& vec : R)
	{
		for(auto& val : vec)
		{
			std::cout << val << " ";
		}
		std::cout << std::endl;
	}

	return 0;
}
