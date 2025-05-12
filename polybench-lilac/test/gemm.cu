/**
 * gemm.c: This file is part of the PolyBench/C 3.2 test suite.
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
void init_array(int ni, int nj, int nk,
    double *C,
    double *A,
    double *B)
{
  int i, j;


  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i*nj+j] = ((double) i*j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i*nk+j] = ((double) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i*nj+j] = ((double) i*j) / ni;
}




  static
void print_array(int ni, int nj,
    double *C)
{
  int i = 0, j = 0;

//  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf", C[i*nj+j]);
      if ((i * ni + j) % 20 == 0) {
        if(i == 0) fprintf(stderr, "\n");
        fprintf (stderr, "\n");
      }
      else fprintf(stderr, " ");
    }
}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);

  double *A = (double*)malloc(ni*nk*sizeof(double));
  double *B = (double*)malloc(nk*nj*sizeof(double));
  double *C = (double*)malloc(ni*nj*sizeof(double));

  double alpha = 32412;
  double beta = 2123;

  init_array (ni, nj, nk,
      C,
      A,
      B);

  if (dump_code == 1) print_array(ni, nj, C);


  free((void*)C);
  free((void*)A);
  free((void*)B);
  return 0;
}
