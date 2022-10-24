
int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(argv[3], ((uint8_t**)0), 10);
  uint64_t nk = strtol(argv[4], ((uint8_t**)0), 10);
  uint64_t nl = strtol(argv[5], ((uint8_t**)0), 10);
  uint8_t* tmp = malloc(nj * (ni << 32) >> 29);
  uint8_t* A = malloc(nk * (ni << 32) >> 29);
  uint8_t* B = malloc(nk * (nj << 32) >> 29);
  uint8_t* C = malloc(nl * (nj << 32) >> 29);
  uint8_t* D = malloc(nl * (ni << 32) >> 29);
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nk;   j = j + 1){
  (((double*)A)+i * nl)[j] = (double)(i) * (double)(j) / (double)(ni);
}
}
for(uint64_t i = 0; i < nk;   i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  (((double*)B)+i * nj)[j] = (double)(i) * (double)((j + 1)) / (double)(nj);
}
}
for(uint64_t i = 0; i < nl;   i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  (((double*)C)+i * nj)[j] = (double)(i) * (double)((j + 3)) / (double)(nl);
}
}
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  (((double*)D)+i * nl)[j] = (double)(i) * (double)((j + 2)) / (double)(nk);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((tmp+(nj << 3) * i)+(j << 3))) = 0;
  ((double*)tmp)[(i * nj + j)] = 0;
for(uint64_t k = 0; k < nk;   k = k + 1){
  ((double*)tmp)[(i * nj + j)] = (((double*)tmp)[(i * nj + j)] + *((double*)((A+(nk << 3) * i)+(k << 3))) * 32412 * *((double*)((B+(j << 3))+(nj << 3) * k)));
}
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
  ((double*)D)[(i * nl + j)] = *((double*)((D+(nl << 3) * i)+(j << 3))) * 2123;
for(uint64_t k = 0; k < nj;   k = k + 1){
  ((double*)D)[(i * nl + j)] = (((double*)D)[(i * nl + j)] + *((double*)((tmp+(nj << 3) * i)+(k << 3))) * *((double*)((C+(j << 3))+(nj << 3) * k)));
}
}
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nl;   j = j + 1){
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

