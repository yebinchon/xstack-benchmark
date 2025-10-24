/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define ARG_IDX_N 2
#define ARG_IDX_M 3
#define ARG_IDX_DUMP 1
#define DUMP_ENABLED_FLAG 1
#define DOUBLE_SIZE_BYTES 8
#define DEFAULT_ALPHA 32412
#define CONTRACT_BLOCK_DIM_X 256
#define DIM3_MEMCPY_SIZE 12
#define ALPHA_BLOCK_DIM_X 8
#define ALPHA_BLOCK_DIM_Y 32

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
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_contract(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_alpha(uint32_t, uint32_t, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */
int main(int argc, char ** argv) {
  double alpha;    /* Address-exposed local */
  int32_t n;
  int32_t m;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[ARG_IDX_N]);
  m = atoi(argv[ARG_IDX_M]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  A = malloc(n * m * DOUBLE_SIZE_BYTES);
  B = malloc(m * n * DOUBLE_SIZE_BYTES);
  init_array(n, m, (&alpha), ((double*)A), ((double*)B));
;
  kernel(n, m, alpha, ((double*)A), ((double*)B));
;
  if (dump_code == DUMP_ENABLED_FLAG) { // IFELSE MARKER: entry IF
print_array(m, n, ((double*)B));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, uint32_t m, double* alpha, double* A, double* B) {
  int64_t i;
  int64_t j;
  uint32_t __FIXME__j_2e_0;

  *alpha = DEFAULT_ALPHA;
// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  __auto_type __FIXME__tmp1 = i * (int64_t)m + j;
  __auto_type __FIXME__tmp2 = (double)i;
  __auto_type __FIXME__tmp3 = (double)j;
  __auto_type __FIXME__tmp4 = __FIXME__tmp2 * __FIXME__tmp3;
  __auto_type __FIXME__tmp5 = (double)m;
  __auto_type __FIXME__tmp6 = __FIXME__tmp4 / __FIXME__tmp5;
  A[(i * m + j)] = __FIXME__tmp6;
  __auto_type __FIXME__tmp7 = j * (int64_t)n + j;
  __auto_type __FIXME__tmp8 = (double)i;
  __auto_type __FIXME__tmp9 = (double)j;
  __auto_type __FIXME__tmp10 = __FIXME__tmp8 * __FIXME__tmp9;
  __auto_type __FIXME__tmp11 = (double)n;
  __auto_type __FIXME__tmp12 = __FIXME__tmp10 / __FIXME__tmp11;
  B[(j * n + j)] = __FIXME__tmp12;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_contract
void kernel_contract(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t j;
  int64_t i;
  uint32_t __FIXME__indvars_2e_iv;
  uint64_t k;

// INSERT COMMENT IFELSE: kernel_contract::entry
  j = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (j < n) { // IFELSE MARKER: entry IF
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t k = i; k < m;   k = k + 1){
  B[(i * n + j)] = (B[(i * n + j)] + (A[(k * m + i)] * B[(k * n + j)]));
}
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_alpha
void kernel_alpha(uint32_t n, uint32_t m, double alpha, double* B, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_alpha::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < m && j < n) {
B[(i * n + j)] = (B[(i * n + j)] * alpha);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, uint32_t m, double alpha, double* A, double* B) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp6;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp6_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  uint32_t i;
  uint32_t j;
  int32_t __FIXME__call3;
  int32_t __FIXME__call4;
  uint32_t k;
  uint32_t l;

  __FIXME__call = num_blocks(n, CONTRACT_BLOCK_DIM_X);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = CONTRACT_BLOCK_DIM_X;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_MEMCPY_SIZE);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), DIM3_MEMCPY_SIZE);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < CONTRACT_BLOCK_DIM_X;   j = j + 1){
kernel_contract(n, m, alpha, B, A, __FIXME__call, 1, 1, CONTRACT_BLOCK_DIM_X, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = ALPHA_BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = ALPHA_BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call3 = num_blocks(m, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call4 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call3;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call4;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5)), ((uint8_t*)(&grid)), DIM3_MEMCPY_SIZE);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6)), ((uint8_t*)(&block)), DIM3_MEMCPY_SIZE);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), DIM3_MEMCPY_SIZE);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp6)), DIM3_MEMCPY_SIZE);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call3;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call4;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_alpha(n, m, alpha, B, A, __FIXME__call3, __FIXME__call4, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t m, uint32_t n, double* B) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), B[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
