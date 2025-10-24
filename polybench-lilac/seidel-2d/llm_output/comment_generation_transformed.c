/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define INIT_J_OFFSET 2
#define INIT_CONST_TERM 2
#define STENCIL_HALO_RADIUS 1
#define STENCIL_BORDER_THICKNESS 2
#define STENCIL_NEIGHBOR_COUNT 9
#define BLOCK_DIM_X 8
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_Z 1
#define GRID_DIM_Z 1
#define DIM3_BYTE_SIZE 12
#define PRINT_FORMAT_BUF_SIZE 8
#define NEWLINE_BUF_SIZE 2
#define ARG_DUMP_INDEX 1
#define ARG_N_INDEX 2
#define ARG_TSTEPS_INDEX 3

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
struct uint8_array_1 {
  uint8_t array[1];
};
struct uint8_array_20 {
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
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stencil(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_format_str[PRINT_FORMAT_BUF_SIZE] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_BUF_SIZE] = { "\n" };


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
  int32_t n;
  int32_t tsteps;
  uint8_t* A;

// Parse command-line args (dump flag, n, tsteps), allocate an n×n buffer A, and initialize it before computation
  dump_code = atoi(argv[ARG_DUMP_INDEX]);
  n = atoi(argv[ARG_N_INDEX]);
  tsteps = atoi(argv[ARG_TSTEPS_INDEX]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  init_array(n, (double*)A);
;
  kernel(tsteps, n, (double*)A);
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(n, (double*)A);
  }
free(((uint8_t*)((double*)A)));
  return 0;
}
// Initialize the n×n array A with deterministic values based on (i,j)—an affine function scaled by 1/n—to seed subsequent computations
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// Nested loops over all (i,j) fill A[i*n + j] with (i*(j + INIT_J_OFFSET) + INIT_CONST_TERM)/n for reproducible initialization::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = ((((double)(i) * (double)((j + INIT_J_OFFSET))) + INIT_CONST_TERM) / (double)(n));
}
}
  return;
}
// Compute ceil(num/factor) to determine how many blocks are needed along a dimension
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// CUDA-style 2D stencil kernel: each thread computes one interior cell of A using halo-aware indices and boundary guards
void kernel_stencil(uint32_t tsteps, uint32_t n, double* A, uint32_t gridDimX, uint32_t gridDimY, uint32_t gridDimZ, uint32_t blockDimX, uint32_t blockDimY, uint32_t blockDimZ, uint32_t blockIdxX, uint32_t blockIdxY, uint32_t blockIdxZ, uint32_t threadIdxX, uint32_t threadIdxY, uint32_t threadIdxZ) {
  int32_t i;
  int32_t j;

// Compute global thread coords offset by STENCIL_HALO_RADIUS and proceed only if both i and j lie inside [halo, n - halo); otherwise do nothing
  i = blockDimX * blockIdxX + threadIdxX + STENCIL_HALO_RADIUS;
  j = blockDimY * blockIdxY + threadIdxY + STENCIL_HALO_RADIUS;
  if (i < (n - STENCIL_HALO_RADIUS)) { // IFELSE MARKER: entry IF
  if (j < (n - STENCIL_HALO_RADIUS)) { // IFELSE MARKER: land.lhs.true IF
  int centerIndex = i * n + j;
  __auto_type haloRadius = STENCIL_HALO_RADIUS;
  int iMinusRadius = i - haloRadius;
  int jMinusRadius = j - haloRadius;
  int iMinus1 = i - 1;
  int jPlus1 = j + 1;
  int iPlus1 = i + 1;
  int jMinus1 = j - 1;
  int topLeftIndex = iMinusRadius * n + jMinusRadius;
  int topIndex = iMinusRadius * n + j;
  int topRightIndex = iMinus1 * n + jPlus1;
  int leftIndex = centerIndex - 1;
  int rightIndex = centerIndex + 1;
  int bottomLeftIndex = iPlus1 * n + jMinus1;
  int bottomIndex = iPlus1 * n + j;
  int bottomRightIndex = iPlus1 * n + jPlus1;
  double sum1 = A[topLeftIndex] + A[topIndex];
  double sum2 = sum1 + A[topRightIndex];
  double sum3 = sum2 + A[leftIndex];
  double sum4 = sum3 + A[centerIndex];
  double sum5 = sum4 + A[rightIndex];
  double sum6 = sum5 + A[bottomLeftIndex];
  double sum7 = sum6 + A[bottomIndex];
  double sum8 = sum7 + A[bottomRightIndex];
  double average = sum8 / STENCIL_NEIGHBOR_COUNT;
  A[(i * n + j)] = average;
  }
  }
  return;
}
// Driver routine that configures grid/block sizes and applies the stencil kernel for tsteps over the n×n array A
void kernel(uint32_t tsteps, uint32_t n, double* A) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_tmp;    /* Address-exposed local */
  struct Dim3 block_tmp;    /* Address-exposed local */
  struct Dim3Coerce grid_coerce;    /* Address-exposed local */
  struct Dim3Coerce block_coerce;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

// Time-stepping loop: for each t in [1..tsteps], configure block/grid geometry and execute one stencil update::for.cond
for(int32_t t = 1; t <= tsteps;   t = t + 1){
  block.x = BLOCK_DIM_X;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  uint32_t num_blocks_x = num_blocks(n - STENCIL_BORDER_THICKNESS, block.x);
  uint32_t num_blocks_y = num_blocks(n - STENCIL_BORDER_THICKNESS, block.y);
  grid.x = num_blocks_x;
  grid.y = num_blocks_y;
  grid.z = GRID_DIM_Z;
  memcpy(((uint8_t*)(&grid_tmp)), ((uint8_t*)(&grid)), DIM3_BYTE_SIZE);
  memcpy(((uint8_t*)(&block_tmp)), ((uint8_t*)(&block)), DIM3_BYTE_SIZE);
  memcpy(((uint8_t*)(&grid_coerce)), ((uint8_t*)(&grid_tmp)), DIM3_BYTE_SIZE);
  memcpy(((uint8_t*)(&block_coerce)), ((uint8_t*)(&block_tmp)), DIM3_BYTE_SIZE);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < num_blocks_x;   j = j + 1){
for(int32_t k = 0; k < num_blocks_y;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
kernel_stencil(tsteps, n, A, num_blocks_x, num_blocks_y, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}
// Print the n×n contents of A to stderr using a fixed format for verification/debugging
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

// Traverse A row-major over all (i,j) and print each element using print_format_str::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  fprintf(stderr, print_format_str, A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
