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

#define PI 3.1415926535897931

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
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel3(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel4(uint32_t, uint32_t, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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


// Initializes arrays A, x, tmp, and y. x is initialized with i*pi, tmp is zeroed, and A is initialized with (i*j)/nx.
void init_array(uint32_t nx, uint32_t ny, double* A, double* x, double* tmp, double* y) {
  int64_t i;
  int64_t j;

  // Initializes vector x: x[i] = i * PI for i in [0, ny-1].
  for(int64_t i = 0; i < ny;   i = i + 1){
    x[i] = (double)i * PI;
  }
  // Initializes vector tmp to zeros: tmp[i] = 0 for i in [0, nx-1].
  for(int64_t i = 0; i < nx;   i = i + 1){
    tmp[i] = 0;
  }
  // Initializes matrix A: A[i*ny+j] = (i*j)/nx for i in [0,nx-1], j in [0,ny-1].
  for(int64_t i = 0; i < nx;   i = i + 1){
    for(int64_t j = 0; j < ny;   j = j + 1){
      A[i * ny + j] = ((double)i * (double)j) / (double)nx;
    }
  }
  return;
}


// Kernel: computes y = A_transpose*tmp. Each thread computes one element y[j].
void kernel4(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t j;
  int64_t i;
  double dot;

  // Thread computes y[j] if its index j is within the bound n (ny).
  j = block_dim_x * block_idx_x + thread_idx_x;
  if (j < n) {
    y[j] = 0;
    dot = 0;
    for(int64_t i = 0; i < m;   i = i + 1){
      dot = dot + A[i * n + j] * tmp[i];
    }
    y[j] = dot;
  }
  return;
}


// Kernel: computes tmp = A*x. Each thread computes one element tmp[i].
void kernel3(uint32_t m, uint32_t n, double* A, double* x, double* y, double* tmp, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int64_t i;
  int64_t j;
  double dot;

  // Thread computes tmp[i] if its index i is within the bound m (nx).
  i = block_dim_x * block_idx_x + thread_idx_x;
  if (i < m) {
    dot = 0;
    for(int64_t j = 0; j < n;   j = j + 1){
      dot = dot + A[i * n + j] * x[j];
    }
    tmp[i] = dot;
  }
  return;
}


// Prints the elements of array y to standard error, 20 elements per line.
void print_array(uint32_t nx, double* y) {
  int64_t i;
  int32_t unused_fprintf_return_final;

  // Iterates over y to print y[i] for i in [0,nx-1].
  for(int64_t i = 0; i < nx;   i = i + 1){
    uint32_t fprintf_return_loop = fprintf(stderr, "0.2lf ", y[i]);
    if (i % 20 == 0) {
      fprintf(stderr, "\n");
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  struct cuda_dim3_equivalent grid_config_kernel3;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel3;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel3;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel3;    /* Address-exposed local */
  struct cuda_dim3_equivalent grid_config_kernel4;    /* Address-exposed local */
  struct cuda_dim3_equivalent block_config_kernel4;    /* Address-exposed local */
  struct internal_dim3_coercion_helper grid_config_coerced_kernel4;    /* Address-exposed local */
  struct internal_dim3_coercion_helper block_config_coerced_kernel4;    /* Address-exposed local */
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x;
  uint8_t* y;
  uint8_t* tmp;
  int32_t unused_init_array_return;
  int32_t grid_dim_x_kernel3;
  uint8_t* unused_kernel3_placeholder1;
  uint8_t* unused_kernel3_placeholder2;
  uint32_t i;
  uint32_t j;
  int32_t grid_dim_x_kernel4;
  uint8_t* unused_kernel4_placeholder1;
  uint8_t* unused_kernel4_placeholder2;
  int32_t unused_print_array_return;

  nx = atoi(argv[2]);
  ny = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(nx * ny * sizeof(double));
  x = malloc(ny * sizeof(double));
  y = malloc(ny * sizeof(double));
  tmp = malloc(nx * sizeof(double));
  init_array(nx, ny, (double*)A, (double*)x, (double*)tmp, (double*)y);
  grid_dim_x_kernel3 = num_blocks(nx, 256);
  grid_config_kernel3.x = grid_dim_x_kernel3;
  grid_config_kernel3.y = 1;
  grid_config_kernel3.z = 1;
  block_config_kernel3.x = 256;
  block_config_kernel3.y = 1;
  block_config_kernel3.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced_kernel3)), ((uint8_t*)(&grid_config_kernel3)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_kernel3)), ((uint8_t*)(&block_config_kernel3)), 12);
  // Simulates parallel execution of kernel4 to compute y = A_transpose*tmp.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_kernel3;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel3(nx, ny, (double*)A, (double*)x, (double*)y, (double*)tmp, grid_dim_x_kernel3, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  grid_dim_x_kernel4 = num_blocks(ny, 256);
  grid_config_kernel4.x = grid_dim_x_kernel4;
  grid_config_kernel4.y = 1;
  grid_config_kernel4.z = 1;
  block_config_kernel4.x = 256;
  block_config_kernel4.y = 1;
  block_config_kernel4.z = 1;
  memcpy(((uint8_t*)(&grid_config_coerced_kernel4)), ((uint8_t*)(&grid_config_kernel4)), 12);
  memcpy(((uint8_t*)(&block_config_coerced_kernel4)), ((uint8_t*)(&block_config_kernel4)), 12);
  // Simulates parallel execution of kernel3 to compute tmp = A*x.
#pragma omp parallel for collapse(2)
  for(int32_t i = 0; i < grid_dim_x_kernel4;   i = i + 1){
    for(int32_t j = 0; j < 256;   j = j + 1){
      kernel4(nx, ny, (double*)A, (double*)x, (double*)y, (double*)tmp, grid_dim_x_kernel4, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
    }
  }
  // Conditionally prints the output array y to standard error if dump_code is 1.
  if (dump_code == 1) {
    print_array(nx, (double*)y);
  }
  free((uint8_t*)(double*)A);
  free((uint8_t*)(double*)x);
  free((uint8_t*)(double*)y);
  free((uint8_t*)(double*)tmp);
  return 0;
}
