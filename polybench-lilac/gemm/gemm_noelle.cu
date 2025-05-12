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
void kernel_gemm(uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel0(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel1(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel2(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void kernel_gemm_OC_cudakernel0(uint64_t, uint64_t, uint64_t, double*, double) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void kernel_gemm_OC_cudakernel1(uint64_t, uint64_t, uint64_t, uint64_t, double*, double, uint64_t, double*, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t __FIXME_GLOBAL___OC_str[8] = { "%0.2lf " };
uint8_t __FIXME_GLOBAL___OC_str_OC_1[2] = { "\n" };


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  int32_t nk;
  uint8_t* alpha;
  uint8_t* beta;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;

  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  alpha = malloc(8);
  beta = malloc(8);
  A = malloc(ni * nk * 8);
  B = malloc(nk * nj * 8);
  C = malloc(ni * nj * 8);
  init_array(ni, nj, nk, ((double*)alpha), ((double*)beta), ((double*)C), ((double*)A), ((double*)B));
;
  kernel_gemm(ni, nj, nk, *((double*)alpha), *((double*)beta), ((double*)C), ((double*)A), ((double*)B));
;
  if (dump_code == 1) {
print_array(ni, nj, ((double*)C));
  }
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
  return 0;
}


void init_array(uint32_t ni, uint32_t nj, uint32_t nk, double* alpha, double* beta, double* C, double* A, double* B) {
  uint64_t __FIXME__size_C;    /* Address-exposed local */
  uint64_t __FIXME__size_A;    /* Address-exposed local */
  uint64_t __FIXME__size_B;    /* Address-exposed local */
  int64_t i;
  int64_t j;
unsigned threadsPerBlock = 256;
dim3 block0(threadsPerBlock, 1, 1);
dim3 grid0((ni+block0.x-1)/block0.x, 1, 1);

dim3 block2(threadsPerBlock, 1, 1);
dim3 grid2((nk+block2.x-1)/block2.x, 1, 1);

dim3 block1(threadsPerBlock, 1, 1);
dim3 grid1((ni+block1.x-1)/block1.x, 1, 1);


  *alpha = 32412;
  *beta = 2123;
  __FIXME__size_C = 0;
  __FIXME__size_A = 0;
  __FIXME__size_B = 0;
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__1 = i * nj + j;
  if (__FIXME__size_C < __FIXME__1) {
  __FIXME__size_C = __FIXME__1;
  }
}
}
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  uint64_t __FIXME__2 = i * nk + j;
  if (__FIXME__size_A < __FIXME__2) {
  __FIXME__size_A = __FIXME__2;
  }
}
}
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__3 = i * nj + j;
  if (__FIXME__size_B < __FIXME__3) {
  __FIXME__size_B = __FIXME__3;
  }
}
}
double* dev_A;
double* dev_B;
double* dev_C;

cudaMalloc(&dev_A, size_A*sizeof(double));
cudaMalloc(&dev_B, size_B*sizeof(double));
cudaMalloc(&dev_C, size_C*sizeof(double));

cudaMemcpy(dev_A, A, size_A*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(dev_B, B, size_B*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(dev_C, C, size_C*sizeof(double), cudaMemcpyHostToDevice);

init_array_OC_cudakernel0<<<grid0, block0>>>(ni, nj, ni, nj, C);
init_array_OC_cudakernel1<<<grid1, block1>>>(ni, nk, ni, nk, A);
init_array_OC_cudakernel2<<<grid2, block2>>>(nk, nj, ni, nj, B);

cudaMemcpy(A, dev_A, size_A*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(B, dev_B, size_B*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(C, dev_C, size_C*sizeof(double), cudaMemcpyDeviceToHost);
  return;
}


void kernel_gemm(uint32_t ni, uint32_t nj, uint32_t nk, double alpha, double beta, double* C, double* A, double* B) {
  uint64_t __FIXME__size_C;    /* Address-exposed local */
  uint64_t __FIXME__size_A;    /* Address-exposed local */
  uint64_t __FIXME__size_B;    /* Address-exposed local */
  int64_t i;
  int64_t j;
  int64_t k;
unsigned threadsPerBlock = 256;
dim3 block0(threadsPerBlock, 1, 1);
dim3 grid0((ni+block0.x-1)/block0.x, 1, 1);

dim3 block1(threadsPerBlock, 1, 1);
dim3 grid1((ni+block1.x-1)/block1.x, 1, 1);


  __FIXME__size_C = 0;
  __FIXME__size_A = 0;
  __FIXME__size_B = 0;
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__4 = i * nj + j;
  if (__FIXME__size_C < __FIXME__4) {
  __FIXME__size_C = __FIXME__4;
  }
}
}
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
for(int64_t k = 0; k < nk;   k = k + 1){
  uint64_t __FIXME__5 = i * nk + k;
  if (__FIXME__size_A < __FIXME__5) {
  __FIXME__size_A = __FIXME__5;
  }
  uint64_t __FIXME__6 = k * nj + j;
  if (__FIXME__size_B < __FIXME__6) {
  __FIXME__size_B = __FIXME__6;
  }
  uint64_t __FIXME__7 = i * nj + j;
  if (__FIXME__size_C < __FIXME__7) {
  __FIXME__size_C = __FIXME__7;
  }
}
}
}
double* dev_A;
double* dev_B;
double* dev_C;

