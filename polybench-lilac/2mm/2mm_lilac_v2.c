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
int16_t num_blocks(int16_t, int16_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_A_mul_B(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_D_plus_tmp_mul_C(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
int16_t num_blocks(int16_t num, int16_t factor) {
  return (num + factor - 1) / factor;
}


// Initializes the input matrices A, B, C, D and the temporary matrix tmp.
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* A, double* B, double* C, double* D, double* tmp) {
  int64_t i;
  int64_t j;

  // Initializes matrix A: A[i*ni+j] = (i*j)/ni for i in [0,ni-1], j in [0,nk-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nk;   j = j + 1){
      A[i * ni + j] = ((double)i * (double)j) / (double)ni;
    }
  }
  // Initializes matrix B: B[i*nk+j] = (i*j)/nj for i in [0,nk-1], j in [0,nj-1].
  for(int64_t i = 0; i < nk;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      B[i * nk + j] = ((double)i * (double)j) / (double)nj;
    }
  }
  // Initializes matrix C: C[i*nl+j] = (i*(j+3))/nl for i in [0,nl-1], j in [0,nj-1].
  for(int64_t i = 0; i < nl;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      C[i * nl + j] = ((double)i * (double)(j + 3)) / (double)nl;
    }
  }
  // Initializes matrix D: D[i*ni+j] = (i*(j+2))/nk for i in [0,ni-1], j in [0,nl-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nl;   j = j + 1){
      D[i * ni + j] = ((double)i * (double)(j + 2)) / (double)nk;
    }
  }
  // Initializes matrix tmp: tmp[i*ni+j] = 0 for i in [0,ni-1], j in [0,nj-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nj;   j = j + 1){
      tmp[i * ni + j] = 0;
    }
  }
  return;
}


// Kernel: computes D = beta*D + tmp*C. Each thread calculates one element D[i][l].
void kernel_D_plus_tmp_mul_C(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;

  // Thread computes D[i][l] if its indices (i,l) are within matrix bounds (ni,nl).
  i = block_dim_x * block_idx_x + thread_idx_x;
  l = block_dim_y * block_idx_y + thread_idx_y;
  if (i < ni && l < nl) {
    dot = D[i * nj + l] * beta;
    for(int64_t j = 0; j < nj;   j = j + 1){
      dot = dot + tmp[i * nj + j] * C[j * nl + l];
    }
    D[i * nl + l] = dot;
  }
  return;
}


// Kernel: computes tmp = alpha * A * B. Each thread calculates one element tmp[i][j].
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

  // Thread computes tmp[i][j] if its indices (i,j) are within matrix bounds (ni,nj).
  i = block_dim_x * block_idx_x + thread_idx_x;
  j = block_dim_y * block_idx_y + thread_idx_y;
  if (i < ni && j < nj) {
    dot = 0;
    for(int64_t k = 0; k < nk;   k = k + 1){
      dot = dot + alpha * A[i * nk + k] * B[k * nj + j];
    }
    tmp[i * nj + j] = dot;
  }
  return;
}


