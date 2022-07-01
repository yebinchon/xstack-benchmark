//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(4000 - 1);i+=1){
  *((double*)(x1+(i << 3))) = (double)(i) / 4000;
  *((double*)(x2+(i << 3))) = ((double)(i) + 1) / 4000;
  *((double*)(y_1+(i << 3))) = ((double)(i) + 3) / 4000;
  *((double*)(y_2+(i << 3))) = ((double)(i) + 4) / 4000;
for(uint64_t j = 0; j < (3999 + 1);  j = j + 1){
  *((double*)((A+i * 32000)+(j << 3))) = (double)(i) * (double)(j) / 4000;
}
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(4000 - 1);i+=1){
for(uint64_t j = 0; j < (3999 + 1);  j = j + 1){
  ((double*)x1)[i] = (((double*)x1)[i] + *((double*)((A+i * 32000)+(j << 3))) * *((double*)(y_1+(j << 3))));
}
}
}
//END OUTLINED
//START OUTLINED
  #pragma omp parallel 
{

#pragma omp for schedule(static)
for(uint64_t i = 0; i<=(4000 - 1);i+=1){
for(uint64_t j = 0; j < (3999 + 1);  j = j + 1){
  ((double*)x2)[i] = (((double*)x2)[i] + *((double*)((A+(i << 3))+j * 32000)) * *((double*)(y_2+(j << 3))));
}
}
}
//END OUTLINED
