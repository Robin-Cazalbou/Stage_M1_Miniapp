//@HEADER
// ************************************************************************
//
//               miniXyce: A simple circuit simulation benchmark code
//                 Copyright (2011) Sandia Corporation
//
// Under terms of Contract DE-AC04-94AL85000, there is a non-exclusive
// license for use of this work by or on behalf of the U.S. Government.
//
// This library is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as
// published by the Free Software Foundation; either version 2.1 of the
// License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
// USA
// Questions? Contact Michael A. Heroux (maherou@sandia.gov)
//
// ************************************************************************
//@HEADER

// Author : Karthik V Aadithya
// Mentor : Heidi K Thornquist
// Date : July 2010

#ifdef HAVE_MPI
#include <mpi.h> // If this routine is compiled with -DHAVE_MPI
                 // then include mpi.h
#endif
#include "mX_sparse_matrix.h"
#include <map>
#include <cmath>
#include <iostream>
#include <algorithm>

#include "mX_timer.h"
#include "coroutines.h"
#include <cassert>

// For user-instrumentation with Score-P
//#include <scorep/SCOREP_User.h>

using namespace mX_matrix_utils;

void mX_matrix_utils::distributed_sparse_matrix_add_to(distributed_sparse_matrix* M, int const row_idx, int const col_idx, double const val)
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



void mX_matrix_utils::sparse_matrix_vector_product(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y, int nb_proc)
{
	// compute the matrix vector product A*x and return it in y
		// assuming x contains only x[start_row] to x[end_row]

	// at the end of this function, it is guaranteed that
		// y[0] to y[end_row-start_row] will contain the correct entries of (Ax)[start_row] to (Ax)[end_row]


	// User-instrumentation with Score-P :
	//SCOREP_USER_FUNC_BEGIN();

  // Time measured for the call of the function
  double smvprod_time_start = mX_timer();

	int start_row = A->start_row;
	int end_row = A->end_row;

	// Assert y is an empty vector
	assert( y.size() == 0 );
	// Assert the number of rows in A is equal to the size of x :
	assert( (unsigned int)end_row-start_row+1 == x.size() );


	// Resizing y (as it is asserted to be empty)
	y.resize(end_row-start_row+1, 0.0);

	// "Diagonal computing" phase (it exactly matches to the sequential computation) :
	for(int i = start_row; i <= end_row; i++)
	{
		distributed_sparse_matrix_entry* curr = A->row_headers[i-start_row];
		while(curr)
		{
			int col_idx = curr->column;
			// In the diagonal block :
			if( (col_idx >= start_row) && (col_idx <= end_row) )
			{
				y[i-start_row] += (curr->value)*x[col_idx-start_row];
			}
			// Continue with the next entry in the matrix row :
			curr = curr->next_in_row;
		}
	}

  // End of time measuring : time spent in the function is added to the previous time spent using the coroutine_smvprod
  double smvprod_time_end = mX_timer();
  coroutine_smvprod(smvprod_time_end - smvprod_time_start);


	//SCOREP_USER_FUNC_END();

}

double mX_matrix_utils::norm(std::vector<double> const& x)
{
	// at last, a function that's relatively simple to implement in parallel

	//SCOREP_USER_FUNC_BEGIN();

  double norm_time_start = mX_timer();


	double res = 0.0;

	for (int i = 0; i < x.size(); i++)
	{
		res += x[i]*x[i];
	}

  double norm_time_end = mX_timer();
  coroutine_norm(norm_time_end - norm_time_start);

	//SCOREP_USER_FUNC_END();

	return std::sqrt(res);
}

