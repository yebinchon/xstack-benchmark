/**
 * symm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

  static
void init_array(int ni, int nj,
    double *alpha,
    double *beta,
    double C[ni][nj],
    double A[nj][nj],
    double B[ni][nj])
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      C[i][j] = ((double) i*j) / ni;
      B[i][j] = ((double) i*j) / ni;
    }
  for (i = 0; i < nj; i++)
    for (j = 0; j < nj; j++)
      A[i][j] = ((double) i*j) / ni;
}




  static
void print_array(int ni, int nj,
    double C[ni][nj])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf ", C[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_symm(int ni, int nj,
    double alpha,
    double beta,
    double C[ni][nj],
    double A[nj][nj],
    double B[ni][nj])
{
  int i, j, k;
  double acc;

//#pragma scop
//#pragma omp parallel
{
  //#pragma omp for private (j,acc,k)
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      acc = 0;
      for (k = 0; k < j - 1; k++)
      {
        C[k][j] += alpha * A[k][i] * B[i][j];
        acc += B[k][j] * A[k][i];
      }
      C[i][j] = beta * C[i][j] + alpha * A[i][i] * B[i][j] + alpha * acc;
    }
}
//#pragma endscop

}


int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  double alpha;
  double beta;
  double (*C)[ni][nj]; C = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;
  double (*A)[nj][nj]; A = (double(*)[nj][nj])malloc((nj) * (nj) * sizeof(double));;
  double (*B)[ni][nj]; B = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;


  init_array (ni, nj, &alpha, &beta,
      *C,
      *A,
      *B);




  kernel_symm (ni, nj,
      alpha, beta,
      *C,
      *A,
      *B);





  if (dump_code == 1) print_array(ni, nj, *C);


  free((void*)C);;
  free((void*)A);;
  free((void*)B);;

  return 0;
}
