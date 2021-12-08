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
struct l_array_600_uint8_t {
  uint8_t array[600];
};
struct l_array_600_struct_AC_l_array_600_uint8_t {
  struct l_array_600_uint8_t array[600];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void srand(uint32_t) __ATTRIBUTELIST__((nothrow));
uint64_t time(uint64_t*) __ATTRIBUTELIST__((nothrow));
uint32_t rand(void) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t putchar(uint32_t);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_600_struct_AC_l_array_600_uint8_t W __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static struct l_array_10_uint8_t _OC_str = { "P1\n%d %d\n" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%d " };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_udiv_u32(uint32_t a, uint32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_urem_u32(uint32_t a, uint32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint64_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call2;
  uint32_t x;
  uint32_t llvm_cbe_call3;
  uint32_t y;
  uint8_t _1;
  uint32_t y__PHI_TEMPORARY;
  uint32_t x__PHI_TEMPORARY;
  uint8_t _2;
  uint8_t _3;
  uint8_t _4;
  uint8_t _5;
  uint8_t _6;
  uint8_t _7;
  uint8_t _8;
  uint8_t _9;
  uint32_t llvm_cbe_call76;
  uint32_t dxy;
  uint32_t dxy__PHI_TEMPORARY;
  uint32_t llvm_cbe_call102;
  uint32_t r;
  uint32_t r__PHI_TEMPORARY;
  uint32_t c;
  uint32_t c__PHI_TEMPORARY;
  uint8_t _10;
  uint32_t llvm_cbe_call117;
  uint32_t llvm_cbe_call121;

  llvm_cbe_call = time(((uint64_t*)/*NULL*/0));
  srand((((uint32_t)llvm_cbe_call)));
  *((&W.array[((int64_t)300)].array[((int64_t)300)])) = 1;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)10000u)){

){
){
  _1 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]));
  if ((((((bool)_1&1u))&1))) {
  llvm_cbe_call2 = rand();
  x = llvm_add_u32((llvm_srem_u32(llvm_cbe_call2, 598)), 1);
  ;
  llvm_cbe_call3 = rand();
  y = llvm_add_u32((llvm_srem_u32(llvm_cbe_call3, 598)), 1);
  ;

}
  llvm_cbe_call2 = rand();
  llvm_cbe_rem = llvm_srem_u32(llvm_cbe_call2, 598);
  x = llvm_add_u32((llvm_srem_u32(llvm_cbe_call2, 598)), 1);
  ;
  llvm_cbe_call3 = rand();
  llvm_cbe_rem4 = llvm_srem_u32(llvm_cbe_call3, 598);
  y = llvm_add_u32((llvm_srem_u32(llvm_cbe_call3, 598)), 1);
  ;
  
