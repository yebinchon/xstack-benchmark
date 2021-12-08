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
struct l_array_12_uint8_t {
  uint8_t array[12];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t wday(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_12_uint8_t _OC_str = { "%04d-12-25\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t wday(uint32_t llvm_cbe_year, uint32_t llvm_cbe_month, uint32_t llvm_cbe_day) {
  uint32_t adjustment;
  uint32_t yy;

  ;
  ;
  ;
  adjustment = llvm_sdiv_u32((llvm_sub_u32(14, llvm_cbe_month)), 12);
  ;
  ;
  yy = llvm_sub_u32(llvm_cbe_year, adjustment);
  ;
  return (llvm_srem_u32((llvm_add_u32((llvm_sub_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32(llvm_cbe_day, (llvm_sdiv_u32((llvm_sub_u32((llvm_mul_u32(13, (llvm_sub_u32((llvm_add_u32(llvm_cbe_month, (llvm_mul_u32(12, adjustment)))), 2)))), 1)), 5)))), yy)), (llvm_sdiv_u32(yy, 4)))), (llvm_sdiv_u32(yy, 100)))), (llvm_sdiv_u32(yy, 400)))), 7));
}


int main(void) {
  uint32_t y;
  uint32_t y__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;

  ;
  y__PHI_TEMPORARY = 2008;   /* for PHI node */

  y = y__PHI_TEMPORARY;
  ;
while (((int32_t)y) <= ((int32_t)2121u)){
  llvm_cbe_call = wday(y, 12, 25);
  if ((((llvm_cbe_call == 0u)&1))) {
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), y);

}

  y = llvm_add_u32(y, 1);
  ;
  y__PHI_TEMPORARY = y;   /* for PHI node */

  y = y__PHI_TEMPORARY;
  ;
}
  return 0;
}