cudaMalloc(&dev_A, size_A*sizeof(double));
cudaMalloc(&dev_B, size_B*sizeof(double));
cudaMalloc(&dev_C, size_C*sizeof(double));

cudaMemcpy(dev_A, A, size_A*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(dev_B, B, size_B*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(dev_C, C, size_C*sizeof(double), cudaMemcpyHostToDevice);

kernel_gemm_OC_cudakernel0<<<grid0, block0>>>(ni, nj, nj, C, beta);
kernel_gemm_OC_cudakernel1<<<grid1, block1>>>(ni, nj, nk, nk, A, alpha, nj, B, nj, C);

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


__global__ void init_array_OC_cudakernel0(uint64_t __FIXME__8, uint64_t __FIXME__9, uint32_t __FIXME__ni, uint64_t __FIXME__10, double* __FIXME__C) {
  int64_t __FIXME__indvars_2e_iv14;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next15;

  __FIXME__indvars_2e_iv14 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv14 < __FIXME__8) {
for(int64_t i = 0; i < __FIXME__9;   i = i + 1){
  __FIXME__C[(__FIXME__indvars_2e_iv14 * __FIXME__10 + i)] = (((double)(__FIXME__indvars_2e_iv14) * (double)(i)) / (double)(__FIXME__ni));
}
  __FIXME__indvars_2e_iv14 + 1;
  }
  return;
}


__global__ void init_array_OC_cudakernel1(uint64_t __FIXME__11, uint64_t __FIXME__12, uint32_t __FIXME__ni, uint64_t __FIXME__13, double* __FIXME__A) {
  int64_t __FIXME__indvars_2e_iv8;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next9;

  __FIXME__indvars_2e_iv8 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv8 < __FIXME__11) {
for(int64_t i = 0; i < __FIXME__12;   i = i + 1){
  __FIXME__A[(__FIXME__indvars_2e_iv8 * __FIXME__13 + i)] = (((double)(__FIXME__indvars_2e_iv8) * (double)(i)) / (double)(__FIXME__ni));
}
  __FIXME__indvars_2e_iv8 + 1;
  }
  return;
}


__global__ void init_array_OC_cudakernel2(uint64_t __FIXME__14, uint64_t __FIXME__15, uint32_t __FIXME__ni, uint64_t __FIXME__16, double* __FIXME__B) {
  int64_t __FIXME__indvars_2e_iv2;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next3;

  __FIXME__indvars_2e_iv2 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv2 < __FIXME__14) {
for(int64_t i = 0; i < __FIXME__15;   i = i + 1){
  __FIXME__B[(__FIXME__indvars_2e_iv2 * __FIXME__16 + i)] = (((double)(__FIXME__indvars_2e_iv2) * (double)(i)) / (double)(__FIXME__ni));
}
  __FIXME__indvars_2e_iv2 + 1;
  }
  return;
}


__global__ void kernel_gemm_OC_cudakernel0(uint64_t __FIXME__17, uint64_t __FIXME__18, uint64_t __FIXME__19, double* __FIXME__C, double __FIXME__beta) {
  int64_t __FIXME__indvars_2e_iv14;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next15;

  __FIXME__indvars_2e_iv14 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv14 < __FIXME__17) {
for(int64_t i = 0; i < __FIXME__18;   i = i + 1){
  __FIXME__C[(__FIXME__indvars_2e_iv14 * __FIXME__19 + i)] = (__FIXME__C[(__FIXME__indvars_2e_iv14 * __FIXME__19 + i)] * __FIXME__beta);
}
  __FIXME__indvars_2e_iv14 + 1;
  }
  return;
}


__global__ void kernel_gemm_OC_cudakernel1(uint64_t __FIXME__20, uint64_t __FIXME__21, uint64_t __FIXME__22, uint64_t __FIXME__23, double* __FIXME__A, double __FIXME__alpha, uint64_t __FIXME__24, double* __FIXME__B, uint64_t __FIXME__25, double* __FIXME__C) {
  int64_t __FIXME__indvars_2e_iv7;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next8;
  int64_t j;

  __FIXME__indvars_2e_iv7 = blockDim.x * blockIdx.x + threadIdx.x + 0;
  if (__FIXME__indvars_2e_iv7 < __FIXME__20) {
for(int64_t i = 0; i < __FIXME__21;   i = i + 1){
for(int64_t j = 0; j < __FIXME__22;   j = j + 1){
  __FIXME__C[(__FIXME__indvars_2e_iv7 * __FIXME__25 + i)] = (__FIXME__C[(__FIXME__indvars_2e_iv7 * __FIXME__25 + i)] + ((__FIXME__alpha * __FIXME__A[(__FIXME__indvars_2e_iv7 * __FIXME__23 + j)]) * __FIXME__B[(j * __FIXME__24 + i)]));
}
}
  __FIXME__indvars_2e_iv7 + 1;
  }
  return;
}

