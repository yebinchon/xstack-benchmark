int main(int argc, char** argv)
{
  int tmax = TMAX;
  int nx = NX;
  int ny = NY;
  int dump_code = atoi(argv[1]);

  double (*ex)[nx][ny]; ex = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*ey)[nx][ny]; ey = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*hz)[nx][ny]; hz = (double(*)[nx][ny])malloc(nx*ny*sizeof(double));
  double (*_fict_)[ny]; _fict_ = (double(*)[ny])malloc(ny*sizeof(double));

  int i, j;

  for (i = 0; i < ny; i++)
    _fict_[i] = (double) i;

  int t;

  for(t = 0; t < tmax; t++)
    {
      for (j = 0; j < ny; j++)
	      ey[0][j] = _fict_[t];

      for (i = 0; i < nx; i++)
	      for (j = 1; j < ny; j++)
	        ex[i][j] = ex[i][j] - 0.5*(hz[i][j]-hz[i][j-1]);
      for (i = 0; i < nx - 1; i++)
	      for (j = 0; j < ny - 1; j++)
	        hz[i][j] = hz[i][j] - 0.7*  (ex[i][j+1] - ex[i][j] +
				       ey[i+1][j] - ey[i][j]);
    }

  if(dump_code == 1) {
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++) {
      fprintf(stderr, "%0.2lf ", ex[i][j]);
      fprintf(stderr, "%0.2lf ", ey[i][j]);
      fprintf(stderr, "%0.2lf ", hz[i][j]);
      if ((i * nx + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
  }

  free((void*)ex);
  free((void*)ey);
  free((void*)hz);
  free((void*)_fict_);

  return 0;
}
