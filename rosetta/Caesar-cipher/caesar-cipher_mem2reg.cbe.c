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
struct l_array_27_uint8_t {
  uint8_t array[27];
};
struct l_array_2_uint8_t_KC_ {
  uint8_t* array[2];
};
struct l_array_35_uint8_t {
  uint8_t array[35];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};

/* External Global Variable Declarations */

/* Function Declarations */
void rot(uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint16_t** __ctype_b_loc(void) __ATTRIBUTELIST__((nothrow, const));
uint32_t tolower(uint32_t) __ATTRIBUTELIST__((nothrow, pure));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_27_uint8_t _OC_str = { "abcdefghijklmnopqrstuvwxyz" };
static struct l_array_27_uint8_t _OC_str_OC_1 = { "ABCDEFGHIJKLMNOPQRSTUVWXYZ" };
static __MSALIGN__(16) struct l_array_2_uint8_t_KC_ __const_OC_rot_OC_alpha __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])) } };
static __MSALIGN__(16) struct l_array_35_uint8_t __const_OC_main_OC_str __attribute__((aligned(16))) = { "This is a top secret text message!" };
static struct l_array_14_uint8_t _OC_str_OC_2 = { "Original: %s\n" };
static struct l_array_15_uint8_t _OC_str_OC_3 = { "Encrypted: %s\n" };
static struct l_array_15_uint8_t _OC_str_OC_4 = { "Decrypted: %s\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

void rot(uint32_t llvm_cbe_c, uint8_t* llvm_cbe_str) {
  __MSALIGN__(16) struct l_array_2_uint8_t_KC_ llvm_cbe_alpha __attribute__((aligned(16)));    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  uint32_t l;
  uint8_t* _1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint16_t** llvm_cbe_call2;
  uint16_t* _2;
  uint8_t _3;
  uint16_t _4;
  uint16_t** llvm_cbe_call7;
  uint16_t* _5;
  uint8_t _6;
  uint16_t _7;
  uint8_t* _8;
  uint8_t _9;
  uint32_t llvm_cbe_call21;
  uint8_t _10;
  uint8_t* _11;
  uint8_t _12;
  uint32_t llvm_cbe_call30;
  uint8_t _13;

  ;
  ;
  llvm_cbe_call = strlen(llvm_cbe_str);
  l = ((uint32_t)llvm_cbe_call);
  ;
  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_alpha))), ((uint8_t*)(&__const_OC_rot_OC_alpha)), 16);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)l)){
  llvm_cbe_call2 = __ctype_b_loc();
  _2 = *llvm_cbe_call2;
  _3 = *((&llvm_cbe_str[((int64_t)(((int64_t)(int32_t)i)))]));
  _4 = *((&_2[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_3)))))]));
  if ((((((((uint32_t)(uint16_t)_4)) & 1024) != 0u)&1))) {
  llvm_cbe_call7 = __ctype_b_loc();
  _5 = *llvm_cbe_call7;
  _6 = *((&llvm_cbe_str[((int64_t)(((int64_t)(int32_t)i)))]));
  _7 = *((&_5[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_6)))))]));
  if ((((((((uint32_t)(uint16_t)_7)) & 256) != 0u)&1))) {
  _8 = *((&llvm_cbe_alpha.array[((int64_t)1)]));
  _9 = *((&llvm_cbe_str[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call21 = tolower((((int32_t)(int8_t)_9)));
  _10 = *((&_8[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32((llvm_sub_u32(llvm_cbe_call21, 97)), llvm_cbe_c)), 26)))))]));
  *((&llvm_cbe_str[((int64_t)(((int64_t)(int32_t)i)))])) = _10;

  } else {
  _11 = *((&llvm_cbe_alpha.array[((int64_t)0)]));
  _12 = *((&llvm_cbe_str[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call30 = tolower((((int32_t)(int8_t)_12)));
  _13 = *((&_11[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32((llvm_sub_u32(llvm_cbe_call30, 97)), llvm_cbe_c)), 26)))))]));
  *((&llvm_cbe_str[((int64_t)(((int64_t)(int32_t)i)))])) = _13;

}
  } else {

}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


int main(void) {
  __MSALIGN__(16) struct l_array_35_uint8_t llvm_cbe_str __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _14;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call6;

  ;
  _14 = memcpy((((uint8_t*)(&llvm_cbe_str))), ((&__const_OC_main_OC_str.array[((int32_t)0)])), 35);
  llvm_cbe_call = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_str.array[((int64_t)0)])));
  rot(13, ((&llvm_cbe_str.array[((int64_t)0)])));
  llvm_cbe_call3 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), ((&llvm_cbe_str.array[((int64_t)0)])));
  rot(13, ((&llvm_cbe_str.array[((int64_t)0)])));
  llvm_cbe_call6 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), ((&llvm_cbe_str.array[((int64_t)0)])));
  return 0;
}

