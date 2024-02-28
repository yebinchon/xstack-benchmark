/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
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
void _ZL10init_arrayiPdS_S_S_S_S_S_S_S_S_S_(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
void _ZL6kerneliPdS_S_S_S_S_S_S_S_S_S_(uint32_t, double*, double*, double*, double*, double*, double*, double*, double*, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
void _Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void _Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(uint32_t, double, double, double*, double*, double*, double*, double*, double*, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[8] = { "%0.2lf " };
uint8_t _OC_str_OC_1[2] = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
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
  int32_t n;
  int32_t dump_code;
  uint8_t* alpha;
  uint8_t* beta;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;

  n = atoi(argv[2]);
  dump_code = atoi(argv[1]);
  alpha = malloc(8);
  beta = malloc(8);
  A = malloc(n * n * 8);
  u1 = malloc(n * 8);
  v1 = malloc(n * 8);
  u2 = malloc(n * 8);
  v2 = malloc(n * 8);
  w = malloc(n * 8);
  x = malloc(n * 8);
  y = malloc(n * 8);
  z = malloc(n * 8);
  _ZL10init_arrayiPdS_S_S_S_S_S_S_S_S_S_(n, ((double*)alpha), ((double*)beta), ((double*)A), ((double*)u1), ((double*)v1), ((double*)u2), ((double*)v2), ((double*)w), ((double*)x), ((double*)y), ((double*)z));
;
  _ZL6kerneliPdS_S_S_S_S_S_S_S_S_S_(n, ((double*)alpha), ((double*)beta), ((double*)A), ((double*)u1), ((double*)v1), ((double*)u2), ((double*)v2), ((double*)w), ((double*)x), ((double*)y), ((double*)z));
;
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)w));
  }
free(((uint8_t*)((double*)A)));
free(((uint8_t*)((double*)u1)));
free(((uint8_t*)((double*)v1)));
free(((uint8_t*)((double*)u2)));
free(((uint8_t*)((double*)v2)));
free(((uint8_t*)((double*)w)));
free(((uint8_t*)((double*)x)));
free(((uint8_t*)((double*)y)));
free(((uint8_t*)((double*)z)));
  return 0;
}


void _ZL10init_arrayiPdS_S_S_S_S_S_S_S_S_S_(uint32_t n, double* alpha, double* beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  int64_t i;
  int32_t j;

  *alpha = 43532;
  *beta = 12313;

for(int32_t i = 0; i < n;   i = i + 1){
  u1[i] = (double)(i);
  u2[i] = (double)((i + 1) / n) / 2;
  v1[i] = (double)((i + 1) / n) / 4;
  v2[i] = (double)((i + 1) / n) / 6;
  y[i] = (double)((i + 1) / n) / 8;
  z[i] = (double)((i + 1) / n) / 9;
  x[i] = 0;
  w[i] = 0;

for(int32_t j = 0; j < n;   j = j + 1){
  A[(i * n + j)] = (double)(i) * (double)(j) / (double)(n);
}
}
  return;
}


