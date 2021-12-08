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
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint8_t* binstr;
  uint32_t llvm_cbe_call1;

  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((uint64_t)i) < ((uint64_t)UINT64_C(20))){
  binstr = bin((((uint32_t)i)));
  ;
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), binstr);
  free(binstr);

  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}


uint8_t* bin(uint32_t llvm_cbe_x) {
  double llvm_cbe_call;
  double llvm_cbe_call1;
  double llvm_cbe_add;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;
  uint64_t bits;
  uint8_t* ret;
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint32_t x;
  uint32_t x__PHI_TEMPORARY;
  uint64_t _1;

  ;
  if ((((llvm_cbe_x == 0u)&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = 1;   /* for PHI node */

  } else {
  llvm_cbe_call = log10((((double)(uint32_t)llvm_cbe_x)));
  llvm_cbe_call1 = log10(2);
  llvm_cbe_add = (llvm_cbe_call / llvm_cbe_call1) + 1;
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_add;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  bits = ((uint64_t)llvm_cbe_cond);
  ;
  ret = malloc((llvm_mul_u64((llvm_add_u64(bits, 1)), 1)));
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  x__PHI_TEMPORARY = llvm_cbe_x;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)i) < ((uint64_t)bits)){
  _1 = ((uint64_t)(bool)((((x & 1) != 0u)&1)));
  *((&ret[((int64_t)(llvm_sub_u64((llvm_sub_u64(bits, i)), 1)))])) = (((uint8_t)(llvm_select_u32(((((x & 1) != 0u)&1)), 49, 48))));
  x = llvm_lshr_u32(x, 1);
  ;

  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  x__PHI_TEMPORARY = x;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
}
  *((&ret[((int64_t)bits)])) = 0;
  return ret;
}

