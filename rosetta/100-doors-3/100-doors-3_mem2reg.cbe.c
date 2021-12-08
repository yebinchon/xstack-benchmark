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
  uint32_t increment;
  uint32_t increment__PHI_TEMPORARY;
  uint32_t square;
  uint32_t square__PHI_TEMPORARY;
  uint32_t door;
  uint32_t door__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call4;

  ;
  ;
  ;
  increment__PHI_TEMPORARY = 3;   /* for PHI node */
  square__PHI_TEMPORARY = 1;   /* for PHI node */
  door__PHI_TEMPORARY = 1;   /* for PHI node */

  increment = increment__PHI_TEMPORARY;
  square = square__PHI_TEMPORARY;
  door = door__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)door) <= ((int32_t)100u)){
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), door);
  if ((((door == square)&1))) {
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  square = llvm_add_u32(square, increment);
  ;
  increment = llvm_add_u32(increment, 2);
  ;
  increment__PHI_TEMPORARY = increment;   /* for PHI node */
  square__PHI_TEMPORARY = square;   /* for PHI node */

  } else {
  llvm_cbe_call4 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  increment__PHI_TEMPORARY = increment;   /* for PHI node */
  square__PHI_TEMPORARY = square;   /* for PHI node */

}
  increment = increment__PHI_TEMPORARY;
  square = square__PHI_TEMPORARY;
  ;
  ;

  door = llvm_add_u32(door, 1);
  ;
  increment__PHI_TEMPORARY = increment;   /* for PHI node */
  square__PHI_TEMPORARY = square;   /* for PHI node */
  door__PHI_TEMPORARY = door;   /* for PHI node */

  increment = increment__PHI_TEMPORARY;
  square = square__PHI_TEMPORARY;
  door = door__PHI_TEMPORARY;
  ;
  ;
  ;
}
  return 0;
}

