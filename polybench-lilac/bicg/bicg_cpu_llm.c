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
struct dim3;
struct dim3_coerce;

/* Function definitions */

/* Types Definitions */
struct array_1_uint8_t {
  uint8_t array[1];
};
struct array_20_uint8_t {
  uint8_t array[20];
};
struct dim3 {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_coerce {
  uint64_t x;
  uint32_t y;
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
uint8_t fmt_double_2dp_space[8] = { "%0.2lf " };
uint8_t fmt_newline[2] = { "\n" };


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

// MAIN START
int main(int argc, char ** argv) {
  int32_t m;
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* s;
  uint8_t* q;
  uint8_t* p;
  uint8_t* r;

// Parse CLI arguments (dump flag, m, n) and allocate host buffers A and s sized to m×n and n, respectively
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(m * n * 8);
  s = malloc(n * 8);
  q = malloc(m * 8);
  p = malloc(n * 8);
  r = malloc(m * 8);
  init_array(m, n, (double*)A, (double*)r, (double*)p);
;
  kernel(m, n, (double*)A, (double*)s, (double*)q, (double*)p, (double*)r);
;
  if (dump_code == 1) {
print_array(m, n, (double*)s, (double*)q);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)s)));
free(((uint8_t*)((double*)q)));
free(((uint8_t*)((double*)p)));
free(((uint8_t*)((double*)r)));
  return 0;
}
// MAIN END


// FUNCTION ORDER ID 0 START
// Initialize input arrays: fill r[0..nx-1], p[0..ny-1], and the nx×ny matrix A with deterministic values for benchmarking
void init_array(uint32_t nx, uint32_t ny, double* A, double* r, double* p) {
  int64_t i;
  int64_t j;

// Loop over rows i (0..nx-1): set r[i] and initialize the i-th row of matrix A::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  p[i] = ((double)(i) * 3.1415926535897931);
}
// For the current row i, iterate columns j (0..ny-1) to assign A[i, j] values (and any per-column init)::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
  r[i] = ((double)(i) * 3.1415926535897931);
for(int64_t j = 0; j < ny;   j = j + 1){
  A[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
}
}
  return;
}
// FUNCTION ORDER ID 0 END


// FUNCTION ORDER ID 1 START
// Configure CUDA-like grid/block dimensions and drive the BiCG computation using OpenMP-parallel loops
void kernel(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r) {
  struct dim3 grid_n_dim;    /* Address-exposed local */
  struct dim3 block_n_dim;    /* Address-exposed local */
  struct dim3_coerce grid_n_dim_coerce;    /* Address-exposed local */
  struct dim3_coerce block_n_dim_coerce;    /* Address-exposed local */
  struct dim3 grid_m_dim;    /* Address-exposed local */
  struct dim3 block_m_dim;    /* Address-exposed local */
  struct dim3_coerce grid_m_dim_coerce;    /* Address-exposed local */
  struct dim3_coerce block_m_dim_coerce;    /* Address-exposed local */
  int32_t blocks_n;
  uint32_t i;
  uint32_t j;
  int32_t blocks_m;

  blocks_n = num_blocks(n, 256);
  grid_n_dim.x = blocks_n;
  grid_n_dim.y = 1;
  grid_n_dim.z = 1;
  block_n_dim.x = 256;
  block_n_dim.y = 1;
  block_n_dim.z = 1;
  memcpy(((uint8_t*)(&grid_n_dim_coerce)), ((uint8_t*)(&grid_n_dim)), 12);
  memcpy(((uint8_t*)(&block_n_dim_coerce)), ((uint8_t*)(&block_n_dim)), 12);
// OpenMP-parallel iteration over CUDA-style blocks (i) and threads (j), covering all logical threads::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_n;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_q(m, n, A, s, q, p, r, blocks_n, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  blocks_m = num_blocks(m, 256);
  grid_m_dim.x = blocks_m;
  grid_m_dim.y = 1;
  grid_m_dim.z = 1;
  block_m_dim.x = 256;
  block_m_dim.y = 1;
  block_m_dim.z = 1;
  memcpy(((uint8_t*)(&grid_m_dim_coerce)), ((uint8_t*)(&grid_m_dim)), 12);
  memcpy(((uint8_t*)(&block_m_dim_coerce)), ((uint8_t*)(&block_m_dim)), 12);
// For each block i, sweep 256 thread slots j to execute per-thread work within the block::header.010
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < blocks_m;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_s(m, n, A, s, q, p, r, blocks_m, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// FUNCTION ORDER ID 1 END


// FUNCTION ORDER ID 2 START
// Pretty-print the result vectors s (length ny) and q (length nx) with fixed formatting and periodic line breaks
void print_array(uint32_t nx, uint32_t ny, double* s, double* q) {
  int64_t i;

// Iterate over q, printing each value and inserting a newline after every 20 elements for readability::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  fprintf(stderr, fmt_double_2dp_space, s[i]);
  if (i % 20 == 0) {
  fprintf(stderr, fmt_newline);
  }
}
// Walk through q and emit formatted output, breaking lines at a 20-value cadence::for.cond3
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, fmt_double_2dp_space, q[i]);
  if (i % 20 == 0) {
  fprintf(stderr, fmt_newline);
  }
}
  fprintf(stderr, fmt_newline);
}
// FUNCTION ORDER ID 2 END


// FUNCTION ORDER ID 3 START
// Return ceil(num / factor) to determine how many blocks are needed for a given block size
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// FUNCTION ORDER ID 3 END


// FUNCTION ORDER ID 4 START
// Per-thread worker that computes one element of q as a dot product across the m dimension for index i
void kernel_q(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;
  double dot;

// If global thread index i is within n, zero accumulators and compute q[i] via a dot product over m
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) {
  q[i] = 0;
  dot = 0;
for(int64_t j = 0; j < m;   j = j + 1){
  dot = (dot + (A[(i * m + j)] * p[j]));
}
  q[i] = (q[i] + dot);
  }
  return;
}
// FUNCTION ORDER ID 4 END


// FUNCTION ORDER ID 5 START
// Per-thread worker that computes one element of s as a dot product across the n dimension for index j
void kernel_s(uint32_t m, uint32_t n, double* A, double* s, double* q, double* p, double* r, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;
  double dot;

// If global thread index j is within m, zero accumulators and compute s[j] via a dot product over n
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < m) {
  s[j] = 0;
  dot = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  dot = (dot + (r[i] * A[(i * m + j)]));
}
  s[j] = dot;
  }
  return;
}
// FUNCTION ORDER ID 5 END

