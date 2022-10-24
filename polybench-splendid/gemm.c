
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(argv[3], ((uint8_t**)0), 10);
  uint64_t nk = strtol(argv[4], ((uint8_t**)0), 10);
  uint8_t* C = malloc(nj * (ni << 3));
  uint8_t* _call17 = malloc(nk * (ni << 3));
  uint8_t* _call21 = malloc((nj << 3) * nk);
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((C+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nk;   j = j + 1){
  *((double*)((_call17+(nk << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nk - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((_call21+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  ((double*)C)[(i * nj + j)] = *((double*)((C+(nj << 3) * i)+(j << 3))) * 2123;
for(uint64_t k = 0; k < nk;   k = k + 1){
  ((double*)C)[(i * nj + j)] = (((double*)C)[(i * nj + j)] + *((double*)((_call17+(nk << 3) * i)+(k << 3))) * 32412 * *((double*)((_call21+(j << 3))+(nj << 3) * k)));
}
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < ni;   i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)C)+i * nj)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(C);
free(_call17);
free(_call21);
  return 0;
}