;
}
  break;
  uint32_t llvm_cbe_sub;
  uint64_t llvm_cbe_idxprom8;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx9;
  uint32_t llvm_cbe_sub10;
  uint64_t llvm_cbe_idxprom11;
  uint8_t* llvm_cbe_arrayidx12;
  bool llvm_cbe_tobool13;
  uint32_t llvm_cbe_conv14;
  uint32_t llvm_cbe_sub15;
  uint64_t llvm_cbe_idxprom16;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx17;
  uint64_t llvm_cbe_idxprom18;
  uint8_t* llvm_cbe_arrayidx19;
  bool llvm_cbe_tobool20;
  uint32_t llvm_cbe_conv21;
  uint32_t llvm_cbe_add22;
  uint32_t llvm_cbe_sub23;
  uint64_t llvm_cbe_idxprom24;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx25;
  uint32_t llvm_cbe_add26;
  uint64_t llvm_cbe_idxprom27;
  uint8_t* llvm_cbe_arrayidx28;
  bool llvm_cbe_tobool29;
  uint32_t llvm_cbe_conv30;
  uint32_t llvm_cbe_add31;
  uint64_t llvm_cbe_idxprom32;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx33;
  uint32_t llvm_cbe_sub34;
  uint64_t llvm_cbe_idxprom35;
  uint8_t* llvm_cbe_arrayidx36;
  bool llvm_cbe_tobool37;
  uint32_t llvm_cbe_conv38;
  uint32_t llvm_cbe_add39;
  uint64_t llvm_cbe_idxprom40;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx41;
  uint32_t llvm_cbe_add42;
  uint64_t llvm_cbe_idxprom43;
  uint8_t* llvm_cbe_arrayidx44;
  bool llvm_cbe_tobool45;
  uint32_t llvm_cbe_conv46;
  uint32_t llvm_cbe_add47;
  uint32_t llvm_cbe_add48;
  uint64_t llvm_cbe_idxprom49;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx50;
  uint32_t llvm_cbe_sub51;
  uint64_t llvm_cbe_idxprom52;
  uint8_t* llvm_cbe_arrayidx53;
  bool llvm_cbe_tobool54;
  uint32_t llvm_cbe_conv55;
  uint32_t llvm_cbe_add56;
  uint32_t llvm_cbe_add57;
  uint64_t llvm_cbe_idxprom58;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx59;
  uint64_t llvm_cbe_idxprom60;
  uint8_t* llvm_cbe_arrayidx61;
  bool llvm_cbe_tobool62;
  uint32_t llvm_cbe_conv63;
  uint32_t llvm_cbe_add64;
  uint32_t llvm_cbe_add65;
  uint64_t llvm_cbe_idxprom66;
  struct l_array_600_uint8_t* llvm_cbe_arrayidx67;
  uint32_t llvm_cbe_add68;
  uint64_t llvm_cbe_idxprom69;
  uint8_t* llvm_cbe_arrayidx70;
  bool llvm_cbe_tobool71;
  uint32_t llvm_cbe_conv72;
  uint32_t llvm_cbe_add73;
  y = y__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_sub = llvm_sub_u32(y, 1);
  llvm_cbe_idxprom8 = ((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)));
  llvm_cbe_arrayidx9 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]);
  llvm_cbe_sub10 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom11 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx12 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _2 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_tobool13 = ((((bool)_2&1u))&1);
  llvm_cbe_conv14 = ((uint32_t)(bool)(((((bool)_2&1u))&1)));
  llvm_cbe_sub15 = llvm_sub_u32(y, 1);
  llvm_cbe_idxprom16 = ((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)));
  llvm_cbe_arrayidx17 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]);
  llvm_cbe_idxprom18 = ((uint64_t)(uint32_t)x);
  llvm_cbe_arrayidx19 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]);
  _3 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]));
  llvm_cbe_tobool20 = ((((bool)_3&1u))&1);
  llvm_cbe_conv21 = ((uint32_t)(bool)(((((bool)_3&1u))&1)));
  llvm_cbe_add22 = llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))));
  llvm_cbe_sub23 = llvm_sub_u32(y, 1);
  llvm_cbe_idxprom24 = ((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)));
  llvm_cbe_arrayidx25 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]);
  llvm_cbe_add26 = llvm_add_u32(x, 1);
  llvm_cbe_idxprom27 = ((uint64_t)(uint32_t)(llvm_add_u32(x, 1)));
  llvm_cbe_arrayidx28 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]);
  _4 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]));
  llvm_cbe_tobool29 = ((((bool)_4&1u))&1);
  llvm_cbe_conv30 = ((uint32_t)(bool)(((((bool)_4&1u))&1)));
  llvm_cbe_add31 = llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))));
  llvm_cbe_idxprom32 = ((uint64_t)(uint32_t)y);
  llvm_cbe_arrayidx33 = (&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]);
  llvm_cbe_sub34 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom35 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx36 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _5 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_tobool37 = ((((bool)_5&1u))&1);
  llvm_cbe_conv38 = ((uint32_t)(bool)(((((bool)_5&1u))&1)));
  llvm_cbe_add39 = llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))));
  llvm_cbe_idxprom40 = ((uint64_t)(uint32_t)y);
  llvm_cbe_arrayidx41 = (&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]);
  llvm_cbe_add42 = llvm_add_u32(x, 1);
  llvm_cbe_idxprom43 = ((uint64_t)(uint32_t)(llvm_add_u32(x, 1)));
  llvm_cbe_arrayidx44 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]);
  _6 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]));
  llvm_cbe_tobool45 = ((((bool)_6&1u))&1);
  llvm_cbe_conv46 = ((uint32_t)(bool)(((((bool)_6&1u))&1)));
  llvm_cbe_add47 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))));
  llvm_cbe_add48 = llvm_add_u32(y, 1);
  llvm_cbe_idxprom49 = ((uint64_t)(uint32_t)(llvm_add_u32(y, 1)));
  llvm_cbe_arrayidx50 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]);
  llvm_cbe_sub51 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom52 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx53 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _7 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_tobool54 = ((((bool)_7&1u))&1);
  llvm_cbe_conv55 = ((uint32_t)(bool)(((((bool)_7&1u))&1)));
  llvm_cbe_add56 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))))), (((uint32_t)(bool)(((((bool)_7&1u))&1)))));
  llvm_cbe_add57 = llvm_add_u32(y, 1);
  llvm_cbe_idxprom58 = ((uint64_t)(uint32_t)(llvm_add_u32(y, 1)));
  llvm_cbe_arrayidx59 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]);
  llvm_cbe_idxprom60 = ((uint64_t)(uint32_t)x);
  llvm_cbe_arrayidx61 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]);
  _8 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]));
  llvm_cbe_tobool62 = ((((bool)_8&1u))&1);
  llvm_cbe_conv63 = ((uint32_t)(bool)(((((bool)_8&1u))&1)));
  llvm_cbe_add64 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))))), (((uint32_t)(bool)(((((bool)_7&1u))&1)))))), (((uint32_t)(bool)(((((bool)_8&1u))&1)))));
  llvm_cbe_add65 = llvm_add_u32(y, 1);
  llvm_cbe_idxprom66 = ((uint64_t)(uint32_t)(llvm_add_u32(y, 1)));
  llvm_cbe_arrayidx67 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]);
  llvm_cbe_add68 = llvm_add_u32(x, 1);
  llvm_cbe_idxprom69 = ((uint64_t)(uint32_t)(llvm_add_u32(x, 1)));
  llvm_cbe_arrayidx70 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]);
  _9 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]));
  llvm_cbe_tobool71 = ((((bool)_9&1u))&1);
  llvm_cbe_conv72 = ((uint32_t)(bool)(((((bool)_9&1u))&1)));
  llvm_cbe_add73 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))))), (((uint32_t)(bool)(((((bool)_7&1u))&1)))))), (((uint32_t)(bool)(((((bool)_8&1u))&1)))))), (((uint32_t)(bool)(((((bool)_9&1u))&1)))));
