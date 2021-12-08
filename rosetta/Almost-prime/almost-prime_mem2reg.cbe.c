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
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t kprime(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t putchar(uint32_t);


/* Global Variable Definitions and Initialization */
static struct l_array_8_uint8_t _OC_str = { "k = %d:" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { " %d" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
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

uint32_t kprime(uint32_t llvm_cbe_n, uint32_t llvm_cbe_k) {
  uint32_t p;
  uint32_t p__PHI_TEMPORARY;
  uint32_t f;
  uint32_t f__PHI_TEMPORARY;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  bool _1;
  bool _1__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  p__PHI_TEMPORARY = 2;   /* for PHI node */
  f__PHI_TEMPORARY = 0;   /* for PHI node */
  n__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */

){
  _1__PHI_TEMPORARY = (((((int32_t)(llvm_mul_u32(p, p))) <= ((int32_t)n))&1));   /* for PHI node */

  _1 = ((_1__PHI_TEMPORARY)&1);
  if (!_1) {
  f__PHI_TEMPORARY = f;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  f = f__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  if (!(((0u == (llvm_srem_u32(n, p)))&1))) {
  }

  n = llvm_sdiv_u32(n, p);
  ;
  f = llvm_add_u32(f, 1);
  ;
  f__PHI_TEMPORARY = f;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */


  p = llvm_add_u32(p, 1);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */
  f__PHI_TEMPORARY = f;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  f = f__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  ;
  if (!(((((int32_t)f) < ((int32_t)llvm_cbe_k))&1))) {
    _1__PHI_TEMPORARY = 0;   /* for PHI node */
  }

}
  uint32_t llvm_cbe_rem;
  f = f__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_rem = llvm_srem_u32(n, p);
while (0u == llvm_cbe_rem){
  f = f__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_rem = llvm_srem_u32(n, p);
}
  p = p__PHI_TEMPORARY;
  f = f__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  ;
  llvm_cbe_cmp = ((((int32_t)f) < ((int32_t)llvm_cbe_k))&1);
    if (!(((((int32_t)f) < ((int32_t)llvm_cbe_k))&1))) {
    _1__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  return (((uint32_t)(bool)((((llvm_add_u32(f, (((uint32_t)(bool)(((((int32_t)n) > ((int32_t)1u))&1)))))) == llvm_cbe_k)&1))));
}


int main(void) {
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t c;
  uint32_t c__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call7;

  ;
  k__PHI_TEMPORARY = 1;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
while (((int32_t)k) <= ((int32_t)5u)){
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), k);
  ;
  ;
  c__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 2;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)c) < ((int32_t)10u)){
  llvm_cbe_call4 = kprime(i, k);
  if ((((llvm_cbe_call4 != 0u)&1))) {
  llvm_cbe_call5 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), i);
  c = llvm_add_u32(c, 1);
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */

}
  c = c__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call7 = putchar(10);

  k = llvm_add_u32(k, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
}
  return 0;
}

