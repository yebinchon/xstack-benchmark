  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
for(uint64_t j = 0; j < n;  j = j + 1){
  (((double*)A)+i * n)[j] = (((((double*)A)+i * n)[j] + ((double*)u1)[i] * ((double*)v1)[j]) + ((double*)u2)[i] * ((double*)v2)[j]);
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
  double __p_scalar_ = ((double*)x)[i];
for(uint64_t j = 0; j < n;  j = j + 1){
  __p_scalar_ = (__p_scalar_ + 12313 * (((double*)A)+i)[j * n] * ((double*)y)[j]);
  ((double*)x)[i] = __p_scalar_;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
  ((double*)x)[i] = (((double*)x)[i] + ((double*)z)[i]);
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
  double __p_scalar_ = ((double*)w)[i];
for(uint64_t j = 0; j < n;  j = j + 1){
  __p_scalar_ = (__p_scalar_ + 43532 * (((double*)A)+i * n)[j] * ((double*)x)[j]);
  ((double*)w)[i] = __p_scalar_;
}
}
}
