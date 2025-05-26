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
void init_array(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double, double, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_beta(uint32_t, uint32_t, double, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_product(uint32_t, uint32_t, double, double, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  return ((num + factor) - 1) / factor;
}


// Initializes matrices A (ni x nj) and C (ni x ni). Both are initialized with (i*j)/ni.
void init_array(uint32_t ni, uint32_t nj, double* C, double* A) {
  int64_t i;
  int64_t j;

  // Initializes matrix A.
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      A[(i * nj + j)] = (((double)i * (double)j) / (double)ni);
    }
  }
  // Initializes matrix C.
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < ni;   j = j + 1){
      C[(i * ni + j)] = (((double)i * (double)j) / (double)ni);
    }
  }
  return;
}


// Computes C = beta*C + alpha*A*A_transpose for the lower triangular part of C. Simulates two kernel launches (kernel_beta, kernel_product).
void kernel(uint32_t n, uint32_t m, double alpha, double beta, double* C, double* A) {
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

  grid_dim_x_beta = num_blocks(n, 8);
  grid_dim_y_beta = num_blocks(n, 32);
  grid.x = grid_dim_x_beta;
  grid.y = grid_dim_y_beta;
  grid.z = 1;
  memcpy((uint8_t*)(&grid_config_beta), (uint8_t*)(&grid), 12);
  memcpy((uint8_t*)(&block_config_beta), (uint8_t*)(&block), 12);
  memcpy((uint8_t*)(&grid_config_coerced_beta), (uint8_t*)(&grid_config_beta), 12);
  memcpy((uint8_t*)(&block_config_coerced_beta), (uint8_t*)(&block_config_beta), 12);
  // Simulates parallel execution of kernel_beta to compute C = beta*C for the lower triangular part.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_beta;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_beta;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          int32_t idx;
          int32_t jdx;

          // Thread computes C[i][j] if its indices (i,j) are within matrix bounds (n,n) and j <= i.
          idx = 8 * i + k;
          jdx = 32 * j + l;
          if (idx < n && jdx <= i) {
            C[(idx * n + jdx)] = C[(idx * n + jdx)] * beta;
          }

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
  // Simulates parallel execution of kernel_product to add alpha*A*A_transpose to the lower triangular part of C.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_product;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_product;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          int32_t idx;
          int32_t jdx;
          int64_t kdx;

          // Thread computes C[i][j] if its indices (i,j) are within matrix bounds (n,n) and j <= i.
          idx = 8 * i + k; 
          jdx = 32 * j + l;
          if (idx < n && jdx <= i) {
            for(int64_t kdx = 0; kdx < m;   kdx = kdx + 1){
              C[(idx * n + jdx)] = C[(idx * n + jdx)] + alpha * A[(idx * m + kdx)] * A[(jdx * m + kdx)];
            }
          }
        }
      }
    }
  }
  return;
}


// Prints the elements of matrix C to standard error, 20 elements per line.
void print_array(uint32_t ni, double* C) {
  int64_t i;
  uint64_t j;
  int32_t unused_fprintf_return_val_final;

  // Iterates over C to print C[i*ni+j] for i,j in [0,ni-1].
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
  uint8_t* C;

  // Conditionally prints the output matrix C to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  m = atoi(argv[2]);
  n = atoi(argv[3]);
  A = malloc(m * n * sizeof(double));
  C = malloc(m * m * sizeof(double));
  init_array(m, n, (double*)C, (double*)A);
  ;
  kernel(m, n, 32412, 2123, (double*)C, (double*)A);
  ;
  if (dump_code == 1) {
    print_array(m, (double*)C);
  }
  free((uint8_t*)(double*)C);
  free((uint8_t*)(double*)A);
  return 0;
}
