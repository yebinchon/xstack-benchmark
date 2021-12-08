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
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_11_uint8_t {
  uint8_t array[11];
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_9_uint8_t _OC_str = { "door #%d" };
static struct l_array_11_uint8_t _OC_str_OC_1 = { " is open.\n" };
static struct l_array_13_uint8_t _OC_str_OC_2 = { " is closed.\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_square;    /* Address-exposed local */
  uint32_t llvm_cbe_increment;    /* Address-exposed local */
  uint32_t llvm_cbe_door;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t llvm_cbe_call;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call2;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t llvm_cbe_call4;
  uint32_t _8;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_square = 1;
  ;
  llvm_cbe_increment = 3;
  ;
  llvm_cbe_door = 1;

  _1 = llvm_cbe_door;
while (((int32_t)_1) <= ((int32_t)100u)){
  _2 = llvm_cbe_door;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _2);
  _3 = llvm_cbe_door;
  _4 = llvm_cbe_square;
  if ((((_3 == _4)&1))) {
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  _5 = llvm_cbe_increment;
  _6 = llvm_cbe_square;
  llvm_cbe_square = (llvm_add_u32(_6, _5));
  _7 = llvm_cbe_increment;
  llvm_cbe_increment = (llvm_add_u32(_7, 2));

  } else {
  llvm_cbe_call4 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

}

  _8 = llvm_cbe_door;
  llvm_cbe_door = (llvm_add_u32(_8, 1));

  _1 = llvm_cbe_door;
}
  return 0;
}

