  #pragma omp parallel 
{
uint64_t _2 = ((nr << 32) + -4294967296 >> 32) + 1;

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(_2 - 1); i = i + 1){
for(uint64_t j = 0; j < nq;   j = j + 1){
for(uint64_t k = 0; k < np;   k = k + 1){
  *((double*)((sum+(np << 3) * (j + i * nq))+(k << 3))) = 0;
  double __p_scalar_57 = 0;
for(uint64_t l = 0; l < np;   l = l + 1){
  __p_scalar_57 = (__p_scalar_57 + *((double*)((A+(np << 3) * (j + i * nq))+(l << 3))) * C4[l * np+k]);
}
  *((double*)((sum+(np << 3) * (j + i * nq))+(k << 3))) = __p_scalar_57;
}
for(uint64_t k = 0; k < np;   k = k + 1){
  *((uint64_t*)((A+(np << 3) * (j + i * nq))+(k << 3))) = *((uint64_t*)((sum+(np << 3) * (j + i * nq))+(k << 3)));
}
}
}
}