// Orchestrates the 2mm computation (tmp = alpha*A*B; D = beta*D + tmp*C) by simulating CUDA kernel launches.
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_temp1;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_temp1;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced1;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced1;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_temp2;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_temp2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced2;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced2;    /* Address-exposed local */
  uint32_t block_dim_x_value;
  int32_t grid_dim_x_kernel1;
  int32_t grid_dim_y_kernel1;
  uint8_t* unused_kernel_placeholder_1;
  uint8_t* unused_kernel_placeholder_2;
  uint8_t* unused_kernel_placeholder_3;
  uint8_t* unused_kernel_placeholder_4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t grid_dim_x_kernel2;
  int32_t grid_dim_y_kernel2;
  uint8_t* unused_kernel_placeholder_5;
  uint8_t* unused_kernel_placeholder_6;
  uint8_t* unused_kernel_placeholder_7;
  uint8_t* unused_kernel_placeholder_8;

  block_dim_x_value = 8;
  block.x = block_dim_x_value;
  grid_dim_x_kernel1 = num_blocks(ni, 8);
  grid_dim_y_kernel1 = num_blocks(nj, 32);
  grid.x = grid_dim_x_kernel1;
  grid.y = grid_dim_y_kernel1;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_config_temp1)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_temp1)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced1)), ((uint8_t*)(&grid_config_temp1)), 12);
  memcpy(((uint8_t*)(&block_config_coerced1)), ((uint8_t*)(&block_config_temp1)), 12);
  // Simulates parallel execution of kernel_A_mul_B to compute tmp = alpha*A*B.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_kernel1;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_kernel1;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_A_mul_B(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, grid_dim_x_kernel1, grid_dim_y_kernel1, 1, block_dim_x_value, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  grid_dim_x_kernel2 = num_blocks(ni, 8);
  grid_dim_y_kernel2 = num_blocks(nl, 32);
  grid.x = grid_dim_x_kernel2;
  grid.y = grid_dim_y_kernel2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_config_temp2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_temp2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced2)), ((uint8_t*)(&grid_config_temp2)), 12);
  memcpy(((uint8_t*)(&block_config_coerced2)), ((uint8_t*)(&block_config_temp2)), 12);
  // Simulates parallel execution of kernel_D_plus_tmp_mul_C to compute D = beta*D + tmp*C.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_kernel2;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_kernel2;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          kernel_D_plus_tmp_mul_C(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, grid_dim_x_kernel2, grid_dim_y_kernel2, 1, block_dim_x_value, 32, 1, i, j, 0, k, l, 0);
        }
      }
    }
  }
  return;
}


// Prints the elements of matrix D to standard error, 20 elements per line.
void print_array(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;
  int32_t unused_fprintf_return_val_final;

  // Iterates over D to print D[i*ni+j] for i in [0,ni-1], j in [0,nl-1].
  for(int64_t i = 0; i < ni;   i = i + 1){
    for(int64_t j = 0; j < nl;   j = j + 1){
      uint32_t grid_dim_x_kernel1 = fprintf(stderr, "0.2lf ", D[i * ni + j]);
      if ((int)(i * ni + j) % (int)20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int64_t ni_val_from_arg;
  int64_t nj_val_from_arg;
  int64_t nk_val_from_arg;
  int64_t nl_val_from_arg;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;
  int32_t unused_return_val_1;
  int32_t unused_return_val_2;

  // Conditionally prints the output matrix D to standard error if dump_code is 1.
  dump_code = atoi(argv[1]);
  ni_val_from_arg = atoi(argv[2]);
  nj_val_from_arg = atoi(argv[3]);
  nk_val_from_arg = atoi(argv[4]);
  nl_val_from_arg = atoi(argv[5]);
  A = malloc(ni_val_from_arg * nk_val_from_arg * sizeof(double));
  B = malloc(nk_val_from_arg * nj_val_from_arg * sizeof(double));
  C = malloc(nl_val_from_arg * nj_val_from_arg * sizeof(double));
  D = malloc(ni_val_from_arg * nl_val_from_arg * sizeof(double));
  tmp = malloc(ni_val_from_arg * nj_val_from_arg * sizeof(double));
  init_array(ni_val_from_arg, nj_val_from_arg, nk_val_from_arg, nl_val_from_arg, (double*)A, (double*)B, (double*)C, (double*)D, (double*)tmp);
  ;
  kernel(ni_val_from_arg, nj_val_from_arg, nk_val_from_arg, nl_val_from_arg, 32412, 2123, (double*)tmp, (double*)A, (double*)B, (double*)C, (double*)D);
  ;
  if (dump_code == 1) {
    print_array(ni_val_from_arg, nk_val_from_arg, (double*)D);
  }
  free((uint8_t*)(double*)tmp);
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)B);
  free((uint8_t*)(double*)C);
  free((uint8_t*)(double*)D);
  return 0;
}
