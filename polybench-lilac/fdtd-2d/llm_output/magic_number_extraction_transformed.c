/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define FDTD_E_UPDATE_COEFF 0.5
#define SPLAT_BLOCK_DIM_X 256
#define DIM3_STRUCT_SIZE_BYTES 12
#define ARG_IDX_TMAX 2
#define ARG_IDX_NX 3
#define ARG_IDX_NY 4
#define ARG_IDX_DUMP 1
#define DUMP_ENABLED_VALUE 1
#define INIT_EY_J_OFFSET 2
#define INIT_HZ_J_OFFSET 3

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
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_splat(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_ey(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_ex(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_hz(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */
int main(int argc, char ** argv) {
  int32_t tmax;
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* ex;
  uint8_t* ey;
  uint8_t* hz;
  uint8_t* _fict_;

// INSERT COMMENT IFELSE: main::entry
  tmax = atoi(argv[ARG_IDX_TMAX]);
  nx = atoi(argv[ARG_IDX_NX]);
  ny = atoi(argv[ARG_IDX_NY]);
  dump_code = atoi(argv[ARG_IDX_DUMP]);
  ex = malloc(nx * ny * BYTES_PER_DOUBLE);
  ey = malloc(nx * ny * BYTES_PER_DOUBLE);
  hz = malloc(nx * ny * BYTES_PER_DOUBLE);
  _fict_ = malloc(ny * BYTES_PER_DOUBLE);
  init_array(nx, ny, ((double*)ex), ((double*)ey), ((double*)hz), ((double*)_fict_));
;
  kernel(tmax, nx, ny, ((double*)ex), ((double*)ey), ((double*)hz), ((double*)_fict_));
;
  if (dump_code == DUMP_ENABLED_VALUE) { // IFELSE MARKER: entry IF
print_array(nx, ny, ((double*)ex), ((double*)ey), ((double*)hz));
  }
free(((uint8_t*)((double*)ex)));
free(((uint8_t*)((double*)ey)));
free(((uint8_t*)((double*)hz)));
free(((uint8_t*)((double*)_fict_)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* _fict_) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  _fict_[i] = (double)(i);
}
// INSERT COMMENT LOOP: init_array::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  ex[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
  ey[(i * ny + j)] = (((double)(i) * (double)((j + INIT_EY_J_OFFSET))) / (double)(ny));
  hz[(i * ny + j)] = (((double)(i) * (double)((j + INIT_HZ_J_OFFSET))) / (double)(nx));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_splat
void kernel_splat(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t j;

// INSERT COMMENT IFELSE: kernel_splat::entry
  j = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  if (j < ny) { // IFELSE MARKER: entry IF
  ey[(0 * ny + j)] = fict[t];
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_ey
void kernel_ey(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_ey::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + 1;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < nx && j < ny) {
    ey[(i * ny + j)] = (ey[(i * ny + j)] - (FDTD_E_UPDATE_COEFF * (hz[(i * ny + j)] - hz[((i - 1) * ny + j)])));
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_ex
void kernel_ex(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_ex::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y + 1;
  if (i < nx && j < ny) {
    ex[(i * ny + j)] = (ex[(i * ny + j)] - (FDTD_E_UPDATE_COEFF * (hz[(i * ny + j)] - hz[((i * ny + j) - 1)])));
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_hz
void kernel_hz(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict, uint32_t t, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_hz::entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y;
  if (i < (nx - 1)) { // IFELSE MARKER: entry IF
  if (j < (ny - 1)) { // IFELSE MARKER: land.lhs.true IF
  hz[(i * ny + j)] = (hz[(i * ny + j)] - (0.69999999999999996 * (((ex[((i * ny + j) + 1)] - ex[(i * ny + j)]) + ey[((i + 1) * ny + j)]) - ey[(i * ny + j)])));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t tmax, uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz, double* fict) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp1;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp5;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp6;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp5_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp6_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp18;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp19;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp18_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp19_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp32;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp33;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp32_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp33_2e_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// INSERT COMMENT LOOP: kernel::for.cond
for(int32_t t = 0; t < tmax;   t = t + 1){
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = SPLAT_BLOCK_DIM_X;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  uint32_t __FIXME__call = num_blocks(ny, SPLAT_BLOCK_DIM_X);
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp1.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp1_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp1)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < SPLAT_BLOCK_DIM_X;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call;   k = k + 1){
kernel_splat(tmax, nx, ny, ex, ey, hz, fict, t, 256, 1, 1, __FIXME__call, 1, 1, j, 0, 0, k, 0, 0);
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  uint32_t __FIXME__call3 = num_blocks((nx - 1), block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call4 = num_blocks(ny, block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call3;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call4;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp5_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp5)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp6_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp6)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call3;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call4;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_ey(tmax, nx, ny, ex, ey, hz, fict, t, __FIXME__call3, __FIXME__call4, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  uint32_t __FIXME__call14 = num_blocks(nx, block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call17 = num_blocks((ny - 1), block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call14;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call17;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp18)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp19)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp18_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp18)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp19_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp19)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call14;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call17;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_ex(tmax, nx, ny, ex, ey, hz, fict, t, __FIXME__call14, __FIXME__call17, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  uint32_t __FIXME__call28 = num_blocks((nx - 1), block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call31 = num_blocks((ny - 1), block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call28;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call31;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp32)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp33)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp32_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp32)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp33_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp33)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call28;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call31;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_hz(tmax, nx, ny, ex, ey, hz, fict, t, __FIXME__call28, __FIXME__call31, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nx, uint32_t ny, double* ex, double* ey, double* hz) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), ex[(i * ny + j)]);
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), ey[(i * ny + j)]);
  fprintf(stderr, (__FIXME_GLOBAL___OC_str), hz[(i * ny + j)]);
  if ((int)(i * nx + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}