void mX_matrix_utils::gmres(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0, double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts, int const& nb_proc)
{
	// here's the star of the show, the guest of honor, none other than Mr.GMRES

	// first Mr.GMRES will compute the error in the initial guess
		// if it's already smaller than tol, he calls it a day
		// otherwise he settles down to work in mysterious ways his wonders to perform


	//SCOREP_USER_FUNC_BEGIN();

  double gmres_time_start = mX_timer();


	int start_row = A->start_row;
	int end_row = A-> end_row;

	x = x0;

	std::vector<double> temp1;
	sparse_matrix_vector_product(A,x,temp1, nb_proc);

	for (int i = 0; i < temp1.size(); i++)
	{
		temp1[i] -= b[i];
	}

	err = norm(temp1);

  	restarts = -1;
	iters = 0;

	while (err > tol)
	{
		// at the start of every re-start
			// the initial guess is already stored in x

		restarts++;

		std::vector<double> temp1;
		std::vector< std::vector<double> > V;
		sparse_matrix_vector_product(A,x,temp1, nb_proc);

		for (int i = start_row; i <= end_row; i++)
		{
			temp1[i-start_row] -= b[i-start_row];
			temp1[i-start_row] *= (double)(-1);

			std::vector<double> temp2;
			temp2.push_back(temp1[i-start_row]);
			V.push_back(temp2);
		}

		double beta = norm(temp1);

		for (int i = start_row; i <= end_row; i++)
		{
			V[i-start_row][0] /= beta;
		}

		err = beta;
		iters = 0;

		std::vector<double> cosines;
		std::vector<double> sines;
		std::vector<double> g;
		std::vector< std::vector<double> > R;

		g.push_back(beta);

		// ok, Mr.GMRES has determined the initial values for
			// V,R,g,sines,cosines,err and iters
			// he updates these at every iteration until
				// either err becomes less than tol
				// or a new restart is required

		// note that Mr.GMRES does not think it necessary to store the upper Hessenberg matrix at each iteration
			// he computes R at each iteration from the new Hessenberg matrix column
			// and he's clever enough to determine err without having to solve for x at each iteration

		while ((err > tol) && (iters < k))
		{
			iters++;

			// Mr.GMRES is now going to update the V matrix
				// for which he will require a matrix vector multiplication

			std::vector<double> temp1;
			std::vector<double> temp2;

			for (int i = start_row; i <= end_row; i++)
			{
				temp1.push_back(V[i-start_row][iters-1]);
			}
			sparse_matrix_vector_product(A,temp1,temp2, nb_proc);


			// Right, Mr.GMRES now has the matrix vector product
				// now he will orthogonalize this vector with the previous ones
					// with some help from Messrs Gram and Schmidt

			std::vector<double> new_col_H;

			for (int i = 0; i < iters; i++)
			{
				double local_dot = 0.0;
				double global_dot;

				for (int j = start_row; j <= end_row; j++)
				{
					local_dot += temp2[j-start_row]*V[j-start_row][i];
				}
        global_dot = local_dot;

				for (int j = start_row; j <= end_row; j++)
				{
					temp2[j-start_row] -= global_dot*V[j-start_row][i];
				}

				new_col_H.push_back(global_dot);
			}

			new_col_H.push_back(norm(temp2));

			for (int i = start_row; i <= end_row; i++)
			{
				temp2[i-start_row] /= new_col_H.back();
				V[i-start_row].push_back(temp2[i-start_row]);
			}


			// Right, Mr.GMRES has successfully updated V
				// on the side, he has also been computing the new column of the Hessenberg matrix
			// now he's going to get the new column of R using the current sines and cosines
				// and he will also add a new sine and a new cosine for future use

			for (int i = 0; i < iters-1; i++)
			{
				double old_i = new_col_H[i];
				double old_i_plus_one = new_col_H[i+1];

				new_col_H[i] = cosines[i]*old_i + sines[i]*old_i_plus_one;
				new_col_H[i+1] = -sines[i]*old_i + cosines[i]*old_i_plus_one;
			}

			double r = std::sqrt(new_col_H[iters-1]*new_col_H[iters-1] + new_col_H[iters]*new_col_H[iters]);
			cosines.push_back(new_col_H[iters-1]/r);
			sines.push_back(new_col_H[iters]/r);

			double old_i = new_col_H[iters-1];
			double old_i_plus_one = new_col_H[iters];

			new_col_H[iters-1] = cosines.back()*old_i + sines.back()*old_i_plus_one;
			new_col_H.pop_back();

			R.push_back(new_col_H);

			// Right, the new column of R is ready
			// the only thing left to do is to update g
				// which will also tell Mr.GMRES what the new error is

			double old_g = g[iters-1];
			g[iters-1] = old_g*cosines.back();
			g.push_back(-old_g*sines.back());

			err = std::abs(g.back());
		}

		// ok, so either Mr.GMRES has a solution
			// or he's being forced to restart
		// either way, he needs to compute x
			// now he needs to solve Ry = g
			// after which he will say x += (V without its last column)*y

		std::vector<double> y;

		for (int i = iters-1; i >= 0; i--)
		{
			double sum = (double)(0);

			for (int j = iters-1; j > i; j--)
			{
				sum += R[j][i]*y[iters-1-j];
			}

			y.push_back((g[i] - sum)/R[i][i]);
		}

		// ok, so y is ready (although it's stored upside down)

		for (int i = start_row; i <= end_row; i++)
		{
			double sum = (double)(0);

			for (int j = iters-1; j >= 0; j--)
			{
				sum += y[iters-1-j]*V[i-start_row][j];
			}

			x[i-start_row] += sum;
		}

		// the new x is also ready
			// either return it or use it as an initial guess for the next restart
	}

	// if Mr.GMRES ever reaches here, it means he's solved the problem

	if (restarts < 0)
	{
		restarts = 0;
	}


  double gmres_time_end = mX_timer();
  coroutine_gmres(gmres_time_end -gmres_time_start);

	//SCOREP_USER_FUNC_END();

}

