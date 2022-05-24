int main(int argc, char** argv)
{
  int nx = NX;
  int ny = NY;
  int dump_code = atoi(argv[1]);

  double (*A)[nx][ny]; A = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*x)[ny]; x = (double(*)[ny])malloc(ny*sizeof(double));
  double (*y)[nx]; y = (double(*)[nx])malloc(nx*sizeof(double));
  double (*tmp)[ny]; tmp = (double(*)[ny])malloc(ny*sizeof(double));

  int i, j;

  for (i = 0; i < ny; i++)
     (*x)[i] = i * M_PI;
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++)
      (*A)[i][j] = ((double) i*(j+1)) / nx;


  for (i= 0; i < nx; i++)
    (*y)[i] = 0;
  for (i = 0; i < ny; i++)
    {
      (*tmp)[i] = 0;
      for (j = 0; j < ny; j++)
	(*tmp)[i] = (*tmp)[i] + (*A)[i][j] * (*x)[j];
      for (j = 0; j < ny; j++)
	(*y)[j] = (*y)[j] + (*A)[i][j] * (*tmp)[i];
    }



  if(dump_code == 1){
  for (i = 0; i < nx; i++) {
    fprintf (stderr, "%0.2lf ", (*y)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  fprintf (stderr, "\n");

  }

  free((void*)A);
  free((void*)x);
  free((void*)y);
  free((void*)tmp);

  return 0;
}
