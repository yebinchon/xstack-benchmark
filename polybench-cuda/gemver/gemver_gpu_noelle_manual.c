/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__)
#define  __ATTRIBUTELIST__(x) __attribute__(x)
#else
#define  __ATTRIBUTELIST__(x)
#endif

#ifdef _MSC_VER  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC__IO_FILE;
struct l_struct_struct_OC_dim3;
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};
struct l_struct_struct_OC_dim3 {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};
struct l_unnamed_1 {
  uint64_t field0;
  uint32_t field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiPdS_S_S_S_S_S_S_S_(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliddPdS_S_S_S_S_S_S_S_(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };

/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t n;
  int32_t dump_code;
  uint32_t i;

  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);

for(int32_t i = 0; i < 50;   ++i){
  uint8_t* A = malloc(n * n * 8);
  uint8_t* u1 = malloc(n * 8);
  uint8_t* v1 = malloc(n * 8);
  uint8_t* u2 = malloc(n * 8);
  uint8_t* v2 = malloc(n * 8);
  uint8_t* w = malloc(n * 8);
  uint8_t* x = malloc(n * 8);
  uint8_t* y = malloc(n * 8);
  uint8_t* z = malloc(n * 8);
  _ZL10init_arrayiPdS_S_S_S_S_S_S_S_(n, ((double*)A), ((double*)u1), ((double*)v1), ((double*)u2), ((double*)v2), ((double*)w), ((double*)x), ((double*)y), ((double*)z));
;
#pragma omp target data map(to: y[0:n * 8], z[0:n * 8], A[0:n * n * 8], u1[0:n * 8], v1[0:n * 8], u2[0:n * 8], v2[0:n * 8], x[0:n * 8]) map(from: w[0:n * 8])
{
  _ZL6kerneliddPdS_S_S_S_S_S_S_S_(n, 43532, 12313, ((double*)A), ((double*)u1), ((double*)v1), ((double*)u2), ((double*)v2), ((double*)w), ((double*)x), ((double*)y), ((double*)z));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)w));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)u1)));
free(((uint8_t*)((double*)v1)));
free(((uint8_t*)((double*)u2)));
free(((uint8_t*)((double*)v2)));
free(((uint8_t*)((double*)w)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)z)));
  }
}
  return 0;
}


void _ZL10init_arrayiPdS_S_S_S_S_S_S_S_(uint32_t n, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
#pragma omp parallel
{
#pragma omp for schedule(static) nowait
for(int64_t i = 0; i < n;   ++i){
  u1[i] = (double)(i);
  u2[i] = ((double)((i + 1) / n) / 2);
  v1[i] = ((double)((i + 1) / n) / 4);
  v2[i] = ((double)((i + 1) / n) / 6);
  y[i] = ((double)((i + 1) / n) / 8);
  z[i] = ((double)((i + 1) / n) / 9);
  x[i] = 0;
  w[i] = 0;
}

#pragma omp for collapse(2) schedule(static) nowait
for(int64_t i = 0; i < n;   ++i){
for(int64_t j = 0; j < n;   ++j){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
}
  return;
}


void _ZL6kerneliddPdS_S_S_S_S_S_S_S_(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {

#pragma omp target teams distribute parallel for collapse(2) //thread_limit(256)

for(int32_t i = 0; i < n;   ++i){

for(int32_t j = 0; j < n;   ++j){
//#pragma omp parallel for collapse(2)

_Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, i, j);
}
}
#pragma omp target teams distribute parallel for //thread_limit(256)

for(int32_t i = 0; i < n;   ++i){
//#pragma omp parallel for
_Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, i);
}
#pragma omp target teams distribute parallel for //thread_limit(256)

for(int32_t i = 0; i < n;   ++i){
//#pragma omp parallel for
_Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, i);
}
#pragma omp target teams distribute parallel for //thread_limit(256)

for(int32_t i = 0; i < n;   ++i){
//#pragma omp parallel for
_Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, i);
}
  return;
}


void _ZL11print_arrayiPd(uint32_t n, double* w) {
  int64_t i;


for(int64_t i = 0; i < n;   ++i){
  uint32_t call = fprintf(stderr, _OC_str, w[i]);
  if (i % 20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
  return;
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t i, uint32_t j) {
  //int64_t i;
  //int64_t j;

  //i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  //if (i < n) {
  //if (j < n) {
  A[(i * n + j)] = (A[(i * n + j)] + ((u1[i] * v1[j]) + (u2[i] * v2[j])));
  //}
  //}
  return;
}


void _Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t i) {
  //int64_t i;
  //int64_t j;

  //i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //if (i < n) {

for(int64_t j = 0; j < n;   ++j){
  x[i] = (x[i] + ((beta * A[(j * n + i)]) * y[j]));
}
  //}
  return;
}


void _Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t i) {
  //int64_t i;

  //i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //if (i < n) {
  x[i] = (x[i] + z[i]);
  //}
  return;
}


void _Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t i) {
  //int64_t i;
  //int64_t j;

  //i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  //if (i < n) {

for(int64_t j = 0; j < n;   ++j){
  w[i] = (w[i] + ((alpha * A[(i * n + j)]) * x[j]));
}
  //}
  return;
}

