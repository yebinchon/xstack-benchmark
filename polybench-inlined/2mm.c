int main(int argc, char** argv)
{
  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);
  int nl = atoi(argv[5]);


  double alpha;
  double beta;
  double (*tmp)[ni][nj]; tmp = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));
  double (*A)[ni][nk]; A = (double(*)[ni][nk])malloc((ni) * (nk) * sizeof(double));
  double (*B)[nk][nj]; B = (double(*)[nk][nj])malloc((nk) * (nj) * sizeof(double));
  double (*C)[nl][nj]; C = (double(*)[nl][nj])malloc((nl) * (nj) * sizeof(double));
  double (*D)[ni][nl]; D = (double(*)[ni][nl])malloc((ni) * (nl) * sizeof(double));

  int i, j, k;

  alpha = 32412;
  beta = 2123;
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
