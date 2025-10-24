/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define THREADS_PER_BLOCK_X 256
#define DIM3_STRUCT_SIZE_BYTES 12
#define ARG_IDX_NX 2
#define ARG_IDX_NY 3
#define ARG_IDX_DUMP_FLAG 1
#define PRINT_VALUES_PER_LINE 20
#define FORMAT_STR_BUF_LEN 8
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
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void kernel3(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel4(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[FORMAT_STR_BUF_LEN] = { "%0.2lf " };
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
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp43;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp43_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp45;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp47;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp45_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp47_2e_coerce;    /* Address-exposed local */
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x;
  uint8_t* y;
  uint8_t* tmp;
  int32_t __FIXME__call42;
  uint32_t i;
  uint32_t j;
  int32_t __FIXME__call46;

  nx = atoi(argv[ARG_IDX_NX]);
  ny = atoi(argv[ARG_IDX_NY]);
  dump_code = atoi(argv[ARG_IDX_DUMP_FLAG]);
  A = malloc(nx * ny * BYTES_PER_DOUBLE);
  x = malloc(ny * BYTES_PER_DOUBLE);
  y = malloc(ny * BYTES_PER_DOUBLE);
  tmp = malloc(nx * BYTES_PER_DOUBLE);
__auto_type __FIXME__tmp1 = (double*)A;
__auto_type __FIXME__tmp2 = (double*)x;
__auto_type __FIXME__tmp3 = (double*)tmp;
__auto_type __FIXME__tmp4 = (double*)y;
init_array(nx, ny, __FIXME__tmp1, __FIXME__tmp2, __FIXME__tmp3, __FIXME__tmp4);
  __FIXME__call42 = num_blocks(nx, THREADS_PER_BLOCK_X);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call42;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp43.__FIXME__l_struct_struct_OC_dim3_field0 = THREADS_PER_BLOCK_X;
  __FIXME__agg_2e_tmp43.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp43.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __auto_type __FIXME__tmp5 = (uint8_t*)&__FIXME__agg_2e_tmp_2e_coerce;
  __auto_type __FIXME__tmp6 = (uint8_t*)&__FIXME__agg_2e_tmp;
  memcpy(__FIXME__tmp5, __FIXME__tmp6, DIM3_STRUCT_SIZE_BYTES);
  __auto_type __FIXME__tmp7 = (uint8_t*)&__FIXME__agg_2e_tmp43_2e_coerce;
  __auto_type __FIXME__tmp8 = (uint8_t*)&__FIXME__agg_2e_tmp43;
  memcpy(__FIXME__tmp7, __FIXME__tmp8, DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: main::header.014
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call42;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
__auto_type __FIXME__tmp9 = (double*)A;
__auto_type __FIXME__tmp10 = (double*)x;
__auto_type __FIXME__tmp11 = (double*)y;
__auto_type __FIXME__tmp12 = (double*)tmp;
__auto_type __FIXME__tmp13 = __FIXME__call42;
__auto_type __FIXME__tmp14 = 1;
__auto_type __FIXME__tmp15 = 1;
__auto_type __FIXME__tmp16 = THREADS_PER_BLOCK_X;
__auto_type __FIXME__tmp17 = 1;
__auto_type __FIXME__tmp18 = 1;
__auto_type __FIXME__tmp19 = i;
__auto_type __FIXME__tmp20 = 0;
__auto_type __FIXME__tmp21 = 0;
__auto_type __FIXME__tmp22 = j;
__auto_type __FIXME__tmp23 = 0;
__auto_type __FIXME__tmp24 = 0;
kernel3(nx, ny, __FIXME__tmp9, __FIXME__tmp10, __FIXME__tmp11, __FIXME__tmp12, __FIXME__tmp13, __FIXME__tmp14, __FIXME__tmp15, __FIXME__tmp16, __FIXME__tmp17, __FIXME__tmp18, __FIXME__tmp19, __FIXME__tmp20, __FIXME__tmp21, __FIXME__tmp22, __FIXME__tmp23, __FIXME__tmp24);
}
}
  __FIXME__call46 = num_blocks(ny, THREADS_PER_BLOCK_X);
  __FIXME__agg_2e_tmp45.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call46;
  __FIXME__agg_2e_tmp45.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp45.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp47.__FIXME__l_struct_struct_OC_dim3_field0 = THREADS_PER_BLOCK_X;
  __FIXME__agg_2e_tmp47.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp47.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __auto_type __FIXME__tmp25 = (uint8_t*)&__FIXME__agg_2e_tmp45_2e_coerce;
  __auto_type __FIXME__tmp26 = (uint8_t*)&__FIXME__agg_2e_tmp45;
  memcpy(__FIXME__tmp25, __FIXME__tmp26, DIM3_STRUCT_SIZE_BYTES);
  __auto_type __FIXME__tmp27 = (uint8_t*)&__FIXME__agg_2e_tmp47_2e_coerce;
  __auto_type __FIXME__tmp28 = (uint8_t*)&__FIXME__agg_2e_tmp47;
  memcpy(__FIXME__tmp27, __FIXME__tmp28, DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: main::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < __FIXME__call46;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
__auto_type __FIXME__tmp29 = (double*)A;
__auto_type __FIXME__tmp30 = (double*)x;
__auto_type __FIXME__tmp31 = (double*)y;
__auto_type __FIXME__tmp32 = (double*)tmp;
__auto_type __FIXME__tmp33 = __FIXME__call46;
__auto_type __FIXME__tmp34 = 1;
__auto_type __FIXME__tmp35 = 1;
__auto_type __FIXME__tmp36 = THREADS_PER_BLOCK_X;
__auto_type __FIXME__tmp37 = 1;
__auto_type __FIXME__tmp38 = 1;
__auto_type __FIXME__tmp39 = i;
__auto_type __FIXME__tmp40 = 0;
__auto_type __FIXME__tmp41 = 0;
__auto_type __FIXME__tmp42 = j;
__auto_type __FIXME__tmp43 = 0;
__auto_type __FIXME__tmp44 = 0;
kernel4(nx, ny, __FIXME__tmp29, __FIXME__tmp30, __FIXME__tmp31, __FIXME__tmp32, __FIXME__tmp33, __FIXME__tmp34, __FIXME__tmp35, __FIXME__tmp36, __FIXME__tmp37, __FIXME__tmp38, __FIXME__tmp39, __FIXME__tmp40, __FIXME__tmp41, __FIXME__tmp42, __FIXME__tmp43, __FIXME__tmp44);
}
}
// INSERT COMMENT IFELSE: main::kcall.end51
  if (dump_code == 1) { // IFELSE MARKER: kcall.end51 IF
print_array(nx, ((double*)y));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)tmp)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* A, double* x, double* tmp, double* y) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  x[i] = ((double)(i) * 3.1415926535897931);
}
// INSERT COMMENT LOOP: init_array::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
  tmp[i] = 0;
}
// INSERT COMMENT LOOP: init_array::for.cond9
for(int64_t i = 0; i < nx;   i = i + 1){
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
// INSERT COMMENT FUNCTION: kernel3
void kernel3(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t i;
  int64_t j;
  double dot;

// INSERT COMMENT IFELSE: kernel3::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (i < m) { // IFELSE MARKER: entry IF
  dot = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  dot = (dot + (A[(i * n + j)] * x[j]));
}
  tmp[i] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel4
void kernel4(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t j;
  int64_t i;
  double dot;

// INSERT COMMENT IFELSE: kernel4::entry
  j = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (j < n) { // IFELSE MARKER: entry IF
  y[j] = 0;
  dot = 0;
for(int64_t i = 0; i < m;   i = i + 1){
  dot = (dot + (A[(i * n + j)] * tmp[i]));
}
  y[j] = dot;
  }
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, double* y) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), y[i]);
  if (i % PRINT_VALUES_PER_LINE == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
