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
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t dot_product(uint32_t*, uint32_t*, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint32_t __const_OC_main_OC_a = { { 1, 3, -5 } };
static struct l_array_3_uint32_t __const_OC_main_OC_b = { { 4, -2, -1 } };
static struct l_array_4_uint8_t _OC_str = { "%d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}


/* Function Bodies */

int main(void) {
  struct l_array_3_uint32_t llvm_cbe_a;    /* Address-exposed local */
  struct l_array_3_uint32_t llvm_cbe_b;    /* Address-exposed local */
  uint8_t* _1;
  uint8_t* _2;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;

  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_a))), ((uint8_t*)(&__const_OC_main_OC_a)), 12);
  ;
  _2 = memcpy((((uint8_t*)(&llvm_cbe_b))), ((uint8_t*)(&__const_OC_main_OC_b)), 12);
  llvm_cbe_call = dot_product(((&llvm_cbe_a.array[((int64_t)0)])), ((&llvm_cbe_b.array[((int64_t)0)])), 3);
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  return 0;
}


uint32_t dot_product(uint32_t* llvm_cbe_a, uint32_t* llvm_cbe_b, uint64_t llvm_cbe_n) {
  uint32_t sum;
  uint32_t sum__PHI_TEMPORARY;
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint32_t _3;
  uint32_t _4;

  ;
  ;
  ;
  ;
  ;
  sum__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)i) < ((uint64_t)llvm_cbe_n)){
  _3 = *((&llvm_cbe_a[((int64_t)i)]));
  _4 = *((&llvm_cbe_b[((int64_t)i)]));
  sum = llvm_add_u32(sum, (llvm_mul_u32(_3, _4)));
  ;

  i = llvm_add_u64(i, 1);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
}
  return sum;
}

