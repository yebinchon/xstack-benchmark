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
struct custom_IO_FILE_type;
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
struct custom_IO_FILE_type {
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
  struct custom_IO_FILE_type* _chain;
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
  struct custom_IO_FILE_type* _freeres_list;
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
void _Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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

//__FIXME__FUNCTION_ORDER_ID__0
//INSERT COMMENT FUNCTION: num_blocks
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

//INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  ni_val_arg = atoi(argv[2]);
  nj_val_arg = atoi(argv[3]);
  nk_val_arg = atoi(argv[4]);
  nl_val_arg = atoi(argv[5]);
  A = malloc(ni_val_arg * nk_val_arg * 8);
  B = malloc(nk_val_arg * nj_val_arg * 8);
  C = malloc(nl_val_arg * nj_val_arg * 8);
  D = malloc(ni_val_arg * nl_val_arg * 8);
  tmp = malloc(ni_val_arg * nj_val_arg * 8);
  init_array(ni_val_arg, nj_val_arg, nk_val_arg, nl_val_arg, ((double*)A), ((double*)B), ((double*)C), ((double*)D), ((double*)tmp));
;
  kernel(ni_val_arg, nj_val_arg, nk_val_arg, nl_val_arg, 32412, 2123, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
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


//__FIXME__FUNCTION_ORDER_ID__1
//INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* A, double* B, double* C, double* D, double* tmp) {
  int64_t i;
  int64_t j;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  A[(i * ni + j)] = (((double)(i) * (double)(j)) / (double)(ni));
}
}
//INSERT COMMENT LOOP: for.cond10
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  B[(i * nk + j)] = (((double)(i) * (double)(j)) / (double)(nj));
}
}
//INSERT COMMENT LOOP: for.cond32
for(int64_t i = 0; i < nl;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  C[(i * nl + j)] = (((double)(i) * (double)((j + 3))) / (double)(nl));
}
}
//INSERT COMMENT LOOP: for.cond54
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  D[(i * ni + j)] = (((double)(i) * (double)((j + 2))) / (double)(nk));
}
}
//INSERT COMMENT LOOP: for.cond76
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  tmp[(i * ni + j)] = 0;
}
}
  return;
}


//__FIXME__FUNCTION_ORDER_ID__2
//INSERT COMMENT FUNCTION: kernel
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
  int32_t calculated_grid_dim_y_kernel1;
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

  calculated_block_dim_x = (256 / 32);
  block.x = calculated_block_dim_x;
  block.y = 32;
  block.z = 1;
  calculated_grid_dim_x_kernel1 = num_blocks(ni, block.x);
  calculated_grid_dim_y_kernel1 = num_blocks(nj, block.y);
  grid.x = calculated_grid_dim_x_kernel1;
  grid.y = calculated_grid_dim_y_kernel1;
  grid.z = 1;
  memcpy(((uint8_t*)(&grid_params_copy1)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&block_params_copy1)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&coerced_grid_launch_params1)), ((uint8_t*)(&grid_params_copy1)), 12);
  memcpy(((uint8_t*)(&coerced_block_launch_params1)), ((uint8_t*)(&block_params_copy1)), 12);
//INSERT COMMENT LOOP: header.0
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < calculated_grid_dim_x_kernel1;   i = i + 1){
for(int32_t j = 0; j < calculated_grid_dim_y_kernel1;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
_Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, calculated_grid_dim_x_kernel1, calculated_grid_dim_y_kernel1, 1, calculated_block_dim_x, 32, 1, i, j, 0, k, l, 0);
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
//INSERT COMMENT LOOP: header.07
#pragma omp parallel for collapse(2)
for(int32_t i = 0; i < calculated_grid_dim_x_kernel2;   i = i + 1){
for(int32_t j = 0; j < calculated_grid_dim_y_kernel2;   j = j + 1){
for(int32_t k = 0; k < 8;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
_Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D, calculated_grid_dim_x_kernel2, calculated_grid_dim_y_kernel2, 1, calculated_block_dim_x, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  return;
}


//__FIXME__FUNCTION_ORDER_ID__3
//INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;
  int32_t fprintf_return_val_final_newline;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  uint32_t calculated_grid_dim_x_kernel1 = fprintf(stderr, (FORMAT_STRING_DOUBLE_PERCENT_LF), D[(i * ni + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, (NEWLINE_CHAR_STRING));
  }
}
}
  fprintf(stderr, (NEWLINE_CHAR_STRING));
}


//__FIXME__FUNCTION_ORDER_ID__4
//INSERT COMMENT FUNCTION: kernel_A_mul_B
void _Z14kernel_A_mul_BiiiiddPdS_S_S_S__OC_1(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t j;
  int64_t k;
  double dot;

//INSERT COMMENT IFELSE: entry
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


//__FIXME__FUNCTION_ORDER_ID__5
//INSERT COMMENT FUNCTION: kernel_D_plus_tmp_mul_C
void _Z23kernel_D_plus_tmp_mul_CiiiiddPdS_S_S_S__OC_2(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D, uint32_t gridDim_x, uint32_t gridDim_y, uint32_t gridDim_z, uint32_t blockDim_x, uint32_t blockDim_y, uint32_t blockDim_z, uint32_t blockIdx_x, uint32_t blockIdx_y, uint32_t blockIdx_z, uint32_t threadIdx_x, uint32_t threadIdx_y, uint32_t threadIdx_z) {
  int32_t i;
  int32_t l;
  double dot;
  int64_t j;

//INSERT COMMENT IFELSE: entry
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

