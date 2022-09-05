
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t ni = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t nj = strtol(_argv[3], ((uint8_t**)0), 10);
  uint8_t* C = malloc((ni << 3) * ni);
  uint8_t* A = malloc(nj * (ni << 3));
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1);i+=1){
for(uint64_t j = 0; j < nj;  j = j + 1){
  *((double*)((A+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1);i+=1){
for(uint64_t j = 0; j < ni;  j = j + 1){
  *((double*)((C+(ni << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1);i+=1){
for(uint64_t j = 0; j < ni;  j = j + 1){
  *((double*)((C+(ni << 3) * i)+(j << 3))) = *((double*)((C+(ni << 3) * i)+(j << 3))) * 2123;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1);i+=1){
for(uint64_t j = 0; j < ni;  j = j + 1){
for(uint64_t k = 0; k < nj;  k = k + 1){
  ((double*)C)[(i * ni + j)] = (((double*)C)[(i * ni + j)] + *((double*)((A+(nj << 3) * i)+(k << 3))) * 32412 * *((double*)((A+(nj << 3) * j)+(k << 3))));
}
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < ni;  i = i + 1){
for(uint64_t j = 0; j < ni;  j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)C)+i * ni)[j]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(C);
free(A);
  return 0;
}
