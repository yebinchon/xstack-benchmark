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
struct l_array_5_uint32_t {
  uint32_t array[5];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint8_t* array_concat(uint8_t*, uint64_t, uint8_t*, uint64_t, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_5_uint32_t a __attribute__((aligned(16))) = { { 1, 2, 3, 4, 5 } };
__MSALIGN__(16) struct l_array_5_uint32_t b __attribute__((aligned(16))) = { { 6, 7, 8, 9, 0 } };
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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

uint8_t* array_concat(uint8_t* llvm_cbe_a, uint64_t llvm_cbe_an, uint8_t* llvm_cbe_b, uint64_t llvm_cbe_bn, uint64_t llvm_cbe_s) {
  uint8_t* p;
  uint8_t* _1;
  uint8_t* _2;

  ;
  ;
  ;
  ;
  ;
  p = malloc((llvm_mul_u64(llvm_cbe_s, (llvm_add_u64(llvm_cbe_an, llvm_cbe_bn)))));
  ;
  _1 = memcpy(p, llvm_cbe_a, (llvm_mul_u64(llvm_cbe_an, llvm_cbe_s)));
  _2 = memcpy(((&p[((int64_t)(llvm_mul_u64(llvm_cbe_an, llvm_cbe_s)))])), llvm_cbe_b, (llvm_mul_u64(llvm_cbe_bn, llvm_cbe_s)));
  return p;
}


int main(void) {
  uint8_t* llvm_cbe_call;
  uint32_t* c;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _3;
  uint32_t llvm_cbe_call1;

  llvm_cbe_call = array_concat(((uint8_t*)(&a)), 5, ((uint8_t*)(&b)), 5, 4);
  c = ((uint32_t*)llvm_cbe_call);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((uint32_t)i) < ((uint32_t)10u)){
  _3 = *((&c[((int64_t)(((uint64_t)(uint32_t)i)))]));
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), _3);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  free((((uint8_t*)c)));
  return 0;
}

