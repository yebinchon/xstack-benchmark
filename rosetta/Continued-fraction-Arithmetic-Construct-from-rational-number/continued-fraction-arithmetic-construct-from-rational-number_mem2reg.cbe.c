/* Provide Declarations */
#include <stdint.h>
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

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
#endif



/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC_fraction;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_fraction {
  uint32_t field0;
  uint32_t field1;
};
struct l_array_6_struct_AC_l_struct_struct_OC_fraction {
  struct l_struct_struct_OC_fraction array[6];
};
struct l_array_4_struct_AC_l_struct_struct_OC_fraction {
  struct l_struct_struct_OC_fraction array[4];
};
struct l_array_8_struct_AC_l_struct_struct_OC_fraction {
  struct l_struct_struct_OC_fraction array[8];
};
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t r2cf(uint32_t*, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_6_struct_AC_l_struct_struct_OC_fraction examples __attribute__((aligned(16))) = { { { 1, 2 }, { 3, 1 }, { 23, 8 }, { 13, 11 }, { 22, 7 }, { -151, 77 } } };
__MSALIGN__(16) struct l_array_4_struct_AC_l_struct_struct_OC_fraction sqrt2 __attribute__((aligned(16))) = { { { 14142, 10000 }, { 141421, 100000 }, { 1414214, 1000000 }, { 14142136, 10000000 } } };
__MSALIGN__(16) struct l_array_8_struct_AC_l_struct_struct_OC_fraction pi __attribute__((aligned(16))) = { { { 31, 10 }, { 314, 100 }, { 3142, 1000 }, { 31428, 10000 }, { 314285, 100000 }, { 3142857, 1000000 }, { 31428571, 10000000 }, { 314285714, 100000000 } } };
static struct l_array_23_uint8_t _OC_str = { "Running the examples :" };
static struct l_array_22_uint8_t _OC_str_OC_1 = { "\nFor N = %d, D = %d :" };
static struct l_array_5_uint8_t _OC_str_OC_2 = { " %d " };
static struct l_array_20_uint8_t _OC_str_OC_3 = { "\n\nRunning for %c2 :" };
static struct l_array_19_uint8_t _OC_str_OC_4 = { "\n\nRunning for %c :" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
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

uint32_t r2cf(uint32_t* llvm_cbe_numerator, uint32_t* llvm_cbe_denominator) {
  uint32_t _1;
  uint32_t _2;
  uint32_t quotient;
  uint32_t temp;
  uint32_t _3;
  uint32_t _4;
  uint32_t quotient__PHI_TEMPORARY;

  ;
  ;
  ;
  if ((((llvm_cbe_denominator != ((uint32_t*)/*NULL*/0))&1))) {
  _1 = *llvm_cbe_numerator;
  _2 = *llvm_cbe_denominator;
  quotient = llvm_sdiv_u32(_1, _2);
  ;
  temp = *llvm_cbe_numerator;
  ;
  _3 = *llvm_cbe_denominator;
  *llvm_cbe_numerator = _3;
  _4 = *llvm_cbe_denominator;
  *llvm_cbe_denominator = (llvm_srem_u32(temp, _4));
  quotient__PHI_TEMPORARY = quotient;   /* for PHI node */

    quotient__PHI_TEMPORARY = quotient;   /* for PHI node */
  quotient = quotient__PHI_TEMPORARY;
  ;
  return quotient;
}
  quotient = quotient__PHI_TEMPORARY;
  ;
  return quotient;
}


int main(void) {
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _5;
  uint32_t _6;
  uint32_t llvm_cbe_call4;
  uint32_t _7;
  uint32_t llvm_cbe_call16;
  uint32_t llvm_cbe_call17;
  uint32_t llvm_cbe_call18;
  uint32_t _8;
  uint32_t _9;
  uint32_t llvm_cbe_call30;
  uint32_t _10;
  uint32_t llvm_cbe_call44;
  uint32_t llvm_cbe_call45;
  uint32_t llvm_cbe_call50;
  uint32_t _11;
  uint32_t _12;
  uint32_t llvm_cbe_call62;
  uint32_t _13;
  uint32_t llvm_cbe_call76;
  uint32_t llvm_cbe_call77;

  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_conv;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)i);
while (((uint64_t)llvm_cbe_conv) < ((uint64_t)UINT64_C(6))){
  _5 = *((&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field0));
  _6 = *((&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
  llvm_cbe_call4 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _5, _6);

  uint64_t llvm_cbe_idxprom5;
  struct l_struct_struct_OC_fraction* llvm_cbe_arrayidx6;
  uint32_t* llvm_cbe_den7;
  llvm_cbe_idxprom5 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx6 = (&examples.array[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_den7 = (&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1);
  _7 = *((&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
while (_7 != 0u){
  llvm_cbe_call16 = r2cf(((&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field0)), ((&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1)));
  llvm_cbe_call17 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call16);

  llvm_cbe_idxprom5 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx6 = (&examples.array[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_den7 = (&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1);
  _7 = *((&((&examples.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv = ((int64_t)(int32_t)i);
}
  llvm_cbe_call18 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), 251);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_conv20;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv20 = ((int64_t)(int32_t)i);
while (((uint64_t)llvm_cbe_conv20) < ((uint64_t)UINT64_C(4))){
  _8 = *((&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field0));
  _9 = *((&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
  llvm_cbe_call30 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _8, _9);

  uint64_t llvm_cbe_idxprom32;
  struct l_struct_struct_OC_fraction* llvm_cbe_arrayidx33;
  uint32_t* llvm_cbe_den34;
  llvm_cbe_idxprom32 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx33 = (&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_den34 = (&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1);
  _10 = *((&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
while (_10 != 0u){
  llvm_cbe_call44 = r2cf(((&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field0)), ((&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1)));
  llvm_cbe_call45 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call44);

  llvm_cbe_idxprom32 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx33 = (&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_den34 = (&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1);
  _10 = *((&((&sqrt2.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv20 = ((int64_t)(int32_t)i);
}
  llvm_cbe_call50 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), 227);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_conv52;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv52 = ((int64_t)(int32_t)i);
while (((uint64_t)llvm_cbe_conv52) < ((uint64_t)UINT64_C(8))){
  _11 = *((&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field0));
  _12 = *((&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
  llvm_cbe_call62 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _11, _12);

  uint64_t llvm_cbe_idxprom64;
  struct l_struct_struct_OC_fraction* llvm_cbe_arrayidx65;
  uint32_t* llvm_cbe_den66;
  llvm_cbe_idxprom64 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx65 = (&pi.array[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_den66 = (&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1);
  _13 = *((&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
while (_13 != 0u){
  llvm_cbe_call76 = r2cf(((&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field0)), ((&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1)));
  llvm_cbe_call77 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call76);

  llvm_cbe_idxprom64 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx65 = (&pi.array[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_den66 = (&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1);
  _13 = *((&((&pi.array[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_conv52 = ((int64_t)(int32_t)i);
}
  return 0;
}

