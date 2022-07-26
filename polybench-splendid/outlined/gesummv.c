  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(n - 1);i+=1){
  *((double*)(x+(i << 3))) = (double)(i) / n;
for(uint64_t j = 0; j < n;  j = j + 1){
  *((double*)((A+(n << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / n;
  *((double*)((B+(n << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / n;
}
}
}
