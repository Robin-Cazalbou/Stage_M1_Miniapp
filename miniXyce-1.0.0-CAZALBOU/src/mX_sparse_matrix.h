#ifndef __MX_SPARSE_MATRIX_DEFS_H__
#define __MX_SPARSE_MATRIX_DEFS_H__

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

#include <vector>
#include <map>
#include <set>

#ifdef HAVE_MPI
#include <mpi.h>
#endif

namespace mX_matrix_utils
{

	#ifdef HAVE_MPI
	struct mpi_exchanges_buffers
	{
		// This structure is intended to contain 4 buffers, used whenever a matrix-vector product occurs
		// They are allocated once in the program, assuming the size of the matrix won't change during the execution
		MPI_Request* send_requests; // dynamic array containing all the sending requests
		MPI_Request* recv_requests; // dynamic array containing all the sending requests
		std::vector<double>** array_of_send_buffers; // dynamic array with the sending buffers of each process : [adress buff_pid0, adress buff_pid1, ..., adress buff_pidn]
		std::vector<double>** array_of_recv_buffers; // dynamic array with the receiving buffers of each process : [adress buff_pid0, adress buff_pid1, ..., adress buff_pidn]

		int comm_size; // communicator size (i.e. number of processes)

		// Constructor :
		mpi_exchanges_buffers(int nb_proc) : comm_size(nb_proc)
		{
			// Allocate memory for the 4 arrays
			send_requests = new MPI_Request[nb_proc];
			recv_requests = new MPI_Request[nb_proc];
			array_of_send_buffers = new std::vector<double>*[nb_proc];
			array_of_recv_buffers = new std::vector<double>*[nb_proc];
			// And now allocate buffers (i.e. vectors) inside the two lats arrays of buffers
			for(int i = 0; i<nb_proc; i++)
			{
				array_of_send_buffers[i] = new std::vector<double>(0);
				array_of_recv_buffers[i] = new std::vector<double>(0);
			}
		}

		// Destructor :
		~mpi_exchanges_buffers()
		{
			// First, deallocate vectors inside the send and receive buffers
			for(int i = 0; i<comm_size; i++)
			{
				delete array_of_send_buffers[i];
				delete array_of_recv_buffers[i];
			}
			// Then, deallocate the four buffers
			delete[] send_requests;
			delete[] recv_requests;
			delete[] array_of_send_buffers;
			delete[] array_of_recv_buffers;
		}

	};
	#endif

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
		std::map<int, std::set<int> > send_instructions; // map of (pid, {set of indexes to send to pid})
		std::map<int, std::set<int> > recv_instructions; // map of (pid, {set of indexes to receive from pid})

		// Bounds of "diagonal block" (covering communications with calculus) :
		/*
		std::vector<distributed_sparse_matrix_entry*> left_limit;
		std::vector<distributed_sparse_matrix_entry*> right_limit;
		*/

		// Overloaded constructor :
  	distributed_sparse_matrix(int start, int end) : start_row(start), end_row(end), local_nnz(0)
		{
			row_headers.resize(end-start+1, nullptr);
		}
	};


	void distributed_sparse_matrix_add_to(distributed_sparse_matrix* M, int const row_idx, int const col_idx, double const val, int const n, int const p);

	void sparse_matrix_vector_product(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y, int nb_proc);

	double norm(std::vector<double> const& x);

	void gmres(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0, double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts, int const& nb_proc);

  void destroy_matrix(distributed_sparse_matrix* A);

  void print_vector(std::vector<double> &x);
  void print_matrix(distributed_sparse_matrix &A);
}

#endif
