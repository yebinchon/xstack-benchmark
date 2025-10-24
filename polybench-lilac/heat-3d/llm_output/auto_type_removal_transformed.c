/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define DUMP_CODE_ENABLED 1
#define HALO_WIDTH 1
#define HALO_WIDTH_TIMES_2 2
#define STENCIL_CENTER_WEIGHT 2
#define STENCIL_AXIS_DIVISOR 8
#define BLOCK_DIM_X 1
#define BLOCK_DIM_Y 8
#define BLOCK_DIM_Z 32
#define DIM3_STRUCT_SIZE_BYTES 12
#define BYTE_ARRAY20_LEN 20

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
  uint8_t array[BYTE_ARRAY20_LEN];
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
void init_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t tsteps;
  int32_t n;
  uint8_t* A;
  uint8_t* B;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  tsteps = atoi(argv[2]);
  n = atoi(argv[3]);
  A = malloc(n * n * n * DOUBLE_SIZE_BYTES);
  B = malloc(n * n * n * DOUBLE_SIZE_BYTES);
  init_array(n, ((double*)A), ((double*)B));
;
  kernel(tsteps, n, ((double*)A), ((double*)B));
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;
  uint64_t j;
  uint64_t k;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
for(int64_t k = 0; k < n;   k = k + 1){
  int __FIXME__tmp1 = i * n + j;
  int __FIXME__tmp2 = __FIXME__tmp1 * n + k;
  double __FIXME__tmp3 = (double)i + (double)j + (double)k;
  double __FIXME__tmp4 = (double)n;
  double __FIXME__tmp5 = __FIXME__tmp3 / __FIXME__tmp4;
  A[((i * n + j) * n + k)] = __FIXME__tmp5;
  int __FIXME__tmp6 = i * n + j;
  int __FIXME__tmp7 = __FIXME__tmp6 * n + k;
  double __FIXME__tmp8 = (double)i + (double)j + (double)k;
  double __FIXME__tmp9 = (double)n;
  double __FIXME__tmp10 = (__FIXME__tmp8 + 1.0) / __FIXME__tmp9;
  B[((i * n + j) * n + k)] = __FIXME__tmp10;
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_stencil
void kernel_stencil(uint32_t iter, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;
  int32_t k;

// INSERT COMMENT IFELSE: kernel_stencil::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + HALO_WIDTH;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y + HALO_WIDTH;
  k = __FIXME__blockDim_2e_z * __FIXME__blockIdx_2e_z + __FIXME__threadIdx_2e_z + HALO_WIDTH;
  if (i < (iter - HALO_WIDTH)) { // IFELSE MARKER: entry IF
  if (j < (iter - HALO_WIDTH)) { // IFELSE MARKER: land.lhs.true IF
  if (k < (iter - HALO_WIDTH)) { // IFELSE MARKER: land.lhs.true18 IF
  B[((i * iter + j) * iter + k)] = ((((((A[(((i + HALO_WIDTH) * iter + j) * iter + k)] - (STENCIL_CENTER_WEIGHT * A[((i * iter + j) * iter + k)])) + A[(((i - HALO_WIDTH) * iter + j) * iter + k)]) / STENCIL_AXIS_DIVISOR) + (((A[((i * iter + (j + HALO_WIDTH)) * iter + k)] - (STENCIL_CENTER_WEIGHT * A[((i * iter + j) * iter + k)])) + A[((i * iter + (j - HALO_WIDTH)) * iter + k)]) / STENCIL_AXIS_DIVISOR)) + (((A[(((i * iter + j) * iter + k) + 1)] - (STENCIL_CENTER_WEIGHT * A[((i * iter + j) * iter + k)])) + A[(((i * iter + j) * iter + k) - 1)]) / STENCIL_AXIS_DIVISOR)) + A[((i * iter + j) * iter + k)]);
  }
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t iter, double* A, double* B) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp7;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp8;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp7_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp8_2e_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;
  uint32_t n;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.__FIXME__l_struct_struct_OC_dim3_field0 = BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = BLOCK_DIM_Z;
  uint32_t __FIXME__call = num_blocks((iter - HALO_WIDTH_TIMES_2), block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call2 = num_blocks((iter - HALO_WIDTH_TIMES_2), block.__FIXME__l_struct_struct_OC_dim3_field1);
  uint32_t __FIXME__call4 = num_blocks((iter - HALO_WIDTH_TIMES_2), block.__FIXME__l_struct_struct_OC_dim3_field2);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call2;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = __FIXME__call4;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call2;   k = k + 1){
for(int32_t l = 0; l < __FIXME__call4;   l = l + 1){
for(int32_t m = 0; m < 8;   m = m + 1){
for(int32_t n = 0; n < 32;   n = n + 1){
kernel_stencil(iter, A, B, __FIXME__call, __FIXME__call2, __FIXME__call4, 1, 8, 32, j, k, l, 0, m, n);
}
}
}
}
}
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp7)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp8)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp7_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp7)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp8_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp8)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call2;   k = k + 1){
for(int32_t l = 0; l < __FIXME__call4;   l = l + 1){
for(int32_t m = 0; m < 8;   m = m + 1){
for(int32_t n = 0; n < 32;   n = n + 1){
kernel_stencil(iter, B, A, __FIXME__call, __FIXME__call2, __FIXME__call4, 1, 8, 32, j, k, l, 0, m, n);
}
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
  uint64_t k;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
for(int64_t k = 0; k < n;   k = k + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), A[((i * n + j) * n + k)]);
  if ((int)((i * n + j) * n + k) % (int)20 == 0) { // IFELSE MARKER: for.body6 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
