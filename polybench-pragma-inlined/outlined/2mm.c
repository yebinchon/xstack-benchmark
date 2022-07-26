#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      (*tmp)[i][j] = 0;
      for (k = 0; k < nk; ++k)
        (*tmp)[i][j] += alpha * (*A)[i][k] * (*B)[k][j];
    }
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
    {
      (*D)[i][j] *= beta;
      for (k = 0; k < nj; ++k)
        (*D)[i][j] += (*tmp)[i][k] * (*C)[k][j];
    }
}
