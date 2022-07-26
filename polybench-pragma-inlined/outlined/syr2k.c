#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      (*A)[i][j] = ((double) i*j) / ni;
      (*B)[i][j] = ((double) i*j) / ni;
    }
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      (*C)[i][j] = ((double) i*j) / ni;
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      (*C)[i][j] *= beta;
}
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      for (k = 0; k < nj; k++)
      {
        (*C)[i][j] += alpha * (*A)[i][k] * (*B)[j][k];
        (*C)[i][j] += alpha * (*B)[i][k] * (*A)[j][k];
      }
}
