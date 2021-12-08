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
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_3_uint8_t_KC_ {
  uint8_t* array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_6_uint8_t _OC_str = { "Enjoy" };
static struct l_array_8_uint8_t _OC_str_OC_1 = { "Rosetta" };
static struct l_array_5_uint8_t _OC_str_OC_2 = { "Code" };
static __MSALIGN__(16) struct l_array_3_uint8_t_KC_ __const_OC_main_OC_str __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((&_OC_str_OC_2.array[((int32_t)0)])) } };
static struct l_array_4_uint8_t _OC_str_OC_3 = { "%s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  __MSALIGN__(16) struct l_array_3_uint8_t_KC_ llvm_cbe_str __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _2;
  uint32_t llvm_cbe_call;

  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_str))), ((uint8_t*)(&__const_OC_main_OC_str)), 24);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)3u)){
  _2 = *((&llvm_cbe_str.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _2);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

