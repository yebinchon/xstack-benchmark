  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
for(uint64_t j = 0; j < n;  j = j + 1){
  *((double*)((path+(n << 3) * i)+(j << 3))) = (double)((i + 1)) * (double)((j + 1)) / n;
}
}
}
