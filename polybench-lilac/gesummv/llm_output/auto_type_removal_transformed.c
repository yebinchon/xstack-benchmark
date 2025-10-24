/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define THREADS_PER_BLOCK_X 256
#define DIM3_SIZE_BYTES 12
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define DEFAULT_ALPHA 43532
#define DEFAULT_BETA 12313
#define PRINT_ITEMS_PER_LINE 20
#define ARG_IDX_N 2
#define ARG_IDX_DUMP_CODE 1

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
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[PRINTF_FMT_STR_LEN] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[NEWLINE_STR_LEN] = { "\n" };


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
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp53;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp53_2e_coerce;    /* Address-exposed local */
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  uint8_t* tmp;
  uint8_t* x;
  uint8_t* y;
  int32_t __FIXME__call52;
  uint32_t i;
  uint32_t j;

  n = atoi(argv[ARG_IDX_N]);
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  B = malloc(n * n * BYTES_PER_DOUBLE);
  tmp = malloc(n * BYTES_PER_DOUBLE);
  x = malloc(n * BYTES_PER_DOUBLE);
  y = malloc(n * BYTES_PER_DOUBLE);
init_array(n, ((double*)A), ((double*)B), ((double*)x));
  __FIXME__call52 = num_blocks(n, THREADS_PER_BLOCK_X);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call52;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp53.__FIXME__l_struct_struct_OC_dim3_field0 = THREADS_PER_BLOCK_X;
  __FIXME__agg_2e_tmp53.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp53.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp53_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp53)), DIM3_SIZE_BYTES);
// INSERT COMMENT LOOP: main::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call52;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
kernel_y(n, DEFAULT_ALPHA, DEFAULT_BETA, ((double*)A), ((double*)B), ((double*)tmp), ((double*)x), ((double*)y), __FIXME__call52, 1, 1, THREADS_PER_BLOCK_X, 1, 1, i, 0, 0, j, 0, 0);
}
}
// INSERT COMMENT IFELSE: main::kcall.end
  if (dump_code == 1) { // IFELSE MARKER: kcall.end IF
print_array(n, ((double*)y));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* B, double* x) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  x[i] = ((double)(i) / (double)(n));
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
  B[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_y
void kernel_y(uint32_t n, double alpha, double beta, double* A, double* B, double* tmp, double* x, double* y, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_y::entry
  int __FIXME__tmp1 = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x;
  uint32_t __FIXME__tmp2 = __FIXME__threadIdx_2e_x;
  int __FIXME__tmp3 = __FIXME__tmp1 + __FIXME__tmp2;
  int __FIXME__tmp4 = __FIXME__tmp3;
  i = __FIXME__tmp4;
  if (i < n) { // IFELSE MARKER: entry IF
  tmp[i] = 0;
  y[i] = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  int __FIXME__tmp5 = i * n + j;
  double __FIXME__tmp6 = A[__FIXME__tmp5];
  double __FIXME__tmp7 = x[j];
  double __FIXME__tmp8 = __FIXME__tmp6 * __FIXME__tmp7;
  double __FIXME__tmp9 = tmp[i];
  double __FIXME__tmp10 = __FIXME__tmp9 + __FIXME__tmp8;
  tmp[i] = __FIXME__tmp10;
  int __FIXME__tmp11 = i * n + j;
  double __FIXME__tmp12 = B[__FIXME__tmp11];
  double __FIXME__tmp13 = x[j];
  double __FIXME__tmp14 = __FIXME__tmp12 * __FIXME__tmp13;
  double __FIXME__tmp15 = y[i];
  double __FIXME__tmp16 = __FIXME__tmp15 + __FIXME__tmp14;
  y[i] = __FIXME__tmp16;
}
  y[i] = ((alpha * tmp[i]) + (beta * y[i]));
  }
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* y) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), y[i]);
  if (i % PRINT_ITEMS_PER_LINE == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
  return;
}
