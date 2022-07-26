
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i99 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call4 = malloc((_call_2e_i << 3) * _call_2e_i);
  uint8_t* _call7 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call10 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call13 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call16 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call19 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call22 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call25 = malloc((_call_2e_i << 32) >> 29);
  uint8_t* _call28 = malloc((_call_2e_i << 32) >> 29);
  memset(_call22, 0, (_call_2e_i << 3));
  memset(_call19, 0, (_call_2e_i << 3));
for(uint64_t _indvars_2e_iv90_2e_i = 0; _indvars_2e_iv_2e_next91_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next91_2e_i = _indvars_2e_iv90_2e_i + 1){
  ((double*)_call7)[_indvars_2e_iv90_2e_i] = (double)(_indvars_2e_iv90_2e_i);
  ((double*)_call13)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) * 0.5;
  ((double*)_call10)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) * 0.25;
  ((double*)_call16)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) / 6;
  ((double*)_call25)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) * 0.125;
  ((double*)_call28)[_indvars_2e_iv90_2e_i] = (double)((_indvars_2e_iv_2e_next91_2e_i + 1) / _call_2e_i) / 9;
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call4)+_indvars_2e_iv90_2e_i * _call_2e_i)[_indvars_2e_iv_2e_i] = (double)(_indvars_2e_iv90_2e_i) * (double)(_indvars_2e_iv_2e_i) / (double)(_call_2e_i);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  (((double*)_call4)+_polly_2e_indvar * _call_2e_i)[_polly_2e_indvar4] = (((((double*)_call4)+_polly_2e_indvar * _call_2e_i)[_polly_2e_indvar4] + ((double*)_call7)[_polly_2e_indvar] * ((double*)_call10)[_polly_2e_indvar4]) + ((double*)_call13)[_polly_2e_indvar] * ((double*)_call16)[_polly_2e_indvar4]);
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  double __p_scalar_ = ((double*)_call22)[_polly_2e_indvar];
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  double _p_add39 = (__p_scalar_ + 12313 * (((double*)_call4)+_polly_2e_indvar)[_polly_2e_indvar4 * _call_2e_i] * ((double*)_call25)[_polly_2e_indvar4]);
  ((double*)_call22)[_polly_2e_indvar] = _p_add39;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  ((double*)_call22)[_polly_2e_indvar] = (((double*)_call22)[_polly_2e_indvar] + ((double*)_call28)[_polly_2e_indvar]);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  double __p_scalar_ = ((double*)_call19)[_polly_2e_indvar];
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  double _p_add77 = (__p_scalar_ + 43532 * (((double*)_call4)+_polly_2e_indvar * _call_2e_i)[_polly_2e_indvar4] * ((double*)_call22)[_polly_2e_indvar4]);
  ((double*)_call19)[_polly_2e_indvar] = _p_add77;
}
}
}
  if (_call_2e_i99 == 1) {
for(uint64_t _indvars_2e_iv_2e_i102 = 0; _indvars_2e_iv_2e_next_2e_i105 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i105 = _indvars_2e_iv_2e_i102 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call19)[_indvars_2e_iv_2e_i102]);
  if (_indvars_2e_iv_2e_i102 % 20 == 0) {
  fputc(10, stderr);
}

}
}

free(_call4);
free(_call7);
free(_call10);
free(_call13);
free(_call16);
free(_call19);
free(_call22);
free(_call25);
free(_call28);
  return 0;
}

