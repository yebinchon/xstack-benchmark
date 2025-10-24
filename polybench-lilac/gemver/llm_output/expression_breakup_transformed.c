/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define KERNEL_ALPHA_DEFAULT 43532
#define KERNEL_BETA_DEFAULT 12313
#define ARG_INDEX_INPUT_SIZE 2
#define ARG_INDEX_DUMP_FLAG 1
#define DUMP_PRINT_ENABLED_VALUE 1
#define PRINT_ELEM_FORMAT_LEN 8
#define NEWLINE_STR_LEN 2
#define INIT_U2_DIVISOR 2
#define INIT_V1_DIVISOR 4
#define INIT_V2_DIVISOR 6
#define INIT_Y_DIVISOR 8
#define INIT_Z_DIVISOR 9
#define KERNEL_A_BLOCK_DIM_X 8
#define KERNEL_A_BLOCK_DIM_Y 32
#define DIM3_STRUCT_SIZE_BYTES 12

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
void init_array(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_w(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[PRINT_ELEM_FORMAT_LEN] = { "%0.2lf " };
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
  int32_t dump_code;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[ARG_INDEX_INPUT_SIZE]);
  dump_code = atoi(argv[ARG_INDEX_DUMP_FLAG]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  u1 = malloc(n * BYTES_PER_DOUBLE);
  v1 = malloc(n * BYTES_PER_DOUBLE);
  u2 = malloc(n * BYTES_PER_DOUBLE);
  v2 = malloc(n * BYTES_PER_DOUBLE);
  w = malloc(n * BYTES_PER_DOUBLE);
  x = malloc(n * BYTES_PER_DOUBLE);
  y = malloc(n * BYTES_PER_DOUBLE);
  z = malloc(n * BYTES_PER_DOUBLE);
  __auto_type __FIXME__tmp1 = (double*)A;
  __auto_type __FIXME__tmp2 = (double*)u1;
  __auto_type __FIXME__tmp3 = (double*)v1;
  __auto_type __FIXME__tmp4 = (double*)u2;
  __auto_type __FIXME__tmp5 = (double*)v2;
  __auto_type __FIXME__tmp6 = (double*)w;
  __auto_type __FIXME__tmp7 = (double*)x;
  __auto_type __FIXME__tmp8 = (double*)y;
  __auto_type __FIXME__tmp9 = (double*)z;
  init_array(n, __FIXME__tmp1, __FIXME__tmp2, __FIXME__tmp3, __FIXME__tmp4, __FIXME__tmp5, __FIXME__tmp6, __FIXME__tmp7, __FIXME__tmp8, __FIXME__tmp9);
;
  __auto_type __FIXME__tmp10 = KERNEL_ALPHA_DEFAULT;
  __auto_type __FIXME__tmp11 = KERNEL_BETA_DEFAULT;
  kernel(n, __FIXME__tmp10, __FIXME__tmp11, __FIXME__tmp1, __FIXME__tmp2, __FIXME__tmp3, __FIXME__tmp4, __FIXME__tmp5, __FIXME__tmp6, __FIXME__tmp7, __FIXME__tmp8, __FIXME__tmp9);
;
  if (dump_code == DUMP_PRINT_ENABLED_VALUE) { // IFELSE MARKER: entry IF
print_array(n, ((double*)w));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)u1)));
free(((uint8_t*)((double*)v1)));
free(((uint8_t*)((double*)u2)));
free(((uint8_t*)((double*)v2)));
free(((uint8_t*)((double*)w)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)z)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  u1[i] = (double)(i);
  u2[i] = ((double)((i + 1) / n) / INIT_U2_DIVISOR);
  v1[i] = ((double)((i + 1) / n) / INIT_V1_DIVISOR);
  v2[i] = ((double)((i + 1) / n) / INIT_V2_DIVISOR);
  y[i] = ((double)((i + 1) / n) / INIT_Y_DIVISOR);
  z[i] = ((double)((i + 1) / n) / INIT_Z_DIVISOR);
  x[i] = 0;
  w[i] = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_A
void kernel_A(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_A::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < n && j < n) {
A[(i * n + j)] = (A[(i * n + j)] + ((u1[i] * v1[j]) + (u2[i] * v2[j])));
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_x
void kernel_x(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x[i] = (x[i] + ((beta * A[(j * n + i)]) * y[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_y
void kernel_y(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;

// INSERT COMMENT IFELSE: kernel_y::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n) { // IFELSE MARKER: entry IF
  x[i] = (x[i] + z[i]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_w
void kernel_w(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_w::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  w[i] = (w[i] + ((alpha * A[(i * n + j)]) * x[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp4;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp4_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp6;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp8;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp6_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp8_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp13;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp15;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp13_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp15_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp20;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp22;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp22_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  int32_t __FIXME__call3;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call7;
  int32_t __FIXME__call14;
  int32_t __FIXME__call21;

  block.__FIXME__l_struct_struct_OC_dim3_field0 = KERNEL_A_BLOCK_DIM_X;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = KERNEL_A_BLOCK_DIM_Y;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field0);
  __FIXME__call3 = num_blocks(n, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call3;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp4)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp4_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp4)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call3;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, __FIXME__call, __FIXME__call3, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  __FIXME__call7 = num_blocks(n, 256);
  __FIXME__agg_2e_tmp6.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call7;
  __FIXME__agg_2e_tmp6.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp6.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp8.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp8.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp8.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp6)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp8_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp8)), 12);
// INSERT COMMENT LOOP: kernel::header.022
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call7;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_x(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, __FIXME__call7, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  __FIXME__call14 = num_blocks(n, 256);
  __FIXME__agg_2e_tmp13.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call14;
  __FIXME__agg_2e_tmp13.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp13.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp13_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp13)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp15_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp15)), 12);
// INSERT COMMENT LOOP: kernel::header.032
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call14;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_y(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, __FIXME__call14, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  __FIXME__call21 = num_blocks(n, 256);
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call21;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp22.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp22.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp22.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp20)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp22_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp22)), 12);
// INSERT COMMENT LOOP: kernel::header.042
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call21;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_w(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, __FIXME__call21, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* w) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), w[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
  return;
}
