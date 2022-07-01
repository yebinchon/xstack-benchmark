int main(int argc, char** argv)
{
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      (*A)[i][j] = ((double) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      (*B)[i][j] = ((double) i*(j+1)) / nj;
  for (i = 0; i < nl; i++)
    for (j = 0; j < nj; j++)
      (*C)[i][j] = ((double) i*(j+3)) / nl;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      (*D)[i][j] = ((double) i*(j+2)) / nk;



  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      (*tmp)[i][j] = 0;
      for (k = 0; k < nk; ++k)
        (*tmp)[i][j] += alpha * (*A)[i][k] * (*B)[k][j];
    }
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
    {
      (*D)[i][j] *= beta;
      for (k = 0; k < nj; ++k)
        (*D)[i][j] += (*tmp)[i][k] * (*C)[k][j];
    }

  if (dump_code == 1){
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
      fprintf (stderr, "%0.2lf ", (*D)[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
  }


  free((void*)tmp);;
  free((void*)A);;
  free((void*)B);;
  free((void*)C);;
  free((void*)D);;

  return 0;
}
