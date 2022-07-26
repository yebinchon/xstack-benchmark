int main(int argc, char** argv)
{
  int n = N;
  int tsteps = TSTEPS;
  int dump_code = atoi(argv[1]);


  double (*X)[n][n]; X = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*B)[n][n]; B = (double(*)[n][n])malloc(n*n*sizeof(double));


  int i, j;
  int t, i1, i2;

  for (t = 0; t < tsteps; t++)
    {
      for (i1 = 0; i1 < n; i1++)
	for (i2 = 1; i2 < n; i2++)
	  {
	    (*X)[i1][i2] = (*X)[i1][i2] - (*X)[i1][i2-1] * (*A)[i1][i2] / (*B)[i1][i2-1];
	    (*B)[i1][i2] = (*B)[i1][i2] - (*A)[i1][i2] * (*A)[i1][i2] / (*B)[i1][i2-1];
	  }

      for (i1 = 0; i1 < n; i1++)
	(*X)[i1][n-1] = (*X)[i1][n-1] / (*B)[i1][n-1];


      for (i1 = 1; i1 < n; i1++)
	for (i2 = 0; i2 < n; i2++) {
	  (*X)[i1][i2] = (*X)[i1][i2] - (*X)[i1-1][i2] * (*A)[i1][i2] / (*B)[i1-1][i2];
	  (*B)[i1][i2] = (*B)[i1][i2] - (*A)[i1][i2] * (*A)[i1][i2] / (*B)[i1-1][i2];
	}

      for (i2 = 0; i2 < n; i2++)
	(*X)[n-1][i2] = (*X)[n-1][i2] / (*B)[n-1][i2];

      for (i1 = 0; i1 < n-2; i1++)
	for (i2 = 0; i2 < n; i2++)
	  (*X)[n-2-i1][i2] = ((*X)[n-2-i1][i2] - (*X)[n-i1-3][i2] * (*A)[n-3-i1][i2]) / (*B)[n-2-i1][i2];
    }

  if(dump_code == 1){
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf(stderr, "%0.2lf ", ((*X))[i][j]);
      if ((i * n + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");

  }

  free((void*)X);
  free((void*)A);
  free((void*)B);

  return 0;
}
