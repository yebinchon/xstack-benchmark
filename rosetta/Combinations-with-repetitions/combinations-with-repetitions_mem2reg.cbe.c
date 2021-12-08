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
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _1;
  uint8_t* _2;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call5;
  uint64_t count;
  uint64_t count__PHI_TEMPORARY;
  uint64_t llvm_cbe_call15;
  uint64_t llvm_cbe_retval_2e_0;
  uint64_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  ;
  ;
  ;
  ;
  if ((((llvm_cbe_n_chosen == llvm_cbe_len)&1))) {
  if (!(((llvm_cbe_got != ((uint32_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)i) < ((int32_t)llvm_cbe_len))&1))) {
  }

  _1 = *((&llvm_cbe_got[((int64_t)(((int64_t)(int32_t)i)))]));
  _2 = *((&donuts.array[((int64_t)(((int64_t)(int32_t)_1)))]));
  llvm_cbe_call = printf(((&_OC_str_OC_4.array[((int64_t)0)])), _2);

  llvm_cbe_call5 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 1;   /* for PHI node */

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  } else {
  ;
  i__PHI_TEMPORARY = llvm_cbe_at;   /* for PHI node */
  count__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  count = count__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int32_t)i) < ((int32_t)llvm_cbe_max_types))&1))) {
  }

  if ((((llvm_cbe_got != ((uint32_t*)/*NULL*/0))&1))) {
  *((&llvm_cbe_got[((int64_t)(((int64_t)(int32_t)llvm_cbe_n_chosen)))])) = i;

}
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = count;   /* for PHI node */

  llvm_cbe_call15 = choose(llvm_cbe_got, (llvm_add_u32(llvm_cbe_n_chosen, 1)), llvm_cbe_len, i, llvm_cbe_max_types);
  count = llvm_add_u64(count, llvm_cbe_call15);
  ;

}
  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_len)){
  i = i__PHI_TEMPORARY;
  ;
}
  i = i__PHI_TEMPORARY;
  count = count__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_max_types)){
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  count__PHI_TEMPORARY = count;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  count = count__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


int main(void) {
  struct l_array_3_uint32_t llvm_cbe_chosen;    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  uint64_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;

  ;
  llvm_cbe_call = choose(((&llvm_cbe_chosen.array[((int64_t)0)])), 0, 2, 0, 3);
  llvm_cbe_call1 = choose(((uint32_t*)/*NULL*/0), 0, 3, 0, 10);
  llvm_cbe_call2 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), llvm_cbe_call1);
  return 0;
}