void mX_matrix_utils::destroy_matrix(distributed_sparse_matrix* A)
{
  if(A)
  {
      // delete row_headers
      for (int j=A->start_row, cnt=0; j<=A->end_row; ++j, ++cnt)
      {
        distributed_sparse_matrix_entry* curr = A->row_headers[cnt], *next = 0;

        while (curr)
        {
          next = curr->next_in_row;
          delete curr; curr=0;
          curr = next;
        }
      }
      A->row_headers.resize(0);
      delete A;
			A = nullptr;
  }
}

void mX_matrix_utils::print_vector(std::vector<double>& x)
{
  int numprocs = 1, procnum = 0;

  for (int i=0; i< numprocs; ++i)
  {
    if (i == procnum)
    {
      if (procnum == 0)
        std::cout << "Proc\tLocal Index\tValue" << std::endl;

      for (int j=0; j<x.size(); ++j)
      {
        std::cout << procnum << "\t" << j << "\t" << x[j] << std::endl;
      }
    }
  }
}

void mX_matrix_utils::print_matrix(distributed_sparse_matrix &A)
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














// =================================================

// A simple scalar product between two vectors u1 and u2
// The result is contained into res. By the way, there is no "norm" function
// because you can use a pragma omp single and a sqrt on res after the call of this function
// Attention ! With OpenMP, res has to be **shared** between all threads
void mX_matrix_utils::scal_prod_OMP(std::vector<double> const& u1, std::vector<double> const& u2, double& res)
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
void mX_matrix_utils::sparse_gaxpy_OMP(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> const& b, std::vector<double>& y, double const& alpha, double const& beta)
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
void mX_matrix_utils::saxpy_OMP(std::vector<double> const& x, std::vector<double> const& b, std::vector<double>& y, double const& alpha, double const& beta)
{
	assert( x.size() == y.size() );
	assert( y.size() == b.size() );

	#pragma omp for
	for(unsigned int i = 0; i<x.size(); i++)
	{
		y[i] = alpha*x[i] + beta*b[i];
	}

}


// Perform an Arnoldi iteration, given the iter iteration :
// - compute the new column of the Hessenberg matrix using the previsou vectors v_0, v_1, ..., v_(iter-1)
// stored into the V matrix (at V[iter])
// - each component of this new column is a scalar product ( h_j := v_j . [A*v_(iter-1)]_updated, where
// the update is A*v_(iter-1) <-- A*v_(iter-1) - h_i*v_i) and the last one is
// the norm h_iter := ||A*v_(iter-1) - h_0*v_0 - h_1*v_1 - ... - h_(iter-1)*v_(iter-1)||
// and this column is stored into the R matrix (at R[iter-1])
void mX_matrix_utils::arnoldi_OMP(distributed_sparse_matrix* A, std::vector<std::vector<double>>& V, std::vector<std::vector<double>>& R, int const& iter)
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





















