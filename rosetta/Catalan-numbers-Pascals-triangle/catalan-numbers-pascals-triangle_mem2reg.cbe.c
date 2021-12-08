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
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
uint32_t N = 15;
static struct l_array_3_uint8_t _OC_str = { "1 " };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%d " };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_call;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t catalan;
  uint32_t catalan__PHI_TEMPORARY;
  uint64_t den;
  uint64_t den__PHI_TEMPORARY;
  uint64_t num;
  uint64_t num__PHI_TEMPORARY;
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call11;

  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  n__PHI_TEMPORARY = 2;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  catalan = catalan__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)n) <= ((int32_t)15u)){
  ;
  ;
  ;
  den__PHI_TEMPORARY = 1;   /* for PHI node */
  num__PHI_TEMPORARY = 1;   /* for PHI node */
  k__PHI_TEMPORARY = 2;   /* for PHI node */
  catalan__PHI_TEMPORARY = catalan;   /* for PHI node */

  den = den__PHI_TEMPORARY;
  num = num__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  catalan = catalan__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
while (((int32_t)k) <= ((int32_t)n)){
  num = llvm_mul_u64(num, (((int64_t)(int32_t)(llvm_add_u32(n, k)))));
  ;
  den = llvm_mul_u64(den, (((int64_t)(int32_t)k)));
  ;
  catalan = ((uint32_t)(llvm_udiv_u64(num, den)));
  ;

  k = llvm_add_u32(k, 1);
  ;
  den__PHI_TEMPORARY = den;   /* for PHI node */
  num__PHI_TEMPORARY = num;   /* for PHI node */
  k__PHI_TEMPORARY = k;   /* for PHI node */
  catalan__PHI_TEMPORARY = catalan;   /* for PHI node */

  den = den__PHI_TEMPORARY;
  num = num__PHI_TEMPORARY;
  k = k__PHI_TEMPORARY;
  catalan = catalan__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
}
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), catalan);

  n = llvm_add_u32(n, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */
  catalan__PHI_TEMPORARY = catalan;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  catalan = catalan__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call11 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  return 0;
}

