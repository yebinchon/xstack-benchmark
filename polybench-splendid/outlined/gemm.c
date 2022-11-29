  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((C+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nk;   j = j + 1){
  *((double*)((_call17+(nk << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(nk - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  *((double*)((_call21+(nj << 3) * i)+(j << 3))) = (double)(i) * (double)(j) / ni;
}
}
}
  #pragma omp parallel 
{

#pragma omp for schedule(static) nowait
for(uint64_t i = 0; i<=(ni - 1); i = i + 1){
for(uint64_t j = 0; j < nj;   j = j + 1){
  ((double*)C)[(i * nj + j)] = *((double*)((C+(nj << 3) * i)+(j << 3))) * 2123;
for(uint64_t k = 0; k < nk;   k = k + 1){
  ((double*)C)[(i * nj + j)] = (((double*)C)[(i * nj + j)] + *((double*)((_call17+(nk << 3) * i)+(k << 3))) * 32412 * *((double*)((_call21+(j << 3))+(nj << 3) * k)));
}
}
}
}
