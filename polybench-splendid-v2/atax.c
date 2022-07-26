
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i63 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i65 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call6 = malloc(_call_2e_i63 * (_call_2e_i << 32) >> 29);
  uint8_t* _call9 = malloc((_call_2e_i63 << 32) >> 29);
  uint8_t* _call12 = malloc((_call_2e_i << 32) >> 29);
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < _call_2e_i63;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
  *((double*)(_call9+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i63;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call6+(_call_2e_i63 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) / (double)(_call_2e_i);
}
}
}
  memset(_call12, 0, (_call_2e_i << 3));
for(uint64_t _polly_2e_indvar93 = 0; _polly_2e_indvar_next94 < _call_2e_i63;  _polly_2e_indvar_next94 = _polly_2e_indvar93 + 1){
  double __2e_phiops_2e_0 = 0;
for(uint64_t _polly_2e_indvar101 = 0; _polly_2e_indvar_next102 < _call_2e_i63;  _polly_2e_indvar_next102 = _polly_2e_indvar101 + 1){
  double _p_add_2e_i = (__2e_phiops_2e_0 + *((double*)((_call6+_polly_2e_indvar93 * (_call_2e_i63 << 3))+(_polly_2e_indvar101 << 3))) * *((double*)(_call9+(_polly_2e_indvar101 << 3))));
}
for(uint64_t _polly_2e_indvar115 = 0; _polly_2e_indvar_next116 < _call_2e_i63;  _polly_2e_indvar_next116 = _polly_2e_indvar115 + 1){
  *((double*)(_call12+(_polly_2e_indvar115 << 3))) = (*((double*)(_call12+(_polly_2e_indvar115 << 3))) + _p_add_2e_i * *((double*)((_call6+_polly_2e_indvar93 * (_call_2e_i63 << 3))+(_polly_2e_indvar115 << 3))));
}
}
  if (_call_2e_i65 == 1) {
for(uint64_t _indvars_2e_iv_2e_i68 = 0; _indvars_2e_iv_2e_next_2e_i72 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i72 = _indvars_2e_iv_2e_i68 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call12)[_indvars_2e_iv_2e_i68]);
  if (_indvars_2e_iv_2e_i68 % 20 == 0) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call6);
free(_call9);
free(_call12);
  return 0;
}

