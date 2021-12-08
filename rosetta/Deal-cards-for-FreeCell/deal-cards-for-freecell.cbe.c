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
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t _2;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  _2 = llvm_cbe_x_2e_addr;
  seed = _2;
}


void show(uint32_t* llvm_cbe_c) {
  uint32_t* llvm_cbe_c_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _3;
  uint32_t* _4;
  uint32_t _5;
  uint32_t* _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t* _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t llvm_cbe_call;
  uint32_t _12;
  uint32_t llvm_cbe_inc;
  uint32_t _13;
  uint32_t llvm_cbe_call7;
  uint32_t* _14;
  uint32_t llvm_cbe_call7_2e_splitted1;

  llvm_cbe_c_2e_addr = llvm_cbe_c;
  ;
  ;
  llvm_cbe_i = 0;

  _3 = llvm_cbe_i;
while (((int32_t)_3) < ((int32_t)52u)){
  _4 = llvm_cbe_c_2e_addr;
  _5 = *_4;
  _6 = llvm_cbe_c_2e_addr;
  _7 = *_6;
  _8 = *((&s_suits.array[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32(_7, 4)))))]));
  _9 = llvm_cbe_c_2e_addr;
  _10 = *_9;
  _11 = *((&s_nums.array[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_10, 4)))))]));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (llvm_sub_u32(32, (llvm_sdiv_u32((llvm_srem_u32((llvm_add_u32(1, _5)), 4)), 2)))), _8, _11);
  _12 = llvm_cbe_i;
  llvm_cbe_inc = llvm_add_u32(_12, 1);
  llvm_cbe_i = llvm_cbe_inc;
  if (((((llvm_srem_u32(llvm_cbe_inc, 8)) != 0u)&1))) {
  _13 = llvm_cbe_i;
  if ((((_13 == 52u)&1))) {
  llvm_cbe_call7 = putchar(10);

}
  } else {
  llvm_cbe_call7_2e_splitted1 = putchar(10);

}

  _14 = llvm_cbe_c_2e_addr;
  llvm_cbe_c_2e_addr = ((&_14[((int32_t)1)]));

  _3 = llvm_cbe_i;
}
  return;
}


void deal(uint32_t llvm_cbe_s, uint32_t* llvm_cbe_t) {
  uint32_t llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_t_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t* _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t llvm_cbe_call;
  uint32_t _22;
  uint32_t* _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t* _26;
  uint32_t _27;
  uint32_t _28;
  uint32_t* _29;
  uint32_t _30;
  uint32_t _31;
  uint32_t* _32;
  uint32_t _33;
  uint32_t _34;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_t_2e_addr = llvm_cbe_t;
  ;
  ;
  ;
  _15 = llvm_cbe_s_2e_addr;
  srnd(_15);
  llvm_cbe_i = 0;

  _16 = llvm_cbe_i;
while (((int32_t)_16) < ((int32_t)52u)){
  _17 = llvm_cbe_i;
  _18 = llvm_cbe_t_2e_addr;
  _19 = llvm_cbe_i;
  *((&_18[((int64_t)(((int64_t)(int32_t)_19)))])) = (llvm_sub_u32(51, _17));

  _20 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_20, 1));

  _16 = llvm_cbe_i;
}
  llvm_cbe_i = 0;

  _21 = llvm_cbe_i;
while (((int32_t)_21) < ((int32_t)51u)){
  llvm_cbe_call = rnd();
  _22 = llvm_cbe_i;
  llvm_cbe_j = (llvm_sub_u32(51, (llvm_srem_u32(llvm_cbe_call, (llvm_sub_u32(52, _22))))));
  _23 = llvm_cbe_t_2e_addr;
  _24 = llvm_cbe_i;
  _25 = *((&_23[((int64_t)(((int64_t)(int32_t)_24)))]));
  llvm_cbe_s_2e_addr = _25;
  _26 = llvm_cbe_t_2e_addr;
  _27 = llvm_cbe_j;
  _28 = *((&_26[((int64_t)(((int64_t)(int32_t)_27)))]));
  _29 = llvm_cbe_t_2e_addr;
  _30 = llvm_cbe_i;
  *((&_29[((int64_t)(((int64_t)(int32_t)_30)))])) = _28;
  _31 = llvm_cbe_s_2e_addr;
  _32 = llvm_cbe_t_2e_addr;
  _33 = llvm_cbe_j;
  *((&_32[((int64_t)(((int64_t)(int32_t)_33)))])) = _31;

  _34 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_34, 1));

  _21 = llvm_cbe_i;
}
  return;
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_c = (uint32_t)argc;
  uint8_t** llvm_cbe_v = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_c_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_v_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_s;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_52_uint32_t llvm_cbe_card __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t _35;
  uint8_t** _36;
  uint8_t* _37;
  uint32_t llvm_cbe_call;
  uint8_t* llvm_cbe_call2;
  uint32_t _38;
  uint32_t _39;
  uint32_t llvm_cbe_call3;

  llvm_cbe_retval = 0;
  llvm_cbe_c_2e_addr = llvm_cbe_c;
  ;
  llvm_cbe_v_2e_addr = llvm_cbe_v;
  ;
  ;
  ;
  _35 = llvm_cbe_c_2e_addr;
  if ((((((int32_t)_35) < ((int32_t)2u))&1))) {
  llvm_cbe_s = 11982;

  llvm_cbe_call2 = setlocale(6, ((&_OC_str_OC_1.array[((int64_t)0)])));
  _38 = llvm_cbe_s;
  deal(_38, ((&llvm_cbe_card.array[((int64_t)0)])));
  _39 = llvm_cbe_s;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _39);
  show(((&llvm_cbe_card.array[((int64_t)0)])));
  return 0;
}
  _36 = llvm_cbe_v_2e_addr;
  _37 = *((&_36[((int64_t)1)]));
  llvm_cbe_call = atoi(_37);
  llvm_cbe_s = llvm_cbe_call;
  if ((((((int32_t)llvm_cbe_call) <= ((int32_t)0u))&1))) {
  llvm_cbe_s = 11982;

  llvm_cbe_call2 = setlocale(6, ((&_OC_str_OC_1.array[((int64_t)0)])));
  _38 = llvm_cbe_s;
  deal(_38, ((&llvm_cbe_card.array[((int64_t)0)])));
  _39 = llvm_cbe_s;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _39);
  show(((&llvm_cbe_card.array[((int64_t)0)])));
  return 0;
}
  llvm_cbe_call2 = setlocale(6, ((&_OC_str_OC_1.array[((int64_t)0)])));
  _38 = llvm_cbe_s;
  deal(_38, ((&llvm_cbe_card.array[((int64_t)0)])));
  _39 = llvm_cbe_s;
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _39);
  show(((&llvm_cbe_card.array[((int64_t)0)])));
  return 0;
}

