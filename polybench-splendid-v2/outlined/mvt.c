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
