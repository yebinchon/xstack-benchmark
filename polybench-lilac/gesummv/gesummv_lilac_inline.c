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
void init_array(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes matrices A, B and vector x. All are initialized with (i*j)/n or i/n for x.
void init_array(uint32_t n, double* A, double* B, double* x) {
  int64_t i;
  uint64_t j;

  // Initializes vector x and matrices A and B.
  for(int64_t i = 0; i < n;   i = i + 1){
    x[i] = ((double)(i) / (double)(n));
    for(int64_t j = 0; j < n;   j = j + 1){
      A[(i * n + j)] = ((double)i * (double)j) / (double)n;
      B[(i * n + j)] = ((double)i * (double)j) / (double)n;
    }
  }
  return;
}


// Prints the elements of array y to standard error, 20 elements per line.
void print_array(uint32_t n, double* y) {
  int64_t i;

  // Iterates over y to print y[i] for i in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    uint32_t fprintf_return_val_loop = fprintf(stderr, "0.2lf ", y[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  return;
}


int main(int argc, char ** argv) {
  struct cuda_dim3_equivalent grid_config;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced;    /* Address-exposed local */
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* B;
  uint8_t* tmp;
  uint8_t* x;
  uint8_t* y;
  int32_t unused_init_array_return;
  int32_t grid_dim_x_val;
  uint8_t* unused_kernel_y_placeholder_1;
  uint8_t* unused_kernel_y_placeholder_2;
  uint32_t i;
  uint32_t j;
  int32_t unused_print_array_return;

  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * sizeof(double));
  B = malloc(n * n * sizeof(double));
  tmp = malloc(n * sizeof(double));
  x = malloc(n * sizeof(double));
  y = malloc(n * sizeof(double));
  init_array(n, (double*)A, (double*)B, (double*)x);
  grid_dim_x_val = num_blocks(n, 256);
  grid_config.x = grid_dim_x_val;
  grid_config.y = 1;
  grid_config.z = 1;
  block_config.x = 256;
  block_config.y = 1;
  block_config.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced)), ((uint8_t*)(&grid_config)), 12);
  memcpy(((uint8_t*)(&block_config_coerced)), ((uint8_t*)(&block_config)), 12);
  // Simulates parallel execution of kernel_y to compute y = alpha*A*x + beta*B*x.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_val;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      int64_t ia;
      int64_t ja;

      // Thread computes y[i] if its index i is within the bound n.
      ia = 256 * i + j;
      if (ia < n) {
        tmp[ia] = 0;
        y[ia] = 0;
        for(int64_t ja = 0; ja < n;   ja = ja + 1){
          tmp[ia] = tmp[ia] + A[ia * n + ja] * x[ja];
          y[ia] = y[ia] + B[ia * n + ja] * x[ja];
        }
        y[ia] = 43532 * tmp[ia] + 12313 * y[ia];
      }
    }
  }
  // Conditionally prints the output array y to standard error if dump_code is 1.
  if (dump_code == 1) {
    print_array(n, ((double*)y));
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)B);
  free((uint8_t*)(double*)tmp);
  free((uint8_t*)(double*)x);
  free((uint8_t*)(double*)y);
  return 0;
}
