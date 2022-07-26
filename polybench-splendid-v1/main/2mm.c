
int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  uint64_t _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
  uint64_t _call_2e_i116 = strtol(_argv[2], ((uint8_t**)0), 10);
  uint64_t _call_2e_i118 = strtol(_argv[3], ((uint8_t**)0), 10);
  uint64_t _call_2e_i120 = strtol(_argv[4], ((uint8_t**)0), 10);
  uint64_t _call_2e_i122 = strtol(_argv[5], ((uint8_t**)0), 10);
  uint8_t* _call10 = malloc(_call_2e_i118 * (_call_2e_i116 << 32) >> 29);
  uint8_t* _call14 = malloc(_call_2e_i120 * (_call_2e_i116 << 32) >> 29);
  uint8_t* _call18 = malloc(_call_2e_i120 * (_call_2e_i118 << 32) >> 29);
  uint8_t* _call22 = malloc(_call_2e_i122 * (_call_2e_i118 << 32) >> 29);
  uint8_t* _call26 = malloc(_call_2e_i122 * (_call_2e_i116 << 32) >> 29);
for(uint64_t _indvars_2e_iv172_2e_i = 0; _indvars_2e_iv_2e_next173_2e_i < _call_2e_i116;  _indvars_2e_iv_2e_next173_2e_i = _indvars_2e_iv172_2e_i + 1){
for(uint64_t _indvars_2e_iv168_2e_i = 0; _indvars_2e_iv_2e_next169_2e_i < _call_2e_i120;  _indvars_2e_iv_2e_next169_2e_i = _indvars_2e_iv168_2e_i + 1){
  (((double*)_call14)+_indvars_2e_iv172_2e_i * _call_2e_i122)[_indvars_2e_iv168_2e_i] = (double)(_indvars_2e_iv172_2e_i) * (double)(_indvars_2e_iv168_2e_i) / (double)(_call_2e_i116);
}
}
for(uint64_t _indvars_2e_iv164_2e_i = 0; _indvars_2e_iv_2e_next165_2e_i < _call_2e_i120;  _indvars_2e_iv_2e_next165_2e_i = _indvars_2e_iv164_2e_i + 1){
for(uint64_t _indvars_2e_iv160_2e_i = 0; _indvars_2e_iv_2e_next161_2e_i < _call_2e_i118;  _indvars_2e_iv_2e_next161_2e_i = _indvars_2e_iv160_2e_i + 1){
  (((double*)_call18)+_indvars_2e_iv164_2e_i * _call_2e_i118)[_indvars_2e_iv160_2e_i] = (double)(_indvars_2e_iv164_2e_i) * (double)((_indvars_2e_iv_2e_next161_2e_i + 1)) / (double)(_call_2e_i118);
}
}
for(uint64_t _indvars_2e_iv156_2e_i = 0; _indvars_2e_iv_2e_next157_2e_i < _call_2e_i122;  _indvars_2e_iv_2e_next157_2e_i = _indvars_2e_iv156_2e_i + 1){
for(uint64_t _indvars_2e_iv151_2e_i = 0; _indvars_2e_iv_2e_next152_2e_i < _call_2e_i118;  _indvars_2e_iv_2e_next152_2e_i = _indvars_2e_iv151_2e_i + 1){
  (((double*)_call22)+_indvars_2e_iv156_2e_i * _call_2e_i118)[_indvars_2e_iv151_2e_i] = (double)(_indvars_2e_iv156_2e_i) * (double)((_indvars_2e_iv151_2e_i + 3)) / (double)(_call_2e_i122);
}
}
for(uint64_t _indvars_2e_iv147_2e_i = 0; _indvars_2e_iv_2e_next148_2e_i < _call_2e_i116;  _indvars_2e_iv_2e_next148_2e_i = _indvars_2e_iv147_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i = 0; _indvars_2e_iv_2e_next_2e_i < _call_2e_i122;  _indvars_2e_iv_2e_next_2e_i = _indvars_2e_iv_2e_i + 1){
  (((double*)_call26)+_indvars_2e_iv147_2e_i * _call_2e_i122)[_indvars_2e_iv_2e_i] = (double)(_indvars_2e_iv147_2e_i) * (double)((_indvars_2e_iv_2e_i + 2)) / (double)(_call_2e_i120);
}
}
  _polly_2e_par_2e_userContext.field0 = _call_2e_i120;
  _polly_2e_par_2e_userContext.field1 = _call_2e_i118;
  _polly_2e_par_2e_userContext.field2 = _call_2e_i116;
  _polly_2e_par_2e_userContext.field3 = _call_2e_i122;
