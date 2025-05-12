/**
 * 2mm.c: This file is part of the PolyBench/C 3.2 test suite.
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
void init_array(int ni, int nj, int nk, int nl,
    double *alpha,
    double *beta,
    double *A,
    double *B,
    double *C,
    double *D)
    //double A[ni][nl],
    //double B[nk][nj],
    //double C[nl][nj],
    //double D[ni][nl])
{
  int i, j;

  *alpha = 32412;
  *beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i*nk+j] = ((double) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i*nj+j] = ((double) i*(j+1)) / nj;
  for (i = 0; i < nl; i++)
    for (j = 0; j < nj; j++)
      C[i*nj+j] = ((double) i*(j+3)) / nl;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D[i*nl+j] = ((double) i*(j+2)) / nk;
}




  static
void print_array(int ni, int nl,
    double *D)
    //double D[ni][nl])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
      fprintf (stderr, "%0.2lf ", D[i*nl+j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_2mm(int ni, int nj, int nk, int nl,
    double alpha,
    double beta,
    double *tmp,
    double *A,
    double *B,
    double *C,
    double *D)
    //double tmp[ni][nj],
    //double A[ni][nk],
    //double B[nk][nj],
    //double C[nl][nj],
    //double D[ni][nl])
{
  int i, j, k;


#pragma omp parallel
  {
  #pragma omp for collapse(2) private (j, k) schedule(static)
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      tmp[i*nj+j] = 0;
      for (k = 0; k < nk; ++k)
        tmp[i*nj+j] += alpha * A[i*nk+k] * B[k*nj+j];
    }
  #pragma omp for collapse(2) private (j, k) schedule(static)
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
    {
      D[i*nj+j] *= beta;
      for (k = 0; k < nj; ++k)
        D[i*nl+j] += tmp[i*nj+k] * C[k*nl+j];
    }
  }
}


int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);
  int nl = atoi(argv[5]);


  double alpha;
  double beta;
  double (*tmp); tmp = (double(*))malloc((ni) * (nj) * sizeof(double));
  double (*A); A = (double(*))malloc((ni) * (nk) * sizeof(double));
  double (*B); B = (double(*))malloc((nk) * (nj) * sizeof(double));
  double (*C); C = (double(*))malloc((nl) * (nj) * sizeof(double));
  double (*D); D = (double(*))malloc((ni) * (nl) * sizeof(double));



  init_array (ni, nj, nk, nl, &alpha, &beta,
      A,
      B,
      C,
      D);




  kernel_2mm (ni, nj, nk, nl,
      alpha, beta,
      tmp,
      A,
      B,
      C,
      D);





  if (dump_code == 1) print_array(ni, nl, D);


  free((void*)tmp);;
  free((void*)A);;
  free((void*)B);;
  free((void*)C);;
  free((void*)D);;

  return 0;
}
