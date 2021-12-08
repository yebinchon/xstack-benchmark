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
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_17_uint8_t _OC_str = { "door #%d is %s.\n" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "open" };
static struct l_array_7_uint8_t _OC_str_OC_2 = { "closed" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t square;
  uint32_t square__PHI_TEMPORARY;
  uint32_t door;
  uint32_t door__PHI_TEMPORARY;
  uint32_t increment;
  uint32_t increment__PHI_TEMPORARY;
  uint64_t _1;
  uint32_t llvm_cbe_call;
  bool _2;
  bool _2__PHI_TEMPORARY;
  uint32_t llvm_cbe_land_2e_ext;

  ;
  ;
  ;
  square__PHI_TEMPORARY = 1;   /* for PHI node */
  door__PHI_TEMPORARY = 1;   /* for PHI node */
  increment__PHI_TEMPORARY = 1;   /* for PHI node */

  square = square__PHI_TEMPORARY;
  door = door__PHI_TEMPORARY;
  increment = increment__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)door) <= ((int32_t)100u)){
  _1 = ((uint64_t)(bool)(((door == square)&1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), door, (llvm_select_pu8((((door == square)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))));

  door = llvm_add_u32(door, 1);
  ;
  if ((((door == square)&1))) {
  increment = llvm_add_u32(increment, 2);
  ;
  square = llvm_add_u32(square, increment);
  ;
  square__PHI_TEMPORARY = square;   /* for PHI node */
  increment__PHI_TEMPORARY = increment;   /* for PHI node */
  _2__PHI_TEMPORARY = (((square != 0u)&1));   /* for PHI node */

}
  square = square__PHI_TEMPORARY;
  increment = increment__PHI_TEMPORARY;
  _2 = ((_2__PHI_TEMPORARY)&1);
  ;
  ;
  llvm_cbe_land_2e_ext = ((uint32_t)(bool)_2);
  square__PHI_TEMPORARY = square;   /* for PHI node */
  door__PHI_TEMPORARY = door;   /* for PHI node */
  increment__PHI_TEMPORARY = increment;   /* for PHI node */

  square = square__PHI_TEMPORARY;
  door = door__PHI_TEMPORARY;
  increment = increment__PHI_TEMPORARY;
  ;
  ;
  ;
}
  return 0;
}

