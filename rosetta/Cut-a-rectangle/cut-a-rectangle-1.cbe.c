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
  uint32_t llvm_cbe_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_t;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint64_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint8_t* _11;
  uint32_t _12;
  uint8_t* llvm_cbe_arrayidx;
  uint8_t _13;
  uint8_t* _14;
  uint32_t _15;
  uint32_t _16;
  uint8_t* llvm_cbe_arrayidx8;
  uint8_t _17;
  uint32_t _18;
  uint8_t* _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint8_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t _29;
  uint32_t _30;
  uint8_t* _31;
  uint32_t _32;
  uint8_t* llvm_cbe_arrayidx29;
  uint8_t _33;
  uint8_t* _34;
  uint32_t _35;
  uint32_t _36;
  uint8_t* llvm_cbe_arrayidx32;
  uint8_t _37;
  uint64_t _38;
  uint64_t _39;
  uint64_t _40;

  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  ;
  ;
  _1 = llvm_cbe_y_2e_addr;
  if (!(((_1 != 0u)&1))) {
  _40 = cnt;
  cnt = (llvm_add_u64(_40, 2));

  return;
}
  _2 = llvm_cbe_y_2e_addr;
  _3 = h;
  if ((((_2 == _3)&1))) {
  _39 = cnt;
  cnt = (llvm_add_u64(_39, 2));

  return;
}
  _4 = llvm_cbe_x_2e_addr;
  if (!(((_4 != 0u)&1))) {
  _38 = cnt;
  cnt = (llvm_add_u64(_38, 2));

  return;
}
  _5 = llvm_cbe_x_2e_addr;
  _6 = w;
  if ((((_5 == _6)&1))) {
  _7 = cnt;
  cnt = (llvm_add_u64(_7, 2));

  return;
}
  _8 = llvm_cbe_y_2e_addr;
  _9 = w;
  _10 = llvm_cbe_x_2e_addr;
  llvm_cbe_t = (llvm_add_u32((llvm_mul_u32(_8, (llvm_add_u32(_9, 1)))), _10));
  _11 = grid;
  _12 = llvm_cbe_t;
  llvm_cbe_arrayidx = (&_11[((int64_t)(((int64_t)(int32_t)_12)))]);
  _13 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (llvm_add_u8(_13, 1));
  _14 = grid;
  _15 = len;
  _16 = llvm_cbe_t;
  llvm_cbe_arrayidx8 = (&_14[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_15, _16)))))]);
  _17 = *llvm_cbe_arrayidx8;
  *llvm_cbe_arrayidx8 = (llvm_add_u8(_17, 1));
  llvm_cbe_i = 0;

  _18 = llvm_cbe_i;
while (((int32_t)_18) < ((int32_t)4u)){
  _19 = grid;
  _20 = llvm_cbe_t;
  _21 = llvm_cbe_i;
  _22 = *((&next.array[((int64_t)(((int64_t)(int32_t)_21)))]));
  _23 = *((&_19[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_20, _22)))))]));
  if (!(((_23 != ((uint8_t)0))&1))) {
  _24 = llvm_cbe_y_2e_addr;
  _25 = llvm_cbe_i;
  _26 = *((&(*((&dir.array[((int64_t)(((int64_t)(int32_t)_25)))]))).array[((int64_t)0)]));
  _27 = llvm_cbe_x_2e_addr;
  _28 = llvm_cbe_i;
  _29 = *((&(*((&dir.array[((int64_t)(((int64_t)(int32_t)_28)))]))).array[((int64_t)1)]));
  walk((llvm_add_u32(_24, _26)), (llvm_add_u32(_27, _29)));

}

  _30 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_30, 1));

  _18 = llvm_cbe_i;
}
  _31 = grid;
  _32 = llvm_cbe_t;
  llvm_cbe_arrayidx29 = (&_31[((int64_t)(((int64_t)(int32_t)_32)))]);
  _33 = *llvm_cbe_arrayidx29;
  *llvm_cbe_arrayidx29 = (llvm_add_u8(_33, -1));
  _34 = grid;
  _35 = len;
  _36 = llvm_cbe_t;
  llvm_cbe_arrayidx32 = (&_34[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_35, _36)))))]);
  _37 = *llvm_cbe_arrayidx32;
  *llvm_cbe_arrayidx32 = (llvm_add_u8(_37, -1));

  return;
}


