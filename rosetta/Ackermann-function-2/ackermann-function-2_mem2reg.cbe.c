/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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
struct l_array_16_uint8_t {
  uint8_t array[16];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t ackermann(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
uint32_t n_bits __ATTRIBUTE_WEAK__;
static struct l_array_8_uint8_t _OC_str = { "%d, %d\n" };
uint32_t* cache __ATTRIBUTE_WEAK__;
uint32_t m_bits __ATTRIBUTE_WEAK__;
static struct l_array_16_uint8_t _OC_str_OC_1 = { "A(%d, %d) = %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

uint32_t ackermann(uint32_t llvm_cbe_m, uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_add;
  uint32_t _1;
  uint32_t llvm_cbe_call;
  uint32_t _2;
  uint32_t idx;
  uint32_t* _3;
  uint32_t _4;
  uint32_t* _5;
  uint32_t _6;
  uint32_t idx__PHI_TEMPORARY;
  uint32_t res;
  uint32_t llvm_cbe_call16;
  uint32_t res__PHI_TEMPORARY;
  uint32_t* _7;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  if (!(((llvm_cbe_m != 0u)&1))) {
  llvm_cbe_add = llvm_add_u32(llvm_cbe_n, 1);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_add;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_add;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _1 = n_bits;
  if ((((((int32_t)llvm_cbe_n) >= ((int32_t)(1 << _1)))&1))) {
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_m, llvm_cbe_n);
  ;
  idx__PHI_TEMPORARY = 0;   /* for PHI node */

  idx = idx__PHI_TEMPORARY;
  ;
  if ((((llvm_cbe_n != 0u)&1))) {
  llvm_cbe_call16 = ackermann(llvm_cbe_m, (llvm_sub_u32(llvm_cbe_n, 1)));
  res = ackermann((llvm_sub_u32(llvm_cbe_m, 1)), llvm_cbe_call16);
  ;
  res__PHI_TEMPORARY = res;   /* for PHI node */

  } else {
  res = ackermann((llvm_sub_u32(llvm_cbe_m, 1)), 1);
  ;
  res__PHI_TEMPORARY = res;   /* for PHI node */

}
  } else {
  _2 = n_bits;
  idx = llvm_add_u32((llvm_cbe_m << _2), llvm_cbe_n);
  ;
  _3 = cache;
  _4 = *((&_3[((int64_t)(((int64_t)(int32_t)idx)))]));
  if ((((_4 != 0u)&1))) {
  _5 = cache;
  _6 = *((&_5[((int64_t)(((int64_t)(int32_t)idx)))]));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = _6;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = _6;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  idx__PHI_TEMPORARY = idx;   /* for PHI node */

}
  res = res__PHI_TEMPORARY;
  ;
  if (!(((idx != 0u)&1))) {
  _7 = cache;
  *((&_7[((int64_t)(((int64_t)(int32_t)idx)))])) = res;

}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = res;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint32_t _8;
  uint32_t _9;
  uint8_t* llvm_cbe_call;
  uint32_t* _10;
  uint32_t _11;
  uint32_t _12;
  uint8_t* _13;
  uint32_t m;
  uint32_t m__PHI_TEMPORARY;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t llvm_cbe_call10;
  uint32_t llvm_cbe_call11;

  m_bits = 3;
  n_bits = 20;
  _8 = m_bits;
  _9 = n_bits;
  llvm_cbe_call = malloc((llvm_mul_u64(4, (((int64_t)(int32_t)(1 << (llvm_add_u32(_8, _9))))))));
  cache = (((uint32_t*)llvm_cbe_call));
  _10 = cache;
  _11 = m_bits;
  _12 = n_bits;
  _13 = memset((((uint8_t*)_10)), 0, (llvm_mul_u64(4, (((int64_t)(int32_t)(1 << (llvm_add_u32(_11, _12))))))));
  ;
  m__PHI_TEMPORARY = 0;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  ;
while (((int32_t)m) <= ((int32_t)4u)){
  ;
  n__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub;
  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(6, m);
while (((int32_t)n) < ((int32_t)llvm_cbe_sub)){
  llvm_cbe_call10 = ackermann(m, n);
  llvm_cbe_call11 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), m, n, llvm_cbe_call10);

  n = llvm_add_u32(n, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(6, m);
}

  m = llvm_add_u32(m, 1);
  ;
  m__PHI_TEMPORARY = m;   /* for PHI node */

  m = m__PHI_TEMPORARY;
  ;
}
  return 0;
}

