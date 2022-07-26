  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  (((double*)_call4)+_polly_2e_indvar * _call_2e_i)[_polly_2e_indvar4] = (((((double*)_call4)+_polly_2e_indvar * _call_2e_i)[_polly_2e_indvar4] + ((double*)_call7)[_polly_2e_indvar] * ((double*)_call10)[_polly_2e_indvar4]) + ((double*)_call13)[_polly_2e_indvar] * ((double*)_call16)[_polly_2e_indvar4]);
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  double __p_scalar_ = ((double*)_call22)[_polly_2e_indvar];
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  double _p_add39 = (__p_scalar_ + 12313 * (((double*)_call4)+_polly_2e_indvar)[_polly_2e_indvar4 * _call_2e_i] * ((double*)_call25)[_polly_2e_indvar4]);
  ((double*)_call22)[_polly_2e_indvar] = _p_add39;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  ((double*)_call22)[_polly_2e_indvar] = (((double*)_call22)[_polly_2e_indvar] + ((double*)_call28)[_polly_2e_indvar]);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  double __p_scalar_ = ((double*)_call19)[_polly_2e_indvar];
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar_next5 < _call_2e_i;  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  double _p_add77 = (__p_scalar_ + 43532 * (((double*)_call4)+_polly_2e_indvar * _call_2e_i)[_polly_2e_indvar4] * ((double*)_call22)[_polly_2e_indvar4]);
  ((double*)_call19)[_polly_2e_indvar] = _p_add77;
}
}
}
