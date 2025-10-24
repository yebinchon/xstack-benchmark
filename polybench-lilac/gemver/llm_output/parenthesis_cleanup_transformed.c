/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define KERNEL_ALPHA_DEFAULT 43532
#define KERNEL_BETA_DEFAULT 12313
#define ARG_INDEX_INPUT_SIZE 2
#define ARG_INDEX_DUMP_FLAG 1
#define DUMP_PRINT_ENABLED_VALUE 1
#define PRINT_ELEM_FORMAT_LEN 8
#define NEWLINE_STR_LEN 2
#define INIT_U2_DIVISOR 2
#define INIT_V1_DIVISOR 4
#define INIT_V2_DIVISOR 6
#define INIT_Y_DIVISOR 8
#define INIT_Z_DIVISOR 9
#define KERNEL_A_BLOCK_DIM_X 8
#define KERNEL_A_BLOCK_DIM_Y 32
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
struct dim3;
struct dim3_abi_coerce;

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
struct dim3_abi_coerce {
  uint64_t x;
  uint32_t y;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_w(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_elem_format_str[PRINT_ELEM_FORMAT_LEN] = { "%0.2lf " };
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
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;

// INSERT COMMENT IFELSE: main::entry
  n = atoi(argv[ARG_INDEX_INPUT_SIZE]);
  dump_code = atoi(argv[ARG_INDEX_DUMP_FLAG]);
  A = malloc(n * n * BYTES_PER_DOUBLE);
  u1 = malloc(n * BYTES_PER_DOUBLE);
  v1 = malloc(n * BYTES_PER_DOUBLE);
  u2 = malloc(n * BYTES_PER_DOUBLE);
  v2 = malloc(n * BYTES_PER_DOUBLE);
  w = malloc(n * BYTES_PER_DOUBLE);
  x = malloc(n * BYTES_PER_DOUBLE);
  y = malloc(n * BYTES_PER_DOUBLE);
  z = malloc(n * BYTES_PER_DOUBLE);
  double* A_double = (double*)A;
  double* u1_double = (double*)u1;
  double* v1_double = (double*)v1;
  double* u2_double = (double*)u2;
  double* v2_double = (double*)v2;
  double* w_double = (double*)w;
  double* x_double = (double*)x;
  double* y_double = (double*)y;
  double* z_double = (double*)z;
  init_array(n, A_double, u1_double, v1_double, u2_double, v2_double, w_double, x_double, y_double, z_double);
;
  __auto_type __FIXME__tmp10 = KERNEL_ALPHA_DEFAULT;
  __auto_type beta = KERNEL_BETA_DEFAULT;
  kernel(n, __FIXME__tmp10, beta, A_double, u1_double, v1_double, u2_double, v2_double, w_double, x_double, y_double, z_double);
;
  if (dump_code == DUMP_PRINT_ENABLED_VALUE) { // IFELSE MARKER: entry IF
print_array(n, (double*)w);
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)u1)));
free(((uint8_t*)((double*)v1)));
free(((uint8_t*)((double*)u2)));
free(((uint8_t*)((double*)v2)));
free(((uint8_t*)((double*)w)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)z)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  u1[i] = (double)(i);
  u2[i] = ((double)((i + 1) / n) / INIT_U2_DIVISOR);
  v1[i] = ((double)((i + 1) / n) / INIT_V1_DIVISOR);
  v2[i] = ((double)((i + 1) / n) / INIT_V2_DIVISOR);
  y[i] = ((double)((i + 1) / n) / INIT_Y_DIVISOR);
  z[i] = ((double)((i + 1) / n) / INIT_Z_DIVISOR);
  x[i] = 0;
  w[i] = 0;
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_A
void kernel_A(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_A::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n && j < n) {
A[(i * n + j)] = (A[(i * n + j)] + (u1[i] * v1[j] + (u2[i] * v2[j])));
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_x
void kernel_x(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_x::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  x[i] = (x[i] + ((beta * A[(j * n + i)]) * y[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_y
void kernel_y(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;

// INSERT COMMENT IFELSE: kernel_y::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
  x[i] = (x[i] + z[i]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_w
void kernel_w(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_w::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  if (i < n) { // IFELSE MARKER: entry IF
for(int64_t j = 0; j < n;   j = j + 1){
  w[i] = (w[i] + ((alpha * A[(i * n + j)]) * x[j]));
}
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 kernel_A_grid;    /* Address-exposed local */
  struct dim3 kernel_A_block;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_A_grid_coerce;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_A_block_coerce;    /* Address-exposed local */
  struct dim3 kernel_x_grid;    /* Address-exposed local */
  struct dim3 kernel_x_block;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_x_grid_coerce;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_x_block_coerce;    /* Address-exposed local */
  struct dim3 kernel_y_grid;    /* Address-exposed local */
  struct dim3 kernel_y_block;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_y_grid_coerce;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_y_block_coerce;    /* Address-exposed local */
  struct dim3 kernel_w_grid;    /* Address-exposed local */
  struct dim3 kernel_w_block;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_w_grid_coerce;    /* Address-exposed local */
  struct dim3_abi_coerce kernel_w_block_coerce;    /* Address-exposed local */
  int32_t kernel_A_grid_x_blocks;
  int32_t kernel_A_grid_y_blocks;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t kernel_x_grid_x_blocks;
  int32_t kernel_y_grid_x_blocks;
  int32_t kernel_w_grid_x_blocks;

  block.x = KERNEL_A_BLOCK_DIM_X;
  block.y = KERNEL_A_BLOCK_DIM_Y;
  block.z = 1;
  kernel_A_grid_x_blocks = num_blocks(n, block.x);
  kernel_A_grid_y_blocks = num_blocks(n, block.y);
  grid.x = kernel_A_grid_x_blocks;
  grid.y = kernel_A_grid_y_blocks;
  grid.z = 1;
  memcpy(((uint8_t*)(&kernel_A_grid)), ((uint8_t*)(&grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&kernel_A_block)), ((uint8_t*)(&block)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&kernel_A_grid_coerce)), ((uint8_t*)(&kernel_A_grid)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&kernel_A_block_coerce)), ((uint8_t*)(&kernel_A_block)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < kernel_A_grid_x_blocks;   i = i + 1){
for(int32_t j = 0; j < kernel_A_grid_y_blocks;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, kernel_A_grid_x_blocks, kernel_A_grid_y_blocks, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  kernel_x_grid_x_blocks = num_blocks(n, 256);
  kernel_x_grid.x = kernel_x_grid_x_blocks;
  kernel_x_grid.y = 1;
  kernel_x_grid.z = 1;
  kernel_x_block.x = 256;
  kernel_x_block.y = 1;
  kernel_x_block.z = 1;
  memcpy(((uint8_t*)(&kernel_x_grid_coerce)), ((uint8_t*)(&kernel_x_grid)), 12);
  memcpy(((uint8_t*)(&kernel_x_block_coerce)), ((uint8_t*)(&kernel_x_block)), 12);
// INSERT COMMENT LOOP: kernel::header.022
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < kernel_x_grid_x_blocks;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_x(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, kernel_x_grid_x_blocks, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  kernel_y_grid_x_blocks = num_blocks(n, 256);
  kernel_y_grid.x = kernel_y_grid_x_blocks;
  kernel_y_grid.y = 1;
  kernel_y_grid.z = 1;
  kernel_y_block.x = 256;
  kernel_y_block.y = 1;
  kernel_y_block.z = 1;
  memcpy(((uint8_t*)(&kernel_y_grid_coerce)), ((uint8_t*)(&kernel_y_grid)), 12);
  memcpy(((uint8_t*)(&kernel_y_block_coerce)), ((uint8_t*)(&kernel_y_block)), 12);
// INSERT COMMENT LOOP: kernel::header.032
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < kernel_y_grid_x_blocks;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_y(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, kernel_y_grid_x_blocks, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  kernel_w_grid_x_blocks = num_blocks(n, 256);
  kernel_w_grid.x = kernel_w_grid_x_blocks;
  kernel_w_grid.y = 1;
  kernel_w_grid.z = 1;
  kernel_w_block.x = 256;
  kernel_w_block.y = 1;
  kernel_w_block.z = 1;
  memcpy(((uint8_t*)(&kernel_w_grid_coerce)), ((uint8_t*)(&kernel_w_grid)), 12);
  memcpy(((uint8_t*)(&kernel_w_block_coerce)), ((uint8_t*)(&kernel_w_block)), 12);
// INSERT COMMENT LOOP: kernel::header.042
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < kernel_w_grid_x_blocks;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_w(n, alpha, beta, A, u1, v1, u2, v2, w, x, y, z, kernel_w_grid_x_blocks, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* w) {
  int64_t i;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
  fprintf(stderr, print_elem_format_str, w[i]);
  if (i % 20 == 0) { // IFELSE MARKER: for.body IF
  fprintf(stderr, newline_str);
  }
}
  return;
}
