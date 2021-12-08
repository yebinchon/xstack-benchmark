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
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_64_uint8_t {
  uint8_t array[64];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t isBal(uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void shuffle(uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t rand(void) __ATTRIBUTELIST__((nothrow));
void genSeq(uint8_t*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void doSeq(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_6_uint8_t _OC_str = { "False" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "True" };
static struct l_array_10_uint8_t _OC_str_OC_2 = { "'%s': %s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

uint32_t isBal(uint8_t* llvm_cbe_s, uint32_t llvm_cbe_l) {
  uint32_t l;
  uint32_t l__PHI_TEMPORARY;
  uint32_t c;
  uint32_t c__PHI_TEMPORARY;
  uint8_t _1;
  uint8_t _2;

  ;
  ;
  ;
  l__PHI_TEMPORARY = llvm_cbe_l;   /* for PHI node */
  c__PHI_TEMPORARY = 0;   /* for PHI node */

  l = l__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
  l = llvm_add_u32(l, -1);
  ;
while (l != 0u){
  _1 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)l)))]));
  if (((((((int32_t)(int8_t)_1)) == 93u)&1))) {
  c = llvm_add_u32(c, 1);
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  ;
  l__PHI_TEMPORARY = l;   /* for PHI node */
  c__PHI_TEMPORARY = c;   /* for PHI node */

  l = l__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
  l = llvm_add_u32(l, -1);
  ;
  if (!(((l != 0u)&1))) {
  }

  } else {
  _2 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)l)))]));
  if (((((((int32_t)(int8_t)_2)) == 91u)&1))) {
  c = llvm_add_u32(c, -1);
  ;
  if ((((((int32_t)c) < ((int32_t)0u))&1))) {
    c__PHI_TEMPORARY = c;   /* for PHI node */
  c = c__PHI_TEMPORARY;
  ;
  return (((uint32_t)(bool)(((~((((c != 0u)&1))))&1))));
}
  c__PHI_TEMPORARY = c;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */

  } else {
    c__PHI_TEMPORARY = c;   /* for PHI node */
}
}
  l = l__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
  l = llvm_add_u32(l, -1);
  ;
}
  c__PHI_TEMPORARY = c;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  ;
  return (((uint32_t)(bool)(((~((((c != 0u)&1))))&1))));
}


void shuffle(uint8_t* llvm_cbe_s, uint32_t llvm_cbe_h) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t x;
  uint8_t _3;
  uint8_t _4;

  ;
  ;
  ;
  i__PHI_TEMPORARY = llvm_cbe_h;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, -1);
  ;
while (i != 0u){
  llvm_cbe_call = rand();
  x = llvm_srem_u32(llvm_cbe_call, llvm_cbe_h);
  ;
  _3 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)x)))]));
  ;
  _4 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)x)))])) = _4;
  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))])) = (((uint8_t)(((int32_t)(int8_t)_3))));
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, -1);
  ;
}
  return;
}


void genSeq(uint8_t* llvm_cbe_s, uint32_t llvm_cbe_n) {
  uint8_t* _5;
  uint8_t* _6;

  ;
  ;
  if ((((llvm_cbe_n != 0u)&1))) {
  _5 = memset(llvm_cbe_s, 91, (((int64_t)(int32_t)llvm_cbe_n)));
  _6 = memset(((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)llvm_cbe_n)))])), 93, (((int64_t)(int32_t)llvm_cbe_n)));
  shuffle(llvm_cbe_s, (llvm_mul_u32(llvm_cbe_n, 2)));

  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(llvm_cbe_n, 2)))))])) = 0;
}
  *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)(llvm_mul_u32(llvm_cbe_n, 2)))))])) = 0;
}


void doSeq(uint32_t llvm_cbe_n) {
  __MSALIGN__(16) struct l_array_64_uint8_t llvm_cbe_s __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint8_t* o;
  uint8_t* o__PHI_TEMPORARY;
  uint32_t llvm_cbe_call3;

  ;
  ;
  ;
  genSeq(((&llvm_cbe_s.array[((int64_t)0)])), llvm_cbe_n);
  llvm_cbe_call = isBal(((&llvm_cbe_s.array[((int64_t)0)])), (llvm_mul_u32(llvm_cbe_n, 2)));
  if ((((llvm_cbe_call != 0u)&1))) {
  ;
  o__PHI_TEMPORARY = ((&_OC_str_OC_1.array[((int64_t)0)]));   /* for PHI node */

    o__PHI_TEMPORARY = ((&_OC_str_OC_1.array[((int64_t)0)]));   /* for PHI node */
  o = o__PHI_TEMPORARY;
  ;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_s.array[((int64_t)0)])), o);
}
  o = o__PHI_TEMPORARY;
  ;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_s.array[((int64_t)0)])), o);
}


int main(void) {
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;

  ;
  n__PHI_TEMPORARY = 0;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
while (((int32_t)n) < ((int32_t)9u)){
  n = llvm_add_u32(n, 1);
  ;
  doSeq(n);
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
}
  return 0;
}

