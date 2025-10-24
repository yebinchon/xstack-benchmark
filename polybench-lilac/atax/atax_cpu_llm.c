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
struct Dim3;
struct Dim3Packed;

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
struct Dim3Packed {
  uint64_t packed64;
  uint32_t packed32;
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
uint8_t double_format_str[FORMAT_STR_BUF_LEN] = { "%0.2lf " };
uint8_t newline_str[NEWLINE_STR_LEN] = { "\n" };


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
  struct Dim3 grid_dim_k3;    /* Address-exposed local */
  struct Dim3 block_dim_k3;    /* Address-exposed local */
  struct Dim3Packed grid_dim_k3_packed;    /* Address-exposed local */
  struct Dim3Packed block_dim_k3_packed;    /* Address-exposed local */
  struct Dim3 grid_dim_k4;    /* Address-exposed local */
  struct Dim3 block_dim_k4;    /* Address-exposed local */
  struct Dim3Packed grid_dim_k4_packed;    /* Address-exposed local */
  struct Dim3Packed block_dim_k4_packed;    /* Address-exposed local */
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x;
  uint8_t* y;
  uint8_t* tmp;
  int32_t grid_dim_x_k3;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_k4;

  nx = atoi(argv[ARG_IDX_NX]);
  ny = atoi(argv[ARG_IDX_NY]);
  dump_code = atoi(argv[ARG_IDX_DUMP_FLAG]);
  A = malloc(nx * ny * BYTES_PER_DOUBLE);
  x = malloc(ny * BYTES_PER_DOUBLE);
  y = malloc(ny * BYTES_PER_DOUBLE);
  tmp = malloc(nx * BYTES_PER_DOUBLE);
double* A_dbl = (double*)A;
double* x_dbl = (double*)x;
double* tmp_dbl = (double*)tmp;
double* y_dbl = (double*)y;
init_array(nx, ny, A_dbl, x_dbl, tmp_dbl, y_dbl);
  grid_dim_x_k3 = num_blocks(nx, THREADS_PER_BLOCK_X);
  grid_dim_k3.x = grid_dim_x_k3;
  grid_dim_k3.y = 1;
  grid_dim_k3.z = 1;
  block_dim_k3.x = THREADS_PER_BLOCK_X;
  block_dim_k3.y = 1;
  block_dim_k3.z = 1;
  uint8_t* grid_dim_k3_packed_bytes = (uint8_t*)&grid_dim_k3_packed;
  uint8_t* grid_dim_k3_bytes = (uint8_t*)&grid_dim_k3;
  memcpy(grid_dim_k3_packed_bytes, grid_dim_k3_bytes, DIM3_STRUCT_SIZE_BYTES);
  uint8_t* block_dim_k3_packed_bytes = (uint8_t*)&block_dim_k3_packed;
  uint8_t* block_dim_k3_bytes = (uint8_t*)&block_dim_k3;
  memcpy(block_dim_k3_packed_bytes, block_dim_k3_bytes, DIM3_STRUCT_SIZE_BYTES);
// OpenMP-parallel nested loops over blocks and threads to emulate a 1D GPU launch for kernel4 (grid_dim_x_k4 × THREADS_PER_BLOCK_X)::header.014
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_dim_x_k3;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
double* A_dbl_k3 = (double*)A;
double* x_dbl_k3 = (double*)x;
double* y_dbl_k3 = (double*)y;
double* tmp_dbl_k3 = (double*)tmp;
__auto_type grid_dim_x_param_k3 = grid_dim_x_k3;
int grid_dim_y_param_k3 = 1;
int grid_dim_z_param_k3 = 1;
__auto_type block_dim_x_param_k3 = THREADS_PER_BLOCK_X;
int block_dim_y_param_k3 = 1;
int block_dim_z_param_k3 = 1;
int32_t block_idx_x_param_k3 = i;
int block_idx_y_param_k3 = 0;
int block_idx_z_param_k3 = 0;
int32_t thread_idx_x_param_k3 = j;
int thread_idx_y_param_k3 = 0;
int thread_idx_z_param_k3 = 0;
kernel3(nx, ny, A_dbl_k3, x_dbl_k3, y_dbl_k3, tmp_dbl_k3, grid_dim_x_param_k3, grid_dim_y_param_k3, grid_dim_z_param_k3, block_dim_x_param_k3, block_dim_y_param_k3, block_dim_z_param_k3, block_idx_x_param_k3, block_idx_y_param_k3, block_idx_z_param_k3, thread_idx_x_param_k3, thread_idx_y_param_k3, thread_idx_z_param_k3);
}
}
  grid_dim_x_k4 = num_blocks(ny, THREADS_PER_BLOCK_X);
  grid_dim_k4.x = grid_dim_x_k4;
  grid_dim_k4.y = 1;
  grid_dim_k4.z = 1;
  block_dim_k4.x = THREADS_PER_BLOCK_X;
  block_dim_k4.y = 1;
  block_dim_k4.z = 1;
  uint8_t* grid_dim_k4_packed_bytes = (uint8_t*)&grid_dim_k4_packed;
  uint8_t* grid_dim_k4_bytes = (uint8_t*)&grid_dim_k4;
  memcpy(grid_dim_k4_packed_bytes, grid_dim_k4_bytes, DIM3_STRUCT_SIZE_BYTES);
  uint8_t* block_dim_k4_packed_bytes = (uint8_t*)&block_dim_k4_packed;
  uint8_t* block_dim_k4_bytes = (uint8_t*)&block_dim_k4;
  memcpy(block_dim_k4_packed_bytes, block_dim_k4_bytes, DIM3_STRUCT_SIZE_BYTES);
