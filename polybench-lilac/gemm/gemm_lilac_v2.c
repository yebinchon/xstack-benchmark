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
void init_array(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_dev(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t PRINTF_FORMAT_DOUBLE[8] = { "%0.2lf " };
uint8_t PRINTF_FORMAT_NEWLINE[2] = { "\n" };


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
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
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


// Initializes matrices C, A, and B. All are initialized with (i*j)/ni.
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, double* C, double* A, double* B) {
  int64_t i;
  int64_t j;

  // Initializes matrix C: C[i*nj+j] = (i*j)/ni for i in [0,ni-1], j in [0,nj-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      C[(i * nj + j)] = ((double)i * (double)j) / (double)ni;
    }
  }
  // Initializes matrix A: A[i*nk+j] = (i*j)/ni for i in [0,ni-1], j in [0,nk-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nk;   j = j + 1){
      A[(i * nk + j)] = ((double)i * (double)j) / (double)ni;
    }
  }
  // Initializes matrix B: B[i*nj+j] = (i*j)/ni for i in [0,nk-1], j in [0,nj-1].
  for(int64_t i = 0; i < nk;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      B[(i * nj + j)] = ((double)i * (double)j) / (double)ni;
    }
  }
  return;
}


// Kernel: computes C = alpha*A*B + beta*C. Each thread calculates one element C[i][j].
void kernel_dev(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;
  double dot;
  int64_t k;

  // Thread computes C[i][j] if its indices (i,j) are within matrix bounds (ni,nj).
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < ni && j < nj) {
    dot = (C[(i * nj + j)] * beta);
    for(int64_t k = 0; k < nk;   k = k + 1){
      dot = dot + alpha * A[i * nk + k] * B[k * nj + j];
    }
    C[i * nj + j] = dot;
  }
  return;
}


// Orchestrates the GEMM computation (C = alpha*A*B + beta*C) by simulating a single CUDA kernel launch (kernel_dev).
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_splat;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_splat;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  int32_t grid_dim_x_splat;
  int32_t grid_dim_y_splat;
  uint8_t* __FIXME__1;
  uint8_t* __FIXME__2;
  uint8_t* __FIXME__3;
  uint8_t* __FIXME__4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;

  grid_dim_x_splat = num_blocks(ni, 8);
  grid_dim_y_splat = num_blocks(nj, 32);
  grid.x = grid_dim_x_splat;
  grid.y = grid_dim_y_splat;
  grid.z = 1;
  memcpy(((uint8_t*)(&block_config_splat)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_splat)), ((uint8_t*)(&block_config_splat)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), 12);
  // Simulates parallel execution of kernel_dev to compute C = alpha*A*B + beta*C.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_splat;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_splat;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_dev(ni, nj, nk, alpha, beta, C, A, B, grid_dim_x_splat, grid_dim_y_splat, 1, 8, 32, 1, i, j, 0, k, l, 0);
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

  // Iterates over C to print C[i*nj+j] for i in [0,ni-1], j in [0,nj-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      uint32_t grid_dim_x_splat = fprintf(stderr, "0.2lf ", C[i * nj + j]);
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
  int32_t nk;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

  // Conditionally prints the output matrix C to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  A = malloc(ni * nk * sizeof(double));
  B = malloc(nk * nj * sizeof(double));
  C = malloc(ni * nj * sizeof(double));
  init_array(ni, nj, nk, (double*)C, (double*)A, (double*)B);
  ;
  kernel(ni, nj, nk, 32412, 2123, (double*)C, (double*)A, (double*)B);
  ;
  if (dump_code == 1) {
    print_array(ni, nj, (double*)C);
  }
  free((uint8_t*)(double*)C);
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)B);
  return 0;
}
