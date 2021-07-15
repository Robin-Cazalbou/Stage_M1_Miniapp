
#include "../src/mX_sparse_matrix.h"

#include <iostream>
#include <vector>
#include <omp.h>

#include <fenv.h>

using namespace mX_matrix_utils;

int main()
{
  feenableexcept(FE_INVALID | FE_OVERFLOW);

  int n = 3;
  double tol = 1e-6, err = 0.0;
  int k = 3, iters = 0, restarts = 0;
  Storage_GMRES storage(k, n);

  distributed_sparse_matrix A(0, 2);

  distributed_sparse_matrix_add_to(&A, 0, 0, 1);
  distributed_sparse_matrix_add_to(&A, 0, 1, 5);
  distributed_sparse_matrix_add_to(&A, 0, 2, 9);
  distributed_sparse_matrix_add_to(&A, 1, 0, 9);
  distributed_sparse_matrix_add_to(&A, 1, 1, 10);
  distributed_sparse_matrix_add_to(&A, 1, 2, 5);
  distributed_sparse_matrix_add_to(&A, 2, 0, 10);
  distributed_sparse_matrix_add_to(&A, 2, 1, 9);
  distributed_sparse_matrix_add_to(&A, 2, 2, 1);


  std::vector<double> b = {180, 41, -50};
  std::vector<double> x0 = {0, 0, 0};
  std::vector<double> x(3);

  #pragma omp parallel shared(A,b,x0,tol,err,k,x,storage) firstprivate(iters,restarts) num_threads(4)
  {
    gmres_OMP(&A, b, x0, tol, err, k, x, iters, restarts, storage);
  }

  for(auto& val : x)
  {
    std::cout << val << " ";
  }
  std::cout << std::endl << "Attendus : -66, 69, -11" << std::endl;
  std::cout << "err = " << err << std::endl;


  return 0;
}
