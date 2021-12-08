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
  uint32_t address;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t llvm_cbe_call;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call3;

  ;
  ;
  address = 65535;
  _1 = address;
  _2 = address;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (&address), _1, _2);
  *(((uint8_t*)(&address))) = 0;
  *((&(((uint8_t*)(&address)))[((int64_t)1)])) = 0;
  *((&(((uint8_t*)(&address)))[((int64_t)2)])) = -1;
  *((&(((uint8_t*)(&address)))[((int64_t)3)])) = -1;
  _3 = address;
  _4 = address;
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), (&address), _3, _4);
  return 0;
}

