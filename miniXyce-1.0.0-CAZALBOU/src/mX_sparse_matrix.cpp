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

#include "mX_timer.h"
#include "coroutines.h"
#include <cassert>

using namespace mX_matrix_utils;

void mX_matrix_utils::distributed_sparse_matrix_add_to(distributed_sparse_matrix* M, int const row_idx, int const col_idx, double const val, int const n, int const p)
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


    // The receive instructions have to be filled too :
    // either we have the vector's coordinate locally or stored in missing_coordinates_and_pid or not yet
    if ( (col_idx < M->start_row) || (col_idx > M->end_row)) // check if the vector's corresponding entry is local
    {
			// Dichotomic research : which pid contains the missing value
			int pid_to_recv_info;
			bool pid_found = false;

			int start_pid = 0;
			int end_pid = p-1;
			int mid_pid = (start_pid + end_pid)/2;

			int mid_start_row = (n/p)*(mid_pid) + ((mid_pid < n%p) ? mid_pid : n%p);
			int mid_end_row = mid_start_row + (n/p) - 1 + ((mid_pid < n%p) ? 1 : 0);

			while (!pid_found)
			{
				if (col_idx < mid_start_row)
				{
					end_pid = mid_pid - 1;
					mid_pid = (start_pid + end_pid)/2;
				}
				else if (col_idx > mid_end_row)
				{
					start_pid = mid_pid + 1;
					mid_pid = (start_pid + end_pid)/2;
				}
				else
				{
					pid_to_recv_info = mid_pid;
					pid_found = true;
				}

				mid_start_row = (n/p)*(mid_pid) + ((mid_pid < n%p) ? mid_pid : n%p);
				mid_end_row = mid_start_row + (n/p) - 1 + ((mid_pid < n%p) ? 1 : 0);
			}

			// Now we know which process will send this value
			// so we have to check if we already stored its index in the "recv_instructions" map
			// we can perform it just picking the pid's entry in the map and looking for the requested index in the associated set
			if( (M->recv_instructions).find(pid_to_recv_info) == (M->recv_instructions).end() ) // maybe this pid isn't in the map yet
			{
				// Then add the pid with a associated singleton containing the index
				(M->recv_instructions).insert({pid_to_recv_info, {col_idx}});
			}
			else if( (M->recv_instructions[pid_to_recv_info]).find(col_idx) == (M->recv_instructions[pid_to_recv_info]).end() ) // in the case the requested index wasn't already stored
			{
				// Then add this missing index in this set (we don't need to search the pid : we already have it !)
				M->recv_instructions[pid_to_recv_info].insert(col_idx);
			}

    }

		return;
	}

	// but wait, if you have inserted a new non-zero in the sparse matrix
		// it might require some additional book-keeping of communication info

	if ((col_idx >= M->start_row) && (col_idx <= M->end_row))
	{
		// aha, here's the processor who controls the col_idx
		// this fellow needs to send the value at col_idx to the fellow who controls the row_idx
		// everytime a matrix vector product is needed
		// so find out who has the row_idx
		// and if needed, include an instruction in this fellow's list of send instructions

		int pid_to_send_info;
		bool pid_found = false;

		int start_pid = 0;
		int end_pid = p-1;
		int mid_pid = (start_pid + end_pid)/2;

		int mid_start_row = (n/p)*(mid_pid) + ((mid_pid < n%p) ? mid_pid : n%p);
		int mid_end_row = mid_start_row + (n/p) - 1 + ((mid_pid < n%p) ? 1 : 0);

		while (!pid_found)
		{
			if (row_idx < mid_start_row)
			{
				end_pid = mid_pid - 1;
				mid_pid = (start_pid + end_pid)/2;
			}
			else
			{
				if (row_idx > mid_end_row)
				{
					start_pid = mid_pid + 1;
					mid_pid = (start_pid + end_pid)/2;
				}
				else
				{
					pid_to_send_info = mid_pid;
					pid_found = true;
				}
			}

			mid_start_row = (n/p)*(mid_pid) + ((mid_pid < n%p) ? mid_pid : n%p);
			mid_end_row = mid_start_row + (n/p) - 1 + ((mid_pid < n%p) ? 1 : 0);
		}

		// Now we know to which pid we have to send the value
		// so, as in the "sending part" previously, we do some verification before adding the value
		if( (M->send_instructions).find(pid_to_send_info) == (M->send_instructions).end() ) // maybe this pid isn't in the map yet
		{
			// Then add the pid with a associated singleton containing the index
			(M->send_instructions).insert({pid_to_send_info, {col_idx}});
		}
		else if( (M->send_instructions[pid_to_send_info]).find(col_idx) == (M->send_instructions[pid_to_send_info]).end() ) // in the case the requested index wasn't already stored
		{
			// Then add this missing index in this set (we don't need to search the pid : we already have it !)
			M->send_instructions[pid_to_send_info].insert(col_idx);
		}

	}

	// that was easy!

}


