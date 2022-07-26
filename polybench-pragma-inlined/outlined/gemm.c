
#pragma omp parallel
{
#pragma omp for scheule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      (*C)[i][j] = ((double) i*j) / ni;
}
#pragma omp parallel
{
#pragma omp for scheule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      (*A)[i][j] = ((double) i*j) / ni;
}
#pragma omp parallel
{
#pragma omp for scheule(static) nowait
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      (*B)[i][j] = ((double) i*j) / ni;
}

#pragma omp parallel
{
#pragma omp for scheule(static) nowait
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      (*C)[i][j] *= beta;
      for (k = 0; k < nk; ++k)
        (*C)[i][j] += alpha * (*A)[i][k] * (*B)[k][j];
    }
}

