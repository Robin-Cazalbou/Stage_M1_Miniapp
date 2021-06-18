CC=mpicxx
COPT= -O0 -ggdb

all : test_smvprod.exe

mX_sparse_matrix.o : ../src/mX_sparse_matrix.cpp ../src/mX_sparse_matrix.h
	$(CC) $(COPT) $< -c -I../src/ -DHAVE_MPI

test_smvprod.exe : test_smvprod.cpp mX_sparse_matrix.o
	$(CC) $(COPT) $^ -o $@ -I../src/ -DHAVE_MPI

clean :
	rm test_smvprod.exe *.o
