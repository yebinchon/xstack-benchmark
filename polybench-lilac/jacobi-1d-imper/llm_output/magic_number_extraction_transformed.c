/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define THREADS_PER_BLOCK 256
#define DIM3_STRUCT_BYTES 12
#define STENCIL_WIDTH 3
#define HALO_RADIUS 1
#define INIT_A_OFFSET 2
#define INIT_B_OFFSET 3
#define PRINT_WRAP_EVERY 20
#define PRINT_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define ARG_IDX_N 3
#define ARG_IDX_TSTEPS 2
#define ARG_IDX_DUMP 1
#define DUMP_ENABLED_FLAG 1

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
uint8_t __FIXME_GLOBAL___OC_str[PRINT_FMT_STR_LEN] = { "%0.2lf " };
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
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[ARG_IDX_N]);
  tsteps = atoi(argv[ARG_IDX_TSTEPS]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  A = malloc(n * DOUBLE_SIZE_BYTES);
  B = malloc(n * DOUBLE_SIZE_BYTES);
  init_array(n, ((double*)A), ((double*)B));
;
  kernel(tsteps, n, ((double*)A), ((double*)B));
;
  if (dump_code == DUMP_ENABLED_FLAG) { // IFELSE MARKER: entry IF
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  A[i] = (((double)(i) + INIT_A_OFFSET) / (double)(n));
  B[i] = (((double)(i) + INIT_B_OFFSET) / (double)(n));
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_stencil
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;

// INSERT COMMENT IFELSE: kernel_stencil::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + HALO_RADIUS;
  if (i < (n - HALO_RADIUS)) { // IFELSE MARKER: entry IF
  B[i] = (((A[(i - HALO_RADIUS)] + A[i]) + A[(i + 1)]) / STENCIL_WIDTH);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp3;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t __FIXME__call = num_blocks(n, THREADS_PER_BLOCK);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = THREADS_PER_BLOCK;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), DIM3_STRUCT_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < THREADS_PER_BLOCK;   k = k + 1){
kernel_stencil(n, A, B, __FIXME__call, 1, 1, THREADS_PER_BLOCK, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t __FIXME__call4 = num_blocks(n, THREADS_PER_BLOCK);
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call4;
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field0 = THREADS_PER_BLOCK;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp3)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), DIM3_STRUCT_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call4;   j = j + 1){
for(int32_t k = 0; k < THREADS_PER_BLOCK;   k = k + 1){
kernel_stencil(n, B, A, __FIXME__call4, 1, 1, THREADS_PER_BLOCK, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* A) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), A[i]);
  if (i % PRINT_WRAP_EVERY == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
