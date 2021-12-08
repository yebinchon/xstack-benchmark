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

/* Function definitions */

/* Types Definitions */
struct l_array_4_uint32_t {
  uint32_t array[4];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_5_uint32_t {
  uint32_t array[5];
};
struct l_array_10_struct_AC_l_array_5_uint32_t {
  struct l_array_5_uint32_t array[10];
};
struct l_array_10_uint32_t {
  uint32_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
void _mdr(uint32_t*, uint32_t*, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_4_uint32_t __const_OC_main_OC_values __attribute__((aligned(16))) = { { 123321, 7739, 893, 899998 } };
static struct l_array_21_uint8_t _OC_str = { "Number    MDR    MP\n" };
static struct l_array_17_uint8_t _OC_str_OC_1 = { "%6d   %3d   %3d\n" };
static struct l_array_16_uint8_t _OC_str_OC_2 = { "\nMDR: [n0..n4]\n" };
static struct l_array_7_uint8_t _OC_str_OC_3 = { "%3d: [" };
static struct l_array_5_uint8_t _OC_str_OC_4 = { "%d%s" };
static struct l_array_3_uint8_t _OC_str_OC_5 = { ", " };
static struct l_array_1_uint8_t _OC_str_OC_6;
static struct l_array_3_uint8_t _OC_str_OC_7 = { "]\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_sdiv_u64(int64_t a, int64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_srem_u64(int64_t a, int64_t b) {
  uint64_t r = a % b;
  return r;
}


/* Function Bodies */

void _mdr(uint32_t* llvm_cbe_rmdr, uint32_t* llvm_cbe_rmp, uint64_t llvm_cbe_n) {
  uint64_t _1;
  uint32_t r;
  uint64_t n;
  uint64_t n__PHI_TEMPORARY;
  uint32_t r__PHI_TEMPORARY;
  uint32_t _2;

  ;
  ;
  ;
  _1 = ((uint64_t)(bool)(((llvm_cbe_n != UINT64_C(0))&1)));
  r = llvm_select_u32((((llvm_cbe_n != UINT64_C(0))&1)), 1, 0);
  ;
  n__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
while (n != UINT64_C(0)){
  r = ((uint32_t)(llvm_mul_u64((((int64_t)(int32_t)r)), (llvm_srem_u64(n, 10)))));
  ;
  n = llvm_sdiv_u64(n, 10);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
}
  _2 = *llvm_cbe_rmp;
  *llvm_cbe_rmp = (llvm_add_u32(_2, 1));
  if ((((((int32_t)r) >= ((int32_t)10u))&1))) {
  _mdr(llvm_cbe_rmdr, llvm_cbe_rmp, (((int64_t)(int32_t)r)));

  } else {
  *llvm_cbe_rmdr = r;

}
  return;
}


int main(void) {
  uint32_t llvm_cbe_vmdr;    /* Address-exposed local */
  uint32_t llvm_cbe_vmp;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_uint32_t llvm_cbe_values __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_struct_AC_l_array_5_uint32_t llvm_cbe_table __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_10_uint32_t llvm_cbe_tfill __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _3;
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t llvm_cbe_call3;
  uint8_t* _8;
  uint8_t* _9;
  uint32_t total;
  uint32_t total__PHI_TEMPORARY;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t _14;
  uint32_t llvm_cbe_call26;
  uint32_t llvm_cbe_call31;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t _15;
  uint64_t _16;
  uint32_t llvm_cbe_call42;
  uint32_t llvm_cbe_call46;

  ;
  ;
  ;
  _3 = memcpy((((uint8_t*)(&llvm_cbe_values))), ((uint8_t*)(&__const_OC_main_OC_values)), 16);
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)4u)){

  llvm_cbe_vmp = 0;
  _4 = *((&llvm_cbe_values.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _mdr((&llvm_cbe_vmdr), (&llvm_cbe_vmp), (((int64_t)(int32_t)_4)));

  _5 = *((&llvm_cbe_values.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _6 = llvm_cbe_vmdr;
  _7 = llvm_cbe_vmp;
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _5, _6, _7);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  _8 = memset((((uint8_t*)(&llvm_cbe_table))), 0, 200);
  ;
  _9 = memset((((uint8_t*)(&llvm_cbe_tfill))), 0, 40);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  total__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  total = total__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)total) < ((int32_t)50u)){

  llvm_cbe_vmp = 0;
  _mdr((&llvm_cbe_vmdr), (&llvm_cbe_vmp), (((int64_t)(int32_t)i)));

  _10 = llvm_cbe_vmdr;
  _11 = *((&llvm_cbe_tfill.array[((int64_t)(((int64_t)(int32_t)_10)))]));
  if ((((((int32_t)_11) < ((int32_t)5u))&1))) {
  _12 = llvm_cbe_vmdr;
  _13 = llvm_cbe_vmdr;
  llvm_cbe_arrayidx18 = (&llvm_cbe_tfill.array[((int64_t)(((int64_t)(int32_t)_13)))]);
  _14 = *llvm_cbe_arrayidx18;
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_14, 1));
  *((&(*((&llvm_cbe_table.array[((int64_t)(((int64_t)(int32_t)_12)))]))).array[((int64_t)(((int64_t)(int32_t)_14)))])) = i;
  total = llvm_add_u32(total, 1);
  ;
  total__PHI_TEMPORARY = total;   /* for PHI node */

}
  total = total__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  total__PHI_TEMPORARY = total;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  total = total__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call26 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)10u)){
  llvm_cbe_call31 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), i);
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)5u)){
  _15 = *((&(*((&llvm_cbe_table.array[((int64_t)(((int64_t)(int32_t)i)))]))).array[((int64_t)(((int64_t)(int32_t)j)))]));
  _16 = ((uint64_t)(bool)(((j != 4u)&1)));
  llvm_cbe_call42 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _15, (llvm_select_pu8((((j != 4u)&1)), ((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_6.array[((int64_t)0)])))));

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call46 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

