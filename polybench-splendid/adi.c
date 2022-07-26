
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* X = malloc(33554432);
  uint8_t* A = malloc(33554432);
  uint8_t* B = malloc(33554432);
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(2048 - 1);i+=1){
for(uint64_t j = 0; j < (2047 + 1);  j = j + 1){
  *((double*)((X+(i << 14))+(j << 3))) = ((double)(i) * (double)((j + 1)) + 1) * 4.8828125E-4;
  *((double*)((A+(i << 14))+(j << 3))) = ((double)(i) * (double)((j + 2)) + 2) * 4.8828125E-4;
  *((double*)((B+(i << 14))+(j << 3))) = ((double)(i) * (double)((j + 3)) + 3) * 4.8828125E-4;
}
}
}
for(uint64_t i = 0; i < 50;  i = i + 1){
for(uint64_t j = 0; j < 2048;  j = j + 1){
  double __2e_phiops_2e_0 = *((double*)(B+(j << 14)));
  double __2e_phiops73_2e_0 = *((double*)(X+(j << 14)));
for(uint64_t k = 0; k < 2047;  k = k + 1){
  __2e_phiops73_2e_0 = (*((double*)(((X+8)+(j << 14))+(k << 3))) - __2e_phiops73_2e_0 * *((double*)(((A+8)+(j << 14))+(k << 3))) / __2e_phiops_2e_0);
  *((double*)(((X+8)+(j << 14))+(k << 3))) = __2e_phiops73_2e_0;
  __2e_phiops_2e_0 = (*((double*)(((B+8)+(j << 14))+(k << 3))) - *((double*)(((A+8)+(j << 14))+(k << 3))) * *((double*)(((A+8)+(j << 14))+(k << 3))) / __2e_phiops_2e_0);
  *((double*)(((B+8)+(j << 14))+(k << 3))) = __2e_phiops_2e_0;
}
}
for(uint64_t j = 0; j < 2048;  j = j + 1){
  *((double*)((X+16376)+(j << 14))) = *((double*)((X+16376)+(j << 14))) / *((double*)((B+16376)+(j << 14)));
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(2048 - 1);i+=1){
for(uint64_t j = 0; j < (2045 + 1);  j = j + 1){
  *((double*)(((X+16368)+(i << 14))+j * -8)) = (*((double*)(((X+16368)+(i << 14))+j * -8)) - *((double*)(((X+16360)+(i << 14))+j * -8)) * *((double*)(((A+16360)+(i << 14))+j * -8))) / *((double*)(((B+16360)+(i << 14))+j * -8));
}
}
}
for(uint64_t j = 0; j < 2047;  j = j + 1){
for(uint64_t k = 0; k < 2048;  k = k + 1){
  *((double*)(((X+16384)+(j << 14))+(k << 3))) = (*((double*)(((X+16384)+(j << 14))+(k << 3))) - *((double*)((X+(j << 14))+(k << 3))) * *((double*)(((A+16384)+(j << 14))+(k << 3))) / *((double*)((B+(j << 14))+(k << 3))));
  *((double*)(((B+16384)+(j << 14))+(k << 3))) = (*((double*)(((B+16384)+(j << 14))+(k << 3))) - *((double*)(((A+16384)+(j << 14))+(k << 3))) * *((double*)(((A+16384)+(j << 14))+(k << 3))) / *((double*)((B+(j << 14))+(k << 3))));
}
}
for(uint64_t j = 0; j < 2048;  j = j + 1){
  *((double*)((X+33538048)+(j << 3))) = *((double*)((X+33538048)+(j << 3))) / *((double*)((B+33538048)+(j << 3)));
}
for(uint64_t j = 0; j < 2046;  j = j + 1){
for(uint64_t k = 0; k < 2048;  k = k + 1){
  *((double*)(((X+33521664)+j * -16384)+(k << 3))) = (*((double*)(((X+33521664)+j * -16384)+(k << 3))) - *((double*)(((X+33505280)+j * -16384)+(k << 3))) * *((double*)(((A+33505280)+j * -16384)+(k << 3)))) / *((double*)(((B+33521664)+j * -16384)+(k << 3)));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 2048;  i = i + 1){
for(uint64_t j = 0; j < 2048;  j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)X)+(i << 11))[j]);
  if ((j + (i << 11)) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(X);
free(A);
free(B);
  return 0;
}

