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
void init_array(uint32_t, uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_sum(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return (num + factor - 1) / factor;
}


// INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4) {
  int64_t i;
  int64_t j;
  int64_t k;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < nr;   i = i + 1){
    for(int64_t j = 0; j < nq;   j = j + 1){
      for(int64_t k = 0; k < np;   k = k + 1){
        A[i * np * nq + j * nq + k] = ((double)i * (double)j + (double)k) / (double)np;
      }
    }
  }
  // INSERT COMMENT LOOP: for.cond21
  for(int64_t i = 0; i < np;   i = i + 1){
    for(int64_t j = 0; j < np;   j = j + 1){
      C4[i * np + j] = ((double)i * (double)j) / (double)np;
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel_sum
void kernel_sum(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t r;
  int32_t q;
  int32_t p;
  int64_t s;
  double dot;

  // INSERT COMMENT IFELSE: entry
  r = block_dim_x * block_idx_x + thread_idx_x;
  q = block_dim_y * block_idx_y + thread_idx_y;
  p = block_dim_z * block_idx_z + thread_idx_z;
  if (r < nr && q < nq && p < np) {
    sum[(r * nq + q) * np + p] = 0;
    dot = 0;
    for(int64_t s = 0; s < np;   s = s + 1){
      dot = dot + A[(r * nq + q) * np + s] * C4[s * np + p];
    }
    sum[r * nq + q * np + p] = dot;
  }
  return;
}


// INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_kernel_sum;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel_sum;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel_sum;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel_sum;    /* Address-exposed local */
  int32_t grid_dim_x_val;
  int32_t grid_dim_y_val;
  int32_t grid_dim_z_val;
  uint8_t* unused_sum_placeholder_1;
  uint8_t* unused_sum_placeholder_2;
  uint8_t* unused_sum_placeholder_3;
  uint8_t* unused_sum_placeholder_4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  grid_dim_x_val = num_blocks(nr, 1);
  grid_dim_y_val = num_blocks(nq, 8);
  grid_dim_z_val = num_blocks(np, 32);
  grid.x = grid_dim_x_val;
  grid.y = grid_dim_y_val;
  grid.z = grid_dim_z_val;
  memcpy(((uint8_t*)(&grid_config_kernel_sum)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_config_kernel_sum)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&grid_config_coerced_kernel_sum)), ((uint8_t*)(&grid_config_kernel_sum)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_kernel_sum)), ((uint8_t*)(&block_config_kernel_sum)), 12);
  // INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_val;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_y_val;   j = j + 1){
      for(int32_t k = 0; k < grid_dim_z_val;   k = k + 1){
        for(int32_t l = 0; l < 8;   l = l + 1){
          for(int32_t m = 0; m < 32;   m = m + 1){
            kernel_sum(nr, nq, np, A, C4, sum, grid_dim_x_val, grid_dim_y_val, grid_dim_z_val, 1, 8, 32, i, j, k, 0, l, m);
          }
        }
      }
    }
  }
  return;
}


// INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t nr, uint32_t nq, uint32_t np, double* A) {
  int64_t i;
  int64_t j;
  int64_t k;
  int32_t unused_fprintf_return_val_final;

  // INSERT COMMENT LOOP: for.cond
  for(int64_t i = 0; i < nr;   i = i + 1){
    for(int64_t j = 0; j < nq;   j = j + 1){
      for(int64_t k = 0; k < np;   k = k + 1){
        uint32_t grid_dim_x_val = fprintf(stderr, "0.2lf ", A[i * nq * np + j * nq + k]);
        if (i % 20 == 0) {
          fprintf(stderr, "\n");
        }
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t nr;
  int32_t nq;
  int32_t np;
  uint8_t* A;
  uint8_t* sum;
  uint8_t* C4;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  nr = atoi(argv[2]);
  nq = atoi(argv[3]);
  np = atoi(argv[4]);
  A = malloc(nr * nq * np * sizeof(double));
  sum = malloc(nr * nq * np * sizeof(double));
  C4 = malloc(np * np * sizeof(double));
  init_array(nr, nq, np, (double*)A, (double*)C4);
  ;
  kernel(nr, nq, np, (double*)A, (double*)C4, (double*)sum);
  ;
  if (dump_code == 1) {
    print_array(nr, nq, np, (double*)sum);
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)sum);
  free((uint8_t*)(double*)C4);
  return 0;
}
