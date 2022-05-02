void kernel_jacobi_1d_imper(uint32_t _tsteps, uint32_t _n, double* _A, double* _B) {
  uint32_t _1;
  uint32_t t;
  int64_t i;
  int64_t j;

  _1 = (_n + -1);
for(t = 0; !(t == _tsteps);  t = (t + 1)){
  if (_n > 2) {
  _B[i] = (((_A[(i + -1)]) + (_A[i])) + (_A[(i + 1)])) * 0.33333000000000002;
  if (_n > 2) {
  *((uint64_t*)(_A+j)) = (*((uint64_t*)(_B+j)));
}

}

for(i = 1; !(i == ((uint64_t)(uint32_t)_1));  i = (i + 1)){
}
for(j = 1; !(j == ((uint64_t)(uint32_t)_1));  j = (j + 1)){
}
}
  return;
  return;
}


int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i;
  uint8_t* _call1;
  uint8_t* _call4;
  int64_t i;
  uint32_t t;
  double _2;
  uint8_t* _3;
  double _4;
  struct l_struct_struct_OC__IO_FILE* _5;
  uint32_t _i_2e_05_2e_i;
  uint32_t _call_2e_i27;
  uint32_t _fputc3_2e_i;
  uint32_t _fputc_2e_i;

  _call_2e_i = strtol((_argv[1]), ((uint8_t**)0), 10);
;
  _call1 = malloc(80000);
;
  _call4 = malloc(80000);
;
for(i = 0; !(i == 10000);  i = (i + 1)){
  ((double*)_call1)[i] = (((double)(int32_t)((uint32_t)i)) + 2) / 1.0E+4;
  ((double*)_call4)[i] = (((double)(int32_t)((uint32_t)i)) + 3) / 1.0E+4;
}
for(t = 0; !(t == 100);  t = (t + 1)){
  _2 = (*((double*)(_call1+8)));
  _2 = (*((double*)_call1));
for(i = 1; !(i == 9999);  i = (i + 1)){
  ((double*)_call4)[i] = ((_2 + _2) + _2) * 0.33333000000000002;
  _2 = (((double*)_call1)[(i + 1)]);
}
  _3 = memcpy((_call1+8), (_call4+8), 79984);
;
}
  if (((uint32_t)_call_2e_i) == 1) {
  _4 = (*((double*)_call1));
  _5 = (stderr);
  _i_2e_05_2e_i = 0;
for(i = 0; !(i == 10000);  i = (i + 1)){
  _call_2e_i27 = fprintf(_5, (_OC_str), _4);
;
  if (((uint16_t)_i_2e_05_2e_i) % 20 == ((uint16_t)0)) {
  _fputc3_2e_i = fputc(10, (stderr));
;
}

  _i_2e_05_2e_i = (_i_2e_05_2e_i + 1);
  _4 = (((double*)_call1)[(i + 1)]);
  _5 = (stderr);
}
  _fputc_2e_i = fputc(10, _5);
;
}

free(_call1);
free(_call4);
  return 0;
}

