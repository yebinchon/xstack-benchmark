/**
 * seidel-2d.c: This file is part of the PolyBench/C 3.2 test suite.
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
    double A[n][n])
{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      A[i][j] = ((double) i*(j+2) + 2) / n;
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




  static
void kernel_seidel_2d(int tsteps,
    int n,
    double A[n][n])
{
  int t, i, j;

  for (t = 0; t <= tsteps - 1; t++)
    for (i = 1; i<= n - 2; i++)
      for (j = 1; j <= n - 2; j++)
        A[i][j] = (A[i-1][j-1] + A[i-1][j] + A[i-1][j+1]
            + A[i][j-1] + A[i][j] + A[i][j+1]
            + A[i+1][j-1] + A[i+1][j] + A[i+1][j+1])/9.0;

}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);
  int tsteps = atoi(argv[3]);

  double (*A)[n][n]; A = (double(*)[n][n])malloc((n) * (n) * sizeof(double));;



  init_array (n, *A);




  kernel_seidel_2d (tsteps, n, *A);





  if (dump_code == 1) print_array(n, *A);


  free((void*)A);;

  return 0;
}
