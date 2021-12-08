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
  struct l_array_3_uint32_t llvm_cbe_count_list;    /* Address-exposed local */
  uint8_t* _1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t try_max;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t sum;
  uint32_t sum__PHI_TEMPORARY;
  uint32_t try_max__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx;
  uint32_t _2;
  uint32_t* llvm_cbe_arrayidx15;
  uint32_t _3;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t _4;
  uint32_t _5;
  uint32_t llvm_cbe_call;
  uint32_t _6;
  uint32_t llvm_cbe_call25;
  uint32_t _7;
  uint32_t llvm_cbe_call27;

  ;
  ;
  ;
  _1 = memcpy((((uint8_t*)(&llvm_cbe_count_list))), ((uint8_t*)(&__const_OC_main_OC_count_list)), 12);
  ;
  i__PHI_TEMPORARY = 2;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) <= ((int32_t)20000u)){
  try_max = llvm_sdiv_u32(i, 2);
  ;
  ;
  ;
  j__PHI_TEMPORARY = 2;   /* for PHI node */
  sum__PHI_TEMPORARY = 1;   /* for PHI node */
  try_max__PHI_TEMPORARY = try_max;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  try_max = try_max__PHI_TEMPORARY;
  ;
  ;
  ;
while (((int32_t)j) < ((int32_t)try_max)){
  if (((((llvm_srem_u32(i, j)) != 0u)&1))) {
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  try_max__PHI_TEMPORARY = try_max;   /* for PHI node */

  } else {
  try_max = llvm_sdiv_u32(i, j);
  ;
  sum = llvm_add_u32(sum, j);
  ;
  if ((((j != try_max)&1))) {
  sum = llvm_add_u32(sum, try_max);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */

}
  sum = sum__PHI_TEMPORARY;
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  try_max__PHI_TEMPORARY = try_max;   /* for PHI node */

}
  sum = sum__PHI_TEMPORARY;
  try_max = try_max__PHI_TEMPORARY;
  ;
  ;
  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  try_max__PHI_TEMPORARY = try_max;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  try_max = try_max__PHI_TEMPORARY;
  ;
  ;
  ;
}
  if ((((((int32_t)sum) < ((int32_t)i))&1))) {
  llvm_cbe_arrayidx = (&llvm_cbe_count_list.array[((int64_t)0)]);
  _2 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (llvm_add_u32(_2, 1));

  } else {
  if ((((((int32_t)sum) > ((int32_t)i))&1))) {
  llvm_cbe_arrayidx15 = (&llvm_cbe_count_list.array[((int64_t)2)]);
  _3 = *llvm_cbe_arrayidx15;
  *llvm_cbe_arrayidx15 = (llvm_add_u32(_3, 1));

  } else {
  llvm_cbe_arrayidx18 = (&llvm_cbe_count_list.array[((int64_t)1)]);
  _4 = *llvm_cbe_arrayidx18;
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_4, 1));

}
}
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  _5 = *((&llvm_cbe_count_list.array[((int64_t)0)]));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _5);
  _6 = *((&llvm_cbe_count_list.array[((int64_t)1)]));
  llvm_cbe_call25 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _6);
  _7 = *((&llvm_cbe_count_list.array[((int64_t)2)]));
  llvm_cbe_call27 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _7);
  return 0;
}

