int main(int argc, char ** argv) {
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
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
for(uint64_t i = 0; i < ni;  i = i + 1){
for(uint64_t j = 0; j < nk;  j = j + 1){
  (((double*)A)+i * nl)[j] = (double)(i) * (double)(j) / (double)(ni);
}
}
for(uint64_t i = 0; i < nk;  i = i + 1){
for(uint64_t j = 0; j < nj;  j = j + 1){
  (((double*)B)+i * nj)[j] = (double)(i) * (double)((j + 1)) / (double)(nj);
}
}
for(uint64_t i = 0; i < nl;  i = i + 1){
for(uint64_t j = 0; j < nj;  j = j + 1){
  (((double*)C)+i * nj)[j] = (double)(i) * (double)((j + 3)) / (double)(nl);
}
}
for(uint64_t i = 0; i < ni;  i = i + 1){
for(uint64_t j = 0; j < nl;  j = j + 1){
  (((double*)D)+i * nl)[j] = (double)(i) * (double)((j + 2)) / (double)(nk);
}
}
//START OUTLINED
  #pragma omp parallel
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(ni - 1);i+=1){
for(uint64_t j = 0; j < nj;  j = j + 1){
  *((double*)((tmp+(nj << 3) * i)+(j << 3))) = 0;
  ((double*)tmp)[(i * nj + j)] = 0;
for(uint64_t k = 0; k < nk;  k = k + 1){
  ((double*)tmp)[(i * nj + j)] = (((double*)tmp)[(i * nj + j)] + *((double*)((A+(nk << 3) * i)+(k << 3))) * 32412 * *((double*)((B+(j << 3))+(nj << 3) * k)));
}
}
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(ni - 1);i+=1){
for(uint64_t j = 0; j < nl;  j = j + 1){
  ((double*)D)[(i * nl + j)] = *((double*)((D+(nl << 3) * i)+(j << 3))) * 2123;
for(uint64_t k = 0; k < nj;  k = k + 1){
  ((double*)D)[(i * nl + j)] = (((double*)D)[(i * nl + j)] + *((double*)((tmp+(nj << 3) * i)+(k << 3))) * *((double*)((C+(j << 3))+(nj << 3) * k)));
}
}
}
}
//END OUTLINED
  if (dump_code == 1) {
for(uint64_t i = 0; i < ni;  i = i + 1){
for(uint64_t j = 0; j < nl;  j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)D)+i * nl)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(tmp);
free(A);
free(B);
free(C);
free(D);
  return 0;
}

