/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define FORMAT_SPEC_BUFSZ 8
#define NEWLINE_BUFSZ 2
#define ARG_IDX_DUMP_CODE 1
#define ARG_IDX_NI 2
#define ARG_IDX_NJ 3
#define ARG_IDX_NK 4
#define ARG_IDX_NL 5
#define ARG_IDX_NM 6
#define BYTES_PER_DOUBLE 8
#define DUMP_CODE_ENABLED 1
#define INIT_B_J_OFFSET 1
#define INIT_C_J_OFFSET 3
#define INIT_D_J_OFFSET 2
#define TOTAL_THREADS_PER_BLOCK 256
#define BLOCK_DIM_Y 32
#define BLOCK_DIM_X 8
#define DIM3_STRUCT_BYTES 12
#define GRID_DIM_Z 1
#define BLOCK_DIM_Z 1
#define PRINT_ELEMS_PER_LINE 20

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
struct Dim3Packed;

/* Function definitions */

/* Types Definitions */
struct uint8_array1 {
  uint8_t array[1];
};
struct uint8_array20 {
  uint8_t array[20];
};
struct Dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct Dim3Packed {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A_mul_B(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t double_format_str[FORMAT_SPEC_BUFSZ] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_BUFSZ] = { "\n" };


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
  int32_t nl;
  int32_t nm;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* E;
  uint8_t* F;
  uint8_t* G;

// Parse command-line arguments to set the dump flag and problem dimensions ni, nj, nk, and nl
  dump_code = atoi(argv[ARG_IDX_DUMP_CODE]);
  ni = atoi(argv[ARG_IDX_NI]);
  nj = atoi(argv[ARG_IDX_NJ]);
  nk = atoi(argv[ARG_IDX_NK]);
  nl = atoi(argv[ARG_IDX_NL]);
  nm = atoi(argv[ARG_IDX_NM]);
  A = malloc(ni * nk * BYTES_PER_DOUBLE);
  B = malloc(nk * nj * BYTES_PER_DOUBLE);
  C = malloc(nj * nm * BYTES_PER_DOUBLE);
  D = malloc(nm * nl * BYTES_PER_DOUBLE);
  E = malloc(ni * nj * BYTES_PER_DOUBLE);
  F = malloc(nj * nl * BYTES_PER_DOUBLE);
  G = malloc(ni * nl * BYTES_PER_DOUBLE);
  init_array(ni, nj, nk, nl, nm, (double*)A, (double*)B, (double*)C, (double*)D, (double*)E, (double*)F, (double*)G);
;
  kernel(ni, nj, nk, nl, nm, (double*)E, (double*)A, (double*)B, (double*)F, (double*)C, (double*)D, (double*)G);
;
  if (dump_code == DUMP_CODE_ENABLED) {
print_array(ni, nl, (double*)G);
  }
free(((uint8_t*)((double*)E)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)F)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
free(((uint8_t*)((double*)G)));
  return 0;
}
// Initialize problem-sized arrays using the provided dimensions, populating inputs and clearing outputs for subsequent kernels
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* A, double* B, double* C, double* D, double* E, double* F, double* G) {
  int64_t i;
  int64_t j;

// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  int indexA = i * ni + j;
  double di_a = (double)i;
  double dj_a = (double)j;
  double dni = (double)ni;
  double prod_a = di_a * dj_a;
  double valA = prod_a / dni;
  A[(i * ni + j)] = valA;
}
}
// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  int indexB = i * nk + j;
  int j_offset_B = j + INIT_B_J_OFFSET;
  double di_b = (double)i;
  double dj_b = (double)j_offset_B;
  double dnj = (double)nj;
  double prod_b = di_b * dj_b;
  double valB = prod_b / dnj;
  B[(i * nk + j)] = valB;
}
}
// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond32
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nm;   j = j + 1){
  int indexC = i * nj + j;
  int j_offset_C = j + INIT_C_J_OFFSET;
  double di_c = (double)i;
  double dj_c = (double)j_offset_C;
  double dnl = (double)nl;
  double prod_c = di_c * dj_c;
  double valC = prod_c / dnl;
  C[(i * nj + j)] = valC;
}
}
// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond54
for(int64_t i = 0; i < nm;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  int indexD = i * nm + j;
  int j_offset_D = j + INIT_D_J_OFFSET;
  double di_d = (double)i;
  double dj_d = (double)j_offset_D;
  double dnk = (double)nk;
  double prod_d = di_d * dj_d;
  double valD = prod_d / dnk;
  D[(i * nm + j)] = valD;
}
}
// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond76
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  E[(i * ni + j)] = 0;
}
}
// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond92
for(int64_t i = 0; i < nj;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  F[(i * nj + j)] = 0;
}
}
// Traverse all ni*nl entries of G and set them to 0 (zero-initialize the output matrix)::for.cond108
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  G[(i * ni + j)] = 0;
}
}
  return;
}
// Return ceil(num/factor): the number of blocks of size 'factor' required to cover 'num' items
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// CUDA-like 2D kernel that computes C[i,j] as the dot product of row i of A and column j of B using grid/block indices
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

