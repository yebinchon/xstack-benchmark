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
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
uint32_t N = 15;
static struct l_array_3_uint8_t _OC_str = { "1 " };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%d " };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
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


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  uint64_t llvm_cbe_num;    /* Address-exposed local */
  uint64_t llvm_cbe_den;    /* Address-exposed local */
  uint32_t llvm_cbe_catalan;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint64_t _6;
  uint32_t _7;
  uint64_t _8;
  uint64_t _9;
  uint64_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t llvm_cbe_call7;
  uint32_t _13;
  uint32_t llvm_cbe_call11;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_n = 2;

  _1 = llvm_cbe_n;
while (((int32_t)_1) <= ((int32_t)15u)){
  llvm_cbe_den = 1;
  llvm_cbe_num = 1;
  llvm_cbe_k = 2;

  _2 = llvm_cbe_k;
  _3 = llvm_cbe_n;
while (((int32_t)_2) <= ((int32_t)_3)){
  _4 = llvm_cbe_n;
  _5 = llvm_cbe_k;
  _6 = llvm_cbe_num;
  llvm_cbe_num = (llvm_mul_u64(_6, (((int64_t)(int32_t)(llvm_add_u32(_4, _5))))));
  _7 = llvm_cbe_k;
  _8 = llvm_cbe_den;
  llvm_cbe_den = (llvm_mul_u64(_8, (((int64_t)(int32_t)_7))));
  _9 = llvm_cbe_num;
  _10 = llvm_cbe_den;
  llvm_cbe_catalan = (((uint32_t)(llvm_udiv_u64(_9, _10))));

  _11 = llvm_cbe_k;
  llvm_cbe_k = (llvm_add_u32(_11, 1));

  _2 = llvm_cbe_k;
  _3 = llvm_cbe_n;
}
  _12 = llvm_cbe_catalan;
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _12);

  _13 = llvm_cbe_n;
  llvm_cbe_n = (llvm_add_u32(_13, 1));

  _1 = llvm_cbe_n;
}
  llvm_cbe_call11 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  return 0;
}

