/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define BLOCK_DIM_X 1
#define BLOCK_DIM_Y 8
#define BLOCK_DIM_Z 32
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINT_ELEM_FMT_LEN 8
#define NEWLINE_FMT_LEN 2
#define DUMP_CODE_PRINT 1
#define ARG_IDX_DUMP_CODE 1
#define ARG_IDX_NR 2
#define ARG_IDX_NQ 3
#define ARG_IDX_NP 4

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
void init_array(uint32_t, uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_sum(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[PRINT_ELEM_FMT_LEN] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[NEWLINE_FMT_LEN] = { "\n" };


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
  int32_t dump_code;
  int32_t nr;
  int32_t nq;
  int32_t np;
  uint8_t* A;
  uint8_t* sum;
  uint8_t* C4;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  nr = atoi(argv[ARG_IDX_NR]);
  nq = atoi(argv[ARG_IDX_NQ]);
  np = atoi(argv[ARG_IDX_NP]);
  A = malloc(nr * nq * np * DOUBLE_SIZE_BYTES);
  sum = malloc(nr * nq * np * DOUBLE_SIZE_BYTES);
  C4 = malloc(np * np * DOUBLE_SIZE_BYTES);
  init_array(nr, nq, np, ((double*)A), ((double*)C4));
;
  kernel(nr, nq, np, ((double*)A), ((double*)C4), ((double*)sum));
;
  if (dump_code == DUMP_CODE_PRINT) { // IFELSE MARKER: entry IF
print_array(nr, nq, np, ((double*)sum));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)sum)));
free(((uint8_t*)((double*)C4)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4) {
  int64_t i;
  int64_t j;
  int64_t k;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < nr;   i = i + 1){
for(int64_t j = 0; j < nq;   j = j + 1){
for(int64_t k = 0; k < np;   k = k + 1){
  A[((i * np * nq + j * nq) + k)] = ((((double)(i) * (double)(j)) + (double)(k)) / (double)(np));
}
}
}
// INSERT COMMENT LOOP: init_array::for.cond21
for(int64_t i = 0; i < np;   i = i + 1){
for(int64_t j = 0; j < np;   j = j + 1){
  C4[(i * np + j)] = (((double)(i) * (double)(j)) / (double)(np));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_sum
void kernel_sum(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t r;
  int32_t q;
  int32_t p;
  int64_t s;
  double dot;

// INSERT COMMENT IFELSE: kernel_sum::entry
  r = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  q = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  p = __FIXME__blockDim_2e_z * __FIXME__blockIdx_2e_z + __FIXME__threadIdx_2e_z;
  if (r < nr && q < nq) {
if (p < np) { // IFELSE MARKER: land.lhs.true14 IF
int __FIXME__tmp1 = r * nq + q;
int __FIXME__tmp2 = __FIXME__tmp1 * np;
int __FIXME__tmp3 = __FIXME__tmp2 + p;
sum[((r * nq + q) * np + p)] = 0;
dot = 0;
for(int64_t s = 0; s < np;   s = s + 1){
int __FIXME__tmp4 = r * nq + q;
int __FIXME__tmp5 = __FIXME__tmp4 * np;
int __FIXME__tmp6 = __FIXME__tmp5 + s;
int __FIXME__tmp7 = s * np + p;
double __FIXME__tmp8 = A[__FIXME__tmp6];
double __FIXME__tmp9 = C4[__FIXME__tmp7];
double __FIXME__tmp10 = __FIXME__tmp8 * __FIXME__tmp9;
double __FIXME__tmp11 = dot + __FIXME__tmp10;
dot = __FIXME__tmp11;
}
int __FIXME__tmp12 = r * nq + q;
int __FIXME__tmp13 = __FIXME__tmp12 * np;
int __FIXME__tmp14 = __FIXME__tmp13 + p;
sum[((r * nq + q) * np + p)] = dot;
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp3;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  int32_t __FIXME__call1;
  int32_t __FIXME__call2;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  block.__FIXME__l_struct_struct_OC_dim3_field0 = BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = BLOCK_DIM_Z;
  __FIXME__call = num_blocks(nr, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call1 = num_blocks(nq, block.__FIXME__l_struct_struct_OC_dim3_field1);
  __FIXME__call2 = num_blocks(np, block.__FIXME__l_struct_struct_OC_dim3_field2);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call1;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = __FIXME__call2;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp3)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call1;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call2;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
for(int32_t m = 0; m < BLOCK_DIM_Z;   m = m + 1){
kernel_sum(nr, nq, np, A, C4, sum, __FIXME__call, __FIXME__call1, __FIXME__call2, BLOCK_DIM_X, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, k, 0, l, m);
}
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nr, uint32_t nq, uint32_t np, double* A) {
  int64_t i;
  int64_t j;
  int64_t k;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nr;   i = i + 1){
for(int64_t j = 0; j < nq;   j = j + 1){
for(int64_t k = 0; k < np;   k = k + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), A[((i * nq * np + j * nq) + k)]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body6 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
