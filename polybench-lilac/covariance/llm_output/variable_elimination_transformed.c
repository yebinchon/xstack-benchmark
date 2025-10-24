/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* Magic number constants */
#define BYTES_PER_DOUBLE 8
#define INIT_SCALE_DIVISOR 1000
#define COV_BESSEL_CORRECTION 1
#define MEAN_BLOCK_DIM_X 256
#define REDUCE_BLOCK_DIM_X 8
#define REDUCE_BLOCK_DIM_Y 32
#define DIM3_STRUCT_SIZE_BYTES 12
#define PRINTF_FMT_STR_LEN 8
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
struct dim3;
struct dim3_packed;

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
struct dim3_packed {
  uint64_t data64;
  uint32_t data32;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_mean(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_reduce(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_cov(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  int32_t n;
  int32_t m;
  uint8_t* data;
  uint8_t* mean;
  uint8_t* cov;

// INSERT COMMENT IFELSE: main::entry
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  data = malloc(n * m * BYTES_PER_DOUBLE);
  mean = malloc(m * BYTES_PER_DOUBLE);
  cov = malloc(m * m * BYTES_PER_DOUBLE);
  init_array(m, n, ((double*)data));
;
  kernel(m, n, ((double*)data), ((double*)cov), ((double*)mean));
;
  if (dump_code == 1) { // IFELSE MARKER: entry IF
print_array(m, ((double*)cov));
  }
free(((uint8_t*)((double*)data)));
free(((uint8_t*)((double*)cov)));
free(((uint8_t*)((double*)mean)));
  return 0;
}
// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t m, uint32_t n, double* data) {
  int64_t i;
  int64_t j;

// INSERT COMMENT LOOP: init_array::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  data[(i * m + j)] = (((double)(i) * (double)(j)) / INIT_SCALE_DIVISOR);
}
}
  return;
}
// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// INSERT COMMENT FUNCTION: kernel_mean
void kernel_mean(uint32_t m, uint32_t n, double* data, double* cov, double* mean, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;

// INSERT COMMENT IFELSE: kernel_mean::entry
  j = blockDim_x * blockIdx_x + threadIdx_x;
  if (j < m) { // IFELSE MARKER: entry IF
  mean[j] = 0;
for(int64_t i = 0; i < n;   i = i + 1){
  mean[j] = (mean[j] + data[(i * m + j)]);
}
  mean[j] = (mean[j] / (double)(n));
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_reduce
void kernel_reduce(uint32_t m, uint32_t n, double* data, double* cov, double* mean, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;

// INSERT COMMENT IFELSE: kernel_reduce::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n && j < m) {
data[(i * m + j)] = (data[(i * m + j)] - mean[j]);
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel_cov
void kernel_cov(uint32_t m, uint32_t n, double* data, double* cov, double* mean, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// INSERT COMMENT IFELSE: kernel_cov::entry
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y + i;
  if (i < m && j < m) {
cov[(i * m + j)] = 0;
for(int64_t k = 0; k < n;   k = k + 1){
int idx_ij = i * m + j;
int k_m_offset = k * m;
double xi = data[k_m_offset + i];
double xj = data[k_m_offset + j];
double prod = xi * xj;
double sum_ij = cov[idx_ij] + prod;
cov[(i * m + j)] = sum_ij;
}
int idx_ij_post = i * m + j;
double denom = (double)n - COV_BESSEL_CORRECTION;
double cov_ij = cov[idx_ij_post] / denom;
cov[(i * m + j)] = cov_ij;
int idx_ij_final = i * m + j;
int idx_ji = j * m + i;
__auto_type cov_value = cov[idx_ij_final];
cov[(j * m + i)] = cov_value;
  }
  return;
}
// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t m, uint32_t n, double* data, double* cov, double* mean) {
  struct dim3 mean_grid_dim;    /* Address-exposed local */
  struct dim3 mean_block_dim;    /* Address-exposed local */
  struct dim3_packed mean_grid_packed;    /* Address-exposed local */
  struct dim3_packed mean_block_packed;    /* Address-exposed local */
  struct dim3 block;    /* Address-exposed local */
  struct dim3 grid;    /* Address-exposed local */
  struct dim3 reduce_block_dim;    /* Address-exposed local */
  struct dim3 reduce_grid_dim;    /* Address-exposed local */
  struct dim3_packed reduce_block_packed;    /* Address-exposed local */
  struct dim3_packed reduce_grid_packed;    /* Address-exposed local */
  struct dim3 cov_block_dim;    /* Address-exposed local */
  struct dim3 cov_grid_dim;    /* Address-exposed local */
  struct dim3_packed cov_block_packed;    /* Address-exposed local */
  struct dim3_packed cov_grid_packed;    /* Address-exposed local */
  int32_t mean_grid_x;
  uint32_t i;
  uint32_t j;
  int32_t reduce_grid_x;
  int32_t reduce_grid_y;
  uint32_t k;
  uint32_t l;
  int32_t cov_grid_x;
  int32_t cov_grid_y;

  mean_grid_x = num_blocks(m, MEAN_BLOCK_DIM_X);
  mean_grid_dim.x = mean_grid_x;
  mean_grid_dim.y = 1;
  mean_grid_dim.z = 1;
  mean_block_dim.x = MEAN_BLOCK_DIM_X;
  mean_block_dim.y = 1;
  mean_block_dim.z = 1;
  memcpy(((uint8_t*)(&mean_grid_packed)), ((uint8_t*)(&mean_grid_dim)), DIM3_STRUCT_SIZE_BYTES);
  memcpy(((uint8_t*)(&mean_block_packed)), ((uint8_t*)(&mean_block_dim)), DIM3_STRUCT_SIZE_BYTES);
// INSERT COMMENT LOOP: kernel::header.016
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < mean_grid_x;   i = i + 1){
for(int32_t j = 0; j < MEAN_BLOCK_DIM_X;   j = j + 1){
kernel_mean(m, n, data, cov, mean, mean_grid_x, 1, 1, MEAN_BLOCK_DIM_X, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.x = REDUCE_BLOCK_DIM_X;
  block.y = REDUCE_BLOCK_DIM_Y;
  block.z = 1;
  reduce_grid_x = num_blocks(n, block.x);
  reduce_grid_y = num_blocks(m, block.y);
  grid.x = reduce_grid_x;
  grid.y = reduce_grid_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&reduce_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&reduce_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&reduce_block_packed)), ((uint8_t*)(&reduce_block_dim)), 12);
  memcpy(((uint8_t*)(&reduce_grid_packed)), ((uint8_t*)(&reduce_grid_dim)), 12);
// INSERT COMMENT LOOP: kernel::header.026
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 8;   i = i + 1){
for(int32_t j = 0; j < 32;   j = j + 1){
for(int32_t k = 0; k < reduce_grid_x;   k = k + 1){
for(int32_t l = 0; l < reduce_grid_y;   l = l + 1){
kernel_reduce(m, n, data, cov, mean, 8, 32, 1, reduce_grid_x, reduce_grid_y, 1, i, j, 0, k, l, 0);
}
}
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  cov_grid_x = num_blocks((m - 1), block.x);
  cov_grid_y = num_blocks((m - 1), block.y);
  grid.x = cov_grid_x;
  grid.y = cov_grid_y;
  grid.z = 1;
  memcpy(((uint8_t*)(&cov_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&cov_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&cov_block_packed)), ((uint8_t*)(&cov_block_dim)), 12);
  memcpy(((uint8_t*)(&cov_grid_packed)), ((uint8_t*)(&cov_grid_dim)), 12);
// INSERT COMMENT LOOP: kernel::header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < 8;   i = i + 1){
for(int32_t j = 0; j < 32;   j = j + 1){
for(int32_t k = 0; k < cov_grid_x;   k = k + 1){
for(int32_t l = 0; l < cov_grid_y;   l = l + 1){
kernel_cov(m, n, data, cov, mean, 8, 32, 1, cov_grid_x, cov_grid_y, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}
// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t m, double* cov) {
  int64_t i;
  uint64_t j;

// INSERT COMMENT LOOP: print_array::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  fprintf(stderr, (double_print_format), cov[(i * m + j)]);
  if ((int)(i * m + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (newline_string));
  }
}
}
  fprintf(stderr, (newline_string));
}
