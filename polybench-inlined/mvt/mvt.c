int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int n = N;

  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*x1)[n]; x1 = (double(*)[n])malloc(n*sizeof(double));
  double (*x2)[n]; x2 = (double(*)[n])malloc(n*sizeof(double));
  double (*y_1)[n]; y_1 = (double(*)[n])malloc(n*sizeof(double));
  double (*y_2)[n]; y_2 = (double(*)[n])malloc(n*sizeof(double));


  int i, j;

  for (i = 0; i < n; i++)
    {
      (*x1)[i] = ((double) i) / n;
      (*x2)[i] = ((double) i + 1) / n;
      (*y_1)[i] = ((double) i + 3) / n;
      (*y_2)[i] = ((double) i + 4) / n;
      for (j = 0; j < n; j++)
	(*A)[i][j] = ((double) i*j) / n;
    }


#pragma scop
{
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*x1)[i] = (*x1)[i] + (*A)[i][j] * (*y_1)[j];
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*x2)[i] = (*x2)[i] + (*A)[j][i] * (*y_2)[j];
}

  if(dump_code == 1){
  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf", (*x1)[i]);
    fprintf (stderr, "%0.2lf", (*x2)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  }

  free((void*)A);
  free((void*)x1);
  free((void*)x2);
  free((void*)y_1);
  free((void*)y_2);

  return 0;
}
