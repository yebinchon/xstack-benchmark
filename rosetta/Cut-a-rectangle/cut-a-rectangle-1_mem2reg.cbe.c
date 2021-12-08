/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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
struct l_array_4_uint32_t {
  uint32_t array[4];
};
struct l_array_2_uint32_t {
  uint32_t array[2];
};
struct l_array_4_struct_AC_l_array_2_uint32_t {
  struct l_array_2_uint32_t array[4];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};

/* External Global Variable Declarations */

/* Function Declarations */
void walk(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t solve(uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* realloc(uint8_t*, uint64_t) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
uint8_t* grid;
uint32_t h __ATTRIBUTE_WEAK__;
uint32_t w __ATTRIBUTE_WEAK__;
uint64_t cnt __ATTRIBUTE_WEAK__;
uint32_t len __ATTRIBUTE_WEAK__;
static __MSALIGN__(16) struct l_array_4_uint32_t next __attribute__((aligned(16)));
static __MSALIGN__(16) struct l_array_4_struct_AC_l_array_2_uint32_t dir __attribute__((aligned(16))) = { { { { 0, -1 } }, { { -1, 0 } }, { { 0, 1 } }, { { 1, 0 } } } };
static struct l_array_15_uint8_t _OC_str = { "%d x %d: %llu\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t llvm_add_u8(uint8_t a, uint8_t b) {
  uint8_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_neg_u32(uint32_t a) {
  uint32_t r = -a;
  return r;
}


/* Function Bodies */

void walk(uint32_t llvm_cbe_y, uint32_t llvm_cbe_x) {
  uint32_t _1;
  uint32_t _2;
  uint64_t _3;
  uint32_t _4;
  uint32_t t;
  uint8_t* _5;
  uint8_t* llvm_cbe_arrayidx;
  uint8_t _6;
  uint8_t* _7;
  uint32_t _8;
  uint8_t* llvm_cbe_arrayidx8;
  uint8_t _9;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _10;
  uint32_t _11;
  uint8_t _12;
  uint32_t _13;
  uint32_t _14;
  uint8_t* _15;
  uint8_t* llvm_cbe_arrayidx29;
  uint8_t _16;
  uint8_t* _17;
  uint32_t _18;
  uint8_t* llvm_cbe_arrayidx32;
  uint8_t _19;
  uint64_t _20;
  uint64_t _21;
  uint64_t _22;

  ;
  ;
  if (!(((llvm_cbe_y != 0u)&1))) {
  _22 = cnt;
  cnt = (llvm_add_u64(_22, 2));

  return;
}
  _1 = h;
  if ((((llvm_cbe_y == _1)&1))) {
  _21 = cnt;
  cnt = (llvm_add_u64(_21, 2));

  return;
}
  if (!(((llvm_cbe_x != 0u)&1))) {
  _20 = cnt;
  cnt = (llvm_add_u64(_20, 2));

  return;
}
  _2 = w;
  if ((((llvm_cbe_x == _2)&1))) {
  _3 = cnt;
  cnt = (llvm_add_u64(_3, 2));

  return;
}
  _4 = w;
  t = llvm_add_u32((llvm_mul_u32(llvm_cbe_y, (llvm_add_u32(_4, 1)))), llvm_cbe_x);
  ;
  _5 = grid;
  llvm_cbe_arrayidx = (&_5[((int64_t)(((int64_t)(int32_t)t)))]);
  _6 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (llvm_add_u8(_6, 1));
  _7 = grid;
  _8 = len;
  llvm_cbe_arrayidx8 = (&_7[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_8, t)))))]);
  _9 = *llvm_cbe_arrayidx8;
  *llvm_cbe_arrayidx8 = (llvm_add_u8(_9, 1));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)4u)){
  _10 = grid;
  _11 = *((&next.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _12 = *((&_10[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(t, _11)))))]));
  if (!(((_12 != ((uint8_t)0))&1))) {
  _13 = *((&(*((&dir.array[((int64_t)(((int64_t)(int32_t)i)))]))).array[((int64_t)0)]));
  _14 = *((&(*((&dir.array[((int64_t)(((int64_t)(int32_t)i)))]))).array[((int64_t)1)]));
  walk((llvm_add_u32(llvm_cbe_y, _13)), (llvm_add_u32(llvm_cbe_x, _14)));

}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  _15 = grid;
  llvm_cbe_arrayidx29 = (&_15[((int64_t)(((int64_t)(int32_t)t)))]);
  _16 = *llvm_cbe_arrayidx29;
  *llvm_cbe_arrayidx29 = (llvm_add_u8(_16, -1));
  _17 = grid;
  _18 = len;
  llvm_cbe_arrayidx32 = (&_17[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_18, t)))))]);
  _19 = *llvm_cbe_arrayidx32;
  *llvm_cbe_arrayidx32 = (llvm_add_u8(_19, -1));

  return;
}


