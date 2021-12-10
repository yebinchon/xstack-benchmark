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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_40_uint8_t {
  uint8_t array[40];
};
struct l_array_37_uint8_t {
  uint8_t array[37];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t jos(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t jos_large(uint64_t, uint64_t, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t putchar(uint32_t);


/* Global Variable Definitions and Initialization */
static struct l_array_40_uint8_t _OC_str = { "n = %llu, k = %llu, final survivor: %d\n" };
static struct l_array_37_uint8_t _OC_str_OC_1 = { "n = %llu, k = %llu, three survivors:" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { " %llu" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_urem_u64(uint64_t a, uint64_t b) {
  uint64_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t jos(uint32_t llvm_cbe_n, uint32_t llvm_cbe_k, uint32_t llvm_cbe_m) {
  uint32_t a;
  uint32_t m;
  uint32_t m__PHI_TEMPORARY;
  uint32_t a__PHI_TEMPORARY;

  ;
  ;
  ;
  a = llvm_add_u32(llvm_cbe_m, 1);
  ;
  m__PHI_TEMPORARY = llvm_cbe_m;   /* for PHI node */
  a__PHI_TEMPORARY = a;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)a) <= ((int32_t)llvm_cbe_n)){
  m = llvm_srem_u32((llvm_add_u32(m, llvm_cbe_k)), a);
  ;

  a = llvm_add_u32(a, 1);
  ;
  m__PHI_TEMPORARY = m;   /* for PHI node */
  a__PHI_TEMPORARY = a;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
}
  return m;
}


uint64_t jos_large(uint64_t llvm_cbe_n, uint64_t llvm_cbe_k, uint64_t llvm_cbe_m) {
  uint64_t llvm_cbe_sub1;
  uint64_t m;
  uint64_t m__PHI_TEMPORARY;
  uint64_t a;
  uint64_t a__PHI_TEMPORARY;
  uint64_t q;
  uint64_t q__PHI_TEMPORARY;
  uint64_t llvm_cbe_retval_2e_0;
  uint64_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  if ((((((uint64_t)llvm_cbe_k) <= ((uint64_t)UINT64_C(1)))&1))) {
  llvm_cbe_sub1 = llvm_sub_u64((llvm_sub_u64(llvm_cbe_n, llvm_cbe_m)), 1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_sub1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_sub1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  ;
  m__PHI_TEMPORARY = llvm_cbe_m;   /* for PHI node */
  a__PHI_TEMPORARY = llvm_cbe_m;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)a) < ((uint64_t)llvm_cbe_n)){
  q = llvm_udiv_u64((llvm_sub_u64((llvm_add_u64((llvm_sub_u64(a, m)), llvm_cbe_k)), 2)), (llvm_sub_u64(llvm_cbe_k, 1)));
  ;
  if ((((((uint64_t)(llvm_add_u64(a, q))) > ((uint64_t)llvm_cbe_n))&1))) {
  q = llvm_sub_u64(llvm_cbe_n, a);
  ;
  q__PHI_TEMPORARY = q;   /* for PHI node */

  } else {
  if (!(((q != UINT64_C(0))&1))) {
  ;
  q__PHI_TEMPORARY = 1;   /* for PHI node */

}
  q = q__PHI_TEMPORARY;
  ;
  q__PHI_TEMPORARY = q;   /* for PHI node */

}
  q = q__PHI_TEMPORARY;
  ;
  a = llvm_add_u64(a, q);
  ;
  m = llvm_urem_u64((llvm_add_u64(m, (llvm_mul_u64(q, llvm_cbe_k)))), a);
  ;
  m__PHI_TEMPORARY = m;   /* for PHI node */
  a__PHI_TEMPORARY = a;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = m;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint64_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call6;

  ;
  ;
  llvm_cbe_call = jos((((uint32_t)41)), (((uint32_t)3)), 0);
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), 41, 3, llvm_cbe_call);
  ;
  ;
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), UINT64_C(9876543210987654321), 12031);
  ;
  i__PHI_TEMPORARY = 3;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u64(i, -1);
  ;
while (i != UINT64_C(0)){
  llvm_cbe_call4 = jos_large(UINT64_C(9876543210987654321), 12031, i);
  llvm_cbe_call5 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call4);
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u64(i, -1);
  ;
}
  llvm_cbe_call6 = putchar(10);
  return 0;
}

