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
  uint32_t llvm_cbe_year_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_month_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_day_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_adjustment;    /* Address-exposed local */
  uint32_t llvm_cbe_mm;    /* Address-exposed local */
  uint32_t llvm_cbe_yy;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;

  llvm_cbe_year_2e_addr = llvm_cbe_year;
  ;
  llvm_cbe_month_2e_addr = llvm_cbe_month;
  ;
  llvm_cbe_day_2e_addr = llvm_cbe_day;
  ;
  ;
  ;
  ;
  _1 = llvm_cbe_month_2e_addr;
  llvm_cbe_adjustment = (llvm_sdiv_u32((llvm_sub_u32(14, _1)), 12));
  _2 = llvm_cbe_month_2e_addr;
  _3 = llvm_cbe_adjustment;
  llvm_cbe_mm = (llvm_sub_u32((llvm_add_u32(_2, (llvm_mul_u32(12, _3)))), 2));
  _4 = llvm_cbe_year_2e_addr;
  _5 = llvm_cbe_adjustment;
  llvm_cbe_yy = (llvm_sub_u32(_4, _5));
  _6 = llvm_cbe_day_2e_addr;
  _7 = llvm_cbe_mm;
  _8 = llvm_cbe_yy;
  _9 = llvm_cbe_yy;
  _10 = llvm_cbe_yy;
  _11 = llvm_cbe_yy;
  return (llvm_srem_u32((llvm_add_u32((llvm_sub_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32(_6, (llvm_sdiv_u32((llvm_sub_u32((llvm_mul_u32(13, _7)), 1)), 5)))), _8)), (llvm_sdiv_u32(_9, 4)))), (llvm_sdiv_u32(_10, 100)))), (llvm_sdiv_u32(_11, 400)))), 7));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_y;    /* Address-exposed local */
  uint32_t _12;
  uint32_t _13;
  uint32_t llvm_cbe_call;
  uint32_t _14;
  uint32_t llvm_cbe_call2;
  uint32_t _15;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_y = 2008;

  _12 = llvm_cbe_y;
while (((int32_t)_12) <= ((int32_t)2121u)){
  _13 = llvm_cbe_y;
  llvm_cbe_call = wday(_13, 12, 25);
  if ((((llvm_cbe_call == 0u)&1))) {
  _14 = llvm_cbe_y;
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), _14);

}

  _15 = llvm_cbe_y;
  llvm_cbe_y = (llvm_add_u32(_15, 1));

  _12 = llvm_cbe_y;
}
  return 0;
}

