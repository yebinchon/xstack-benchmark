/**
 * correlation.c: This file is part of the PolyBench/C 3.2 test suite.
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
void init_array (int m,
    int n,
    double *data)
{
  int i, j;

  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      data[i*n+j] = ((double) i*j) / 1000;
}




  static
void print_array(int m,
    double *corr)

{
  int i, j;

  for (i = 0; i < m; i++)
    for (j = 0; j < m; j++) {
      fprintf (stderr, "%0.2lf ", corr[i*m+j]);
      if ((i * m + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}



static void kernel(int m, int n,
                   double *data,
                   double *corr,
                   double *mean,
                   double stddev[]) {
  double eps = 0.1;


  for (int j = 0; j < m; j++) {
    mean[j] = 0.0;
    for (int i = 0; i < n; i++)
      mean[j] += data[i*m+j];
    mean[j] /= n;
  }


  for (int j = 0; j < m; j++) {
    stddev[j] = 0.0;
    for (int i = 0; i < n; i++)
      stddev[j] += (data[i*m+j] - mean[j]) * (data[i*m+j] - mean[j]);
    stddev[j] /= n;
    stddev[j] = sqrt(stddev[j]);
    /* The following in an inelegant but usual way to handle
       near-zero std. dev. values, which below would cause a zero-
       divide. */
    if (stddev[j] <= eps)
      stddev[j] = 1.0;
  }

  /* Center and reduce the column vectors. */
  for (int i = 0; i < n; i++)
    for (int j = 0; j < m; j++) {
      data[i*m+j] -= mean[j];
      data[i*m+j] /= sqrt((double)n) * stddev[j];
    }

  /* Calculate the m * m correlation matrix. */
  for (int i = 0; i < m - 1; i++) {
    corr[i*m+i] = 1.0;
    for (int j = i + 1; j < m; j++) {
      corr[i*m+j] = 0.0;
      for (int k = 0; k < n; k++)
        corr[i*m+j] += data[k*m+i] * data[k*m+j];
      corr[j*m+i] = corr[i*m+j];
    }
  }
  corr[(m - 1)*m+m - 1] = 1.0;
}


int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int n = atoi(argv[2]);
  int m = atoi(argv[3]);

  double *data = (double*)malloc(n*m*sizeof(double));
  double *mean = (double*)malloc(m*sizeof(double));
  double *stddev = (double*)malloc(m*sizeof(double));
  double *corr = (double*)malloc(m*m*sizeof(double));


  init_array (m, n, data);




  kernel(m, n, data, corr, mean, stddev);




  if (dump_code == 1) print_array(m, corr);


  free((void*)data);;
  free((void*)corr);;
  free((void*)mean);;
  free((void*)stddev);;

  return 0;
}

