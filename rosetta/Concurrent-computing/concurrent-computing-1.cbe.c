/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

#ifdef _MSC_VER
#define __builtin_unreachable() __assume(0)
#endif
#ifdef _MSC_VER
#define __noreturn __declspec(noreturn)
#else
#define __noreturn __attribute__((noreturn))
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
struct l_struct_struct_OC___pthread_internal_list;
struct l_struct_struct_OC___pthread_mutex_s;
struct l_struct_union_OC_pthread_mutex_t;
struct l_struct_union_OC_anon;
struct l_struct_union_OC_anon_OC_0;
struct l_struct_struct_OC___pthread_cond_s;
struct l_struct_union_OC_pthread_cond_t;
struct l_struct_union_OC_pthread_attr_t;

/* Function definitions */
typedef uint8_t* l_fptr_1(uint8_t*);


/* Types Definitions */
struct l_struct_struct_OC___pthread_internal_list {
  struct l_struct_struct_OC___pthread_internal_list* field0;
  struct l_struct_struct_OC___pthread_internal_list* field1;
};
struct l_struct_struct_OC___pthread_mutex_s {
  uint32_t field0;
  uint32_t field1;
  uint32_t field2;
  uint32_t field3;
  uint32_t field4;
  uint16_t field5;
  uint16_t field6;
  struct l_struct_struct_OC___pthread_internal_list field7;
};
struct l_struct_union_OC_pthread_mutex_t {
  struct l_struct_struct_OC___pthread_mutex_s field0;
};
struct l_struct_union_OC_anon {
  uint64_t field0;
};
struct l_struct_union_OC_anon_OC_0 {
  uint64_t field0;
};
struct l_array_2_uint32_t {
  uint32_t array[2];
};
struct l_struct_struct_OC___pthread_cond_s {
  struct l_struct_union_OC_anon field0;
  struct l_struct_union_OC_anon_OC_0 field1;
  struct l_array_2_uint32_t field2;
  struct l_array_2_uint32_t field3;
  uint32_t field4;
  uint32_t field5;
  struct l_array_2_uint32_t field6;
};
struct l_struct_union_OC_pthread_cond_t {
  struct l_struct_struct_OC___pthread_cond_s field0;
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_3_l_fptr_1_KC_ {
  l_fptr_1* array[3];
};
struct l_array_48_uint8_t {
  uint8_t array[48];
};
struct l_struct_union_OC_pthread_attr_t {
  uint64_t field0;
  struct l_array_48_uint8_t field1;
};
struct l_array_3_uint64_t {
  uint64_t array[3];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint8_t* t_enjoy(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t pthread_mutex_lock(struct l_struct_union_OC_pthread_mutex_t*) __ATTRIBUTELIST__((nothrow));
uint32_t pthread_cond_wait(struct l_struct_union_OC_pthread_cond_t*, struct l_struct_union_OC_pthread_mutex_t*);
uint32_t pthread_mutex_unlock(struct l_struct_union_OC_pthread_mutex_t*) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
__noreturn void pthread_exit(uint8_t*);
uint8_t* t_rosetta(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* t_code(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t pthread_create(uint64_t*, struct l_struct_union_OC_pthread_attr_t*, l_fptr_1*, uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t sleep(uint32_t);
uint32_t pthread_cond_broadcast(struct l_struct_union_OC_pthread_cond_t*) __ATTRIBUTELIST__((nothrow));
uint32_t pthread_join(uint64_t, uint8_t**);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
struct l_struct_union_OC_pthread_mutex_t condm;
struct l_struct_union_OC_pthread_cond_t cond;
uint32_t bang;
static struct l_array_7_uint8_t _OC_str = { "Enjoy\n" };
static struct l_array_9_uint8_t _OC_str_OC_1 = { "Rosetta\n" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "Code\n" };
static __MSALIGN__(16) struct l_array_3_l_fptr_1_KC_ __const_OC_main_OC_p __attribute__((aligned(16))) = { { t_enjoy, t_rosetta, t_code } };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

uint8_t* t_enjoy(uint8_t* llvm_cbe_p) {
  uint8_t* llvm_cbe_p_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _1;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  llvm_cbe_p_2e_addr = llvm_cbe_p;
  ;

  llvm_cbe_call = pthread_mutex_lock((&condm));

  _1 = bang;
while (_1 == 0u){
  llvm_cbe_call1 = pthread_cond_wait((&cond), (&condm));

  _1 = bang;
}
  llvm_cbe_call2 = pthread_mutex_unlock((&condm));

  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])));
  pthread_exit(((uint8_t*)/*NULL*/0));
  __builtin_unreachable();

}


uint8_t* t_rosetta(uint8_t* llvm_cbe_p) {
  uint8_t* llvm_cbe_p_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _2;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  llvm_cbe_p_2e_addr = llvm_cbe_p;
  ;

  llvm_cbe_call = pthread_mutex_lock((&condm));

  _2 = bang;
while (_2 == 0u){
  llvm_cbe_call1 = pthread_cond_wait((&cond), (&condm));

  _2 = bang;
}
  llvm_cbe_call2 = pthread_mutex_unlock((&condm));

  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  pthread_exit(((uint8_t*)/*NULL*/0));
  __builtin_unreachable();

}


uint8_t* t_code(uint8_t* llvm_cbe_p) {
  uint8_t* llvm_cbe_p_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t _3;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  llvm_cbe_p_2e_addr = llvm_cbe_p;
  ;

  llvm_cbe_call = pthread_mutex_lock((&condm));

  _3 = bang;
while (_3 == 0u){
  llvm_cbe_call1 = pthread_cond_wait((&cond), (&condm));

  _3 = bang;
}
  llvm_cbe_call2 = pthread_mutex_unlock((&condm));

  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  pthread_exit(((uint8_t*)/*NULL*/0));
  __builtin_unreachable();

}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_uint64_t llvm_cbe_a __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_l_fptr_1_KC_ llvm_cbe_p __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  l_fptr_1* _8;
  uint32_t llvm_cbe_call;
  uint32_t _9;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t _10;
  uint32_t _11;
  uint64_t _12;
  uint32_t llvm_cbe_call10;
  uint32_t _13;
  uint32_t _14;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  _4 = memcpy((((uint8_t*)(&llvm_cbe_p))), ((uint8_t*)(&__const_OC_main_OC_p)), 24);
  llvm_cbe_i = 0;

