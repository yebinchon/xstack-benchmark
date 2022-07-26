
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i44 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i46 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint8_t* _call6 = malloc((_call_2e_i44 << 3) * _call_2e_i44);
  uint8_t* _call10 = malloc((_call_2e_i44 << 3) * _call_2e_i44);
for(uint64_t _indvars_2e_iv48_2e_i = 0; _indvars_2e_iv_2e_next49_2e_i < _call_2e_i44;  _indvars_2e_iv_2e_next49_2e_i = _indvars_2e_iv48_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i44;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call6)+_indvars_2e_iv48_2e_i * _call_2e_i44)[_indvars_2e_iv_2e_i] = ((double)(_indvars_2e_iv48_2e_i) * (double)((_indvars_2e_iv_2e_i + 2)) + 2) / (double)(_call_2e_i44);
  (((double*)_call10)+_indvars_2e_iv48_2e_i * _call_2e_i44)[_indvars_2e_iv_2e_i] = ((double)(_indvars_2e_iv48_2e_i) * (double)((_indvars_2e_iv_2e_i + 3)) + 3) / (double)(_call_2e_i44);
}
}
for(uint64_t _polly_2e_indvar_2e_i = 0; _polly_2e_indvar_next_2e_i < _call_2e_i46;  _polly_2e_indvar_next_2e_i = _polly_2e_indvar_2e_i + 1){
  _polly_2e_par_2e_userContext_2e_i.field2 = _polly_2e_indvar_2e_i;
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)kernel_jacobi_2d_imper_polly_subfn), 0, _call_2e_i44 + -2, 1, (&_polly_2e_par_2e_userContext_2e_i));
  _polly_2e_par_2e_userContext134_2e_i.field2 = _polly_2e_indvar_2e_i;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)kernel_jacobi_2d_imper_polly_subfn_4), 0, _call_2e_i44 + -2, 1, (&_polly_2e_par_2e_userContext134_2e_i));
}
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv32_2e_i = 0; _indvars_2e_iv_2e_next33_2e_i < _call_2e_i44;  _indvars_2e_iv_2e_next33_2e_i = _indvars_2e_iv32_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i52 = 0; _indvars_2e_iv_2e_next_2e_i55 < _call_2e_i44;  _indvars_2e_iv_2e_next_2e_i55 = _indvars_2e_iv_2e_i52 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call6)+_indvars_2e_iv32_2e_i * _call_2e_i44)[_indvars_2e_iv_2e_i52]);
  if ((int)(_indvars_2e_iv32_2e_i * _call_2e_i44 + _indvars_2e_iv_2e_i52) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call6);
free(_call10);
  return 0;
}


static void kernel_jacobi_2d_imper_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
  if (*((uint32_t*)(_polly_2e_kmpc_2e_shared+4)) > 2) {
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)) + -2;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((((uint8_t*)(*((double**)(_polly_2e_kmpc_2e_shared+24))+1))+((_polly_2e_indvar << 3) + 8) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3))) = ((((*((double*)((((uint8_t*)(*((double**)(_polly_2e_kmpc_2e_shared+16))+1))+((_polly_2e_indvar << 3) + 8) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3))) + *((double*)((((uint8_t*)*((double**)(_polly_2e_kmpc_2e_shared+16)))+((_polly_2e_indvar << 3) + 8) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3)))) + *((double*)((((uint8_t*)(*((double**)(_polly_2e_kmpc_2e_shared+16))+2))+((_polly_2e_indvar << 3) + 8) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3)))) + *((double*)((((uint8_t*)(*((double**)(_polly_2e_kmpc_2e_shared+16))+1))+((_polly_2e_indvar << 3) + 16) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3)))) + ((*((double**)(_polly_2e_kmpc_2e_shared+16))+1)+_polly_2e_indvar * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))[_polly_2e_indvar4]) * 0.20000000000000001;
}
}

}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void kernel_jacobi_2d_imper_polly_subfn_4(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  _polly_2e_par_2e_LBPtr = _polly_2e_kmpc_2e_lb;
  _polly_2e_par_2e_UBPtr = _polly_2e_kmpc_2e_ub;
  _polly_2e_par_2e_lastIterPtr = 0;
  _polly_2e_par_2e_StridePtr = _polly_2e_kmpc_2e_inc;
__kmpc_for_static_init_8((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid, 34, (&_polly_2e_par_2e_lastIterPtr), (&_polly_2e_par_2e_LBPtr), (&_polly_2e_par_2e_UBPtr), (&_polly_2e_par_2e_StridePtr), 1, 1);
  uint64_t _2 = llvm_select_u64(_polly_2e_par_2e_UBPtr < _polly_2e_kmpc_2e_ub + -1, _polly_2e_par_2e_UBPtr, _polly_2e_kmpc_2e_ub + -1);
  _polly_2e_par_2e_UBPtr = _2;
  if (_polly_2e_par_2e_LBPtr > _2) {
}
for(uint64_t _polly_2e_indvar = _polly_2e_par_2e_LBPtr; _polly_2e_indvar_next<=_2;  _polly_2e_indvar_next = _polly_2e_indvar + _polly_2e_kmpc_2e_inc){
  if (*((uint32_t*)(_polly_2e_kmpc_2e_shared+4)) > 2) {
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)) + -2;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((uint64_t*)((((uint8_t*)(*((double**)(_polly_2e_kmpc_2e_shared+24))+1))+((_polly_2e_indvar << 3) + 8) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3))) = *((uint64_t*)((((uint8_t*)(*((double**)(_polly_2e_kmpc_2e_shared+16))+1))+((_polly_2e_indvar << 3) + 8) * *((uint32_t*)(_polly_2e_kmpc_2e_shared+4)))+(_polly_2e_indvar4 << 3)));
}
}

}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}

