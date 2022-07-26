int main(int argc, char** argv)
{
  int n = N;
  int dump_code = atoi(argv[1]);

  double alpha;
  double beta;
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*B)[n][n]; B = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*tmp)[n]; tmp = (double(*)[n])malloc(n*sizeof(double));
  double (*x)[n]; x = (double(*)[n])malloc(n*sizeof(double));
  double (*y)[n]; y = (double(*)[n])malloc(n*sizeof(double));


  int i, j;

  alpha = 43532;
  beta = 12313;

  for (i = 0; i < n; i++)
    {
      (*tmp)[i] = 0;
      (*y)[i] = 0;
      for (j = 0; j < n; j++)
	{
	  (*tmp)[i] = (*A)[i][j] * (*x)[j] + (*tmp)[i];
	  (*y)[i] = (*B)[i][j] * (*x)[j] + (*y)[i];
	}
      (*y)[i] = alpha * (*tmp)[i] + beta * (*y)[i];
    }

  if(dump_code == 1){
  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", (*y)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  }

  free((void*)A);
  free((void*)B);
  free((void*)tmp);
  free((void*)x);
  free((void*)y);

  return 0;
}
