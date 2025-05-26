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
void init_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_stencil(uint32_t, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes 2D arrays A and B.
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;
  uint64_t j;

  // Initializes A[i][j] = (i*(j+2) + 2)/n and B[i][j] = (i*(j+3) + 3)/n.
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      A[(i * n + j)] = ((double)i * (double)(j + 2) + 2) / (double)n;
      B[(i * n + j)] = ((double)i * (double)(j + 3) + 3) / (double)n;
    }
  }
  return;
}


// Kernel: applies a 5-point 2D stencil operation. It reads from array A and writes to array B. Each thread computes one element B[i][j].
void kernel_stencil(uint32_t n, double* A, double* B, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // Thread computes B[i][j] if its indices (i,j) are within the inner part of the 2D grid (excluding boundaries).
  i = block_dim_x * block_idx_x + thread_idx_x + 1;
  j = block_dim_y * block_idx_y + thread_idx_y + 1;
  if (i < (n - 1) && j < (n - 1)) {
    B[(i * n + j)] = (A[i * n + j] + A[i * n + j - 1] + A[i * n + 1 + j] + A[(1 + i) * n + j] + A[(i - 1) * n + j]) / 5;
  }
  return;
}


// Applies a 2D stencil computation iteratively for 'tsteps' timesteps, alternating between A and B as input/output.
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_A_to_B;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_A_to_B;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_A_to_B;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_A_to_B;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_B_to_A;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_B_to_A;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_B_to_A;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_B_to_A;    /* Address-exposed local */
  int32_t t;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  // Main time-stepping loop. In each step, it first computes B from A, then A from B using the stencil operation.
  for(int32_t t = 1; t <= tsteps;   t = t + 1){
    uint32_t grid_dim_x_val = num_blocks(n - 2, 8);
    uint32_t grid_dim_y_val = num_blocks(n - 2, 32);
    grid.x = grid_dim_x_val;
    grid.y = grid_dim_y_val;
    grid.z = 1;
    memcpy(((uint8_t*)(&grid_config_A_to_B)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_A_to_B)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_A_to_B)), ((uint8_t*)(&grid_config_A_to_B)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_A_to_B)), ((uint8_t*)(&block_config_A_to_B)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_val;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_y_val;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_stencil(n, A, B, grid_dim_x_val, grid_dim_y_val, 1, 8, 32, 1, j, k, 0, l, m, 0);
          }
        }
      }
    }
    memcpy(((uint8_t*)(&grid_config_B_to_A)), ((uint8_t*)(&grid)), 12);
    memcpy(((uint8_t*)(&block_config_B_to_A)), ((uint8_t*)(&block)), 12);
    memcpy(((uint8_t*)(&grid_config_coerced_B_to_A)), ((uint8_t*)(&grid_config_B_to_A)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_B_to_A)), ((uint8_t*)(&block_config_B_to_A)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_val;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_y_val;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_stencil(n, B, A, grid_dim_x_val, grid_dim_y_val, 1, 8, 32, 1, j, k, 0, l, m, 0);
          }
        }
      }
    }
  }
  return;
}


// Prints the elements of the 2D array A to standard error, 20 elements per line.
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;
  int32_t unused_fprintf_return_val_final;

  // Iterates over the 2D array A to print its elements.
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      uint32_t grid_dim_x_val = fprintf(stderr, "0.2lf ", A[i * n + j]);
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
  int32_t tsteps;
  uint8_t* A;
  uint8_t* B;

  // Conditionally prints the output array A to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  A = malloc(n * n * sizeof(double));
  B = malloc(n * n * sizeof(double));
  init_array(n, (double*)A, (double*)B);
  ;
  kernel(tsteps, n, (double*)A, (double*)B);
  ;
  if (dump_code == 1) {
    print_array(n, (double*)A);
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)B);
  return 0;
}
