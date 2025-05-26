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
void init_array(uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_beta(uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_product(uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, double* C, double* A, double* B) {
  int64_t i;
  int64_t j;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      A[(i * nj + j)] = ((double)i * (double)j) / (double)ni;
      B[(i * nj + j)] = ((double)i * (double)j) / (double)ni;
    }
  }
  // INSERT COMMENT LOOP: for.cond19
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < ni;   j = j + 1){
      C[(i * ni + j)] = ((double)i * (double)j) / (double)ni;
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_product
void kernel_product(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < n && j <= i) {
    for(int64_t k = 0; k < m;   k = k + 1){
      C[(i * n + j)] = C[(i * n + j)] + A[(j * m + k)] * alpha * B[(i * m + k)] + B[(j * m + k)] * alpha * A[(i * m + k)];
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_beta
void kernel_beta(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // INSERT COMMENT IFELSE: entry
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < n && j <= i) {
    C[(i * n + j)] = C[(i * n + j)] * beta;
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A, double* B) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_beta;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_beta;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_beta;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_beta;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_product;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_product;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_product;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_product;    /* Address-exposed local */
  int32_t grid_dim_x_beta;
  int32_t grid_dim_y_beta;
  uint8_t* unused_beta_placeholder_1;
  uint8_t* unused_beta_placeholder_2;
  uint8_t* unused_beta_placeholder_3;
  uint8_t* unused_beta_placeholder_4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_dim_x_product;
  int32_t grid_dim_y_product;
  uint8_t* unused_product_placeholder_1;
  uint8_t* unused_product_placeholder_2;
  uint8_t* unused_product_placeholder_3;
  uint8_t* unused_product_placeholder_4;

  grid_dim_x_beta = num_blocks(n, 8);
  grid_dim_y_beta = num_blocks(n, 32);
  grid.x = grid_dim_x_beta;
  grid.y = grid_dim_y_beta;
  grid.z = 1;
  memcpy((uint8_t*)(&grid_config_beta), (uint8_t*)(&grid), 12);
  memcpy((uint8_t*)(&block_config_beta), (uint8_t*)(&block), 12);
  memcpy((uint8_t*)(&grid_config_coerced_beta), (uint8_t*)(&grid_config_beta), 12);
  memcpy((uint8_t*)(&block_config_coerced_beta), (uint8_t*)(&block_config_beta), 12);
  // INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_beta;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_beta;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_beta(n, m, alpha, beta, C, A, B, grid_dim_x_beta, grid_dim_y_beta, 1, 8, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  grid_dim_x_product = num_blocks(n, 8);
  grid_dim_y_product = num_blocks(n, 32);
  grid.x = grid_dim_x_product;
  grid.y = grid_dim_y_product;
  grid.z = 1;
  memcpy((uint8_t*)(&grid_config_product), (uint8_t*)(&grid), 12);
  memcpy((uint8_t*)(&block_config_product), (uint8_t*)(&block), 12);
  memcpy((uint8_t*)(&grid_config_coerced_product), (uint8_t*)(&grid_config_product), 12);
  memcpy((uint8_t*)(&block_config_coerced_product), (uint8_t*)(&block_config_product), 12);
  // INSERT COMMENT LOOP: header.010
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_product;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_product;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_product(n, m, alpha, beta, C, A, B, grid_dim_x_product, grid_dim_y_product, 1, 8, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, double* C) {
  int64_t i;
  uint64_t j;
  int32_t unused_fprintf_return_val_final;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < ni;   j = j + 1){
      uint32_t grid_dim_x_beta = fprintf(stderr, "0.2lf ", C[(i * ni + j)]);
      if ((int)(i * ni + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t m;
  int32_t n;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

  // INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  A = malloc(m * n * sizeof(double));
  B = malloc(m * n * sizeof(double));
  C = malloc(m * m * sizeof(double));
  init_array(m, n, (double*)C, (double*)A, (double*)B);
  ;
  kernel(m, n, 32412, 2123, (double*)C, (double*)A, (double*)B);
  ;
  if (dump_code == 1) {
    print_array(m, (double*)C);
  }
  free((uint8_t*)(double*)C);
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)B);
  return 0;
}
