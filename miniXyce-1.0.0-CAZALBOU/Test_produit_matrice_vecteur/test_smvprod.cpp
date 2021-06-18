
#include <iostream>
#include <mpi.h>
#include <cassert>
#include "mX_sparse_matrix.h"

using namespace mX_matrix_utils;

int main(int argc, char **argv)
{
  int nb_proc, rank;
  int start_row, end_row;
  int n = 4;

  MPI_Init(&argc, &argv);

  MPI_Comm_size(MPI_COMM_WORLD, &nb_proc);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  // Le nombre de processus doit être plus petit que le nombre de lignes de la matrice
  assert( nb_proc <= n );

  // Création de la matrice de test avec son pointeur A :
  start_row = (n/nb_proc)*(rank) + ((rank < n%nb_proc) ? rank : n%nb_proc);
	end_row = start_row + (n/nb_proc) - 1 + ((rank < n%nb_proc) ? 1 : 0);

  distributed_sparse_matrix* A = new distributed_sparse_matrix(start_row, end_row);
  distributed_sparse_matrix_add_to(A, 0, 0, 1.5, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 0, 1, -1, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 0, 2, -0.5, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 0, 3, -1, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 1, 0, -1, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 1, 1, 1.2, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 2, 0, -0.5, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 2, 1, 0.75, n, nb_proc);
  distributed_sparse_matrix_add_to(A, 3, 0, 1, n, nb_proc);

  //print_matrix(*A);
  //MPI_Barrier(MPI_COMM_WORLD);


  // Création du vecteur x local :
  std::vector<double> x(end_row-start_row+1);
  for(int i = 0; i<x.size(); i++)
  {
    x[i] = 0;
  }
  //print_vector(x);

  // Multiplication matrice-vecteur :
  std::vector<double> y;
  sparse_matrix_vector_product(A, x, y, nb_proc);
  print_vector(y);



  // Nettoyage :
  delete A;
  A = nullptr;

  MPI_Finalize();

  return 0;
}
