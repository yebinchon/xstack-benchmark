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
  uint8_t* field0;
  uint8_t* field1;
  uint8_t* field2;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
static void main_polly_subfn(uint64_t, uint64_t, uint64_t, uint8_t*);


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
  uint8_t* _call6;
  uint8_t* _call12;
  uint8_t* _call15;
  int64_t i;
  uint32_t _i_2e_02_2e_i;
  uint32_t _call_2e_i59;
  uint32_t _fputc_2e_i;
  uint32_t _inc_2e_i;
  int64_t _polly_2e_indvar;
  int64_t _1;
  uint64_t _polly_2e_indvar86;
  int64_t _2;
  double _polly_2e_access_2e_call1590_2e_reload;
  double _add_2e_i76_2e_phiops_2e_0;

  _call_2e_i = strtol((_argv[1]), ((uint8_t**)0), 10);
;
  _call2 = malloc(12800000000);
;
  _call6 = malloc(12800000000);
;
  _call12 = malloc(320000);
;
  _call15 = malloc(320000);
;
  _polly_2e_par_2e_userContext.field0 = _call12;
  _polly_2e_par_2e_userContext.field1 = _call2;
  _polly_2e_par_2e_userContext.field2 = _call6;
  #pragma omp parallel
{
  main_polly_subfn(0, 40000, 1, (&_polly_2e_par_2e_userContext));

#pragma omp for private(_1, _2, _add_2e_i76_2e_phiops_2e_0, _polly_2e_access_2e_call1590_2e_reload)
  {
for(_polly_2e_indvar = 0; _polly_2e_indvar<40000;  _polly_2e_indvar = (_polly_2e_indvar + 1)){

  ((double*)_call15)[_polly_2e_indvar] = 0;
  _1 = _polly_2e_indvar * 320000;
  _polly_2e_access_2e_call1590_2e_reload = 0;
  _add_2e_i76_2e_phiops_2e_0 = 0;
for(_polly_2e_indvar86 = 0; _polly_2e_indvar86<40000;  _polly_2e_indvar86 = (_polly_2e_indvar86 + 1)){
  _2 = (_polly_2e_indvar86 << 3);
  _add_2e_i76_2e_phiops_2e_0 = (_add_2e_i76_2e_phiops_2e_0 + (*((double*)((_call2+_1)+_2))) * (*((double*)(_call12+_2))));
  _polly_2e_access_2e_call1590_2e_reload = (_polly_2e_access_2e_call1590_2e_reload + (*((double*)(_call12+_2))) * (*((double*)((_call6+_1)+_2))));
}
  *((double*)(_call15+(_polly_2e_indvar << 3))) = (_add_2e_i76_2e_phiops_2e_0 * 43532 + _polly_2e_access_2e_call1590_2e_reload * 12313);
}
}
}
  if (_call_2e_i == 1) {
for(i = 0; i!=40000;  i = (i + 1)){
  _call_2e_i59 = fprintf((stderr), (_OC_str), (((double*)_call15)[i]));
;
  if (i % 20 == ((uint16_t)0)) {
  _fputc_2e_i = fputc(10, (stderr));
;
}

}
free(_call2);
free(_call6);
free(_call12);
free(_call15);
  return 0;
}

free(_call2);
free(_call6);
free(_call12);
free(_call15);
  return 0;
}


static void main_polly_subfn(uint64_t _polly_2e_kmpc_2e_lb, uint64_t _polly_2e_kmpc_2e_ub, uint64_t _polly_2e_kmpc_2e_inc, uint8_t* _polly_2e_kmpc_2e_shared) {
  int64_t _3;
  double _p_div9_2e_i;
  uint64_t _polly_2e_indvar;
  uint64_t _polly_2e_indvar5;
#pragma omp for private( _3, _polly_2e_indvar5, _p_div9_2e_i)
for(_polly_2e_indvar = _polly_2e_kmpc_2e_lb; _polly_2e_indvar<=(_polly_2e_kmpc_2e_ub - 1);_polly_2e_indvar+=1){
  *((double*)((*((uint8_t**)_polly_2e_kmpc_2e_shared))+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) / 4.0E+4;
  _3 = _polly_2e_indvar * 320000;
for(_polly_2e_indvar5 = 0; _polly_2e_indvar5 < (39999 + 1);  _polly_2e_indvar5 = (_polly_2e_indvar5 + 1)){
  _p_div9_2e_i = (double)(_polly_2e_indvar) * (double)(_polly_2e_indvar5) / 4.0E+4;
  *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+8)))+_3)+(_polly_2e_indvar5 << 3))) = _p_div9_2e_i;
  *((double*)(((*((uint8_t**)(_polly_2e_kmpc_2e_shared+16)))+_3)+(_polly_2e_indvar5 << 3))) = _p_div9_2e_i;
}
}
  return;
}

