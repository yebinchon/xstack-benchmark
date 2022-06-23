
#pragma omp parallel for
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      (*A)[i][j] = ((double) i*j) / ni;
#pragma omp parallel for
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      (*C)[i][j] = ((double) i*j) / ni;


#pragma omp parallel for
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      (*C)[i][j] *= beta;

#pragma omp parallel for
  for (i = 0; i < ni; i++)
    for (j = 0; j < ni; j++)
      for (k = 0; k < nj; k++)
        (*C)[i][j] += alpha * (*A)[i][k] * (*A)[j][k];

