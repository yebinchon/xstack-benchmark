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
struct __FIXME__l_struct_struct_OC__IO_FILE;
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct __FIXME__l_array_1_uint8_t {
  uint8_t array[1];
};
struct __FIXME__l_array_20_uint8_t {
  uint8_t array[20];
};
struct __FIXME__l_struct_struct_OC__IO_FILE {
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field0;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field1;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field2;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field3;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field4;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field5;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field6;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field7;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field8;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field9;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field10;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field11;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field12;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field13;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field14;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field15;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field16;
  uint16_t __FIXME__l_struct_struct_OC__IO_FILE_field17;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field18;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field19[1];
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field20;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field21;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field22;
  void* __FIXME__l_struct_struct_OC__IO_FILE_field23;
  struct __FIXME__l_struct_struct_OC__IO_FILE* __FIXME__l_struct_struct_OC__IO_FILE_field24;
  uint8_t* __FIXME__l_struct_struct_OC__IO_FILE_field25;
  uint64_t __FIXME__l_struct_struct_OC__IO_FILE_field26;
  uint32_t __FIXME__l_struct_struct_OC__IO_FILE_field27;
  uint8_t __FIXME__l_struct_struct_OC__IO_FILE_field28[20];
};
struct __FIXME__l_struct_struct_OC_dim3 {
  uint32_t __FIXME__l_struct_struct_OC_dim3_field0;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field1;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field2;
};
struct __FIXME__l_unnamed_1 {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void init_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void kernel(uint32_t, double*) __ATTRIBUTELIST__((noinline));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t num_blocks(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z10kernel_diviPdi_OC_1(uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_AiPdi_OC_2(uint32_t, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[8] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = { "\n" };


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

int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t n;
  uint8_t* A;
  int32_t __FIXME__call12;
  int32_t __FIXME__call16;

//INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  A = malloc(n * n * 8);
  init_array(n, ((double*)A));
;
  kernel(n, ((double*)A));
;
  if (dump_code == 1) {
print_array(n, ((double*)A));
  }
free(((uint8_t*)((double*)A)));
  return 0;
}


//INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (((double)((i + 1)) * (double)(j)) / (double)(n));
}
}
  return;
}


//INSERT COMMENT FUNCTION: kernel
void kernel(uint32_t n, double* A) {
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp2;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp2_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp10;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp11;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp10_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp11_2e_coerce;    /* Address-exposed local */
  int32_t iter;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

//INSERT COMMENT LOOP: for.cond
for(int32_t iter = 0; iter < (n - 1);   iter = iter + 1){
  uint32_t __FIXME__call = num_blocks((n - iter + 1), 256);
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  __FIXME__agg_2e_tmp2.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp2.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp2.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp2_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp2)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call;   j = j + 1){
for(int32_t k = 0; k < 256;   k = k + 1){
_Z10kernel_diviPdi_OC_1(n, A, iter, __FIXME__call, 1, 1, 256, 1, 1, j, 0, 0, k, 0, 0);
}
}
  block.__FIXME__l_struct_struct_OC_dim3_field0 = 8;
  block.__FIXME__l_struct_struct_OC_dim3_field1 = 32;
  block.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  uint32_t __FIXME__call6 = num_blocks((n - iter + 1), block.__FIXME__l_struct_struct_OC_dim3_field0);
  uint32_t __FIXME__call9 = num_blocks((n - iter + 1), block.__FIXME__l_struct_struct_OC_dim3_field1);
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = __FIXME__call6;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = __FIXME__call9;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp10_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp10)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp11_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp11)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < __FIXME__call6;   j = j + 1){
for(int32_t k = 0; k < __FIXME__call9;   k = k + 1){
for(int32_t l = 0; l < 8;   l = l + 1){
for(int32_t m = 0; m < 32;   m = m + 1){
_Z8kernel_AiPdi_OC_2(n, A, iter, __FIXME__call6, __FIXME__call9, 1, 8, 32, 1, j, k, 0, l, m, 0);
}
}
}
}
}
  return;
}


//INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t n, double* A) {
  int64_t i;
  uint64_t j;
  int32_t __FIXME__call11;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < n;   i = i + 1){
for(int64_t j = 0; j < n;   j = j + 1){
  uint32_t __FIXME__call = fprintf(stderr, (__FIXME_GLOBAL___OC_str), A[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
  }
}
}
  fprintf(stderr, (__FIXME_GLOBAL___OC_str_OC_1));
}


//INSERT COMMENT FUNCTION: num_blocks
uint32_t num_blocks(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


//INSERT COMMENT FUNCTION: kernel_div
void _Z10kernel_diviPdi_OC_1(uint32_t n, double* A, uint32_t __FIXME__k, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;

//INSERT COMMENT IFELSE: entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + __FIXME__k + 1;
  if (i < n) {
  A[(i * n + __FIXME__k)] = (A[(i * n + __FIXME__k)] / A[(__FIXME__k * n + __FIXME__k)]);
  }
  return;
}


//INSERT COMMENT FUNCTION: kernel_A
void _Z8kernel_AiPdi_OC_2(uint32_t n, double* A, uint32_t __FIXME__k, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int32_t i;
  int32_t j;

//INSERT COMMENT IFELSE: entry
  i = __FIXME__blockDim_2e_x * __FIXME__blockIdx_2e_x + __FIXME__threadIdx_2e_x + __FIXME__k + 1;
  j = __FIXME__blockDim_2e_y * __FIXME__blockIdx_2e_y + __FIXME__threadIdx_2e_y + __FIXME__k + 1;
  if (i < n) {
  if (j < n) {
  A[(i * n + j)] = (A[(i * n + j)] - (A[(i * n + __FIXME__k)] * A[(__FIXME__k * n + j)]));
  }
  }
  return;
}

