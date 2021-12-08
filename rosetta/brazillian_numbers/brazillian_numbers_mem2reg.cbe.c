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
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_3_uint8_t_KC_ {
  uint8_t* array[3];
};
struct l_array_30_uint8_t {
  uint8_t array[30];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_36_uint8_t {
  uint8_t array[36];
};

/* External Global Variable Declarations */

/* Function Declarations */
int8_t same_digits(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int8_t is_brazilian(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int8_t is_prime(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_2_uint8_t _OC_str = { " " };
static struct l_array_6_uint8_t _OC_str_OC_1 = { " odd " };
static struct l_array_8_uint8_t _OC_str_OC_2 = { " prime " };
static __MSALIGN__(16) struct l_array_3_uint8_t_KC_ __const_OC_main_OC_kinds __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((&_OC_str_OC_2.array[((int32_t)0)])) } };
static struct l_array_30_uint8_t _OC_str_OC_3 = { "First 20%sBrazilian numbers:\n" };
static struct l_array_4_uint8_t _OC_str_OC_4 = { "%d " };
static struct l_array_3_uint8_t _OC_str_OC_5 = { "\n\n" };
static struct l_array_36_uint8_t _OC_str_OC_6 = { "The 100,000th Brazilian number: %d\n" };


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

int8_t same_digits(uint32_t llvm_cbe_n, uint32_t llvm_cbe_b) {
  uint32_t f;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint8_t llvm_cbe_retval_2e_0;
  uint8_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  f = llvm_srem_u32(llvm_cbe_n, llvm_cbe_b);
  ;
  n = llvm_sdiv_u32(llvm_cbe_n, llvm_cbe_b);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
while (((int32_t)n) > ((int32_t)0u)){
  if (((((llvm_srem_u32(n, llvm_cbe_b)) != f)&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  n = llvm_sdiv_u32(n, llvm_cbe_b);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int8_t is_brazilian(uint32_t llvm_cbe_n) {
  uint32_t b;
  uint32_t b__PHI_TEMPORARY;
  uint8_t llvm_cbe_call;
  uint8_t llvm_cbe_retval_2e_0;
  uint8_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  if ((((((int32_t)llvm_cbe_n) < ((int32_t)7u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (((((llvm_srem_u32(llvm_cbe_n, 2)) != 0u)&1))) {
  ;
  b__PHI_TEMPORARY = 2;   /* for PHI node */

  b = b__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)b) < ((int32_t)(llvm_sub_u32(llvm_cbe_n, 1))))&1))) {
  }

  llvm_cbe_call = same_digits(llvm_cbe_n, b);
  if ((((llvm_cbe_call != ((uint8_t)0))&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */


  } else {
  if ((((((int32_t)llvm_cbe_n) >= ((int32_t)8u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  ;
  b__PHI_TEMPORARY = 2;   /* for PHI node */

}
  uint32_t llvm_cbe_sub;
  b = b__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_n, 1);
while (((int32_t)b) < ((int32_t)llvm_cbe_sub)){
  b = llvm_add_u32(b, 1);
  ;
  b__PHI_TEMPORARY = b;   /* for PHI node */

  b = b__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_n, 1);
}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int8_t is_prime(uint32_t llvm_cbe_n) {
  uint8_t llvm_cbe_conv3;
  uint8_t llvm_cbe_conv10;
  uint32_t d;
  uint32_t d__PHI_TEMPORARY;
  uint8_t llvm_cbe_retval_2e_0;
  uint8_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  if ((((((int32_t)llvm_cbe_n) < ((int32_t)2u))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (!((((llvm_srem_u32(llvm_cbe_n, 2)) != 0u)&1))) {
  llvm_cbe_conv3 = ((uint8_t)(((uint32_t)(bool)(((llvm_cbe_n == 2u)&1)))));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv3;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv3;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  if (!((((llvm_srem_u32(llvm_cbe_n, 3)) != 0u)&1))) {
  llvm_cbe_conv10 = ((uint8_t)(((uint32_t)(bool)(((llvm_cbe_n == 3u)&1)))));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv10;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv10;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  d__PHI_TEMPORARY = 5;   /* for PHI node */

  uint32_t llvm_cbe_mul;
  d = d__PHI_TEMPORARY;
  ;
  llvm_cbe_mul = llvm_mul_u32(d, d);
while (((int32_t)llvm_cbe_mul) <= ((int32_t)llvm_cbe_n)){
  if (!((((llvm_srem_u32(llvm_cbe_n, d)) != 0u)&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  d = llvm_add_u32(d, 2);
  ;
  if (!((((llvm_srem_u32(llvm_cbe_n, d)) != 0u)&1))) {
    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  d = llvm_add_u32(d, 4);
  ;
  d__PHI_TEMPORARY = d;   /* for PHI node */

  d = d__PHI_TEMPORARY;
  ;
  llvm_cbe_mul = llvm_mul_u32(d, d);
}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  __MSALIGN__(16) struct l_array_3_uint8_t_KC_ llvm_cbe_kinds __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _2;
  uint32_t llvm_cbe_call;
  uint32_t c;
  uint32_t c__PHI_TEMPORARY;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint8_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call5;
  uint8_t llvm_cbe_call11;
  uint8_t llvm_cbe_call17;
  uint32_t llvm_cbe_call25;

  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_kinds))), ((uint8_t*)(&__const_OC_main_OC_kinds)), 24);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)3u)){
  _2 = *((&llvm_cbe_kinds.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _2);
  ;
  ;
  c__PHI_TEMPORARY = 0;   /* for PHI node */
  n__PHI_TEMPORARY = 7;   /* for PHI node */

){
  llvm_cbe_call2 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), n);
  c = llvm_add_u32(c, 1);
  ;
  if (!(((c == 20u)&1))) {
  c__PHI_TEMPORARY = c;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  ;
  switch (i) {
  default:
    n__PHI_TEMPORARY = n;   /* for PHI node */
  case 0u:
    break;
  case 1u:
    break;
  case 2u:
    break;
  }

  n = n__PHI_TEMPORARY;
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = llvm_add_u32(n, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = llvm_add_u32(n, 2);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n__PHI_TEMPORARY = n;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_call1 = is_brazilian(n);
  if (!(((llvm_cbe_call1 != ((uint8_t)0))&1))) {
    c__PHI_TEMPORARY = c;   /* for PHI node */
  }

  n = n__PHI_TEMPORARY;
  ;
  n = llvm_add_u32(n, 2);
  ;

}
){
  llvm_cbe_call11 = is_prime(n);
  if ((((~((((llvm_cbe_call11 != ((uint8_t)0))&1))))&1))) {
    n__PHI_TEMPORARY = n;   /* for PHI node */
}
  n = n__PHI_TEMPORARY;
  ;
  n = llvm_add_u32(n, 2);
  ;
  
;
}
  break;
  c = c__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_call1 = is_brazilian(n);
  llvm_cbe_tobool = ((llvm_cbe_call1 != ((uint8_t)0))&1);
    if (!(((llvm_cbe_call1 != ((uint8_t)0))&1))) {
    c__PHI_TEMPORARY = c;   /* for PHI node */
  }

;
}
  llvm_cbe_call5 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  break;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  ;
  c__PHI_TEMPORARY = 0;   /* for PHI node */
  n__PHI_TEMPORARY = 7;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)c) < ((int32_t)100000u)){
  llvm_cbe_call17 = is_brazilian(n);
  if ((((llvm_cbe_call17 != ((uint8_t)0))&1))) {
  c = llvm_add_u32(c, 1);
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */

}
  c = c__PHI_TEMPORARY;
  ;

  n = llvm_add_u32(n, 1);
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call25 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), (llvm_sub_u32(n, 1)));
  return 0;
}

