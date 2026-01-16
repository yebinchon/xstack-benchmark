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
void init_array(int n, double *A) {
    int i, j;

    for (i = 0; i < n; i++) {
        for (j = 0; j <= i; j++) {
            A[i * n + j] = (double)(-j % n) / n + 1;
        }
        for (j = i + 1; j < n; j++) {
            A[i * n + j] = 0;
        }
        A[i * n + i] = 1;
    }

    // Make A positive semi-definite.
    double *B = (double *)malloc(n * n * sizeof(double));
    for (int r = 0; r < n; r++) {
        for (int s = 0; s < n; s++) {
            B[r * n + s] = 0.0;
        }
    }
    for (int t = 0; t < n; t++) {
        for (int r = 0; r < n; r++) {
            for (int s = 0; s < n; s++) {
                B[r * n + s] += A[r * n + t] * A[s * n + t];
            }
        }
    }
    memcpy(A, B, n * n * sizeof(double));
    free(B);
}





  static
void print_array(int n,
    double *A)

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf (stderr, "%0.2lf ", A[i*n+j]);
      if ((i * n + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_lu(int n,
    double *A)
{
  #pragma omp parallel default(none) firstprivate(n, A)
  {
  for (int i = 0; i < n; i++) {
    #pragma omp for schedule(static)
    for (int j = 0; j < i; j++) {
      for (int k = 0; k < j; k++)
        A[i*n+j] -= A[i*n+k] * A[k*n+j];
      A[i*n+j] /= A[j*n+j];
    }
    #pragma omp for collapse(2)
    for (int j = i; j < n; j++)
      for (int k = 0; k < i; k++)
        A[i*n+j] -= A[i*n+k] * A[k*n+j];
  }
}
}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);


  double *A = (double*)malloc(n*n*sizeof(double));



  init_array (n, A);




  kernel_lu (n, A);





  if (dump_code == 1) print_array(n, A);


  free((void*)A);;

  return 0;
}
