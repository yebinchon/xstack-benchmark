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
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* bin(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
double log10(double) __ATTRIBUTELIST__((nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_4_uint8_t _OC_str = { "%s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_lshr_u32(uint32_t a, uint32_t b) {
  uint32_t r = a >> b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t* llvm_cbe_binstr;    /* Address-exposed local */
  uint64_t _1;
  uint64_t _2;
  uint8_t* llvm_cbe_call;
  uint8_t* _3;
  uint32_t llvm_cbe_call1;
  uint8_t* _4;
  uint64_t _5;
  uint32_t _6;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
while (((uint64_t)_1) < ((uint64_t)UINT64_C(20))){
  ;
  _2 = llvm_cbe_i;
  llvm_cbe_call = bin((((uint32_t)_2)));
  llvm_cbe_binstr = llvm_cbe_call;
  _3 = llvm_cbe_binstr;
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), _3);
  _4 = llvm_cbe_binstr;
  free(_4);

  _5 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_5, 1));

  _1 = llvm_cbe_i;
}
  _6 = llvm_cbe_retval;
  return _6;
}


uint8_t* bin(uint32_t llvm_cbe_x) {
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_bits;    /* Address-exposed local */
  uint8_t* llvm_cbe_ret;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _7;
  uint32_t _8;
  double llvm_cbe_call;
  double llvm_cbe_call1;
  double llvm_cbe_add;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;
  uint64_t _9;
  uint8_t* llvm_cbe_call4;
  uint64_t _10;
  uint64_t _11;
  uint32_t _12;
  uint64_t _13;
  uint8_t* _14;
  uint64_t _15;
  uint64_t _16;
  uint32_t _17;
  uint64_t _18;
  uint8_t* _19;
  uint64_t _20;
  uint8_t* _21;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  ;
  _7 = llvm_cbe_x_2e_addr;
  if ((((_7 == 0u)&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = 1;   /* for PHI node */

  } else {
  _8 = llvm_cbe_x_2e_addr;
  llvm_cbe_call = log10((((double)(uint32_t)_8)));
  llvm_cbe_call1 = log10(2);
  llvm_cbe_add = (llvm_cbe_call / llvm_cbe_call1) + 1;
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_add;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  llvm_cbe_bits = (((uint64_t)llvm_cbe_cond));
  ;
  _9 = llvm_cbe_bits;
  llvm_cbe_call4 = malloc((llvm_mul_u64((llvm_add_u64(_9, 1)), 1)));
  llvm_cbe_ret = llvm_cbe_call4;
  ;
  llvm_cbe_i = 0;

  _10 = llvm_cbe_i;
  _11 = llvm_cbe_bits;
while (((uint64_t)_10) < ((uint64_t)_11)){
  _12 = llvm_cbe_x_2e_addr;
  _13 = ((uint64_t)(bool)((((_12 & 1) != 0u)&1)));
  _14 = llvm_cbe_ret;
  _15 = llvm_cbe_bits;
  _16 = llvm_cbe_i;
  *((&_14[((int64_t)(llvm_sub_u64((llvm_sub_u64(_15, _16)), 1)))])) = (((uint8_t)(llvm_select_u32(((((_12 & 1) != 0u)&1)), 49, 48))));
  _17 = llvm_cbe_x_2e_addr;
  llvm_cbe_x_2e_addr = (llvm_lshr_u32(_17, 1));

  _18 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_18, 1));

  _10 = llvm_cbe_i;
  _11 = llvm_cbe_bits;
}
  _19 = llvm_cbe_ret;
  _20 = llvm_cbe_bits;
  *((&_19[((int64_t)_20)])) = 0;
  _21 = llvm_cbe_ret;
  return _21;
}