uint64_t solve(uint32_t llvm_cbe_hh, uint32_t llvm_cbe_ww, uint32_t llvm_cbe_recur) {
  uint64_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_hh_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_ww_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_recur_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_t;    /* Address-exposed local */
  uint32_t llvm_cbe_cx;    /* Address-exposed local */
  uint32_t llvm_cbe_cy;    /* Address-exposed local */
  uint32_t llvm_cbe_x;    /* Address-exposed local */
  uint32_t _41;
  uint32_t _42;
  uint32_t _43;
  uint32_t _44;
  uint32_t _45;
  uint32_t _46;
  uint32_t _47;
  uint32_t _48;
  uint32_t _49;
  uint32_t _50;
  uint32_t _51;
  uint32_t _52;
  uint32_t _53;
  uint32_t _54;
  uint32_t _55;
  uint32_t _56;
  uint8_t* _57;
  uint32_t _58;
  uint8_t* llvm_cbe_call;
  uint8_t* _59;
  uint32_t _60;
  uint8_t* _61;
  uint32_t _62;
  uint32_t _63;
  uint32_t _64;
  uint32_t _65;
  uint32_t _66;
  uint32_t _67;
  uint32_t _68;
  uint32_t _69;
  uint32_t _70;
  uint8_t* _71;
  uint32_t _72;
  uint8_t* _73;
  uint32_t _74;
  uint32_t _75;
  uint32_t _76;
  uint32_t _77;
  uint32_t _78;
  uint64_t _79;
  uint32_t _80;
  uint32_t _81;
  uint64_t _82;
  uint32_t _83;
  uint32_t _84;
  uint32_t _85;
  uint32_t _86;
  uint64_t llvm_cbe_call43;
  uint64_t _87;
  uint64_t _88;

  llvm_cbe_hh_2e_addr = llvm_cbe_hh;
  ;
  llvm_cbe_ww_2e_addr = llvm_cbe_ww;
  ;
  llvm_cbe_recur_2e_addr = llvm_cbe_recur;
  ;
  ;
  ;
  ;
  ;
  _41 = llvm_cbe_hh_2e_addr;
  h = _41;
  _42 = llvm_cbe_ww_2e_addr;
  w = _42;
  _43 = h;
  if (((((_43 & 1) != 0u)&1))) {
  _44 = w;
  llvm_cbe_t = _44;
  _45 = h;
  w = _45;
  _46 = llvm_cbe_t;
  h = _46;

}
  _47 = h;
  if (((((_47 & 1) != 0u)&1))) {
  llvm_cbe_retval = 0;

  _88 = llvm_cbe_retval;
  return _88;
}
  _48 = w;
  if ((((_48 == 1u)&1))) {
  llvm_cbe_retval = 1;

  _88 = llvm_cbe_retval;
  return _88;
}
  _49 = w;
  if ((((_49 == 2u)&1))) {
  _50 = h;
  llvm_cbe_retval = (((int64_t)(int32_t)_50));

  _88 = llvm_cbe_retval;
  return _88;
}
  _51 = h;
  if ((((_51 == 2u)&1))) {
  _52 = w;
  llvm_cbe_retval = (((int64_t)(int32_t)_52));

  _88 = llvm_cbe_retval;
  return _88;
}
  _53 = h;
  llvm_cbe_cy = (llvm_sdiv_u32(_53, 2));
  _54 = w;
  llvm_cbe_cx = (llvm_sdiv_u32(_54, 2));
  _55 = h;
  _56 = w;
  len = (llvm_mul_u32((llvm_add_u32(_55, 1)), (llvm_add_u32(_56, 1))));
  _57 = grid;
  _58 = len;
  llvm_cbe_call = realloc(_57, (((int64_t)(int32_t)_58)));
  grid = llvm_cbe_call;
  _59 = grid;
  _60 = len;
  len = (llvm_add_u32(_60, -1));
  _61 = memset(_59, 0, (((int64_t)(int32_t)_60)));
  *((&next.array[((int64_t)0)])) = -1;
  _62 = w;
  *((&next.array[((int64_t)1)])) = (llvm_sub_u32((llvm_neg_u32(_62)), 1));
  *((&next.array[((int64_t)2)])) = 1;
  _63 = w;
  *((&next.array[((int64_t)3)])) = (llvm_add_u32(_63, 1));
  _64 = llvm_cbe_recur_2e_addr;
  if ((((_64 != 0u)&1))) {
  cnt = 0;

}
  _65 = llvm_cbe_cx;
  llvm_cbe_x = (llvm_add_u32(_65, 1));

  _66 = llvm_cbe_x;
  _67 = w;
while (((int32_t)_66) < ((int32_t)_67)){
  _68 = llvm_cbe_cy;
  _69 = w;
  _70 = llvm_cbe_x;
  llvm_cbe_t = (llvm_add_u32((llvm_mul_u32(_68, (llvm_add_u32(_69, 1)))), _70));
  _71 = grid;
  _72 = llvm_cbe_t;
  *((&_71[((int64_t)(((int64_t)(int32_t)_72)))])) = 1;
  _73 = grid;
  _74 = len;
  _75 = llvm_cbe_t;
  *((&_73[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_74, _75)))))])) = 1;
  _76 = llvm_cbe_cy;
  _77 = llvm_cbe_x;
  walk((llvm_sub_u32(_76, 1)), _77);

  _78 = llvm_cbe_x;
  llvm_cbe_x = (llvm_add_u32(_78, 1));

  _66 = llvm_cbe_x;
  _67 = w;
}
  _79 = cnt;
  cnt = (llvm_add_u64(_79, 1));
  _80 = h;
  _81 = w;
  if ((((_80 == _81)&1))) {
  _82 = cnt;
  cnt = (llvm_mul_u64(_82, 2));

  } else {
  _83 = w;
  if (((((_83 & 1) != 0u)&1))) {

  } else {
  _84 = llvm_cbe_recur_2e_addr;
  if ((((_84 != 0u)&1))) {
  _85 = w;
  _86 = h;
  llvm_cbe_call43 = solve(_85, _86, 0);


  } else {

}
}
}
  _87 = cnt;
  llvm_cbe_retval = _87;

  _88 = llvm_cbe_retval;
  return _88;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_y;    /* Address-exposed local */
  uint32_t llvm_cbe_x;    /* Address-exposed local */
  uint32_t _89;
  uint32_t _90;
  uint32_t _91;
  uint32_t _92;
  uint32_t _93;
  uint32_t _94;
  uint32_t _95;
  uint32_t _96;
  uint32_t _97;
  uint64_t llvm_cbe_call;
  uint32_t llvm_cbe_call6;
  uint32_t _98;
  uint32_t _99;
  uint32_t _100;
  uint32_t _101;
  uint32_t _102;
  uint32_t _103;
  uint64_t llvm_cbe_call_2e_splitted1;
  uint32_t llvm_cbe_call6_2e_splitted1;

  llvm_cbe_retval = 0;
  ;
  ;
  llvm_cbe_y = 1;

  _89 = llvm_cbe_y;
