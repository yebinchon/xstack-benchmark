#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < nx; i++) {
    (*r)[i] = i * M_PI;
    for (j = 0; j < ny; j++)
      (*A)[i][j] = ((double) i*(j+1))/nx;
  }
}
