/**
 * gramschmidt.c: This file is part of the PolyBench/C 3.2 test suite.
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
    double A[ni][nj],
    double R[nj][nj],
    double Q[ni][nj])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      A[i][j] = ((double) i*j) / ni;
      Q[i][j] = ((double) i*(j+1)) / nj;
    }
  for (i = 0; i < nj; i++)
    for (j = 0; j < nj; j++)
      R[i][j] = ((double) i*(j+2)) / nj;
}




  static
void print_array(int ni, int nj,
    double A[ni][nj],
    double R[nj][nj],
    double Q[ni][nj])
{
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf ", A[i][j]);
      if (i % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
  for (i = 0; i < nj; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf ", R[i][j]);
      if (i % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf ", Q[i][j]);
      if (i % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}




  static
void kernel_gramschmidt(int ni, int nj,
    double A[ni][nj],
    double R[nj][nj],
    double Q[ni][nj])
{
  int i, j, k;

  double nrm;

//#pragma scop
//#pragma omp parallel for private (i, j)
  for (k = 0; k < nj; k++)
  {
    nrm = 0;
    for (i = 0; i < ni; i++)
      nrm += A[i][k] * A[i][k];
    R[k][k] = sqrt(nrm);
    for (i = 0; i < ni; i++)
      Q[i][k] = A[i][k] / R[k][k];
    for (j = k + 1; j < nj; j++)
    {
      R[k][j] = 0;
      for (i = 0; i < ni; i++)
        R[k][j] += Q[i][k] * A[i][j];
      for (i = 0; i < ni; i++)
        A[i][j] = A[i][j] - Q[i][k] * R[k][j];
    }
  }
//#pragma endscop

}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);

  double (*A)[ni][nj]; A = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;
  double (*R)[nj][nj]; R = (double(*)[nj][nj])malloc((nj) * (nj) * sizeof(double));;
  double (*Q)[ni][nj]; Q = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;


  init_array (ni, nj,
      *A,
      *R,
      *Q);




  kernel_gramschmidt (ni, nj,
      *A,
      *R,
      *Q);





  if (dump_code == 1) print_array(ni, nj, *A, *R, *Q);


  free((void*)A);;
  free((void*)R);;
  free((void*)Q);;

  return 0;
}
