  #pragma omp parallel 
{
uint64_t _2 = _call_2e_i44 + -2;

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_2 - 1);_polly_2e_indvar+=1){
  if (_call_2e_i44 > 2) {
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i44 + -2;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((((uint8_t*)(((double*)_call10)+1))+((_polly_2e_indvar << 3) + 8) * _call_2e_i44)+(_polly_2e_indvar4 << 3))) = ((((*((double*)((((uint8_t*)(((double*)_call6)+1))+((_polly_2e_indvar << 3) + 8) * _call_2e_i44)+(_polly_2e_indvar4 << 3))) + *((double*)((((uint8_t*)(double*)_call6)+((_polly_2e_indvar << 3) + 8) * _call_2e_i44)+(_polly_2e_indvar4 << 3)))) + *((double*)((((uint8_t*)(((double*)_call6)+2))+((_polly_2e_indvar << 3) + 8) * _call_2e_i44)+(_polly_2e_indvar4 << 3)))) + *((double*)((((uint8_t*)(((double*)_call6)+1))+((_polly_2e_indvar << 3) + 16) * _call_2e_i44)+(_polly_2e_indvar4 << 3)))) + ((((double*)_call6)+1)+_polly_2e_indvar * _call_2e_i44)[_polly_2e_indvar4]) * 0.20000000000000001;
}
}

}
}
  #pragma omp parallel 
{
uint64_t _2 = _call_2e_i44 + -2;

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_2 - 1);_polly_2e_indvar+=1){
  if (_call_2e_i44 > 2) {
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i44 + -2;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((uint64_t*)((((uint8_t*)(((double*)_call6)+1))+((_polly_2e_indvar << 3) + 8) * _call_2e_i44)+(_polly_2e_indvar4 << 3))) = *((uint64_t*)((((uint8_t*)(((double*)_call10)+1))+((_polly_2e_indvar << 3) + 8) * _call_2e_i44)+(_polly_2e_indvar4 << 3)));
}
}

}
}
