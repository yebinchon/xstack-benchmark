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

#define N 15000


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
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void print_array(uint32_t, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_x1(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x2(uint32_t, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// INSERT COMMENT FUNCTION: num_blocks
int16_t num_blocks(int16_t num, int16_t factor) {
  return (num + factor - 1) / factor;
}


// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  int64_t i;
  uint64_t j;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < n;   i = i + 1){
    x1[i] = (double)i / (double)n;
    x2[i] = ((double)i + 1) / (double)n;
    y_1[i] = ((double)i + 3) / (double)n;
    y_2[i] = ((double)i + 4) / (double)n;
    for(int64_t j = 0; j < n;   j = j + 1){
      A[(i * n + j)] = ((double)i * (double)j) / (double)n;
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_x2
void kernel_x2(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t i;
  int64_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  if (i < n) {
    for(int64_t j = 0; j < n;   j = j + 1){
      x2[i] = x2[i] + A[(j * n + i)] * y_2[j];
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_x1
void kernel_x1(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t i;
  int64_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  if (i < n) {
    for(int64_t j = 0; j < n;   j = j + 1){
      x1[i] = x1[i] + A[(i * n + j)] * y_1[j];
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double* x1, double* x2, double* y_1, double* y_2, double* A) {
  struct cuda_dim3_equivalent block_config_x1;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_x1;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_x1;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_x1;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_x2;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_x2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_x2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_x2;    /* Address-exposed local */
  int32_t grid_dim_x_x1;
  uint8_t* unused_x1_placeholder_1;
  uint8_t* unused_x1_placeholder_2;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_x2;
  uint8_t* unused_x2_placeholder_1;
  uint8_t* unused_x2_placeholder_2;

  grid_dim_x_x1 = num_blocks(n, 256);
  grid_config_x1.x = grid_dim_x_x1;
  grid_config_x1.y = 1;
  grid_config_x1.z = 1;
  memcpy(((uint8_t*)(&block_config_coerced_x1)), ((uint8_t*)(&block_config_x1)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_x1)), ((uint8_t*)(&grid_config_x1)), 12);
  // INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 256;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_x_x1;   j = j + 1){
      kernel_x1(n, x1, x2, y_1, y_2, A, 256, 1, 1, grid_dim_x_x1, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  grid_dim_x_x2 = num_blocks(n, 256);
  grid_config_x2.x = grid_dim_x_x2;
  grid_config_x2.y = 1;
  grid_config_x2.z = 1;
  memcpy(((uint8_t*)(&block_config_coerced_x2)), ((uint8_t*)(&block_config_x2)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_x2)), ((uint8_t*)(&grid_config_x2)), 12);
  // INSERT COMMENT LOOP: header.010
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < 256;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_x_x2;   j = j + 1){
      kernel_x2(n, x1, x2, y_1, y_2, A, 256, 1, 1, grid_dim_x_x2, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* x1, double* x2) {
  int64_t i;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < n;   i = i + 1){
    uint32_t grid_dim_x_x1 = fprintf(stderr, "0.2lf ", x1[i]);
    uint32_t fprintf_return_val_loop_x2 = fprintf(stderr, "0.2lf ", x2[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  return;
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x1;
  uint8_t* x2;
  uint8_t* y_1;
  uint8_t* y_2;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  A = malloc(sizeof(double) * N * N);
  x1 = malloc(sizeof(double) * N);
  x2 = malloc(sizeof(double) * N);
  y_1 = malloc(sizeof(double) * N);
  y_2 = malloc(sizeof(double) * N);
  init_array(N, (double*)x1, (double*)x2, (double*)y_1, (double*)y_2, (double*)A);
  ;
  kernel(N, (double*)x1, (double*)x2, (double*)y_1, (double*)y_2, (double*)A);
  ;
  if (dump_code == 1) {
    print_array(N, (double*)x1, (double*)x2);
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)x1);
  free((uint8_t*)(double*)x2);
  free((uint8_t*)(double*)y_1);
  free((uint8_t*)(double*)y_2);
  return 0;
}
