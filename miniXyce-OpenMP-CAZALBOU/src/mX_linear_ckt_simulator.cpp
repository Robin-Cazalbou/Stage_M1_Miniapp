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

#include <string>
#include <sstream>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <vector>
#include "mX_parser.h"
#include "mX_source.h"
#include "mX_sparse_matrix.h"
#include "mX_linear_DAE.h"
#include "mX_parms.h"
#include "mX_timer.h"
#include "YAML_Element.hpp"
#include "YAML_Doc.hpp"


#include <omp.h>

double sum = 0.0;


// Débug :
#include <fenv.h>
#include <unistd.h>


using namespace mX_parse_utils;
using namespace mX_source_utils;
using namespace mX_linear_DAE_utils;
using namespace mX_parms_utils;

int main(int argc, char* argv[])
{
	// Débug :
	//feenableexcept(FE_INVALID | FE_OVERFLOW);

	// this is of course, the actual transient simulator
	int p=1, pid=0, n=0;

	double sim_start = mX_timer();

  // initialize YAML doc
  YAML_Doc doc("miniXyce","1.0");

	// initialize the simulation parameters
	std::string ckt_netlist_filename;
	double t_start, t_step, t_stop, tol, res;
	int k, iters, restarts;
	std::vector<double> x;
	bool init_cond_specified;

	// ====== Parameters parsing ==========
  double tstart = mX_timer();
	get_parms(argc,argv,ckt_netlist_filename,t_start,t_step,t_stop,tol,k,x,init_cond_specified,p,pid);
  double tend = mX_timer() - tstart;
  doc.add("Parameter_parsing_time",tend);
	// ====================================

	// ====== Build the DAE from the circuit netlist ======
  tstart = mX_timer();
	int num_internal_nodes, num_voltage_sources, num_inductors;
  int num_current_sources=0, num_resistors=0, num_capacitors=0;
	mX_linear_DAE* dae = parse_netlist(ckt_netlist_filename,p,pid,n,num_internal_nodes, num_voltage_sources, num_current_sources, num_resistors, num_capacitors, num_inductors);
  tend = mX_timer() - tstart;
  doc.add("Netlist_parsing_time",tend);
	// ====================================================

  // ====== Document circuit and matrix attributes ======
  doc.add("Netlist_file",ckt_netlist_filename.c_str());
  int total_devices = num_voltage_sources + num_current_sources + num_resistors + num_capacitors + num_inductors;
  doc.add("Circuit_attributes","");
  doc.get("Circuit_attributes")->add("Number_of_devices",total_devices);
	if (num_resistors > 0)
	{
		doc.get("Circuit_attributes")->add("Resistors_(R)",num_resistors);
	}
	if (num_inductors > 0)
	{
		doc.get("Circuit_attributes")->add("Inductors_(L)",num_inductors);
	}
	if (num_capacitors > 0)
	{
		doc.get("Circuit_attributes")->add("Capacitors_(C)",num_capacitors);
	}
	if (num_voltage_sources > 0)
	{
		doc.get("Circuit_attributes")->add("Voltage_sources_(V)",num_voltage_sources);
	}
	if (num_current_sources > 0)
	{
		doc.get("Circuit_attributes")->add("Current_sources_(I)",num_current_sources);
	}

	int num_my_rows = dae->A->end_row - dae->A->start_row + 1;
	int num_my_nnz = dae->A->local_nnz, sum_nnz = dae->A->local_nnz;
	int min_nnz = num_my_nnz, max_nnz = num_my_nnz;
	int min_rows = num_my_rows, max_rows = num_my_rows, sum_rows = num_my_rows;

	doc.add("Matrix_attributes","");
	doc.get("Matrix_attributes")->add("Global_rows",sum_rows);
	doc.get("Matrix_attributes")->add("Rows_per_proc_MIN",min_rows);
	doc.get("Matrix_attributes")->add("Rows_per_proc_MAX",max_rows);
	doc.get("Matrix_attributes")->add("Rows_per_proc_AVG",(double)sum_rows/p);
	doc.get("Matrix_attributes")->add("Global_NNZ",sum_nnz);
	doc.get("Matrix_attributes")->add("NNZ_per_proc_MIN",min_nnz);
	doc.get("Matrix_attributes")->add("NNZ_per_proc_MAX",max_nnz);
	doc.get("Matrix_attributes")->add("NNZ_per_proc_AVG",(double)sum_nnz/p);
	// ===========================================================================



	// ====== Compute the initial condition if not specified by user ======
	tstart = mX_timer();
	int start_row = dae->A->start_row;
	int end_row = dae->A->end_row;

	if (!init_cond_specified)
	{
		std::vector<double> init_cond_guess;

		for (int i = 0; i<num_my_rows; i++)
		{
			init_cond_guess.push_back((double)(0));
		}

		std::vector<double> init_RHS = evaluate_b(t_start,dae);

		gmres(dae->A,init_RHS,init_cond_guess,tol,res,k,x,iters,restarts, p);

		doc.add("DCOP Calculation","");
		doc.get("DCOP Calculation")->add("Init_cond_specified", false);
		doc.get("DCOP Calculation")->add("GMRES_tolerance",tol);
		doc.get("DCOP Calculation")->add("GMRES_subspace_dim",k);
		doc.get("DCOP Calculation")->add("GMRES_iterations",iters);
		doc.get("DCOP Calculation")->add("GMRES_restarts",restarts);
		doc.get("DCOP Calculation")->add("GMRES_native_residual",res);
	}
	else
	{
		doc.add("DCOP Calculation","");
		doc.get("DCOP Calculation")->add("Init_cond_specified", true);
	}
	tend = mX_timer() - tstart;
	doc.get("DCOP Calculation")->add("DCOP_calculation_time",tend);
	// ====================================================================


	// ====== Write the headers and computed initial condition to file ======
  tstart = mX_timer();
	int dot_position = ckt_netlist_filename.find_first_of('.');
	std::string out_filename = ckt_netlist_filename.substr(0,dot_position) + "_tran_results.prn";
	std::ofstream* outfile=0;

	if (pid == 0)
	{
		outfile = new std::ofstream(out_filename.data(), std::ios::out);
		*outfile << std::setw(18) << "TIME";

		for (int i = 0; i < sum_rows; i++)
		{
			std::stringstream ss2;

			if (i < num_internal_nodes)
			{
				ss2 << "V" << i+1;
			}
			else
			{
				ss2 << "I" << i+1-num_internal_nodes;
			}

			*outfile << std::setw(18) << ss2.str();
		}

		*outfile << std::setw(20) << "num_GMRES_iters" << std::setw(20) << "num_GMRES_restarts" << std::endl;
		outfile->precision(8);
		*outfile << std::scientific << std::setw(18) << t_start;

		for (int i = 0; i < sum_rows; i++)
		{
			*outfile << std::setw(18) << x[i];
		}

		*outfile << std::fixed << std::setw(20)  << iters << std::setw(20) << restarts << std::endl;
	}

  double io_tend = mX_timer() - tstart;
	// ======================================================================



	// ====== From now you won't be needing any more Ax = b solves
		// but you will be needing many (A + B/t_step)x = b solves
		// so change A to (A + B/t_step) right now
			// so you won't have to compute it at each time step =====================

  tstart = mX_timer();

	int row_idx = start_row - 1;

	for (auto it1 = dae->B->row_headers.begin(); it1 != dae->B->row_headers.end(); it1++)
	{
		row_idx++;
		distributed_sparse_matrix_entry* curr = *it1;

		while (curr)
		{
			int col_idx = curr->column;
			double value = (curr->value)/t_step;

			distributed_sparse_matrix_add_to(dae->A,row_idx,col_idx,value);

			curr = curr->next_in_row;
		}
	}

  double matrix_setup_tend = mX_timer() - tstart;
	// ===========================================================================


	// ====== This is where the actual transient simulation starts ======
  tstart = mX_timer();
	double t = t_start + t_step;
  double total_gmres_res = 0.0;
  int total_gmres_iters = 0;
  int trans_steps = 0;
	std::vector<double> RHS(n, 0.0);
	std::vector<double> b(n, 0.0);
	Storage_GMRES storage(k, n);


	#pragma omp parallel shared(total_gmres_res,total_gmres_iters,trans_steps,b,dae,x,RHS,t_step,tol,k,outfile,io_tend,storage,res) firstprivate(t,t_stop,iters,restarts)
	{

		while (t < t_stop)
		{
			#pragma omp single nowait
			{
				trans_steps++;
			}

			// new time point t => new value for b(t)
			evaluate_b_omp(t, dae, b);

			// build the linear system Ax = b that needs to be solved at this time point
				// Backward Euler is used at every iteration
			sparse_gaxpy_OMP(dae->B, x, b, RHS, 1.0/t_step, 1.0);

			// now solve the linear system just built using GMRES(k)
			gmres_OMP(dae->A,RHS,x,tol,res,k,x,iters,restarts,storage);

			#pragma omp single nowait
			{
				total_gmres_iters += iters;
		    total_gmres_res += res;
			}

			#pragma omp single nowait
			{
				// write the results to file
			  double io_tstart = mX_timer();

				outfile->precision(8);
				*outfile << std::scientific << std::setw(18) << t;

				for (int i = 0; i < sum_rows; i++)
				{
					*outfile << std::setw(18) << x[i];
				}

				*outfile << std::fixed << std::setw(20)  << iters << std::setw(20) << restarts << std::endl;

		    io_tend += (mX_timer() - io_tstart);
			}

			// increment t
			t += t_step;

		}

	}


	// Hurray, the transient simulation is done!
	outfile->close();
	delete outfile;

	// Document transient simulation performance

	tend = mX_timer();
	double sim_end = tend - sim_start;
	doc.add("Transient Calculation","");
	doc.get("Transient Calculation")->add("Number_of_time_steps", trans_steps);
	doc.get("Transient Calculation")->add("Time_start", t_start);
	doc.get("Transient Calculation")->add("Time_end", t_stop);
	doc.get("Transient Calculation")->add("Time_step", t_step);
	doc.get("Transient Calculation")->add("GMRES_tolerance",tol);
	doc.get("Transient Calculation")->add("GMRES_subspace_dim",k);
	doc.get("Transient Calculation")->add("GMRES_average_iters",total_gmres_iters/trans_steps);
	doc.get("Transient Calculation")->add("GMRES_average_res",total_gmres_res/trans_steps);
	doc.get("Transient Calculation")->add("Matrix_setup_time",matrix_setup_tend);
	doc.get("Transient Calculation")->add("Transient_calculation_time",tend-tstart);
	doc.add("I/O File Time",io_tend);
	doc.add("Total Simulation Time",sim_end);

	// Only PE 0 needs to compute and report timing results
	std::string yaml = doc.generateYAML();
	std::cout << yaml;


	// Print coroutines' values on standard output (cout)
	/*
	std::cout << std::endl << "P" << i << " :" << std::endl;
	std::cout << "I/O : " << io_tend << " i.e. " << 100.0*io_tend/sim_end << " % total process time" << std::endl;
	std::cout << "Coroutine smvprod : time_spent = " << coroutine_smvprod(-1) << " i.e. " << 100.0*coroutine_smvprod(-1)/sim_end << "% total process time" << std::endl;
	std::cout << "Coroutine smvprod out of gmres : time_spent = " << coroutine_smvprod_alone(-1) << " i.e. " << 100.0*coroutine_smvprod_alone(-1)/sim_end << "% total process time" << std::endl;
	std::cout << "Coroutine gmres : time_spent = " << coroutine_gmres(-1) << " i.e. " << 100.0*coroutine_gmres(-1)/sim_end << "% total process time" << std::endl;
	std::cout << "Coroutine norm : time_spent = " << coroutine_norm(-1) << " i.e. " << 100.0*coroutine_norm(-1)/sim_end << "% total process time" << std::endl;
	std::cout << "Total time = " << sim_end << std::endl;
	*/


	// Clean up
	mX_linear_DAE_utils::destroy( dae );

	return 0;
}
