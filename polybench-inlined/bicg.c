int main(int argc, char** argv)
{
  int nx = NX;
  int ny = NY;
  int dump_code = atoi(argv[1]);

  double (*A)[nx][ny]; A = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*s)[ny]; s = (double(*)[ny])malloc(ny*sizeof(double));
  double (*q)[nx]; q = (double(*)[nx])malloc(nx*sizeof(double));
  double (*p)[ny]; p = (double(*)[ny])malloc(ny*sizeof(double));
  double (*r)[nx]; r = (double(*)[nx])malloc(nx*sizeof(double));

  int i, j;

  for (i = 0; i < ny; i++)
    (*p)[i] = i * M_PI;
  for (i = 0; i < nx; i++) {
    (*r)[i] = i * M_PI;
    for (j = 0; j < ny; j++)
      (*A)[i][j] = ((double) i*(j+1))/nx;
  }

  for (i = 0; i < ny; i++)
    (*s)[i] = 0;
  for (i = 0; i < nx; i++)
    {
      (*q)[i] = 0;
      for (j = 0; j < ny; j++)
	{
	  (*s)[j] = (*s)[j] + (*r)[i] * (*A)[i][j];
	  (*q)[i] = (*q)[i] + (*A)[i][j] * (*p)[j];
	}
    }

  if(dump_code == 1){
  for (i = 0; i < ny; i++) {
    fprintf (stderr, "%0.2lf ", (*s)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  for (i = 0; i < nx; i++) {
    fprintf (stderr, "%0.2lf ", (*q)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  fprintf (stderr, "\n");
  }

  free((void*)A);
  free((void*)s);
  free((void*)q);
  free((void*)p);
  free((void*)r);

  return 0;
}
