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
void _ZL10init_arrayiiPdS_S_S_(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiddPdS_S_S_(uint32_t, uint32_t, double, double, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiPd(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z10kernel_tmpiiddPdS_S_S__OC_1(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_CiiddPdS_S_S__OC_2(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z10kernel_sumiiddPdS_S_S__OC_3(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* tmp;
  int32_t call38;
  int32_t call54;

  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  A = malloc(nj * nj * 8);
  B = malloc(ni * nj * 8);
  C = malloc(ni * nj * 8);
  tmp = malloc(ni * nj * 8);
  _ZL10init_arrayiiPdS_S_S_(ni, nj, ((double*)C), ((double*)A), ((double*)B), ((double*)tmp));
;
  _ZL6kerneliiddPdS_S_S_(ni, nj, 32412, 2123, ((double*)C), ((double*)A), ((double*)B), ((double*)tmp));
;
  if (dump_code == 1) {
_ZL11print_arrayiiPd(ni, nj, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


void _ZL10init_arrayiiPdS_S_S_(uint32_t ni, uint32_t nj, double* C, double* A, double* B, double* tmp) {
  int64_t i;
  int64_t j;

#pragma omp parallel
  {
#pragma omp for collapse(2)
for(int64_t i = 0; i < ni;   i = i + 1){

for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
  B[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
  tmp[(i * nj + j)] = 0;
}
}
#pragma omp for collapse(2) 
for(int64_t i = 0; i < nj;   i = i + 1){

for(int64_t j = 0; j < nj;   j = j + 1){
  A[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
}
  return;
}


void _ZL6kerneliiddPdS_S_S_(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp2;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp10;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp11;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp10_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp11_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp22;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp23;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp22_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp23_2e_coerce;    /* Address-exposed local */
  int32_t call;
  int32_t call1;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t call7;
  int32_t call9;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t* _7;
  uint8_t* _8;
  int32_t call19;
  int32_t call21;
  uint8_t* _9;
  uint8_t* _10;
  uint8_t* _11;
  uint8_t* _12;

  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call = _ZL10num_blocksii(m, block.field0);
  call1 = _ZL10num_blocksii(n, block.field1);
  call19 = _ZL10num_blocksii((m - 1), block.field0);
#pragma omp parallel
  {
#pragma omp for collapse(2) schedule(dynamic,4)
for(int32_t i = 0; i < call;   i = i + 1){

for(int32_t j = 0; j < call1;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z10kernel_tmpiiddPdS_S_S__OC_1(m, n, alpha, beta, C, A, B, tmp, call, call1, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
#pragma omp for collapse(2) schedule(dynamic,4)
for(int32_t i = 0; i < call;   i = i + 1){

for(int32_t j = 0; j < call1;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z8kernel_CiiddPdS_S_S__OC_2(m, n, alpha, beta, C, A, B, tmp, call, call1, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
#pragma omp for collapse(2) schedule(dynamic,4)
for(int32_t i = 0; i < call19;   i = i + 1){

for(int32_t j = 0; j < call1;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z10kernel_sumiiddPdS_S_S__OC_3(m, n, alpha, beta, C, A, B, tmp, call19, call1, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
}
  return;
}


void _ZL11print_arrayiiPd(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;
  int32_t call11;


for(int64_t i = 0; i < ni;   i = i + 1){

for(int64_t j = 0; j < nj;   j = j + 1){
  uint32_t call = fprintf(stderr, _OC_str, C[(i * nj + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
}
  fprintf(stderr, _OC_str_OC_1);
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z10kernel_tmpiiddPdS_S_S__OC_1(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < m) {
  if (j < n) {
  tmp[(i * n + j)] = 0;

for(int64_t k = 0; k < i;   k = k + 1){
  tmp[(i * n + j)] = (tmp[(i * n + j)] + (B[(k * n + j)] * A[(i * n + k)]));
}
  }
  }
  return;
}


void _Z8kernel_CiiddPdS_S_S__OC_2(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t i;
  int32_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < m) {
  if (j < n) {
  C[(i * n + j)] = (((beta * C[(i * n + j)]) + ((alpha * B[(i * n + j)]) * A[(i * n + i)])) + (alpha * tmp[(i * n + j)]));
  }
  }
  return;
}


void _Z10kernel_sumiiddPdS_S_S__OC_3(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t k;
  int32_t j;
  int64_t i;

  k = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (k < (m - 1)) {
  if (j < n) {
  i = k + 1;

for(int64_t i = k + 1; i < m;   i = i + 1){
  C[(k * n + j)] = (C[(k * n + j)] + ((alpha * B[(i * n + j)]) * A[(i * n + k)]));
}
  }
  }
  return;
}