static double helper_matrix_vector_product(std::vector<double>** array_to_search, int &cpt_i, int &cpt_j)
{
	while(array_to_search[cpt_i]->size() <= cpt_j)
	{
		cpt_j = 0;
		cpt_i++;
	}

	cpt_j++;
	return (*(array_to_search[cpt_i]))[cpt_j-1];
}

void mX_matrix_utils::sparse_matrix_vector_product(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y, int nb_proc)
{
	// compute the matrix vector product A*x and return it in y
		// assuming x contains only x[start_row] to x[end_row]

	// at the end of this function, it is guaranteed that
		// y[0] to y[end_row-start_row] will contain the correct entries of (Ax)[start_row] to (Ax)[end_row]


  // Time measured for the call of the function
  double smvprod_time_start = mX_timer();

	int start_row = A->start_row;
	int end_row = A->end_row;

	// Assert y is an empty vector
	assert( y.size() == 0 );
	// Assert the number of rows in A is equal to the size of x :
	assert( end_row-start_row+1 == x.size() );


#ifdef HAVE_MPI
	// ok, now's the time to follow the send instructions that each pid has been maintaining
	// each process fill a send_buffer with all expected values, for each other process it had in its send_instructions
	// the receiver knows the indexes of all those values, so the message doesn't have to contain it

	// Structure for MPI exchanges and buffers :
	mpi_exchanges_buffers mpi_exchg_buff(nb_proc);

  // Building all sending buffers :
  for(auto it_pid = A->send_instructions.begin(); it_pid != A->send_instructions.end(); it_pid++)
  {
		for(auto it_value = (it_pid->second).begin(); it_value != (it_pid->second).end(); it_value++)
		{
			( (mpi_exchg_buff.array_of_send_buffers)[it_pid->first])->push_back(*it_value);
		}
		// Send this buffer
		MPI_Isend((mpi_exchg_buff.array_of_send_buffers[it_pid->first])->data(), (mpi_exchg_buff.array_of_send_buffers[it_pid->first])->size(), MPI_DOUBLE, it_pid->first, 100, MPI_COMM_WORLD, &(mpi_exchg_buff.send_requests[it_pid->first]) );
  }

	// Building all receiving buffers :
	for(auto it_pid = A->recv_instructions.begin(); it_pid != A->recv_instructions.end(); it_pid++)
  {
		for(auto it_value = (it_pid->second).begin(); it_value != (it_pid->second).end(); it_value++)
		{
			(mpi_exchg_buff.array_of_recv_buffers[it_pid->first])->push_back(*it_value);
		}
		// Receive this buffer
		MPI_Irecv((mpi_exchg_buff.array_of_recv_buffers[it_pid->first])->data(), (mpi_exchg_buff.array_of_recv_buffers[it_pid->first])->size(), MPI_DOUBLE, it_pid->first, 100, MPI_COMM_WORLD, &(mpi_exchg_buff.recv_requests[it_pid->first]) );
  }

#endif


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


#ifdef HAVE_MPI
	// Intermediate waiting phase : we have to wait all the receptions before next computation phase
	for(auto it_pids_to_recv = (A->recv_instructions).begin(); it_pids_to_recv != (A->recv_instructions).end(); it_pids_to_recv++)
	{
		MPI_Wait( &(mpi_exchg_buff.recv_requests[it_pids_to_recv->first]), MPI_STATUS_IGNORE);
	}

	// Finishing the remaining computations (i.e. out of the diagonal block)
	double x_val_to_multiply;
	int cpt_i, cpt_j;
	for(int i = start_row; i <= end_row; i++)
	{
		cpt_i = 0, cpt_j = 0;
		distributed_sparse_matrix_entry* curr = A->row_headers[i-start_row];
		while(curr)
		{
			int col_idx = curr->column;
			// Out of the diagonal block :
			if( (col_idx < start_row) || (col_idx > end_row) )
			{
				// Reach the value of x we now have to multiply :
				x_val_to_multiply = helper_matrix_vector_product(mpi_exchg_buff.array_of_recv_buffers, cpt_i, cpt_j);
				// Do the multiplication
				y[i-start_row] += (curr->value)*x_val_to_multiply ;
			}
			// Continue with the next entry in the matrix row :
			curr = curr->next_in_row;
		}
	}

	// Final waiting phase : we can't leave this function scope without asserting all the messages have been sent
	// we yet checked only for the receiving part
	for(auto it_pids_to_send = (A->send_instructions).begin(); it_pids_to_send != (A->send_instructions).end(); it_pids_to_send++)
	{
		MPI_Wait( &(mpi_exchg_buff.send_requests[it_pids_to_send->first]), MPI_STATUS_IGNORE);
	}
#endif

  // End of time measuring : time spent in the function is added to the previous time spent using the coroutine_smvprod
  double smvprod_time_end = mX_timer();
  coroutine_smvprod(smvprod_time_end - smvprod_time_start);

}

