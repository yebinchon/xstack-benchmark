
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t n = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i27 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* path = malloc((n << 3) * n);
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
for(uint64_t j = 0; j < n;  j = j + 1){
  *((double*)((path+(n << 3) * i)+(j << 3))) = (double)((i + 1)) * (double)((j + 1)) / n;
}
}
}
for(uint64_t i = 0; i < n;  i = i + 1){
for(uint64_t j = 0; j < n;  j = j + 1){
for(uint64_t k = 0; k < n;  k = k + 1){
  *((double*)((path+j * (n << 3))+(k << 3))) = llvm_select_f64(llvm_fcmp_olt(*((double*)((path+j * (n << 3))+(k << 3))), (*((double*)((path+(i << 3))+j * (n << 3))) + *((double*)((path+i * (n << 3))+(k << 3))))), *((double*)((path+j * (n << 3))+(k << 3))), (*((double*)((path+(i << 3))+j * (n << 3))) + *((double*)((path+i * (n << 3))+(k << 3)))));
}
}
}
  if (_call_2e_i27 == 1) {
for(uint64_t i = 0; i < n;  i = i + 1){
for(uint64_t j = 0; j < n;  j = j + 1){
  fprintf(stderr, (_OC_str), (((double*)path)+i * n)[j]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(path);
  return 0;
}

