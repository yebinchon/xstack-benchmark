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
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_div(uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A(uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes matrix A of size n x n, setting A[i][j] = ((i+1)*(j+1))/n.
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

  // Iterates through A to set A[i*n+j] = ((i+1)*(j+1))/n for i,j in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      A[(i * n + j)] = (((double)(i + 1) * (double)j) / (double)n);
    }
  }
  return;
}


// Kernel: Updates the submatrix A[i][j] for i,j > iter using elements from the current iteration_idx row and column.
void kernel_A(uint32_t n, double* A, uint32_t iteration_idx, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // Thread updates A[i*n+j] if (i,j) are within bounds (i < n, j < n, and i,j > iteration_idx).
  i = block_dim_x * block_idx_x + thread_idx_x + iteration_idx + 1;
  j = block_dim_y * block_idx_y + thread_idx_y + iteration_idx + 1;
  if (i < n && j < n) {
    A[i * n + j] = A[i * n + j] - A[i * n + iteration_idx] * A[iteration_idx * n + j];
  }
  return;
}


// Kernel: Divides elements A[i][iter] by the diagonal A[iter][iter] for i > iter.
void kernel_div(uint32_t n, double* A, uint32_t iteration_idx, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;

  // Thread updates A[i*n+iteration_idx] if i is within bounds (i < n and i > iteration_idx).
  i = block_dim_x * block_idx_x + thread_idx_x + iteration_idx + 1;
  if (i < n) {
    A[i * n + iteration_idx] = A[i * n + iteration_idx] / A[iteration_idx * n + iteration_idx];
  }
  return;
}


// Performs LU decomposition on matrix A. It iterates n-1 times, simulating two kernel launches (kernel_div, kernel_A) in each iteration.
void kernel(uint32_t n, double* A) {
  struct cuda_dim3_equivalent grid_config_div;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_div;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_div;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_div;    /* Address-exposed local */
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_A;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_A;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_A;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_A;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  // Main loop for LU decomposition, iterating n-1 times.
  for(int32_t iter = 0; iter < n - 1;   iter = iter + 1){
    uint32_t grid_dim_x_div = num_blocks(n - iter + 1, 256);
    grid_config_div.x = grid_dim_x_div;
    grid_config_div.y = 1;
    grid_config_div.z = 1;
    block_config_div.x = 256;
    block_config_div.y = 1;
    block_config_div.z = 1;
    memcpy(((uint8_t*)(&grid_config_coerced_div)), ((uint8_t*)(&grid_config_div)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_div)), ((uint8_t*)(&block_config_div)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_div;   j = j + 1){
      for(int32_t k = 0; k < 256;   k = k + 1){
        kernel_div(n, A, iter, grid_dim_x_div, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
      }
    }
    uint32_t grid_dim_x_A = num_blocks((n - iter + 1), 8);
    uint32_t grid_dim_y_A = num_blocks((n - iter + 1), 32);
    grid.x = grid_dim_x_A;
    grid.y = grid_dim_y_A;
    grid.z = 1;
    memcpy(((uint8_t*)(&grid_config_A)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_A)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_A)), ((uint8_t*)(&grid_config_A)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_A)), ((uint8_t*)(&block_config_A)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_A;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_y_A;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_A(n, A, iter, grid_dim_x_A, grid_dim_y_A, 1, 8, 32, 1, j, k, 0, l, m, 0);
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
  int32_t unused_fprintf_return_val_final;

  // Iterates over A to print A[i*n+j] for i,j in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      uint32_t grid_dim_x_div = fprintf(stderr, "0.2lf ", A[i * n + j]);
      if ((int)(i * n + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t n;
  uint8_t* A;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // Conditionally prints the output matrix A to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  A = malloc(n * n * sizeof(double));
  init_array(n, (double*)A);
  ;
  kernel(n, (double*)A);
  ;
  if (dump_code == 1) {
    print_array(n, (double*)A);
  }
  free((uint8_t*)(double*)A);
  return 0;
}
