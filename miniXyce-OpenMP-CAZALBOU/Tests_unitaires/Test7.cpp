
#include <iostream>
#include <vector>
#include <cmath>
#include <cassert>
#include <omp.h>


void update_x_OMP(std::vector<double>& x, std::vector<std::vector<double>> const& V, std::vector<double> const& y, int const& iter)
{
	// Some asserts
	for(unsigned int i = 0; i<V.size(); i++)
	{
		assert( x.size() == V[i].size() );
	}
	assert( y.size() == V.size()-1 );

	// Same remark as in the function solve_Ry_g : y has more memory space than needed
	unsigned int true_size_y = iter;

	// Compute the actual update using a GAXPY
	// The work is distributed among threads, distributing
	// according to the lines (because they are strongly probably
	// more than columns)
	#pragma omp for
	for(unsigned int i = 0; i<x.size(); i++)
	{
		for(unsigned int j = 0; j<true_size_y; j++)
		{
			x[i] += V[j][i]*y[j];
		}
	}

}



int main()
{
  std::vector<std::vector<double>> Q = { {1.24, -5.3, -0.1, 6.6}, {4, 56, 12.12, -7.71}, {-6.1, 0, 4.34, 11.1} };
  std::vector<double> x = {0, 3, 5.34, -35.35};
  std::vector<double> y = {-6.1, 3.2};
  int iters = 2;

  #pragma omp parallel shared(Q, x, y) num_threads(4)
  {
    update_x_OMP(x, Q, y, iters);
  }

  for(auto& val : x)
  {
    std::cout << val << " ";
  }
  std::cout << std::endl;


  return 0;
}
