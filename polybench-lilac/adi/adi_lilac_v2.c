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
struct polybench_standard_FILE;
struct cuda_dim3_llvm_equivalent;
struct llvm_internal_dim3_coercion_helper;

/* Function definitions */

/* Types Definitions */
struct llvm_internal_u8_array1 {
  uint8_t array[1];
};
struct llvm_internal_u8_array20 {
  uint8_t array[20];
};
struct polybench_standard_FILE {
  uint32_t _flags;
  uint8_t* _IO_read_ptr;
  uint8_t* _IO_read_end;
  uint8_t* _IO_read_base;
  uint8_t* _IO_write_base;
  uint8_t* _IO_write_ptr;
  uint8_t* _IO_write_end;
  uint8_t* _IO_buf_base;
  uint8_t* _IO_buf_end;
  uint8_t* _IO_save_base;
  uint8_t* _IO_backup_base;
  uint8_t* _IO_save_end;
  void* _markers;
  struct polybench_standard_FILE* _chain;
  uint32_t _fileno;
  uint32_t _flags2;
  uint64_t _old_offset;
  uint16_t _cur_column;
  uint8_t _vtable_offset;
  uint8_t _shortbuf[1];
  uint8_t* _lock;
  uint64_t _offset;
  void* _codecvt;
  void* _wide_data;
  struct polybench_standard_FILE* _freeres_list;
  uint8_t* _freeres_buf;
  uint64_t _freeres_size;
  uint32_t _mode;
  uint8_t _unused2[20];
};
struct cuda_dim3_llvm_equivalent {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct llvm_internal_dim3_coercion_helper {
  uint64_t dim_xy_packed;
  uint32_t dim_z;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaFree(uint8_t*);
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void kernel_column_sweep(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_row_sweep(uint32_t, uint32_t, double*, double*, double*, double*, double, double, double, double, double, double, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
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


// Initializes arrays u, v, p, and q. u is initialized with specific values, while v, p, and q are zeroed out.
void init_array(uint32_t n, double* u, double* v, double* p, double* q) {
  int64_t i;
  uint64_t j;

  // Iterates through the n x n grid to initialize u, v, p, and q.
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      u[i * n + j] = ((double)(i + n - j)) / (double)n;
      v[i * n + j] = 0;
      p[i * n + j] = 0;
      q[i * n + j] = 0;
    }
  }
  return;
}


// Kernel: performs a row-wise sweep (tridiagonal solve) for the ADI method, updating array u.
void kernel_row_sweep(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int64_t j;

  // Thread processes row i if i is within bounds [1, n-2].
  i = block_dim_x * block_idx_x + thread_idx_x + 1;
  if (i < n - 1) {
    u[i * n] = 1;
    p[i + n] = 0;
    q[i * n] = u[i * n];
    for(int64_t j = 1; j < n - 1;   j = j + 1){
      p[i * n + j] = -f / (d * p[i * n + j - 1] + e);
      q[i * n + j] = (-a * v[(i - 1) * n + j] + (1 + 2 * a) * v[i * n + j] - c * v[(i + 1) * n + j] - d * q[i * n + j - 1]) / (d * p[i * n + j - 1] + e);
    }
    u[((i * n + n) - 1)] = 1;
    for(int64_t j = n + -2; j >= 1;   j = j + -1){
      u[(i * n + j)] = ((p[(i * n + j)] * u[((i * n + j) + 1)]) + q[(i * n + j)]);
    }
  }
  return;
}


// Kernel: performs a column-wise sweep (tridiagonal solve) for the ADI method, updating array v.
void kernel_column_sweep(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q, double a, double b, double c, double d, double e, double f, uint32_t grid_dim_x, uint32_t grid_dim_y, uint32_t grid_dim_z, uint32_t block_dim_x, uint32_t block_dim_y, uint32_t block_dim_z, uint32_t block_idx_x, uint32_t block_idx_y, uint32_t block_idx_z, uint32_t thread_idx_x, uint32_t thread_idx_y, uint32_t thread_idx_z) {
  int32_t i;
  int64_t j;

  // Thread processes column i if i is within bounds [1, n-2].
  i = block_dim_x * block_idx_x + thread_idx_x + 1;
  if (i < n - 1) {
    v[i] = 1;
    p[i * n] = 0;
    q[i * n] = v[i];
    for(int64_t j = 1; j < n - 1;   j = j + 1){
      p[i * n + j] = -c / (a * p[i * n + j - 1] + b);
      q[i * n + j] = (-d * u[j * n + i - 1] + (1 + 2 * d) * u[j * n + i] - f * u[j * n + i + 1] - (a * q[i * n + j - 1]))/ (a * p[i * n + j - 1] + b);
    }
    v[(n - 1) * n + i] = 1;
    for(int64_t j = n + -2; j >= 1;   j = j + -1){
      v[j * n + i] = p[i * n + j] * v[(j + 1) * n + i] + q[i * n + j];
    }
  }
  return;
}


// Implements the ADI (Alternating Direction Implicit) method for tsteps timesteps. It calculates coefficients and then simulates kernel_column_sweep and kernel_row_sweep for each timestep.
void kernel(uint32_t tsteps, uint32_t n, double* u, double* v, double* p, double* q) {
  struct cuda_dim3_llvm_equivalent grid_config_col_sweep;    /* Address-exposed local */
  struct cuda_dim3_llvm_equivalent block_config_col_sweep;    /* Address-exposed local */
  struct llvm_internal_dim3_coercion_helper grid_config_col_sweep_coerced;    /* Address-exposed local */
  struct llvm_internal_dim3_coercion_helper block_config_col_sweep_coerced;    /* Address-exposed local */
  struct cuda_dim3_llvm_equivalent grid_config_row_sweep;    /* Address-exposed local */
  struct cuda_dim3_llvm_equivalent block_config_row_sweep;    /* Address-exposed local */
  struct llvm_internal_dim3_coercion_helper grid_config_row_sweep_coerced;    /* Address-exposed local */
  struct llvm_internal_dim3_coercion_helper block_config_row_sweep_coerced;    /* Address-exposed local */
  double DX;
  double DY;
  double DT;
  double mul1;
  double mul2;
  double coeff_val_for_a_c_params;
  double b;
  double coeff_val_for_d_f_params;
  double e;
  int32_t t;
  uint32_t j;
  uint32_t k;

  DX = 1 / (double)n;
  DY = 1 / (double)n;
  DT = 1 / (double)tsteps;
  mul1 = (((2 * DT) / DX) / DX);
  mul2 = (((1 * DT) / DY) / DY);
  coeff_val_for_a_c_params = -mul1 / 2;
  b = 1 + mul1;
  coeff_val_for_d_f_params = -mul2 / 2;
  e = 1 + mul2;
  // Iterates for 'tsteps' timesteps, performing column and row sweeps in each step.
  for(int32_t t = 1; t <= tsteps;   t = t + 1){
    uint32_t grid_dim_x_for_col_sweep = num_blocks(n - 2, 256);
    grid_config_col_sweep.x = grid_dim_x_for_col_sweep;
    grid_config_col_sweep.y = 1;
    grid_config_col_sweep.z = 1;
    block_config_col_sweep.x = 256;
    block_config_col_sweep.y = 1;
    block_config_col_sweep.z = 1;
    memcpy(((uint8_t*)(&grid_config_col_sweep_coerced)), ((uint8_t*)(&grid_config_col_sweep)), 12);
    memcpy(((uint8_t*)(&block_config_col_sweep_coerced)), ((uint8_t*)(&block_config_col_sweep)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_for_col_sweep;   j = j + 1){
      for(int32_t k = 0; k < 256;   k = k + 1){
        kernel_column_sweep(tsteps, n, u, v, p, q, coeff_val_for_a_c_params, b, coeff_val_for_a_c_params, coeff_val_for_d_f_params, e, coeff_val_for_d_f_params, grid_dim_x_for_col_sweep, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
      }
    }
    uint32_t grid_dim_x_for_row_sweep = num_blocks((n - 2), 256);
    grid_config_row_sweep.x = grid_dim_x_for_row_sweep;
    grid_config_row_sweep.y = 1;
    grid_config_row_sweep.z = 1;
    block_config_row_sweep.x = 256;
    block_config_row_sweep.y = 1;
    block_config_row_sweep.z = 1;
    memcpy(((uint8_t*)(&grid_config_row_sweep_coerced)), ((uint8_t*)(&grid_config_row_sweep)), 12);
    memcpy(((uint8_t*)(&block_config_row_sweep_coerced)), ((uint8_t*)(&block_config_row_sweep)), 12);
#pragma omp parallel for collapse(2)
    for(int32_t j = 0; j < grid_dim_x_for_row_sweep;   j = j + 1){
      for(int32_t k = 0; k < 256;   k = k + 1){
        kernel_row_sweep(tsteps, n, u, v, p, q, coeff_val_for_a_c_params, b, coeff_val_for_a_c_params, coeff_val_for_d_f_params, e, coeff_val_for_d_f_params, grid_dim_x_for_row_sweep, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
      }
    }
  }
  return;
}


// Prints the elements of array u to standard error, 20 elements per line.
void print_array(uint32_t n, double* u) {
  int64_t i;
  uint64_t j;
  int32_t unused_fprintf_return_val_final;

  // Iterates over u to print u[i*n+j] for i in [0,n-1], j in [0,n-1].
  for(int64_t i = 0; i < n;   i = i + 1){
    for(int64_t j = 0; j < n;   j = j + 1){
      uint32_t grid_dim_x_for_col_sweep = fprintf(stderr, "0.2lf ", u[i * n + j]);
      if ((int)(i * n + j) % 20 == 0) {
        fprintf(stderr, "\n");
      }
    }
  }
  fprintf(stderr, "\n");
}


int main(int argc, char ** argv) {
  int32_t n;
  int32_t tsteps;
  int32_t dump_code;
  uint8_t* u;
  uint8_t* v;
  uint8_t* p;
  uint8_t* q;
  int32_t unused_kernel_call_return;
  int32_t unused_print_array_call_return;

  // Conditionally prints the output array u to standard error if dump_code is 1.
  n = atoi(argv[2]);
  tsteps = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  u = malloc(n * n * sizeof(double));
  v = malloc(n * n * sizeof(double));
  p = malloc(n * n * sizeof(double));
  q = malloc(n * n * sizeof(double));
  init_array(n, (double*)u, (double*)v, (double*)p, (double*)q);
  ;
  kernel(tsteps, n, (double*)u, (double*)v, (double*)p, (double*)q);
  ;
  if (dump_code == 1) {
    print_array(n, (double*)u);
  }
  free((uint8_t*)(double*)u);
  free((uint8_t*)(double*)v);
  free((uint8_t*)(double*)p);
  free((uint8_t*)(double*)q);
  return 0;
}