void _ZL6kerneliPdS_S_S_S_S_S_S_S_S_S_(uint32_t n, double* alpha, double* beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z) {
  struct l_struct_struct_OC_dim3 block;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp62;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp62_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp64;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp66;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp64_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp66_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp71;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp73;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp71_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp73_2e_coerce;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp78;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp80;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp78_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp80_2e_coerce;    /* Address-exposed local */
  uint8_t* dev_A;
  uint8_t* dev_u1;
  uint8_t* dev_v1;
  uint8_t* dev_u2;
  uint8_t* dev_v2;
  uint8_t* dev_w;
  uint8_t* dev_x;
  uint8_t* dev_y;
  uint8_t* dev_z;
  uint8_t* dev_alpha;
  uint8_t* dev_beta;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  uint8_t* _5;
  uint8_t* _6;
  uint8_t* _7;
  uint8_t* _8;
  uint8_t* _9;
  uint8_t* _10;
  uint8_t* _11;
  int32_t call59;
  int32_t call61;
  uint8_t* _12;
  uint8_t* _13;
  uint8_t* _14;
  uint8_t* _15;
  uint32_t i;
  uint32_t j;
  uint32_t k;
  uint32_t l;
  int32_t call65;
  uint8_t* _16;
  uint8_t* _17;
  int32_t call72;
  uint8_t* _18;
  uint8_t* _19;
  int32_t call79;
  uint8_t* _20;
  uint8_t* _21;
  uint8_t* _22;

  dev_A = malloc(n * n * 8);
  dev_u1 = malloc(n * 8);
  dev_v1 = malloc(n * 8);
  dev_u2 = malloc(n * 8);
  dev_v2 = malloc(n * 8);
  dev_w = malloc(n * 8);
  dev_x = malloc(n * 8);
  dev_y = malloc(n * 8);
  dev_z = malloc(n * 8);
  dev_alpha = malloc(8);
  dev_beta = malloc(8);
  memcpy(((uint8_t*)((double*)dev_A)), ((uint8_t*)A), n * n * 8);
  memcpy(((uint8_t*)((double*)dev_u1)), ((uint8_t*)u1), n * 8);
  memcpy(((uint8_t*)((double*)dev_v1)), ((uint8_t*)v1), n * 8);
  memcpy(((uint8_t*)((double*)dev_u2)), ((uint8_t*)u2), n * 8);
  memcpy(((uint8_t*)((double*)dev_v2)), ((uint8_t*)v2), n * 8);
  memcpy(((uint8_t*)((double*)dev_w)), ((uint8_t*)w), n * 8);
  memcpy(((uint8_t*)((double*)dev_x)), ((uint8_t*)x), n * 8);
  memcpy(((uint8_t*)((double*)dev_y)), ((uint8_t*)y), n * 8);
  memcpy(((uint8_t*)((double*)dev_z)), ((uint8_t*)z), n * 8);
  memcpy(((uint8_t*)((double*)dev_alpha)), ((uint8_t*)alpha), 8);
  memcpy(((uint8_t*)((double*)dev_beta)), ((uint8_t*)beta), 8);
  block.field0 = 8;
  block.field1 = 32;
  block.field2 = 1;
  call59 = _ZL10num_blocksii(n, block.field0);
  call61 = _ZL10num_blocksii(n, block.field1);
  grid.field0 = call59;
  grid.field1 = call61;
  grid.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp62)), ((uint8_t*)(&block)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp_2e_coerce)), ((uint8_t*)(&agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp62_2e_coerce)), ((uint8_t*)(&agg_2e_tmp62)), 12);
#pragma omp parallel for 
for(int32_t i = 0; i < call59;   i = i + 1){

for(int32_t j = 0; j < call61;   j = j + 1){

for(int32_t k = 0; k < 8;   k = k + 1){

for(int32_t l = 0; l < 32;   l = l + 1){
_Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(n, *((double*)dev_alpha), *((double*)dev_beta), ((double*)dev_A), ((double*)dev_u1), ((double*)dev_v1), ((double*)dev_u2), ((double*)dev_v2), ((double*)dev_w), ((double*)dev_x), ((double*)dev_y), ((double*)dev_z), call59, call61, 1, 8, 32, 1, i, j, 0, k, l, 0);
}
}
}
}
  call65 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp64.field0 = call65;
  agg_2e_tmp64.field1 = 1;
  agg_2e_tmp64.field2 = 1;
  agg_2e_tmp66.field0 = 256;
  agg_2e_tmp66.field1 = 1;
  agg_2e_tmp66.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp64_2e_coerce)), ((uint8_t*)(&agg_2e_tmp64)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp66_2e_coerce)), ((uint8_t*)(&agg_2e_tmp66)), 12);
#pragma omp parallel for 
for(int32_t i = 0; i < call65;   i = i + 1){

for(int32_t j = 0; j < 256;   j = j + 1){
_Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(n, *((double*)dev_alpha), *((double*)dev_beta), ((double*)dev_A), ((double*)dev_u1), ((double*)dev_v1), ((double*)dev_u2), ((double*)dev_v2), ((double*)dev_w), ((double*)dev_x), ((double*)dev_y), ((double*)dev_z), call65, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  call72 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp71.field0 = call72;
  agg_2e_tmp71.field1 = 1;
  agg_2e_tmp71.field2 = 1;
  agg_2e_tmp73.field0 = 256;
  agg_2e_tmp73.field1 = 1;
  agg_2e_tmp73.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp71_2e_coerce)), ((uint8_t*)(&agg_2e_tmp71)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp73_2e_coerce)), ((uint8_t*)(&agg_2e_tmp73)), 12);
