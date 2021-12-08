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
  uint32_t llvm_cbe_pool_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_need_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_chosen_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_at_2e_addr;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint64_t _7;
  uint64_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t llvm_cbe_call;
  uint32_t _11;
  uint32_t llvm_cbe_call6;
  uint32_t _12;
  uint32_t _13;
  uint64_t _14;
  uint64_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t _18;
  uint32_t _19;
  uint64_t _20;
  uint32_t _21;

  llvm_cbe_pool_2e_addr = llvm_cbe_pool;
  ;
  llvm_cbe_need_2e_addr = llvm_cbe_need;
  ;
  llvm_cbe_chosen_2e_addr = llvm_cbe_chosen;
  ;
  llvm_cbe_at_2e_addr = llvm_cbe_at;
  ;
  _1 = llvm_cbe_pool_2e_addr;
  _2 = llvm_cbe_need_2e_addr;
  _3 = llvm_cbe_at_2e_addr;
  if ((((((int32_t)_1) < ((int32_t)(llvm_add_u32(_2, _3))))&1))) {

  return;
}
  _4 = llvm_cbe_need_2e_addr;
  if ((((_4 != 0u)&1))) {
  _12 = llvm_cbe_pool_2e_addr;
  _13 = llvm_cbe_need_2e_addr;
  _14 = llvm_cbe_chosen_2e_addr;
  _15 = one;
  _16 = llvm_cbe_at_2e_addr;
  _17 = llvm_cbe_at_2e_addr;
  comb(_12, (llvm_sub_u32(_13, 1)), (_14 | (_15 << (((uint64_t)(uint32_t)_16)))), (llvm_add_u32(_17, 1)));
  _18 = llvm_cbe_pool_2e_addr;
  _19 = llvm_cbe_need_2e_addr;
  _20 = llvm_cbe_chosen_2e_addr;
  _21 = llvm_cbe_at_2e_addr;
  comb(_18, _19, _20, (llvm_add_u32(_21, 1)));

  return;
}
  llvm_cbe_at_2e_addr = 0;

  _5 = llvm_cbe_at_2e_addr;
  _6 = llvm_cbe_pool_2e_addr;
while (((int32_t)_5) < ((int32_t)_6)){
  _7 = llvm_cbe_chosen_2e_addr;
  _8 = one;
  _9 = llvm_cbe_at_2e_addr;
  if (((((_7 & (_8 << (((uint64_t)(uint32_t)_9)))) != UINT64_C(0))&1))) {
  _10 = llvm_cbe_at_2e_addr;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _10);

}

  _11 = llvm_cbe_at_2e_addr;
  llvm_cbe_at_2e_addr = (llvm_add_u32(_11, 1));

  _5 = llvm_cbe_at_2e_addr;
  _6 = llvm_cbe_pool_2e_addr;
}
  llvm_cbe_call6 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));

  return;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */

  llvm_cbe_retval = 0;
  comb(5, 3, 0, 0);
  return 0;
}

