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
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_100_uint32_t {
  uint32_t array[100];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_17_uint8_t _OC_str = { "door #%ld is %s\n" };
static struct l_array_5_uint8_t _OC_str_OC_1 = { "open" };
static struct l_array_7_uint8_t _OC_str_OC_2 = { "closed" };


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
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_sdiv_u64(int64_t a, int64_t b) {
  uint64_t r = a / b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_100_uint32_t llvm_cbe_is_open __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t* llvm_cbe_doorptr;    /* Address-exposed local */
  uint32_t* llvm_cbe_doorlimit;    /* Address-exposed local */
  uint32_t llvm_cbe_pass;    /* Address-exposed local */
  uint8_t* _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t* _4;
  uint32_t* _5;
  uint32_t* _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t* _9;
  uint32_t _10;
  uint32_t* _11;
  uint32_t* _12;
  uint32_t* _13;
  uint32_t* _14;
  uint32_t _15;
  uint64_t _16;
  uint32_t llvm_cbe_call;
  uint32_t* _17;
  uint32_t _18;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  _1 = memset((((uint8_t*)(&llvm_cbe_is_open))), 0, 400);
  ;
  ;
  llvm_cbe_doorlimit = ((&((&llvm_cbe_is_open.array[((int64_t)0)]))[((int64_t)100)]));
  ;
  llvm_cbe_pass = 100;

  _2 = llvm_cbe_pass;
while (_2 != 0u){
  _3 = llvm_cbe_pass;
  llvm_cbe_doorptr = ((&((&llvm_cbe_is_open.array[((int64_t)0)]))[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_3, 1)))))]));

  _4 = llvm_cbe_doorptr;
  _5 = llvm_cbe_doorlimit;
while (((uint64_t)_4) < ((uint64_t)_5)){
  _6 = llvm_cbe_doorptr;
  _7 = *_6;
  *_6 = (_7 ^ 1);

  _8 = llvm_cbe_pass;
  _9 = llvm_cbe_doorptr;
  llvm_cbe_doorptr = ((&_9[((int64_t)(((int64_t)(int32_t)_8)))]));

  _4 = llvm_cbe_doorptr;
  _5 = llvm_cbe_doorlimit;
}

  _10 = llvm_cbe_pass;
  llvm_cbe_pass = (llvm_add_u32(_10, -1));

  _2 = llvm_cbe_pass;
}
  llvm_cbe_doorptr = ((&llvm_cbe_is_open.array[((int64_t)0)]));

  _11 = llvm_cbe_doorptr;
  _12 = llvm_cbe_doorlimit;
while (_11 != _12){
  _13 = llvm_cbe_doorptr;
  _14 = llvm_cbe_doorptr;
  _15 = *_14;
  _16 = ((uint64_t)(bool)(((_15 != 0u)&1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (llvm_add_u64((llvm_sdiv_u64((llvm_sub_u64((((uint64_t)(uintptr_t)_13)), (((uint64_t)(uintptr_t)((&llvm_cbe_is_open.array[((int64_t)0)])))))), 4)), 1)), (llvm_select_pu8((((_15 != 0u)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))));

  _17 = llvm_cbe_doorptr;
  llvm_cbe_doorptr = ((&_17[((int32_t)1)]));

  _11 = llvm_cbe_doorptr;
  _12 = llvm_cbe_doorlimit;
}
  _18 = llvm_cbe_retval;
  return _18;
}

