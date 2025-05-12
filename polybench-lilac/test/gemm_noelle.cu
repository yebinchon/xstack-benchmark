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

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
void init_array(uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel0(uint64_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel1(uint64_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel2(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t ni;
  int32_t nj;
  int32_t nk;
  uint8_t* alpha;
  uint8_t* beta;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  alpha = malloc(8);
  beta = malloc(8);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(ni * nj * 8);
init_array(ni, nj, nk, ((double*)alpha), ((double*)beta), ((double*)C), ((double*)A), ((double*)B));
print_array(ni, nj, ((double*)C));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


void init_array(uint32_t ni, uint32_t nj, uint32_t nk, double* alpha, double* beta, double* C, double* A, double* B) {
  uint64_t __FIXME__size_C;    /* Address-exposed local */
  uint64_t __FIXME__size_A;    /* Address-exposed local */
  uint64_t __FIXME__size_B;    /* Address-exposed local */
  int32_t i;
  int64_t j;
unsigned threadsPerBlock = 256;
dim3 block2(threadsPerBlock, 1, 1);
dim3 grid2((nk+block2.x-1)/block2.x, 1, 1);

dim3 block0(threadsPerBlock, 1, 1);
dim3 grid0((nj+block0.x-1)/block0.x, 1, 1);

dim3 block1(threadsPerBlock, 1, 1);
dim3 grid1((ni+block1.x-1)/block1.x, 1, 1);


  *alpha = 32412;
  *beta = 2123;
  __FIXME__size_C = 0;
  __FIXME__size_A = 0;
  __FIXME__size_B = 0;
for(int32_t i = 0; i < ni;   i = i + 1){
#pragma omp parallel for 
for(int64_t j = 0; j < nj;   j = j + 1){
  if (__FIXME__size_C < j) {
  __FIXME__size_C = j;
  }
}
}
for(int64_t i = 0; i < ni;   i = i + 1){
for(int32_t j = 0; j < nk;   j = j + 1){
  if (__FIXME__size_A < i) {
  __FIXME__size_A = i;
  }
}
}
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__1 = i * nj + j;
  if (__FIXME__size_B < __FIXME__1) {
  __FIXME__size_B = __FIXME__1;
  }
}
}
for(int32_t i = 0; i < ni;   i = i + 1){
double* dev_A;
double* dev_B;
double* dev_C;

cudaMalloc(&dev_A, size_A*sizeof(double));
cudaMalloc(&dev_B, size_B*sizeof(double));
cudaMalloc(&dev_C, size_C*sizeof(double));

cudaMemcpy(dev_A, A, size_A*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(dev_B, B, size_B*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(dev_C, C, size_C*sizeof(double), cudaMemcpyHostToDevice);

init_array_OC_cudakernel0<<<grid0, block0>>>(nj, i, ni, C);
}
init_array_OC_cudakernel1<<<grid1, block1>>>(ni, nk, ni, A);
init_array_OC_cudakernel2<<<grid2, block2>>>(nk, nj, ni, nj, B);

cudaMemcpy(A, dev_A, size_A*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(B, dev_B, size_B*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(C, dev_C, size_C*sizeof(double), cudaMemcpyDeviceToHost);
  return;
}


void print_array(uint32_t ni, uint32_t nj, double* C) {
  int64_t i;
  int64_t j;
  int32_t __FIXME__call11;

for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint32_t __FIXME__call = fprintf(stderr, __FIXME_GLOBAL___OC_str, C[(i * nj + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, __FIXME_GLOBAL___OC_str_OC_1);
  }
}
}
  fprintf(stderr, __FIXME_GLOBAL___OC_str_OC_1);
}


__global__ void init_array_OC_cudakernel0(uint64_t __FIXME__2, uint32_t __FIXME__i_2e_0, uint32_t __FIXME__ni, double* __FIXME__C) {
  int64_t __FIXME__indvars_2e_iv7;
  uint64_t __FIXME__indvars_2e_iv_2e_next8;

  __FIXME__indvars_2e_iv7 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv7 < __FIXME__2) {
  __FIXME__C[__FIXME__indvars_2e_iv7] = (((double)(__FIXME__i_2e_0) * (double)(__FIXME__indvars_2e_iv7)) / (double)(__FIXME__ni));
  __FIXME__indvars_2e_iv7 + 1;
  }
  return;
}


__global__ void init_array_OC_cudakernel1(uint64_t __FIXME__3, uint32_t __FIXME__nk, uint32_t __FIXME__ni, double* __FIXME__A) {
  int64_t __FIXME__indvars_2e_iv5;
  int32_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next6;

  __FIXME__indvars_2e_iv5 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv5 < __FIXME__3) {
for(int32_t i = 0; i < __FIXME__nk;   i = i + 1){
  __FIXME__A[__FIXME__indvars_2e_iv5] = (((double)(__FIXME__indvars_2e_iv5) * (double)(i)) / (double)(__FIXME__ni));
}
  __FIXME__indvars_2e_iv5 + 1;
  }
  return;
}


__global__ void init_array_OC_cudakernel2(uint64_t __FIXME__4, uint64_t __FIXME__5, uint32_t __FIXME__ni, uint64_t __FIXME__6, double* __FIXME__B) {
  int64_t __FIXME__indvars_2e_iv2;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next3;

  __FIXME__indvars_2e_iv2 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv2 < __FIXME__4) {
for(int64_t i = 0; i < __FIXME__5;   i = i + 1){
  __FIXME__B[(__FIXME__indvars_2e_iv2 * __FIXME__6 + i)] = (((double)(__FIXME__indvars_2e_iv2) * (double)(i)) / (double)(__FIXME__ni));
}
  __FIXME__indvars_2e_iv2 + 1;
  }
  return;
}

