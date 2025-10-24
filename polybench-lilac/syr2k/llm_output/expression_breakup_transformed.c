/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define KERNEL_ALPHA_DEFAULT 32412
#define KERNEL_BETA_DEFAULT 2123
#define ARGV_IDX_DUMP_CODE 1
#define ARGV_IDX_M 2
#define ARGV_IDX_N 3
#define DUMP_CODE_ENABLED 1
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_Z 1
#define GRID_DIM_Z 1
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2

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
void kernel(uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_beta(uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_product(uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t dump_code;
  int32_t m;
  int32_t n;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[ARGV_IDX_DUMP_CODE]);
  m = atoi(argv[ARGV_IDX_M]);
  n = atoi(argv[ARGV_IDX_N]);
  A = malloc(m * n * DOUBLE_SIZE_BYTES);
  B = malloc(m * n * DOUBLE_SIZE_BYTES);
  C = malloc(m * m * DOUBLE_SIZE_BYTES);
  init_array(m, n, ((double*)C), ((double*)A), ((double*)B));
;
  kernel(m, n, KERNEL_ALPHA_DEFAULT, KERNEL_BETA_DEFAULT, ((double*)C), ((double*)A), ((double*)B));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(m, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, double* C, double* A, double* B) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  __auto_type __FIXME__tmp1 = i * (int64_t)nj + j;
  __auto_type __FIXME__tmp2 = (double)i * (double)j;
  __auto_type __FIXME__tmp3 = __FIXME__tmp2 / (double)ni;
  A[(i * nj + j)] = __FIXME__tmp3;
  __auto_type __FIXME__tmp4 = i * (int64_t)nj + j;
  __auto_type __FIXME__tmp5 = (double)i * (double)j;
  __auto_type __FIXME__tmp6 = __FIXME__tmp5 / (double)ni;
  B[(i * nj + j)] = __FIXME__tmp6;
}
}
// INSERT COMMENT LOOP: init_array::for.cond19
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < ni;   j = j + 1){
  __auto_type __FIXME__tmp7 = i * (int64_t)ni + j;
  __auto_type __FIXME__tmp8 = (double)i * (double)j;
  __auto_type __FIXME__tmp9 = __FIXME__tmp8 / (double)ni;
  C[(i * ni + j)] = __FIXME__tmp9;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_beta
void kernel_beta(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_beta::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < n && j <= i) {
    C[(i * n + j)] = (C[(i * n + j)] * beta);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_product
void kernel_product(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_product::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < n && j <= i) {
    for(int64_t k = 0; k < m;   k = k + 1){
    C[(i * n + j)] = (C[(i * n + j)] + (((A[(j * m + k)] * alpha) * B[(i * m + k)]) + ((B[(j * m + k)] * alpha) * A[(i * m + k)])));
    }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B) {
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
  int32_t __FIXME__call;
  int32_t __FIXME__call1;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call7;
  int32_t __FIXME__call9;

  block.__FIXME__l_struct_struct_OC_dim3_field0 = BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = BLOCK_DIM_Z;
  __FIXME__call = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call1 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call1;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = GRID_DIM_Z;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call1;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_beta(n, m, alpha, beta, C, A, B, __FIXME__call, __FIXME__call1, BLOCK_DIM_Z, BLOCK_DIM_X, BLOCK_DIM_Y, GRID_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call7 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call9 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call7;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call9;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp10)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp11)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call7;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call9;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_product(n, m, alpha, beta, C, A, B, __FIXME__call7, __FIXME__call9, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, double* C) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < ni;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), C[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
