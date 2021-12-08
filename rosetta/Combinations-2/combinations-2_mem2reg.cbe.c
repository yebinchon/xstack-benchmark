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
struct l_array_100_uint8_t {
  uint8_t array[100];
};

/* External Global Variable Declarations */

/* Function Declarations */
void comb(uint32_t, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_5_uint8_t _OC_str = { "%d%c" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_select_u32(bool condition, uint32_t iftrue, uint32_t ifnot) {
  uint32_t r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint8_t llvm_add_u8(uint8_t a, uint8_t b) {
  uint8_t r = a + b;
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


/* Function Bodies */

void comb(uint32_t llvm_cbe_m, uint32_t llvm_cbe_n, uint8_t* llvm_cbe_c) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t _1;
  uint64_t _2;
  uint32_t llvm_cbe_call;
  uint8_t* llvm_cbe_arrayidx9;
  uint8_t _3;
  uint8_t _4;
  uint8_t* llvm_cbe_arrayidx29;
  uint8_t _5;
  uint8_t _6;

  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_n)){
  *((&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))])) = (((uint8_t)(llvm_sub_u32(llvm_cbe_n, i))));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}

){
  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, -1);
  ;
while (i != 0u){
  _1 = *((&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]));
  _2 = ((uint64_t)(bool)(((i != 0u)&1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (((uint32_t)(uint8_t)_1)), (llvm_select_u32((((i != 0u)&1)), 32, 10)));
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, -1);
  ;
}
  ;
  llvm_cbe_arrayidx9 = (&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)0)))]);
  _3 = *llvm_cbe_arrayidx9;
  *llvm_cbe_arrayidx9 = (llvm_add_u8(_3, 1));
  if ((((((int32_t)(((uint32_t)(uint8_t)_3))) < ((int32_t)llvm_cbe_m))&1))) {


  ;
  i__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  i = llvm_add_u32(i, -1);
  ;
  if (!(((i != 0u)&1))) {
  }

}
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom15;
  uint8_t* llvm_cbe_arrayidx16;
  uint32_t llvm_cbe_conv17;
  uint32_t llvm_cbe_sub18;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom15 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx16 = (&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]);
  _4 = *((&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_conv17 = ((uint32_t)(uint8_t)_4);
  llvm_cbe_sub18 = llvm_sub_u32(llvm_cbe_m, i);
while (((int32_t)llvm_cbe_conv17) >= ((int32_t)llvm_cbe_sub18)){
  i = llvm_add_u32(i, 1);
  ;
  if (!(((((int32_t)i) >= ((int32_t)llvm_cbe_n))&1))) {
}
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom15 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx16 = (&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]);
  _4 = *((&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_conv17 = ((uint32_t)(uint8_t)_4);
  llvm_cbe_sub18 = llvm_sub_u32(llvm_cbe_m, i);
}
  llvm_cbe_arrayidx29 = (&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]);
  _5 = *llvm_cbe_arrayidx29;
  *llvm_cbe_arrayidx29 = (llvm_add_u8(_5, 1));
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (i != 0u){
  _6 = *((&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)i)))]));
  *((&llvm_cbe_c[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))])) = (((uint8_t)(llvm_add_u32((((uint32_t)(uint8_t)_6)), 1))));

  i = llvm_add_u32(i, -1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}

  ;
    i__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */

;
}
  return;
}


int main(void) {
  __MSALIGN__(16) struct l_array_100_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */

  ;
  comb(5, 3, ((&llvm_cbe_buf.array[((int64_t)0)])));
  return 0;
}

