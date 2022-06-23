
#pragma omp parallel for
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*A)[i][j] = (*A)[i][j] + (*u1)[i] * (*v1)[j] + (*u2)[i] * (*v2)[j];

#pragma omp parallel for
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*x)[i] = (*x)[i] + beta * (*A)[j][i] * (*y)[j];

#pragma omp parallel for
  for (i = 0; i < n; i++)
    (*x)[i] = (*x)[i] + (*z)[i];

#pragma omp parallel for
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      (*w)[i] = (*w)[i] +  alpha * (*A)[i][j] * (*x)[j];

  if(dump_code == 1){
  for (i = 0; i < n; i++) {
    fprintf (stderr, "%0.2lf ", (*w)[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }

  }
