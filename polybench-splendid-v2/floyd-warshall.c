
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i27 = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call4 = malloc((_call_2e_i << 3) * _call_2e_i);
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call4+(_call_2e_i << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)((_polly_2e_indvar + 1)) * (double)((_polly_2e_indvar4 + 1)) / _call_2e_i;
}
}
}
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < _call_2e_i;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
for(uint64_t _polly_2e_indvar50 = 0; _polly_2e_indvar_next51 < _call_2e_i;  _polly_2e_indvar_next51 = _polly_2e_indvar50 + 1){
for(uint64_t _polly_2e_indvar58 = 0; _polly_2e_indvar_next59 < _call_2e_i;  _polly_2e_indvar_next59 = _polly_2e_indvar58 + 1){
  *((double*)((_call4+_polly_2e_indvar50 * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))) = llvm_select_f64(llvm_fcmp_olt(*((double*)((_call4+_polly_2e_indvar50 * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))), (*((double*)((_call4+(_polly_2e_indvar << 3))+_polly_2e_indvar50 * (_call_2e_i << 3))) + *((double*)((_call4+_polly_2e_indvar * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))))), *((double*)((_call4+_polly_2e_indvar50 * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3))), (*((double*)((_call4+(_polly_2e_indvar << 3))+_polly_2e_indvar50 * (_call_2e_i << 3))) + *((double*)((_call4+_polly_2e_indvar * (_call_2e_i << 3))+(_polly_2e_indvar58 << 3)))));
}
}
}
  if (_call_2e_i27 == 1) {
for(uint64_t _indvars_2e_iv32_2e_i = 0; _indvars_2e_iv_2e_next33_2e_i < _call_2e_i;  _indvars_2e_iv_2e_next33_2e_i = _indvars_2e_iv32_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i33 = 0; _indvars_2e_iv_2e_next_2e_i36 < _call_2e_i;  _indvars_2e_iv_2e_next_2e_i36 = _indvars_2e_iv_2e_i33 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call4)+_indvars_2e_iv32_2e_i * _call_2e_i)[_indvars_2e_iv_2e_i33]);
  if ((int)(_indvars_2e_iv32_2e_i * _call_2e_i + _indvars_2e_iv_2e_i33) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call4);
  return 0;
}