// Compute (i,j) from block/thread IDs; if within bounds, accumulate the dot product over k for C[i,j], preventing out-of-bounds access
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni && j < nj) {
dot = 0;
for(int64_t k = 0; k < nk;   k = k + 1){
dot = (dot + (A[(i * nk + k)] * B[(k * nj + j)]));
}
C[(i * nj + j)] = dot;
  }
  return;
}
// Configure launch geometry and orchestrate matrix-multiply sub-kernels, using OpenMP to emulate a GPU-style 2D block grid
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, uint32_t nm, double* E, double* A, double* B, double* F, double* C, double* D, double* G) {
  struct Dim3 block;    /* Address-exposed local */
  struct Dim3 grid;    /* Address-exposed local */
  struct Dim3 grid_tmp1;    /* Address-exposed local */
  struct Dim3 block_tmp1;    /* Address-exposed local */
  struct Dim3Packed grid_tmp1_packed;    /* Address-exposed local */
  struct Dim3Packed block_tmp1_packed;    /* Address-exposed local */
  struct Dim3 grid_tmp2;    /* Address-exposed local */
  struct Dim3 block_tmp2;    /* Address-exposed local */
  struct Dim3Packed grid_tmp2_packed;    /* Address-exposed local */
  struct Dim3Packed block_tmp2_packed;    /* Address-exposed local */
  struct Dim3 grid_tmp3;    /* Address-exposed local */
  struct Dim3 block_tmp3;    /* Address-exposed local */
  struct Dim3Packed grid_tmp3_packed;    /* Address-exposed local */
  struct Dim3Packed block_tmp3_packed;    /* Address-exposed local */
  uint32_t block_threads_x;
  int32_t grid_x_blocks_1;
  int32_t grid_y_blocks_1;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_x_blocks_2;
  int32_t grid_y_blocks_2;
  int32_t grid_x_blocks_3;
  int32_t grid_y_blocks_3;

  block_threads_x = (TOTAL_THREADS_PER_BLOCK / BLOCK_DIM_Y);
  block.x = block_threads_x;
  block.y = BLOCK_DIM_Y;
  block.z = BLOCK_DIM_Z;
  grid_x_blocks_1 = num_blocks(ni, block.x);
  grid_y_blocks_1 = num_blocks(nj, block.y);
  grid.x = grid_x_blocks_1;
  grid.y = grid_y_blocks_1;
  grid.z = GRID_DIM_Z;
  memcpy(((uint8_t*)(&grid_tmp1)), ((uint8_t*)(&grid)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&block_tmp1)), ((uint8_t*)(&block)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&grid_tmp1_packed)), ((uint8_t*)(&grid_tmp1)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&block_tmp1_packed)), ((uint8_t*)(&block_tmp1)), DIM3_STRUCT_BYTES);
// OpenMP-parallel 2D iteration over block coordinates; collapse(2) flattens the loops to distribute blocks across threads::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_x_blocks_1;   i = i + 1){
for(int32_t j = 0; j < grid_y_blocks_1;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, E, A, B, grid_x_blocks_1, grid_y_blocks_1, GRID_DIM_Z, block_threads_x, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  grid_x_blocks_2 = num_blocks(nj, block.x);
  grid_y_blocks_2 = num_blocks(nl, block.y);
  grid.x = grid_x_blocks_2;
  grid.y = grid_y_blocks_2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_tmp2)), ((uint8_t*)(&grid)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&block_tmp2)), ((uint8_t*)(&block)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&grid_tmp2_packed)), ((uint8_t*)(&grid_tmp2)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&block_tmp2_packed)), ((uint8_t*)(&block_tmp2)), DIM3_STRUCT_BYTES);
// OpenMP-parallel 2D iteration over block coordinates; collapse(2) flattens the loops to distribute blocks across threads::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_x_blocks_2;   i = i + 1){
for(int32_t j = 0; j < grid_y_blocks_2;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_A_mul_B(nj, nl, nm, F, C, D, grid_x_blocks_2, grid_y_blocks_2, GRID_DIM_Z, block_threads_x, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  grid_x_blocks_3 = num_blocks(ni, block.x);
  grid_y_blocks_3 = num_blocks(nl, block.y);
  grid.x = grid_x_blocks_3;
  grid.y = grid_y_blocks_3;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_tmp3)), ((uint8_t*)(&grid)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&block_tmp3)), ((uint8_t*)(&block)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&grid_tmp3_packed)), ((uint8_t*)(&grid_tmp3)), DIM3_STRUCT_BYTES);
  memcpy(((uint8_t*)(&block_tmp3_packed)), ((uint8_t*)(&block_tmp3)), DIM3_STRUCT_BYTES);
// OpenMP-parallel 2D iteration over block coordinates; collapse(2) flattens the loops to distribute blocks across threads::header.030
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_x_blocks_3;   i = i + 1){
for(int32_t j = 0; j < grid_y_blocks_3;   j = j + 1){
for(int32_t k = 0; k < BLOCK_DIM_X;   k = k + 1){
for(int32_t l = 0; l < BLOCK_DIM_Y;   l = l + 1){
kernel_A_mul_B(ni, nl, nj, G, E, F, grid_x_blocks_3, grid_y_blocks_3, GRID_DIM_Z, block_threads_x, BLOCK_DIM_Y, BLOCK_DIM_Z, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// Print the ni-by-nl result matrix G to stderr using a fixed floating-point format for verification
void print_array(uint32_t ni, uint32_t nl, double* G) {
  int64_t i;
  int64_t j;

// Walk the ni-by-nl grid and print each G element in row-major order using the specified format::for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  fprintf(stderr, double_format_str, G[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)PRINT_ELEMS_PER_LINE == 0) {
  fprintf(stderr, newline_str);
  }
}
}
  fprintf(stderr, newline_str);
}
