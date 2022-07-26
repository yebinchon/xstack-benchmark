
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint8_t* _call2 = malloc(12800000000);
  uint8_t* _call5 = malloc(320000);
  uint8_t* _call8 = malloc(320000);
  uint8_t* _call11 = malloc(320000);
  uint8_t* _call14 = malloc(320000);
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar_next < 40000;  _polly_2e_indvar_next = _polly_2e_indvar + 1){
  *((double*)(_call11+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
}
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, 40000, 1, (&_polly_2e_par_2e_userContext));
  memset(_call5, 0, 320000);
for(uint64_t _polly_2e_indvar77 = 0; _polly_2e_indvar_next78 < 40000;  _polly_2e_indvar_next78 = _polly_2e_indvar77 + 1){
  ((double*)_call8)[_polly_2e_indvar77] = 0;
  double _polly_2e_access_2e_call890_2e_reload = 0;
for(uint64_t _polly_2e_indvar86 = 0; _polly_2e_indvar_next87 < 40000;  _polly_2e_indvar_next87 = _polly_2e_indvar86 + 1){
  *((double*)(_call5+(_polly_2e_indvar86 << 3))) = (*((double*)(_call5+(_polly_2e_indvar86 << 3))) + ((double*)_call14)[_polly_2e_indvar77] * *((double*)((_call2+_polly_2e_indvar77 * 320000)+(_polly_2e_indvar86 << 3))));
  double _p_add28_2e_i = (_polly_2e_access_2e_call890_2e_reload + *((double*)((_call2+_polly_2e_indvar77 * 320000)+(_polly_2e_indvar86 << 3))) * *((double*)(_call11+(_polly_2e_indvar86 << 3))));
}
  ((double*)_call8)[_polly_2e_indvar77] = _p_add28_2e_i;
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv11_2e_i = 0; _indvars_2e_iv_2e_next12_2e_i < 40000;  _indvars_2e_iv_2e_next12_2e_i = _indvars_2e_iv11_2e_i + 1){
  fprintf(stderr, (_OC_str), ((double*)_call5)[_indvars_2e_iv11_2e_i]);
  if (_indvars_2e_iv11_2e_i % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
for(uint64_t _indvars_2e_iv_2e_i60 = 0; _indvars_2e_iv_2e_next_2e_i61 < 40000;  _indvars_2e_iv_2e_next_2e_i61 = _indvars_2e_iv_2e_i60 + 1){
  fprintf(stderr, (_OC_str), ((double*)_call8)[_indvars_2e_iv_2e_i60]);
  if (_indvars_2e_iv_2e_i60 % 20 == ((uint16_t)0)) {
  fputc(10, stderr);
}

}
  fputc(10, stderr);
}

free(_call2);
free(_call5);
free(_call8);
free(_call11);
free(_call14);
  return 0;
}


static void main_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _2 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _2;
  if (_polly_2e_par_2e_LBPtr > _2) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_2;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
  *((double*)(*((uint8_t**)(_polly_2e_kmpc_2e_shared+8))+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
for(uint64_t _polly_2e_indvar5 = 0; _polly_2e_indvar5 < (39999 + 1);  _polly_2e_indvar_next6 = _polly_2e_indvar5 + 1){
  *((double*)((*((uint8_t**)_polly_2e_kmpc_2e_shared)+_polly_2e_indvar * 320000)+(_polly_2e_indvar5 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar5 + 1)) / 4.0E+4;
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}

