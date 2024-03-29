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

static __forceinline int llvm_fcmp_oeq(double X, double Y) { return X == Y; }


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
double _ZL3maxdd(double, double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaSetupArgument(uint8_t*, uint64_t, uint64_t);
uint32_t cudaLaunch(uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((noinline));
void _ZL10init_arrayiPdS_S_(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaMemcpy(uint8_t*, uint8_t*, uint64_t, uint32_t);
void _ZL6kerneliPdS_S_(uint32_t, double*, double*, double*) __ATTRIBUTELIST__((noinline));
void _ZL11print_arrayiPd(uint32_t, double*) __ATTRIBUTELIST__((noinline));
uint32_t _ZL10num_blocksii(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t cudaConfigureCall(uint64_t, uint32_t, uint64_t, uint32_t, uint64_t, void*);
uint32_t cudaMalloc(uint8_t**, uint64_t);
double fmax(double, double);
void _Z16kernel_max_scoreiPdS_S_i_OC_1(uint32_t, double*, double*, double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

double _ZL3maxdd(double a, double b) {
  double _1;

  _1 = fmax(a, b);
  return _1;
}


int main(int argc, char ** argv) {
  int32_t dump_code;
  int32_t n;
  uint8_t* table;
  uint8_t* oldtable;
  uint8_t* seq;
  int32_t call26;
  int32_t call37;

  dump_code = atoi(argv[1]);
  n = atoi(argv[2]);
  table = malloc(n * n * 8);
  oldtable = malloc(n * n * 8);
  seq = malloc(n * 8);
  _ZL10init_arrayiPdS_S_(n, ((double*)table), ((double*)oldtable), ((double*)seq));
;
#pragma omp target data map(to: oldtable[0:n * n * 8], seq[0:n * 8]) map(tofrom: table[0:n * n * 8])
{
  _ZL6kerneliPdS_S_(n, ((double*)seq), ((double*)table), ((double*)oldtable));
;

}
  if (dump_code == 1) {
_ZL11print_arrayiPd(n, ((double*)table));
  }
free(((uint8_t*)((double*)table)));
free(((uint8_t*)((double*)oldtable)));
free(((uint8_t*)((double*)seq)));
  return 0;
}


void _ZL10init_arrayiPdS_S_(uint32_t n, double* table, double* oldtable, double* seq) {
  int64_t i;
  uint64_t j;

#pragma omp parallel
{
#pragma omp for //collapse(2)
for(int64_t i = 0; i < n;   ++i){
  seq[i] = ((double)(i) / (double)(n));

for(int64_t j = 0; j < n;   ++j){
  table[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
  oldtable[(i * n + j)] = (((double)(i) * (double)(j)) / (double)(n));
}
}
//#pragma omp for
//for(int64_t i = 0; i < n;   ++i){
//  seq[i] = ((double)(i) / (double)(n));
//}
}
  return;
}


void _ZL6kerneliPdS_S_(uint32_t n, double* seq, double* table, double* oldtable) {
  struct l_struct_struct_OC_dim3 agg_2e_tmp;    /* Address-exposed local */
  struct l_struct_struct_OC_dim3 agg_2e_tmp1;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct l_unnamed_1 agg_2e_tmp1_2e_coerce;    /* Address-exposed local */
  int32_t w;
  uint32_t j;
  uint32_t k;


for(int32_t w = n; w < (2 * n - 1);   ++w){
  uint32_t call = _ZL10num_blocksii(n, 16);
#pragma omp target teams distribute thread_limit(16)// parallel for collapse(2) thread_limit(1024)

for(int32_t j = 0; j < call;   ++j){
#pragma omp parallel for

for(int32_t k = 0; k < 16;   ++k){
_Z16kernel_max_scoreiPdS_S_i_OC_1(n, seq, table, oldtable, w, call, 16, j, k);
}
}
}
  return;
}


void _ZL11print_arrayiPd(uint32_t n, double* table) {
  int64_t i;
  uint64_t j;
  int32_t call11;


for(int64_t i = 0; i < n;   ++i){

for(int64_t j = 0; j < n;   ++j){
  uint32_t call = fprintf(stderr, _OC_str, table[(i * n + j)]);
  if ((int)(i * n + j) % (int)20 == 0) {
  fprintf(stderr, _OC_str_OC_1);
  }
}
}
  fprintf(stderr, _OC_str_OC_1);
}


uint32_t _ZL10num_blocksii(uint32_t num, uint32_t factor) {
  return ((num + factor) - 1) / factor;
}


void _Z16kernel_max_scoreiPdS_S_i_OC_1(uint32_t n, double* seq, double* table, double* oldtable, uint32_t w, uint32_t gridDim_2e_x, uint32_t blockDim_2e_x, uint32_t blockIdx_2e_x, uint32_t threadIdx_2e_x) {
  uint32_t mul;
  int64_t j;
  int64_t i;
  double maximum;
  double upd;
  int64_t k;

  mul = blockDim_2e_x * blockIdx_2e_x;
  j = mul + threadIdx_2e_x;
  i = ((n - 1) + j - w);
  if (0 <= i) {
  if (i < n) {
  if (i + 1 <= j) {
  if (j < n) {
  if ((j - 1) >= 0) {
  maximum = _ZL3maxdd(maximum, table[(i * n + (j - 1))]);
  }
  if (i + 1 < n) {
  maximum = _ZL3maxdd(maximum, table[((i + 1) * n + j)]);
  }
  if ((j - 1) >= 0) {
  if (i + 1 < n) {
  if (i < (j - 1)) {
  upd = (upd + (llvm_fcmp_oeq((seq[i] + seq[j]), 3) ? 1 : 0));
  maximum = _ZL3maxdd(maximum, upd);
  }
  maximum = _ZL3maxdd(maximum, upd);
  }
  }

for(int64_t k = (threadIdx_2e_x + n + mul - w); k < j;   ++k){
  maximum = _ZL3maxdd(maximum, (table[(i * n + k)] + table[((k + 1) * n + j)]));
}
  table[(i * n + j)] = maximum;
  }
  }
  }
  }
  return;
}

