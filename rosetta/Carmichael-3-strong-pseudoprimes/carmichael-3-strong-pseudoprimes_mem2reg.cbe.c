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
struct l_array_10_uint8_t {
  uint8_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t is_prime(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void carmichael3(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_10_uint8_t _OC_str = { "%d %d %d\n" };


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
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_neg_u32(uint32_t a) {
  uint32_t r = -a;
  return r;
}


/* Function Bodies */

uint32_t is_prime(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_conv;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  if ((((((uint32_t)llvm_cbe_n) <= ((uint32_t)3u))&1))) {
  llvm_cbe_conv = ((uint32_t)(bool)(((((uint32_t)llvm_cbe_n) > ((uint32_t)1u))&1)));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (!((((llvm_urem_u32(llvm_cbe_n, 2)) != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (!((((llvm_urem_u32(llvm_cbe_n, 3)) != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  ;
  i__PHI_TEMPORARY = 5;   /* for PHI node */

  uint32_t llvm_cbe_mul;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_mul = llvm_mul_u32(i, i);
while (((uint32_t)llvm_cbe_mul) <= ((uint32_t)llvm_cbe_n)){
  if (!((((llvm_urem_u32(llvm_cbe_n, i)) != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (!((((llvm_urem_u32(llvm_cbe_n, (llvm_add_u32(i, 2)))) != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}

  i = llvm_add_u32(i, 6);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_mul = llvm_mul_u32(i, i);
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


void carmichael3(uint32_t llvm_cbe_p1) {
  uint32_t llvm_cbe_call;
  uint32_t h3;
  uint32_t h3__PHI_TEMPORARY;
  uint32_t d;
  uint32_t d__PHI_TEMPORARY;
  uint32_t p2;
  uint32_t llvm_cbe_call18;
  uint32_t p3;
  uint32_t llvm_cbe_call25;
  uint32_t llvm_cbe_call33;

  ;
  llvm_cbe_call = is_prime(llvm_cbe_p1);
  if (!(((llvm_cbe_call != 0u)&1))) {

  return;
}
  ;
  h3__PHI_TEMPORARY = 1;   /* for PHI node */

  h3 = h3__PHI_TEMPORARY;
  ;
while (((int32_t)h3) < ((int32_t)llvm_cbe_p1)){
  ;
  d__PHI_TEMPORARY = 1;   /* for PHI node */

  uint32_t llvm_cbe_add;
  d = d__PHI_TEMPORARY;
  ;
  llvm_cbe_add = llvm_add_u32(h3, llvm_cbe_p1);
while (((int32_t)d) < ((int32_t)llvm_cbe_add)){
  if (((((llvm_srem_u32((llvm_mul_u32((llvm_add_u32(h3, llvm_cbe_p1)), (llvm_sub_u32(llvm_cbe_p1, 1)))), d)) == 0u)&1))) {
  if (((((llvm_srem_u32((llvm_add_u32((llvm_srem_u32((llvm_mul_u32((llvm_neg_u32(llvm_cbe_p1)), llvm_cbe_p1)), h3)), h3)), h3)) == (llvm_srem_u32(d, h3)))&1))) {
  p2 = llvm_add_u32(1, (llvm_sdiv_u32((llvm_mul_u32((llvm_sub_u32(llvm_cbe_p1, 1)), (llvm_add_u32(h3, llvm_cbe_p1)))), d)));
  ;
  llvm_cbe_call18 = is_prime(p2);
  if ((((llvm_cbe_call18 != 0u)&1))) {
  p3 = llvm_add_u32(1, (llvm_sdiv_u32((llvm_mul_u32(llvm_cbe_p1, p2)), h3)));
  ;
  llvm_cbe_call25 = is_prime(p3);
  if ((((llvm_cbe_call25 != 0u)&1))) {
  if (((((llvm_srem_u32((llvm_mul_u32(p2, p3)), (llvm_sub_u32(llvm_cbe_p1, 1)))) != 1u)&1))) {

  } else {
  llvm_cbe_call33 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_p1, p2, p3);


}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  d = llvm_add_u32(d, 1);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  ;
  llvm_cbe_add = llvm_add_u32(h3, llvm_cbe_p1);
}

  h3 = llvm_add_u32(h3, 1);
  ;
  h3__PHI_TEMPORARY = h3;   /* for PHI node */

  h3 = h3__PHI_TEMPORARY;
  ;
}

  return;
}


int main(void) {
  uint32_t p1;
  uint32_t p1__PHI_TEMPORARY;

  ;
  p1__PHI_TEMPORARY = 2;   /* for PHI node */

  p1 = p1__PHI_TEMPORARY;
  ;
while (((int32_t)p1) < ((int32_t)62u)){
  carmichael3(p1);

  p1 = llvm_add_u32(p1, 1);
  ;
  p1__PHI_TEMPORARY = p1;   /* for PHI node */

  p1 = p1__PHI_TEMPORARY;
  ;
}
  return 0;
}

