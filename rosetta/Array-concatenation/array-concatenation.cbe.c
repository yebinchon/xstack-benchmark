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
  uint8_t* llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_an_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_bn_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_p;    /* Address-exposed local */
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint8_t* llvm_cbe_call;
  uint8_t* _4;
  uint8_t* _5;
  uint64_t _6;
  uint64_t _7;
  uint8_t* _8;
  uint8_t* _9;
  uint64_t _10;
  uint64_t _11;
  uint8_t* _12;
  uint64_t _13;
  uint64_t _14;
  uint8_t* _15;
  uint8_t* _16;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_an_2e_addr = llvm_cbe_an;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  llvm_cbe_bn_2e_addr = llvm_cbe_bn;
  ;
  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  ;
  _1 = llvm_cbe_s_2e_addr;
  _2 = llvm_cbe_an_2e_addr;
  _3 = llvm_cbe_bn_2e_addr;
  llvm_cbe_call = malloc((llvm_mul_u64(_1, (llvm_add_u64(_2, _3)))));
  llvm_cbe_p = llvm_cbe_call;
  _4 = llvm_cbe_p;
  _5 = llvm_cbe_a_2e_addr;
  _6 = llvm_cbe_an_2e_addr;
  _7 = llvm_cbe_s_2e_addr;
  _8 = memcpy(_4, _5, (llvm_mul_u64(_6, _7)));
  _9 = llvm_cbe_p;
  _10 = llvm_cbe_an_2e_addr;
  _11 = llvm_cbe_s_2e_addr;
  _12 = llvm_cbe_b_2e_addr;
  _13 = llvm_cbe_bn_2e_addr;
  _14 = llvm_cbe_s_2e_addr;
  _15 = memcpy(((&_9[((int64_t)(llvm_mul_u64(_10, _11)))])), _12, (llvm_mul_u64(_13, _14)));
  _16 = llvm_cbe_p;
  return _16;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t* llvm_cbe_c;    /* Address-exposed local */
  uint8_t* llvm_cbe_call;
  uint32_t _17;
  uint32_t* _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t llvm_cbe_call1;
  uint32_t _21;
  uint32_t* _22;

  llvm_cbe_retval = 0;
  ;
  ;
  llvm_cbe_call = array_concat(((uint8_t*)(&a)), 5, ((uint8_t*)(&b)), 5, 4);
  llvm_cbe_c = (((uint32_t*)llvm_cbe_call));
  llvm_cbe_i = 0;

  _17 = llvm_cbe_i;
while (((uint32_t)_17) < ((uint32_t)10u)){
  _18 = llvm_cbe_c;
  _19 = llvm_cbe_i;
  _20 = *((&_18[((int64_t)(((uint64_t)(uint32_t)_19)))]));
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), _20);

  _21 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_21, 1));

  _17 = llvm_cbe_i;
}
  _22 = llvm_cbe_c;
  free((((uint8_t*)_22)));
  return 0;
}

