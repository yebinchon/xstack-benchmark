
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* ex = malloc(128000000);
  uint8_t* ey = malloc(128000000);
  uint8_t* hz = malloc(128000000);
  uint8_t* _fict_ = malloc(32000);
for(uint64_t i = 0; i < 4000;   i = i + 1){
  *((double*)(_fict_+(i << 3))) = (double)(i);
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=3999; i = i + 1){
for(uint64_t j = 0; j < (3999 + 1);   j = j + 1){
  *((double*)((ex+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 1)) / 4000;
  *((double*)((ey+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 2)) / 4000;
  *((double*)((hz+i * 32000)+(j << 3))) = (double)(i) * (double)((j + 3)) / 4000;
}
}
}
for(uint64_t i = 0; i < 100;   i = i + 1){
for(uint64_t j = 0; j < 4000;   j = j + 1){
  *((uint64_t*)(ey+(j << 3))) = *((uint64_t*)(_fict_+(i << 3)));
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=3998; j = j + 1){
for(uint64_t k = 0; k < (3999 + 1);   k = k + 1){
  *((double*)(((ey+32000)+j * 32000)+(k << 3))) = (*((double*)(((ey+32000)+j * 32000)+(k << 3))) - (*((double*)(((hz+32000)+j * 32000)+(k << 3))) - *((double*)((hz+j * 32000)+(k << 3)))) * 0.5);
}
}
}
for(uint64_t j = 0; j < 4000;   j = j + 1){
  double __2e_phiops_2e_0 = *((double*)(hz+j * 32000));
for(uint64_t k = 0; k < 3999;   k = k + 1){
  *((double*)(((ex+8)+j * 32000)+(k << 3))) = (*((double*)(((ex+8)+j * 32000)+(k << 3))) - (*((double*)(((hz+8)+j * 32000)+(k << 3))) - __2e_phiops_2e_0) * 0.5);
  __2e_phiops_2e_0 = *((double*)(((hz+8)+j * 32000)+(k << 3)));
}
}
for(uint64_t j = 0; j < 3999;   j = j + 1){
  double __2e_phiops135_2e_0 = *((double*)(ex+j * 32000));
for(uint64_t k = 0; k < 3999;   k = k + 1){
  *((double*)((hz+j * 32000)+(k << 3))) = (*((double*)((hz+j * 32000)+(k << 3))) - (((*((double*)(((ex+8)+j * 32000)+(k << 3))) - __2e_phiops135_2e_0) + *((double*)(((ey+32000)+j * 32000)+(k << 3)))) - *((double*)((ey+j * 32000)+(k << 3)))) * 0.69999999999999996);
  __2e_phiops135_2e_0 = *((double*)(((ex+8)+j * 32000)+(k << 3)));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 4000;   i = i + 1){
for(uint64_t j = 0; j < 4000;   j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)ex)+i * 4000)[j]);
  fprintf(stderr, (_OC_str), (((double*)ey)+i * 4000)[j]);
  fprintf(stderr, (_OC_str), (((double*)hz)+i * 4000)[j]);
  if ((j + i * 4000) % 20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(ex);
free(ey);
free(hz);
free(_fict_);
  return 0;
}

