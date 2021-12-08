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
typedef uint32_t l_fptr_1(uint32_t, uint32_t);


/* Types Definitions */
struct l_array_5_uint32_t {
  uint32_t array[5];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t reduce(l_fptr_1*, uint32_t, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t add(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t sub(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t mul(uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_5_uint32_t __const_OC_main_OC_nums __attribute__((aligned(16))) = { { 1, 2, 3, 4, 5 } };
static struct l_array_4_uint8_t _OC_str = { "%d\n" };


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


/* Function Bodies */

uint32_t reduce(l_fptr_1* llvm_cbe_fn, uint32_t llvm_cbe_size, uint32_t* llvm_cbe_elms) {
  l_fptr_1* llvm_cbe_fn_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_size_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_elms_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_val;    /* Address-exposed local */
  uint32_t* _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  l_fptr_1* _5;
  uint32_t _6;
  uint32_t* _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t llvm_cbe_call;
  uint32_t _10;
  uint32_t _11;

  llvm_cbe_fn_2e_addr = llvm_cbe_fn;
  ;
  llvm_cbe_size_2e_addr = llvm_cbe_size;
  ;
  llvm_cbe_elms_2e_addr = llvm_cbe_elms;
  ;
  ;
  ;
  _1 = llvm_cbe_elms_2e_addr;
  _2 = *_1;
  llvm_cbe_val = _2;
  llvm_cbe_i = 1;

  _3 = llvm_cbe_i;
  _4 = llvm_cbe_size_2e_addr;
while (((int32_t)_3) < ((int32_t)_4)){
  _5 = llvm_cbe_fn_2e_addr;
  _6 = llvm_cbe_val;
  _7 = llvm_cbe_elms_2e_addr;
  _8 = llvm_cbe_i;
  _9 = *((&_7[((int64_t)(((int64_t)(int32_t)_8)))]));
  llvm_cbe_call = _5(_6, _9);
  llvm_cbe_val = llvm_cbe_call;

  _10 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_10, 1));

  _3 = llvm_cbe_i;
  _4 = llvm_cbe_size_2e_addr;
}
  _11 = llvm_cbe_val;
  return _11;
}


uint32_t add(uint32_t llvm_cbe_a, uint32_t llvm_cbe_b) {
  uint32_t llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint32_t _12;
  uint32_t _13;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  _12 = llvm_cbe_a_2e_addr;
  _13 = llvm_cbe_b_2e_addr;
  return (llvm_add_u32(_12, _13));
}


uint32_t sub(uint32_t llvm_cbe_a, uint32_t llvm_cbe_b) {
  uint32_t llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint32_t _14;
  uint32_t _15;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  _14 = llvm_cbe_a_2e_addr;
  _15 = llvm_cbe_b_2e_addr;
  return (llvm_sub_u32(_14, _15));
}


uint32_t mul(uint32_t llvm_cbe_a, uint32_t llvm_cbe_b) {
  uint32_t llvm_cbe_a_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_b_2e_addr;    /* Address-exposed local */
  uint32_t _16;
  uint32_t _17;

  llvm_cbe_a_2e_addr = llvm_cbe_a;
  ;
  llvm_cbe_b_2e_addr = llvm_cbe_b;
  ;
  _16 = llvm_cbe_a_2e_addr;
  _17 = llvm_cbe_b_2e_addr;
  return (llvm_mul_u32(_16, _17));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_5_uint32_t llvm_cbe_nums __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _18;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call6;
  uint32_t llvm_cbe_call7;

  llvm_cbe_retval = 0;
  ;
  _18 = memcpy((((uint8_t*)(&llvm_cbe_nums))), ((uint8_t*)(&__const_OC_main_OC_nums)), 20);
  llvm_cbe_call = reduce(add, 5, ((&llvm_cbe_nums.array[((int64_t)0)])));
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call3 = reduce(sub, 5, ((&llvm_cbe_nums.array[((int64_t)0)])));
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call3);
  llvm_cbe_call6 = reduce(mul, 5, ((&llvm_cbe_nums.array[((int64_t)0)])));
  llvm_cbe_call7 = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_call6);
  return 0;
}

