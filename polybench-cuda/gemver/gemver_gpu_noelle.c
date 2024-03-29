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
void _Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;
  int32_t call62;
  int32_t call89;

  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * 8);
  u1 = malloc(n * 8);
  v1 = malloc(n * 8);
  u2 = malloc(n * 8);
  v2 = malloc(n * 8);
  w = malloc(n * 8);
  x = malloc(n * 8);
  y = malloc(n * 8);
  z = malloc(n * 8);
  _ZL10init_arrayiPdS_S_S_S_S_S_S_S_(n, ((double*)A), ((double*)u1), ((double*)v1), ((double*)u2), ((double*)v2), ((double*)w), ((double*)x), ((double*)y), ((double*)z));
;
#pragma omp target data map(to: A[0:n * n * 8], u1[0:n * 8], v1[0:n * 8], u2[0:n * 8], v2[0:n * 8], x[0:n * 8], y[0:n * 8], z[0:n * 8]) map(tofrom: w[0:n * 8])
{
  _ZL6kerneliddPdS_S_S_S_S_S_S_S_(n, 43532, 12313, ((double*)A), ((double*)u1), ((double*)v1), ((double*)u2), ((double*)v2), ((double*)w), ((double*)x), ((double*)y), ((double*)z));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)w));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)u1)));
free(((uint8_t*)((double*)v1)));
free(((uint8_t*)((double*)u2)));
free(((uint8_t*)((double*)v2)));
free(((uint8_t*)((double*)w)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)z)));
  return 0;
}


void _ZL10init_arrayiPdS_S_S_S_S_S_S_S_(uint32_t n, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  int64_t i;
  uint64_t j;

#pragma omp parallel for 
for(int64_t i = 0; i < n;   i = i + 1){
  u1[i] = (double)(i);
  u2[i] = ((double)((i + 1) / n) / 2);
  v1[i] = ((double)((i + 1) / n) / 4);
  v2[i] = ((double)((i + 1) / n) / 6);
  y[i] = ((double)((i + 1) / n) / 8);
  z[i] = ((double)((i + 1) / n) / 9);
  x[i] = 0;
  w[i] = 0;

for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}


void _ZL6kerneliddPdS_S_S_S_S_S_S_S_(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp6;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp8;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp13;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp15;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp20;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp22;    /* Address-exposed local */
  int32_t call;
  int32_t call3;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t call7;
  int32_t call14;
  int32_t call21;

  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call = _ZL10num_blocksii(n, block.field0);
  call3 = _ZL10num_blocksii(n, block.field1);
  grid.field0 = call;
  grid.field1 = call3;
  grid.field2 = 1;
#pragma omp target teams distribute collapse(2)

for(int32_t i = 0; i < call;   i = i + 1){

for(int32_t j = 0; j < call3;   j = j + 1){
#pragma omp parallel for collapse(2)

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, call, call3, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  call7 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp6.field0 = call7;
  agg_2e_tmp6.field1 = 1;
  agg_2e_tmp6.field2 = 1;
  agg_2e_tmp8.field0 = 256;
  agg_2e_tmp8.field1 = 1;
  agg_2e_tmp8.field2 = 1;
#pragma omp target teams distribute

for(int32_t i = 0; i < call7;   i = i + 1){
#pragma omp parallel for

for(int32_t j = 0; j < 256;   j = j + 1){
_Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, call7, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  call14 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp13.field0 = call14;
  agg_2e_tmp13.field1 = 1;
  agg_2e_tmp13.field2 = 1;
  agg_2e_tmp15.field0 = 256;
  agg_2e_tmp15.field1 = 1;
  agg_2e_tmp15.field2 = 1;
#pragma omp target teams distribute

for(int32_t i = 0; i < call14;   i = i + 1){
#pragma omp parallel for

for(int32_t j = 0; j < 256;   j = j + 1){
_Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, call14, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  call21 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp20.field0 = call21;
  agg_2e_tmp20.field1 = 1;
  agg_2e_tmp20.field2 = 1;
  agg_2e_tmp22.field0 = 256;
  agg_2e_tmp22.field1 = 1;
  agg_2e_tmp22.field2 = 1;
#pragma omp target teams distribute

for(int32_t i = 0; i < call21;   i = i + 1){
#pragma omp parallel for

for(int32_t j = 0; j < 256;   j = j + 1){
_Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, call21, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}


void _ZL11print_arrayiPd(uint32_t n, double* w) {
  int64_t i;


for(int64_t i = 0; i < n;   i = i + 1){
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


void _Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < n) {
  if (j < n) {
  A[(i * n + j)] = (A[(i * n + j)] + ((u1[i] * v1[j]) + (u2[i] * v2[j])));
  }
  }
  return;
}


void _Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {

for(int64_t j = 0; j < n;   j = j + 1){
  x[i] = (x[i] + ((beta * A[(j * n + i)]) * y[j]));
}
  }
  return;
}


void _Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {
  x[i] = (x[i] + z[i]);
  }
  return;
}


void _Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {

for(int64_t j = 0; j < n;   j = j + 1){
  w[i] = (w[i] + ((alpha * A[(i * n + j)]) * x[j]));
}
  }
  return;
}

