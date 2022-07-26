
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
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)kernel_doitgen_polly_subfn), 0, ((_call_2e_i70 << 32) + -4294967296 >> 32) + 1, 1, (&_polly_2e_par_2e_userContext_2e_i));
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


static void kernel_doitgen_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _1 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _1;
  if (_polly_2e_par_2e_LBPtr > _1) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_1;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint32_t*)(_polly_2e_kmpc_2e_shared+4));  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
for(uint64_t _polly_2e_indvar12 = 0; _polly_2e_indvar_next13 < *((uint32_t*)(_polly_2e_kmpc_2e_shared+8));  _polly_2e_indvar_next13 = _polly_2e_indvar12 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(*((uint32_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4))))+(_polly_2e_indvar12 << 3))) = 0;
  double __p_scalar_57 = 0;
for(uint64_t _polly_2e_indvar22 = 0; _polly_2e_indvar_next23 < *((uint32_t*)(_polly_2e_kmpc_2e_shared+8));  _polly_2e_indvar_next23 = _polly_2e_indvar22 + 1){
  double _p_add = (__p_scalar_57 + *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+24))+(*((uint32_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4))))+(_polly_2e_indvar22 << 3))) * (*((double**)(_polly_2e_kmpc_2e_shared+32))+_polly_2e_indvar12)[_polly_2e_indvar22 * *((uint32_t*)(_polly_2e_kmpc_2e_shared+8))]);
}
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(*((uint32_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4))))+(_polly_2e_indvar12 << 3))) = _p_add;
}
for(uint64_t _polly_2e_indvar41 = 0; _polly_2e_indvar_next42 < *((uint32_t*)(_polly_2e_kmpc_2e_shared+8));  _polly_2e_indvar_next42 = _polly_2e_indvar41 + 1){
  *((uint64_t*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+24))+(*((uint32_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4))))+(_polly_2e_indvar41 << 3))) = *((uint64_t*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16))+(*((uint32_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * (_polly_2e_indvar4 + _polly_2e_indvar * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4))))+(_polly_2e_indvar41 << 3)));
}
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}