  _5 = llvm_cbe_i;
while (((int32_t)_5) < ((int32_t)3u)){
  _6 = llvm_cbe_i;
  _7 = llvm_cbe_i;
  _8 = *((&llvm_cbe_p.array[((int64_t)(((int64_t)(int32_t)_7)))]));
  llvm_cbe_call = pthread_create(((&llvm_cbe_a.array[((int64_t)(((int64_t)(int32_t)_6)))])), ((struct l_struct_union_OC_pthread_attr_t*)/*NULL*/0), _8, ((uint8_t*)/*NULL*/0));

  _9 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_9, 1));

  _5 = llvm_cbe_i;
}
  llvm_cbe_call3 = sleep(1);
  bang = 1;
  llvm_cbe_call4 = pthread_cond_broadcast((&cond));
  llvm_cbe_i = 0;

  _10 = llvm_cbe_i;
while (((int32_t)_10) < ((int32_t)3u)){
  _11 = llvm_cbe_i;
  _12 = *((&llvm_cbe_a.array[((int64_t)(((int64_t)(int32_t)_11)))]));
  llvm_cbe_call10 = pthread_join(_12, ((uint8_t**)/*NULL*/0));

  _13 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_13, 1));

  _10 = llvm_cbe_i;
}
  _14 = llvm_cbe_retval;
  return _14;
}

