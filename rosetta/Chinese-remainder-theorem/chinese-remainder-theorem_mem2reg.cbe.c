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
struct l_array_3_uint32_t {
  uint32_t array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t mul_inv(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t chinese_remainder(uint32_t*, uint32_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint32_t __const_OC_main_OC_n = { { 3, 5, 7 } };
static struct l_array_3_uint32_t __const_OC_main_OC_a = { { 2, 3, 2 } };
static struct l_array_4_uint8_t _OC_str = { "%d\n" };


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

uint32_t mul_inv(uint32_t llvm_cbe_a, uint32_t llvm_cbe_b) {
  uint32_t llvm_cbe_x0_2e_0;
  uint32_t llvm_cbe_x0_2e_0__PHI_TEMPORARY;
  uint32_t x1;
  uint32_t x1__PHI_TEMPORARY;
  uint32_t llvm_cbe_b_2e_addr_2e_0;
  uint32_t llvm_cbe_b_2e_addr_2e_0__PHI_TEMPORARY;
  uint32_t a;
  uint32_t a__PHI_TEMPORARY;
  uint32_t b;
  uint32_t x0;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  ;
  if ((((llvm_cbe_b == 1u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  llvm_cbe_x0_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  x1__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_b_2e_addr_2e_0__PHI_TEMPORARY = llvm_cbe_b;   /* for PHI node */
  a__PHI_TEMPORARY = llvm_cbe_a;   /* for PHI node */

  llvm_cbe_x0_2e_0 = llvm_cbe_x0_2e_0__PHI_TEMPORARY;
  x1 = x1__PHI_TEMPORARY;
  llvm_cbe_b_2e_addr_2e_0 = llvm_cbe_b_2e_addr_2e_0__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
while (((int32_t)a) > ((int32_t)1u)){
  ;
  ;
  b = llvm_srem_u32(a, llvm_cbe_b_2e_addr_2e_0);
  ;
  ;
  ;
  x0 = llvm_sub_u32(x1, (llvm_mul_u32((llvm_sdiv_u32(a, llvm_cbe_b_2e_addr_2e_0)), llvm_cbe_x0_2e_0)));
  ;
  ;
  llvm_cbe_x0_2e_0__PHI_TEMPORARY = x0;   /* for PHI node */
  x1__PHI_TEMPORARY = llvm_cbe_x0_2e_0;   /* for PHI node */
  llvm_cbe_b_2e_addr_2e_0__PHI_TEMPORARY = b;   /* for PHI node */
  a__PHI_TEMPORARY = llvm_cbe_b_2e_addr_2e_0;   /* for PHI node */

  llvm_cbe_x0_2e_0 = llvm_cbe_x0_2e_0__PHI_TEMPORARY;
  x1 = x1__PHI_TEMPORARY;
  llvm_cbe_b_2e_addr_2e_0 = llvm_cbe_b_2e_addr_2e_0__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
}
  if (!(((((int32_t)x1) < ((int32_t)0u))&1))) {
  x1 = llvm_add_u32(x1, llvm_cbe_b);
  ;
  x1__PHI_TEMPORARY = x1;   /* for PHI node */

}
  x1 = x1__PHI_TEMPORARY;
  ;
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = x1;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


uint32_t chinese_remainder(uint32_t* llvm_cbe_n, uint32_t* llvm_cbe_a, uint32_t llvm_cbe_len) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t prod;
  uint32_t prod__PHI_TEMPORARY;
  uint32_t _1;
  uint32_t sum;
  uint32_t sum__PHI_TEMPORARY;
  uint32_t _2;
  uint32_t p;
  uint32_t _3;
  uint32_t _4;
  uint32_t llvm_cbe_call;

  ;
  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  prod__PHI_TEMPORARY = 1;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  prod = prod__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_len)){
  _1 = *((&llvm_cbe_n[((int64_t)(((int64_t)(int32_t)i)))]));
  prod = llvm_mul_u32(prod, _1);
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  prod__PHI_TEMPORARY = prod;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  prod = prod__PHI_TEMPORARY;
  ;
  ;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  sum__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_len)){
  _2 = *((&llvm_cbe_n[((int64_t)(((int64_t)(int32_t)i)))]));
  p = llvm_sdiv_u32(prod, _2);
  ;
  _3 = *((&llvm_cbe_a[((int64_t)(((int64_t)(int32_t)i)))]));
  _4 = *((&llvm_cbe_n[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = mul_inv(p, _4);
  sum = llvm_add_u32(sum, (llvm_mul_u32((llvm_mul_u32(_3, llvm_cbe_call)), p)));
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  sum__PHI_TEMPORARY = sum;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  ;
  ;
}
  return (llvm_srem_u32(sum, prod));
}


int main(void) {
  struct l_array_3_uint32_t llvm_cbe_n;    /* Address-exposed local */
  struct l_array_3_uint32_t llvm_cbe_a;    /* Address-exposed local */
  uint8_t* _5;
  uint8_t* _6;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;

  ;
  _5 = memcpy((((uint8_t*)(&llvm_cbe_n))), ((uint8_t*)(&__const_OC_main_OC_n)), 12);
  ;
  _6 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_main_OC_a)), 12);
  llvm_cbe_call = chinese_remainder(((&llvm_cbe_n.array[((int64_t)0)])), ((&llvm_cbe_a.array[((int64_t)0)])), 3);
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  return 0;
}