#pragma omp parallel for 
for(int32_t i = 0; i < call72;   i = i + 1){

for(int32_t j = 0; j < 256;   j = j + 1){
_Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(n, *((double*)dev_alpha), *((double*)dev_beta), ((double*)dev_A), ((double*)dev_u1), ((double*)dev_v1), ((double*)dev_u2), ((double*)dev_v2), ((double*)dev_w), ((double*)dev_x), ((double*)dev_y), ((double*)dev_z), call72, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  call79 = _ZL10num_blocksii(n, 256);
  agg_2e_tmp78.field0 = call79;
  agg_2e_tmp78.field1 = 1;
  agg_2e_tmp78.field2 = 1;
  agg_2e_tmp80.field0 = 256;
  agg_2e_tmp80.field1 = 1;
  agg_2e_tmp80.field2 = 1;
  memcpy(((uint8_t*)(&agg_2e_tmp78_2e_coerce)), ((uint8_t*)(&agg_2e_tmp78)), 12);
  memcpy(((uint8_t*)(&agg_2e_tmp80_2e_coerce)), ((uint8_t*)(&agg_2e_tmp80)), 12);
#pragma omp parallel for 
for(int32_t i = 0; i < call79;   i = i + 1){

for(int32_t j = 0; j < 256;   j = j + 1){
_Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(n, *((double*)dev_alpha), *((double*)dev_beta), ((double*)dev_A), ((double*)dev_u1), ((double*)dev_v1), ((double*)dev_u2), ((double*)dev_v2), ((double*)dev_w), ((double*)dev_x), ((double*)dev_y), ((double*)dev_z), call79, 1, 1, 256, 1, 1, i, 0, 0, j, 0, 0);
}
}
  memcpy(((uint8_t*)w), ((uint8_t*)((double*)dev_w)), n * 8);
}


void _ZL11print_arrayiPd(uint32_t n, double* w) {
  int64_t i;


for(int32_t i = 0; i < n;   i = i + 1){
  uint32_t call = fprintf(stderr, (_OC_str), w[i]);
  if ((int)i % (int)20 == 0) {
  fprintf(stderr, (_OC_str_OC_1));
  }
}
  return;
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z8kernel_AiddPdS_S_S_S_S_S_S_S__OC_1(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  j = blockDim_2e_y * blockIdx_2e_y + threadIdx_2e_y;
  if (i < n) {
  if (j < n) {
  A[(i * n + j)] = (A[(i * n + j)] + (u1[i] * v1[j] + u2[i] * v2[j]));
  }
  }
  return;
}


void _Z8kernel_xiddPdS_S_S_S_S_S_S_S__OC_2(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {

for(int32_t j = 0; j < n;   j = j + 1){
  x[i] = (x[i] + beta * A[(j * n + i)] * y[j]);
}
  }
  return;
}


void _Z8kernel_yiddPdS_S_S_S_S_S_S_S__OC_3(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {
  x[i] = (x[i] + z[i]);
  }
  return;
}


void _Z8kernel_widdPdS_S_S_S_S_S_S_S__OC_4(uint32_t n, double alpha, double beta, double* A, double* u1, double* v1, double* u2, double* v2, double* w, double* x, double* y, double* z, uint32_t gridDim_2e_x, uint32_t gridDim_2e_y, uint32_t gridDim_2e_z, uint32_t blockDim_2e_x, uint32_t blockDim_2e_y, uint32_t blockDim_2e_z, uint32_t blockIdx_2e_x, uint32_t blockIdx_2e_y, uint32_t blockIdx_2e_z, uint32_t threadIdx_2e_x, uint32_t threadIdx_2e_y, uint32_t threadIdx_2e_z) {
  int64_t i;
  int64_t j;

  i = blockDim_2e_x * blockIdx_2e_x + threadIdx_2e_x;
  if (i < n) {

for(int32_t j = 0; j < n;   j = j + 1){
  w[i] = (w[i] + alpha * A[(i * n + j)] * x[j]);
}
  }
  return;
}