// The linear system solver using the GMRES(k) method :
// - it solves A*x=b, giving an initial x0
// - its tolerated error is tol, and it returns the error err computed
// - maximum k iterations are done, and the effective number of iterations is returned in iters
// - if some restarts are needed, their number is returned in restarts
// - the storage contains all working variables needed (matrices & vectors) : it is shared between threads
// This function has to be called inside a parallel region
void mX_matrix_utils::gmres_OMP(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0,
	double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts,
	Storage_GMRES &storage)
{

	int start_row = A->start_row;
	int end_row = A-> end_row;

	assert( x0.size() == x.size() );
	assert( b.size() == x.size() );
	assert( start_row == 0 );
	assert( end_row-start_row+1 == x.size() );

	// ===========================================================================
	// Step 1 : Compute the initial error ||r0|| := ||b-A*x0||
	// If it's smaller than tol, GMRES alerady know a good solution, which is x0
	// Otherwise, other steps are needed
	// ===========================================================================

	// Copy x0 into x
	#pragma omp for
	for(unsigned int i = 0; i<x.size(); i++)
	{
		x[i] = x0[i];
	}
	// Compute r0 := b-A*x0 (or b-A*x now, since x0 has been copied into x)
	// and store it into storage.V[0] (i.e. the first vector of Krylov's subspace)
	sparse_gaxpy_OMP(A, x, b, storage.V[0], -1.0, 1.0);
	// Compute ||r0|| using scalar product and square root, and store it into err
	// BE WARY : err has to be shared between threads !
	scal_prod_OMP(storage.V[0], storage.V[0], err);
	#pragma omp single
	{
		err = std::sqrt(err);
	}
	// Update restarts & iters (they are supposed to be firstprivate)
	restarts = -1;
	iters = 0;


	// While the error is greater than the tolerance, we compute a new iteration
	// This loop is done the first time we come here, and re-done whenever a
	// restart is needed
	while (err > tol)
	{
		restarts++;

		// ===========================================================================
		// Step 2 : Compute v0 := r0/||r0|| and store it into storage.V[0]
		// If it's the first we come here (i.e. restarts == 0), we just need to divide
		// storage.V[0] by err (since it contains ||r0||) and store err into storage.g[0]
		// If we come here because of a restart, we have to re-compute r0 with the
		// updated value of x (i.e. which is not equal to x0)
		// ===========================================================================

		// If it's the first time we come here
		if(restarts == 0)
		{
			// Compute r0/||r0||
			#pragma omp for
			for(auto& val : storage.V[0]) // Remark : ths syntax is valid for OpenMP 5, but not before (gcc 9)
			{
				val /= err;
			}
			// Update g with its first value : err
			#pragma omp single
			{
				storage.g[0] = err;
			}
		}
		// If it's not the first time we come here, i.e. if we are doing a restart
		else
		{
			// Re-compute r0 with the new x
			sparse_gaxpy_OMP(A, x, b, storage.V[0], -1.0, 1.0);
			// Re-compute ||r0||
			scal_prod_OMP(storage.V[0], storage.V[0], err);
			#pragma omp single
			{
				err = std::sqrt(err);
				storage.g[0] = err;
			}
			// Compute r0/||r0||
			#pragma omp for
			for(auto& val : storage.V[0]) // Remark : ths syntax is valid for OpenMP 5, but not before (gcc 9)
			{
				val /= err;
			}
			// Update iters to 0 (we count the number of iterations for each restart,
			// considering the no-restart case as 0 restarts with iters iterations)
			iters = 0;
		}


		// This loop is done each time a new iteration is needed (i.e. until the error
		// err is less than the tolerance tol)
		// But if the error is greater than tol and we ran out of iters (i.e. iters >= k)
		// then a restart is needed and we leave this loop to perform the restart above
		while ((err > tol) && (iters < k))
		{
			iters++;

			// ===========================================================================
			// Step 3 : Perform an Arnoldi iteration
			// In other words, update storage.V with a new vector vi obtained with Arnoldi
			// orthonormalization with the otherq vectors of storage.V
			// Besides, storage.R is updated with the new column of the Hessenberg matrix
			// obtained with Arnoldi (we will apply some Givens rotation later to update R
			// to become the real R, and not just H)
			// ===========================================================================

			arnoldi_OMP(A, storage.V, storage.R, iters);













			// Right, Mr.GMRES has successfully updated V
				// on the side, he has also been computing the new column of the Hessenberg matrix
			// now he's going to get the new column of R using the current sines and cosines
				// and he will also add a new sine and a new cosine for future use

			for (int i = 0; i < iters-1; i++) // this loop MUST be done in serial (inter-dependencies with indexes) but the worker role can be acted by different thread at each iteration
			{
				#pragma omp single
				{
					double old_i = storage.R[iters-1][i];
					double old_i_plus_one = storage.R[iters-1][i+1];

					#pragma omp atomic write
					storage.R[iters-1][i] = storage.cosines[i]*old_i + storage.sines[i]*old_i_plus_one;
					#pragma omp atomic write
					storage.R[iters-1][i+1] = -(storage.sines[i])*old_i + storage.cosines[i]*old_i_plus_one;
				}
			}

			double r = std::sqrt(storage.R[iters-1][iters-1]*storage.R[iters-1][iters-1] + storage.R[iters-1][iters]*storage.R[iters-1][iters]);

			#pragma omp single
			{
				#pragma omp atomic write
				storage.cosines[iters-1] = storage.R[iters-1][iters-1]/r;
				#pragma omp atomic write
				storage.sines[iters-1] = storage.R[iters-1][iters]/r;

				double old_i = storage.R[iters-1][iters-1];
				double old_i_plus_one = storage.R[iters-1][iters];

				#pragma omp atomic write
				storage.R[iters-1][iters-1] = storage.cosines[iters-1]*old_i + storage.sines[iters-1]*old_i_plus_one;
			}

			// Right, the new column of R is ready
			// the only thing left to do is to update g
				// which will also tell Mr.GMRES what the new error is

			#pragma omp single
			{
				double old_g = storage.g[iters-1];

				#pragma omp atomic write
				storage.g[iters-1] = old_g*storage.cosines[iters-1];
				#pragma omp atomic write
				storage.g[iters] = -old_g*storage.sines[iters-1];
			}
			err = std::abs(storage.g[iters]);

		}

		// ok, so either Mr.GMRES has a solution
			// or he's being forced to restart
		// either way, he needs to compute x
			// now he needs to solve Ry = g
			// after which he will say x += (V without its last column)*y

		for (int i = iters-1; i >= 0; i--)
		{
			#pragma omp single
			{
				#pragma omp atomic write
				sum = 0.0;
			}

			#pragma omp for schedule(static,1) reduction(+ : sum)
			for (int j = iters-1; j > i; j--)
			{
				sum += storage.R[j][i]*storage.y[iters-1-j];
			}

			#pragma omp single
			{
				#pragma omp atomic write
				storage.y[i] = (storage.g[i] - sum)/(storage.R[i][i]);
			}
		}

		// ok, so y is ready (although it's stored upside down)

		#pragma omp for schedule(static,1)
		for (int i = start_row; i <= end_row; i++)
		{
			double local_sum = 0.0;

			for (int j = iters-1; j >= 0; j--)
			{
				local_sum += storage.y[iters-1-j]*storage.V[i-start_row][j];
			}

			x[i] += local_sum;
		}

		// the new x is also ready
			// either return it or use it as an initial guess for the next restart
	}

	// if Mr.GMRES ever reaches here, it means he's solved the problem

	if (restarts < 0)
	{
		restarts = 0;
	}

	//SCOREP_USER_FUNC_END();

}
