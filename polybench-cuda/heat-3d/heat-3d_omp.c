#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

  static
void init_array(int n,
    double *A,
    double *B)
{
  int i, j, k;


  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      for (k = 0; k < n; k++){
        A[(i * n + j) * n + k] = ((double) i+j+k) / n;
        B[(i * n + j) * n + k] = ((double) i+j+k+1) / n;
      }
}

static void kernel(int tsteps, int n,
                   double *A, double *B) {
  #pragma omp parallel default(none) firstprivate(tsteps, n, A, B)
  {
  for (int t = 1; t <= tsteps; t++) {
    #pragma omp for collapse(3) schedule(static)
    for (int i = 1; i < n - 1; i++) {
      for (int j = 1; j < n - 1; j++) {
        for (int k = 1; k < n - 1; k++)
          B[(i * n + j) * n + k] = (A[((i + 1) * n + j) * n + k] - 2 * A[(i * n + j) * n + k] + A[((i - 1) * n + j) * n + k]) / 8 + (A[(i * n + (j + 1)) * n + k] - 2 * A[(i * n + j) * n + k] + A[(i * n + (j - 1)) * n + k]) / 8 + (A[(i * n + j) * n + k + 1] - 2 * A[(i * n + j) * n + k] + A[(i * n + j) * n + k - 1]) / 8 + A[(i * n + j) * n + k];
      }
    }
    #pragma omp for collapse(3) schedule(static)
    for (int i = 1; i < n - 1; i++) {
      for (int j = 1; j < n - 1; j++) {
        for (int k = 1; k < n - 1; k++)
          A[(i * n + j) * n + k] = (B[((i + 1) * n + j) * n + k] - 2 * B[(i * n + j) * n + k] + B[((i - 1) * n + j) * n + k]) / 8 + (B[(i * n + (j + 1)) * n + k] - 2 * B[(i * n + j) * n + k] + B[(i * n + (j - 1)) * n + k]) / 8 + (B[(i * n + j) * n + k + 1] - 2 * B[(i * n + j) * n + k] + B[(i * n + j) * n + k - 1]) / 8 + B[(i * n + j) * n + k];
      }
    }
  }
  }
}

  static
void print_array(int n,
    double *A)
{
  int i, j, k;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      for (k = 0; k < n; k++){
        fprintf (stderr, "%0.2lf ", A[(i * n + j) * n + k]);
        if (((i * n + j) * n + k) % 20 == 0) fprintf (stderr, "\n");
      }
  fprintf (stderr, "\n");
}

int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int tsteps = atoi(argv[2]);
  int n = atoi(argv[3]);

  double *A = (double*)malloc(n*n*n*sizeof(double));
  double *B = (double*)malloc(n*n*n*sizeof(double));

  init_array (n,
      A,
      B);

  kernel(tsteps, n, A, B);

  if (dump_code == 1) print_array(n, A);


  free((void*)A);
  free((void*)B);
}

