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
struct custon_IO_FILE_type;
struct cuda_dim3_type;
struct coerced_kernel_launch_params;

/* Function definitions */

/* Types Definitions */
struct uint8_array_1_wrapper {
  uint8_t data[1];
};
struct uint8_array_20_wrapper {
  uint8_t data[20];
};
struct custon_IO_FILE_type {
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
  struct _chain;
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
  struct custon_IO_FILE_type* _freeres_list;
  uint8_t* _freeres_buf;
  uint64_t _pad5;
  uint32_t _mode;
  uint8_t _unused2[20];
};
struct cuda_dim3_type {
  uint32_t x;
  uint32_t y;
  uint32_t z;
};
struct coerced_kernel_launch_params {
  uint64_t dim_params_u64;
  uint32_t stream_id_u32;
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
uint8_t FORMAT_STRING_DOUBLE_PERCENT_LF[8] = { "%0.2lf " };
uint8_t NEWLINE_CHAR_STRING[2] = { "\n" };


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

//Calculates required blocks: ceil(num / factor).
int16_t num_blocks(int16_t num, int16_t factor) {
  return ((num + factor) - 1) / factor;
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int64_t ni_val_arg;
  int64_t nj_val_arg;
  int64_t nk_val_arg;
  int64_t nl_val_arg;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;
  uint8_t* tmp;
  int32_t unused_main_var_1;
  int32_t unused_main_var_2;
  const double kernel_alpha_input = 32412;
  const double kernel_beta_input = 2123;

  dump_code = atoi(argv[1]);
  ni_val_arg = atoi(argv[2]);
  nj_val_arg = atoi(argv[3]);
  nk_val_arg = atoi(argv[4]);
  nl_val_arg = atoi(argv[5]);
  A = (uint8_t*)malloc(ni_val_arg * nk_val_arg * sizeof(double));
  B = (uint8_t*)malloc(nk_val_arg * nj_val_arg * sizeof(double));
  C = (uint8_t*)malloc(nl_val_arg * nj_val_arg * sizeof(double));
  D = (uint8_t*)malloc(ni_val_arg * nl_val_arg * sizeof(double));
  tmp = (uint8_t*)malloc(ni_val_arg * nj_val_arg * sizeof(double));
  init_array(ni_val_arg, nj_val_arg, nk_val_arg, nl_val_arg, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  kernel(ni_val_arg, nj_val_arg, nk_val_arg, nl_val_arg, kernel_alpha_input, kernel_beta_input, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  if (dump_code == 1) {
print_array(ni_val_arg, nk_val_arg, ((double*)D));
  }
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
  return 0;
}


//Initializes matrices A, B, C, D, tmp. Values from indices/dims. Uses first dim as row stride.
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* A, double* B, double* C, double* D, double* tmp) {
  int64_t i;
  int64_t j;

for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  A[(i * ni + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  B[(i * nk + j)] = (((double)(i) * (double)(j)) / (double)(nj));
}
}
for(int64_t i = 0; i < nl;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nl + j)] = (((double)(i) * (double)((j + 3))) / (double)(nl));
}
}
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  D[(i * ni + j)] = (((double)(i) * (double)((j + 2))) / (double)(nk));
}
}
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  tmp[(i * ni + j)] = 0;
}
}
  return;
}


