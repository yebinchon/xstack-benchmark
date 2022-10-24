  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=39999; i = i + 1){
  *((double*)(x+(i << 3))) = (double)(i) / 4.0E+4;
for(uint64_t j = 0; j < (39999 + 1);   j = j + 1){
  *((double*)((A+i * 320000)+(j << 3))) = (double)(i) * (double)(j) / 4.0E+4;
  *((double*)((B+i * 320000)+(j << 3))) = (double)(i) * (double)(j) / 4.0E+4;
}
}
}
