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
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_31_uint64_t {
  uint64_t array[31];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t rand_n(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t rand(void) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint8_t _OC_str = { ". " };
static struct l_array_3_uint8_t _OC_str_OC_1 = { "  " };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
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


/* Function Bodies */

uint32_t rand_n(uint32_t llvm_cbe_m) {
  uint32_t llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_rand_max;    /* Address-exposed local */
  uint32_t llvm_cbe_r;    /* Address-exposed local */
  uint32_t _1;
  uint32_t llvm_cbe_call;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;

  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  ;
  _1 = llvm_cbe_m_2e_addr;
  llvm_cbe_rand_max = (llvm_sub_u32(2147483647u, (llvm_srem_u32(2147483647u, _1))));
  ;

  llvm_cbe_call = rand();
  llvm_cbe_r = llvm_cbe_call;
  _2 = llvm_cbe_rand_max;
while (((int32_t)llvm_cbe_call) > ((int32_t)_2)){

  llvm_cbe_call = rand();
  llvm_cbe_r = llvm_cbe_call;
  _2 = llvm_cbe_rand_max;
}
  _3 = llvm_cbe_r;
  _4 = llvm_cbe_rand_max;
  _5 = llvm_cbe_m_2e_addr;
  return (llvm_sdiv_u32(_3, (llvm_sdiv_u32(_4, _5))));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_x;    /* Address-exposed local */
  uint32_t llvm_cbe_y;    /* Address-exposed local */
  uint32_t llvm_cbe_r2;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_31_uint64_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _6;
  uint32_t _7;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  uint32_t _15;
  uint64_t* llvm_cbe_arrayidx;
  uint64_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint64_t _21;
  uint32_t _22;
  uint64_t _23;
  uint32_t llvm_cbe_call20;
  uint32_t _24;
  uint32_t llvm_cbe_call23;
  uint32_t _25;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  ;
  _6 = memset((((uint8_t*)(&llvm_cbe_buf))), 0, 248);
  llvm_cbe_i = 0;

  _7 = llvm_cbe_i;
while (((int32_t)_7) < ((int32_t)100u)){
  llvm_cbe_call = rand_n(31);
  llvm_cbe_x = (llvm_sub_u32(llvm_cbe_call, 15));
  llvm_cbe_call1 = rand_n(31);
  llvm_cbe_y = (llvm_sub_u32(llvm_cbe_call1, 15));
  _8 = llvm_cbe_x;
  _9 = llvm_cbe_x;
  _10 = llvm_cbe_y;
  _11 = llvm_cbe_y;
  llvm_cbe_r2 = (llvm_add_u32((llvm_mul_u32(_8, _9)), (llvm_mul_u32(_10, _11))));
  _12 = llvm_cbe_r2;
  if ((((((int32_t)_12) >= ((int32_t)100u))&1))) {
  _13 = llvm_cbe_r2;
  if ((((((int32_t)_13) <= ((int32_t)225u))&1))) {
  _14 = llvm_cbe_x;
  _15 = llvm_cbe_y;
  llvm_cbe_arrayidx = (&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(15, _15)))))]);
  _16 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (_16 | (((int64_t)(int32_t)(1 << (llvm_add_u32(_14, 15))))));
  _17 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_17, 1));


  } else {

}
  } else {

}
  _7 = llvm_cbe_i;
}
  llvm_cbe_y = 0;

  _18 = llvm_cbe_y;
while (((int32_t)_18) < ((int32_t)31u)){
  llvm_cbe_x = 0;

  _19 = llvm_cbe_x;
while (((int32_t)_19) < ((int32_t)31u)){
  _20 = llvm_cbe_y;
  _21 = *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)_20)))]));
  _22 = llvm_cbe_x;
  _23 = ((uint64_t)(bool)((((_21 & (((int64_t)(int32_t)(1 << _22)))) != UINT64_C(0))&1)));
  llvm_cbe_call20 = printf((llvm_select_pu8(((((_21 & (((int64_t)(int32_t)(1 << _22)))) != UINT64_C(0))&1)), ((&_OC_str.array[((int64_t)0)])), ((&_OC_str_OC_1.array[((int64_t)0)])))));

  _24 = llvm_cbe_x;
  llvm_cbe_x = (llvm_add_u32(_24, 1));

  _19 = llvm_cbe_x;
}
  llvm_cbe_call23 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  _25 = llvm_cbe_y;
  llvm_cbe_y = (llvm_add_u32(_25, 1));

  _18 = llvm_cbe_y;
}
  return 0;
}

