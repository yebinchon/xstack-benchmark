/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define ALPHA_DEFAULT 32412
#define BETA_DEFAULT 2123
#define PRINTF_FMT_BUF_LEN 8
#define NEWLINE_STR_BUF_LEN 2
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_Z 1
#define GRID_DIM_Z 1
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
struct Dim3;
struct Dim3Coerce;

/* Function definitions */

/* Types Definitions */
struct Uint8Array1 {
  uint8_t array[1];
};
struct Uint8Array20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Coerce {
  uint64_t value64;
  uint32_t value32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double, double, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_tmp(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_C(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_sum(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_print_format[PRINTF_FMT_BUF_LEN] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_STR_BUF_LEN] = { "\n" };


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
  int32_t ni;
  int32_t nj;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* tmp;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  A = malloc(nj * nj * BYTES_PER_DOUBLE);
  B = malloc(ni * nj * BYTES_PER_DOUBLE);
  C = malloc(ni * nj * BYTES_PER_DOUBLE);
  tmp = malloc(ni * nj * BYTES_PER_DOUBLE);
  init_array(ni, nj, ((double*)C), ((double*)A), ((double*)B), ((double*)tmp));
;
  kernel(ni, nj, ALPHA_DEFAULT, BETA_DEFAULT, ((double*)C), ((double*)A), ((double*)B), ((double*)tmp));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(ni, nj, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, double* C, double* A, double* B, double* tmp) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int c_index = i * nj + j;
  double c_ij_product = (double)i * (double)j;
  double c_ni_double = (double)ni;
  double c_value = c_ij_product / c_ni_double;
  C[(i * nj + j)] = c_value;
  int b_index = i * nj + j;
  double b_ij_product = (double)i * (double)j;
  double b_ni_double = (double)ni;
  double b_value = b_ij_product / b_ni_double;
  B[(i * nj + j)] = b_value;
  tmp[(i * nj + j)] = 0;
}
}
// INSERT COMMENT LOOP: init_array::for.cond23
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int a_index = i * nj + j;
  double a_ij_product = (double)i * (double)j;
  double a_ni_double = (double)ni;
  double a_value = a_ij_product / a_ni_double;
  A[(i * nj + j)] = a_value;
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_tmp
void kernel_tmp(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_tmp::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < m && j < n) {
for(int64_t k = 0; k < i;   k = k + 1){
tmp[(i * n + j)] = (tmp[(i * n + j)] + (B[(k * n + j)] * A[(i * n + k)]));
}
}
  }
// INSERT COMMENT FUNCTION: kernel_C
void kernel_C(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;

// INSERT COMMENT IFELSE: kernel_C::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < m) { // IFELSE MARKER: entry IF
  if (j < n) { // IFELSE MARKER: land.lhs.true IF
  C[(i * n + j)] = (((beta * C[(i * n + j)]) + ((alpha * B[(i * n + j)]) * A[(i * n + i)])) + (alpha * tmp[(i * n + j)]));
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_sum
void kernel_sum(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t k;
  int32_t j;
  int64_t i;

// INSERT COMMENT IFELSE: kernel_sum::entry
  k = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (k < (m - 1)) { // IFELSE MARKER: entry IF
  if (j < n) { // IFELSE MARKER: land.lhs.true IF
  i = k + 1;
for(int64_t i = k + 1; i < m;   i = i + 1){
  C[(k * n + j)] = (C[(k * n + j)] + ((alpha * B[(i * n + j)]) * A[(i * n + k)]));
}
  }
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_copy;    /* Address-exposed local */
  struct Dim3 block_copy;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_coerce;    /* Address-exposed local */
  struct Dim3 grid_copy2;    /* Address-exposed local */
  struct Dim3 block_copy2;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce2;    /* Address-exposed local */
  struct Dim3Coerce block_coerce2;    /* Address-exposed local */
  struct Dim3 grid_copy3;    /* Address-exposed local */
  struct Dim3 block_copy3;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce3;    /* Address-exposed local */
  struct Dim3Coerce block_coerce3;    /* Address-exposed local */
  int32_t grid_blocks_x;
  int32_t grid_blocks_y;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_blocks_x2;
  int32_t grid_blocks_y2;
  int32_t grid_blocks_x3;
  int32_t grid_blocks_y3;

  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  grid_blocks_x = num_blocks(m, block.x);
  grid_blocks_y = num_blocks(n, block.y);
  grid.x = grid_blocks_x;
  grid.y = grid_blocks_y;
  grid.z = GRID_DIM_Z;
  memcpy(((uint8_t*)(&grid_copy)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_copy)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&grid_coerce)), ((uint8_t*)(&grid_copy)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_coerce)), ((uint8_t*)(&block_copy)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_tmp(m, n, alpha, beta, C, A, B, tmp, grid_blocks_x, grid_blocks_y, BLOCK_DIM_Z, BLOCK_DIM_X, BLOCK_DIM_Y, GRID_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  grid_blocks_x2 = num_blocks(m, block.x);
  grid_blocks_y2 = num_blocks(n, block.y);
  grid.x = grid_blocks_x2;
  grid.y = grid_blocks_y2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerce2)), ((uint8_t*)(&grid_copy2)), 12);
  memcpy(((uint8_t*)(&block_coerce2)), ((uint8_t*)(&block_copy2)), 12);
// INSERT COMMENT LOOP: kernel::header.016
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x2;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_C(m, n, alpha, beta, C, A, B, tmp, grid_blocks_x2, grid_blocks_y2, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  grid_blocks_x3 = num_blocks((m - 1), block.x);
  grid_blocks_y3 = num_blocks(n, block.y);
  grid.x = grid_blocks_x3;
  grid.y = grid_blocks_y3;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_copy3)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_copy3)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_coerce3)), ((uint8_t*)(&grid_copy3)), 12);
  memcpy(((uint8_t*)(&block_coerce3)), ((uint8_t*)(&block_copy3)), 12);
// INSERT COMMENT LOOP: kernel::header.036
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_blocks_x3;   i = i + 1){
for(int32_t j = 0; j < grid_blocks_y3;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_sum(m, n, alpha, beta, C, A, B, tmp, grid_blocks_x3, grid_blocks_y3, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  fprintf(stderr, (double_print_format), C[(i * nj + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_str));
  }
}
}
  fprintf(stderr, (newline_str));
}
