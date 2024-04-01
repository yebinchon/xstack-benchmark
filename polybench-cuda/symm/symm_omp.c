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




static void kernel(int m, int n,
                   double alpha, double beta,
                   double C[m][n],
                   double A[n][n],
                   double B[m][n],
                   double tmp[m][n]) {
  #pragma omp parallel default(none) firstprivate(m, n, alpha, beta, C, A, B, tmp)
  {
    #pragma omp for collapse(2) schedule(static)
    for (int i = 0; i < m; i++)
      for (int j = 0; j < n; j++) {
        tmp[i][j] = 0;
        for (int k = 0; k < i; k++)
          tmp[i][j] += B[k][j] * A[i][k];
      }

    #pragma omp for collapse(2) schedule(static)
    for (int i = 0; i < m; i++)
      for (int j = 0; j < n; j++)
        C[i][j] = beta * C[i][j] + alpha * B[i][j] * A[i][i] + alpha * tmp[i][j];

    #pragma omp for collapse(2)
    for (int j = 0; j < n; j++)
      for (int k = 0; k < m - 1; k++)
        for (int i = k + 1; i < m; i++)
          C[k][j] += alpha * B[i][j] * A[i][k];
  }
}



int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  double alpha;
  double beta;
  double (*C)[ni][nj]; C = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;
  double (*A)[ni][ni]; A = (double(*)[ni][ni])malloc((ni) * (ni) * sizeof(double));;
  double (*B)[ni][nj]; B = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;
  double (*tmp)[ni][nj]; tmp = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;


  init_array (ni, nj, &alpha, &beta,
      *C,
      *A,
      *B);




  kernel (ni, nj,
      alpha, beta,
      *C,
      *A,
      *B, *tmp);





  if (dump_code == 1) print_array(ni, nj, *C);


  free((void*)C);;
  free((void*)A);;
  free((void*)B);;

  return 0;
}
