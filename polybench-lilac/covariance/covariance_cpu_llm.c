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
struct IOFile;
struct dim3_t;
struct dim3_packed_t;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1_t {
  uint8_t array[1];
};
struct uint8_array_20_t {
  uint8_t array[20];
};
struct IOFile {
  uint32_t io_file_flags;
  uint8_t* io_file_buf_base;
  uint8_t* io_file_buf_ptr;
  uint8_t* io_file_buf_end;
  uint8_t* io_file_buf1;
  uint8_t* io_file_buf2;
  uint8_t* io_file_buf3;
  uint8_t* io_file_buf4;
  uint8_t* io_file_buf5;
  uint8_t* io_file_buf6;
  uint8_t* io_file_buf7;
  uint8_t* io_file_buf8;
  void* io_file_cookie;
  struct IOFile* io_file_prev;
  uint32_t io_file_mode;
  uint32_t io_file_line_no;
  uint64_t io_file_offset;
  uint16_t io_file_wide_data;
  uint8_t io_file_ungetc;
  uint8_t io_file_small_buf[1];
  uint8_t* io_file_name;
  uint64_t io_file_lock;
  void* io_file_lock2;
  void* io_file_reserved;
  struct IOFile* io_file_next;
  uint8_t* io_file_buf_alloc;
  uint64_t io_file_cookie2;
  uint32_t io_file_pad;
  uint8_t io_file_gap[20];
};
struct dim3_t {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct dim3_packed_t {
  uint64_t dim3_packed_field0;
  uint32_t dim3_packed_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_mean(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_reduce(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_cov(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t print_fmt_double[8] = { "%0.2lf " };
uint8_t print_fmt_newline[2] = { "\n" };


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
  int32_t unused_var28;
  int32_t unused_var39;

// Parse command-line arguments for dump_code, n, m and allocate memory for the data matrix (n*m doubles) and the mean vector (m doubles)
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  data = malloc(n * m * 8);
  mean = malloc(m * 8);
  cov = malloc(m * m * 8);
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
// Initialize the n-by-m data matrix with deterministic values: data[i*m + j] = (i*j)/1000; i indexes rows (0..n-1), j indexes columns (0..m-1)
void init_array(uint32_t m, uint32_t n, double* data) {
  int64_t i;
  int64_t j;

// Nested loops over rows i (0..n-1) and columns j (0..m-1) that fill each matrix element with the scaled product (i*j)/1000::for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  data[(i * m + j)] = (((double)(i) * (double)(j)) / 1000);
}
}
  return;
}
// Compute the per-column sums (mean accumulator) in parallel: each thread maps to a column j and accumulates values across all rows i into mean[j]
void kernel_mean(uint32_t m, uint32_t n, double* data, double* cov, double* mean, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int64_t j;
  int64_t i;

// Map the thread to column j; if j is within bounds initialize mean[j] to zero and accumulate the sum of data over all rows i into mean[j]
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
// Center the data by subtracting the column mean: each thread handles element (i,j) and replaces data[i*m + j] with data - mean[j] when in range
void kernel_reduce(uint32_t m, uint32_t n, double* data, double* cov, double* mean, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int64_t j;

// Map the thread to element (i,j); if both indices are within bounds subtract the previously computed mean[j] from data[i*m + j] to center the data
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < n) { // IFELSE MARKER: entry IF
  if (j < m) { // IFELSE MARKER: land.lhs.true IF
  data[(i * m + j)] = (data[(i * m + j)] - mean[j]);
  }
  }
  return;
}
// Compute covariance matrix entries in parallel: threads map to output indices (i,j) and use an inner reduction over k to accumulate covariance contributions from the centered data
void kernel_cov(uint32_t m, uint32_t n, double* data, double* cov, double* mean, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

// Map the thread to covariance entry (i,j); if both row/col indices are within range initialize cov[i*m + j] to zero to prepare for the reduction over k
  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y + i;
  if (i < m) { // IFELSE MARKER: entry IF
  if (j < m) { // IFELSE MARKER: land.lhs.true IF
  cov[(i * m + j)] = 0;
for(int64_t k = 0; k < n;   k = k + 1){
  __auto_type tmp1 = i * m + j;
  __auto_type tmp2 = k * m + i;
  __auto_type tmp3 = k * m + j;
  __auto_type tmp4 = data[tmp2];
  __auto_type tmp5 = data[tmp3];
  __auto_type tmp6 = tmp4 * tmp5;
  __auto_type tmp7 = cov[tmp1] + tmp6;
  __auto_type tmp8 = cov[tmp1] = tmp7;
  cov[(i * m + j)] = tmp6;
}
  __auto_type tmp9 = i * m + j;
  __auto_type tmp10 = (double)n - 1;
  __auto_type tmp11 = cov[tmp9] / tmp10;
  __auto_type tmp12 = cov[tmp9] = tmp11;
  cov[(i * m + j)] = tmp10;
  __auto_type tmp13 = j * m + i;
  __auto_type tmp14 = i * m + j;
  __auto_type tmp15 = cov[tmp13] = cov[tmp14];
  cov[(j * m + i)] = cov[tmp14];
  }
  }
  return;
}
// Compute the ceiling of num/factor to determine how many blocks of size 'factor' are needed to cover 'num' items
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}
// Top-level routine that configures grid/block dimensions and orchestrates the parallel kernels to compute mean, center the data, and produce the covariance matrix
void kernel(uint32_t m, uint32_t n, double* data, double* cov, double* mean) {
  struct dim3_t mean_grid_dim;    /* Address-exposed local */
  struct dim3_t mean_block_dim;    /* Address-exposed local */
  struct dim3_packed_t mean_grid_packed_alias;    /* Address-exposed local */
  struct dim3_packed_t mean_block_packed;    /* Address-exposed local */
  struct dim3_t block;    /* Address-exposed local */
  struct dim3_t grid;    /* Address-exposed local */
  struct dim3_t reduce_block_dim;    /* Address-exposed local */
  struct dim3_t reduce_grid_dim;    /* Address-exposed local */
  struct dim3_packed_t reduce_block_packed;    /* Address-exposed local */
  struct dim3_packed_t reduce_grid_packed;    /* Address-exposed local */
  struct dim3_t cov_block_dim;    /* Address-exposed local */
  struct dim3_t cov_grid_dim;    /* Address-exposed local */
  struct dim3_packed_t cov_block_packed;    /* Address-exposed local */
  struct dim3_packed_t cov_grid_packed;    /* Address-exposed local */
  int32_t num_blocks_m_256;
  uint8_t* tmp_u8_ptr1;
  uint8_t* tmp_u8_ptr2;
  uint32_t i;
  uint32_t j;
  int32_t num_blocks_n_blockx;
  int32_t num_blocks_m_blocky;
  uint8_t* tmp_u8_ptr3;
  uint8_t* tmp_u8_ptr4;
  uint8_t* tmp_u8_ptr5;
  uint8_t* tmp_u8_ptr6;
  uint32_t k;
  uint32_t l;
  int32_t num_blocks_mminus1_blockx;
  int32_t num_blocks_mminus1_blocky;
  uint8_t* tmp_u8_ptr7;
  uint8_t* tmp_u8_ptr8;
  uint8_t* tmp_u8_ptr9;
  uint8_t* tmp_u8_ptr10;

  num_blocks_m_256 = num_blocks(m, 256);
  mean_grid_dim.x = num_blocks_m_256;
  mean_grid_dim.y = 1;
  mean_grid_dim.z = 1;
  mean_block_dim.x = 256;
  mean_block_dim.y = 1;
  mean_block_dim.z = 1;
  memcpy(((uint8_t*)(&mean_grid_packed_alias)), ((uint8_t*)(&mean_grid_dim)), 12);
  memcpy(((uint8_t*)(&mean_block_packed)), ((uint8_t*)(&mean_block_dim)), 12);
// INSERT COMMENT LOOP: kernel::header.016
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < num_blocks_m_256;   i = i + 1){
for(int32_t j = 0; j < 256;   j = j + 1){
kernel_mean(m, n, data, cov, mean, num_blocks_m_256, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  num_blocks_n_blockx = num_blocks(n, block.x);
  num_blocks_m_blocky = num_blocks(m, block.y);
  grid.x = num_blocks_n_blockx;
  grid.y = num_blocks_m_blocky;
  grid.z = 1;
  memcpy(((uint8_t*)(&reduce_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&reduce_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&reduce_block_packed)), ((uint8_t*)(&reduce_block_dim)), 12);
  memcpy(((uint8_t*)(&reduce_grid_packed)), ((uint8_t*)(&reduce_grid_dim)), 12);
// Parallel 2D loop (OpenMP) that iterates over a tile of indices i in [0,8) and j in [0,32) distributing work across threads
for(int32_t k = 0; k < num_blocks_n_blockx;   k = k + 1){
for(int32_t l = 0; l < num_blocks_m_blocky;   l = l + 1){
kernel_reduce(m, n, data, cov, mean, 8, 32, 1, num_blocks_n_blockx, num_blocks_m_blocky, 1, i, j, 0, k, l, 0);
}
}
  block.x = 8;
  block.y = 32;
  block.z = 1;
  num_blocks_mminus1_blockx = num_blocks((m - 1), block.x);
  num_blocks_mminus1_blocky = num_blocks((m - 1), block.y);
  grid.x = num_blocks_mminus1_blockx;
  grid.y = num_blocks_mminus1_blocky;
  grid.z = 1;
  memcpy(((uint8_t*)(&cov_block_dim)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&cov_grid_dim)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&cov_block_packed)), ((uint8_t*)(&cov_block_dim)), 12);
  memcpy(((uint8_t*)(&cov_grid_packed)), ((uint8_t*)(&cov_grid_dim)), 12);
// Parallel 2D loop (OpenMP) that iterates over a tile of indices i in [0,8) and j in [0,32) distributing work across threads
for(int32_t k = 0; k < num_blocks_mminus1_blockx;   k = k + 1){
for(int32_t l = 0; l < num_blocks_mminus1_blocky;   l = l + 1){
kernel_cov(m, n, data, cov, mean, 8, 32, 1, num_blocks_mminus1_blockx, num_blocks_mminus1_blocky, 1, i, j, 0, k, l, 0);
}
}
  return;
}
// Print the m-by-m covariance matrix to stderr in row-major order using the provided double format
void print_array(uint32_t m, double* cov) {
  int64_t i;
  uint64_t j;
  int32_t tmp_int32;

// Iterate over all rows and columns of the m-by-m covariance matrix and print each element to stderr using the designated format::for.cond
for(int64_t i = 0; i < m;   i = i + 1){
for(int64_t j = 0; j < m;   j = j + 1){
  fprintf(stderr, (print_fmt_double), cov[(i * m + j)]);
  if ((int)(i * m + j) % (int)20 == 0) { // IFELSE MARKER: for.body3 IF
  fprintf(stderr, (print_fmt_newline));
  }
}
}
  fprintf(stderr, (print_fmt_newline));
}
