/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define DIM3_STRUCT_SIZE_BYTES 12
#define KERNEL1_BLOCKDIM_X 256
#define TILE_SIZE_X 8
#define TILE_SIZE_Y 32
#define PRINT_ELEMENTS_PER_LINE 20
#define PRINTF_FORMAT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define ARG_IDX_N 2
#define ARG_IDX_DUMP 1
#define DUMP_CODE_ENABLED 1

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
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_polly(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double);
void kernel0(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel1(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel2(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[PRINTF_FORMAT_STR_LEN] = { "%0.2lf " };
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
  int32_t n;
  int32_t dump_code;
  uint8_t* A;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[ARG_IDX_N]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  init_array(n, ((double*)A));
;
  kernel_polly(n, ((double*)A));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (1 / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel0
void kernel0(uint32_t n, uint32_t __FIXME__j, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  double __FIXME__1;

  __FIXME__1 = sqrt(A[(__FIXME__j * n + __FIXME__j)]);
  A[(__FIXME__j * n + __FIXME__j)] = __FIXME__1;
}
// INSERT COMMENT FUNCTION: kernel1
void kernel1(uint32_t n, uint32_t __FIXME__j, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;

// INSERT COMMENT IFELSE: kernel1::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n & i > __FIXME__j) { // IFELSE MARKER: entry IF
  A[(i * n + __FIXME__j)] = (A[(i * n + __FIXME__j)] / A[(__FIXME__j * n + __FIXME__j)]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel2
void kernel2(uint32_t n, uint32_t __FIXME__j, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t k;

// INSERT COMMENT IFELSE: kernel2::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  k = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  int __FIXME__tmp1 = (__FIXME__j < n);
  int __FIXME__tmp2 = (__FIXME__j < i);
  int __FIXME__tmp3 = (i < n);
  int __FIXME__tmp4 = (__FIXME__j < k);
  int __FIXME__tmp5 = (k <= i);
  int __FIXME__tmp6 = __FIXME__tmp1 & __FIXME__tmp2 & __FIXME__tmp3 & __FIXME__tmp4 & __FIXME__tmp5;
  if (__FIXME__tmp6) { // IFELSE MARKER: entry IF
  int __FIXME__tmp7 = i * n + k;
  int __FIXME__tmp8 = i * n + __FIXME__j;
  int __FIXME__tmp9 = k * n + __FIXME__j;
  double __FIXME__tmp10 = A[__FIXME__tmp8] * A[__FIXME__tmp9];
  double __FIXME__tmp11 = A[__FIXME__tmp7] - __FIXME__tmp10;
  A[(i * n + k)] = __FIXME__tmp11;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_polly
void kernel_polly(uint32_t n, double* dev_A) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp2;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp4;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp4_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp11;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp12;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp11_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp12_2e_coerce;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel_polly::for.cond
for(int32_t iter = 0; iter < n;   iter = iter + 1){
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), DIM3_STRUCT_SIZE_BYTES);
kernel0(n, iter, dev_A, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  uint32_t __FIXME__call3 = num_blocks(n, KERNEL1_BLOCKDIM_X);
  __FIXME__agg_2e_tmp2.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call3;
  __FIXME__agg_2e_tmp2.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp2.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp4.__FIXME__l_struct_struct_OC_dim3_field0 = KERNEL1_BLOCKDIM_X;
  __FIXME__agg_2e_tmp4.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp4.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp4_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp4)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call3;   j = j + 1){
for(int32_t k = 0; k < KERNEL1_BLOCKDIM_X;   k = k + 1){
  kernel1(n, iter, dev_A, __FIXME__call3, 1, 1, KERNEL1_BLOCKDIM_X, 1, 1, j, 0, 0, k, 0, 0);
;
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = TILE_SIZE_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = TILE_SIZE_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  uint32_t __FIXME__call9 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call10 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call9;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call10;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp12)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp11)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp12_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp12)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < TILE_SIZE_X;   j = j + 1){
for(int32_t k = 0; k < TILE_SIZE_Y;   k = k + 1){
for(int32_t l = 0; l < __FIXME__call9;   l = l + 1){
for(int32_t m = 0; m < __FIXME__call10;   m = m + 1){
  kernel2(n, iter, dev_A, TILE_SIZE_X, TILE_SIZE_Y, 1, __FIXME__call9, __FIXME__call10, 1, j, k, 0, l, m, 0);
;
}
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)PRINT_ELEMENTS_PER_LINE == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  return;
}
