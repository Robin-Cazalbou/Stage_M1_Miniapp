
#include <iostream>
#include <vector>
#include <cassert>
#include <omp.h>


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


int main()
{
  std::vector<double> x = {-4.1, 42, 71.001};
  std::vector<double> b = {5.4, -101.17, 31};
  std::vector<double> y = x;
  double alpha = 1/3.14;
  double beta = -6.66;

  #pragma omp parallel num_threads(4)
  {
    std::cout << "Coucou de T" << omp_get_thread_num() << std::endl;
    saxpy_OMP(x, b, y, alpha, beta);
  }

  for (auto& val : y)
  {
    std::cout << val << " ";
  }
  std::cout << std::endl << "Attendu : " << -37.26973248407644 << " " << 687.167996178344 << " " << -183.84821656050957 << std::endl;

  return 0;
}
