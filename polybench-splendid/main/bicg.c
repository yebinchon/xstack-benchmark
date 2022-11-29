
int main(int argc, char ** argv) {
  uint64_t _call_2e_i = strtol(argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(12800000000);
  uint8_t* s = malloc(320000);
  uint8_t* q = malloc(320000);
  uint8_t* p = malloc(320000);
  uint8_t* _call14 = malloc(320000);
for(uint64_t i = 0; i < 40000;   i = i + 1){
  *((double*)(p+(i << 3))) = (double)(i) * 3.1415926535897931;
}
  memset(s, 0, 320000);
for(uint64_t i = 0; i < 40000;   i = i + 1){
  ((double*)q)[i] = 0;
  double _polly_2e_access_2e_call8102_2e_reload = 0;
for(uint64_t j = 0; j < 40000;   j = j + 1){
  *((double*)(s+(j << 3))) = (*((double*)(s+(j << 3))) + ((double*)_call14)[i] * *((double*)((_call2+i * 320000)+(j << 3))));
  _polly_2e_access_2e_call8102_2e_reload = (_polly_2e_access_2e_call8102_2e_reload + *((double*)((_call2+i * 320000)+(j << 3))) * *((double*)(p+(j << 3))));
}
  ((double*)q)[i] = _polly_2e_access_2e_call8102_2e_reload;
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i < 40000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)s)[i]);
  if (i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
for(uint64_t i = 0; i < 40000;   i = i + 1){
  fprintf(stderr, (_OC_str), ((double*)q)[i]);
  if (i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call2);
free(s);
free(q);
free(p);
free(_call14);
  return 0;
}

