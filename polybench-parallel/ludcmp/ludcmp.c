/**
 * ludcmp.c: This file is part of the PolyBench/C 3.2 test suite.
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
    double A[n+1][n+1],
    double b[n+1],
    double x[n+1],
    double y[n+1])
{
  int i, j;

  for (i = 0; i <= n; i++)
  {
    x[i] = i + 1;
    y[i] = (i+1)/n/2.0 + 1;
    b[i] = (i+1)/n/2.0 + 42;
    for (j = 0; j <= n; j++) {
      A[i][j] = ((double) (i+1)*(j+1)) / n;
    }
  }
}




  static
void print_array(int n,
    double x[n+1])

{
  int i;

  for (i = 0; i <= n; i++) {
    fprintf (stderr, "%0.2lf ", x[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
}




  static
void kernel_ludcmp(int n,
    double A[n+1][n+1],
    double b[n+1],
    double x[n+1],
    double y[n+1])
{
  int i, j, k;

  double w;

//#pragma scop
  b[0] = 1.0;
//#pragma omp parallel
{
//  #pragma omp for private (j, k, w)
  for (i = 0; i < n; i++)
  {
    for (j = i+1; j <= n; j++)
    {
      w = A[j][i];
      for (k = 0; k < i; k++)
        w = w- A[j][k] * A[k][i];
      A[j][i] = w / A[i][i];
    }
//    #pragma omp barrier
    for (j = i+1; j <= n; j++)
    {
      w = A[i+1][j];
      for (k = 0; k <= i; k++)
        w = w - A[i+1][k] * A[k][j];
      A[i+1][j] = w;
    }
  }
  y[0] = b[0];
//  #pragma omp for private (j, w)
  for (i = 1; i <= n; i++)
  {
    w = b[i];
    for (j = 0; j < i; j++)
      w = w - A[i][j] * y[j];
    y[i] = w;
  }
  x[n] = y[n] / A[n][n];
//  #pragma omp for private (j, w)
  for (i = 0; i <= n - 1; i++)
  {
    w = y[n - 1 - (i)];
    for (j = n - i; j <= n; j++)
      w = w - A[n - 1 - i][j] * x[j];
    x[n - 1 - i] = w / A[n - 1 - (i)][n - 1-(i)];
  }
}
//#pragma endscop

}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);


  double (*A)[n+1][n+1]; A = (double(*)[n+1][n+1])malloc((n+1) * (n+1) * sizeof(double));;
  double (*b)[n+1]; b = (double(*)[n+1])malloc((n+1) * sizeof(double));;
  double (*x)[n+1]; x = (double(*)[n+1])malloc((n+1) * sizeof(double));;
  double (*y)[n+1]; y = (double(*)[n+1])malloc((n+1) * sizeof(double));;



  init_array (n,
      *A,
      *b,
      *x,
      *y);




  kernel_ludcmp (n,
      *A,
      *b,
      *x,
      *y);





  if (dump_code == 1) print_array(n, *x);


  free((void*)A);;
  free((void*)b);;
  free((void*)x);;
  free((void*)y);;

  return 0;
}