double mX_matrix_utils::norm(std::vector<double> const& x)
{
	// at last, a function that's relatively simple to implement in parallel


  double norm_time_start = mX_timer();


	double global_norm;
	double local_norm = 0.0;

	for (int i = 0; i < x.size(); i++)
	{
		local_norm += x[i]*x[i];
	}
#ifdef HAVE_MPI
	MPI_Allreduce(&local_norm,&global_norm,1,MPI_DOUBLE,MPI_SUM,MPI_COMM_WORLD);
#else
        global_norm = local_norm;
#endif


  double norm_time_end = mX_timer();
  coroutine_norm(norm_time_end - norm_time_start);


	return std::sqrt(global_norm);
}

void mX_matrix_utils::gmres(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0, double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts, int const& nb_proc)
{
	// here's the star of the show, the guest of honor, none other than Mr.GMRES

	// first Mr.GMRES will compute the error in the initial guess
		// if it's already smaller than tol, he calls it a day
		// otherwise he settles down to work in mysterious ways his wonders to perform


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
#ifdef HAVE_MPI
				MPI_Allreduce(&local_dot,&global_dot,1,MPI_DOUBLE,MPI_SUM,MPI_COMM_WORLD);
#else
                                global_dot = local_dot;
#endif
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

#ifdef HAVE_MPI
  /* Find this processor number */
  MPI_Comm_rank(MPI_COMM_WORLD, &procnum);

  /* Find the number of processors */
  MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
#endif

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
#ifdef HAVE_MPI
    MPI_Barrier(MPI_COMM_WORLD);
#endif
  }
}

void mX_matrix_utils::print_matrix(distributed_sparse_matrix &A)
{
  int numprocs = 1, procnum = 0;

#ifdef HAVE_MPI
  /* Find this processor number */
  MPI_Comm_rank(MPI_COMM_WORLD, &procnum);

  /* Find the number of processors */
  MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
#endif

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
#ifdef HAVE_MPI
    MPI_Barrier(MPI_COMM_WORLD);
#endif
  }
}
