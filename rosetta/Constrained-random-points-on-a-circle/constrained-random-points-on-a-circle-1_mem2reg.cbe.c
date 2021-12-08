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
  uint32_t rand_max;
  uint32_t r;

  ;
  rand_max = llvm_sub_u32(2147483647u, (llvm_srem_u32(2147483647u, llvm_cbe_m)));
  ;

  r = rand();
  ;
while (((int32_t)r) > ((int32_t)rand_max)){

  r = rand();
  ;
}
  return (llvm_sdiv_u32(r, (llvm_sdiv_u32(rand_max, llvm_cbe_m))));
}


int main(void) {
  __MSALIGN__(16) struct l_array_31_uint64_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t x;
  uint32_t llvm_cbe_call1;
  uint32_t y;
  uint32_t r2;
  uint64_t* llvm_cbe_arrayidx;
  uint64_t _2;
  uint32_t y__PHI_TEMPORARY;
  uint32_t x__PHI_TEMPORARY;
  uint64_t _3;
  uint64_t _4;
  uint32_t llvm_cbe_call20;
  uint32_t llvm_cbe_call23;
  uint32_t llvm_cbe_i_2e_1_2e_splitted1;
  uint32_t llvm_cbe_i_2e_1_2e_splitted1__PHI_TEMPORARY;
  uint32_t llvm_cbe_i_2e_1_2e_splitted2;
  uint32_t llvm_cbe_i_2e_1_2e_splitted2__PHI_TEMPORARY;

  ;
  _1 = memset((((uint8_t*)(&llvm_cbe_buf))), 0, 248);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)100u)){
  llvm_cbe_call = rand_n(31);
  x = llvm_sub_u32(llvm_cbe_call, 15);
  ;
  llvm_cbe_call1 = rand_n(31);
  y = llvm_sub_u32(llvm_cbe_call1, 15);
  ;
  r2 = llvm_add_u32((llvm_mul_u32(x, x)), (llvm_mul_u32(y, y)));
  ;
  if ((((((int32_t)r2) >= ((int32_t)100u))&1))) {
  if ((((((int32_t)r2) <= ((int32_t)225u))&1))) {
  llvm_cbe_arrayidx = (&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(15, y)))))]);
  _2 = *llvm_cbe_arrayidx;
  *llvm_cbe_arrayidx = (_2 | (((int64_t)(int32_t)(1 << (llvm_add_u32(x, 15))))));
  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  } else {
    llvm_cbe_i_2e_1_2e_splitted1__PHI_TEMPORARY = i;   /* for PHI node */
  llvm_cbe_i_2e_1_2e_splitted1 = llvm_cbe_i_2e_1_2e_splitted1__PHI_TEMPORARY;
  ;
  i__PHI_TEMPORARY = llvm_cbe_i_2e_1_2e_splitted2;   /* for PHI node */

}
  } else {
    llvm_cbe_i_2e_1_2e_splitted2__PHI_TEMPORARY = i;   /* for PHI node */
  llvm_cbe_i_2e_1_2e_splitted2 = llvm_cbe_i_2e_1_2e_splitted2__PHI_TEMPORARY;
  ;
  i__PHI_TEMPORARY = llvm_cbe_i_2e_1_2e_splitted2;   /* for PHI node */

}
  i = i__PHI_TEMPORARY;
  ;
}
  ;
  y__PHI_TEMPORARY = 0;   /* for PHI node */

  y = y__PHI_TEMPORARY;
  ;
while (((int32_t)y) < ((int32_t)31u)){
  ;
  x__PHI_TEMPORARY = 0;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
while (((int32_t)x) < ((int32_t)31u)){
  _3 = *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)y)))]));
  _4 = ((uint64_t)(bool)((((_3 & (((int64_t)(int32_t)(1 << x)))) != UINT64_C(0))&1)));
  llvm_cbe_call20 = printf((llvm_select_pu8(((((_3 & (((int64_t)(int32_t)(1 << x)))) != UINT64_C(0))&1)), ((&_OC_str.array[((int64_t)0)])), ((&_OC_str_OC_1.array[((int64_t)0)])))));

  x = llvm_add_u32(x, 1);
  ;
  x__PHI_TEMPORARY = x;   /* for PHI node */

  x = x__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call23 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  y = llvm_add_u32(y, 1);
  ;
  y__PHI_TEMPORARY = y;   /* for PHI node */

  y = y__PHI_TEMPORARY;
  ;
}
  return 0;
}

