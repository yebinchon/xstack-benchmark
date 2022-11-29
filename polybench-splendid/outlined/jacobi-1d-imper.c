  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  _B[j+1] = ((_A[j] + _A[j+1]) + _A[j+2]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{
uint64_t _2 = _n + -2;

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=(_2 - 1); j = j + 1){
  *((uint64_t*)((_A+1)+j)) = *((uint64_t*)((_B+1)+j));
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=99999997; j = j + 1){
  B[j+1] = ((A[j] + A[j+1]) + A[j+2]) * 0.33333000000000002;
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t j = 0; j<=99999997; j = j + 1){
  *((uint64_t*)((((double*)A)+1)+j)) = *((uint64_t*)((((double*)B)+1)+j));
}
}
