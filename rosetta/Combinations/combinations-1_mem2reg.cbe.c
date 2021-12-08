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
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
void comb(uint32_t, uint32_t, uint64_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint64_t one = 1;
static struct l_array_4_uint8_t _OC_str = { "%d " };
static struct l_array_2_uint8_t _OC_str_OC_1 = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}


/* Function Bodies */

void comb(uint32_t llvm_cbe_pool, uint32_t llvm_cbe_need, uint64_t llvm_cbe_chosen, uint32_t llvm_cbe_at) {
  uint32_t at;
  uint32_t at__PHI_TEMPORARY;
  uint64_t _1;
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call6;
  uint64_t _2;

  ;
  ;
  ;
  ;
  if ((((((int32_t)llvm_cbe_pool) < ((int32_t)(llvm_add_u32(llvm_cbe_need, llvm_cbe_at))))&1))) {

  return;
}
  if ((((llvm_cbe_need != 0u)&1))) {
  _2 = one;
  comb(llvm_cbe_pool, (llvm_sub_u32(llvm_cbe_need, 1)), (llvm_cbe_chosen | (_2 << (((uint64_t)(uint32_t)llvm_cbe_at)))), (llvm_add_u32(llvm_cbe_at, 1)));
  comb(llvm_cbe_pool, llvm_cbe_need, llvm_cbe_chosen, (llvm_add_u32(llvm_cbe_at, 1)));

  return;
}
  ;
  at__PHI_TEMPORARY = 0;   /* for PHI node */

  at = at__PHI_TEMPORARY;
  ;
while (((int32_t)at) < ((int32_t)llvm_cbe_pool)){
  _1 = one;
  if (((((llvm_cbe_chosen & (_1 << (((uint64_t)(uint32_t)at)))) != UINT64_C(0))&1))) {
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), at);

}

  at = llvm_add_u32(at, 1);
  ;
  at__PHI_TEMPORARY = at;   /* for PHI node */

  at = at__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call6 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));

  return;
}


int main(void) {
  comb(5, 3, 0, 0);
  return 0;
}

