
void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
for(uint64_t i = 0; i < _tsteps;  i = i + 1){
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(_2 - 1);i+=1){
  (_B+1)[i] = ((_A[i] + (_A+1)[i]) + (_A+2)[i]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(_2 - 1);i+=1){
  *((uint64_t*)((_A+1)+i)) = *((uint64_t*)((_B+1)+i));
}
}
}
  return;
}


int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t n = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t tsteps = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t dump_code = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* A = malloc((n << 32) >> 29);
  uint8_t* B = malloc((n << 32) >> 29);
for(uint64_t i = 0; i < n;  i = i + 1){
  ((double*)A)[i] = ((double)(i) + 2) / (double)(n);
  ((double*)B)[i] = ((double)(i) + 3) / (double)(n);
}
  if (tsteps > 0) {
for(uint64_t i = 0; i < (tsteps << 32) >> 32;  i = i + 1){
  #pragma omp parallel 
{
uint64_t _5 = ((n << 32) >> 32) + -2;

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(_5 - 1);i+=1){
  (((double*)B)+1)[i] = ((((double*)A)[i] + (((double*)A)+1)[i]) + (((double*)A)+2)[i]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{
uint64_t _5 = ((n << 32) >> 32) + -2;

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(_5 - 1);i+=1){
  *((uint64_t*)((((double*)A)+1)+i)) = *((uint64_t*)((((double*)B)+1)+i));
}
}
}
}

  if (dump_code == 1) {
for(uint64_t i = 0; i < n;  i = i + 1){
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

