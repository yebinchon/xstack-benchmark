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
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_A(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_x(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_y(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_w(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes matrix A and vectors u1, v1, u2, v2, y, z. Vectors x and w are zeroed out.
void init_array(uint32_t n, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  int64_t i;
  uint64_t j;

  // Initializes vectors u1, u2, v1, v2, y, z, x, w and matrix A.
  for(int64_t i = 0; i < n;   i = i + 1){
    u1[i] = (double)(i);
    u2[i] = ((double)((i + 1) / n) / 2);
    v1[i] = ((double)((i + 1) / n) / 4);
    v2[i] = ((double)((i + 1) / n) / 6);
    y[i] = ((double)((i + 1) / n) / 8);
    z[i] = ((double)((i + 1) / n) / 9);
    x[i] = 0;
    w[i] = 0;
    for(int64_t j = 0; j < n;   j = j + 1){
      A[(i * n + j)] = ((double)i * (double)j) / (double)n;
    }
  }
  return;
}


// Performs a series of vector and matrix operations: A = A + u1*v1_transpose + u2*v2_transpose; x = beta*A_transpose*y + z; w = alpha*A*x. Simulates four kernel launches (kernel_A, kernel_x, kernel_y, kernel_w).
void kernel(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  struct cuda_dim3_equivalent block;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_splat;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp4;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_splat;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp4_2e_coerce;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_ey;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp8;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_ey;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp8_2e_coerce;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp13;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp15;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp13_2e_coerce;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp15_2e_coerce;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp20;    /* Address-exposed local */
  struct cuda_dim3_equivalent __FIXME__agg_2e_tmp22;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp20_2e_coerce;    /* Address-exposed local */
  struct internal_dim3_coercion_helper __FIXME__agg_2e_tmp22_2e_coerce;    /* Address-exposed local */
  int32_t grid_dim_x_splat;
  int32_t grid_dim_x_ey;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t __FIXME__call7;
  int32_t grid_dim_x_ex;
  int32_t unused_fprintf_return_val_final;

  grid_dim_x_splat = num_blocks(n, 8);
  grid_dim_x_ey = num_blocks(n, 32);
  grid.x = grid_dim_x_splat;
  grid.y = grid_dim_x_ey;
  grid.z = 1;
  memcpy(((uint8_t*)(&block_config_splat)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp4)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_splat)), ((uint8_t*)(&block_config_splat)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp4_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp4)), 12);
  // Simulates parallel execution of kernel_A to compute A = A + u1*v1_transpose + u2*v2_transpose.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_splat;   i = i + 1){
    for(int32_t j = 0; j < grid_dim_x_ey;   j = j + 1){
      for(int32_t k = 0; k < 8;   k = k + 1){
        for(int32_t l = 0; l < 32;   l = l + 1){
          int64_t ia;
          int64_t ja;

          // Thread computes A[i][j] if its indices (i,j) are within matrix bounds (n,n).
          ia = 8 * i + k;
          ja = 32 * j + l;
          if (ia < n && ja < n) {
            A[ia * n + ja] = A[ia * n + ja] + u1[ia] * v1[ja] + u2[ia] * v2[ja];
          }
        }
      }
    }
  }
  __FIXME__call7 = num_blocks(n, 256);
  block_config_ey.x = __FIXME__call7;
  block_config_ey.y = 1;
  block_config_ey.z = 1;
  // Simulates parallel execution of kernel_x to compute x = x + beta*A_transpose*y (partial sum for x).
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < __FIXME__call7;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      int64_t ia;
      int64_t ja;

      // Thread computes x[i] if its index i is within the bound n.
      ia = 256 * i + j;
      if (ia < n) {
        for(int64_t ja = 0; ja < n;   ja = ja + 1){
          x[ia] = x[ia] + beta * A[ja * n + ia] * y[ja];
        }
      }
    }
  }
  grid_dim_x_ex = num_blocks(n, 256);
  // Simulates parallel execution of kernel_y to compute x = x + z.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_ex;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      int64_t ia;

      // Thread computes x[i] if its index i is within the bound n.
      ia = 256 * i + j;
      if (ia < n) {
        x[ia] = x[ia] + z[ia];
      }
    }
  }
  unused_fprintf_return_val_final = num_blocks(n, 256);
  // Simulates parallel execution of kernel_w to compute w = w + alpha*A*x.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < unused_fprintf_return_val_final;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      int64_t ia;
      int64_t ja;

      // Thread computes w[i] if its index i is within the bound n.
      ia = 256 * i + j;
      if (ia < n) {
        for(int64_t ja = 0; ja < n;   ja = ja + 1){
          w[ia] = w[ia] + alpha * A[ia * n + ja] * x[ja];
        }
      }
    }
  }
  return;
}


// Prints the elements of array w to standard error, 20 elements per line.
void print_array(uint32_t n, double* w) {
  int64_t i;

  // Iterates over w to print w[i] for i in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    uint32_t grid_dim_x_splat = fprintf(stderr, "0.2lf ", w[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  return;
}


int main(int argc, char ** argv) {
  int32_t n;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;

  // Conditionally prints the output array w to standard error if dump_code is 1.
  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  A = malloc(n * n * sizeof(double));
  u1 = malloc(n * sizeof(double));
  v1 = malloc(n * sizeof(double));
  u2 = malloc(n * sizeof(double));
  v2 = malloc(n * sizeof(double));
  w = malloc(n * sizeof(double));
  x = malloc(n * sizeof(double));
  y = malloc(n * sizeof(double));
  z = malloc(n * sizeof(double));
  init_array(n, (double*)A, (double*)u1, (double*)v1, (double*)u2, (double*)v2, (double*)w, (double*)x, (double*)y, (double*)z);
  ;
  kernel(n, 43532, 12313, (double*)A, (double*)u1, (double*)v1, (double*)u2, (double*)v2, (double*)w, (double*)x, (double*)y, (double*)z);
  ;
  if (dump_code == 1) {
    print_array(n, ((double*)w));
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)u1);
  free((uint8_t*)(double*)v1);
  free((uint8_t*)(double*)u2);
  free((uint8_t*)(double*)v2);
  free((uint8_t*)(double*)w);
  free((uint8_t*)(double*)x);
  free((uint8_t*)(double*)y);
  free((uint8_t*)(double*)z);
  return 0;
}
