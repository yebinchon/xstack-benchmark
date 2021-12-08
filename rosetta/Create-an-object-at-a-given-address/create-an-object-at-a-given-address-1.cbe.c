/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
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
struct l_array_18_uint8_t {
  uint8_t array[18];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_18_uint8_t _OC_str = { "%p: %08x (=%08x)\n" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_intspace;    /* Address-exposed local */
  uint32_t* llvm_cbe_address;    /* Address-exposed local */
  uint32_t* _1;
  uint32_t* _2;
  uint32_t* _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t llvm_cbe_call;
  uint32_t* _6;
  uint32_t* _7;
  uint32_t* _8;
  uint32_t* _9;
  uint32_t* _10;
  uint32_t* _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t llvm_cbe_call3;

  llvm_cbe_retval = 0;
  ;
  ;
  llvm_cbe_address = (&llvm_cbe_intspace);
  _1 = llvm_cbe_address;
  *_1 = 65535;
  _2 = llvm_cbe_address;
  _3 = llvm_cbe_address;
  _4 = *_3;
  _5 = llvm_cbe_intspace;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _2, _4, _5);
  _6 = llvm_cbe_address;
  *(((uint8_t*)_6)) = 0;
  _7 = llvm_cbe_address;
  *((&(((uint8_t*)_7))[((int64_t)1)])) = 0;
  _8 = llvm_cbe_address;
  *((&(((uint8_t*)_8))[((int64_t)2)])) = -1;
  _9 = llvm_cbe_address;
  *((&(((uint8_t*)_9))[((int64_t)3)])) = -1;
  _10 = llvm_cbe_address;
  _11 = llvm_cbe_address;
  _12 = *_11;
  _13 = llvm_cbe_intspace;
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), _10, _12, _13);
  return 0;
}

