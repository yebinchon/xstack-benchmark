/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
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
struct l_array_48_uint8_t {
  uint8_t array[48];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t __isoc99_scanf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_48_uint8_t _OC_str = { "Enter two integers.  Space delimited, please:  " };
static struct l_array_6_uint8_t _OC_str_OC_1 = { "%d %d" };
static struct l_array_21_uint8_t _OC_str_OC_2 = { "array[%d][%d] is %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
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


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_user1;    /* Address-exposed local */
  uint32_t llvm_cbe_user2;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr1;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _1;
  uint64_t _2;
  uint32_t _3;
  uint64_t _4;
  uint32_t* llvm_cbe_vla;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t llvm_cbe_call13;
  uint8_t* _14;
  uint32_t _15;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  llvm_cbe_user1 = 0;
  ;
  llvm_cbe_user2 = 0;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = __isoc99_scanf(((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_user1), (&llvm_cbe_user2));
  _1 = llvm_cbe_user1;
  _2 = ((uint64_t)(uint32_t)_1);
  _3 = llvm_cbe_user2;
  _4 = ((uint64_t)(uint32_t)_3);
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (uint32_t*) alloca(sizeof(uint32_t) * ((llvm_mul_u64(_2, _4))));
  llvm_cbe___vla_expr0 = _2;
  llvm_cbe___vla_expr1 = _4;
  ;
  ;
  ;
  _5 = llvm_cbe_user1;
  _6 = llvm_cbe_user2;
  _7 = llvm_cbe_user1;
  _8 = llvm_cbe_user2;
  *((&((&llvm_cbe_vla[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)(llvm_sdiv_u32(_7, 2)))), _4)))]))[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_8, 2)))))])) = (llvm_add_u32(_5, _6));
  _9 = llvm_cbe_user1;
  _10 = llvm_cbe_user2;
  _11 = llvm_cbe_user1;
  _12 = llvm_cbe_user2;
  _13 = *((&((&llvm_cbe_vla[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)(llvm_sdiv_u32(_11, 2)))), _4)))]))[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_12, 2)))))]));
  llvm_cbe_call13 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), (llvm_sdiv_u32(_9, 2)), (llvm_sdiv_u32(_10, 2)), _13);
  llvm_cbe_retval = 0;
  _14 = llvm_cbe_saved_stack;
  _15 = llvm_cbe_retval;
  return _15;
}

