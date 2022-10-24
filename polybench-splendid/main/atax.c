
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(12800000000);
  uint8_t* x = malloc(320000);
  uint8_t* y = malloc(320000);
for(uint64_t i = 0; i < 40000;   i = i + 1){
  *((double*)(x+(i << 3))) = (double)(i) * 3.1415926535897931;
}
  memset(y, 0, 320000);
for(uint64_t i = 0; i < 40000;   i = i + 1){
  double __2e_phiops_2e_0 = 0;
for(uint64_t j = 0; j < 40000;   j = j + 1){
  __2e_phiops_2e_0 = (__2e_phiops_2e_0 + *((double*)((_call2+i * 320000)+(j << 3))) * *((double*)(x+(j << 3))));
}
for(uint64_t j = 0; j < 40000;   j = j + 1){
  *((double*)(y+(j << 3))) = (*((double*)(y+(j << 3))) + __2e_phiops_2e_0 * *((double*)((_call2+i * 320000)+(j << 3))));
}
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 40000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)y)[i]);
  if (i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call2);
free(x);
free(y);
  return 0;
}

