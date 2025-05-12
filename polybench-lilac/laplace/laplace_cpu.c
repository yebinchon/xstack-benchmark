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

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
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
void Gold_laplace3d(uint32_t, uint32_t, uint32_t, float*, float*) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline));
void printHelp(void) __ATTRIBUTELIST__((noinline));
uint32_t cudaGetDeviceCount(uint32_t*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t cudaThreadSynchronize(void);
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
float std::sqrt(float) __ATTRIBUTELIST__((noinline, nothrow)) __ATTRIBUTE_WEAK__;
uint32_t cudaFree(uint8_t*);
float sqrtf(float) __ATTRIBUTELIST__((nothrow));
void GPU_laplace3d(uint32_t, uint32_t, uint32_t, uint32_t, float*, float*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
float __FIXME_GLOBAL___ZZ13GPU_laplace3diiiiPfS_E2u1[612] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
uint8_t __FIXME_GLOBAL___OC_str_OC_2[47] = { "Illegal argument - nx must be greater than 99\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_4[47] = { "Illegal argument - ny must be greater than 99\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_6[47] = { "Illegal argument - nz must be greater than 99\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_8[53] = { "Illegal argument - repeat must be greater than zero\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_9[32] = { "\nGrid dimensions: %d x %d x %d\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_10[24] = { "\n dimGrid  = %d %d %d \n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_11[23] = { " dimBlock = %d %d %d \n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_12[19] = { "\n rms error = %f \n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_13[35] = { "CUDA_SAFE_CALL( cudaFree(d_u1) );\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_14[35] = { "CUDA_SAFE_CALL( cudaFree(d_u2) );\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_15[13] = { "free(h_u1);\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_16[13] = { "free(h_u2);\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_17[13] = { "free(h_u3);\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_18[31] = { "Usage:  laplace3d [OPTION]...\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_19[34] = { "6-point stencil 3D Laplace test \n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_20[2] = { "\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_21[51] = { "Example: run 100 iterations on a 256x128x128 grid\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_22[53] = { "./laplace3d --nx=256 --ny=128 --nz=128 --repeat=100\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_23[10] = { "Options:\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_24[33] = { "--help\t\t\tDisplay this help menu\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_25[25] = { "--nx=[SIZE]\t\tGrid width\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_26[26] = { "--ny=[SIZE]\t\tGrid height\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_27[25] = { "--nz=[SIZE]\t\tGrid depth\n" };
uint8_t __FIXME_GLOBAL___OC_str_OC_28[40] = { "--repeat=[COUNT]\tNumber of repetitions\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline float llvm_fadd_f32(float a, float b) {
  float r = a + b;
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
static __forceinline float llvm_fsub_f32(float a, float b) {
  float r = a - b;
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
static __forceinline float llvm_fmul_f32(float a, float b) {
  float r = a * b;
  return r;
}
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline float llvm_fdiv_f32(float a, float b) {
  float r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_OC_nvvm_OC_mul24_OC_i(int32_t a, int32_t b) {
  uint32_t r;
r = a * b; 
  return r;
}


/* Function Bodies */

//INSERT COMMENT FUNCTION: Gold_laplace3d
void Gold_laplace3d(uint32_t NX, uint32_t NY, uint32_t NZ, float* u1, float* u2) {
  int64_t k;
  int64_t j;
  int64_t i;

//INSERT COMMENT LOOP: for.cond
for(int64_t k = 0; k < NZ;   k = k + 1){
for(int64_t j = 0; j < NY;   j = j + 1){
for(int64_t i = 0; i < NX;   i = i + 1){
  uint64_t __FIXME__1 = i + j * NX + k * NX * NY;
  if (i == 0) {
  u2[__FIXME__1] = u1[__FIXME__1];
  } else {
  if (i == (NX - 1)) {
  u2[__FIXME__1] = u1[__FIXME__1];
  } else {
  if (j == 0) {
  u2[__FIXME__1] = u1[__FIXME__1];
  } else {
  if (j == (NY - 1)) {
  u2[__FIXME__1] = u1[__FIXME__1];
  } else {
  if (k == 0) {
  u2[__FIXME__1] = u1[__FIXME__1];
  } else {
  if (k == (NZ - 1)) {
  u2[__FIXME__1] = u1[__FIXME__1];
  } else {
  u2[__FIXME__1] = u1[(__FIXME__1 - 1)] + u1[(__FIXME__1 + 1)] + u1[(__FIXME__1 - NX)] + u1[(__FIXME__1 + NX)] + u1[(__FIXME__1 - NX * NY)] + u1[(__FIXME__1 + NX * NY)] * 0.166666672;
  }
  }
  }
  }
  }
  }
}
}
}
  return;
}


int main(int argc, char ** argv) {
  uint32_t NX;    /* Address-exposed local */
  uint32_t NY;    /* Address-exposed local */
  uint32_t NZ;    /* Address-exposed local */
  uint32_t REPEAT;    /* Address-exposed local */
  float* d_u1;    /* Address-exposed local */
  float* d_u2;    /* Address-exposed local */
  uint32_t deviceCount;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 dimGrid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 dimBlock;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp122;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp122_2e_coerce;    /* Address-exposed local */
  int32_t __FIXME__call;
  int32_t __FIXME__call9;
  int32_t __FIXME__call17;
  int32_t __FIXME__call25;
  int32_t __FIXME__call29;
  int32_t __FIXME__call30;
  uint8_t* __FIXME__call35;
  uint8_t* __FIXME__call42;
  uint8_t* __FIXME__call49;
  int32_t __FIXME__call56;
  int32_t __FIXME__call63;
  uint64_t pitch;
  int32_t k;
  int32_t j;
  int32_t i;
  int32_t __FIXME__call105;
  int32_t __FIXME__call106;
  uint32_t bx;
  uint32_t by;
  int32_t __FIXME__call113;
  int32_t __FIXME__call117;
  int32_t __FIXME__call118;
  uint32_t l;
  uint32_t m;
  int32_t __FIXME__call135;
  float* __FIXME__h_u3_2e_0;
  float* __FIXME__h_u3_2e_0_2e_lcssa;
  float err;
  float __FIXME__call182;
  int32_t __FIXME__call184;
  int32_t __FIXME__call185;
  int32_t __FIXME__call187;
  int32_t __FIXME__call189;
  int32_t __FIXME__call190;
  int32_t __FIXME__call191;

//INSERT COMMENT IFELSE: entry
  ;
  if (1) {
printHelp();
  }
//INSERT COMMENT IFELSE: if.end
  if ((&NX) != ((uint32_t*)0)) {
  if (NX <= 99) {
  printf((__FIXME_GLOBAL___OC_str_OC_2));
  }
  } else {
  NX = 100;
  }
//INSERT COMMENT IFELSE: if.end4
  if ((&NY) != ((uint32_t*)0)) {
  if (NY <= 99) {
  printf((__FIXME_GLOBAL___OC_str_OC_4));
  }
  } else {
  NY = 100;
  }
//INSERT COMMENT IFELSE: if.end12
  if ((&NZ) != ((uint32_t*)0)) {
  if (NZ <= 99) {
  printf((__FIXME_GLOBAL___OC_str_OC_6));
  }
  } else {
  NZ = 100;
  }
//INSERT COMMENT IFELSE: if.end20
  if ((&REPEAT) != ((uint32_t*)0)) {
  if (REPEAT <= 0) {
  printf((__FIXME_GLOBAL___OC_str_OC_8));
  printf((__FIXME_GLOBAL___OC_str_OC_9), NX, NY, NZ);
  cudaGetDeviceCount((&deviceCount));
  __FIXME__call35 = malloc(4 * NX * NY * NZ);
  __FIXME__call42 = malloc(4 * NX * NY * NZ);
  __FIXME__call49 = malloc(4 * NX * NY * NZ);
  cudaMalloc(((uint8_t**)(&d_u1)), 4 * NX * NY * NZ);
  cudaMalloc(((uint8_t**)(&d_u2)), 4 * NX * NY * NZ);
  pitch = (/*UNDEF*/0 / 4);
  }
  printf((__FIXME_GLOBAL___OC_str_OC_9), NX, NY, NZ);
  cudaGetDeviceCount((&deviceCount));
  __FIXME__call35 = malloc(4 * NX * NY * NZ);
  __FIXME__call42 = malloc(4 * NX * NY * NZ);
  __FIXME__call49 = malloc(4 * NX * NY * NZ);
  cudaMalloc(((uint8_t**)(&d_u1)), 4 * NX * NY * NZ);
  cudaMalloc(((uint8_t**)(&d_u2)), 4 * NX * NY * NZ);
  pitch = (/*UNDEF*/0 / 4);
  } else {
  REPEAT = 1;
  printf((__FIXME_GLOBAL___OC_str_OC_9), NX, NY, NZ);
  cudaGetDeviceCount((&deviceCount));
  __FIXME__call35 = malloc(4 * NX * NY * NZ);
  __FIXME__call42 = malloc(4 * NX * NY * NZ);
  __FIXME__call49 = malloc(4 * NX * NY * NZ);
  cudaMalloc(((uint8_t**)(&d_u1)), 4 * NX * NY * NZ);
  cudaMalloc(((uint8_t**)(&d_u2)), 4 * NX * NY * NZ);
  pitch = (/*UNDEF*/0 / 4);
  }
//INSERT COMMENT LOOP: for.cond
for(int32_t k = 0; k < NZ;   k = k + 1){
for(int32_t j = 0; j < NY;   j = j + 1){
for(int32_t i = 0; i < NX;   i = i + 1){
  uint32_t ind = i + j * NX + k * NX * NY;
  if (i == 0) {
  ((float*)__FIXME__call42)[ind] = 1;
  } else {
  if (i == (NX - 1)) {
  ((float*)__FIXME__call42)[ind] = 1;
  } else {
  if (j == 0) {
  ((float*)__FIXME__call42)[ind] = 1;
  } else {
  if (j == (NY - 1)) {
  ((float*)__FIXME__call42)[ind] = 1;
  } else {
  if (k == 0) {
  ((float*)__FIXME__call42)[ind] = 1;
  } else {
  if (k == (NZ - 1)) {
  ((float*)__FIXME__call42)[ind] = 1;
  } else {
  ((float*)__FIXME__call42)[ind] = 0;
  }
  }
  }
  }
  }
  }
}
}
}
  cudaThreadSynchronize();
  bx = 1 + (NX - 1) / 32;
  by = 1 + (NY - 1) / 4;
  dimGrid.__FIXME__l_struct_struct_OC_dim3_field0 = bx;
  dimGrid.__FIXME__l_struct_struct_OC_dim3_field1 = by;
  dimGrid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  dimBlock.__FIXME__l_struct_struct_OC_dim3_field0 = 32;
  dimBlock.__FIXME__l_struct_struct_OC_dim3_field1 = 4;
  dimBlock.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  printf((__FIXME_GLOBAL___OC_str_OC_10), dimGrid.__FIXME__l_struct_struct_OC_dim3_field0, dimGrid.__FIXME__l_struct_struct_OC_dim3_field1, dimGrid.__FIXME__l_struct_struct_OC_dim3_field2);
  printf((__FIXME_GLOBAL___OC_str_OC_11), dimBlock.__FIXME__l_struct_struct_OC_dim3_field0, dimBlock.__FIXME__l_struct_struct_OC_dim3_field1, dimBlock.__FIXME__l_struct_struct_OC_dim3_field2);
  cudaThreadSynchronize();
//INSERT COMMENT LOOP: for.cond119
for(int32_t i = 1; i <= REPEAT;   i = i + 1){
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&dimGrid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp122)), ((uint8_t*)(&dimBlock)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp122_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp122)), 12);
#pragma omp parallel for collapse(2)
for(int32_t j = 0; j < bx;   j = j + 1){
for(int32_t k = 0; k < by;   k = k + 1){
for(int32_t l = 0; l < 32;   l = l + 1){
for(int32_t m = 0; m < 4;   m = m + 1){
GPU_laplace3d(NX, NY, NZ, pitch, ((float*)__FIXME__call35), d_u2, bx, by, 1, 32, 4, 1, j, k, 0, l, m, 0);
}
}
}
}
  d_u1 = d_u2;
  d_u2 = ((float*)__FIXME__call35);
  cudaThreadSynchronize();
}
//INSERT COMMENT LOOP: for.cond137
for(int32_t i = 1; i <= REPEAT;   i = i + 1){
Gold_laplace3d(NX, NY, NZ, __FIXME__h_u3_2e_0_2e_lcssa, __FIXME__h_u3_2e_0_2e_lcssa);
}
  err = 0;
//INSERT COMMENT LOOP: for.cond143
for(int32_t k = 0; k < NZ;   k = k + 1){
for(int32_t j = 0; j < NY;   j = j + 1){
for(int32_t i = 0; i < NX;   i = i + 1){
  ind = i + j * NX + k * NX * NY;
  err = err + (((float*)__FIXME__call42)[ind] - ((float*)__FIXME__call42)[ind]) * (((float*)__FIXME__call42)[ind] - ((float*)__FIXME__call42)[ind]);
}
}
}
  __FIXME__call182 = std::sqrt((err / (float)(NX * NY * NZ)));
  printf((__FIXME_GLOBAL___OC_str_OC_12), ((double)__FIXME__call182));
  printf((__FIXME_GLOBAL___OC_str_OC_13));
  printf((__FIXME_GLOBAL___OC_str_OC_14));
  printf((__FIXME_GLOBAL___OC_str_OC_15));
free(((uint8_t*)__FIXME__h_u3_2e_0_2e_lcssa));
  printf((__FIXME_GLOBAL___OC_str_OC_16));
free(((uint8_t*)__FIXME__h_u3_2e_0_2e_lcssa));
  printf((__FIXME_GLOBAL___OC_str_OC_17));
free(((uint8_t*)__FIXME__h_u3_2e_0_2e_lcssa));
  return 0;
}


//INSERT COMMENT FUNCTION: printHelp
void printHelp(void) {
  int32_t __FIXME__call;
  int32_t __FIXME__call1;
  int32_t __FIXME__call2;
  int32_t __FIXME__call3;
  int32_t __FIXME__call4;
  int32_t __FIXME__call5;
  int32_t __FIXME__call6;
  int32_t __FIXME__call7;
  int32_t __FIXME__call8;
  int32_t __FIXME__call9;
  int32_t __FIXME__call10;
  int32_t __FIXME__call11;

  printf((__FIXME_GLOBAL___OC_str_OC_18));
  printf((__FIXME_GLOBAL___OC_str_OC_19));
  printf((__FIXME_GLOBAL___OC_str_OC_20));
  printf((__FIXME_GLOBAL___OC_str_OC_21));
  printf((__FIXME_GLOBAL___OC_str_OC_22));
  printf((__FIXME_GLOBAL___OC_str_OC_20));
  printf((__FIXME_GLOBAL___OC_str_OC_23));
  printf((__FIXME_GLOBAL___OC_str_OC_24));
  printf((__FIXME_GLOBAL___OC_str_OC_25));
  printf((__FIXME_GLOBAL___OC_str_OC_26));
  printf((__FIXME_GLOBAL___OC_str_OC_27));
  printf((__FIXME_GLOBAL___OC_str_OC_28));
}


//INSERT COMMENT FUNCTION: std::sqrt
float std::sqrt(float __x) {
  float __FIXME__call;

  __FIXME__call = sqrtf(__x);
  return __FIXME__call;
}


//INSERT COMMENT FUNCTION: GPU_laplace3d
void GPU_laplace3d(uint32_t NX, uint32_t NY, uint32_t NZ, uint32_t pitch, float* d_u1, float* d_u2, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t x, uint32_t x, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  float __FIXME__sharedMem0[612];    /* Address-exposed local */
  uint32_t NXM1;
  uint32_t NYM1;
  int32_t NZM1;
  int32_t k;
  uint32_t j;
  int32_t i;
  int32_t __FIXME__4;
  int32_t ind_h;
  int32_t __FIXME__5;
  int32_t __FIXME__6;
  int32_t __FIXME__add25;
  int32_t __FIXME__7;
  int32_t indg_h;
  bool __FIXME__2;
  uint32_t halo;
  int32_t __FIXME__8;
  int64_t ind;
  int32_t __FIXME__9;
  int32_t __FIXME__10;
  int32_t __FIXME__add47;
  int32_t __FIXME__11;
  int64_t __FIXME__add49;
  bool __FIXME__3;
  int32_t indg;
  int32_t indg0;
  float u2;

//INSERT COMMENT IFELSE: entry
  NXM1 = (NX - 1);
  NYM1 = (NY - 1);
  NZM1 = (NZ - 1);
  k = __FIXME__threadIdx_2e_x + __FIXME__threadIdx_2e_y * 32;
  if (halo != 0) {
  if (__FIXME__threadIdx_2e_y < 2) {
  j = (__FIXME__threadIdx_2e_y * 5 - 1);
  } else {
  i = ((int)k % (int)2 * 33 - 1);
  j = ((k / 2 - 32) - 1);
  }
  __FIXME__4 = llvm_OC_nvvm_OC_mul24_OC_i(j + 1, 34);
  ind_h = i + 1 + __FIXME__4 + 204;
  __FIXME__5 = llvm_OC_nvvm_OC_mul24_OC_i(x, 32);
  i = i + __FIXME__5;
  __FIXME__6 = llvm_OC_nvvm_OC_mul24_OC_i(x, 4);
  __FIXME__add25 = j + __FIXME__6;
  __FIXME__7 = llvm_OC_nvvm_OC_mul24_OC_i(__FIXME__add25, pitch);
  indg_h = i + __FIXME__7;
  if (i >= 0) {
  if (i < NX) {
  if (__FIXME__add25 >= 0) {
  }
  }
  }
  }
//INSERT COMMENT IFELSE: if.end34
  __FIXME__8 = llvm_OC_nvvm_OC_mul24_OC_i(__FIXME__threadIdx_2e_y + 1, 34);
  ind = __FIXME__threadIdx_2e_x + 1 + __FIXME__8 + 204;
  __FIXME__9 = llvm_OC_nvvm_OC_mul24_OC_i(x, 32);
  i = __FIXME__threadIdx_2e_x + __FIXME__9;
  __FIXME__10 = llvm_OC_nvvm_OC_mul24_OC_i(x, 4);
  __FIXME__add47 = __FIXME__threadIdx_2e_y + __FIXME__10;
  __FIXME__11 = llvm_OC_nvvm_OC_mul24_OC_i(__FIXME__add47, pitch);
  __FIXME__add49 = i + __FIXME__11;
  if (i < NX) {
  }
//INSERT COMMENT IFELSE: land.end53
  if (__FIXME__3 != 0) {
  __FIXME__sharedMem0[(ind + 204)] = d_u1[indg0];
  }
//INSERT COMMENT IFELSE: if.end60
  if (halo != 0) {
  __FIXME__sharedMem0[(ind_h + 204)] = d_u1[indg_h];
  indg0 = /*UNDEF*/0;
  }
  indg0 = /*UNDEF*/0;
//INSERT COMMENT LOOP: for.cond
for(int32_t k = 0; k < NZ;   k = k + 1){
  if (__FIXME__3 != 0) {
  uint32_t __FIXME__12 = llvm_OC_nvvm_OC_mul24_OC_i(NY, pitch);
  uint32_t __FIXME__add73 = indg0 + __FIXME__12;
  __FIXME__sharedMem0[(ind - 204)] = __FIXME__sharedMem0[ind];
  __FIXME__sharedMem0[ind] = __FIXME__sharedMem0[(ind + 204)];
  if (k < NZM1) {
  __FIXME__sharedMem0[(ind + 204)] = d_u1[indg0];
  }
  }
  if (halo != 0) {
  uint32_t __FIXME__13 = llvm_OC_nvvm_OC_mul24_OC_i(NY, pitch);
  uint32_t indg_h = indg_h + __FIXME__13;
  __FIXME__sharedMem0[(ind_h - 204)] = __FIXME__sharedMem0[ind_h];
  __FIXME__sharedMem0[ind_h] = __FIXME__sharedMem0[(ind_h + 204)];
  if (k < NZM1) {
  __FIXME__sharedMem0[(ind_h + 204)] = d_u1[indg_h];
  }
  }
  if (__FIXME__3 != 0) {
  if (i == 0) {
  u2 = __FIXME__sharedMem0[ind];
  d_u2[indg0] = u2;
  } else {
  if (i == NXM1) {
  u2 = __FIXME__sharedMem0[ind];
  d_u2[indg0] = u2;
  } else {
  if (__FIXME__add47 == 0) {
  u2 = __FIXME__sharedMem0[ind];
  d_u2[indg0] = u2;
  } else {
  if (__FIXME__add47 == NYM1) {
  u2 = __FIXME__sharedMem0[ind];
  d_u2[indg0] = u2;
  } else {
  if (k == 0) {
  u2 = __FIXME__sharedMem0[ind];
  d_u2[indg0] = u2;
  } else {
  if (k == NZM1) {
  u2 = __FIXME__sharedMem0[ind];
  d_u2[indg0] = u2;
  } else {
  u2 = __FIXME__sharedMem0[(ind - 1)] + __FIXME__sharedMem0[(ind + 1)] + __FIXME__sharedMem0[(ind - 34)] + __FIXME__sharedMem0[(ind + 34)] + __FIXME__sharedMem0[(ind - 204)] + __FIXME__sharedMem0[(ind + 204)] * 0.166666672;
  d_u2[indg0] = u2;
  }
  }
  }
  }
  }
  }
  }
}
  return;
}

