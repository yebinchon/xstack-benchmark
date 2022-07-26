
int main(int argc, char** argv)
{
  int n = N;
  int dump_code = atoi(argv[1]);

  double alpha;
  double beta;
  double (*A)[n][n]; A = (double(*)[n][n])malloc(n*n*sizeof(double));
  double (*u1)[n]; u1 = (double(*)[n])malloc(n*sizeof(double));
  double (*v1)[n]; v1 = (double(*)[n])malloc(n*sizeof(double));
  double (*u2)[n]; u2 = (double(*)[n])malloc(n*sizeof(double));
  double (*v2)[n]; v2 = (double(*)[n])malloc(n*sizeof(double));
  double (*w)[n]; w = (double(*)[n])malloc(n*sizeof(double));
  double (*x)[n]; x = (double(*)[n])malloc(n*sizeof(double));
  double (*y)[n]; y = (double(*)[n])malloc(n*sizeof(double));
  double (*z)[n]; z = (double(*)[n])malloc(n*sizeof(double));

  int i, j;

  alpha = 43532;
  beta = 12313;

  for (i = 0; i < n; i++)
    {
      (*u1)[i] = i;
      (*u2)[i] = (i+1)/n/2.0;
      (*v1)[i] = (i+1)/n/4.0;
      (*v2)[i] = (i+1)/n/6.0;
      (*y)[i] = (i+1)/n/8.0;
      (*z)[i] = (i+1)/n/9.0;
      (*x)[i] = 0.0;
      (*w)[i] = 0.0;
      for (j = 0; j < n; j++)
	(*A)[i][j] = ((double) i*j) / n;
    }


#pragma omp parallel 
{
#pragma omp for schedule(static)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*A)[i][j] = (*A)[i][j] + (*u1)[i] * (*v1)[j] + (*u2)[i] * (*v2)[j];
}
#pragma omp parallel 
{
#pragma omp for schedule(static)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*x)[i] = (*x)[i] + beta * (*A)[j][i] * (*y)[j];
}
#pragma omp parallel 
{
#pragma omp for schedule(static)
  for (i = 0; i < n; i++)
    (*x)[i] = (*x)[i] + (*z)[i];
}
#pragma omp parallel 
{
#pragma omp for schedule(static)
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*w)[i] = (*w)[i] +  alpha * (*A)[i][j] * (*x)[j];
}
  if(dump_code == 1){
  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", (*w)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }

  }

  free((void*)A);
  free((void*)u1);
  free((void*)v1);
  free((void*)u2);
  free((void*)v2);
  free((void*)w);
  free((void*)x);
  free((void*)y);
  free((void*)z);

  return 0;
}
