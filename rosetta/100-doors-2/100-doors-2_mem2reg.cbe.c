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
  __MSALIGN__(16) struct l_array_100_uint32_t llvm_cbe_is_open __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _1;
  uint32_t* doorlimit;
  uint32_t pass;
  uint32_t pass__PHI_TEMPORARY;
  uint32_t* doorptr;
  uint32_t* doorptr__PHI_TEMPORARY;
  uint32_t _2;
  uint32_t _3;
  uint64_t _4;
  uint32_t llvm_cbe_call;

  ;
  ;
  ;
  _1 = memset((((uint8_t*)(&llvm_cbe_is_open))), 0, 400);
  doorlimit = (&((&llvm_cbe_is_open.array[((int64_t)0)]))[((int64_t)100)]);
  ;
  ;
  pass__PHI_TEMPORARY = 100;   /* for PHI node */

  pass = pass__PHI_TEMPORARY;
  ;
while (pass != 0u){
  doorptr = (&((&llvm_cbe_is_open.array[((int64_t)0)]))[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(pass, 1)))))]);
  ;
  doorptr__PHI_TEMPORARY = doorptr;   /* for PHI node */

  doorptr = doorptr__PHI_TEMPORARY;
  ;
while (((uint64_t)doorptr) < ((uint64_t)doorlimit)){
  _2 = *doorptr;
  *doorptr = (_2 ^ 1);

  doorptr = (&doorptr[((int64_t)(((int64_t)(int32_t)pass)))]);
  ;
  doorptr__PHI_TEMPORARY = doorptr;   /* for PHI node */

  doorptr = doorptr__PHI_TEMPORARY;
  ;
}

  pass = llvm_add_u32(pass, -1);
  ;
  pass__PHI_TEMPORARY = pass;   /* for PHI node */

  pass = pass__PHI_TEMPORARY;
  ;
}
  doorptr = (&llvm_cbe_is_open.array[((int64_t)0)]);
  ;
  doorptr__PHI_TEMPORARY = doorptr;   /* for PHI node */

  doorptr = doorptr__PHI_TEMPORARY;
  ;
while (doorptr != doorlimit){
  _3 = *doorptr;
  _4 = ((uint64_t)(bool)(((_3 != 0u)&1)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), (llvm_add_u64((llvm_sdiv_u64((llvm_sub_u64((((uint64_t)(uintptr_t)doorptr)), (((uint64_t)(uintptr_t)((&llvm_cbe_is_open.array[((int64_t)0)])))))), 4)), 1)), (llvm_select_pu8((((_3 != 0u)&1)), ((&_OC_str_OC_1.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])))));

  doorptr = (&doorptr[((int32_t)1)]);
  ;
  doorptr__PHI_TEMPORARY = doorptr;   /* for PHI node */

  doorptr = doorptr__PHI_TEMPORARY;
  ;
}
  return 0;
}

