/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define FORMAT_STR_BUF_SIZE 8
#define NEWLINE_STR_BUF_SIZE 2
#define DUMP_CODE_ENABLED 1
#define INIT_A_J_OFFSET 2
#define INIT_A_CONST_TERM 2
#define INIT_B_J_OFFSET 3
#define INIT_B_CONST_TERM 3
#define STENCIL_HALO_RADIUS 1
#define STENCIL_DENOMINATOR_5PT 5
#define STENCIL_BORDER_TOTAL 2
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define Z_DIM_SIZE 1
#define DIM3_SIZE_BYTES 12

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
void init_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[FORMAT_STR_BUF_SIZE] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[NEWLINE_STR_BUF_SIZE] = { "\n" };


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
  int32_t n;
  int32_t tsteps;
  uint8_t* A;
  uint8_t* B;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  B = malloc(n * n * BYTES_PER_DOUBLE);
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

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  __auto_type __FIXME__tmp1 = j + INIT_A_J_OFFSET;
  __auto_type __FIXME__tmp2 = (double)(i);
  __auto_type __FIXME__tmp3 = (double)(__FIXME__tmp1);
  __auto_type __FIXME__tmp4 = __FIXME__tmp2 * __FIXME__tmp3;
  __auto_type __FIXME__tmp5 = __FIXME__tmp4 + INIT_A_CONST_TERM;
  __auto_type __FIXME__tmp6 = (double)(n);
  __auto_type __FIXME__tmp7 = __FIXME__tmp5 / __FIXME__tmp6;
  A[(i * n + j)] = __FIXME__tmp7;
  __auto_type __FIXME__tmp8 = j + INIT_B_J_OFFSET;
  __auto_type __FIXME__tmp9 = (double)(i);
  __auto_type __FIXME__tmp10 = (double)(__FIXME__tmp8);
  __auto_type __FIXME__tmp11 = __FIXME__tmp9 * __FIXME__tmp10;
  __auto_type __FIXME__tmp12 = __FIXME__tmp11 + INIT_B_CONST_TERM;
  __auto_type __FIXME__tmp13 = (double)(n);
  __auto_type __FIXME__tmp14 = __FIXME__tmp12 / __FIXME__tmp13;
  B[(i * n + j)] = __FIXME__tmp14;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_stencil
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_stencil::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + STENCIL_HALO_RADIUS;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y + STENCIL_HALO_RADIUS;
  if (i < (n - STENCIL_HALO_RADIUS)) { // IFELSE MARKER: entry IF
  if (j < (n - STENCIL_HALO_RADIUS)) { // IFELSE MARKER: land.lhs.true IF
  B[(i * n + j)] = (((((A[(i * n + j)] + A[((i * n + j) - 1)]) + A[((i * n + 1) + j)]) + A[((1 + i) * n + j)]) + A[((i - 1) * n + j)]) / STENCIL_DENOMINATOR_5PT);
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp3;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp6;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp6_2e_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.__FIXME__l_struct_struct_OC_dim3_field0 = BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = Z_DIM_SIZE;
  uint32_t __FIXME__call = num_blocks((n - STENCIL_BORDER_TOTAL), block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call2 = num_blocks((n - STENCIL_BORDER_TOTAL), block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call2;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = Z_DIM_SIZE;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3)), ((uint8_t*)(&block)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp3)), DIM3_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call2;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_X;   l = l + 1){
for(int32_t m = 0; m < BLOCK_DIM_Y;   m = m + 1){
kernel_stencil(n, A, B, __FIXME__call, __FIXME__call2, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp6)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call2;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_stencil(n, B, A, __FIXME__call, __FIXME__call2, 1, 8, 32, 1, j, k, 0, l, m, 0);
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
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
