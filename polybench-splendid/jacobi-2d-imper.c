
int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  uint64_t n = strtol(argv[2], ((uint8_t**)0), 10);
  uint64_t tsteps = strtol(argv[3], ((uint8_t**)0), 10);
  double* A = malloc((n << 3) * n);
  double* B = malloc((n << 3) * n);
for(uint64_t i = 0; i < n;   i = i + 1){
for(uint64_t j = 0; j < n;   j = j + 1){
  (((double*)A)+i * n)[j] = ((double)(i) * (double)((j + 2)) + 2) / (double)(n);
  (((double*)B)+i * n)[j] = ((double)(i) * (double)((j + 3)) + 3) / (double)(n);
}
}
for(uint64_t i = 0; i < tsteps;   i = i + 1){
  #pragma omp parallel 
{
uint64_t _2 = n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  if (n > 2) {
for(uint64_t k = 0; k < n + -2;   k = k + 1){
  *((double*)((((uint8_t*)(((double*)B)+1))+((j << 3) + 8) * n)+(k << 3))) = ((((*((double*)((((uint8_t*)(((double*)A)+1))+((j << 3) + 8) * n)+(k << 3))) + *((double*)((((uint8_t*)(double*)A)+((j << 3) + 8) * n)+(k << 3)))) + *((double*)((((uint8_t*)(((double*)A)+2))+((j << 3) + 8) * n)+(k << 3)))) + *((double*)((((uint8_t*)(((double*)A)+1))+((j << 3) + 16) * n)+(k << 3)))) + (((double*)A)+1)[k+j * n]) * 0.20000000000000001;
}
}

}
}
  #pragma omp parallel 
{
uint64_t _2 = n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  if (n > 2) {
for(uint64_t k = 0; k < n + -2;   k = k + 1){
  *((uint64_t*)((((uint8_t*)(((double*)A)+1))+((j << 3) + 8) * n)+(k << 3))) = *((uint64_t*)((((uint8_t*)(((double*)B)+1))+((j << 3) + 8) * n)+(k << 3)));
}
}

}
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < n;   i = i + 1){
for(uint64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)A)+i * n)[j]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(A);
free(B);
  return 0;
}

