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
struct l_array_16_uint8_t {
  uint8_t array[16];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t ackermann(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_16_uint8_t _OC_str = { "A(%d, %d) = %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

uint32_t ackermann(uint32_t llvm_cbe_m, uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;
  uint32_t _8;

  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _1 = llvm_cbe_m_2e_addr;
  if (!(((_1 != 0u)&1))) {
  _2 = llvm_cbe_n_2e_addr;
  llvm_cbe_retval = (llvm_add_u32(_2, 1));

  _8 = llvm_cbe_retval;
  return _8;
}
  _3 = llvm_cbe_n_2e_addr;
  if ((((_3 != 0u)&1))) {
  _5 = llvm_cbe_m_2e_addr;
  _6 = llvm_cbe_m_2e_addr;
  _7 = llvm_cbe_n_2e_addr;
  llvm_cbe_call6 = ackermann(_6, (llvm_sub_u32(_7, 1)));
  llvm_cbe_call7 = ackermann((llvm_sub_u32(_5, 1)), llvm_cbe_call6);
  llvm_cbe_retval = llvm_cbe_call7;

  } else {
  _4 = llvm_cbe_m_2e_addr;
  llvm_cbe_call = ackermann((llvm_sub_u32(_4, 1)), 1);
  llvm_cbe_retval = llvm_cbe_call;

}
  _8 = llvm_cbe_retval;
  return _8;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_m;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  uint32_t _15;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call4;
  uint32_t _16;
  uint32_t _17;

  llvm_cbe_retval = 0;
  ;
  ;
  llvm_cbe_m = 0;

  _9 = llvm_cbe_m;
while (((int32_t)_9) <= ((int32_t)4u)){
  llvm_cbe_n = 0;

  uint32_t llvm_cbe_sub;
  _10 = llvm_cbe_n;
  _11 = llvm_cbe_m;
  llvm_cbe_sub = llvm_sub_u32(6, _11);
while (((int32_t)_10) < ((int32_t)llvm_cbe_sub)){
  _12 = llvm_cbe_m;
  _13 = llvm_cbe_n;
  _14 = llvm_cbe_m;
  _15 = llvm_cbe_n;
  llvm_cbe_call = ackermann(_14, _15);
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), _12, _13, llvm_cbe_call);

  _16 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_16, 1));

  _10 = llvm_cbe_n;
  _11 = llvm_cbe_m;
  llvm_cbe_sub = llvm_sub_u32(6, _11);
}

  _17 = llvm_cbe_m;
  llvm_cbe_m = (llvm_add_u32(_17, 1));

  _9 = llvm_cbe_m;
}
  return 0;
}

