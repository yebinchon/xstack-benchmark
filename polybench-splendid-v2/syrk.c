
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i47 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i49 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint8_t* _call9 = malloc((_call_2e_i47 << 3) * _call_2e_i47);
  uint8_t* _call13 = malloc(_call_2e_i49 * (_call_2e_i47 << 3));
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i47 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i49;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call13+(_call_2e_i49 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / _call_2e_i47;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i47 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i47;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call9+(_call_2e_i47 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar4) / _call_2e_i47;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i47 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i47;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call9+(_call_2e_i47 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = *((double*)((_call9+(_call_2e_i47 << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) * 2123;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i47 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i47;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
for(uint64_t _polly_2e_indvar12 = 0; _polly_2e_indvar_next13 < _call_2e_i49;  _polly_2e_indvar_next13 = _polly_2e_indvar12 + 1){
  ((double*)_call9)[(_polly_2e_indvar * _call_2e_i47 + _polly_2e_indvar4)] = (((double*)_call9)[(_polly_2e_indvar * _call_2e_i47 + _polly_2e_indvar4)] + *((double*)((_call13+(_call_2e_i49 << 3) * _polly_2e_indvar)+(_polly_2e_indvar12 << 3))) * 32412 * *((double*)((_call13+(_call_2e_i49 << 3) * _polly_2e_indvar4)+(_polly_2e_indvar12 << 3))));
}
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv32_2e_i = 0; _indvars_2e_iv_2e_next33_2e_i < _call_2e_i47;  _indvars_2e_iv_2e_next33_2e_i = _indvars_2e_iv32_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i55 = 0; _indvars_2e_iv_2e_next_2e_i58 < _call_2e_i47;  _indvars_2e_iv_2e_next_2e_i58 = _indvars_2e_iv_2e_i55 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call9)+_indvars_2e_iv32_2e_i * _call_2e_i47)[_indvars_2e_iv_2e_i55]);
  if ((int)(_indvars_2e_iv32_2e_i * _call_2e_i47 + _indvars_2e_iv_2e_i55) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call9);
free(_call13);
  return 0;
}

