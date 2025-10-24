/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define DOUBLE_SIZE_BYTES 8
#define PRINTF_FMT_STR_LEN 8
#define NEWLINE_STR_LEN 2
#define DUMP_CODE_ENABLED 1
#define HALO_WIDTH 1
#define HALO_WIDTH_TIMES_2 2
#define STENCIL_CENTER_WEIGHT 2
#define STENCIL_AXIS_DIVISOR 8
#define BLOCK_DIM_X 1
#define BLOCK_DIM_Y 8
#define BLOCK_DIM_Z 32
#define DIM3_STRUCT_SIZE_BYTES 12
#define BYTE_ARRAY20_LEN 20

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
struct byte_array_1 {
  uint8_t array[1];
};
struct byte_array_20 {
  uint8_t array[BYTE_ARRAY20_LEN];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Coerce {
  uint64_t x;
  uint32_t y;
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
uint8_t double_print_format[PRINTF_FMT_STR_LEN] = { "%0.2lf " };
uint8_t newline_string[NEWLINE_STR_LEN] = { "\n" };


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
  int32_t tsteps;
  int32_t n;
  uint8_t* A;
  uint8_t* B;

// Parse command-line args (dump flag, tsteps, n) and allocate A and B as n*n*n double buffers
  dump_code = atoi(argv[1]);
  tsteps = atoi(argv[2]);
  n = atoi(argv[3]);
  A = malloc(n * n * n * DOUBLE_SIZE_BYTES);
  B = malloc(n * n * n * DOUBLE_SIZE_BYTES);
  init_array(n, (double*)A, (double*)B);
;
  kernel(tsteps, n, (double*)A, (double*)B);
;
  if (dump_code == DUMP_CODE_ENABLED) {
print_array(n, (double*)A);
  }
free((uint8_t*)((double*)A));
free((uint8_t*)((double*)B));
  return 0;
}
// Initialize the 3D arrays A and B for an n*n*n domain using nested loops to prepare input data for the stencil
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;
  uint64_t j;
  uint64_t k;

// Triple-nested loop over all 3D indices (i,j,k) in the n*n*n domain to initialize arrays A and B::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
for(int64_t k = 0; k < n;   k = k + 1){
  int ij_index = i * n + j;
  int ijk_index = ij_index * n + k;
  double sum_ijk = (double)i + (double)j + (double)k;
  double n_as_double = (double)n;
  double value_a = sum_ijk / n_as_double;
  A[((i * n + j) * n + k)] = value_a;
  int ij_index_b = i * n + j;
  int ijk_index_b = ij_index_b * n + k;
  double sum_ijk_b = (double)i + (double)j + (double)k;
  double n_as_double_b = (double)n;
  double value_b = (sum_ijk_b + 1.0) / n_as_double_b;
  B[((i * n + j) * n + k)] = value_b;
}
}
}
  return;
}
// Compute ceil(num / factor) to determine how many blocks of size 'factor' are needed to cover 'num' items
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// CUDA-like 3D stencil kernel: compute global (i,j,k) from grid/block indices with a halo offset and update interior points, reading from A and writing to B
void kernel_stencil(uint32_t iter, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int32_t k;

// Compute the thread's global 3D index with a halo offset, then process only if i and j lie within [HALO_WIDTH, iter - HALO_WIDTH); out-of-range threads do nothing
  i = blockDim_x * blockIdx_x + threadIdx_x + HALO_WIDTH;
  j = blockDim_y * blockIdx_y + threadIdx_y + HALO_WIDTH;
  k = blockDim_z * blockIdx_z + threadIdx_z + HALO_WIDTH;
  if (i < (iter - HALO_WIDTH)) {
  if (j < (iter - HALO_WIDTH)) {
  if (k < (iter - HALO_WIDTH)) {
  B[((i * iter + j) * iter + k)] = ((((((A[(((i + HALO_WIDTH) * iter + j) * iter + k)] - STENCIL_CENTER_WEIGHT * A[((i * iter + j) * iter + k)]) + A[(((i - HALO_WIDTH) * iter + j) * iter + k)]) / STENCIL_AXIS_DIVISOR) + (((A[((i * iter + (j + HALO_WIDTH)) * iter + k)] - (STENCIL_CENTER_WEIGHT * A[((i * iter + j) * iter + k)])) + A[((i * iter + (j - HALO_WIDTH)) * iter + k)]) / STENCIL_AXIS_DIVISOR)) + (((A[(((i * iter + j) * iter + k) + 1)] - (STENCIL_CENTER_WEIGHT * A[((i * iter + j) * iter + k)])) + A[(((i * iter + j) * iter + k) - 1)]) / STENCIL_AXIS_DIVISOR)) + A[((i * iter + j) * iter + k)]);
  }
  }
  }
  return;
}
// Driver routine for the stencil: iterate for tsteps, configure grid/block dimensions, and launch kernel_stencil on arrays A and B
void kernel(uint32_t tsteps, uint32_t iter, double* A, double* B) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_tmp;    /* Address-exposed local */
  struct Dim3 block_tmp;    /* Address-exposed local */
  struct Dim3Coerce grid_tmp_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_tmp_coerce;    /* Address-exposed local */
  struct Dim3 grid_tmp2;    /* Address-exposed local */
  struct Dim3 block_tmp2;    /* Address-exposed local */
  struct Dim3Coerce grid_tmp2_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_tmp2_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;
  uint32_t n;

// Time-stepping loop: for each step, set execution parameters (e.g., block size/grid) and perform one stencil update::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  uint32_t num_blocks_x = num_blocks(iter - HALO_WIDTH_TIMES_2, block.x);
  uint32_t num_blocks_y = num_blocks(iter - HALO_WIDTH_TIMES_2, block.y);
  uint32_t num_blocks_z = num_blocks(iter - HALO_WIDTH_TIMES_2, block.z);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = num_blocks_z;
  memcpy(((uint8_t*)(&grid_tmp)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_tmp)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&grid_tmp_coerce)), ((uint8_t*)(&grid_tmp)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&block_tmp_coerce)), ((uint8_t*)(&block_tmp)), DIM3_STRUCT_SIZE_BYTES);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < num_blocks_z;   l = l + 1){
for(int32_t m = 0; m < 8;   m = m + 1){
for(int32_t n = 0; n < 32;   n = n + 1){
kernel_stencil(iter, A, B, num_blocks_x, num_blocks_y, num_blocks_z, 1, 8, 32, j, k, l, 0, m, n);
}
}
}
}
}
  memcpy(((uint8_t*)(&grid_tmp2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_tmp2_coerce)), ((uint8_t*)(&grid_tmp2)), 12);
  memcpy(((uint8_t*)(&block_tmp2_coerce)), ((uint8_t*)(&block_tmp2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < num_blocks_z;   l = l + 1){
for(int32_t m = 0; m < 8;   m = m + 1){
for(int32_t n = 0; n < 32;   n = n + 1){
kernel_stencil(iter, B, A, num_blocks_x, num_blocks_y, num_blocks_z, 1, 8, 32, j, k, l, 0, m, n);
}
}
}
}
}
}
  return;
}
// Print all elements of 3D array A of size n*n*n in a consistent order for verification or debugging
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;
  uint64_t k;

// Triple-nested loop over all 3D indices (i,j,k) to output A's values in a deterministic order::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
for(int64_t k = 0; k < n;   k = k + 1){
  fprintf(stderr, double_print_format, A[((i * n + j) * n + k)]);
  if ((int)((i * n + j) * n + k) % (int)20 == 0) {
  fprintf(stderr, newline_string);
  }
}
}
}
  fprintf(stderr, newline_string);
}
