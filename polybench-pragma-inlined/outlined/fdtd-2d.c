#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++)
      {
	ex[i][j] = ((double) i*(j+1)) / nx;
	ey[i][j] = ((double) i*(j+2)) / ny;
	hz[i][j] = ((double) i*(j+3)) / nx;
      }
}
#pragma omp parallel 
{
#pragma omp for schedule(static) nowait
      for (i = 1; i < nx; i++)
	      for (j = 0; j < ny; j++)
	        ey[i][j] = ey[i][j] - 0.5*(hz[i][j]-hz[i-1][j]);
}
