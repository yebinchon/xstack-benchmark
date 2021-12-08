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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_34_uint8_t {
  uint8_t array[34];
};
struct l_array_38_uint8_t {
  uint8_t array[38];
};

/* External Global Variable Declarations */

/* Function Declarations */
void bf(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void ge(void) __ATTRIBUTELIST__((noinline, nothrow));
void acd(void) __ATTRIBUTELIST__((noinline, nothrow));
void foursquares(uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint32_t lo __ATTRIBUTE_WEAK__;
uint32_t f __ATTRIBUTE_WEAK__;
uint32_t hi __ATTRIBUTE_WEAK__;
uint32_t unique __ATTRIBUTE_WEAK__;
uint32_t a __ATTRIBUTE_WEAK__;
uint32_t c __ATTRIBUTE_WEAK__;
uint32_t d __ATTRIBUTE_WEAK__;
uint32_t g __ATTRIBUTE_WEAK__;
uint32_t e __ATTRIBUTE_WEAK__;
uint32_t b __ATTRIBUTE_WEAK__;
uint32_t solutions __ATTRIBUTE_WEAK__;
uint32_t show __ATTRIBUTE_WEAK__;
static struct l_array_22_uint8_t _OC_str = { "%d %d %d %d %d %d %d\n" };
static struct l_array_2_uint8_t _OC_str_OC_1 = { "\n" };
static struct l_array_34_uint8_t _OC_str_OC_2 = { "\n%d unique solutions in %d to %d\n" };
static struct l_array_38_uint8_t _OC_str_OC_3 = { "\n%d non-unique solutions in %d to %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

void bf(void) {
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t _33;
  uint32_t _34;
  uint32_t _35;
  uint32_t _36;
  uint32_t _37;
  uint32_t _38;
  uint32_t _39;
  uint32_t _40;
  uint32_t _41;
  uint32_t _42;
  uint32_t _43;
  uint32_t llvm_cbe_call;
  uint32_t _44;
  uint32_t _45;
  uint32_t _46;
  uint32_t _47;
  uint32_t _48;
  uint32_t _49;
  uint32_t _50;
  uint32_t _51;

  _1 = lo;
  f = _1;

  _2 = f;
  _3 = hi;
while (((int32_t)_2) <= ((int32_t)_3)){
  _4 = unique;
  if ((((_4 != 0u)&1))) {
  _5 = f;
  _6 = a;
  if ((((_5 != _6)&1))) {
  _7 = f;
  _8 = c;
  if ((((_7 != _8)&1))) {
  _9 = f;
  _10 = d;
  if ((((_9 != _10)&1))) {
  _11 = f;
  _12 = g;
  if ((((_11 != _12)&1))) {
  _13 = f;
  _14 = e;
  if ((((_13 != _14)&1))) {
  _15 = e;
  _16 = f;
  _17 = c;
  b = (llvm_sub_u32((llvm_add_u32(_15, _16)), _17));
  _18 = b;
  _19 = lo;
  if ((((((int32_t)_18) >= ((int32_t)_19))&1))) {
  _20 = b;
  _21 = hi;
  if ((((((int32_t)_20) <= ((int32_t)_21))&1))) {
  _22 = unique;
  if ((((_22 != 0u)&1))) {
  _23 = b;
  _24 = a;
  if ((((_23 != _24)&1))) {
  _25 = b;
  _26 = c;
  if ((((_25 != _26)&1))) {
  _27 = b;
  _28 = d;
  if ((((_27 != _28)&1))) {
  _29 = b;
  _30 = g;
  if ((((_29 != _30)&1))) {
  _31 = b;
  _32 = e;
  if ((((_31 != _32)&1))) {
  _33 = b;
  _34 = f;
  if ((((_33 != _34)&1))) {
  _35 = solutions;
  solutions = (llvm_add_u32(_35, 1));
  _36 = show;
  if ((((_36 != 0u)&1))) {
  _37 = a;
  _38 = b;
  _39 = c;
  _40 = d;
  _41 = e;
  _42 = f;
  _43 = g;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _37, _38, _39, _40, _41, _42, _43);

}


  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {
  _50 = solutions;
  solutions = (llvm_add_u32(_50, 1));
  _51 = show;
  if ((((_51 != 0u)&1))) {
  _37 = a;
  _38 = b;
  _39 = c;
  _40 = d;
  _41 = e;
  _42 = f;
  _43 = g;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _37, _38, _39, _40, _41, _42, _43);

}
}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {
  _45 = e;
  _46 = f;
  _47 = c;
  b = (llvm_sub_u32((llvm_add_u32(_45, _46)), _47));
  _48 = b;
  _49 = lo;
  if ((((((int32_t)_48) >= ((int32_t)_49))&1))) {
  _20 = b;
  _21 = hi;
  if ((((((int32_t)_20) <= ((int32_t)_21))&1))) {
  } else {
}
  _22 = unique;
  if ((((_22 != 0u)&1))) {
  } else {
}

  _23 = b;
  _24 = a;
  if ((((_23 != _24)&1))) {
  } else {
}
  _50 = solutions;
  solutions = (llvm_add_u32(_50, 1));
  _51 = show;
  if ((((_51 != 0u)&1))) {
  _37 = a;
  _38 = b;
  _39 = c;
  _40 = d;
  _41 = e;
  _42 = f;
  _43 = g;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _37, _38, _39, _40, _41, _42, _43);

}
  } else {

}
}

  _44 = f;
  f = (llvm_add_u32(_44, 1));

  _2 = f;
  _3 = hi;
}
  return;
}


void ge(void) {
  uint32_t _52;
  uint32_t _53;
  uint32_t _54;
  uint32_t _55;
  uint32_t _56;
  uint32_t _57;
  uint32_t _58;
  uint32_t _59;
  uint32_t _60;
  uint32_t _61;
  uint32_t _62;
  uint32_t _63;
  uint32_t _64;
  uint32_t _65;
  uint32_t _66;
  uint32_t _67;
  uint32_t _68;
  uint32_t _69;
  uint32_t _70;
  uint32_t _71;
  uint32_t _72;
  uint32_t _73;
  uint32_t _74;
  uint32_t _75;
  uint32_t _76;
  uint32_t _77;
  uint32_t _78;
  uint32_t _79;
  uint32_t _80;
  uint32_t _81;

  _52 = lo;
  e = _52;

  _53 = e;
  _54 = hi;
while (((int32_t)_53) <= ((int32_t)_54)){
  _55 = unique;
  if ((((_55 != 0u)&1))) {
  _56 = e;
  _57 = a;
  if ((((_56 != _57)&1))) {
  _58 = e;
  _59 = c;
  if ((((_58 != _59)&1))) {
  _60 = e;
  _61 = d;
  if ((((_60 != _61)&1))) {
  _62 = d;
  _63 = e;
  g = (llvm_add_u32(_62, _63));
  _64 = g;
  _65 = lo;
  if ((((((int32_t)_64) >= ((int32_t)_65))&1))) {
  _66 = g;
  _67 = hi;
  if ((((((int32_t)_66) <= ((int32_t)_67))&1))) {
  _68 = unique;
  if ((((_68 != 0u)&1))) {
  _69 = g;
  _70 = a;
  if ((((_69 != _70)&1))) {
  _71 = g;
  _72 = c;
  if ((((_71 != _72)&1))) {
  _73 = g;
  _74 = d;
  if ((((_73 != _74)&1))) {
  _75 = g;
  _76 = e;
  if ((((_75 != _76)&1))) {
  bf();


  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {
  bf();

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {

}
  } else {
  _78 = d;
  _79 = e;
  g = (llvm_add_u32(_78, _79));
  _80 = g;
  _81 = lo;
  if ((((((int32_t)_80) >= ((int32_t)_81))&1))) {
  _66 = g;
  _67 = hi;
  if ((((((int32_t)_66) <= ((int32_t)_67))&1))) {
  } else {
}
  _68 = unique;
  if ((((_68 != 0u)&1))) {
  } else {
}

  _69 = g;
  _70 = a;
  if ((((_69 != _70)&1))) {
  } else {
}
  bf();

  } else {

}
}

  _77 = e;
  e = (llvm_add_u32(_77, 1));

  _53 = e;
  _54 = hi;
}
  return;
}


void acd(void) {
  uint32_t _82;
  uint32_t _83;
  uint32_t _84;
  uint32_t _85;
  uint32_t _86;
  uint32_t _87;
  uint32_t _88;
  uint32_t _89;
  uint32_t _90;
  uint32_t _91;
  uint32_t _92;
  uint32_t _93;
  uint32_t _94;
  uint32_t _95;
  uint32_t _96;
  uint32_t _97;
  uint32_t _98;
  uint32_t _99;
  uint32_t _100;
  uint32_t _101;
  uint32_t _102;
  uint32_t _103;
  uint32_t _104;
  uint32_t _105;

  _82 = lo;
  c = _82;

  _83 = c;
  _84 = hi;
while (((int32_t)_83) <= ((int32_t)_84)){
  _85 = lo;
  d = _85;

  _86 = d;
  _87 = hi;
while (((int32_t)_86) <= ((int32_t)_87)){
  _88 = unique;
  if ((((_88 != 0u)&1))) {
  _89 = c;
  _90 = d;
  if ((((_89 != _90)&1))) {
  _91 = c;
  _92 = d;
  a = (llvm_add_u32(_91, _92));
  _93 = a;
  _94 = lo;
  if ((((((int32_t)_93) >= ((int32_t)_94))&1))) {
  _95 = a;
  _96 = hi;
  if ((((((int32_t)_95) <= ((int32_t)_96))&1))) {
  _97 = unique;
  if ((((_97 != 0u)&1))) {
  _98 = c;
  if ((((_98 != 0u)&1))) {
  _99 = d;
  if ((((_99 != 0u)&1))) {
  ge();


  } else {

}
  } else {

}
  } else {
  ge();

}
  } else {

}
  } else {

}
}
  } else {
  _102 = c;
  _103 = d;
  a = (llvm_add_u32(_102, _103));
  _104 = a;
  _105 = lo;
  if ((((((int32_t)_104) >= ((int32_t)_105))&1))) {
  _95 = a;
  _96 = hi;
  if ((((((int32_t)_95) <= ((int32_t)_96))&1))) {
  } else {
}
  _97 = unique;
  if ((((_97 != 0u)&1))) {
  } else {
}

  _98 = c;
  if ((((_98 != 0u)&1))) {
  } else {
}
  ge();

  } else {

}
}

  _100 = d;
  d = (llvm_add_u32(_100, 1));

  _86 = d;
  _87 = hi;
}

  _101 = c;
  c = (llvm_add_u32(_101, 1));

  _83 = c;
  _84 = hi;
}
  return;
}


void foursquares(uint32_t llvm_cbe_plo, uint32_t llvm_cbe_phi, uint32_t llvm_cbe_punique, uint32_t llvm_cbe_pshow) {
  uint32_t llvm_cbe_call;
  uint32_t _106;
  uint32_t _107;
  uint32_t _108;
  uint32_t _109;
  uint32_t llvm_cbe_call1;
  uint32_t _110;
  uint32_t _111;
  uint32_t _112;
  uint32_t llvm_cbe_call2;

  ;
  ;
  ;
  ;
  lo = llvm_cbe_plo;
  hi = llvm_cbe_phi;
  unique = llvm_cbe_punique;
  show = llvm_cbe_pshow;
  solutions = 0;
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  acd();
  _106 = unique;
  if ((((_106 != 0u)&1))) {
  _107 = solutions;
  _108 = lo;
  _109 = hi;
  llvm_cbe_call1 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _107, _108, _109);

  } else {
  _110 = solutions;
  _111 = lo;
  _112 = hi;
  llvm_cbe_call2 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), _110, _111, _112);

}
  return;
}


int main(void) {
  foursquares(1, 7, 1, 1);
  foursquares(3, 9, 1, 1);
  foursquares(0, 9, 0, 0);
  return 0;
}

