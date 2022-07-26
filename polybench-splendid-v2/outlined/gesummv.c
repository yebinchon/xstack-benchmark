  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_call_2e_i - 1);_polly_2e_indvar+=1){
  *((double*)(_call14+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) / _call_2e_i;
for(uint64_t _polly_2e_indvar5 = 0; _polly_2e_indvar_next6 < _call_2e_i;  _polly_2e_indvar_next6 = _polly_2e_indvar5 + 1){
  *((double*)((_call4+(_call_2e_i << 3) * _polly_2e_indvar)+(_polly_2e_indvar5 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar5) / _call_2e_i;
  *((double*)((_call8+(_call_2e_i << 3) * _polly_2e_indvar)+(_polly_2e_indvar5 << 3))) = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar5) / _call_2e_i;
}
}
}
