/**
 * lu.c: This file is part of the PolyBench/C 3.2 test suite.
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
      A[i][j] = ((double) (i+1)*(j+1)) / n;
}




  static
void print_array(int n,
    double A[n][n])

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf (stderr, "%0.2lf ", A[i][j]);
      if ((i * n + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_lu(int n,
    double A[n][n])
{
  int i, j, k;

//#pragma scop
//#pragma omp parallel
{
//  #pragma omp for private (j, i)
  for (k = 0; k < n; k++)
  {
    for (j = k + 1; j < n; j++)
      A[k][j] = A[k][j] / A[k][k];
    for(i = k + 1; i < n; i++)
      for (j = k + 1; j < n; j++)
        A[i][j] = A[i][j] - A[i][k] * A[k][j];
  }
}
//#pragma endscop

}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);


  double (*A)[n][n]; A = (double(*)[n][n])malloc((n) * (n) * sizeof(double));;



  init_array (n, *A);




  kernel_lu (n, *A);





  if (dump_code == 1) print_array(n, *A);


  free((void*)A);;

  return 0;
}