while (llvm_cbe_add73 == 0u){
  llvm_cbe_call76 = rand();
  dxy = llvm_srem_u32(llvm_cbe_call76, 8);
  ;
  if ((((((uint32_t)dxy) > ((uint32_t)3u))&1))) {
  dxy = llvm_add_u32(dxy, 1);
  ;
  dxy__PHI_TEMPORARY = dxy;   /* for PHI node */

}
  dxy = dxy__PHI_TEMPORARY;
  ;
  x = llvm_add_u32(x, (llvm_sub_u32((llvm_urem_u32(dxy, 3)), 1)));
  ;
  y = llvm_add_u32(y, (llvm_sub_u32((llvm_udiv_u32(dxy, 3)), 1)));
  ;
  if ((((((uint32_t)x) < ((uint32_t)1u))&1))) {


  } else {
  if ((((((uint32_t)x) >= ((uint32_t)599u))&1))) {

  } else {
  if ((((((uint32_t)y) < ((uint32_t)1u))&1))) {

  } else {
  if ((((((uint32_t)y) >= ((uint32_t)599u))&1))) {

  } else {
  y__PHI_TEMPORARY = y;   /* for PHI node */
  x__PHI_TEMPORARY = x;   /* for PHI node */

}
}
}
}
  y = y__PHI_TEMPORARY;
  x = x__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_sub = llvm_sub_u32(y, 1);
  llvm_cbe_idxprom8 = ((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)));
  llvm_cbe_arrayidx9 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]);
  llvm_cbe_sub10 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom11 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx12 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _2 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_tobool13 = ((((bool)_2&1u))&1);
  llvm_cbe_conv14 = ((uint32_t)(bool)(((((bool)_2&1u))&1)));
  llvm_cbe_sub15 = llvm_sub_u32(y, 1);
  llvm_cbe_idxprom16 = ((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)));
  llvm_cbe_arrayidx17 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]);
  llvm_cbe_idxprom18 = ((uint64_t)(uint32_t)x);
  llvm_cbe_arrayidx19 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]);
  _3 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]));
  llvm_cbe_tobool20 = ((((bool)_3&1u))&1);
  llvm_cbe_conv21 = ((uint32_t)(bool)(((((bool)_3&1u))&1)));
  llvm_cbe_add22 = llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))));
  llvm_cbe_sub23 = llvm_sub_u32(y, 1);
  llvm_cbe_idxprom24 = ((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)));
  llvm_cbe_arrayidx25 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]);
  llvm_cbe_add26 = llvm_add_u32(x, 1);
  llvm_cbe_idxprom27 = ((uint64_t)(uint32_t)(llvm_add_u32(x, 1)));
  llvm_cbe_arrayidx28 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]);
  _4 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]));
  llvm_cbe_tobool29 = ((((bool)_4&1u))&1);
  llvm_cbe_conv30 = ((uint32_t)(bool)(((((bool)_4&1u))&1)));
  llvm_cbe_add31 = llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))));
  llvm_cbe_idxprom32 = ((uint64_t)(uint32_t)y);
  llvm_cbe_arrayidx33 = (&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]);
  llvm_cbe_sub34 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom35 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx36 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _5 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_tobool37 = ((((bool)_5&1u))&1);
  llvm_cbe_conv38 = ((uint32_t)(bool)(((((bool)_5&1u))&1)));
  llvm_cbe_add39 = llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))));
  llvm_cbe_idxprom40 = ((uint64_t)(uint32_t)y);
  llvm_cbe_arrayidx41 = (&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]);
  llvm_cbe_add42 = llvm_add_u32(x, 1);
  llvm_cbe_idxprom43 = ((uint64_t)(uint32_t)(llvm_add_u32(x, 1)));
  llvm_cbe_arrayidx44 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]);
  _6 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]));
  llvm_cbe_tobool45 = ((((bool)_6&1u))&1);
  llvm_cbe_conv46 = ((uint32_t)(bool)(((((bool)_6&1u))&1)));
  llvm_cbe_add47 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))));
  llvm_cbe_add48 = llvm_add_u32(y, 1);
  llvm_cbe_idxprom49 = ((uint64_t)(uint32_t)(llvm_add_u32(y, 1)));
  llvm_cbe_arrayidx50 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]);
  llvm_cbe_sub51 = llvm_sub_u32(x, 1);
  llvm_cbe_idxprom52 = ((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)));
  llvm_cbe_arrayidx53 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]);
  _7 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_sub_u32(x, 1)))))]));
  llvm_cbe_tobool54 = ((((bool)_7&1u))&1);
  llvm_cbe_conv55 = ((uint32_t)(bool)(((((bool)_7&1u))&1)));
  llvm_cbe_add56 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))))), (((uint32_t)(bool)(((((bool)_7&1u))&1)))));
  llvm_cbe_add57 = llvm_add_u32(y, 1);
  llvm_cbe_idxprom58 = ((uint64_t)(uint32_t)(llvm_add_u32(y, 1)));
  llvm_cbe_arrayidx59 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]);
  llvm_cbe_idxprom60 = ((uint64_t)(uint32_t)x);
  llvm_cbe_arrayidx61 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]);
  _8 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))]));
  llvm_cbe_tobool62 = ((((bool)_8&1u))&1);
  llvm_cbe_conv63 = ((uint32_t)(bool)(((((bool)_8&1u))&1)));
  llvm_cbe_add64 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))))), (((uint32_t)(bool)(((((bool)_7&1u))&1)))))), (((uint32_t)(bool)(((((bool)_8&1u))&1)))));
  llvm_cbe_add65 = llvm_add_u32(y, 1);
  llvm_cbe_idxprom66 = ((uint64_t)(uint32_t)(llvm_add_u32(y, 1)));
  llvm_cbe_arrayidx67 = (&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]);
  llvm_cbe_add68 = llvm_add_u32(x, 1);
  llvm_cbe_idxprom69 = ((uint64_t)(uint32_t)(llvm_add_u32(x, 1)));
  llvm_cbe_arrayidx70 = (&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]);
  _9 = *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(y, 1)))))]))).array[((int64_t)(((uint64_t)(uint32_t)(llvm_add_u32(x, 1)))))]));
  llvm_cbe_tobool71 = ((((bool)_9&1u))&1);
  llvm_cbe_conv72 = ((uint32_t)(bool)(((((bool)_9&1u))&1)));
  llvm_cbe_add73 = llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((llvm_add_u32((((uint32_t)(bool)(((((bool)_2&1u))&1)))), (((uint32_t)(bool)(((((bool)_3&1u))&1)))))), (((uint32_t)(bool)(((((bool)_4&1u))&1)))))), (((uint32_t)(bool)(((((bool)_5&1u))&1)))))), (((uint32_t)(bool)(((((bool)_6&1u))&1)))))), (((uint32_t)(bool)(((((bool)_7&1u))&1)))))), (((uint32_t)(bool)(((((bool)_8&1u))&1)))))), (((uint32_t)(bool)(((((bool)_9&1u))&1)))));
}
  
;
}
  *((&(*((&W.array[((int64_t)(((uint64_t)(uint32_t)y)))]))).array[((int64_t)(((uint64_t)(uint32_t)x)))])) = 1;
  break;
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call102 = printf(((&_OC_str.array[((int64_t)0)])), 600, 600);
  ;
  r__PHI_TEMPORARY = 0;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  ;
while (((int32_t)r) < ((int32_t)600u)){
  ;
  c__PHI_TEMPORARY = 0;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  ;
while (((int32_t)c) < ((int32_t)600u)){
  _10 = *((&(*((&W.array[((int64_t)(((int64_t)(int32_t)r)))]))).array[((int64_t)(((int64_t)(int32_t)c)))]));
  llvm_cbe_call117 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), (((uint32_t)(bool)(((((bool)_10&1u))&1)))));

  c = llvm_add_u32(c, 1);
  ;
  c__PHI_TEMPORARY = c;   /* for PHI node */

  c = c__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call121 = putchar(10);

  r = llvm_add_u32(r, 1);
  ;
  r__PHI_TEMPORARY = r;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  ;
}
  return 0;
}

