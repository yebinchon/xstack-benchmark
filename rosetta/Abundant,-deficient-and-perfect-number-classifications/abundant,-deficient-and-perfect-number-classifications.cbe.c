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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_3_uint32_t {
  uint32_t array[3];
};
struct l_array_25_uint8_t {
  uint8_t array[25];
};
struct l_array_13_uint8_t {
  uint8_t array[13];
};
struct l_array_43_uint8_t {
  uint8_t array[43];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint32_t __const_OC_main_OC_count_list = { { 1, 0, 0 } };
static struct l_array_25_uint8_t _OC_str = { "\nThere are %d deficient," };
static struct l_array_13_uint8_t _OC_str_OC_1 = { " %d perfect," };
static struct l_array_43_uint8_t _OC_str_OC_2 = { " %d abundant numbers between 1 and 20000.\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
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


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_sum;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_try_max;    /* Address-exposed local */
  struct l_array_3_uint32_t llvm_cbe_count_list;    /* Address-exposed local */
  uint8_t* _1;
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
  uint32_t* llvm_cbe_arrayidx;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t* llvm_cbe_arrayidx15;
  uint32_t _22;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t llvm_cbe_call;
  uint32_t _26;
  uint32_t llvm_cbe_call25;
  uint32_t _27;
  uint32_t llvm_cbe_call27;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_sum = 0;
  ;
  ;
  ;
  llvm_cbe_try_max = 0;
  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_count_list))), ((uint8_t*)(&__const_OC_main_OC_count_list)), 12);
  llvm_cbe_i = 2;

  _2 = llvm_cbe_i;
while (((int32_t)_2) <= ((int32_t)20000u)){
  _3 = llvm_cbe_i;
  llvm_cbe_try_max = (llvm_sdiv_u32(_3, 2));
  llvm_cbe_sum = 1;
  llvm_cbe_j = 2;

  _4 = llvm_cbe_j;
  _5 = llvm_cbe_try_max;
while (((int32_t)_4) < ((int32_t)_5)){
  _6 = llvm_cbe_i;
  _7 = llvm_cbe_j;
  if (((((llvm_srem_u32(_6, _7)) != 0u)&1))) {

  } else {
  _8 = llvm_cbe_i;
  _9 = llvm_cbe_j;
  llvm_cbe_try_max = (llvm_sdiv_u32(_8, _9));
  _10 = llvm_cbe_j;
  _11 = llvm_cbe_sum;
  llvm_cbe_sum = (llvm_add_u32(_11, _10));
  _12 = llvm_cbe_j;
  _13 = llvm_cbe_try_max;
  if ((((_12 != _13)&1))) {
  _14 = llvm_cbe_try_max;
  _15 = llvm_cbe_sum;
  llvm_cbe_sum = (llvm_add_u32(_15, _14));

}

}
  _16 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_16, 1));

  _4 = llvm_cbe_j;
  _5 = llvm_cbe_try_max;
}
  _17 = llvm_cbe_sum;
  _18 = llvm_cbe_i;
  if ((((((int32_t)_17) < ((int32_t)_18))&1))) {
  llvm_cbe_arrayidx = (&llvm_cbe_count_list.array[((int64_t)0)]);
  _19 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (llvm_add_u32(_19, 1));

  } else {
  _20 = llvm_cbe_sum;
  _21 = llvm_cbe_i;
  if ((((((int32_t)_20) > ((int32_t)_21))&1))) {
  llvm_cbe_arrayidx15 = (&llvm_cbe_count_list.array[((int64_t)2)]);
  _22 = *llvm_cbe_arrayidx15;
  *llvm_cbe_arrayidx15 = (llvm_add_u32(_22, 1));

  } else {
  llvm_cbe_arrayidx18 = (&llvm_cbe_count_list.array[((int64_t)1)]);
  _23 = *llvm_cbe_arrayidx18;
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_23, 1));

}
}
  _24 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_24, 1));

  _2 = llvm_cbe_i;
}
  _25 = *((&llvm_cbe_count_list.array[((int64_t)0)]));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _25);
  _26 = *((&llvm_cbe_count_list.array[((int64_t)1)]));
  llvm_cbe_call25 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _26);
  _27 = *((&llvm_cbe_count_list.array[((int64_t)2)]));
  llvm_cbe_call27 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _27);
  return 0;
}

