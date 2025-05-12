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
void init_array(uint32_t, uint32_t, uint32_t, uint32_t, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void kernel_2mm(uint32_t, uint32_t, uint32_t, uint32_t, double, double, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void print_array(uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel0(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel1(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel2(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void init_array_OC_cudakernel3(uint64_t, uint64_t, uint32_t, uint64_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
__global__ void kernel_2mm_OC_cudakernel0(uint64_t, uint64_t, uint64_t, double*, uint64_t, uint64_t, double*, double, uint64_t, double*, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));


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
  double alpha;    /* Address-exposed local */
  double beta;    /* Address-exposed local */
  int32_t dump_code;
  int32_t ni;
  int32_t nj;
  int32_t nk;
  int32_t nl;
  uint8_t* tmp;
  uint8_t* A;
  uint8_t* B;
  uint8_t* C;
  uint8_t* D;

//INSERT COMMENT IFELSE: entry
  dump_code = atoi(argv[1]);
  ni = atoi(argv[2]);
  nj = atoi(argv[3]);
  nk = atoi(argv[4]);
  nl = atoi(argv[5]);
  tmp = (uint8_t*)malloc(ni * nj * 8);
  A = (uint8_t*)malloc(ni * nk * 8);
  B = (uint8_t*)malloc(nk * nj * 8);
  C = (uint8_t*)malloc(nl * nj * 8);
  D = (uint8_t*)malloc(ni * nl * 8);
  init_array(ni, nj, nk, nl, (&alpha), (&beta), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  kernel_2mm(ni, nj, nk, nl, alpha, beta, ((double*)tmp), ((double*)A), ((double*)B), ((double*)C), ((double*)D));
;
  if (dump_code == 1) {
print_array(ni, nl, ((double*)D));
  }
free(((uint8_t*)((double*)tmp)));
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)B)));
free(((uint8_t*)((double*)C)));
free(((uint8_t*)((double*)D)));
  return 0;
}


//INSERT COMMENT FUNCTION: init_array
void init_array(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double* alpha, double* beta, double* A, double* B, double* C, double* D) {
  uint64_t __FIXME__size_A;    /* Address-exposed local */
  uint64_t __FIXME__size_B;    /* Address-exposed local */
  uint64_t __FIXME__size_C;    /* Address-exposed local */
  uint64_t __FIXME__size_D;    /* Address-exposed local */
  int64_t i;
  int64_t j;
unsigned threadsPerBlock = 256;
dim3 block0(threadsPerBlock, 1, 1);
dim3 grid0((ni+block0.x-1)/block0.x, 1, 1);

dim3 block3(threadsPerBlock, 1, 1);
dim3 grid3((ni+block3.x-1)/block3.x, 1, 1);

dim3 block2(threadsPerBlock, 1, 1);
dim3 grid2((nl+block2.x-1)/block2.x, 1, 1);

dim3 block1(threadsPerBlock, 1, 1);
dim3 grid1((nk+block1.x-1)/block1.x, 1, 1);


  *alpha = 32412;
  *beta = 2123;
  __FIXME__size_A = 0;
  __FIXME__size_B = 0;
  __FIXME__size_C = 0;
  __FIXME__size_D = 0;
//INSERT COMMENT LOOP: for.cond.bound
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nk;   j = j + 1){
  uint64_t __FIXME__1 = i * nk + j;
  if (__FIXME__size_A < __FIXME__1) {
  __FIXME__size_A = __FIXME__1;
  }
}
}
//INSERT COMMENT LOOP: for.cond10.bound
for(int64_t i = 0; i < nk;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__2 = i * nj + j;
  if (__FIXME__size_B < __FIXME__2) {
  __FIXME__size_B = __FIXME__2;
  }
}
}
//INSERT COMMENT LOOP: for.cond34.bound
for(int64_t i = 0; i < nl;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__3 = i * nj + j;
  if (__FIXME__size_C < __FIXME__3) {
  __FIXME__size_C = __FIXME__3;
  }
}
}
//INSERT COMMENT LOOP: for.cond58.bound
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  uint64_t __FIXME__4 = i * nl + j;
  if (__FIXME__size_D < __FIXME__4) {
  __FIXME__size_D = __FIXME__4;
  }
}
}
double* __FIXME__dev_A;
double* __FIXME__dev_B;
double* __FIXME__dev_C;
double* __FIXME__dev_D;

