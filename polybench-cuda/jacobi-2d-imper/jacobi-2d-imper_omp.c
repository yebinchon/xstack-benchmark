/**
 * jacobi-2d-imper.c: This file is part of the PolyBench/C 3.2 test suite.
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
void init_array (int n,
    double A[n][n],
    double B[n][n])
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
    {
      A[i][j] = ((double) i*(j+2) + 2) / n;
      B[i][j] = ((double) i*(j+3) + 3) / n;
    }
}




  static
void print_array(int n,
    double A[n][n])

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf(stderr, "%0.2lf ", A[i][j]);
      if ((i * n + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}




static void kernel_jacobi_2d_imper(int tsteps, int n,
                   double A[n][n], double B[n][n]) {
  #pragma omp parallel default(none) firstprivate(tsteps, n, A, B)
  {
  for (int t = 0; t < tsteps; t++) {
    #pragma omp for collapse(2) schedule(static)
    for (int i = 1; i < n - 1; i++)
      for (int j = 1; j < n - 1; j++)
        B[i][j] = (A[i][j] + A[i][j - 1] + A[i][1 + j] + A[1 + i][j] + A[i - 1][j]) / 5;
    #pragma omp for collapse(2) schedule(static)
    for (int i = 1; i < n - 1; i++)
      for (int j = 1; j < n - 1; j++)
        A[i][j] = (B[i][j] + B[i][j - 1] + B[i][1 + j] + B[1 + i][j] + B[i - 1][j]) / 5;
  }
  }
}




int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);
  int tsteps = atoi(argv[3]);


  double (*A)[n][n]; A = (double(*)[n][n])malloc((n) * (n) * sizeof(double));;
  double (*B)[n][n]; B = (double(*)[n][n])malloc((n) * (n) * sizeof(double));;



 // __builtin_assume(tsteps>0);
 // __builtin_assume(n>2);
  init_array (n, *A, *B);




  kernel_jacobi_2d_imper (tsteps, n, *A, *B);





  if (dump_code == 1) print_array(n, *A);


  free((void*)A);;
  free((void*)B);;

  return 0;
}