while (((int32_t)_89) <= ((int32_t)10u)){
  llvm_cbe_x = 1;

  _90 = llvm_cbe_x;
  _91 = llvm_cbe_y;
while (((int32_t)_90) <= ((int32_t)_91)){
  _92 = llvm_cbe_x;
  if (((((_92 & 1) != 0u)&1))) {
  _93 = llvm_cbe_y;
  if (!((((_93 & 1) != 0u)&1))) {
  _94 = llvm_cbe_y;
  _95 = llvm_cbe_x;
  _96 = llvm_cbe_y;
  _97 = llvm_cbe_x;
  llvm_cbe_call = solve(_96, _97, 1);
  llvm_cbe_call6 = printf(((&_OC_str.array[((int64_t)0)])), _94, _95, llvm_cbe_call);

}
  } else {
  _100 = llvm_cbe_y;
  _101 = llvm_cbe_x;
  _102 = llvm_cbe_y;
  _103 = llvm_cbe_x;
  llvm_cbe_call_2e_splitted1 = solve(_102, _103, 1);
  llvm_cbe_call6_2e_splitted1 = printf(((&_OC_str.array[((int64_t)0)])), _100, _101, llvm_cbe_call_2e_splitted1);

}

  _98 = llvm_cbe_x;
  llvm_cbe_x = (llvm_add_u32(_98, 1));

  _90 = llvm_cbe_x;
  _91 = llvm_cbe_y;
}

  _99 = llvm_cbe_y;
  llvm_cbe_y = (llvm_add_u32(_99, 1));

  _89 = llvm_cbe_y;
}
  return 0;
}