//Orchestrates OpenMP parallel computation: 1. tmp = alpha*A*B; 2. D = beta*D + tmp*C.
void kernel(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  struct cuda_dim3_type block;    /* Address-exposed local */
  struct cuda_dim3_type grid;    /* Address-exposed local */
  struct cuda_dim3_type grid_params_copy1;    /* Address-exposed local */
  struct cuda_dim3_type block_params_copy1;    /* Address-exposed local */
  struct coerced_kernel_launch_params coerced_grid_launch_params1;    /* Address-exposed local */
  struct coerced_kernel_launch_params coerced_block_launch_params1;    /* Address-exposed local */
  struct cuda_dim3_type grid_params_copy2;    /* Address-exposed local */
  struct cuda_dim3_type block_params_copy2;    /* Address-exposed local */
  struct coerced_kernel_launch_params coerced_grid_launch_params2;    /* Address-exposed local */
  struct coerced_kernel_launch_params coerced_block_launch_params2;    /* Address-exposed local */
  uint32_t calculated_block_dim_x;
  int32_t calculated_grid_dim_x_kernel1;
  int32_t calculated_grid_dim_y_kernel15;
  uint8_t* unused_cuda_arg_ptr1;
  uint8_t* unused_cuda_arg_ptr2;
  uint8_t* unused_cuda_arg_ptr3;
  uint8_t* unused_cuda_arg_ptr4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t calculated_grid_dim_x_kernel2;
  int32_t calculated_grid_dim_y_kernel2;
  uint8_t* unused_cuda_arg_ptr5;
  uint8_t* unused_cuda_arg_ptr6;
  uint8_t* unused_cuda_arg_ptr7;
  uint8_t* unused_cuda_arg_ptr8;

  calculated_block_dim_x = 8;
  block.cuda_dim3_type = 8;
  block.cuda_dim3_type = 32;
  block.cuda_dim3_type = 1;
  calculated_grid_dim_x_kernel1 = num_blocks(ni, block.x);
  calculated_grid_dim_y_kernel1 = num_blocks(nj, block.y);
  grid.x = calculated_grid_dim_x_kernel1;
  grid.y = calculated_grid_dim_y_kernel1;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_params_copy1)), ((uint8_t*)(&grid)), sizeof(struct cuda_dim3_type));
  memcpy(((uint8_t*)(&block_params_copy1)), ((uint8_t*)(&block)), sizeof(struct cuda_dim3_type));
  memcpy(((uint8_t*)(&coerced_grid_launch_params1)), ((uint8_t*)(&grid_params_copy1)), sizeof(struct cuda_dim3_type));
  memcpy(((uint8_t*)(&coerced_block_launch_params1)), ((uint8_t*)(&block_params_copy1)), sizeof(struct cuda_dim3_type));
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < calculated_grid_dim_x_kernel1;   i = i + 1){
for(int32_t j = 0; j < calculated_grid_dim_y_kernel1;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_A_mul_B(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, calculated_grid_dim_x_kernel1, calculated_grid_dim_y_kernel1, 1, calculated_block_dim_x, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  calculated_grid_dim_x_kernel2 = num_blocks(ni, block.x);
  calculated_grid_dim_y_kernel2 = num_blocks(nl, block.y);
  grid.x = calculated_grid_dim_x_kernel2;
  grid.y = calculated_grid_dim_y_kernel2;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_params_copy2)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_params_copy2)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&coerced_grid_launch_params2)), ((uint8_t*)(&grid_params_copy2)), 12);
  memcpy(((uint8_t*)(&coerced_block_launch_params2)), ((uint8_t*)(&block_params_copy2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < calculated_grid_dim_x_kernel2;   i = i + 1){
for(int32_t j = 0; j < calculated_grid_dim_y_kernel2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
kernel_D_plus_tmp_mul_C(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, calculated_grid_dim_x_kernel2, calculated_grid_dim_y_kernel2, 1, calculated_block_dim_x, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}


//Prints matrix D (ni x nl) to stderr, formatted with newlines.
void print_array(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;
  int32_t fprintf_return_val_final_newline;
  const int output_items_per_line = 20;

for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  uint32_t fprintf_return_val_element = fprintf(stderr, ("%0.2lf "), D[(i * ni + j)]);
  if ((int)(i * ni + j) % output_items_per_line == 0) {
  fprintf(stderr, ("\n"));
  }
}
}
  fprintf(stderr, ("\n"));
}


//Kernel: tmp = alpha*A*B. Each thread computes one tmp[i][j] if in bounds.
void kernel_A_mul_B(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

  i = blockDim_x * blockIdx_x + threadIdx_x;
  j = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) {
  if (j < nj) {
  dot = 0;
for(int64_t k = 0; k < nk;   k = k + 1){
  dot = (dot + ((alpha * A[(i * nk + k)]) * B[(k * nj + j)]));
}
  tmp[(i * nj + j)] = dot;
  }
  }
  return;
}


//Kernel: D_out = beta*D_in + tmp*C. Each thread computes one D_out[i][l] if in bounds.
void kernel_D_plus_tmp_mul_C(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;

  i = blockDim_x * blockIdx_x + threadIdx_x;
  l = blockDim_y * blockIdx_y + threadIdx_y;
  if (i < ni) {
  if (l < nl) {
  dot = (D[(i * nj + l)] * beta);
for(int64_t j = 0; j < nj;   j = j + 1){
  dot = (dot + (tmp[(i * nj + j)] * C[(j * nl + l)]));
}
  D[(i * nl + l)] = dot;
  }
  }
  return;
}

