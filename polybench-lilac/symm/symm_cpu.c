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
struct __FIXME__l_struct_struct_OC__IO_FILE;
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct __FIXME__l_array_1_uint8_t {
  uint8_t array[1];
};
struct __FIXME__l_array_20_uint8_t {
  uint8_t array[20];
};
struct __FIXME__l_struct_struct_OC__IO_FILE {
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field0;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field1;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field2;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field3;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field4;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field5;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field6;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field7;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field8;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field9;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field10;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field11;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field12;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field13;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field14;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field15;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field16;
  uint16_t __FIXME__l_struct_struct_OC__IO_FILE_field17;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field18;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field19[1];
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field20;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field21;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field22;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field23;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field24;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field25;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field26;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field27;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field28[20];
};
struct __FIXME__l_struct_struct_OC_dim3 {
  uint32_t __FIXME__l_struct_struct_OC_dim3_field0;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field1;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field2;
};
struct __FIXME__l_unnamed_1 {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double, double, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z10kernel_tmpiiddPdS_S_S__OC_1(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_CiiddPdS_S_S__OC_2(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z10kernel_sumiiddPdS_S_S__OC_3(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[8] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = { "\n" };


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
  int32_t __FIXME__call38;
  int32_t __FIXME__call54;

//INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  A = malloc(nj * nj * 8);
  B = malloc(ni * nj * 8);
  C = malloc(ni * nj * 8);
  tmp = malloc(ni * nj * 8);
  init_array(ni, nj, ((double*)C), ((double*)A), ((double*)B), ((double*)tmp));
;
  kernel(ni, nj, 32412, 2123, ((double*)C), ((double*)A), ((double*)B), ((double*)tmp));
;
  if (dump_code == 1) {
print_array(ni, nj, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


//INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, double* C, double* A, double* B, double* tmp) {
  int64_t i;
  int64_t j;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
  B[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
  tmp[(i * nj + j)] = 0;
}
}
//INSERT COMMENT LOOP: for.cond23
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  A[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
  return;
}


//INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp2;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp10;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp11;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp10_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp11_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp22;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp23;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp22_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp23_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  int32_t __FIXME__call1;
  uint8_t* __FIXME__1;
  uint8_t* __FIXME__2;
  uint8_t* __FIXME__3;
  uint8_t* __FIXME__4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call7;
  int32_t __FIXME__call9;
  uint8_t* __FIXME__5;
  uint8_t* __FIXME__6;
  uint8_t* __FIXME__7;
  uint8_t* __FIXME__8;
  int32_t __FIXME__call19;
  int32_t __FIXME__call21;
  uint8_t* __FIXME__9;
  uint8_t* __FIXME__10;
  uint8_t* __FIXME__11;
  uint8_t* __FIXME__12;

  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call = num_blocks(m, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call1 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call1;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), 12);
//INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call1;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
_Z10kernel_tmpiiddPdS_S_S__OC_1(m, n, alpha, beta, C, A, B, tmp, __FIXME__call, __FIXME__call1, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call7 = num_blocks(m, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call9 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call7;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call9;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp10)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp11)), 12);
//INSERT COMMENT LOOP: header.016
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call7;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call9;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
_Z8kernel_CiiddPdS_S_S__OC_2(m, n, alpha, beta, C, A, B, tmp, __FIXME__call7, __FIXME__call9, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call19 = num_blocks((m - 1), block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call21 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call19;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call21;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp22)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp23)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp22_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp22)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp23_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp23)), 12);
//INSERT COMMENT LOOP: header.036
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call19;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call21;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
_Z10kernel_sumiiddPdS_S_S__OC_3(m, n, alpha, beta, C, A, B, tmp, __FIXME__call19, __FIXME__call21, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}


//INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;
  int32_t __FIXME__call11;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint32_t __FIXME__call = fprintf(stderr, (__FIXME_GLOBAL___OC_str), C[(i * nj + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}


//INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


//INSERT COMMENT FUNCTION: kernel_tmp
void _Z10kernel_tmpiiddPdS_S_S__OC_1(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;

//INSERT COMMENT IFELSE: entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
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


//INSERT COMMENT FUNCTION: kernel_C
void _Z8kernel_CiiddPdS_S_S__OC_2(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

//INSERT COMMENT IFELSE: entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < m) {
  if (j < n) {
  C[(i * n + j)] = (((beta * C[(i * n + j)]) + ((alpha * B[(i * n + j)]) * A[(i * n + i)])) + (alpha * tmp[(i * n + j)]));
  }
  }
  return;
}


//INSERT COMMENT FUNCTION: kernel_sum
void _Z10kernel_sumiiddPdS_S_S__OC_3(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t k;
  int32_t j;
  int64_t i;

//INSERT COMMENT IFELSE: entry
  k = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
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