__kmpc_fork_call((&_OC_loc_OC_dummy), 4, ((l_fptr_1*)main_polly_subfn), 0, _call_2e_i116, 1, (&_polly_2e_par_2e_userContext));
  _polly_2e_par_2e_userContext158.field0 = _call_2e_i120;
  _polly_2e_par_2e_userContext158.field1 = _call_2e_i118;
  _polly_2e_par_2e_userContext158.field2 = _call_2e_i116;
  _polly_2e_par_2e_userContext158.field3 = _call_2e_i122;
__kmpc_fork_call((&_OC_loc_OC_dummy_OC_3), 4, ((l_fptr_1*)main_polly_subfn_4), 0, _call_2e_i116, 1, (&_polly_2e_par_2e_userContext158));
  if (_call_2e_i == 1) {
for(uint64_t _indvars_2e_iv31_2e_i = 0; _indvars_2e_iv_2e_next32_2e_i < _call_2e_i116;  _indvars_2e_iv_2e_next32_2e_i = _indvars_2e_iv31_2e_i + 1){
for(uint64_t _indvars_2e_iv_2e_i130 = 0; _indvars_2e_iv_2e_next_2e_i133 < _call_2e_i122;  _indvars_2e_iv_2e_next_2e_i133 = _indvars_2e_iv_2e_i130 + 1){
  fprintf(stderr, (_OC_str), (((double*)_call26)+_indvars_2e_iv31_2e_i * _call_2e_i122)[_indvars_2e_iv_2e_i130]);
  if ((int)(_indvars_2e_iv31_2e_i * _call_2e_i116 + _indvars_2e_iv_2e_i130) % (int)20 == 0) {
  fputc(10, stderr);
}

}
}
  fputc(10, stderr);
}

free(_call10);
free(_call14);
free(_call18);
free(_call22);
free(_call26);
  return 0;
}


static void main_polly_subfn(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint64_t*)(_polly_2e_kmpc_2e_shared+8));  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) = 0;
  ((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+32)))[(_polly_2e_indvar * *((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) + _polly_2e_indvar4)] = 0;
for(uint64_t _polly_2e_indvar15 = 0; _polly_2e_indvar_next16 < *((uint64_t*)_polly_2e_kmpc_2e_shared);  _polly_2e_indvar_next16 = _polly_2e_indvar15 + 1){
  ((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+32)))[(_polly_2e_indvar * *((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) + _polly_2e_indvar4)] = (((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+32)))[(_polly_2e_indvar * *((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) + _polly_2e_indvar4)] + *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+40))+(*((uint64_t*)_polly_2e_kmpc_2e_shared) << 3) * _polly_2e_indvar)+(_polly_2e_indvar15 << 3))) * 32412 * *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+48))+(_polly_2e_indvar4 << 3))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * _polly_2e_indvar15)));
}
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy), *_polly_2e_kmpc_2e_global_tid);
  return;
}


static void main_polly_subfn_4(uint32_t* _polly_2e_kmpc_2e_global_tid, uint32_t* _polly_2e_kmpc_2e_bound_tid, uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
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
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < *((uint64_t*)(_polly_2e_kmpc_2e_shared+24));  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  ((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+32)))[(_polly_2e_indvar * *((uint64_t*)(_polly_2e_kmpc_2e_shared+24)) + _polly_2e_indvar4)] = *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+32))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+24)) << 3) * _polly_2e_indvar)+(_polly_2e_indvar4 << 3))) * 2123;
for(uint64_t _polly_2e_indvar14 = 0; _polly_2e_indvar_next15 < *((uint64_t*)(_polly_2e_kmpc_2e_shared+8));  _polly_2e_indvar_next15 = _polly_2e_indvar14 + 1){
  ((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+32)))[(_polly_2e_indvar * *((uint64_t*)(_polly_2e_kmpc_2e_shared+24)) + _polly_2e_indvar4)] = (((double*)*((uint8_t**)(_polly_2e_kmpc_2e_shared+32)))[(_polly_2e_indvar * *((uint64_t*)(_polly_2e_kmpc_2e_shared+24)) + _polly_2e_indvar4)] + *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+40))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * _polly_2e_indvar)+(_polly_2e_indvar14 << 3))) * *((double*)((*((uint8_t**)(_polly_2e_kmpc_2e_shared+48))+(_polly_2e_indvar4 << 3))+(*((uint64_t*)(_polly_2e_kmpc_2e_shared+8)) << 3) * _polly_2e_indvar14)));
}
}
}
__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;

__kmpc_for_static_fini((&_OC_loc_OC_dummy_OC_3), *_polly_2e_kmpc_2e_global_tid);
  return;
}

