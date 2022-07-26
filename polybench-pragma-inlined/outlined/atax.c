#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++)
      (*A)[i][j] = ((double) i*(j+1)) / nx;
}
