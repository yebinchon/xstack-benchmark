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
void init_array(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double, double, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_tmp(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_C(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_sum(uint32_t, uint32_t, double, double, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes matrices C, A, B, and tmp. C, B, tmp are ni x nj; A is nj x nj. All are initialized with (i*j)/ni.
void init_array(uint32_t ni, uint32_t nj, double* C, double* A, double* B, double* tmp) {
  int64_t i;
  int64_t j;

  // Initializes matrices C, B, and tmp.
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      C[(i * nj + j)] = ((double)i * (double)j) / (double)(ni);
      B[(i * nj + j)] = ((double)i * (double)j) / (double)(ni);
      tmp[(i * nj + j)] = 0;
    }
  }
  // Initializes matrix A.
  for(int64_t i = 0; i < nj;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      A[(i * nj + j)] = ((double)i * (double)j) / (double)ni;
    }
  }
  return;
}


// Kernel: computes C[k][j] += sum_{i=k+1 to m-1} (alpha*B[i][j]*A[i][k]). Each thread processes one (k,j) pair.
void kernel_sum(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t k;
  int32_t j;
  int64_t i;

  // Thread updates C[k][j] if its indices (k,j) are within bounds (k < m-1, j < n).
  k = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (k < (m - 1) && j < n) {
    i = k + 1;
    for(int64_t i = k + 1; i < m;   i = i + 1){
      C[(k * n + j)] = C[(k * n + j)] + alpha * B[(i * n + j)] * A[(i * n + k)];
    }
  }
  return;
}


// Kernel: computes C[i][j] = beta*C[i][j] + alpha*B[i][j]*A[i][i] + alpha*tmp[i][j]. Each thread calculates one element C[i][j].
void kernel_C(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;

  // Thread computes C[i][j] if its indices (i,j) are within matrix bounds (m,n).
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < m && j < n) {
    C[(i * n + j)] = beta * C[(i * n + j)] + alpha * B[(i * n + j)] * A[(i * n + i)] + alpha * tmp[(i * n + j)];
  }
  return;
}


// Kernel: computes tmp[i][j] = sum_{k=0 to i-1} (B[k][j] * A[i][k]). Each thread calculates one element tmp[i][j].
void kernel_tmp(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;
  int64_t k;

  // Thread computes tmp[i][j] if its indices (i,j) are within matrix bounds (m,n).
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < m && j < n) {
    tmp[(i * n + j)] = 0;
    for(int64_t k = 0; k < i;   k = k + 1){
      tmp[(i * n + j)] = tmp[(i * n + j)] + B[(k * n + j)] * A[(i * n + k)];
    }
  }
  return;
}


// Computes C = alpha*A*B + beta*C for symmetric A, using three kernel simulations: kernel_tmp, kernel_C, and kernel_sum.
void kernel(uint32_t m, uint32_t n, double alpha, double beta, double* C, double* A, double* B, double* tmp) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_tmp;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_tmp;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_tmp;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_tmp;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_C;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_C;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_C;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_C;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_sum;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_sum;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_sum;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_sum;    /* Address-exposed local */
  int32_t grid_dim_x_tmp;
  int32_t grid_dim_y_tmp;
  uint8_t* unused_tmp_placeholder_1;
  uint8_t* unused_tmp_placeholder_2;
  uint8_t* unused_tmp_placeholder_3;
  uint8_t* unused_tmp_placeholder_4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_dim_x_C;
  int32_t grid_dim_y_C;
  uint8_t* unused_C_placeholder_1;
  uint8_t* unused_C_placeholder_2;
  uint8_t* unused_C_placeholder_3;
  uint8_t* unused_C_placeholder_4;
  int32_t grid_dim_x_sum;
  int32_t grid_dim_y_sum;
  uint8_t* unused_sum_placeholder_1;
  uint8_t* unused_sum_placeholder_2;
  uint8_t* unused_sum_placeholder_3;
  uint8_t* unused_sum_placeholder_4;

  grid_dim_x_tmp = num_blocks(m, 8);
  grid_dim_y_tmp = num_blocks(n, 32);
  grid.x = grid_dim_x_tmp;
  grid.y = grid_dim_y_tmp;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_config_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_tmp)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_tmp)), ((uint8_t*)(&grid_config_tmp)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_tmp)), ((uint8_t*)(&block_config_tmp)), 12);
  // Simulates parallel execution of kernel_tmp to compute an intermediate part of the sum.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_tmp;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_tmp;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_tmp(m, n, alpha, beta, C, A, B, tmp, grid_dim_x_tmp, grid_dim_y_tmp, 1, 8, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  grid_dim_x_C = num_blocks(m, 8);
  grid_dim_y_C = num_blocks(n, 32);
  grid.x = grid_dim_x_C;
  grid.y = grid_dim_y_C;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_config_C)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_C)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_C)), ((uint8_t*)(&grid_config_C)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_C)), ((uint8_t*)(&block_config_C)), 12);
  // Simulates parallel execution of kernel_C to update C using the diagonal of A and the previously computed tmp.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_C;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_C;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_C(m, n, alpha, beta, C, A, B, tmp, grid_dim_x_C, grid_dim_y_C, 1, 8, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  grid_dim_x_sum = num_blocks(m - 1, 8);
  grid_dim_y_sum = num_blocks(n, 32);
  grid.x = grid_dim_x_sum;
  grid.y = grid_dim_y_sum;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_config_sum)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_sum)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_sum)), ((uint8_t*)(&grid_config_sum)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_sum)), ((uint8_t*)(&block_config_sum)), 12);
  // Simulates parallel execution of kernel_sum to complete the sum for C using the off-diagonal elements of A.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_sum;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_sum;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_sum(m, n, alpha, beta, C, A, B, tmp, grid_dim_x_sum, grid_dim_y_sum, 1, 8, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  return;
}


// Prints the elements of matrix C to standard error, 20 elements per line.
void print_array(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;
  int32_t unused_fprintf_return_val_final;

  // Iterates over C to print C[i*nj+j] for i in [0,ni-1], j in [0,nj-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      uint32_t grid_dim_x_tmp = fprintf(stderr, "0.2lf ", C[(i * nj + j)]);
      if ((int)(i * ni + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* tmp;

  // Conditionally prints the output matrix C to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  A = malloc(nj * nj * sizeof(double));
  B = malloc(ni * nj * sizeof(double));
  C = malloc(ni * nj * sizeof(double));
  tmp = malloc(ni * nj * sizeof(double));
  init_array(ni, nj, (double*)C, (double*)A, (double*)B, (double*)tmp);
  ;
  kernel(ni, nj, 32412, 2123, (double*)C, (double*)A, (double*)B, (double*)tmp);
  ;
  if (dump_code == 1) {
    print_array(ni, nj, (double*)C);
  }
  free((uint8_t*)(double*)C);
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)B);
  return 0;
}
