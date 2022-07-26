  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(4000 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)((_call2+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) / 4000;
  *((double*)((_call6+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 2)) / 4000;
  *((double*)((_call10+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 3)) / 4000;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(3999 - 1);_polly_2e_indvar+=1){
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4 < (3999 + 1);  _polly_2e_indvar_next5 = _polly_2e_indvar4 + 1){
  *((double*)(((_call6+32000)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) = (*((double*)(((_call6+32000)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) - (*((double*)(((_call10+32000)+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3))) - *((double*)((_call10+_polly_2e_indvar * 32000)+(_polly_2e_indvar4 << 3)))) * 0.5);
}
}
}
