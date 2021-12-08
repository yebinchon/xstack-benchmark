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

#ifdef _MSC_VER
#define __MSALIGN__(X) __declspec(align(X))
#else
#define __MSALIGN__(X)
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
struct l_array_100_uint8_t {
  uint8_t array[100];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


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
  __MSALIGN__(16) struct l_array_100_uint8_t llvm_cbe_is_open __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t llvm_cbe_pass_2e_0;
  uint32_t llvm_cbe_pass_2e_0__PHI_TEMPORARY;
  uint32_t door;
  uint32_t door__PHI_TEMPORARY;
  uint8_t _2;
  uint32_t pass;
  uint8_t _3;
  uint64_t _4;
  uint32_t llvm_cbe_call;

  ;
  _1 = memset((((uint8_t*)(&llvm_cbe_is_open))), 0, 100);
  ;
  llvm_cbe_pass_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_pass_2e_0 = llvm_cbe_pass_2e_0__PHI_TEMPORARY;
  ;
while (((int32_t)llvm_cbe_pass_2e_0) < ((int32_t)100u)){
  ;
  door__PHI_TEMPORARY = llvm_cbe_pass_2e_0;   /* for PHI node */

  door = door__PHI_TEMPORARY;
  ;
while (((int32_t)door) < ((int32_t)100u)){
  _2 = *((&llvm_cbe_is_open.array[((int64_t)(((int64_t)(int32_t)door)))]));
  *((&llvm_cbe_is_open.array[((int64_t)(((int64_t)(int32_t)door)))])) = (((uint8_t)(((uint32_t)(bool)(((~((((_2 != ((uint8_t)0))&1))))&1))))));

  door = llvm_add_u32(door, (llvm_add_u32(llvm_cbe_pass_2e_0, 1)));
  ;
  door__PHI_TEMPORARY = door;   /* for PHI node */

  door = door__PHI_TEMPORARY;
  ;
}

  pass = llvm_add_u32(llvm_cbe_pass_2e_0, 1);
  ;
  llvm_cbe_pass_2e_0__PHI_TEMPORARY = pass;   /* for PHI node */

  llvm_cbe_pass_2e_0 = llvm_cbe_pass_2e_0__PHI_TEMPORARY;
  ;
}
  ;
  door__PHI_TEMPORARY = 0;   /* for PHI node */

  door = door__PHI_TEMPORARY;
  ;
while (((int32_t)door) < ((int32_t)100u)){
  _3 = *((&llvm_cbe_is_open.array[((int64_t)(((int64_t)(int32_t)door)))]));
  _4 = ((uint64_t)(bool)((((((int32_t)(int8_t)_3)) != 0u)&1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (llvm_add_u32(door, 1)), (llvm_select_pu8(((((((int32_t)(int8_t)_3)) != 0u)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))));

  door = llvm_add_u32(door, 1);
  ;
  door__PHI_TEMPORARY = door;   /* for PHI node */

  door = door__PHI_TEMPORARY;
  ;
}
  return 0;
}

