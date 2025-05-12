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
struct l_struct_struct_OC__IO_FILE;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
void init_array(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_atax(uint32_t, uint32_t, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel0(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel1(uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void kernel_atax_OC_cudakernel0(uint64_t, uint64_t, uint64_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void kernel_atax_OC_cudakernel1(uint64_t, double*, uint32_t, uint64_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void kernel_atax_OC_cudakernel2(uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t nx;
  int32_t ny;
  int32_t dump_code;
  uint8_t* A;
  uint8_t* x;
  uint8_t* y;
  uint8_t* tmp;

  nx = atoi(argv[2]);
  ny = atoi(argv[3]);
  dump_code = atoi(argv[1]);
  A = malloc(nx * ny * 8);
  x = malloc(ny * 8);
  y = malloc(nx * 8);
  tmp = malloc(ny * 8);
  init_array(nx, ny, ((double*)A), ((double*)x));
;
  kernel_atax(nx, ny, ((double*)A), ((double*)x), ((double*)y), ((double*)tmp));
;
  if (dump_code == 1) {
print_array(nx, ((double*)y));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)tmp)));
  return 0;
}


void init_array(uint32_t nx, uint32_t ny, double* A, double* x) {
init_array_OC_cudakernel1<<<grid, block>>>(ny, x);
init_array_OC_cudakernel0<<<grid, block>>>(nx, ny, nx, ny, A);
  return;
}


void kernel_atax(uint32_t nx, uint32_t ny, double* A, double* x, double* y, double* tmp) {
kernel_atax_OC_cudakernel2<<<grid, block>>>(nx, y);
kernel_atax_OC_cudakernel1<<<grid, block>>>(ny, tmp, ny, ny, A, x);
kernel_atax_OC_cudakernel0<<<grid, block>>>(nx, ny, ny, A, tmp, y);
  return;
}


void print_array(uint32_t nx, double* y) {
  int64_t i;
  int32_t call3;


for(int64_t i = 0; i < nx;   i = i + 1){
  uint32_t call = fprintf(stderr, _OC_str, y[i]);
  if (i % 20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
  fprintf(stderr, _OC_str_OC_1);
}


__global__ void init_array_OC_cudakernel0(uint64_t _1, uint64_t _2, uint32_t nx, uint64_t _3, double* A) {
  int64_t indvars_2e_iv1;
  int64_t i;
  uint64_t indvars_2e_iv_2e_next2;

  indvars_2e_iv1 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (indvars_2e_iv1 < _1) {

for(int64_t i = 0; i < _2;   i = i + 1){
  (A+indvars_2e_iv1 * _3)[i] = (((double)(indvars_2e_iv1) * (double)((i + 1))) / (double)(nx));
}
  indvars_2e_iv1 + 1;
  }
  return;
}


__global__ void init_array_OC_cudakernel1(uint64_t _4, double* x) {
  int64_t indvars_2e_iv3;
  uint64_t indvars_2e_iv_2e_next4;

  indvars_2e_iv3 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (indvars_2e_iv3 < _4) {
  x[indvars_2e_iv3] = ((double)(indvars_2e_iv3) * 3.1415926535897931);
  indvars_2e_iv3 + 1;
  }
  return;
}


__global__ void kernel_atax_OC_cudakernel0(uint64_t _5, uint64_t _6, uint64_t _7, double* A, double* tmp, double* y) {
  int64_t indvars_2e_iv1;
  int64_t i;
  uint64_t indvars_2e_iv_2e_next2;

  indvars_2e_iv1 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (indvars_2e_iv1 < _5) {

for(int64_t i = 0; i < _6;   i = i + 1){
  y[indvars_2e_iv1] = (y[indvars_2e_iv1] + ((A+i * _7)[indvars_2e_iv1] * tmp[i]));
}
  indvars_2e_iv1 + 1;
  }
  return;
}


__global__ void kernel_atax_OC_cudakernel1(uint64_t _8, double* tmp, uint32_t ny, uint64_t _9, double* A, double* x) {
  int64_t indvars_2e_iv5;
  int64_t i;
  uint64_t indvars_2e_iv_2e_next6;

  indvars_2e_iv5 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (indvars_2e_iv5 < _8) {
  tmp[indvars_2e_iv5] = 0;

for(int64_t i = 0; i < ny;   i = i + 1){
  tmp[indvars_2e_iv5] = (tmp[indvars_2e_iv5] + ((A+indvars_2e_iv5 * _9)[i] * x[i]));
}
  indvars_2e_iv5 + 1;
  }
  return;
}


__global__ void kernel_atax_OC_cudakernel2(uint64_t _10, double* y) {
  int64_t indvars_2e_iv7;
  uint64_t indvars_2e_iv_2e_next8;

  indvars_2e_iv7 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (indvars_2e_iv7 < _10) {
  y[indvars_2e_iv7] = 0;
  indvars_2e_iv7 + 1;
  }
  return;
}

