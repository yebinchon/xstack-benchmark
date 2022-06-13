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
  uint8_t* field1;
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
  uint8_t* s;
  uint8_t* q;
  uint8_t* p;
  uint8_t* _call14;
  int64_t i;
  uint32_t _i_2e_010_2e_i;
  uint32_t _call_2e_i58;
  uint32_t _fputc6_2e_i;
  uint32_t _inc_2e_i;
  struct l_struct_struct_OC__IO_FILE* _1;
  uint32_t _i_2e_19_2e_i;
  uint32_t _call8_2e_i;
  uint32_t _fputc3_2e_i;
  uint32_t _inc15_2e_i;
  uint32_t _fputc_2e_i;
  uint8_t* _2;
  uint64_t _polly_2e_indvar;
  int64_t _polly_2e_indvar77;
  double _polly_2e_access_2e_call890_2e_reload;
  uint64_t _polly_2e_indvar86;
  int64_t _3;

  _call_2e_i = strtol(_argv[1], ((uint8_t**)0), 10);
;
  _call2 = malloc(12800000000);
;
  s = malloc(320000);
;
  q = malloc(320000);
;
  p = malloc(320000);
;
  _call14 = malloc(320000);
;
#pragma omp parallel for
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<40000;  _polly_2e_indvar = _polly_2e_indvar + 1){
  *((double*)(p+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
}
  #pragma omp parallel 
{

#pragma omp for
for(uint64_t _polly_2e_indvar = 0; _polly_2e_indvar<=(40000 - 1);_polly_2e_indvar+=1){
  *((double*)(_call14+(_polly_2e_indvar << 3))) = (double)(_polly_2e_indvar) * 3.1415926535897931;
for(uint64_t _polly_2e_indvar5 = 0; _polly_2e_indvar5 < (39999 + 1);  _polly_2e_indvar5 = _polly_2e_indvar5 + 1){
  *((double*)((_call2+_polly_2e_indvar * 320000)+(_polly_2e_indvar5 << 3))) = (double)(_polly_2e_indvar) * (double)((_polly_2e_indvar5 + 1)) / 4.0E+4;
}
}
}
  _2 = memset(s, 0, 320000);
;
#pragma omp parallel for private(_polly_2e_access_2e_call890_2e_reload, _3)
for(uint64_t _polly_2e_indvar77 = 0; _polly_2e_indvar77<40000;  _polly_2e_indvar77 = _polly_2e_indvar77 + 1){
  ((double*)q)[_polly_2e_indvar77] = 0;
  _polly_2e_access_2e_call890_2e_reload = 0;
for(uint64_t _polly_2e_indvar86 = 0; _polly_2e_indvar86<40000;  _polly_2e_indvar86 = _polly_2e_indvar86 + 1){
  _3 = (_polly_2e_indvar86 << 3);
  *((double*)(s+_3)) = (*((double*)(s+_3)) + ((double*)_call14)[_polly_2e_indvar77] * *((double*)((_call2+_polly_2e_indvar77 * 320000)+_3)));
  _polly_2e_access_2e_call890_2e_reload = (_polly_2e_access_2e_call890_2e_reload + *((double*)((_call2+_polly_2e_indvar77 * 320000)+_3)) * *((double*)(p+_3)));
}
  ((double*)q)[_polly_2e_indvar77] = _polly_2e_access_2e_call890_2e_reload;
}
  if (_call_2e_i == 1) {
for(uint64_t i = 0; i!=40000;  i = i + 1){
  _call_2e_i58 = fprintf(stderr, (_OC_str), ((double*)s)[i]);
;
  if (i % 20 == ((uint16_t)0)) {
  _fputc6_2e_i = fputc(10, stderr);
;
}

}
  _1 = stderr;
for(uint64_t i = 0; i!=40000;  i = i + 1){
  _call8_2e_i = fprintf(_1, (_OC_str), ((double*)q)[i]);
;
  if (i % 20 == ((uint16_t)0)) {
  _fputc3_2e_i = fputc(10, stderr);
;
}

}
  _fputc_2e_i = fputc(10, _1);
;
free(_call2);
free(s);
free(q);
free(p);
free(_call14);
  return 0;
}

free(_call2);
free(s);
free(q);
free(p);
free(_call14);
  return 0;
}

