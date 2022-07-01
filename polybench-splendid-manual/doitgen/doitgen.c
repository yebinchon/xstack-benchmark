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
struct l_struct_struct_OC_ident_t;
struct l_struct_struct_OC__IO_FILE;
struct l_unnamed_1;

/* Function definitions */
typedef void l_fptr_1(uint32_t*, uint32_t*, ...);


/* Types Definitions */
struct l_struct_struct_OC_ident_t {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint8_t* field4;
};
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
struct l_unnamed_1 {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  double* field3;
  double* field4;
  double* field5;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
static void kernel_doitgen_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
static __forceinline uint64_t llvm_ashr_u64(int64_t a, int64_t b) {
  uint64_t r = a >> b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  struct l_unnamed_1 _polly_2e_par_2e_userContext_2e_i;    /* Address-exposed local */
  uint64_t dump_code;
  uint64_t nr;
  uint64_t nq;
  uint64_t np;
  uint64_t _mul;
  uint64_t _mul8;
  uint8_t* A;
  uint8_t* sum;
  uint8_t* C4;
  uint64_t _1;
  uint64_t i;
  int64_t j;
  double _mul_2e_i;
  int64_t k;
  uint64_t _2;
  uint32_t _call_2e_i84;
  uint32_t _fputc35_2e_i;
  uint32_t _fputc_2e_i;

  dump_code = strtol(_argv[1], ((uint8_t**)0), 10);
;
  nr = strtol(_argv[2], ((uint8_t**)0), 10);
;
  nq = strtol(_argv[3], ((uint8_t**)0), 10);
;
  np = strtol(_argv[4], ((uint8_t**)0), 10);
;
  _mul = (nr << 32);
  _mul8 = _mul * nq * np >> 29;
  A = malloc(_mul8);
;
  sum = malloc(_mul8);
;
  C4 = malloc((np << 3) * np & 34359738360);
;
  _1 = np * nq;
#pragma omp parallel for
for(uint64_t i = 0; i!=nr;  i = i + 1){
for(uint64_t j = 0; j!=nq;  j = j + 1){
  _mul_2e_i = (double)(i) * (double)(j);
for(uint64_t k = 0; k!=np;  k = k + 1){
  ((((double*)A)+_1 * i)+j * np)[k] = (_mul_2e_i + (double)(k)) / (double)(np);
}
}
}
#pragma omp parallel for
for(uint64_t i = 0; i!=np;  i = i + 1){
for(uint64_t j = 0; j!=np;  j = j + 1){
  (((double*)C4)+i * np)[j] = (double)(i) * (double)(j) / (double)(np);
}
}
  #pragma omp parallel 
{
uint64_t _3 = (_mul + -4294967296 >> 32) + 1;

  uint64_t _reass_2e_mul = (np << 3);
#pragma omp for
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(_3 - 1);_polly_2e_indvar+=1){
  uint64_t _4 = _polly_2e_indvar * nq;
for(uint64_t _polly_2e_indvar4 = 0; _polly_2e_indvar4!=nq;  _polly_2e_indvar4 = _polly_2e_indvar4 + 1){
  uint64_t _5 = _reass_2e_mul * (_polly_2e_indvar4 + _4);
for(uint64_t _polly_2e_indvar12 = 0; _polly_2e_indvar12!=np;  _polly_2e_indvar12 = _polly_2e_indvar12 + 1){
  *((double*)((sum+_5)+(_polly_2e_indvar12 << 3))) = 0;
  double __p_scalar_57 = 0;
for(uint64_t _polly_2e_indvar22 = 0; _polly_2e_indvar22!=np;  _polly_2e_indvar22 = _polly_2e_indvar22 + 1){
  __p_scalar_57 = (__p_scalar_57 + *((double*)((A+_5)+(_polly_2e_indvar22 << 3))) * (((double*)C4)+_polly_2e_indvar12)[_polly_2e_indvar22 * np]);
}
  *((double*)((sum+_5)+(_polly_2e_indvar12 << 3))) = __p_scalar_57;
}
for(uint64_t _polly_2e_indvar41 = 0; _polly_2e_indvar41!=np;  _polly_2e_indvar41 = _polly_2e_indvar41 + 1){
  uint64_t _6 = (_polly_2e_indvar41 << 3);
  *((uint64_t*)((A+_5)+_6)) = *((uint64_t*)((sum+_5)+_6));
}
}
}
}
  if (dump_code == 1) {
  _2 = np * nq;
for(uint64_t i = 0; i!=nr;  i = i + 1){
for(uint64_t j = 0; j!=nq;  j = j + 1){
for(uint64_t k = 0; k!=np;  k = k + 1){
  _call_2e_i84 = fprintf(stderr, (_OC_str), ((((double*)A)+_2 * i)+j * np)[k]);
;
  if (i % 20 == 0) {
  _fputc35_2e_i = fputc(10, stderr);
;
}

}
}
}
  _fputc_2e_i = fputc(10, stderr);
;
free(A);
free(sum);
free(C4);
  return 0;
}

free(A);
free(sum);
free(C4);
  return 0;
}

