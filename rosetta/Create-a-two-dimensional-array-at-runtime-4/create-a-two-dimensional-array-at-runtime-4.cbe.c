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
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t __isoc99_scanf(uint8_t*, ...);
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_23_uint8_t _OC_str = { "Enter size of array:  " };
static struct l_array_3_uint8_t _OC_str_OC_1 = { "%d" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "%d " };
static struct l_array_2_uint8_t _OC_str_OC_3 = { "\n" };


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
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_neg_u64(uint64_t a) {
  uint64_t r = -a;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_user1;    /* Address-exposed local */
  uint32_t llvm_cbe_space_needed;    /* Address-exposed local */
  uint32_t* llvm_cbe_a1;    /* Address-exposed local */
  uint32_t** llvm_cbe_array;    /* Address-exposed local */
  uint32_t llvm_cbe_row;    /* Address-exposed local */
  uint32_t llvm_cbe_col;    /* Address-exposed local */
  uint32_t llvm_cbe_offset;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint8_t* llvm_cbe_call3;
  uint32_t _4;
  uint8_t* llvm_cbe_call6;
  uint32_t _5;
  uint32_t _6;
  uint32_t* _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t** _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint32_t** _17;
  uint32_t _18;
  uint32_t* _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint32_t _27;
  uint32_t** _28;
  uint32_t _29;
  uint32_t* _30;
  uint32_t _31;
  uint32_t _32;
  uint32_t llvm_cbe_call33;
  uint32_t _33;
  uint32_t llvm_cbe_call37;
  uint32_t** _34;
  uint32_t* _35;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  llvm_cbe_user1 = 0;
  ;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = __isoc99_scanf(((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_user1));
  _1 = llvm_cbe_user1;
  _2 = llvm_cbe_user1;
  llvm_cbe_space_needed = (llvm_sdiv_u32((llvm_mul_u32((llvm_add_u32(_1, 1)), _2)), 2));
  _3 = llvm_cbe_space_needed;
  llvm_cbe_call3 = malloc((llvm_mul_u64((((int64_t)(int32_t)_3)), 4)));
  llvm_cbe_a1 = (((uint32_t*)llvm_cbe_call3));
  _4 = llvm_cbe_user1;
  llvm_cbe_call6 = malloc((llvm_mul_u64((((int64_t)(int32_t)_4)), 8)));
  llvm_cbe_array = (((uint32_t**)llvm_cbe_call6));
  llvm_cbe_row = 0;
  llvm_cbe_offset = 0;

  _5 = llvm_cbe_row;
  _6 = llvm_cbe_user1;
while (((int32_t)_5) < ((int32_t)_6)){
  _7 = llvm_cbe_a1;
  _8 = llvm_cbe_offset;
  _9 = llvm_cbe_row;
  _10 = llvm_cbe_array;
  _11 = llvm_cbe_row;
  *((&_10[((int64_t)(((int64_t)(int32_t)_11)))])) = ((&((&_7[((int64_t)(((int64_t)(int32_t)_8)))]))[((int64_t)(llvm_neg_u64((((int64_t)(int32_t)_9)))))]));
  _12 = llvm_cbe_row;
  llvm_cbe_col = _12;

  _13 = llvm_cbe_col;
  _14 = llvm_cbe_user1;
while (((int32_t)_13) < ((int32_t)_14)){
  _15 = llvm_cbe_col;
  _16 = llvm_cbe_row;
  _17 = llvm_cbe_array;
  _18 = llvm_cbe_row;
  _19 = *((&_17[((int64_t)(((int64_t)(int32_t)_18)))]));
  _20 = llvm_cbe_col;
  *((&_19[((int64_t)(((int64_t)(int32_t)_20)))])) = (llvm_sub_u32((llvm_add_u32(1, _15)), _16));

  _21 = llvm_cbe_col;
  llvm_cbe_col = (llvm_add_u32(_21, 1));

  _13 = llvm_cbe_col;
  _14 = llvm_cbe_user1;
}

  _22 = llvm_cbe_user1;
  _23 = llvm_cbe_row;
  _24 = llvm_cbe_offset;
  llvm_cbe_offset = (llvm_add_u32(_24, (llvm_sub_u32(_22, _23))));
  _25 = llvm_cbe_row;
  llvm_cbe_row = (llvm_add_u32(_25, 1));

  _5 = llvm_cbe_row;
  _6 = llvm_cbe_user1;
}
  llvm_cbe_row = 0;

  _26 = llvm_cbe_row;
  _27 = llvm_cbe_user1;
while (((int32_t)_26) < ((int32_t)_27)){
  _28 = llvm_cbe_array;
  _29 = llvm_cbe_row;
  _30 = *((&_28[((int64_t)(((int64_t)(int32_t)_29)))]));
  _31 = llvm_cbe_user1;
  _32 = *((&_30[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_31, 1)))))]));
  llvm_cbe_call33 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _32);

  _33 = llvm_cbe_row;
  llvm_cbe_row = (llvm_add_u32(_33, 1));

  _26 = llvm_cbe_row;
  _27 = llvm_cbe_user1;
}
  llvm_cbe_call37 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  _34 = llvm_cbe_array;
  free((((uint8_t*)_34)));
  _35 = llvm_cbe_a1;
  free((((uint8_t*)_35)));
  return 0;
}

