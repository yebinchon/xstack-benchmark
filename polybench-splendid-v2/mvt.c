
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(128000000);
  uint8_t* _call5 = malloc(32000);
  uint8_t* _call8 = malloc(32000);
  uint8_t* _call11 = malloc(32000);
  uint8_t* _call14 = malloc(32000);
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(4000 - 1);_polly_2e_indvar+=1){
  *((double*)(_call5+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) / 4000;
  *((double*)(_call8+(_polly_2e_indvar << 3))) = ((double)(_polly_2e_indvar) + 1) / 4000;
  *((double*)(_call11+(_polly_2e_indvar << 3))) = ((double)(_polly_2e_indvar) + 3) / 4000;
  *((double*)(_call14+(_polly_2e_indvar << 3))) = ((double)(_polly_2e_indvar) + 4) / 4000;
for(uint64_t _polly_2e_indvar11 = 0; _polly_2e_indvar11 < (3999 + 1);  _polly_2e_indvar_next12 = _polly_2e_indvar11 + 1){
  *((double*)((_call2+_polly_2e_indvar * 32000)+(_polly_2e_indvar11 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar11) / 4000;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(4000 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  ((double*)_call5)[_polly_2e_indvar] = (((double*)_call5)[_polly_2e_indvar] + *((double*)((_call2+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) * *((double*)(_call11+(_polly_2e_indvar4 << 3))));
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(4000 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  ((double*)_call8)[_polly_2e_indvar] = (((double*)_call8)[_polly_2e_indvar] + *((double*)((_call2+(_polly_2e_indvar << 3))+_polly_2e_indvar4 * 32000)) * *((double*)(_call14+(_polly_2e_indvar4 << 3))));
}
}
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv_2e_i56 = 0; _indvars_2e_iv_2e_next_2e_i60 < 4000;  _indvars_2e_iv_2e_next_2e_i60 = _indvars_2e_iv_2e_i56 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call5)[_indvars_2e_iv_2e_i56]);
  fprintf(stderr, (_OC_str), ((double*)_call8)[_indvars_2e_iv_2e_i56]);
  if (_indvars_2e_iv_2e_i56 % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
}

free(_call2);
free(_call5);
free(_call8);
free(_call11);
free(_call14);
  return 0;
}

