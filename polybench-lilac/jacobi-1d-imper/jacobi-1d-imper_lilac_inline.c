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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */


// Calculates the number of blocks required given a total count and a block factor.
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return (num + factor - 1) / factor;
}


// Initializes 1D arrays A and B.
void init_array(uint32_t n, double* A, double* B) {
  int64_t i;

  // Initializes A[i] = (i+2)/n and B[i] = (i+3)/n.
  for(int64_t i = 0; i < n;   i = i + 1){
    A[i] = ((double)i + 2) / (double)n;
    B[i] = ((double)i + 3) / (double)n;
  }
  return;
}


// Applies a 1D stencil computation iteratively for 'tsteps' timesteps, alternating between A and B as input/output.
void kernel(uint32_t tsteps, uint32_t n, double* A, double* B) {
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

  // Main time-stepping loop. In each step, it first computes B from A, then A from B using the stencil operation.
  for(int32_t t = 1; t <= tsteps;   t = t + 1){
    uint32_t grid_dim_x_A_to_B = num_blocks(n, 256);
    grid_config_A_to_B.x = grid_dim_x_A_to_B;
    grid_config_A_to_B.y = 1;
    grid_config_A_to_B.z = 1;
    block_config_A_to_B.x = 256;
    block_config_A_to_B.y = 1;
    block_config_A_to_B.z = 1;
    memcpy(((uint8_t*)(&grid_config_coerced_A_to_B)), ((uint8_t*)(&grid_config_A_to_B)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_A_to_B)), ((uint8_t*)(&block_config_A_to_B)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_A_to_B;   j = j + 1){
      for(int32_t k = 0; k < 256;   k = k + 1){
        int64_t i;

        // Thread computes B[i] if its index i is within the inner part of the 1D grid (excluding boundaries).
        i = 256 * j + k + 1;
        if (i < n - 1) {
          B[i] = (A[i - 1] + A[i] + A[i + 1]) / 3;
        }
      }
    }
    uint32_t grid_dim_x_B_to_A = num_blocks(n, 256);
    grid_config_B_to_A.x = grid_dim_x_B_to_A;
    grid_config_B_to_A.y = 1;
    grid_config_B_to_A.z = 1;
    block_config_B_to_A.x = 256;
    block_config_B_to_A.y = 1;
    block_config_B_to_A.z = 1;
    memcpy(((uint8_t*)(&grid_config_coerced_B_to_A)), ((uint8_t*)(&grid_config_B_to_A)), 12);
    memcpy(((uint8_t*)(&block_config_coerced_B_to_A)), ((uint8_t*)(&block_config_B_to_A)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_B_to_A;   j = j + 1){
      for(int32_t k = 0; k < 256;   k = k + 1){
        int64_t i;

        // Thread computes B[i] if its index i is within the inner part of the 1D grid (excluding boundaries).
        i = 256 * j + k;
        if (i < n - 1) {
          B[i] = (A[i - 1] + A[i] + A[i + 1]) / 3;
        }
      }
    }
  }
  return;
}


// Prints the elements of array A to standard error, 20 elements per line.
void print_array(uint32_t n, double* A) {
  int64_t i;
  int32_t unused_fprintf_return_val_final;

  // Iterates over A to print A[i] for i in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    uint32_t grid_dim_x_A_to_B = fprintf(stderr, "0.2lf ", A[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;

  // Conditionally prints the output array A to standard error if dump_code is 1.
  n = atoi(argv[3]);
  tsteps = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * sizeof(double));
  B = malloc(n * sizeof(double));
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
