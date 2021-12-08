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
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_31_uint8_t {
  uint8_t array[31];
};
struct l_array_4_uint8_t_KC_ {
  uint8_t* array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_60_uint8_t {
  uint8_t array[60];
};
struct l_array_3_uint32_t {
  uint32_t array[3];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint64_t choose(uint32_t*, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_5_uint8_t _OC_str = { "iced" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "jam" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "plain" };
static struct l_array_31_uint8_t _OC_str_OC_3 = { "something completely different" };
__MSALIGN__(16) struct l_array_4_uint8_t_KC_ donuts __attribute__((aligned(16))) = { { ((&_OC_str.array[((int32_t)0)])), ((&_OC_str_OC_1.array[((int32_t)0)])), ((&_OC_str_OC_2.array[((int32_t)0)])), ((&_OC_str_OC_3.array[((int32_t)0)])) } };
static struct l_array_4_uint8_t _OC_str_OC_4 = { "%s\t" };
static struct l_array_2_uint8_t _OC_str_OC_5 = { "\n" };
static struct l_array_60_uint8_t _OC_str_OC_6 = { "\nWere there ten donuts, we'd have had %ld choices of three\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}


/* Function Bodies */

uint64_t choose(uint32_t* llvm_cbe_got, uint32_t llvm_cbe_n_chosen, uint32_t llvm_cbe_len, uint32_t llvm_cbe_at, uint32_t llvm_cbe_max_types) {
  uint64_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t* llvm_cbe_got_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_chosen_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_at_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_max_types_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t llvm_cbe_count;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t* _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t* _6;
  uint32_t _7;
  uint32_t _8;
  uint8_t* _9;
  uint32_t llvm_cbe_call;
  uint32_t _10;
  uint32_t llvm_cbe_call5;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t* _14;
  uint32_t _15;
  uint32_t* _16;
  uint32_t _17;
  uint32_t* _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  uint64_t llvm_cbe_call15;
  uint64_t _23;
  uint32_t _24;
  uint64_t _25;
  uint64_t _26;

  llvm_cbe_got_2e_addr = llvm_cbe_got;
  ;
  llvm_cbe_n_chosen_2e_addr = llvm_cbe_n_chosen;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  llvm_cbe_at_2e_addr = llvm_cbe_at;
  ;
  llvm_cbe_max_types_2e_addr = llvm_cbe_max_types;
  ;
  ;
  ;
  llvm_cbe_count = 0;
  _1 = llvm_cbe_n_chosen_2e_addr;
  _2 = llvm_cbe_len_2e_addr;
  if ((((_1 == _2)&1))) {
  _3 = llvm_cbe_got_2e_addr;
  if (!(((_3 != ((uint32_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval = 1;

  _26 = llvm_cbe_retval;
  return _26;
}
  llvm_cbe_i = 0;

  _4 = llvm_cbe_i;
  _5 = llvm_cbe_len_2e_addr;
  if (!(((((int32_t)_4) < ((int32_t)_5))&1))) {
  }

  _6 = llvm_cbe_got_2e_addr;
  _7 = llvm_cbe_i;
  _8 = *((&_6[((int64_t)(((int64_t)(int32_t)_7)))]));
  _9 = *((&donuts.array[((int64_t)(((int64_t)(int32_t)_8)))]));
  llvm_cbe_call = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _9);

  llvm_cbe_call5 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  llvm_cbe_retval = 1;

  _10 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_10, 1));

  } else {
  _11 = llvm_cbe_at_2e_addr;
  llvm_cbe_i = _11;

  _12 = llvm_cbe_i;
  _13 = llvm_cbe_max_types_2e_addr;
  if (!(((((int32_t)_12) < ((int32_t)_13))&1))) {
  }

  _14 = llvm_cbe_got_2e_addr;
  if ((((_14 != ((uint32_t*)/*NULL*/0))&1))) {
  _15 = llvm_cbe_i;
  _16 = llvm_cbe_got_2e_addr;
  _17 = llvm_cbe_n_chosen_2e_addr;
  *((&_16[((int64_t)(((int64_t)(int32_t)_17)))])) = _15;

}
  _25 = llvm_cbe_count;
  llvm_cbe_retval = _25;

  _18 = llvm_cbe_got_2e_addr;
  _19 = llvm_cbe_n_chosen_2e_addr;
  _20 = llvm_cbe_len_2e_addr;
  _21 = llvm_cbe_i;
  _22 = llvm_cbe_max_types_2e_addr;
  llvm_cbe_call15 = choose(_18, (llvm_add_u32(_19, 1)), _20, _21, _22);
  _23 = llvm_cbe_count;
  llvm_cbe_count = (llvm_add_u64(_23, llvm_cbe_call15));

}
  _4 = llvm_cbe_i;
  _5 = llvm_cbe_len_2e_addr;
while (((int32_t)_4) < ((int32_t)_5)){
  _4 = llvm_cbe_i;
  _5 = llvm_cbe_len_2e_addr;
}
  _12 = llvm_cbe_i;
  _13 = llvm_cbe_max_types_2e_addr;
while (((int32_t)_12) < ((int32_t)_13)){
  _24 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_24, 1));

  _12 = llvm_cbe_i;
  _13 = llvm_cbe_max_types_2e_addr;
}
  _26 = llvm_cbe_retval;
  return _26;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_array_3_uint32_t llvm_cbe_chosen;    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  uint64_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_call = choose(((&llvm_cbe_chosen.array[((int64_t)0)])), 0, 2, 0, 3);
  llvm_cbe_call1 = choose(((uint32_t*)/*NULL*/0), 0, 3, 0, 10);
  llvm_cbe_call2 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), llvm_cbe_call1);
  return 0;
}

