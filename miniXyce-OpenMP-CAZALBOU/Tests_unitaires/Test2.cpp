
#include <iostream>
#include <vector>
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


void print_matrix(distributed_sparse_matrix &A)
{
  int numprocs = 1, procnum = 0;

  for (int i=0; i< numprocs; ++i)
  {
    if (i == procnum)
    {
      if (procnum == 0)
        std::cout << "Matrix\nProc\tRow\tColumn\tValue" << std::endl;

      for (int j=A.start_row, cnt=0; j<=A.end_row; ++j, ++cnt)
      {
        distributed_sparse_matrix_entry* curr = A.row_headers[cnt];

        while (curr)
        {
          std::cout << procnum << "\t" << j << "\t" << curr->column << "\t" << curr->value << std::endl;
          curr = curr->next_in_row;
        }
      }
    }
  }
}


void sparse_gaxpy_OMP(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> const& b, std::vector<double>& y, double& alpha, double& beta)
{
	unsigned int start_row = A->start_row;
	unsigned int end_row = A->end_row;

	assert( start_row == 0);
	assert( end_row-start_row+1 == x.size() );
	assert( x.size() == y.size() );
	assert( y.size() == b.size() );

	#pragma omp parallel for
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



int main()
{
    distributed_sparse_matrix A(0, 2);
    distributed_sparse_matrix_add_to(&A, 0, 0, -1.1);
    distributed_sparse_matrix_add_to(&A, 0, 2, 3.4);
    distributed_sparse_matrix_add_to(&A, 1, 2, 2.1);
    distributed_sparse_matrix_add_to(&A, 2, 0, -4);
    distributed_sparse_matrix_add_to(&A, 2, 1, 6.1);
    //print_matrix(A);

    std::vector<double> x = {7.54, -5, 0.12};
    double alpha = 1.2, beta = -6;
    std::vector<double> b = {-9, 17.1, 3};

    std::vector<double> y(3, 4.89);

    // Calcul :
    #pragma omp parallel num_threads(7)
    {
      std::cout << "Coucou de T" << omp_get_thread_num() << std::endl;
      sparse_gaxpy_OMP(&A, x, b, y, alpha, beta);
    }

    for(auto& v : y)
    {
        std::cout << v << " ";
    }
    std::cout << std::endl;

    std::cout << "Attendu : " << 44.5368 << " " << -102.2976 << " " << -90.792 << std::endl;

    return 0;
}
