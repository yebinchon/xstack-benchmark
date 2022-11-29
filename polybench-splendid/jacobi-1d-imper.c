
void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
for(uint64_t i = 0; i < _tsteps;   i = i + 1){
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  _B[j+1] = ((_A[j] + _A[j+1]) + _A[j+2]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  *((uint64_t*)((_A+1)+j)) = *((uint64_t*)((_B+1)+j));
}
}
}
  return;
}


int main(int argc, char ** argv) {
  uint64_t dump_code = strtol(argv[1], ((uint8_t**)0), 10);
  double* A = malloc(800000000);
  double* B = malloc(800000000);
for(uint64_t i = 0; i < 100000000;   i = i + 1){
  ((double*)A)[i] = ((double)(i) + 2) / 1.0E+8;
  ((double*)B)[i] = ((double)(i) + 3) / 1.0E+8;
}
for(uint64_t i = 0; i < 100;   i = i + 1){
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=99999997; j = j + 1){
  B[j+1] = ((A[j] + A[j+1]) + A[j+2]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=99999997; j = j + 1){
  *((uint64_t*)((((double*)A)+1)+j)) = *((uint64_t*)((((double*)B)+1)+j));
}
}
}
  if (dump_code == 1) {
for(uint64_t i = 0; i < 100000000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)A)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(A);
free(B);
  return 0;
}

