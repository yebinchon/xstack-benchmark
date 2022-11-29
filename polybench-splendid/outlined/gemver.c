  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=29999; i = i + 1){
for(uint64_t j = 0; j < 30000;   j = j + 1){
  A[j+i * 30000] = ((A[j+i * 30000] + ((double*)u1)[i] * ((double*)v1)[j]) + ((double*)u2)[i] * ((double*)v2)[j]);
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=29999; i = i + 1){
  double __p_scalar_ = ((double*)x)[i];
for(uint64_t j = 0; j < 30000;   j = j + 1){
  __p_scalar_ = (__p_scalar_ + 12313 * A[j * 30000+i] * ((double*)y)[j]);
  ((double*)x)[i] = __p_scalar_;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=29999; i = i + 1){
  ((double*)x)[i] = (((double*)x)[i] + ((double*)z)[i]);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=29999; i = i + 1){
  double __p_scalar_ = ((double*)w)[i];
for(uint64_t j = 0; j < 30000;   j = j + 1){
  __p_scalar_ = (__p_scalar_ + 43532 * A[j+i * 30000] * ((double*)x)[j]);
  ((double*)w)[i] = __p_scalar_;
}
}
}
