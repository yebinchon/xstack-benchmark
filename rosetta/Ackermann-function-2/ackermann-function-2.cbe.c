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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_idx;    /* Address-exposed local */
  uint32_t llvm_cbe_res;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t llvm_cbe_call;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t* _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t* _13;
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t llvm_cbe_call12;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t llvm_cbe_call16;
  uint32_t llvm_cbe_call17;
  uint32_t _21;
  uint32_t _22;
  uint32_t* _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;

  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  _1 = llvm_cbe_m_2e_addr;
  if (!(((_1 != 0u)&1))) {
  _2 = llvm_cbe_n_2e_addr;
  llvm_cbe_retval = (llvm_add_u32(_2, 1));

  _26 = llvm_cbe_retval;
  return _26;
}
  _3 = llvm_cbe_n_2e_addr;
  _4 = n_bits;
  if ((((((int32_t)_3) >= ((int32_t)(1 << _4)))&1))) {
  _5 = llvm_cbe_m_2e_addr;
  _6 = llvm_cbe_n_2e_addr;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _5, _6);
  llvm_cbe_idx = 0;

  _16 = llvm_cbe_n_2e_addr;
  if ((((_16 != 0u)&1))) {
  _18 = llvm_cbe_m_2e_addr;
  _19 = llvm_cbe_m_2e_addr;
  _20 = llvm_cbe_n_2e_addr;
  llvm_cbe_call16 = ackermann(_19, (llvm_sub_u32(_20, 1)));
  llvm_cbe_call17 = ackermann((llvm_sub_u32(_18, 1)), llvm_cbe_call16);
  llvm_cbe_res = llvm_cbe_call17;

  } else {
  _17 = llvm_cbe_m_2e_addr;
  llvm_cbe_call12 = ackermann((llvm_sub_u32(_17, 1)), 1);
  llvm_cbe_res = llvm_cbe_call12;

}
  } else {
  _7 = llvm_cbe_m_2e_addr;
  _8 = n_bits;
  _9 = llvm_cbe_n_2e_addr;
  llvm_cbe_idx = (llvm_add_u32((_7 << _8), _9));
  _10 = cache;
  _11 = llvm_cbe_idx;
  _12 = *((&_10[((int64_t)(((int64_t)(int32_t)_11)))]));
  if ((((_12 != 0u)&1))) {
  _13 = cache;
  _14 = llvm_cbe_idx;
  _15 = *((&_13[((int64_t)(((int64_t)(int32_t)_14)))]));
  llvm_cbe_retval = _15;

  _26 = llvm_cbe_retval;
  return _26;
}

}
  _21 = llvm_cbe_idx;
  if (!(((_21 != 0u)&1))) {
  _22 = llvm_cbe_res;
  _23 = cache;
  _24 = llvm_cbe_idx;
  *((&_23[((int64_t)(((int64_t)(int32_t)_24)))])) = _22;

}
  _25 = llvm_cbe_res;
  llvm_cbe_retval = _25;

  _26 = llvm_cbe_retval;
  return _26;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_m;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint32_t _27;
  uint32_t _28;
  uint8_t* llvm_cbe_call;
  uint32_t* _29;
  uint32_t _30;
  uint32_t _31;
  uint8_t* _32;
  uint32_t _33;
  uint32_t _34;
  uint32_t _35;
  uint32_t _36;
  uint32_t _37;
  uint32_t _38;
  uint32_t _39;
  uint32_t llvm_cbe_call10;
  uint32_t llvm_cbe_call11;
  uint32_t _40;
  uint32_t _41;

  llvm_cbe_retval = 0;
  ;
  ;
  m_bits = 3;
  n_bits = 20;
  _27 = m_bits;
  _28 = n_bits;
  llvm_cbe_call = malloc((llvm_mul_u64(4, (((int64_t)(int32_t)(1 << (llvm_add_u32(_27, _28))))))));
  cache = (((uint32_t*)llvm_cbe_call));
  _29 = cache;
  _30 = m_bits;
  _31 = n_bits;
  _32 = memset((((uint8_t*)_29)), 0, (llvm_mul_u64(4, (((int64_t)(int32_t)(1 << (llvm_add_u32(_30, _31))))))));
  llvm_cbe_m = 0;

  _33 = llvm_cbe_m;
while (((int32_t)_33) <= ((int32_t)4u)){
  llvm_cbe_n = 0;

  uint32_t llvm_cbe_sub;
  _34 = llvm_cbe_n;
  _35 = llvm_cbe_m;
  llvm_cbe_sub = llvm_sub_u32(6, _35);
while (((int32_t)_34) < ((int32_t)llvm_cbe_sub)){
  _36 = llvm_cbe_m;
  _37 = llvm_cbe_n;
  _38 = llvm_cbe_m;
  _39 = llvm_cbe_n;
  llvm_cbe_call10 = ackermann(_38, _39);
  llvm_cbe_call11 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _36, _37, llvm_cbe_call10);

  _40 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_40, 1));

  _34 = llvm_cbe_n;
  _35 = llvm_cbe_m;
  llvm_cbe_sub = llvm_sub_u32(6, _35);
}

  _41 = llvm_cbe_m;
  llvm_cbe_m = (llvm_add_u32(_41, 1));

  _33 = llvm_cbe_m;
}
  return 0;
}

