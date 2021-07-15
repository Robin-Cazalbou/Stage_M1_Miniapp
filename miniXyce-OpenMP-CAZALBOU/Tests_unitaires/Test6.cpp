
#include <iostream>
#include <vector>
#include <cmath>
#include <cassert>
#include <omp.h>


void solve_Ry_g(std::vector<std::vector<double>> const& R, std::vector<double> const& g, std::vector<double>& y)
{
  // Some asserts about sizes
  assert( R.size() == g.size()-1 );
  assert( R.size() == y.size() );
  for(unsigned int i = 0; i<R.size(); i++)
  {
    assert( R[i].size() == i+2 );
  }

  unsigned int size = y.size();

  // Actual system resolution
  // As a back substitution, we perform our loop from the last value to the first one
  for(int i = size-1; i>=0; i--)
  {
    y[i] = g[i];
    // For a given line of y, we substract the products (matrix value)*(y associated)
    // to the right hand side, then divide all by the diagonal value in the matrix
    for(int j = size-1; j>i; j--)
    {
      y[i] -= R[j][i]*y[j];
    }
    y[i] /= R[i][i];
  }

}



int main()
{
  std::vector<std::vector<double>> A = { {1, 0}, {5, -35, 0}, {9, -76, 1.0/35.0, 0} };
  std::vector<double> g = {180, -1579, -11.0/35.0, 0};
  std::vector<double> y = {0, 0, 0};

  #pragma omp parallel shared(A, g, y) num_threads(4)
  {
    #pragma omp single
    {
      solve_Ry_g(A, g, y);
    }
  }

  for(auto& val : y)
  {
    std::cout << val << " ";
  }
  std::cout << std::endl;
  std::cout << "Attendu : " << -66 << " " << 69 << " " << -11 << std::endl;

  return 0;
}
