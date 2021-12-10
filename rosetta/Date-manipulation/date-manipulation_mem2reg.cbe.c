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
struct l_struct_struct_OC_tm;

/* Function definitions */
typedef uint32_t l_fptr_1(uint8_t*, uint8_t*, struct l_struct_struct_OC_tm*, ...);


/* Types Definitions */
struct l_struct_struct_OC_tm {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint32_t field4;
  uint32_t field5;
  uint32_t field6;
  uint32_t field7;
  uint32_t field8;
  uint64_t field9;
  uint8_t* field10;
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t strptime(int, ...);
uint64_t mktime(struct l_struct_struct_OC_tm*) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* ctime(uint64_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_24_uint8_t _OC_str = { "March 7 2009 7:30pm EST" };
static struct l_array_20_uint8_t _OC_str_OC_1 = { "%B %d %Y %I:%M%p %Z" };
static struct l_array_3_uint8_t _OC_str_OC_2 = { "%s" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}


/* Function Bodies */

int main(void) {
  struct l_struct_struct_OC_tm llvm_cbe_ts;    /* Address-exposed local */
  uint64_t llvm_cbe_t;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint64_t llvm_cbe_call1;
  uint64_t _1;
  uint8_t* llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  ;
  ;
  ;
  llvm_cbe_call = ((l_fptr_1*)(void*)strptime)(((&_OC_str.array[((int64_t)0)])), ((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_ts));
  llvm_cbe_call1 = mktime((&llvm_cbe_ts));
  llvm_cbe_t = llvm_cbe_call1;
  _1 = llvm_cbe_t;
  llvm_cbe_t = (llvm_add_u64(_1, 43200));
  llvm_cbe_call2 = ctime((&llvm_cbe_t));
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call2);
  return 0;
}