uint64_t solve(uint32_t llvm_cbe_hh, uint32_t llvm_cbe_ww, uint32_t llvm_cbe_recur) {
  uint32_t _23;
  uint32_t t;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint64_t llvm_cbe_conv;
  uint32_t _29;
  uint32_t _30;
  uint64_t llvm_cbe_conv13;
  uint32_t _31;
  uint32_t cy;
  uint32_t _32;
  uint32_t cx;
  uint32_t _33;
  uint32_t _34;
  uint8_t* _35;
  uint32_t _36;
  uint8_t* llvm_cbe_call;
  uint8_t* _37;
  uint32_t _38;
  uint8_t* _39;
  uint32_t _40;
  uint32_t _41;
  uint32_t x;
  uint32_t x__PHI_TEMPORARY;
  uint32_t _42;
  uint32_t _43;
  uint8_t* _44;
  uint8_t* _45;
  uint32_t _46;
  uint64_t _47;
  uint32_t _48;
  uint32_t _49;
  uint64_t _50;
  uint32_t _51;
  uint32_t _52;
  uint32_t _53;
  uint64_t llvm_cbe_call43;
  uint64_t _54;
  uint64_t llvm_cbe_retval_2e_0;
  uint64_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  h = llvm_cbe_hh;
  w = llvm_cbe_ww;
  _23 = h;
  if (((((_23 & 1) != 0u)&1))) {
  t = w;
  ;
  _24 = h;
  w = _24;
  h = t;

}
  _25 = h;
  if (((((_25 & 1) != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _26 = w;
  if ((((_26 == 1u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _27 = w;
  if ((((_27 == 2u)&1))) {
  _28 = h;
  llvm_cbe_conv = ((int64_t)(int32_t)_28);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _29 = h;
  if ((((_29 == 2u)&1))) {
  _30 = w;
  llvm_cbe_conv13 = ((int64_t)(int32_t)_30);
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv13;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv13;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _31 = h;
  cy = llvm_sdiv_u32(_31, 2);
  ;
  _32 = w;
  cx = llvm_sdiv_u32(_32, 2);
  ;
  _33 = h;
  _34 = w;
  len = (llvm_mul_u32((llvm_add_u32(_33, 1)), (llvm_add_u32(_34, 1))));
  _35 = grid;
  _36 = len;
  llvm_cbe_call = realloc(_35, (((int64_t)(int32_t)_36)));
  grid = llvm_cbe_call;
  _37 = grid;
  _38 = len;
  len = (llvm_add_u32(_38, -1));
  _39 = memset(_37, 0, (((int64_t)(int32_t)_38)));
  *((&next.array[((int64_t)0)])) = -1;
  _40 = w;
  *((&next.array[((int64_t)1)])) = (llvm_sub_u32((llvm_neg_u32(_40)), 1));
  *((&next.array[((int64_t)2)])) = 1;
  _41 = w;
  *((&next.array[((int64_t)3)])) = (llvm_add_u32(_41, 1));
  if ((((llvm_cbe_recur != 0u)&1))) {
  cnt = 0;

}
  x = llvm_add_u32(cx, 1);
  ;
  x__PHI_TEMPORARY = x;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
  _42 = w;
while (((int32_t)x) < ((int32_t)_42)){
  _43 = w;
  t = llvm_add_u32((llvm_mul_u32(cy, (llvm_add_u32(_43, 1)))), x);
  ;
  _44 = grid;
  *((&_44[((int64_t)(((int64_t)(int32_t)t)))])) = 1;
  _45 = grid;
  _46 = len;
  *((&_45[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_46, t)))))])) = 1;
  walk((llvm_sub_u32(cy, 1)), x);

  x = llvm_add_u32(x, 1);
  ;
  x__PHI_TEMPORARY = x;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
  _42 = w;
}
  _47 = cnt;
  cnt = (llvm_add_u64(_47, 1));
  _48 = h;
  _49 = w;
  if ((((_48 == _49)&1))) {
  _50 = cnt;
  cnt = (llvm_mul_u64(_50, 2));

  } else {
  _51 = w;
  if (((((_51 & 1) != 0u)&1))) {

  } else {
  if ((((llvm_cbe_recur != 0u)&1))) {
  _52 = w;
  _53 = h;
  llvm_cbe_call43 = solve(_52, _53, 0);


  } else {

}
}
}
  _54 = cnt;
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = _54;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  uint32_t y;
  uint32_t y__PHI_TEMPORARY;
  uint32_t x;
  uint32_t x__PHI_TEMPORARY;
  uint64_t llvm_cbe_call;
  uint32_t llvm_cbe_call6;
  uint64_t llvm_cbe_call_2e_splitted1;
  uint32_t llvm_cbe_call6_2e_splitted1;

  ;
  y__PHI_TEMPORARY = 1;   /* for PHI node */

  y = y__PHI_TEMPORARY;
  ;
while (((int32_t)y) <= ((int32_t)10u)){
  ;
  x__PHI_TEMPORARY = 1;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
while (((int32_t)x) <= ((int32_t)y)){
  if (((((x & 1) != 0u)&1))) {
  if (!((((y & 1) != 0u)&1))) {
  llvm_cbe_call = solve(y, x, 1);
  llvm_cbe_call6 = printf(((&_OC_str.array[((int64_t)0)])), y, x, llvm_cbe_call);

}
  } else {
  llvm_cbe_call_2e_splitted1 = solve(y, x, 1);
  llvm_cbe_call6_2e_splitted1 = printf(((&_OC_str.array[((int64_t)0)])), y, x, llvm_cbe_call_2e_splitted1);

}

  x = llvm_add_u32(x, 1);
  ;
  x__PHI_TEMPORARY = x;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
}

  y = llvm_add_u32(y, 1);
  ;
  y__PHI_TEMPORARY = y;   /* for PHI node */

  y = y__PHI_TEMPORARY;
  ;
}
  return 0;
}

