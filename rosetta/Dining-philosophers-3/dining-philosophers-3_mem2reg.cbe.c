/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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
struct l_struct_struct_OC_timespec;
struct l_struct_union_OC_mtx_t;
struct l_struct_struct_OC_Philosopher;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_timespec {
  uint64_t field0;
  uint64_t field1;
};
struct l_array_32_uint8_t {
  uint8_t array[32];
};
struct l_struct_union_OC_mtx_t {
  uint64_t field0;
  struct l_array_32_uint8_t field1;
};
struct l_struct_struct_OC_Philosopher {
  uint8_t* field0;
  uint32_t field1;
  uint32_t field2;
};
struct l_array_5_struct_AC_l_struct_union_OC_mtx_t {
  struct l_struct_union_OC_mtx_t array[5];
};
struct l_array_14_uint8_t {
  uint8_t array[14];
};
struct l_array_19_uint8_t {
  uint8_t array[19];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_27_uint8_t {
  uint8_t array[27];
};
struct l_array_5_uint64_t {
  uint64_t array[5];
};
struct l_array_5_struct_AC_l_struct_struct_OC_Philosopher_KC_ {
  struct l_struct_struct_OC_Philosopher* array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
struct l_struct_struct_OC_Philosopher* create(uint8_t*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t eat(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t mtx_lock(struct l_struct_union_OC_mtx_t*);
uint32_t printf(uint8_t*, ...);
uint32_t thrd_sleep(struct l_struct_struct_OC_timespec*, struct l_struct_struct_OC_timespec*);
uint32_t mtx_unlock(struct l_struct_union_OC_mtx_t*);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t mtx_init(struct l_struct_union_OC_mtx_t*, uint32_t);
uint32_t puts(uint8_t*);
uint32_t thrd_create(uint64_t*, l_fptr_1*, uint8_t*);
uint32_t thrd_join(uint64_t, uint32_t*);


/* Global Variable Definitions and Initialization */
struct l_struct_struct_OC_timespec time1 __ATTRIBUTE_WEAK__;
__MSALIGN__(16) struct l_array_5_struct_AC_l_struct_union_OC_mtx_t forks __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static struct l_array_14_uint8_t _OC_str = { "%s is eating\n" };
static struct l_array_19_uint8_t _OC_str_OC_1 = { "%s is done eating\n" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "Teral" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "Billy" };
static struct l_array_7_uint8_t _OC_str_OC_4 = { "Daniel" };
static struct l_array_7_uint8_t _OC_str_OC_5 = { "Philip" };
static struct l_array_7_uint8_t _OC_str_OC_6 = { "Bennet" };
static struct l_array_22_uint8_t _OC_str_OC_7 = { "FAILED IN MUTEX INIT!" };
static struct l_array_27_uint8_t _OC_str_OC_8 = { "%d-th thread create error\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

struct l_struct_struct_OC_Philosopher* create(uint8_t* llvm_cbe_nam, uint32_t llvm_cbe_lef, uint32_t llvm_cbe_righ) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_Philosopher* x;

  ;
  ;
  ;
  llvm_cbe_call = malloc(16);
  x = ((struct l_struct_struct_OC_Philosopher*)llvm_cbe_call);
  ;
  *((&x->field0)) = llvm_cbe_nam;
  *((&x->field1)) = llvm_cbe_lef;
  *((&x->field2)) = llvm_cbe_righ;
  return x;
}


uint32_t eat(uint8_t* llvm_cbe_data) {
  struct l_struct_struct_OC_Philosopher* foo;
  uint32_t _1;
  uint32_t llvm_cbe_call;
  uint32_t _2;
  uint32_t llvm_cbe_call3;
  uint8_t* _3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  uint8_t* _4;
  uint32_t llvm_cbe_call7;
  uint32_t _5;
  uint32_t llvm_cbe_call11;
  uint32_t _6;
  uint32_t llvm_cbe_call15;

  ;
  *((&time1.field0)) = 1;
  foo = ((struct l_struct_struct_OC_Philosopher*)llvm_cbe_data);
  ;
  _1 = *((&foo->field1));
  llvm_cbe_call = mtx_lock(((&forks.array[((int64_t)(((int64_t)(int32_t)_1)))])));
  _2 = *((&foo->field2));
  llvm_cbe_call3 = mtx_lock(((&forks.array[((int64_t)(((int64_t)(int32_t)_2)))])));
  _3 = *((&foo->field0));
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), _3);
  llvm_cbe_call5 = thrd_sleep((&time1), ((struct l_struct_struct_OC_timespec*)/*NULL*/0));
  _4 = *((&foo->field0));
  llvm_cbe_call7 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _4);
  _5 = *((&foo->field1));
  llvm_cbe_call11 = mtx_unlock(((&forks.array[((int64_t)(((int64_t)(int32_t)_5)))])));
  _6 = *((&foo->field2));
  llvm_cbe_call15 = mtx_unlock(((&forks.array[((int64_t)(((int64_t)(int32_t)_6)))])));
  return 0;
}


int main(void) {
  __MSALIGN__(16) struct l_array_5_uint64_t llvm_cbe_threadId __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_5_struct_AC_l_struct_struct_OC_Philosopher_KC_ llvm_cbe_all __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_struct_struct_OC_Philosopher** llvm_cbe_arrayinit_2e_begin;
  struct l_struct_struct_OC_Philosopher* llvm_cbe_call;
  struct l_struct_struct_OC_Philosopher** llvm_cbe_arrayinit_2e_element;
  struct l_struct_struct_OC_Philosopher* llvm_cbe_call1;
  struct l_struct_struct_OC_Philosopher** llvm_cbe_arrayinit_2e_element2;
  struct l_struct_struct_OC_Philosopher* llvm_cbe_call3;
  struct l_struct_struct_OC_Philosopher** llvm_cbe_arrayinit_2e_element4;
  struct l_struct_struct_OC_Philosopher* llvm_cbe_call5;
  struct l_struct_struct_OC_Philosopher* llvm_cbe_call7;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call10;
  struct l_struct_struct_OC_Philosopher* _7;
  uint32_t llvm_cbe_call17;
  uint32_t llvm_cbe_call20;
  uint64_t _8;
  uint32_t llvm_cbe_call31;

  ;
  ;
  llvm_cbe_arrayinit_2e_begin = (&llvm_cbe_all.array[((int64_t)0)]);
  llvm_cbe_call = create(((&_OC_str_OC_2.array[((int64_t)0)])), 0, 1);
  *llvm_cbe_arrayinit_2e_begin = llvm_cbe_call;
  llvm_cbe_arrayinit_2e_element = (&llvm_cbe_arrayinit_2e_begin[((int64_t)1)]);
  llvm_cbe_call1 = create(((&_OC_str_OC_3.array[((int64_t)0)])), 1, 2);
  *llvm_cbe_arrayinit_2e_element = llvm_cbe_call1;
  llvm_cbe_arrayinit_2e_element2 = (&llvm_cbe_arrayinit_2e_element[((int64_t)1)]);
  llvm_cbe_call3 = create(((&_OC_str_OC_4.array[((int64_t)0)])), 2, 3);
  *llvm_cbe_arrayinit_2e_element2 = llvm_cbe_call3;
  llvm_cbe_arrayinit_2e_element4 = (&llvm_cbe_arrayinit_2e_element2[((int64_t)1)]);
  llvm_cbe_call5 = create(((&_OC_str_OC_5.array[((int64_t)0)])), 3, 4);
  *llvm_cbe_arrayinit_2e_element4 = llvm_cbe_call5;
  llvm_cbe_call7 = create(((&_OC_str_OC_6.array[((int64_t)0)])), 0, 4);
  *((&llvm_cbe_arrayinit_2e_element4[((int64_t)1)])) = llvm_cbe_call7;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)5u)){
  llvm_cbe_call8 = mtx_init(((&forks.array[((int64_t)(((int64_t)(int32_t)i)))])), 0);
  if ((((llvm_cbe_call8 != 0u)&1))) {
  llvm_cbe_call10 = puts(((&_OC_str_OC_7.array[((int64_t)0)])));
  return 0;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)5u)){
  _7 = *((&llvm_cbe_all.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call17 = thrd_create(((&((&llvm_cbe_threadId.array[((int64_t)0)]))[((int64_t)(((int64_t)(int32_t)i)))])), eat, (((uint8_t*)_7)));
  if ((((llvm_cbe_call17 != 0u)&1))) {
  llvm_cbe_call20 = printf(((&_OC_str_OC_8.array[((int64_t)0)])), i);
  return 0;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)5u)){
  _8 = *((&llvm_cbe_threadId.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call31 = thrd_join(_8, ((uint32_t*)/*NULL*/0));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}

  return 0;
}