cudaMalloc(&__FIXME__dev_A, __FIXME__size_A*sizeof(double));
cudaMalloc(&__FIXME__dev_B, __FIXME__size_B*sizeof(double));
cudaMalloc(&__FIXME__dev_C, __FIXME__size_C*sizeof(double));
cudaMalloc(&__FIXME__dev_D, __FIXME__size_D*sizeof(double));

cudaMemcpy(__FIXME__dev_A, A, __FIXME__size_A*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(__FIXME__dev_B, B, __FIXME__size_B*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(__FIXME__dev_C, C, __FIXME__size_C*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(__FIXME__dev_D, D, __FIXME__size_D*sizeof(double), cudaMemcpyHostToDevice);

init_array_OC_cudakernel0<<<grid0, block0>>>(ni, nk, ni, nk, A);
init_array_OC_cudakernel1<<<grid1, block1>>>(nk, nj, nj, nj, B);
init_array_OC_cudakernel2<<<grid2, block2>>>(nl, nj, nl, nj, C);
init_array_OC_cudakernel3<<<grid3, block3>>>(ni, nl, nk, nl, D);

cudaMemcpy(A, __FIXME__dev_A, __FIXME__size_A*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(B, __FIXME__dev_B, __FIXME__size_B*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(C, __FIXME__dev_C, __FIXME__size_C*sizeof(double), cudaMemcpyDeviceToHost);
cudaMemcpy(D, __FIXME__dev_D, __FIXME__size_D*sizeof(double), cudaMemcpyDeviceToHost);
  return;
}


//INSERT COMMENT FUNCTION: kernel_2mm
void kernel_2mm(uint32_t ni, uint32_t nj, uint32_t nk, uint32_t nl, double alpha, double beta, double* tmp, double* A, double* B, double* C, double* D) {
  uint64_t __FIXME__size_tmp;    /* Address-exposed local */
  uint64_t __FIXME__size_A;    /* Address-exposed local */
  uint64_t __FIXME__size_B;    /* Address-exposed local */
  int64_t i;
  int64_t j;
  int64_t k;
unsigned threadsPerBlock = 256;
dim3 block0(threadsPerBlock, 1, 1);
dim3 grid0((ni+block0.x-1)/block0.x, 1, 1);


  __FIXME__size_tmp = 0;
  __FIXME__size_A = 0;
  __FIXME__size_B = 0;
//INSERT COMMENT LOOP: for.cond.bound
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nj;   j = j + 1){
  uint64_t __FIXME__5 = i * nj + j;
  if (__FIXME__size_tmp < __FIXME__5) {
  __FIXME__size_tmp = __FIXME__5;
  }
for(int64_t k = 0; k < nk;   k = k + 1){
  uint64_t __FIXME__6 = i * nk + k;
  if (__FIXME__size_A < __FIXME__6) {
  __FIXME__size_A = __FIXME__6;
  }
  uint64_t __FIXME__7 = k * nj + j;
  if (__FIXME__size_B < __FIXME__7) {
  __FIXME__size_B = __FIXME__7;
  }
  uint64_t __FIXME__8 = i * nj + j;
  if (__FIXME__size_tmp < __FIXME__8) {
  __FIXME__size_tmp = __FIXME__8;
  }
}
}
}
double* __FIXME__dev_A;
double* __FIXME__dev_B;
double* __FIXME__dev_tmp;

cudaMalloc(&__FIXME__dev_A, __FIXME__size_A*sizeof(double));
cudaMalloc(&__FIXME__dev_B, __FIXME__size_B*sizeof(double));
cudaMalloc(&__FIXME__dev_tmp, __FIXME__size_tmp*sizeof(double));

cudaMemcpy(__FIXME__dev_A, A, __FIXME__size_A*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(__FIXME__dev_B, B, __FIXME__size_B*sizeof(double), cudaMemcpyHostToDevice);
cudaMemcpy(__FIXME__dev_tmp, tmp, __FIXME__size_tmp*sizeof(double), cudaMemcpyHostToDevice);

kernel_2mm_OC_cudakernel0<<<grid0, block0>>>(ni, nj, nj, tmp, nk, nk, A, alpha, nj, B, nj);

cudaMemcpy(tmp, __FIXME__dev_tmp, __FIXME__size_tmp*sizeof(double), cudaMemcpyDeviceToHost);
////INSERT COMMENT LOOP: for.cond28
//for(int64_t i = 0; i < ni;   i = i + 1){
//for(int64_t j = 0; j < nl;   j = j + 1){
//  D[(i * nj + j)] = (D[(i * nj + j)] * beta);
//for(int64_t k = 0; k < nj;   k = k + 1){
//  D[(i * nl + j)] = (D[(i * nl + j)] + (tmp[(i * nj + k)] * C[(k * nl + j)]));
//}
//}
//}
  return;
}


//INSERT COMMENT FUNCTION: print_array
void print_array(uint32_t ni, uint32_t nl, double* D) {
  int64_t i;
  int64_t j;
  int32_t __FIXME__call11;

//INSERT COMMENT LOOP: for.cond
for(int64_t i = 0; i < ni;   i = i + 1){
for(int64_t j = 0; j < nl;   j = j + 1){
  uint32_t __FIXME__call = fprintf(stderr, (char*)__FIXME_GLOBAL___OC_str, D[(i * nl + j)]);
  if ((int)(i * ni + j) % (int)20 == 0) {
  fprintf(stderr, (char*)__FIXME_GLOBAL___OC_str_OC_1);
  }
}
}
  fprintf(stderr, (char*)__FIXME_GLOBAL___OC_str_OC_1);
}


//INSERT COMMENT FUNCTION: init_array.cudakernel0
__global__ void init_array_OC_cudakernel0(uint64_t __FIXME__9, uint64_t __FIXME__10, uint32_t __FIXME__ni, uint64_t __FIXME__11, double* __FIXME__A) {
  int64_t __FIXME__indvars_2e_iv22;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next23;

  __FIXME__indvars_2e_iv22 = blockDim.x * blockIdx.x + threadIdx.x + 0;
//INSERT COMMENT IFELSE: for.cond
  if (__FIXME__indvars_2e_iv22 < __FIXME__9) {
for(int64_t i = 0; i < __FIXME__10;   i = i + 1){
  __FIXME__A[(__FIXME__indvars_2e_iv22 * __FIXME__11 + i)] = (((double)(__FIXME__indvars_2e_iv22) * (double)(i)) / (double)(__FIXME__ni));
}
  __FIXME__indvars_2e_iv22 + 1;
  }
  return;
}


//INSERT COMMENT FUNCTION: init_array.cudakernel1
__global__ void init_array_OC_cudakernel1(uint64_t __FIXME__12, uint64_t __FIXME__13, uint32_t __FIXME__nj, uint64_t __FIXME__14, double* __FIXME__B) {
  int64_t __FIXME__indvars_2e_iv16;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next17;

  __FIXME__indvars_2e_iv16 = blockDim.x * blockIdx.x + threadIdx.x + 0;
//INSERT COMMENT IFELSE: for.cond10
  if (__FIXME__indvars_2e_iv16 < __FIXME__12) {
for(int64_t i = 0; i < __FIXME__13;   i = i + 1){
  __FIXME__B[(__FIXME__indvars_2e_iv16 * __FIXME__14 + i)] = (((double)(__FIXME__indvars_2e_iv16) * (double)(i)) / (double)(__FIXME__nj));
}
  __FIXME__indvars_2e_iv16 + 1;
  }
  return;
}


//INSERT COMMENT FUNCTION: init_array.cudakernel2
__global__ void init_array_OC_cudakernel2(uint64_t __FIXME__15, uint64_t __FIXME__16, uint32_t __FIXME__nl, uint64_t __FIXME__17, double* __FIXME__C) {
  int64_t __FIXME__indvars_2e_iv10;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next11;

  __FIXME__indvars_2e_iv10 = blockDim.x * blockIdx.x + threadIdx.x + 0;
//INSERT COMMENT IFELSE: for.cond34
  if (__FIXME__indvars_2e_iv10 < __FIXME__15) {
for(int64_t i = 0; i < __FIXME__16;   i = i + 1){
  __FIXME__C[(__FIXME__indvars_2e_iv10 * __FIXME__17 + i)] = (((double)(__FIXME__indvars_2e_iv10) * (double)((i + 3))) / (double)(__FIXME__nl));
}
  __FIXME__indvars_2e_iv10 + 1;
  }
  return;
}


//INSERT COMMENT FUNCTION: init_array.cudakernel3
__global__ void init_array_OC_cudakernel3(uint64_t __FIXME__18, uint64_t __FIXME__19, uint32_t __FIXME__nk, uint64_t __FIXME__20, double* __FIXME__D) {
  int64_t __FIXME__indvars_2e_iv3;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next4;

  __FIXME__indvars_2e_iv3 = blockDim.x * blockIdx.x + threadIdx.x + 0;
//INSERT COMMENT IFELSE: for.cond58
  if (__FIXME__indvars_2e_iv3 < __FIXME__18) {
for(int64_t i = 0; i < __FIXME__19;   i = i + 1){
  __FIXME__D[(__FIXME__indvars_2e_iv3 * __FIXME__20 + i)] = (((double)(__FIXME__indvars_2e_iv3) * (double)((i + 2))) / (double)(__FIXME__nk));
}
  __FIXME__indvars_2e_iv3 + 1;
  }
  return;
}


//INSERT COMMENT FUNCTION: kernel_2mm.cudakernel0
__global__ void kernel_2mm_OC_cudakernel0(uint64_t __FIXME__21, uint64_t __FIXME__22, uint64_t __FIXME__23, double* __FIXME__tmp, uint64_t __FIXME__24, uint64_t __FIXME__25, double* __FIXME__A, double __FIXME__alpha, uint64_t __FIXME__26, double* __FIXME__B, uint64_t __FIXME__27) {
  int64_t __FIXME__indvars_2e_iv22;
  int64_t i;
  uint64_t __FIXME__indvars_2e_iv_2e_next23;
  int64_t j;

  __FIXME__indvars_2e_iv22 = blockDim.x * blockIdx.x + threadIdx.x + 0;
//INSERT COMMENT IFELSE: for.cond
  if (__FIXME__indvars_2e_iv22 < __FIXME__21) {
for(int64_t i = 0; i < __FIXME__22;   i = i + 1){
  __FIXME__tmp[(__FIXME__indvars_2e_iv22 * __FIXME__23 + i)] = 0;
for(int64_t j = 0; j < __FIXME__24;   j = j + 1){
  __FIXME__tmp[(__FIXME__indvars_2e_iv22 * __FIXME__27 + i)] = (__FIXME__tmp[(__FIXME__indvars_2e_iv22 * __FIXME__27 + i)] + ((__FIXME__alpha * __FIXME__A[(__FIXME__indvars_2e_iv22 * __FIXME__25 + j)]) * __FIXME__B[(j * __FIXME__26 + i)]));
}
}
  __FIXME__indvars_2e_iv22 + 1;
  }
  return;
}

