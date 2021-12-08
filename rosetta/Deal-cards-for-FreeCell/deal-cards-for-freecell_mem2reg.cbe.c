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
struct l_array_14_uint32_t {
  uint32_t array[14];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_52_uint32_t {
  uint32_t array[52];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t rnd(void) __ATTRIBUTELIST__((noinline, nothrow));
void srnd(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void show(uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t putchar(uint32_t);
void deal(uint32_t, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t atoi(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint8_t* setlocale(uint32_t, uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_5_uint32_t s_suits __attribute__((aligned(16))) = { { 9827, 9830, 9829, 9824, 0 } };
__MSALIGN__(16) struct l_array_14_uint32_t s_nums __attribute__((aligned(16))) = { { 65, 50, 51, 52, 53, 54, 55, 56, 57, 84, 74, 81, 75, 0 } };
static uint32_t seed = 1;
static struct l_array_17_uint8_t _OC_str = { "  \x1B[%dm%lc\x1B[m%lc" };
static struct l_array_1_uint8_t _OC_str_OC_1;
static struct l_array_9_uint8_t _OC_str_OC_2 = { "Hand %d\n" };


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
static __forceinline uint32_t llvm_ashr_u32(int32_t a, int32_t b) {
  uint32_t r = a >> b;
  return r;
}


/* Function Bodies */

uint32_t rnd(void) {
  uint32_t _1;
  uint32_t llvm_cbe_and;

  _1 = seed;
  llvm_cbe_and = (llvm_add_u32((llvm_mul_u32(_1, 214013)), 2531011)) & 2147483647u;
  seed = llvm_cbe_and;
  return (llvm_ashr_u32(llvm_cbe_and, 16));
}


void srnd(uint32_t llvm_cbe_x) {
  ;
  seed = llvm_cbe_x;
}


void show(uint32_t* llvm_cbe_c) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t* c;
  uint32_t* c__PHI_TEMPORARY;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call7_2e_splitted1;

  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  c__PHI_TEMPORARY = llvm_cbe_c;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)52u)){
  _2 = *c;
  _3 = *c;
  _4 = *((&s_suits.array[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32(_3, 4)))))]));
  _5 = *c;
  _6 = *((&s_nums.array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_5, 4)))))]));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (llvm_sub_u32(32, (llvm_sdiv_u32((llvm_srem_u32((llvm_add_u32(1, _2)), 4)), 2)))), _4, _6);
  i = llvm_add_u32(i, 1);
  ;
  if (((((llvm_srem_u32(i, 8)) != 0u)&1))) {
  if ((((i == 52u)&1))) {
  llvm_cbe_call7 = putchar(10);

}
  } else {
  llvm_cbe_call7_2e_splitted1 = putchar(10);

}

  c = (&c[((int32_t)1)]);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  c__PHI_TEMPORARY = c;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  c = c__PHI_TEMPORARY;
  ;
  ;
}
  return;
}


void deal(uint32_t llvm_cbe_s, uint32_t* llvm_cbe_t) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t j;
  uint32_t s;
  uint32_t _7;

  ;
  ;
  srnd(llvm_cbe_s);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)52u)){
  *((&llvm_cbe_t[((int64_t)(((int64_t)(int32_t)i)))])) = (llvm_sub_u32(51, i));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)51u)){
  llvm_cbe_call = rnd();
  j = llvm_sub_u32(51, (llvm_srem_u32(llvm_cbe_call, (llvm_sub_u32(52, i)))));
  ;
  s = *((&llvm_cbe_t[((int64_t)(((int64_t)(int32_t)i)))]));
  ;
  _7 = *((&llvm_cbe_t[((int64_t)(((int64_t)(int32_t)j)))]));
  *((&llvm_cbe_t[((int64_t)(((int64_t)(int32_t)i)))])) = _7;
  *((&llvm_cbe_t[((int64_t)(((int64_t)(int32_t)j)))])) = s;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_c = (uint32_t)argc;
  uint8_t** llvm_cbe_v = (uint8_t**)argv;
  __MSALIGN__(16) struct l_array_52_uint32_t llvm_cbe_card __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _8;
  uint32_t s;
  uint32_t s__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  ;
  ;
  ;
  if ((((((int32_t)llvm_cbe_c) < ((int32_t)2u))&1))) {
  ;
  s__PHI_TEMPORARY = 11982;   /* for PHI node */

    s__PHI_TEMPORARY = 11982;   /* for PHI node */
  s = s__PHI_TEMPORARY;
  ;
  llvm_cbe_call2 = setlocale(6, ((&_OC_str_OC_1.array[((int64_t)0)])));
  deal(s, ((&llvm_cbe_card.array[((int64_t)0)])));
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), s);
  show(((&llvm_cbe_card.array[((int64_t)0)])));
  return 0;
}
  _8 = *((&llvm_cbe_v[((int64_t)1)]));
  s = atoi(_8);
  ;
  if ((((((int32_t)s) <= ((int32_t)0u))&1))) {
  ;
  s__PHI_TEMPORARY = 11982;   /* for PHI node */

    s__PHI_TEMPORARY = 11982;   /* for PHI node */
  s = s__PHI_TEMPORARY;
  ;
  llvm_cbe_call2 = setlocale(6, ((&_OC_str_OC_1.array[((int64_t)0)])));
  deal(s, ((&llvm_cbe_card.array[((int64_t)0)])));
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), s);
  show(((&llvm_cbe_card.array[((int64_t)0)])));
  return 0;
}
  s = s__PHI_TEMPORARY;
  ;
  llvm_cbe_call2 = setlocale(6, ((&_OC_str_OC_1.array[((int64_t)0)])));
  deal(s, ((&llvm_cbe_card.array[((int64_t)0)])));
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), s);
  show(((&llvm_cbe_card.array[((int64_t)0)])));
  return 0;
}

