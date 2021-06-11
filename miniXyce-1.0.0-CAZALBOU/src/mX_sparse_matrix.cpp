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

using namespace mX_matrix_utils;

distributed_sparse_matrix::distributed_sparse_matrix()
  : start_row(0), end_row(0), local_nnz(0)
{}

void mX_matrix_utils::distributed_sparse_matrix_add_to(distributed_sparse_matrix* M, int row_idx, int col_idx, double val, int n, int p)
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
                M->local_nnz++;

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

			else
			{
				if (curr->column == col_idx)
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
		}

		if (!inserted)
		{
			distributed_sparse_matrix_entry* entry_ptr_1 = new distributed_sparse_matrix_entry();
			entry_ptr_1->column = col_idx;
			entry_ptr_1->value = val;
			entry_ptr_1->next_in_row = curr;

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

		bool send_instruction_posted = false;

		for (auto it1 = M->send_instructions.begin(); it1 != M->send_instructions.end(); it1++)
		{
			if ((*it1)->pid == pid_to_send_info)
			{
				for (auto it2 = ((*it1)->indices).begin(); it2 != ((*it1)->indices).end(); it2++)
				{
					if (*it2 == col_idx)
					{
						send_instruction_posted = true;
					}
				}

				if (!send_instruction_posted)
				{
					(*it1)->indices.push_back(col_idx);
					send_instruction_posted = true;
				}
			}
		}

		if (!send_instruction_posted)
		{
			data_transfer_instruction* dti_ptr_1 = new data_transfer_instruction();
			dti_ptr_1->pid = pid_to_send_info;
			dti_ptr_1->indices.push_back(col_idx);

			M->send_instructions.push_back(dti_ptr_1);
			send_instruction_posted = true;
		}
	}

	// that was easy!

}

void mX_matrix_utils::sparse_matrix_vector_product(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y)
{
	// compute the matrix vector product A*x and return it in y
		// assuming x contains only x[start_row] to x[end_row]

	// at the end of this function, it is guaranteed that
		// y[0] to y[end_row-start_row] will contain the correct entries of (Ax)[start_row] to (Ax)[end_row]


  // Time measured for the call of the function
  double smvprod_time_start = mX_timer();


  int start_row = A->start_row;
	int end_row = A->end_row;

#ifdef HAVE_MPI
	// ok, now's the time to follow the send instructions that each pid has been maintaining

  // each process fill a send_buffer of pairs (index, x[index]) for each process it has at least one value to send
  // index is casted as a double for the send, and re-casted as an int when received
  std::vector<double> send_buffer;

	for (auto it1 = A->send_instructions.begin(); it1 != A->send_instructions.end(); it1++)
	{
		for (auto it2 = (*it1)->indices.begin(); it2 != (*it1)->indices.end(); it2++)
		{
      send_buffer.push_back((double)*it2);
      send_buffer.push_back(x[(*it2)-start_row]);
		}
    // Tag is arbitrary choosen
    MPI_Send(send_buffer.data(), send_buffer.size(), MPI_DOUBLE, (*it1)->pid, 100, MPI_COMM_WORLD);
	}
#endif

	// and everytime a processor receives an x_vec entry
		// it stores the entry in a temporary map

	std::map<int,double> x_vec_entries;
	std::map<int,double>::iterator it3;

	for (int i = start_row; i <= end_row; i++)
	{
		// compute the mat_vec product for the i'th row

		if (y.size() > i - start_row)
		{
			y[i-start_row] = (double)(0);
		}
		else
		{
			y.push_back((double)(0));
		}

		distributed_sparse_matrix_entry* curr = A->row_headers[i-start_row];

		while(curr)
		{
			int col_idx = curr->column;

			if ((col_idx >= start_row) && (col_idx <= end_row))
			{
				// aha, this processor has the correct x_vec entry locally

				y[i-start_row] += (curr->value)*x[col_idx-start_row];
			}
#ifdef HAVE_MPI
			else
			{
				// this processor does not have the x_vec entry locally
					// but some other processor might have sent it to this guy
						// in which case the entry would have been stored in the local x_vec_entries map
						// so check if the entry is in the map

				it3 = x_vec_entries.find(col_idx);

				if (it3 != x_vec_entries.end())
				{
					y[i-start_row] += (double)(it3->second)*(curr->value);
				}

				else
				{
					// no, the entry is not in the map either
						// so this processor waits until someone sends the entry
						// and once it gets the entry, it does two things
							// puts the entry in the map for future reference
							// continues with the matrix vector multiplication

          // When the process receive a message, it adds all the values it received in the map before continuing multiplication
          // the size of the message isn't known, so we have to probe
          // the tag has to be the first index needed, but we just don't know from each process it will come from

          // When a process receive a message, it's not sure it contains the expected value (the message can come from the wrong sender)
          // so it adds all the values in the map, then checks if the expected value is there
          // if not, it prepares itself to receive another message untill the expected value is received
          MPI_Status status;
          int size_msg;

          do
          {
            MPI_Probe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status); // because the size of all messages are unknown
            MPI_Get_count(&status, MPI_DOUBLE, &size_msg);
            double* recv_buffer = (double*) malloc(size_msg*sizeof(double));
            MPI_Recv(recv_buffer, size_msg, MPI_DOUBLE, status.MPI_SOURCE, status.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

            // add the received entries to the map
  					for(int j = 0; j<size_msg; j+=2)
            {
              x_vec_entries[(int)recv_buffer[j]] = recv_buffer[j+1];
            }
            free(recv_buffer);

            // look for the expected value in the map
            it3 = x_vec_entries.find(col_idx);

          } while( it3 == x_vec_entries.end() ); // did he receive the expected value ?


          // continue the multiplication for the index that wasn't known before the reception
          y[i-start_row] += (double)(it3->second)*(curr->value);

				}
			}
#endif
			curr = curr->next_in_row;
		} // end while
	} // end for


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

void mX_matrix_utils::gmres(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0, double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts)
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
	sparse_matrix_vector_product(A,x,temp1);

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
		sparse_matrix_vector_product(A,x,temp1);

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
			sparse_matrix_vector_product(A,temp1,temp2);

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
  if (A)
  {
      // delete row_headers
      for (int j=A->start_row, cnt=0; j<=A->end_row; ++j, ++cnt)
      {
        distributed_sparse_matrix_entry* curr = (*A).row_headers[cnt], *next = 0;

        while (curr)
        {
          next = curr->next_in_row;
          delete curr; curr=0;
          curr = next;
        }
      }
      A->row_headers.resize(0);

      // delete send_instructions
      while (!A->send_instructions.empty())
      {
        data_transfer_instruction* curr = A->send_instructions.front();
        delete curr; curr=0;
        A->send_instructions.pop_front();
      }

      delete A; A=0;
  }
}

void mX_matrix_utils::print_vector(std::vector<double>& x)
{
  int numprocs = 1, procnum=0;

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
  int numprocs = 1, procnum=0;

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
