
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i70 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i72 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i74 = strtol(_argv[4], ((uint8_t**)0), 10);
  uint8_t* _call9 = malloc((_call_2e_i70 << 32) * _call_2e_i72 * _call_2e_i74 >> 29);
  uint8_t* _call14 = malloc((_call_2e_i70 << 32) * _call_2e_i72 * _call_2e_i74 >> 29);
  uint8_t* _call18 = malloc((_call_2e_i74 << 3) * _call_2e_i74);
for(uint64_t _indvars_2e_iv96_2e_i = 0; _indvars_2e_iv_2e_next97_2e_i < _call_2e_i70;  _indvars_2e_iv_2e_next97_2e_i = _indvars_2e_iv96_2e_i + 1){
for(uint64_t _indvars_2e_iv92_2e_i = 0; _indvars_2e_iv_2e_next93_2e_i < _call_2e_i72;  _indvars_2e_iv_2e_next93_2e_i = _indvars_2e_iv92_2e_i + 1){
for(uint64_t _indvars_2e_iv88_2e_i = 0; _indvars_2e_iv_2e_next89_2e_i < _call_2e_i74;  _indvars_2e_iv_2e_next89_2e_i = _indvars_2e_iv88_2e_i + 1){
  ((((double*)_call9)+_call_2e_i74 * _call_2e_i72 * _indvars_2e_iv96_2e_i)+_indvars_2e_iv92_2e_i * _call_2e_i74)[_indvars_2e_iv88_2e_i] = ((double)(_indvars_2e_iv96_2e_i) * (double)(_indvars_2e_iv92_2e_i) + (double)(_indvars_2e_iv88_2e_i)) / (double)(_call_2e_i74);
}
}
}
for(uint64_t _indvars_2e_iv84_2e_i = 0; _indvars_2e_iv_2e_next85_2e_i < _call_2e_i74;  _indvars_2e_iv_2e_next85_2e_i = _indvars_2e_iv84_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i74;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call18)+_indvars_2e_iv84_2e_i * _call_2e_i74)[_indvars_2e_iv_2e_i] = (double)(_indvars_2e_iv84_2e_i) * (double)(_indvars_2e_iv_2e_i) / (double)(_call_2e_i74);
}
}
  #pragma omp parallel 
{
uint64_t _2 = ((_call_2e_i70 << 32) + -4294967296 >> 32) + 1;

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_2 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i72;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
for(uint64_t _polly_2e_indvar12 = 0; _polly_2e_indvar_next13 < _call_2e_i74;  _polly_2e_indvar_next13 = _polly_2e_indvar12 + 1){
  *((double*)((_call14+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar12 << 3))) = 0;
  double __p_scalar_57 = 0;
for(uint64_t _polly_2e_indvar22 = 0; _polly_2e_indvar_next23 < _call_2e_i74;  _polly_2e_indvar_next23 = _polly_2e_indvar22 + 1){
  double _p_add = (__p_scalar_57 + *((double*)((_call9+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar22 << 3))) * (((double*)_call18)+_polly_2e_indvar12)[_polly_2e_indvar22 * _call_2e_i74]);
}
  *((double*)((_call14+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar12 << 3))) = _p_add;
}
for(uint64_t _polly_2e_indvar41 = 0; _polly_2e_indvar_next42 < _call_2e_i74;  _polly_2e_indvar_next42 = _polly_2e_indvar41 + 1){
  *((uint64_t*)((_call9+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar41 << 3))) = *((uint64_t*)((_call14+(_call_2e_i74 << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * _call_2e_i72))+(_polly_2e_indvar41 << 3)));
}
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv48_2e_i = 0; _indvars_2e_iv_2e_next49_2e_i < _call_2e_i70;  _indvars_2e_iv_2e_next49_2e_i = _indvars_2e_iv48_2e_i + 1){
for(uint64_t _indvars_2e_iv44_2e_i = 0; _indvars_2e_iv_2e_next45_2e_i < _call_2e_i72;  _indvars_2e_iv_2e_next45_2e_i = _indvars_2e_iv44_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i83 = 0; _indvars_2e_iv_2e_next_2e_i86 < _call_2e_i74;  _indvars_2e_iv_2e_next_2e_i86 = _indvars_2e_iv_2e_i83 + 1){
  fprintf(stderr, (_OC_str), ((((double*)_call9)+_call_2e_i74 * _call_2e_i72 * _indvars_2e_iv48_2e_i)+_indvars_2e_iv44_2e_i * _call_2e_i74)[_indvars_2e_iv_2e_i83]);
  if (_indvars_2e_iv48_2e_i % 20 == 0) {
  fputc(10, stderr);
}

}
}
}
  fputc(10, stderr);
}

free(_call9);
free(_call14);
free(_call18);
  return 0;
}

