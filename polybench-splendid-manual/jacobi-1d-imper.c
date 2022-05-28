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
  uint64_t field2;
  double* field3;
  double* field4;
};

/* External Global Variable Declarations */

/* Function Declarations */
void kernel_jacobi_1d_imper(uint32_t, uint32_t, double*, double*) __ATTRIBUTELIST__((nothrow));
static void kernel_jacobi_1d_imper_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);
static void kernel_jacobi_1d_imper_polly_subfn_4(uint64_t, uint64_t, uint64_t, uint8_t*);
int main(int, char **) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str_OC_ident_OC_2[23] = { "Source location dummy." };
static uint8_t _OC_str_OC_ident[23] = { "Source location dummy." };
static uint8_t _OC_str[8] = { "%0.2lf " };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy = { 0, 0, 0, 0, (_OC_str_OC_ident) };
static struct l_struct_struct_OC_ident_t _OC_loc_OC_dummy_OC_3 = { 0, 0, 0, 0, (_OC_str_OC_ident_OC_2) };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}



static void kernel_jacobi_1d_imper_polly_subfn(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _polly_2e_indvar;
#pragma omp for
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
  ((*((double**)(_polly_2e_kmpc_2e_shared+24)))+1)[_polly_2e_indvar] = ((((*((double**)(_polly_2e_kmpc_2e_shared+16)))[_polly_2e_indvar]) + (((*((double**)(_polly_2e_kmpc_2e_shared+16)))+1)[_polly_2e_indvar])) + (((*((double**)(_polly_2e_kmpc_2e_shared+16)))+2)[_polly_2e_indvar])) * 0.33333000000000002;
}
  return;
}


static void kernel_jacobi_1d_imper_polly_subfn_4(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _polly_2e_indvar;
#pragma omp for
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
  *((uint64_t*)(((*((double**)(_polly_2e_kmpc_2e_shared+24)))+1)+_polly_2e_indvar)) = (*((uint64_t*)(((*((double**)(_polly_2e_kmpc_2e_shared+16)))+1)+_polly_2e_indvar)));
}
  return;
}


int main(int argc, char ** argv) {
  uint32_t _argc = (uint32_t)argc;
  uint8_t** _argv = (uint8_t**)argv;
  struct l_unnamed_1 _polly_2e_par_2e_userContext60_2e_i;    /* Address-exposed local */
  struct l_unnamed_1 _polly_2e_par_2e_userContext_2e_i;    /* Address-exposed local */
  uint64_t dump_code;
  uint8_t* A;
  uint8_t* B;
  int64_t i;
  uint64_t _polly_2e_indvar_2e_i;
  struct l_struct_struct_OC__IO_FILE* _2;
  uint32_t _call_2e_i27;
  uint32_t _fputc11_2e_i;
  uint32_t _fputc_2e_i;

  dump_code = strtol((_argv[1]), ((uint8_t**)0), 10);
;
  A = malloc(800000000);
;
  B = malloc(800000000);
;
#pragma omp parallel for
for(i = 0; i<100000000;  i = (i + 1)){
  ((double*)A)[i] = ((double)(i) + 2) / 1.0E+8;
  ((double*)B)[i] = ((double)(i) + 3) / 1.0E+8;
}
for(_polly_2e_indvar_2e_i = 0; _polly_2e_indvar_2e_i!=100;  _polly_2e_indvar_2e_i = (_polly_2e_indvar_2e_i + 1)){
  _polly_2e_par_2e_userContext_2e_i.field0 = 100;
  _polly_2e_par_2e_userContext_2e_i.field1 = 100000000;
  _polly_2e_par_2e_userContext_2e_i.field2 = _polly_2e_indvar_2e_i;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field3) = A;
  *((uint8_t**)&_polly_2e_par_2e_userContext_2e_i.field4) = B;
  #pragma omp parallel

  kernel_jacobi_1d_imper_polly_subfn(0, 99999998, 1, (&_polly_2e_par_2e_userContext_2e_i));
  _polly_2e_par_2e_userContext60_2e_i.field0 = 100;
  _polly_2e_par_2e_userContext60_2e_i.field1 = 100000000;
  _polly_2e_par_2e_userContext60_2e_i.field2 = _polly_2e_indvar_2e_i;
  *((uint8_t**)&_polly_2e_par_2e_userContext60_2e_i.field3) = B;
  *((uint8_t**)&_polly_2e_par_2e_userContext60_2e_i.field4) = A;
  #pragma omp parallel

  kernel_jacobi_1d_imper_polly_subfn_4(0, 99999998, 1, (&_polly_2e_par_2e_userContext60_2e_i));
}
  if (dump_code == 1) {
  _2 = (stderr);
for(i = 0; i!=100000000;  i = (i + 1)){
  _call_2e_i27 = fprintf(_2, (_OC_str), (((double*)A)[i]));
;
  if (i % 20 == 0) {
  _fputc11_2e_i = fputc(10, (stderr));
;
}

}
  _fputc_2e_i = fputc(10, _2);
;
free(A);
free(B);
  return 0;
}

free(A);
free(B);
  return 0;
}

