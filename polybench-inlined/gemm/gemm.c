int main(int argc, char** argv)
{

  int dump_code = atoi(argv[1]);
  int ni = atoi(argv[2]);
  int nj = atoi(argv[3]);
  int nk = atoi(argv[4]);

  double alpha;
  double beta;
  double (*C)[ni][nj]; C = (double(*)[ni][nj])malloc((ni) * (nj) * sizeof(double));;
  double (*A)[ni][nk]; A = (double(*)[ni][nk])malloc((ni) * (nk) * sizeof(double));;
  double (*B)[nk][nj]; B = (double(*)[nk][nj])malloc((nk) * (nj) * sizeof(double));;


  int i, j, k;

  alpha = 32412;
  beta = 2123;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      (*C)[i][j] = ((double) i*j) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      (*A)[i][j] = ((double) i*j) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      (*B)[i][j] = ((double) i*j) / ni;


  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
    {
      (*C)[i][j] *= beta;
      for (k = 0; k < nk; ++k)
        (*C)[i][j] += alpha * (*A)[i][k] * (*B)[k][j];
    }



  if (dump_code == 1){
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      fprintf (stderr, "%0.2lf ", (*C)[i][j]);
      if ((i * ni + j) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
  }

  free((void*)C);;
  free((void*)A);;
  free((void*)B);;

  return 0;
}
