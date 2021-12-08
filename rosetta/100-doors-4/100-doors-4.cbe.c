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
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_door;    /* Address-exposed local */
  uint32_t llvm_cbe_square;    /* Address-exposed local */
  uint32_t llvm_cbe_increment;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint64_t _5;
  uint32_t llvm_cbe_call;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t llvm_cbe_add;
  uint32_t _9;
  uint32_t llvm_cbe_add3;
  bool _10;
  bool _10__PHI_TEMPORARY;
  uint32_t llvm_cbe_land_2e_ext;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  llvm_cbe_door = 1;
  llvm_cbe_square = 1;
  llvm_cbe_increment = 1;

  _1 = llvm_cbe_door;
while (((int32_t)_1) <= ((int32_t)100u)){
  _2 = llvm_cbe_door;
  _3 = llvm_cbe_door;
  _4 = llvm_cbe_square;
  _5 = ((uint64_t)(bool)(((_3 == _4)&1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _2, (llvm_select_pu8((((_3 == _4)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))));

  _6 = llvm_cbe_door;
  llvm_cbe_door = (llvm_add_u32(_6, 1));
  _7 = llvm_cbe_square;
  if ((((_6 == _7)&1))) {
  _8 = llvm_cbe_increment;
  llvm_cbe_add = llvm_add_u32(_8, 2);
  llvm_cbe_increment = llvm_cbe_add;
  _9 = llvm_cbe_square;
  llvm_cbe_add3 = llvm_add_u32(_9, llvm_cbe_add);
  llvm_cbe_square = llvm_cbe_add3;
  _10__PHI_TEMPORARY = (((llvm_cbe_add3 != 0u)&1));   /* for PHI node */

}
  _10 = ((_10__PHI_TEMPORARY)&1);
  llvm_cbe_land_2e_ext = ((uint32_t)(bool)_10);

  _1 = llvm_cbe_door;
}
  return 0;
}

