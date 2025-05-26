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
void kernel(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_mean(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_reduce(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_cov(uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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

  // Initializes matrix data: data[i*m+j] = (i*j)/1000 for i in [0,n-1], j in [0,m-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < m;   j = j + 1){
      data[(i * m + j)] = ((double)i * (double)j) / 1000;
    }
  }
  return;
}


// Computes the covariance matrix. This involves several steps: calculating mean, reducing the data (subtracting mean), and then computing the covariance coefficients.
void kernel(uint32_t m, uint32_t n, double* data, double* cov, double* mean) {
  struct cuda_dim3_equivalent grid_config_mean;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_mean;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_mean;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_mean;    /* Address-exposed local */
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_reduce;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_reduce;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_reduce;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_reduce;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_cov;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_cov;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_cov;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_cov;    /* Address-exposed local */
  int32_t grid_dim_x_mean;
  uint8_t* unused_mean_placeholder_1;
  uint8_t* unused_mean_placeholder_2;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_reduce;
  int32_t grid_dim_y_reduce;
  uint8_t* unused_reduce_placeholder_1;
  uint8_t* unused_reduce_placeholder_2;
  uint8_t* unused_reduce_placeholder_3;
  uint8_t* unused_reduce_placeholder_4;
  uint32_t k;
  uint32_t l;
  int32_t grid_dim_x_cov;
  int32_t grid_dim_y_cov;
  uint8_t* unused_cov_placeholder_1;
  uint8_t* unused_cov_placeholder_2;
  uint8_t* unused_cov_placeholder_3;
  uint8_t* unused_cov_placeholder_4;

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
      int64_t jdx;
      int64_t idx;

      // Thread computes mean for column j if j is within the bound m.
      jdx = 256 * i + j;
      if (jdx < m) {
        mean[jdx] = 0;
        for(int64_t idx = 0; idx < n;   idx = idx + 1){
          mean[jdx] = mean[jdx] + data[idx * m + jdx];
        }
        mean[jdx] = mean[jdx] / (double)n;
      }
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
  // Simulates parallel execution of kernel_cov to compute the elements of the 'cov' (covariance) matrix.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 8;   i = i + 1){
    for(int32_t j = 0; j < 32;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_x_reduce;   k = k + 1){
        for(int32_t l = 0; l < grid_dim_y_reduce;   l = l + 1){
          int32_t idx;
          int64_t jdx;

          // Thread updates data[i*m+j] if (i,j) are within bounds (n,m).
          idx = grid_dim_x_reduce * i + k;
          jdx = grid_dim_y_reduce * j + l;
          if (idx < n && jdx < m) {
            data[(idx * m + jdx)] = data[idx * m + jdx] - mean[jdx];
          }
        }
      }
    }
  }
  grid_dim_x_cov = num_blocks(m - 1, 8);
  grid_dim_y_cov = num_blocks(m - 1, 32);
  grid.x = grid_dim_x_cov;
  grid.y = grid_dim_y_cov;
  grid.z = 1;
  memcpy(((uint8_t*)(&block_config_cov)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_cov)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_cov)), ((uint8_t*)(&block_config_cov)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_cov)), ((uint8_t*)(&grid_config_cov)), 12);
  // Simulates parallel execution of kernel_reduce to subtract the mean from each element in the 'data' matrix.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 8;   i = i + 1){
    for(int32_t j = 0; j < 32;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_x_cov;   k = k + 1){
        for(int32_t l = 0; l < grid_dim_y_cov;   l = l + 1){
          int32_t idx;
          int32_t jdx;
          int64_t kdx;

          // Thread computes cov[i*m+j] and cov[j*m+i] if i and j are within the bound m, where j starts from i.
          idx = grid_dim_x_cov * i + k;
          jdx = grid_dim_y_cov * j + l + idx;
          if (idx < m && jdx < m) {
            cov[idx * m + jdx] = 0;
            for(int64_t kdx = 0; kdx < n;   kdx = kdx + 1){
              cov[idx * m + jdx] = cov[idx * m + jdx] + data[kdx * m + idx] * data[kdx * m + jdx];
            }
            cov[idx * m + jdx] = cov[idx * m + jdx] / ((double)n - 1);
            cov[jdx * m + idx] = cov[idx * m + jdx];
          }
        }
      }
    }
  }
  return;
}


// Prints the elements of the covariance matrix 'cov' to standard error, 20 elements per line.
void print_array(uint32_t m, double* cov) {
  int64_t i;
  uint64_t j;
  int32_t unused_fprintf_return_val_final;

  // Iterates over 'cov' to print cov[i*m+j] for i,j in [0,m-1].
  for(int64_t i = 0; i < m;   i = i + 1){
    for(int64_t j = 0; j < m;   j = j + 1){
      uint32_t grid_dim_x_mean = fprintf(stderr, "0.2lf ", cov[i * m + j]);
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
  uint8_t* cov;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // Conditionally prints the output covariance matrix 'cov' to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  m = atoi(argv[3]);
  data = malloc(n * m * sizeof(double));
  mean = malloc(m * sizeof(double));
  cov = malloc(m * m * sizeof(double));
  init_array(m, n, (double*)data);
  ;
  kernel(m, n, (double*)data, (double*)cov, (double*)mean);
  ;
  if (dump_code == 1) {
    print_array(m, (double*)cov);
  }
  free((uint8_t*)(double*)data);
  free((uint8_t*)(double*)cov);
  free((uint8_t*)(double*)mean);
  return 0;
}
