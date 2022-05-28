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
struct l_struct_struct_OC_ident_t;
struct l_unnamed_1;

/* Function definitions */
typedef void l_fptr_1(uint32_t*, uint32_t*, ...);


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
struct l_struct_struct_OC_ident_t {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint8_t* field4;
};
struct l_unnamed_1 {
  uint8_t* field0;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
static void main_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint16_t llvm_urem_u16(uint16_t a, uint16_t b) {
  uint16_t r = a % b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  struct l_unnamed_1 _polly_2e_par_2e_userContext;    /* Address-exposed local */
  uint64_t _call_2e_i;
  uint8_t* _call2;
  uint8_t* x;
  uint8_t* y;
  int64_t i;
  struct l_struct_struct_OC__IO_FILE* _1;
  uint32_t _i_2e_05_2e_i;
  uint32_t _call_2e_i48;
  uint32_t _fputc3_2e_i;
  uint32_t _inc_2e_i;
  uint32_t _fputc_2e_i;
  uint8_t* _2;
  uint64_t _polly_2e_indvar;
  uint64_t _polly_2e_indvar64;
  double __2e_phiops_2e_0;
  uint64_t _polly_2e_indvar70;
  int64_t _3;
  uint64_t _polly_2e_indvar82;
  int64_t _4;

  _call_2e_i = strtol((_argv[1]), ((uint8_t**)0), 10);
;
  _call2 = malloc(12800000000);
;
  x = malloc(320000);
;
  y = malloc(320000);
;
#pragma omp parallel for
for(_polly_2e_indvar = 0; _polly_2e_indvar<40000;  _polly_2e_indvar = (_polly_2e_indvar + 1)){
  *((double*)(x+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
}
  _polly_2e_par_2e_userContext.field0 = _call2;
  #pragma omp parallel

  main_polly_subfn(0, 40000, 1, (&_polly_2e_par_2e_userContext));
  _2 = memset(y, 0, 320000);
;
#pragma omp parallel for private(_polly_2e_indvar70, _3, _4, __2e_phiops_2e_0)
for(_polly_2e_indvar64 = 0; _polly_2e_indvar64<40000;  _polly_2e_indvar64 = (_polly_2e_indvar64 + 1)){
  __2e_phiops_2e_0 = 0;
for(_polly_2e_indvar70 = 0; _polly_2e_indvar70<40000;  _polly_2e_indvar70 = (_polly_2e_indvar70 + 1)){
  _3 = (_polly_2e_indvar70 << 3);
  __2e_phiops_2e_0 = (__2e_phiops_2e_0 + (*((double*)((_call2+_polly_2e_indvar64 * 320000)+_3))) * (*((double*)(x+_3))));
}
for(_polly_2e_indvar82 = 0; _polly_2e_indvar82<40000;  _polly_2e_indvar82 = (_polly_2e_indvar82 + 1)){
  _4 = (_polly_2e_indvar82 << 3);
  *((double*)(y+_4)) = ((*((double*)(y+_4))) + __2e_phiops_2e_0 * (*((double*)((_call2+_polly_2e_indvar64 * 320000)+_4))));
}
}
  if (_call_2e_i == 1) {
  _1 = (stderr);
for(i = 0; i!=40000;  i = (i + 1)){
  _call_2e_i48 = fprintf(_1, (_OC_str), (((double*)y)[i]));
;
  if (i % 20 == ((uint16_t)0)) {
  _fputc3_2e_i = fputc(10, (stderr));
;
}

}
  _fputc_2e_i = fputc(10, _1);
;
free(_call2);
free(x);
free(y);
  return 0;
}

free(_call2);
free(x);
free(y);
  return 0;
}


static void main_polly_subfn(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  uint64_t _polly_2e_indvar4;
  uint64_t _polly_2e_indvar;
#pragma omp for private( _polly_2e_indvar4)
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
for(_polly_2e_indvar4 = 0; _polly_2e_indvar4 < (39999 + 1);  _polly_2e_indvar4 = (_polly_2e_indvar4 + 1)){
  *((double*)(((*((uint8_t**)_polly_2e_kmpc_2e_shared))+_polly_2e_indvar * 320000)+(_polly_2e_indvar4 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar4 + 1)) / 4.0E+4;
}
}
  return;
}

