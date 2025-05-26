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

static __forceinline int llvm_fcmp_ole(double X, double Y) { return X <= Y; }


/* Global Declarations */

/* Types Declarations */
struct poly_standard_IO_FILE;
struct cuda_dim3_equivalent;
struct internal_dim3_coercion_helper;

/* Function definitions */

/* Types Definitions */
struct llvm_generated_array_1_uint8 {
  uint8_t array[1];
};
struct llvm_generated_array_20_uint8 {
  uint8_t array[20];
};
struct poly_standard_IO_FILE {
  uint32_t flags;
  uint8_t* io_read_ptr;
  uint8_t* io_read_end;
  uint8_t* io_read_base;
  uint8_t* io_write_base;
  uint8_t* io_write_ptr;
  uint8_t* io_write_end;
  uint8_t* io_buf_base;
  uint8_t* io_buf_end;
  uint8_t* io_save_base;
  uint8_t* io_backup_base;
  uint8_t* io_save_end;
  void* markers;
  struct poly_standard_IO_FILE* chain;
  uint32_t fileno;
  uint32_t internal_flags;
  uint64_t offset;
  uint16_t cur_column;
  uint8_t vtable_offset;
  uint8_t shortbuf[1];
  uint8_t* lock;
  uint64_t wide_offset;
  void* codecvt_ptr;
  void* wide_data_ptr;
  struct poly_standard_IO_FILE* freeres_list;
  uint8_t* freeres_buf_ptr;
  uint64_t padding_field;
  uint32_t mode;
  uint8_t unused_buffer_space[20];
};
struct cuda_dim3_equivalent {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct internal_dim3_coercion_helper {
  uint64_t dim_xy_packed;
  uint32_t dim_z;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
double sqrt(double);
double sqrt_OC_1(double);
void kernel_mean(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_stddev(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_reduce(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_diag(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_corr(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_tail(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */

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


// Calculates the number of blocks required given a total count and a block factor.
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return (num + factor - 1) / factor;
}


// Initializes the input data matrix 'data'.
void init_array(uint32_t m, uint32_t n, double* data) {
  int64_t i;
  int64_t j;

  // Initializes matrix data: data[i*n+j] = (i*j)/1000 for i in [0,m-1], j in [0,n-1].
  for(int64_t i = 0; i < m;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      data[i * n + j] = ((double)i * (double)j) / 1000;
    }
  }
  return;
}


// Kernel: sets the last diagonal element of the 'corr' matrix (corr[m-1][m-1]) to 1.0.
void kernel_tail(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  corr[(m - 1) * m + m - 1] = 1;
}


// Kernel: computes the off-diagonal elements of the 'corr' matrix.
void kernel_corr(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

  // Thread computes corr[i*m+j] and corr[j*m+i] if i < m-1 and j < m, where j starts from i+1.
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y + i + 1;
  if (i < (m - 1) && j < m) {
    corr[i * m + j] = 0;
    for(int64_t k = 0; k < n;   k = k + 1){
      corr[i * m + j] = corr[i * m + j] + data[k * m + i] * data[k * m + j];
    }
    corr[j * m + i] = corr[i * m + j];
  }
  return;
}


// Kernel: sets the diagonal elements of the 'corr' matrix to 1.0.
void kernel_diag(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;

  // Thread sets corr[i*m+i] = 1.0 if i is within the bound m.
  i = block_dim_x * block_idx_x + thread_idx_x;
  if (i < m) {
    corr[i * m + i] = 1;
  }
  return;
}


// Kernel: normalizes the 'data' matrix by subtracting the mean and dividing by (sqrt(n) * stddev).
void kernel_reduce(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int64_t j;
  double sqrt_result;

  // Thread normalizes data[i*m+j] if (i,j) are within bounds (n,m).
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < n && j < m) {
    data[(i * m + j)] = data[i * m + j] - mean[j];
    sqrt_result = sqrt((double)n);
    data[i * m + j] = data[i * m + j] / (sqrt_result * stddev[j]);
  }
  return;
}


// Kernel: computes the standard deviation of each column j of the 'data' matrix.
void kernel_stddev(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t j;
  int64_t i;
  double sqrt_result;

  // Thread computes stddev for column j if j is within the bound m. Handles near-zero stddev by setting it to 1.0.
  j = block_dim_x * block_idx_x + thread_idx_x;
  if (j < m) {
    stddev[j] = 0;
    for(int64_t i = 0; i < n;   i = i + 1){
      stddev[j] = stddev[j] + (data[i * m + j] - mean[j]) * (data[(i * m + j)] - mean[j]);
    }
    stddev[j] = stddev[j] / (double)n;
    sqrt_result = sqrt(stddev[j]);
    stddev[j] = sqrt_result;
    if (llvm_fcmp_ole(stddev[j], 0.10000000000000001)) {
      stddev[j] = 1;
    }
  }
  return;
}


// Kernel: computes the mean of each column j of the 'data' matrix.
void kernel_mean(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t j;
  int64_t i;

  // Thread computes mean for column j if j is within the bound m.
  j = block_dim_x * block_idx_x + thread_idx_x;
  if (j < m) {
    mean[j] = 0;
    for(int64_t i = 0; i < n;   i = i + 1){
      mean[j] = mean[j] + data[i * m + j];
    }
    mean[j] = mean[j] / (double)n;
  }
  return;
}


// Computes the correlation matrix. This involves several steps: calculating mean, standard deviation, reducing the data, and then computing the correlation coefficients.
void kernel(uint32_t m, uint32_t n, double* data, double* corr, double* mean, double* stddev) {
  struct cuda_dim3_equivalent grid_config_mean;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_mean;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_mean;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_mean;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_stddev;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_stddev;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_stddev;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_stddev;    /* Address-exposed local */
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_reduce;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_reduce;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_reduce;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_reduce;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_diag;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_diag;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_diag;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_diag;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_corr;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_corr;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_corr;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_corr;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_tail;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_tail;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_tail;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_tail;    /* Address-exposed local */
  int32_t grid_dim_x_mean;
  uint8_t* unused_mean_placeholder_1;
  uint8_t* unused_mean_placeholder_2;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_stddev;
  uint8_t* unused_stddev_placeholder_1;
  uint8_t* unused_stddev_placeholder_2;
  int32_t grid_dim_x_reduce;
  int32_t grid_dim_y_reduce;
  uint8_t* unused_reduce_placeholder_1;
  uint8_t* unused_reduce_placeholder_2;
  uint8_t* unused_reduce_placeholder_3;
  uint8_t* unused_reduce_placeholder_4;
  uint32_t k;
  uint32_t l;
  int32_t grid_dim_x_diag;
  uint8_t* unused_diag_placeholder_1;
  uint8_t* unused_diag_placeholder_2;
  int32_t grid_dim_x_corr;
  int32_t grid_dim_y_corr;
  uint8_t* unused_corr_placeholder_1;
  uint8_t* unused_corr_placeholder_2;
  uint8_t* unused_corr_placeholder_3;
  uint8_t* unused_corr_placeholder_4;
  uint8_t* unused_tail_placeholder_1;
  uint8_t* unused_tail_placeholder_2;

  grid_dim_x_mean = num_blocks(m, 256);
  grid_config_mean.x = grid_dim_x_mean;
  grid_config_mean.y = 1;
  grid_config_mean.z = 1;
  block_config_mean.x = 256;
  block_config_mean.y = 1;
  block_config_mean.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced_mean)), ((uint8_t*)(&grid_config_mean)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_mean)), ((uint8_t*)(&block_config_mean)), 12);
  // Simulates parallel execution of kernel_mean to calculate the mean of each column in 'data'.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_mean;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel_mean(m, n, data, corr, mean, stddev, grid_dim_x_mean, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  grid_dim_x_stddev = num_blocks(m, 256);
  grid_config_stddev.x = grid_dim_x_stddev;
  grid_config_stddev.y = 1;
  grid_config_stddev.z = 1;
  block_config_stddev.x = 256;
  block_config_stddev.y = 1;
  block_config_stddev.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced_stddev)), ((uint8_t*)(&grid_config_stddev)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_stddev)), ((uint8_t*)(&block_config_stddev)), 12);
  // Simulates parallel execution of kernel_stddev to calculate the standard deviation of each column in 'data'.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_stddev;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel_stddev(m, n, data, corr, mean, stddev, grid_dim_x_stddev, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  grid_dim_x_reduce = num_blocks(n, 8);
  grid_dim_y_reduce = num_blocks(m, 32);
  grid.x = grid_dim_x_reduce;
  grid.y = grid_dim_y_reduce;
  grid.z = 1;
  memcpy(((uint8_t*)(&block_config_reduce)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_reduce)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_reduce)), ((uint8_t*)(&block_config_reduce)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_reduce)), ((uint8_t*)(&grid_config_reduce)), 12);
  // Simulates parallel execution of kernel_reduce to normalize the 'data' matrix using the calculated mean and standard deviation.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 8;   i = i + 1){
    for(int32_t j = 0; j < 32;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_x_reduce;   k = k + 1){
        for(int32_t l = 0; l < grid_dim_y_reduce;   l = l + 1){
          kernel_reduce(m, n, data, corr, mean, stddev, 8, 32, 1, grid_dim_x_reduce, grid_dim_y_reduce, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  block_config_diag.x = 256;
  block_config_diag.y = 1;
  block_config_diag.z = 1;
  grid_dim_x_diag = num_blocks(m, 256);
  grid_config_diag.x = grid_dim_x_diag;
  grid_config_diag.y = 1;
  grid_config_diag.z = 1;
  memcpy(((uint8_t*)(&block_config_coerced_diag)), ((uint8_t*)(&block_config_diag)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_diag)), ((uint8_t*)(&grid_config_diag)), 12);
  // Simulates parallel execution of kernel_diag to set the diagonal elements of the 'corr' matrix to 1.0.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 256;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_x_diag;   j = j + 1){
      kernel_diag(m, n, data, corr, mean, stddev, 256, 1, 1, grid_dim_x_diag, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  block.x = 8;
  block.y = 32;
  block.z = 1;
  grid_dim_x_corr = num_blocks(m - 1, block.x);
  grid_dim_y_corr = num_blocks(m - 1, block.y);
  grid.x = grid_dim_x_corr;
  grid.y = grid_dim_y_corr;
  grid.z = 1;
  memcpy(((uint8_t*)(&block_config_corr)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_corr)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_corr)), ((uint8_t*)(&block_config_corr)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_corr)), ((uint8_t*)(&grid_config_corr)), 12);
  // INSERT COMMENT LOOP: header.064
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 8;   i = i + 1){
    for(int32_t j = 0; j < 32;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_x_corr;   k = k + 1){
        for(int32_t l = 0; l < grid_dim_y_corr;   l = l + 1){
          kernel_corr(m, n, data, corr, mean, stddev, 8, 32, 1, grid_dim_x_corr, grid_dim_y_corr, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  // Simulates execution of kernel_tail to set the last diagonal element of 'corr' to 1.0. The 'if (0)' suggests this might be a placeholder or an alternative path that is currently disabled.
  grid_config_tail.x = 1;
  grid_config_tail.y = 1;
  grid_config_tail.z = 1;
  block_config_tail.x = 1;
  block_config_tail.y = 1;
  block_config_tail.z = 1;
  unused_tail_placeholder_1 = memcpy(((uint8_t*)(&grid_config_coerced_tail)), ((uint8_t*)(&grid_config_tail)), 12);
  unused_tail_placeholder_2 = memcpy(((uint8_t*)(&block_config_coerced_tail)), ((uint8_t*)(&block_config_tail)), 12);
  ;
  kernel_tail(m, n, data, corr, mean, stddev, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0);
  return;
}


// Prints the elements of the correlation matrix 'corr' to standard error, 20 elements per line.
void print_array(uint32_t m, double* corr) {
  int64_t i;
  uint64_t j;
  int32_t grid_dim_y_reduce;

  // Iterates over 'corr' to print corr[i*m+j] for i,j in [0,m-1].
  for(int64_t i = 0; i < m;   i = i + 1){
    for(int64_t j = 0; j < m;   j = j + 1){
      uint32_t grid_dim_x_mean = fprintf(stderr, "0.2lf ", corr[i * m + j]);
      if ((int)(i * m + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t n;
  int32_t m;
  uint8_t* data;
  uint8_t* mean;
  uint8_t* stddev;
  uint8_t* corr;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // Conditionally prints the output correlation matrix 'corr' to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  data = malloc(n * m * sizeof(double));
  mean = malloc(m * sizeof(double));
  stddev = malloc(m * sizeof(double));
  corr = malloc(m * m * sizeof(double));
  init_array(m, n, (double*)data);
  ;
  kernel(m, n, (double*)data, (double*)corr, (double*)mean, (double*)stddev);
  ;
  if (dump_code == 1) {
    print_array(m, (double*)corr);
  }
  free((uint8_t*)(double*)data);
  free((uint8_t*)(double*)corr);
  free((uint8_t*)(double*)mean);
  free((uint8_t*)(double*)stddev);
  return 0;
}
