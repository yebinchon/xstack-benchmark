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
struct l_unnamed_2;
struct l_unnamed_3;

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
  double* field1;
  double* field2;
  double* field3;
  double* field4;
};
struct l_unnamed_2 {
  uint32_t field0;
  double* field1;
  double* field2;
};
struct l_unnamed_3 {
  uint32_t field0;
  double* field1;
  double* field2;
  double* field3;
  double* field4;
  double* field5;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
static void kernel_gemver_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_gemver_polly_subfn_4(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_gemver_polly_subfn_7(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_gemver_polly_subfn_10(uint64_t, uint64_t, uint64_t, uint8_t*);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };
static uint8_t _OC_str_OC_ident_OC_8[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident_OC_5[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident_OC_2[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_3 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_2) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_6 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_5) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_9 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_8) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  struct l_unnamed_1 _polly_2e_par_2e_userContext198_2e_i;    /* Address-exposed local */
  double _alpha_2e_s2a_2e_i;    /* Address-exposed local */
  struct l_unnamed_2 _polly_2e_par_2e_userContext193_2e_i;    /* Address-exposed local */
  struct l_unnamed_1 _polly_2e_par_2e_userContext188_2e_i;    /* Address-exposed local */
  double _beta_2e_s2a_2e_i;    /* Address-exposed local */
  struct l_unnamed_3 _polly_2e_par_2e_userContext_2e_i;    /* Address-exposed local */
  uint64_t dump_code;
  uint8_t* A;
  uint8_t* u1;
  uint8_t* v1;
  uint8_t* u2;
  uint8_t* v2;
  uint8_t* w;
  uint8_t* x;
  uint8_t* y;
  uint8_t* z;
  uint8_t* _1;
  uint8_t* _2;
  int64_t i;
  int64_t j;
  uint32_t _call_2e_i99;
  uint32_t _fputc_2e_i;

  dump_code = strtol((_argv[1]), ((uint8_t**)0), 10);
;
  A = malloc(7200000000);
;
  u1 = malloc(240000);
;
  v1 = malloc(240000);
;
  u2 = malloc(240000);
;
  v2 = malloc(240000);
;
  w = malloc(240000);
;
  x = malloc(240000);
;
  y = malloc(240000);
;
  z = malloc(240000);
;
  _1 = memset(x, 0, 240000);
;
  _2 = memset(w, 0, 240000);
;
#pragma omp parallel for
for(i = 0; i<30000;  i = (i + 1)){
  ((double*)u1)[i] = (double)(i);
  ((double*)u2)[i] = (double)((i + 1) / 30000) * 0.5;
  ((double*)v1)[i] = (double)((i + 1) / 30000) * 0.25;
  ((double*)v2)[i] = (double)((i + 1) / 30000) / 6;
  ((double*)y)[i] = (double)((i + 1) / 30000) * 0.125;
  ((double*)z)[i] = (double)((i + 1) / 30000) / 9;
for(j = 0; j<30000;  j = (j + 1)){
  (((double*)A)+i * 30000)[j] = (double)(i) * (double)(j) / 3.0E+4;
}
}
  _beta_2e_s2a_2e_i = 12313;
  _alpha_2e_s2a_2e_i = 43532;
  _polly_2e_par_2e_userContext_2e_i.field0 = 30000;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field1) = A;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field2) = u1;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field3) = v1;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field4) = u2;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field5) = v2;
  #pragma omp parallel

  kernel_gemver_polly_subfn(0, 30000, 1, (&_polly_2e_par_2e_userContext_2e_i));
  _polly_2e_par_2e_userContext188_2e_i.field0 = 30000;
  *((uint8_t**)&_polly_2e_par_2e_userContext188_2e_i.field1) = x;
  *((uint8_t**)&_polly_2e_par_2e_userContext188_2e_i.field2) = A;
  _polly_2e_par_2e_userContext188_2e_i.field3 = (&_beta_2e_s2a_2e_i);
  *((uint8_t**)&_polly_2e_par_2e_userContext188_2e_i.field4) = y;
  #pragma omp parallel

  kernel_gemver_polly_subfn_4(0, 30000, 1, (&_polly_2e_par_2e_userContext188_2e_i));
  _polly_2e_par_2e_userContext193_2e_i.field0 = 30000;
  *((uint8_t**)&_polly_2e_par_2e_userContext193_2e_i.field1) = x;
  *((uint8_t**)&_polly_2e_par_2e_userContext193_2e_i.field2) = z;
  #pragma omp parallel

  kernel_gemver_polly_subfn_7(0, 30000, 1, (&_polly_2e_par_2e_userContext193_2e_i));
  _polly_2e_par_2e_userContext198_2e_i.field0 = 30000;
  *((uint8_t**)&_polly_2e_par_2e_userContext198_2e_i.field1) = w;
  *((uint8_t**)&_polly_2e_par_2e_userContext198_2e_i.field2) = A;
  _polly_2e_par_2e_userContext198_2e_i.field3 = (&_alpha_2e_s2a_2e_i);
  *((uint8_t**)&_polly_2e_par_2e_userContext198_2e_i.field4) = x;
  #pragma omp parallel

  kernel_gemver_polly_subfn_10(0, 30000, 1, (&_polly_2e_par_2e_userContext198_2e_i));
  if (dump_code == 1) {
for(i = 0; i!=30000;  i = (i + 1)){
  _call_2e_i99 = fprintf((stderr), (_OC_str), (((double*)w)[i]));
;
  if (i % 20 == 0) {
  _fputc_2e_i = fputc(10, (stderr));
;
}

}
free(A);
free(u1);
free(v1);
free(u2);
free(v2);
free(w);
free(x);
free(y);
free(z);
  return 0;
}

