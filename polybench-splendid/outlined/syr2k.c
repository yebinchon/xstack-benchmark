  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((A+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
  *((double*)((B+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < ni;   j = j + 1){
  *((double*)((C+(ni << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < ni;   j = j + 1){
  *((double*)((C+(ni << 3) * i)+(j << 3))) = *((double*)((C+(ni << 3) * i)+(j << 3))) * 2123;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < ni;   j = j + 1){
for(uint64_t k = 0; k < nj;   k = k + 1){
  ((double*)C)[(i * ni + j)] = ((((double*)C)[(i * ni + j)] + *((double*)((A+(nj << 3) * i)+(k << 3))) * 32412 * *((double*)((B+(nj << 3) * j)+(k << 3)))) + *((double*)((B+(nj << 3) * i)+(k << 3))) * 32412 * *((double*)((A+(nj << 3) * j)+(k << 3))));
}
}
}
}
