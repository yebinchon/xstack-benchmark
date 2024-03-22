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
struct l_struct_struct_OC_dim3;
struct l_unnamed_1;

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
struct l_struct_struct_OC_dim3 {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
};
struct l_unnamed_1 {
  uint64_t field0;
  uint32_t field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiiiPdS_(uint32_t, uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliiiPdS_S_(uint32_t, uint32_t, uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiiiPd(uint32_t, uint32_t, uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z10kernel_sumiiiPdS_S__OC_1(uint32_t, uint32_t, uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


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

int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t nr;
  int32_t nq;
  int32_t np;
  uint8_t* A;
  uint8_t* sum;
  uint8_t* C4;
  int32_t call37;
  int32_t call51;

  dump_code = atoi(argv[1]);
  nr = atoi(argv[2]);
  nq = atoi(argv[3]);
  np = atoi(argv[4]);
  A = malloc(nr * nq * np * 8);
  sum = malloc(nr * nq * np * 8);
  C4 = malloc(np * np * 8);
  _ZL10init_arrayiiiPdS_(nr, nq, np, ((double*)A), ((double*)C4));
;
#pragma omp target data map(to: A[0:nr * nq * np * 8], C4[0:np * np * 8]) map(tofrom: sum[0:nr * nq * np * 8])
{
  _ZL6kerneliiiPdS_S_(nr, nq, np, ((double*)A), ((double*)C4), ((double*)sum));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiiiPd(nr, nq, np, ((double*)sum));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)sum)));
free(((uint8_t*)((double*)C4)));
  return 0;
}


void _ZL10init_arrayiiiPdS_(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4) {
  int64_t i;
  int64_t j;
  int64_t k;


for(int64_t i = 0; i < nr;   ++i){

for(int64_t j = 0; j < nq;   ++j){

for(int64_t k = 0; k < np;   ++k){
  A[((i * np * nq + j * nq) + k)] = ((((double)(i) * (double)(j)) + (double)(k)) / (double)(np));
}
}
}

for(int64_t i = 0; i < np;   ++i){

for(int64_t j = 0; j < np;   ++j){
  C4[(i * np + j)] = (((double)(i) * (double)(j)) / (double)(np));
}
}
  return;
}


void _ZL6kerneliiiPdS_S_(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp3;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp3_2e_coerce;    /* Address-exposed local */
  int32_t call;
  int32_t call1;
  int32_t call2;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  uint32_t m;

  block.field0 = 1;
  block.field1 = 8;
  block.field2 = 32;
  call = _ZL10num_blocksii(nr, block.field0);
  call1 = _ZL10num_blocksii(nq, block.field1);
  call2 = _ZL10num_blocksii(np, block.field2);
  grid.field0 = call;
  grid.field1 = call1;
  grid.field2 = call2;
  memcpy(((uint8_t*)(&agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp3)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp3_2e_coerce)), ((uint8_t*)(&agg_2e_tmp3)), 12);
#pragma omp target teams distribute collapse(2)

for(int32_t i = 0; i < call;   ++i){

for(int32_t j = 0; j < call1;   ++j){

for(int32_t k = 0; k < call2;   ++k){

for(int32_t l = 0; l < 8;   ++l){

for(int32_t m = 0; m < 32;   ++m){
_Z10kernel_sumiiiPdS_S__OC_1(nr, nq, np, A, C4, sum, call, call1, call2, 1, 8, 32, i, j, k, 0, l, m);
}
}
}
}
}
  return;
}


void _ZL11print_arrayiiiPd(uint32_t nr, uint32_t nq, uint32_t np, double* A) {
  int64_t i;
  int64_t j;
  int64_t k;
  int32_t call18;


for(int64_t i = 0; i < nr;   ++i){

for(int64_t j = 0; j < nq;   ++j){

for(int64_t k = 0; k < np;   ++k){
  uint32_t call = fprintf(stderr, (_OC_str), A[((i * nq * np + j * nq) + k)]);
  if (i % 20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
}
}
  fprintf(stderr, (_OC_str_OC_1));
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z10kernel_sumiiiPdS_S__OC_1(uint32_t nr, uint32_t nq, uint32_t np, double* A, double* C4, double* sum, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int32_t r;
  int32_t q;
  int32_t p;
  int64_t s;
  double dot;

  r = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  q = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  p = blockDim_2e_z * blockIdx_2e_z + threadIdx_2e_z;
  if (r < nr) {
  if (q < nq) {
  if (p < np) {
  sum[((r * nq + q) * np + p)] = 0;
  dot = 0;

for(int64_t s = 0; s < np;   ++s){
  dot = (dot + (A[((r * nq + q) * np + s)] * C4[(s * np + p)]));
}
  sum[((r * nq + q) * np + p)] = dot;
  }
  }
  }
  return;
}