free(A);
free(u1);
free(v1);
free(u2);
free(v2);
free(w);
free(x);
free(y);
free(z);
  return 0;
}


static void kernel_gemver_polly_subfn(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _polly_2e_indvar;
  int64_t _polly_2e_indvar4;
#pragma omp for private( _polly_2e_indvar4)
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
for(_polly_2e_indvar4 = 0; _polly_2e_indvar4!=((int64_t)(int32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared)));  _polly_2e_indvar4 = (_polly_2e_indvar4 + 1)){
  ((*((double**)(_polly_2e_kmpc_2e_shared+8)))+_polly_2e_indvar * ((uint64_t)(uint32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared))))[_polly_2e_indvar4] = (((((*((double**)(_polly_2e_kmpc_2e_shared+8)))+_polly_2e_indvar * ((uint64_t)(uint32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared))))[_polly_2e_indvar4]) + ((*((double**)(_polly_2e_kmpc_2e_shared+16)))[_polly_2e_indvar]) * ((*((double**)(_polly_2e_kmpc_2e_shared+24)))[_polly_2e_indvar4])) + ((*((double**)(_polly_2e_kmpc_2e_shared+32)))[_polly_2e_indvar]) * ((*((double**)(_polly_2e_kmpc_2e_shared+40)))[_polly_2e_indvar4]));
}
}
  return;
}


static void kernel_gemver_polly_subfn_4(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _polly_2e_indvar4;
  double __p_scalar_;
  int64_t _polly_2e_indvar;
#pragma omp for private( __p_scalar_, _polly_2e_indvar4)
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
  __p_scalar_ = ((*((double**)(_polly_2e_kmpc_2e_shared+8)))[_polly_2e_indvar]);
for(_polly_2e_indvar4 = 0; _polly_2e_indvar4!=((int64_t)(int32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared)));  _polly_2e_indvar4 = (_polly_2e_indvar4 + 1)){
  __p_scalar_ = (__p_scalar_ + (*(*((double**)(_polly_2e_kmpc_2e_shared+24)))) * (((*((double**)(_polly_2e_kmpc_2e_shared+16)))+_polly_2e_indvar)[_polly_2e_indvar4 * ((uint64_t)(uint32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared)))]) * ((*((double**)(_polly_2e_kmpc_2e_shared+32)))[_polly_2e_indvar4]));
  (*((double**)(_polly_2e_kmpc_2e_shared+8)))[_polly_2e_indvar] = __p_scalar_;
}
}
  return;
}


static void kernel_gemver_polly_subfn_7(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _polly_2e_indvar;
#pragma omp for
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
  (*((double**)(_polly_2e_kmpc_2e_shared+8)))[_polly_2e_indvar] = (((*((double**)(_polly_2e_kmpc_2e_shared+8)))[_polly_2e_indvar]) + ((*((double**)(_polly_2e_kmpc_2e_shared+16)))[_polly_2e_indvar]));
}
  return;
}


static void kernel_gemver_polly_subfn_10(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _polly_2e_indvar4;
  double __p_scalar_;
  int64_t _polly_2e_indvar;
#pragma omp for private( _polly_2e_indvar4, __p_scalar_)
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
  __p_scalar_ = ((*((double**)(_polly_2e_kmpc_2e_shared+8)))[_polly_2e_indvar]);
for(_polly_2e_indvar4 = 0; _polly_2e_indvar4!=((int64_t)(int32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared)));  _polly_2e_indvar4 = (_polly_2e_indvar4 + 1)){
  __p_scalar_ = (__p_scalar_ + (*(*((double**)(_polly_2e_kmpc_2e_shared+24)))) * (((*((double**)(_polly_2e_kmpc_2e_shared+16)))+_polly_2e_indvar * ((uint64_t)(uint32_t)(*((uint32_t*)_polly_2e_kmpc_2e_shared))))[_polly_2e_indvar4]) * ((*((double**)(_polly_2e_kmpc_2e_shared+32)))[_polly_2e_indvar4]));
  (*((double**)(_polly_2e_kmpc_2e_shared+8)))[_polly_2e_indvar] = __p_scalar_;
}
}
  return;
}

