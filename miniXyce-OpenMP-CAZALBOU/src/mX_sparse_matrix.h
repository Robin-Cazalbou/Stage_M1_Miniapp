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

#include <omp.h>


namespace mX_matrix_utils
{
	struct Storage_GMRES
	{
		// Vectors
		std::vector<double> temp1;
		std::vector<double> temp2;
		std::vector<double> cosines;
		std::vector<double> sines;
		std::vector<double> g;
		std::vector<double> y;
		// Matrices
		std::vector< std::vector<double> > V;
		std::vector< std::vector<double> > R;

		// Constructor (initiate vectors' sizes)
		// No empty constructor is provided, so we are sure to use this one and provide the right values of k and n
		Storage_GMRES(int k, int n)
		{
			// Vectors initialization
			temp1 = std::vector<double>(n, 0.0);
			temp2 = std::vector<double>(n, 0.0);
			cosines = std::vector<double>(k, 0.0);
			sines = std::vector<double>(k, 0.0);
			g = std::vector<double>(k+1, 0.0);
			y = std::vector<double>(k, 0.0);

			// Matrices initialization
			V = std::vector< std::vector<double> >(n, std::vector<double>(k+1, 0.0) );

			R = std::vector< std::vector<double> >(k, std::vector<double>(0) );
			for(int i = 0; i<k; i++)
			{
				for(int j = 0; j<i+1; j++)
				{
					R[i].push_back(0.0);
				}
				R[i].push_back(0.0); // R is supposed to be upper triangular, but another coefficient is needed for each sub-vector
			}

		}
	};

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


	void distributed_sparse_matrix_add_to(distributed_sparse_matrix* M, int const row_idx, int const col_idx, double const val, int const n, int const p);

	void sparse_matrix_vector_product(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y, int nb_proc);

	double norm(std::vector<double> const& x);

	void gmres(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0, double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts, int const& nb_proc);

  void destroy_matrix(distributed_sparse_matrix* A);

  void print_vector(std::vector<double> &x);
  void print_matrix(distributed_sparse_matrix &A);




	void mv_prod_div_add_omp(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y, double const& t_step, std::vector<double> const& b);
	void mv_prod_div_diff_omp(distributed_sparse_matrix* A, std::vector<double> const& x, std::vector<double> &y, double const& t_step, std::vector<double> const& b);
	void norm_omp(std::vector<double> const& x, double &res);
	void gmres_omp(distributed_sparse_matrix* A, std::vector<double> const& b, std::vector<double> const& x0, double const& tol, double &err, int const& k, std::vector<double> &x, int &iters, int &restarts, Storage_GMRES &storage, double &sum);
}

#endif
