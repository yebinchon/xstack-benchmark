/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define BLOCK_DIM_X 256
#define DIM3_SIZE_BYTES 12
#define ARG_IDX_M 2
#define ARG_IDX_N 3
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
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_q(uint32_t, uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_s(uint32_t, uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */
int main(int argc, char ** argv) {
  int32_t m;
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* s;
  uint8_t* q;
  uint8_t* p;
  uint8_t* r;

// INSERT COMMENT IFELSE: main::entry
  m = atoi(argv[ARG_IDX_M]);
  n = atoi(argv[ARG_IDX_N]);
  dump_code = atoi(argv[1]);
  A = malloc(m * n * BYTES_PER_DOUBLE);
  s = malloc(n * BYTES_PER_DOUBLE);
  q = malloc(m * BYTES_PER_DOUBLE);
  p = malloc(n * BYTES_PER_DOUBLE);
  r = malloc(m * BYTES_PER_DOUBLE);
  __auto_type __FIXME__tmp1 = (double*)A;
  __auto_type __FIXME__tmp2 = (double*)r;
  __auto_type __FIXME__tmp3 = (double*)p;
  init_array(m, n, __FIXME__tmp1, __FIXME__tmp2, __FIXME__tmp3);
;
  __auto_type __FIXME__tmp5 = (double*)A;
  __auto_type __FIXME__tmp6 = (double*)s;
  __auto_type __FIXME__tmp7 = (double*)q;
  __auto_type __FIXME__tmp8 = (double*)p;
  __auto_type __FIXME__tmp9 = (double*)r;
  kernel(m, n, __FIXME__tmp5, __FIXME__tmp6, __FIXME__tmp7, __FIXME__tmp8, __FIXME__tmp9);
;
  if (dump_code == DUMP_CODE_ENABLED) { // IFELSE MARKER: entry IF
__auto_type __FIXME__tmp11 = (double*)s;
__auto_type __FIXME__tmp12 = (double*)q;
print_array(m, n, __FIXME__tmp11, __FIXME__tmp12);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)s)));
free(((uint8_t*)((double*)q)));
free(((uint8_t*)((double*)p)));
free(((uint8_t*)((double*)r)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* A, double* r, double* p) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  p[i] = ((double)(i) * 3.1415926535897931);
}
// INSERT COMMENT LOOP: init_array::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
  r[i] = ((double)(i) * 3.1415926535897931);
for(int64_t j = 0; j < ny;   j = j + 1){
  A[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_q
void kernel_q(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;
  double dot;

// INSERT COMMENT IFELSE: kernel_q::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n) { // IFELSE MARKER: entry IF
  q[i] = 0;
  dot = 0;
for(int64_t j = 0; j < m;   j = j + 1){
  dot = (dot + (A[(i * m + j)] * p[j]));
}
  q[i] = (q[i] + dot);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_s
void kernel_s(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t j;
  int64_t i;
  double dot;

// INSERT COMMENT IFELSE: kernel_s::entry
  j = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (j < m) { // IFELSE MARKER: entry IF
  s[j] = 0;
  dot = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  dot = (dot + (r[i] * A[(i * m + j)]));
}
  s[j] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp3;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  uint32_t i;
  uint32_t j;
  int32_t __FIXME__call4;

  __FIXME__call = num_blocks(n, BLOCK_DIM_X);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = BLOCK_DIM_X;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), DIM3_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call;   i = i + 1){
for(int32_t j = 0; j < BLOCK_DIM_X;   j = j + 1){
kernel_q(m, n, A, s, q, p, r, __FIXME__call, 1, 1, BLOCK_DIM_X, 1, 1, i, 0, 0, j, 0, 0);
}
}
  __FIXME__call4 = num_blocks(m, 256);
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call4;
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp3.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp3)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call4;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_s(m, n, A, s, q, p, r, __FIXME__call4, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, uint32_t ny, double* s, double* q) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), s[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
// INSERT COMMENT LOOP: print_array::for.cond3
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), q[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body5 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
