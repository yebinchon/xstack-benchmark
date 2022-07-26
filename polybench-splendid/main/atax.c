
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t nx = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t ny = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i65 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call6 = malloc(ny * (nx << 32) >> 29);
  uint8_t* x = malloc((ny << 32) >> 29);
  uint8_t* y = malloc((nx << 32) >> 29);
for(uint64_t i = 0; i < ny;  i = i + 1){
  *((double*)(x+(i << 3))) = (double)(i) * 3.1415926535897931;
}
  memset(y, 0, (nx << 3));
for(uint64_t i = 0; i < ny;  i = i + 1){
  double __2e_phiops_2e_0 = 0;
for(uint64_t j = 0; j < ny;  j = j + 1){
  __2e_phiops_2e_0 = (__2e_phiops_2e_0 + *((double*)((_call6+i * (ny << 3))+(j << 3))) * *((double*)(x+(j << 3))));
}
for(uint64_t j = 0; j < ny;  j = j + 1){
  *((double*)(y+(j << 3))) = (*((double*)(y+(j << 3))) + __2e_phiops_2e_0 * *((double*)((_call6+i * (ny << 3))+(j << 3))));
}
}
  if (_call_2e_i65 == 1) {
for(uint64_t i = 0; i < nx;  i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)y)[i]);
  if (i % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call6);
free(x);
free(y);
  return 0;
}

