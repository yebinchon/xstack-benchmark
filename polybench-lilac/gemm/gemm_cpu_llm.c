/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define FORMAT_SPEC_BUF_SIZE 8
#define NEWLINE_STR_BUF_SIZE 2
#define DOUBLE_SIZE_BYTES 8
#define DEFAULT_ALPHA 32412
#define DEFAULT_BETA 2123
#define BLOCK_THREADS_TOTAL 256
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_X 8
#define GRID_DIM_Z 1
#define BLOCK_DIM_Z 1
#define DIM3_STRUCT_SIZE_BYTES 12
#define LAUNCH_COERCE_STRUCT_SIZE_BYTES 12
#define DUMP_FLAG_ENABLED 1
#define ARG_IDX_DUMP_CODE 1
#define ARG_IDX_NI 2
#define ARG_IDX_NJ 3
#define ARG_IDX_NK 4

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
struct dim3;
struct dim3_launch_coerce;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
  uint8_t array[20];
};
struct dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_launch_coerce {
  uint64_t val64;
  uint32_t val32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_dev(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_double_format_str[FORMAT_SPEC_BUF_SIZE] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_STR_BUF_SIZE] = { "\n" };


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
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
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
  int32_t nk;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

// Parse command-line args for dump flag and matrix sizes (ni, nj, nk), then allocate A (ni*nk doubles)
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  ni = atoi(argv[ARG_IDX_NI]);
  nj = atoi(argv[ARG_IDX_NJ]);
  nk = atoi(argv[ARG_IDX_NK]);
  A = malloc(ni * nk * DOUBLE_SIZE_BYTES);
  B = malloc(nk * nj * DOUBLE_SIZE_BYTES);
  C = malloc(ni * nj * DOUBLE_SIZE_BYTES);
  init_array(ni, nj, nk, (double*)C, (double*)A, (double*)B);
;
  kernel(ni, nj, nk, DEFAULT_ALPHA, DEFAULT_BETA, (double*)C, (double*)A, (double*)B);
;
  if (dump_code == DUMP_FLAG_ENABLED) {
print_array(ni, nj, (double*)C);
  }
free((uint8_t*)((double*)C));
free((uint8_t*)((double*)A));
free((uint8_t*)((double*)B));
  return 0;
}
// Initializes matrices for GEMM: fills A (ni x nk), B (nk x nj), and C (ni x nj) with predictable index-based values for testing
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B) {
  int64_t i;
  int64_t j;

// Fill B (nk x nj) in row-major order with (i*j)/ni to create a reproducible input matrix::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
// Fill B (nk x nj) in row-major order with (i*j)/ni to create a reproducible input matrix::for.cond10
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  A[(i * nk + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
// Fill B (nk x nj) in row-major order with (i*j)/ni to create a reproducible input matrix::for.cond31
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  B[(i * nj + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
  return;
}
// Returns ceil(num / factor): the number of blocks of size 'factor' needed to cover 'num' items
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Device-style kernel where each thread computes one C[i,j] = beta*C[i,j] + alpha*sum_k A[i,k]*B[k,j] using its block/thread indices
void kernel_dev(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  double dot;
  int64_t k;

// Bounds-check the thread's (i,j); if within [0,ni) x [0,nj), initialize dot = beta*C[i,j] and loop over k to accumulate the A·B product
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni && j < nj) {
dot = (C[(i * nj + j)] * beta);
for(int64_t k = 0; k < nk;   k = k + 1){
dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
}
C[(i * nj + j)] = dot;
  }
  return;
}
// Host wrapper that sets up grid/block dimensions and launches kernel_dev across a 2D grid to compute C = alpha*A*B + beta*C
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B) {
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 grid_agg_tmp;    /* Address-exposed local */
  struct dim3 block_agg_tmp;    /* Address-exposed local */
  struct dim3_launch_coerce grid_launch_coerce;    /* Address-exposed local */
  struct dim3_launch_coerce block_launch_coerce;    /* Address-exposed local */
  uint32_t block_dim_x;
  int32_t grid_dim_x;
  int32_t grid_dim_y;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;

  block_dim_x = (BLOCK_THREADS_TOTAL / BLOCK_DIM_Y);
  block.x = block_dim_x;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  grid_dim_x = num_blocks(ni, block.x);
  grid_dim_y = num_blocks(nj, block.y);
  grid.x = grid_dim_x;
  grid.y = grid_dim_y;
  grid.z = GRID_DIM_Z;
  uint8_t* grid_bytes_dst = (uint8_t*)&grid_agg_tmp;
  uint8_t* grid_bytes_src = (uint8_t*)&grid;
  int dim3_size_bytes = DIM3_STRUCT_SIZE_BYTES;
  memcpy(grid_bytes_dst, grid_bytes_src, dim3_size_bytes);
  uint8_t* block_bytes_dst = (uint8_t*)&block_agg_tmp;
  uint8_t* block_bytes_src = (uint8_t*)&block;
  int dim3_size_bytes2 = DIM3_STRUCT_SIZE_BYTES;
  memcpy(block_bytes_dst, block_bytes_src, dim3_size_bytes2);
  uint8_t* grid_coerce_bytes_dst = (uint8_t*)&grid_launch_coerce;
  uint8_t* grid_agg_bytes_src = (uint8_t*)&grid_agg_tmp;
  int launch_coerce_size_bytes = LAUNCH_COERCE_STRUCT_SIZE_BYTES;
  memcpy(grid_coerce_bytes_dst, grid_agg_bytes_src, launch_coerce_size_bytes);
  uint8_t* block_coerce_bytes_dst = (uint8_t*)&block_launch_coerce;
  uint8_t* block_agg_bytes_src = (uint8_t*)&block_agg_tmp;
  int launch_coerce_size_bytes2 = LAUNCH_COERCE_STRUCT_SIZE_BYTES;
  memcpy(block_coerce_bytes_dst, block_agg_bytes_src, launch_coerce_size_bytes2);
// OpenMP-parallel nested loops over all grid blocks (grid_dim_x by grid_dim_y) to process each block of the computation::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_dim_x;   i = i + 1){
for(int32_t j = 0; j < grid_dim_y;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
int32_t grid_dim_x_param = grid_dim_x;
int32_t grid_dim_y_param = grid_dim_y;
int32_t grid_dim_z_param = GRID_DIM_Z;
uint32_t block_dim_x_param = block_dim_x;
int block_dim_y_param = BLOCK_DIM_Y;
int block_dim_z_param = BLOCK_DIM_Z;
int32_t block_idx_x = i;
int32_t block_idx_y = j;
int block_idx_z = 0;
int32_t thread_idx_x = k;
int32_t thread_idx_y = l;
int thread_idx_z = 0;
kernel_dev(ni, nj, nk, alpha, beta, C, A, B, grid_dim_x_param, grid_dim_y_param, grid_dim_z_param, block_dim_x_param, block_dim_y_param, block_dim_z_param, block_idx_x, block_idx_y, block_idx_z, thread_idx_x, thread_idx_y, thread_idx_z);
}
}
}
}
  return;
}
// Prints the ni-by-nj matrix C to stderr using a fixed floating-point format
void print_array(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;

// Iterate over all rows and columns of C and print each element in row-major order::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  fprintf(stderr, print_double_format_str, C[(i * nj + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
