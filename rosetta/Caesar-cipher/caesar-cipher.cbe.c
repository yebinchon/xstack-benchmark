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
  uint32_t llvm_cbe_c_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_str_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_l;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_2_uint8_t_KC_ llvm_cbe_alpha __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint8_t* _1;
  uint64_t llvm_cbe_call;
  uint8_t* _2;
  uint32_t _3;
  uint32_t _4;
  uint16_t** llvm_cbe_call2;
  uint16_t* _5;
  uint8_t* _6;
  uint32_t _7;
  uint8_t _8;
  uint16_t _9;
  uint16_t** llvm_cbe_call7;
  uint16_t* _10;
  uint8_t* _11;
  uint32_t _12;
  uint8_t _13;
  uint16_t _14;
  uint8_t* _15;
  uint8_t* _16;
  uint32_t _17;
  uint8_t _18;
  uint32_t llvm_cbe_call21;
  uint32_t _19;
  uint8_t _20;
  uint8_t* _21;
  uint32_t _22;
  uint8_t* _23;
  uint8_t* _24;
  uint32_t _25;
  uint8_t _26;
  uint32_t llvm_cbe_call30;
  uint32_t _27;
  uint8_t _28;
  uint8_t* _29;
  uint32_t _30;
  uint32_t _31;

  llvm_cbe_c_2e_addr = llvm_cbe_c;
  ;
  llvm_cbe_str_2e_addr = llvm_cbe_str;
  ;
  ;
  _1 = llvm_cbe_str_2e_addr;
  llvm_cbe_call = strlen(_1);
  llvm_cbe_l = (((uint32_t)llvm_cbe_call));
  ;
  _2 = memcpy((((uint8_t*)(&llvm_cbe_alpha))), ((uint8_t*)(&__const_OC_rot_OC_alpha)), 16);
  ;
  llvm_cbe_i = 0;

  _3 = llvm_cbe_i;
  _4 = llvm_cbe_l;
while (((int32_t)_3) < ((int32_t)_4)){
  llvm_cbe_call2 = __ctype_b_loc();
  _5 = *llvm_cbe_call2;
  _6 = llvm_cbe_str_2e_addr;
  _7 = llvm_cbe_i;
  _8 = *((&_6[((int64_t)(((int64_t)(int32_t)_7)))]));
  _9 = *((&_5[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_8)))))]));
  if ((((((((uint32_t)(uint16_t)_9)) & 1024) != 0u)&1))) {
  llvm_cbe_call7 = __ctype_b_loc();
  _10 = *llvm_cbe_call7;
  _11 = llvm_cbe_str_2e_addr;
  _12 = llvm_cbe_i;
  _13 = *((&_11[((int64_t)(((int64_t)(int32_t)_12)))]));
  _14 = *((&_10[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_13)))))]));
  if ((((((((uint32_t)(uint16_t)_14)) & 256) != 0u)&1))) {
  _15 = *((&llvm_cbe_alpha.array[((int64_t)1)]));
  _16 = llvm_cbe_str_2e_addr;
  _17 = llvm_cbe_i;
  _18 = *((&_16[((int64_t)(((int64_t)(int32_t)_17)))]));
  llvm_cbe_call21 = tolower((((int32_t)(int8_t)_18)));
  _19 = llvm_cbe_c_2e_addr;
  _20 = *((&_15[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32((llvm_sub_u32(llvm_cbe_call21, 97)), _19)), 26)))))]));
  _21 = llvm_cbe_str_2e_addr;
  _22 = llvm_cbe_i;
  *((&_21[((int64_t)(((int64_t)(int32_t)_22)))])) = _20;

  } else {
  _23 = *((&llvm_cbe_alpha.array[((int64_t)0)]));
  _24 = llvm_cbe_str_2e_addr;
  _25 = llvm_cbe_i;
  _26 = *((&_24[((int64_t)(((int64_t)(int32_t)_25)))]));
  llvm_cbe_call30 = tolower((((int32_t)(int8_t)_26)));
  _27 = llvm_cbe_c_2e_addr;
  _28 = *((&_23[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32((llvm_sub_u32(llvm_cbe_call30, 97)), _27)), 26)))))]));
  _29 = llvm_cbe_str_2e_addr;
  _30 = llvm_cbe_i;
  *((&_29[((int64_t)(((int64_t)(int32_t)_30)))])) = _28;

}
  } else {

}

  _31 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_31, 1));

  _3 = llvm_cbe_i;
  _4 = llvm_cbe_l;
}
  return;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_35_uint8_t llvm_cbe_str __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _32;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call6;

  llvm_cbe_retval = 0;
  ;
  _32 = memcpy((((uint8_t*)(&llvm_cbe_str))), ((&__const_OC_main_OC_str.array[((int32_t)0)])), 35);
  llvm_cbe_call = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_str.array[((int64_t)0)])));
  rot(13, ((&llvm_cbe_str.array[((int64_t)0)])));
  llvm_cbe_call3 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), ((&llvm_cbe_str.array[((int64_t)0)])));
  rot(13, ((&llvm_cbe_str.array[((int64_t)0)])));
  llvm_cbe_call6 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), ((&llvm_cbe_str.array[((int64_t)0)])));
  return 0;
}

