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
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_21_uint8_t_KC_ {
  uint8_t* array[21];
};
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_9_uint8_t_KC_ {
  uint8_t* array[9];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t can_make_words(uint8_t**, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t toupper(uint32_t) __ATTRIBUTELIST__((nothrow, pure));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint8_t _OC_str = { "BO" };
static struct l_array_3_uint8_t _OC_str_OC_1 = { "XK" };
static struct l_array_3_uint8_t _OC_str_OC_2 = { "DQ" };
static struct l_array_3_uint8_t _OC_str_OC_3 = { "CP" };
static struct l_array_3_uint8_t _OC_str_OC_4 = { "NA" };
static struct l_array_3_uint8_t _OC_str_OC_5 = { "GT" };
static struct l_array_3_uint8_t _OC_str_OC_6 = { "RE" };
static struct l_array_3_uint8_t _OC_str_OC_7 = { "TG" };
static struct l_array_3_uint8_t _OC_str_OC_8 = { "QD" };
static struct l_array_3_uint8_t _OC_str_OC_9 = { "FS" };
static struct l_array_3_uint8_t _OC_str_OC_10 = { "JW" };
static struct l_array_3_uint8_t _OC_str_OC_11 = { "HU" };
static struct l_array_3_uint8_t _OC_str_OC_12 = { "VI" };
static struct l_array_3_uint8_t _OC_str_OC_13 = { "AN" };
static struct l_array_3_uint8_t _OC_str_OC_14 = { "OB" };
static struct l_array_3_uint8_t _OC_str_OC_15 = { "ER" };
static struct l_array_3_uint8_t _OC_str_OC_16 = { "LY" };
static struct l_array_3_uint8_t _OC_str_OC_17 = { "PC" };
static struct l_array_3_uint8_t _OC_str_OC_18 = { "ZM" };
static __MSALIGN__(16) struct l_array_21_uint8_t_KC_ __const_OC_main_OC_blocks __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((&_OC_str_OC_2.array[((int32_t)0)])), ((&_OC_str_OC_3.array[((int32_t)0)])), ((&_OC_str_OC_4.array[((int32_t)0)])), ((&_OC_str_OC_5.array[((int32_t)0)])), ((&_OC_str_OC_6.array[((int32_t)0)])), ((&_OC_str_OC_7.array[((int32_t)0)])), ((&_OC_str_OC_8.array[((int32_t)0)])), ((&_OC_str_OC_9.array[((int32_t)0)])), ((&_OC_str_OC_10.array[((int32_t)0)])), ((&_OC_str_OC_11.array[((int32_t)0)])), ((&_OC_str_OC_12.array[((int32_t)0)])), ((&_OC_str_OC_13.array[((int32_t)0)])), ((&_OC_str_OC_14.array[((int32_t)0)])), ((&_OC_str_OC_15.array[((int32_t)0)])), ((&_OC_str_OC_9.array[((int32_t)0)])), ((&_OC_str_OC_16.array[((int32_t)0)])), ((&_OC_str_OC_17.array[((int32_t)0)])), ((&_OC_str_OC_18.array[((int32_t)0)])), ((uint8_t*)/*NULL*/0) } };
static struct l_array_1_uint8_t _OC_str_OC_19;
static struct l_array_2_uint8_t _OC_str_OC_20 = { "A" };
static struct l_array_5_uint8_t _OC_str_OC_21 = { "BARK" };
static struct l_array_5_uint8_t _OC_str_OC_22 = { "BOOK" };
static struct l_array_6_uint8_t _OC_str_OC_23 = { "TREAT" };
static struct l_array_7_uint8_t _OC_str_OC_24 = { "COMMON" };
static struct l_array_6_uint8_t _OC_str_OC_25 = { "SQUAD" };
static struct l_array_8_uint8_t _OC_str_OC_26 = { "Confuse" };
static __MSALIGN__(16) struct l_array_9_uint8_t_KC_ __const_OC_main_OC_words __attribute__((aligned(16))) = { { ((&_OC_str_OC_19.array[((int32_t)0)])), ((&_OC_str_OC_20.array[((int32_t)0)])), ((&_OC_str_OC_21.array[((int32_t)0)])), ((&_OC_str_OC_22.array[((int32_t)0)])), ((&_OC_str_OC_23.array[((int32_t)0)])), ((&_OC_str_OC_24.array[((int32_t)0)])), ((&_OC_str_OC_25.array[((int32_t)0)])), ((&_OC_str_OC_26.array[((int32_t)0)])), ((uint8_t*)/*NULL*/0) } };
static struct l_array_7_uint8_t _OC_str_OC_27 = { "%s\t%d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

uint32_t can_make_words(uint8_t** llvm_cbe_b, uint8_t* llvm_cbe_word) {
  uint8_t _1;
  uint32_t c;
  uint8_t* _2;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t ret;
  uint32_t ret__PHI_TEMPORARY;
  uint8_t* _3;
  bool llvm_cbe_lnot;
  bool _4;
  bool _4__PHI_TEMPORARY;
  uint8_t* _5;
  uint8_t _6;
  uint8_t* _7;
  uint8_t _8;
  uint8_t* _9;
  uint8_t* _10;
  uint8_t* tmp;
  uint8_t* _11;
  uint8_t* _12;
  uint8_t* _13;
  uint8_t* _14;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  uint8_t* _15;
  uint8_t* _16;

  ;
  ;
  ;
  _1 = *llvm_cbe_word;
  c = toupper((((int32_t)(int8_t)_1)));
  ;
  if (!(((c != 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _2 = *((&(*llvm_cbe_b)));
  if (!(((_2 != ((uint8_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  ret__PHI_TEMPORARY = 0;   /* for PHI node */

){
  llvm_cbe_lnot = ((~((((ret != 0u)&1))))&1);
  _4__PHI_TEMPORARY = llvm_cbe_lnot;   /* for PHI node */

  _4 = ((_4__PHI_TEMPORARY)&1);
  if (!_4) {
  _5 = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  _6 = *((&(*_5)));
  if (((((((int32_t)(int8_t)_6)) != c)&1))) {
  _7 = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  _8 = *((&_7[((int64_t)1)]));
  if (((((((int32_t)(int8_t)_8)) != c)&1))) {
  ret__PHI_TEMPORARY = ret;   /* for PHI node */

  } else {
  _9 = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  _10 = *((&(*llvm_cbe_b)));
  if ((((_9 != _10)&1))) {
  tmp = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  ;
  _11 = *((&(*llvm_cbe_b)));
  *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))])) = _11;
  *((&(*llvm_cbe_b))) = tmp;

}
  ret = can_make_words(((&llvm_cbe_b[((int64_t)1)])), ((&llvm_cbe_word[((int64_t)1)])));
  ;
  _12 = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  _13 = *((&(*llvm_cbe_b)));
  if ((((_12 != _13)&1))) {
  tmp = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  ;
  _14 = *((&(*llvm_cbe_b)));
  *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))])) = _14;
  *((&(*llvm_cbe_b))) = tmp;

}
  ret__PHI_TEMPORARY = ret;   /* for PHI node */

}
  } else {
  _15 = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  _16 = *((&(*llvm_cbe_b)));
  if ((((_15 != _16)&1))) {
  tmp = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  ;
  _11 = *((&(*llvm_cbe_b)));
  *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))])) = _11;
  *((&(*llvm_cbe_b))) = tmp;

}
}
}
  ret = ret__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  ret__PHI_TEMPORARY = ret;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ret = ret__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx4 = (&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]);
  _3 = *((&llvm_cbe_b[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_tobool5 = ((_3 != ((uint8_t*)/*NULL*/0))&1);
    if (!(((_3 != ((uint8_t*)/*NULL*/0))&1))) {
    _4__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  __MSALIGN__(16) struct l_array_21_uint8_t_KC_ llvm_cbe_blocks __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_9_uint8_t_KC_ llvm_cbe_words __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _17;
  uint8_t* _18;
  uint8_t** w;
  uint8_t** w__PHI_TEMPORARY;
  uint8_t* _19;
  uint8_t* _20;
  uint8_t* _21;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call2;

  ;
  _17 = memcpy((((uint8_t*)(&llvm_cbe_blocks))), ((uint8_t*)(&__const_OC_main_OC_blocks)), 168);
  ;
  _18 = memcpy((((uint8_t*)(&llvm_cbe_words))), ((uint8_t*)(&__const_OC_main_OC_words)), 72);
  w = (&llvm_cbe_words.array[((int64_t)0)]);
  ;
  w__PHI_TEMPORARY = w;   /* for PHI node */

  w = w__PHI_TEMPORARY;
  ;
  _19 = *w;
while (_19 != ((uint8_t*)/*NULL*/0)){
  _20 = *w;
  _21 = *w;
  llvm_cbe_call = can_make_words(((&llvm_cbe_blocks.array[((int64_t)0)])), _21);
  llvm_cbe_call2 = printf(((&_OC_str_OC_27.array[((int64_t)0)])), _20, llvm_cbe_call);

  w = (&w[((int32_t)1)]);
  ;
  w__PHI_TEMPORARY = w;   /* for PHI node */

  w = w__PHI_TEMPORARY;
  ;
  _19 = *w;
}
  return 0;
}

