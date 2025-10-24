/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
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
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void kernel_x1(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x2(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[7] = { "%0.2lf" };
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

// FUNCTION ORDER ID 0 START
// INSERT COMMENT FUNCTION: num_blocks
int16_t num_blocks(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}
// FUNCTION ORDER ID 0 END


// FUNCTION ORDER ID 1 START
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp7;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp7_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  uint32_t i;
  uint32_t j;
  int32_t __FIXME__call9;

  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call = num_blocks(n, 256);
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
kernel_x1(n, x1, x2, y_1, y_2, A, 256, 1, 1, __FIXME__call, 1, 1, i, 0, 0, j, 0, 0);
}
}
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp5.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__call9 = num_blocks(n, 256);
  __FIXME__agg_2e_tmp7.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call9;
  __FIXME__agg_2e_tmp7.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp7.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp7_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp7)), 12);
// INSERT COMMENT LOOP: kernel::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 256;   i = i + 1){
for(int32_t j = 0; j < __FIXME__call9;   j = j + 1){
kernel_x2(n, x1, x2, y_1, y_2, A, 256, 1, 1, __FIXME__call9, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// FUNCTION ORDER ID 1 END


// MAIN START
int main(int argc, char ** argv) {
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x1;
  uint8_t* x2;
  uint8_t* y_1;
  uint8_t* y_2;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  A = malloc(1800000000);
  x1 = malloc(8 * 15000);
  x2 = malloc(8 * 15000);
  y_1 = malloc(8 * 15000);
  y_2 = malloc(8 * 15000);
  init_array(15000, ((double*)x1), ((double*)x2), ((double*)y_1), ((double*)y_2), ((double*)A));
;
  kernel(15000, ((double*)x1), ((double*)x2), ((double*)y_1), ((double*)y_2), ((double*)A));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(15000, ((double*)x1), ((double*)x2));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x1)));
free(((uint8_t*)((double*)x2)));
free(((uint8_t*)((double*)y_1)));
free(((uint8_t*)((double*)y_2)));
  return 0;
}
// MAIN END


// FUNCTION ORDER ID 2 START
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  x1[i] = ((double)(i) / (double)(n));
  x2[i] = (((double)(i) + 1) / (double)(n));
  y_1[i] = (((double)(i) + 3) / (double)(n));
  y_2[i] = (((double)(i) + 4) / (double)(n));
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// FUNCTION ORDER ID 2 END


// FUNCTION ORDER ID 3 START
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* x1, double* x2) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), x1[i]);
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), x2[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
  return;
}
// FUNCTION ORDER ID 3 END


// FUNCTION ORDER ID 4 START
// INSERT COMMENT FUNCTION: kernel_x1
void kernel_x1(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x1::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x1[i] = (x1[i] + (A[(i * n + j)] * y_1[j]));
}
  }
  return;
}
// FUNCTION ORDER ID 4 END


// FUNCTION ORDER ID 5 START
// INSERT COMMENT FUNCTION: kernel_x2
void kernel_x2(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x2::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x2[i] = (x2[i] + (A[(j * n + i)] * y_2[j]));
}
  }
  return;
}
// FUNCTION ORDER ID 5 END

