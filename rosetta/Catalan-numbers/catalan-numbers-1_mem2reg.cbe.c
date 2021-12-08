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
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint64_t binomial(uint64_t, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t catalan1(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t catalan2(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t catalan3(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t puts(uint8_t*);
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_21_uint8_t _OC_str = { "\tdirect\tsumming\tfrac" };
static struct l_array_19_uint8_t _OC_str_OC_1 = { "%d\t%llu\t%llu\t%llu\n" };


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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
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
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_urem_u64(uint64_t a, uint64_t b) {
  uint64_t r = a % b;
  return r;
}


/* Function Bodies */

uint64_t binomial(uint64_t llvm_cbe_m, uint64_t llvm_cbe_n) {
  uint64_t llvm_cbe_sub;
  uint64_t d;
  uint64_t d__PHI_TEMPORARY;
  uint64_t n;
  uint64_t n__PHI_TEMPORARY;
  uint64_t r;
  uint64_t r__PHI_TEMPORARY;
  uint64_t m;
  uint64_t m__PHI_TEMPORARY;
  bool llvm_cbe_lnot;
  bool _1;
  bool _1__PHI_TEMPORARY;

  ;
  ;
  ;
  llvm_cbe_sub = llvm_sub_u64(llvm_cbe_m, llvm_cbe_n);
  ;
  if ((((((uint64_t)llvm_cbe_sub) > ((uint64_t)llvm_cbe_n))&1))) {
  ;
  d = llvm_sub_u64(llvm_cbe_m, llvm_cbe_sub);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */
  n__PHI_TEMPORARY = llvm_cbe_sub;   /* for PHI node */

}
  d = d__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */
  r__PHI_TEMPORARY = 1;   /* for PHI node */
  m__PHI_TEMPORARY = llvm_cbe_m;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  m = m__PHI_TEMPORARY;
  ;
  ;
  ;
while (((uint64_t)m) > ((uint64_t)n)){
  m = llvm_add_u64(m, -1);
  ;
  r = llvm_mul_u64(r, m);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

){
  llvm_cbe_lnot = ((~(((((llvm_urem_u64(r, d)) != UINT64_C(0))&1))))&1);
  _1__PHI_TEMPORARY = llvm_cbe_lnot;   /* for PHI node */

  _1 = ((_1__PHI_TEMPORARY)&1);
  if (_1) {
  d = llvm_add_u64(d, -1);
  ;
  r = llvm_udiv_u64(r, d);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
  if (!(((((uint64_t)d) > ((uint64_t)UINT64_C(1)))&1))) {
    _1__PHI_TEMPORARY = 0;   /* for PHI node */
  }

}
  d = d__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_cmp4 = ((((uint64_t)d) > ((uint64_t)UINT64_C(1)))&1);
    if (!(((((uint64_t)d) > ((uint64_t)UINT64_C(1)))&1))) {
    _1__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  break;
  d = d__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  m = m__PHI_TEMPORARY;
  ;
  ;
  ;
}
  return r;
}


uint64_t catalan1(uint32_t llvm_cbe_n) {
  uint64_t llvm_cbe_call;

  ;
  llvm_cbe_call = binomial((((int64_t)(int32_t)(llvm_mul_u32(2, llvm_cbe_n)))), (((int64_t)(int32_t)llvm_cbe_n)));
  return (llvm_udiv_u64(llvm_cbe_call, (((int64_t)(int32_t)(llvm_add_u32(1, llvm_cbe_n))))));
}


uint64_t catalan2(uint32_t llvm_cbe_n) {
  uint64_t r;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t r__PHI_TEMPORARY;
  uint64_t llvm_cbe_call;
  uint64_t llvm_cbe_call3;

  ;
  r = ((int64_t)(int32_t)(((uint32_t)(bool)(((~((((llvm_cbe_n != 0u)&1))))&1)))));
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_n)){
  llvm_cbe_call = catalan2(i);
  llvm_cbe_call3 = catalan2((llvm_sub_u32((llvm_sub_u32(llvm_cbe_n, 1)), i)));
  r = llvm_add_u64(r, (llvm_mul_u64(llvm_cbe_call, llvm_cbe_call3)));
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  r__PHI_TEMPORARY = r;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  r = r__PHI_TEMPORARY;
  ;
  ;
}
  return r;
}


uint64_t catalan3(uint32_t llvm_cbe_n) {
  uint64_t llvm_cbe_call;
  uint64_t llvm_cbe_div;
  uint64_t llvm_cbe_cond;
  uint64_t llvm_cbe_cond__PHI_TEMPORARY;

  ;
  if ((((llvm_cbe_n != 0u)&1))) {
  llvm_cbe_call = catalan3((llvm_sub_u32(llvm_cbe_n, 1)));
  llvm_cbe_div = llvm_udiv_u64((llvm_mul_u64((((int64_t)(int32_t)(llvm_mul_u32(2, (llvm_sub_u32((llvm_mul_u32(2, llvm_cbe_n)), 1)))))), llvm_cbe_call)), (((int64_t)(int32_t)(llvm_add_u32(1, llvm_cbe_n)))));
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_div;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = 1;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


int main(void) {
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t llvm_cbe_call1;
  uint64_t llvm_cbe_call2;
  uint64_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;

  llvm_cbe_call = puts(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)16u)){
  llvm_cbe_call1 = catalan1(i);
  llvm_cbe_call2 = catalan2(i);
  llvm_cbe_call3 = catalan3(i);
  llvm_cbe_call4 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), i, llvm_cbe_call1, llvm_cbe_call2, llvm_cbe_call3);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