// OpenMP-parallel nested loops over blocks and threads to emulate a 1D GPU launch for kernel4 (grid_dim_x_k4 × THREADS_PER_BLOCK_X)::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < grid_dim_x_k4;   i = i + 1){
for(int32_t j = 0; j < THREADS_PER_BLOCK_X;   j = j + 1){
double* A_dbl_k4 = (double*)A;
double* x_dbl_k4 = (double*)x;
double* y_dbl_k4 = (double*)y;
double* tmp_dbl_k4 = (double*)tmp;
uint32_t grid_dim_x_param_k4 = grid_dim_x_k4;
uint32_t grid_dim_y_param_k4 = 1;
uint32_t grid_dim_z_param_k4 = 1;
uint32_t block_dim_x_param_k4 = THREADS_PER_BLOCK_X;
uint32_t block_dim_y_param_k4 = 1;
uint32_t block_dim_z_param_k4 = 1;
uint32_t block_idx_x_param_k4 = i;
uint32_t block_idx_y_param_k4 = 0;
uint32_t block_idx_z_param_k4 = 0;
uint32_t thread_idx_x_param_k4 = j;
uint32_t thread_idx_y_param_k4 = 0;
uint32_t thread_idx_z_param_k4 = 0;
kernel4(nx, ny, A_dbl_k4, x_dbl_k4, y_dbl_k4, tmp_dbl_k4, grid_dim_x_param_k4, grid_dim_y_param_k4, grid_dim_z_param_k4, block_dim_x_param_k4, block_dim_y_param_k4, block_dim_z_param_k4, block_idx_x_param_k4, block_idx_y_param_k4, block_idx_z_param_k4, thread_idx_x_param_k4, thread_idx_y_param_k4, thread_idx_z_param_k4);
}
}
// If dump_code is enabled, print the result vector y for verification; then proceed with memory cleanup
  if (dump_code == 1) {
print_array(nx, (double*)y);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)tmp)));
  return 0;
}
// Initialize test data: fill matrix A (nx-by-ny) and prepare vectors x, tmp, and y with deterministic values for subsequent kernels
void init_array(uint32_t nx, uint32_t ny, double* A, double* x, double* tmp, double* y) {
  int64_t i;
  int64_t j;

// Iterate over all i in [0, nx) and j in [0, ny) to set A[i*ny + j] = i*(j+1)/nx (deterministic initialization pattern)::for.cond
for(int64_t i = 0; i < ny;   i = i + 1){
  x[i] = ((double)(i) * 3.1415926535897931);
}
// Iterate over all i in [0, nx) and j in [0, ny) to set A[i*ny + j] = i*(j+1)/nx (deterministic initialization pattern)::for.cond1
for(int64_t i = 0; i < nx;   i = i + 1){
  tmp[i] = 0;
}
// Iterate over all i in [0, nx) and j in [0, ny) to set A[i*ny + j] = i*(j+1)/nx (deterministic initialization pattern)::for.cond9
for(int64_t i = 0; i < nx;   i = i + 1){
for(int64_t j = 0; j < ny;   j = j + 1){
  A[(i * ny + j)] = (((double)(i) * (double)((j + 1))) / (double)(nx));
}
}
  return;
}
// Compute ceil(num / factor) to get the number of blocks needed to cover 'num' items with block size 'factor'
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// CUDA-like row kernel: for each row i < m, compute tmp[i] as the dot product of A[i, 0..n-1] with x using 1D grid/block indices
void kernel3(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;
  double dot;

// Check that thread i maps to a valid row; if so, accumulate the dot product of row i of A with x to populate tmp[i]
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < m) {
  dot = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  dot = (dot + (A[(i * n + j)] * x[j]));
}
  tmp[i] = dot;
  }
  return;
}
// CUDA-like column kernel: for each column j < n, compute y[j] = dot(A[0..m-1, j], tmp) (i.e., y = A^T * tmp) using 1D grid/block indices
void kernel4(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;
  double dot;

// Check that thread j maps to a valid column; if so, accumulate y[j] as the dot product of column j of A with tmp
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < n) {
  y[j] = 0;
  dot = 0;
for(int64_t i = 0; i < m;   i = i + 1){
  dot = (dot + (A[(i * n + j)] * tmp[i]));
}
  y[j] = dot;
  }
  return;
}
// Print the nx elements of vector y in a fixed format, grouping outputs every PRINT_VALUES_PER_LINE values
void print_array(uint32_t nx, double* y) {
  int64_t i;

// Walk through y and print each element; start a new output line every PRINT_VALUES_PER_LINE entries::for.cond
for(int64_t i = 0; i < nx;   i = i + 1){
  fprintf(stderr, double_format_str, y[i]);
  if (i % PRINT_VALUES_PER_LINE == 0) {
  fprintf(stderr, newline_str);
  }
}
  fprintf(stderr, newline_str);
}
