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
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel_polly(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double);
void kernel0(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel1(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel2(uint32_t, uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes matrix A of size n x n, setting all elements to 1.0/n.
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

  // Iterates through A to set A[i*n+j] = 1.0/n for i,j in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      A[i * n + j] = 1 / (double)n;
    }
  }
  return;
}


// Performs Cholesky decomposition on matrix A. It iterates 'n' times, simulating three kernel launches (kernel0, kernel1, kernel2) in each iteration.
void kernel_polly(uint32_t n, double* dev_A) {
  struct cuda_dim3_equivalent grid_config_kernel0;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel0;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel0;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel0;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_kernel1;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel1;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel1;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel1;    /* Address-exposed local */
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel2;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_kernel2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel2;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  // Main loop for Cholesky decomposition, iterating 'n' times.
  for(int32_t iter = 0; iter < n;   iter = iter + 1){
    grid_config_kernel0.x = 1;
    grid_config_kernel0.y = 1;
    grid_config_kernel0.z = 1;
    block_config_kernel0.x = 1;
    block_config_kernel0.y = 1;
    block_config_kernel0.z = 1;
    memcpy(((uint8_t*)(&grid_config_coerced_kernel0)), ((uint8_t*)(&grid_config_kernel0)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_kernel0)), ((uint8_t*)(&block_config_kernel0)), 12);
    double sqrt_result;

    sqrt_result = sqrt(dev_A[iter * n + iter]);
    dev_A[iter * n + iter] = sqrt_result;

    uint32_t grid_dim_x_kernel1 = num_blocks(n, 256);
    grid_config_kernel1.x = grid_dim_x_kernel1;
    grid_config_kernel1.y = 1;
    grid_config_kernel1.z = 1;
    block_config_kernel1.x = 256;
    block_config_kernel1.y = 1;
    block_config_kernel1.z = 1;
    memcpy(((uint8_t*)(&grid_config_coerced_kernel1)), ((uint8_t*)(&grid_config_kernel1)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_kernel1)), ((uint8_t*)(&block_config_kernel1)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_kernel1;   j = j + 1){
      for(int32_t k = 0; k < 256;   k = k + 1){
        int32_t i;

        // Thread updates A[i*n+iter] if i is within bounds (i < n and i > iter).
        i = 256 * j + k;
        if (i < n & i > iter) {
          dev_A[(i * n + iter)] = dev_A[(i * n + iter)] / dev_A[iter * n + iter];
        }
        ;
      }
    }
    block.x = 8;
    block.y = 32;
    block.z = 1;
    uint32_t grid_dim_x_kernel2 = num_blocks(n, block.x);
    uint32_t grid_dim_y_kernel2 = num_blocks(n, block.y);
    grid.x = grid_dim_x_kernel2;
    grid.y = grid_dim_y_kernel2;
    grid.z = 1;
    memcpy(((uint8_t*)(&block_config_kernel2)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_kernel2)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_kernel2)), ((uint8_t*)(&block_config_kernel2)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_kernel2)), ((uint8_t*)(&grid_config_kernel2)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < 8;   j = j + 1){
      for(int32_t k = 0; k < 32;   k = k + 1){
        for(int32_t l = 0; l < grid_dim_x_kernel2;   l = l + 1){
          for(int32_t m = 0; m < grid_dim_y_kernel2;   m = m + 1){
            int32_t idx;
            int32_t kdx;

            // Thread updates A[i*n+k] if (i,k) are within specified bounds relative to iteration_idx.
            idx = 8 * j + l;
            kdx = 32 * k + m;
            if (iter < n & iter < idx & idx < n & iter < kdx & kdx <= idx) {
              dev_A[idx * n + kdx] = dev_A[idx * n + kdx] - dev_A[idx * n + iter] * dev_A[kdx * n + iter];
            }
            ;
          }
        }
      }
    }
  }
  return;
}


// Prints the elements of matrix A to standard error, 20 elements per line.
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

  // Iterates over A to print A[i*n+j] for i,j in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      uint32_t fprintf_return_val_loop = fprintf(stderr, "0.2lf ", A[i * n + j]);
      if ((int)(i * n + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  return;
}


int main(int argc, char ** argv) {
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  int32_t unused_kernel_polly_call_return;
  int32_t unused_print_array_call_return;

  // Conditionally prints the output matrix A to standard error if dump_code is 1.
  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * sizeof(double));
  init_array(n, (double*)A);
  ;
  kernel_polly(n, (double*)A);
  ;
  if (dump_code == 1) {
    print_array(n, (double*)A);
  }
  free((uint8_t*)(double*)A);
  return 0;
}
