/**
 * syrk.c: This file is part of the PolyBench/C 3.2 test suite.
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
    double C[ni][ni],
    double A[ni][nj])
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      A[i][j] = ((double) i*j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      C[i][j] = ((double) i*j) / ni;
}




  static
void print_array(int ni,
    double C[ni][ni])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++) {
      fprintf (stderr, "%0.2lf ", C[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_syrk(int ni, int nj,
    double alpha,
    double beta,
    double C[ni][ni],
    double A[ni][nj])
{
  int i, j, k;

#pragma scop
//#pragma omp parallel
{
  //#pragma omp for private (j)
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      C[i][j] *= beta;
  //#pragma omp for private (j,k)
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      for (k = 0; k < nj; k++)
        C[i][j] += alpha * A[i][k] * A[j][k];
}
#pragma endscop

}


int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  __builtin_assume(nj>0);
  __builtin_assume(ni>0);
  __builtin_assume(ni<2147483646);
  __builtin_assume(nj<2147483646);

  double alpha;
  double beta;
  double (*C)[ni][ni]; C = (double(*)[ni][ni])malloc((ni) * (ni) * sizeof(double));;
  double (*A)[ni][nj]; A = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;



  init_array (ni, nj, &alpha, &beta, *C, *A);




  kernel_syrk (ni, nj, alpha, beta, *C, *A);





  if (dump_code == 1) print_array(ni, *C);


  free((void*)C);;
  free((void*)A);;

  return 0;
}
