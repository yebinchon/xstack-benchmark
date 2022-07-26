  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_2 - 1);_polly_2e_indvar+=1){
  (_B+1)[_polly_2e_indvar] = ((_A[_polly_2e_indvar] + (_A+1)[_polly_2e_indvar]) + (_A+2)[_polly_2e_indvar]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_2 - 1);_polly_2e_indvar+=1){
  *((uint64_t*)((_A+1)+_polly_2e_indvar)) = *((uint64_t*)((_B+1)+_polly_2e_indvar));
}
}
  #pragma omp parallel 
{
uint64_t _5 = ((_call_2e_i << 32) >> 32) + -2;

#pragma omp for schedule(static) nowait
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_5 - 1);_polly_2e_indvar+=1){
  (((double*)_call8)+1)[_polly_2e_indvar] = ((((double*)_call5)[_polly_2e_indvar] + (((double*)_call5)+1)[_polly_2e_indvar]) + (((double*)_call5)+2)[_polly_2e_indvar]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{
uint64_t _5 = ((_call_2e_i << 32) >> 32) + -2;

#pragma omp for schedule(static) nowait
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_5 - 1);_polly_2e_indvar+=1){
  *((uint64_t*)((((double*)_call5)+1)+_polly_2e_indvar)) = *((uint64_t*)((((double*)_call8)+1)+_polly_2e_indvar));
}
}
