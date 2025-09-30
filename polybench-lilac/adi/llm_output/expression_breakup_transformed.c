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
struct __FIXME__l_struct_struct_OC__IO_FILE;
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
struct __FIXME__l_struct_struct_OC__IO_FILE {
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field0;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field1;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field2;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field3;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field4;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field5;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field6;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field7;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field8;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field9;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field10;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field11;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field12;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field13;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field14;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field15;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field16;
  uint16_t __FIXME__l_struct_struct_OC__IO_FILE_field17;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field18;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field19[1];
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field20;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field21;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field22;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field23;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field24;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field25;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field26;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field27;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field28[20];
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
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_column_sweep(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_row_sweep(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
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
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* u;
  uint8_t* v;
  uint8_t* p;
  uint8_t* q;
  int32_t __FIXME__call38;
  int32_t __FIXME__call54;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  u = malloc(n * n * 8);
  v = malloc(n * n * 8);
  p = malloc(n * n * 8);
  q = malloc(n * n * 8);
  init_array(n, ((double*)u), ((double*)v), ((double*)p), ((double*)q));
;
  kernel(tsteps, n, ((double*)u), ((double*)v), ((double*)p), ((double*)q));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, ((double*)u));
  }
free(((uint8_t*)((double*)u)));
free(((uint8_t*)((double*)v)));
free(((uint8_t*)((double*)p)));
free(((uint8_t*)((double*)q)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* u, double* v, double* p, double* q) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  u[(i * n + j)] = ((double)(((i + n) - j)) / (double)(n));
  v[(i * n + j)] = 0;
  p[(i * n + j)] = 0;
  q[(i * n + j)] = 0;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_column_sweep
void kernel_column_sweep(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_column_sweep::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + 1;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  v[(0 * n + i)] = 1;
  p[(i * n + 0)] = 0;
  q[(i * n + 0)] = v[(0 * n + i)];
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  __auto_type __FIXME__tmp1 = i * n + j;
  __auto_type __FIXME__tmp2 = __FIXME__tmp1 - 1;
  __auto_type __FIXME__tmp3 = a * p[__FIXME__tmp2] + b;
  __auto_type __FIXME__tmp4 = -c;
  __auto_type __FIXME__tmp5 = __FIXME__tmp4 / __FIXME__tmp3;
  p[(i * n + j)] = __FIXME__tmp5;
  __auto_type __FIXME__tmp6 = i * n + j;
  __auto_type __FIXME__tmp7 = __FIXME__tmp6 - 1;
  __auto_type __FIXME__tmp8 = a * p[__FIXME__tmp7] + b;
  __auto_type __FIXME__tmp9 = j * n + i;
  __auto_type __FIXME__tmp10 = __FIXME__tmp9 - 1;
  __auto_type __FIXME__tmp11 = __FIXME__tmp9 + 1;
  __auto_type __FIXME__tmp12 = -d * u[__FIXME__tmp10];
  __auto_type __FIXME__tmp13 = (1 + 2 * d) * u[__FIXME__tmp9];
  __auto_type __FIXME__tmp14 = f * u[__FIXME__tmp11];
  __auto_type __FIXME__tmp15 = a * q[__FIXME__tmp7];
  __auto_type __FIXME__tmp16 = __FIXME__tmp12 + __FIXME__tmp13 - __FIXME__tmp14 - __FIXME__tmp15;
  __auto_type __FIXME__tmp17 = __FIXME__tmp16 / __FIXME__tmp8;
  q[(i * n + j)] = __FIXME__tmp17;
}
  v[((n - 1) * n + i)] = 1;
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  __auto_type __FIXME__tmp18 = j * n + i;
  __auto_type __FIXME__tmp19 = i * n + j;
  __auto_type __FIXME__tmp20 = (j + 1) * n + i;
  __auto_type __FIXME__tmp21 = p[__FIXME__tmp19];
  __auto_type __FIXME__tmp22 = v[__FIXME__tmp20];
  __auto_type __FIXME__tmp23 = q[__FIXME__tmp19];
  __auto_type __FIXME__tmp24 = __FIXME__tmp21 * __FIXME__tmp22 + __FIXME__tmp23;
  v[(j * n + i)] = __FIXME__tmp24;
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_row_sweep
void kernel_row_sweep(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_row_sweep::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + 1;
  if (i < (n - 1)) { // IFELSE MARKER: entry IF
  u[(i * n + 0)] = 1;
  p[((i + n) + 0)] = 0;
  q[(i * n + 0)] = u[(i * n + 0)];
for(int64_t j = 1; j < (n - 1);   j = j + 1){
  p[(i * n + j)] = (-(f) / ((d * p[((i * n + j) - 1)]) + e));
  q[(i * n + j)] = (((((-(a) * v[((i - 1) * n + j)]) + ((1 + (2 * a)) * v[(i * n + j)])) - (c * v[((i + 1) * n + j)])) - (d * q[((i * n + j) - 1)])) / ((d * p[((i * n + j) - 1)]) + e));
}
  u[((i * n + n) - 1)] = 1;
for(int64_t j = n + -2; j >= 1;   j = j + -1){
  u[(i * n + j)] = ((p[(i * n + j)] * u[((i * n + j) + 1)]) + q[(i * n + j)]);
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp15;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp15_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp17;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp20;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp17_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  double DX;
  double DY;
  double DT;
  double mul1;
  double mul2;
  double __FIXME__div10;
  double b;
  double __FIXME__div12;
  double e;
  int32_t t;
  uint32_t j;
  uint32_t k;

  DX = (1 / (double)(n));
  DY = (1 / (double)(n));
  DT = (1 / (double)(tsteps));
  mul1 = (((2 * DT) / DX) / DX);
  mul2 = (((1 * DT) / DY) / DY);
  __FIXME__div10 = (-(mul1) / 2);
  b = (1 + mul1);
  __FIXME__div12 = (-(mul2) / 2);
  e = (1 + mul2);
// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  uint32_t __FIXME__call = num_blocks((n - 2), 256);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp15.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp15_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp15)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_column_sweep(tsteps, n, u, v, p, q, __FIXME__div10, b, __FIXME__div10, __FIXME__div12, e, __FIXME__div12, __FIXME__call, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  uint32_t __FIXME__call19 = num_blocks((n - 2), 256);
  __FIXME__agg_2e_tmp17.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call19;
  __FIXME__agg_2e_tmp17.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp17.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp20.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp17_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp17)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp20_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp20)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call19;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
kernel_row_sweep(tsteps, n, u, v, p, q, __FIXME__div10, b, __FIXME__div10, __FIXME__div12, e, __FIXME__div12, __FIXME__call19, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* u) {
  int64_t i;
  uint64_t j;
  int32_t __FIXME__call11;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), u[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
