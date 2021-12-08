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
struct l_struct_struct_OC_timeval;
struct l_struct_struct_OC_integ_t;
struct l_struct_union_OC_pthread_attr_t;

/* Function definitions */
typedef double l_fptr_1(double);


/* Types Definitions */
struct l_struct_struct_OC_timeval {
  uint64_t field0;
  uint64_t field1;
};
struct l_struct_struct_OC_integ_t {
  l_fptr_1* field0;
  struct l_struct_struct_OC_timeval field1;
  double field2;
  double field3;
  double field4;
  uint64_t field5;
};
struct l_array_48_uint8_t {
  uint8_t array[48];
};
struct l_struct_union_OC_pthread_attr_t {
  uint64_t field0;
  struct l_array_48_uint8_t field1;
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
void update(struct l_struct_struct_OC_integ_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t gettimeofday(struct l_struct_struct_OC_timeval*, uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* tick(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t usleep(uint32_t);
void set_input(struct l_struct_struct_OC_integ_t*, l_fptr_1*) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC_integ_t* new_integ(l_fptr_1*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t pthread_create(uint64_t*, struct l_struct_union_OC_pthread_attr_t*, l_fptr_2*, uint8_t*) __ATTRIBUTELIST__((nothrow));
double sine(double) __ATTRIBUTELIST__((noinline, nothrow));
double sin(double) __ATTRIBUTELIST__((nothrow));
double atan2(double, double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t sleep(uint32_t);
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_4_uint8_t _OC_str = { "%g\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

void update(struct l_struct_struct_OC_integ_t* llvm_cbe_x) {
  struct l_struct_struct_OC_timeval llvm_cbe_tv;    /* Address-exposed local */
  l_fptr_1* f;
  uint32_t llvm_cbe_call;
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint64_t _4;
  double t;
  double llvm_cbe_call6;
  double v;
  double v__PHI_TEMPORARY;
  double _5;
  double _6;
  double* llvm_cbe_v10;
  double _7;

  ;
  ;
  f = *((&llvm_cbe_x->field0));
  ;
  llvm_cbe_call = gettimeofday((&llvm_cbe_tv), ((uint8_t*)/*NULL*/0));
  _1 = *((&llvm_cbe_tv.field0));
  _2 = *((&((&llvm_cbe_x->field1))->field0));
  _3 = *((&llvm_cbe_tv.field1));
  _4 = *((&((&llvm_cbe_x->field1))->field1));
  t = (((double)(int64_t)(llvm_sub_u64((llvm_add_u64((llvm_mul_u64((llvm_sub_u64(_1, _2)), 1000000)), _3)), _4)))) * 9.9999999999999995E-7;
  ;
  if ((((f != ((l_fptr_1*)/*NULL*/0))&1))) {
  llvm_cbe_call6 = f(t);
  v__PHI_TEMPORARY = llvm_cbe_call6;   /* for PHI node */

  } else {
  v__PHI_TEMPORARY = 0;   /* for PHI node */

}
  v = v__PHI_TEMPORARY;
  ;
  _5 = *((&llvm_cbe_x->field3));
  _6 = *((&llvm_cbe_x->field4));
  llvm_cbe_v10 = (&llvm_cbe_x->field2);
  _7 = *llvm_cbe_v10;
  *llvm_cbe_v10 = (_7 + (((_5 + v) * (t - _6)) / 2));
  *((&llvm_cbe_x->field4)) = t;
}


uint8_t* tick(uint8_t* llvm_cbe_a) {
  struct l_struct_struct_OC_integ_t* x;
  uint32_t llvm_cbe_call;

  ;
  x = ((struct l_struct_struct_OC_integ_t*)llvm_cbe_a);
  ;

){
  llvm_cbe_call = usleep(100000);
  update(x);
  
;
}
}


void set_input(struct l_struct_struct_OC_integ_t* llvm_cbe_x, l_fptr_1* llvm_cbe_func) {
  double llvm_cbe_call;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;

  ;
  ;
  update(llvm_cbe_x);
  *((&llvm_cbe_x->field0)) = llvm_cbe_func;
  *((&llvm_cbe_x->field4)) = 0;
  if ((((llvm_cbe_func != ((l_fptr_1*)/*NULL*/0))&1))) {
  llvm_cbe_call = llvm_cbe_func(0);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_call;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = 0;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  *((&llvm_cbe_x->field3)) = llvm_cbe_cond;
}


struct l_struct_struct_OC_integ_t* new_integ(l_fptr_1* llvm_cbe_func) {
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_integ_t* x;
  uint32_t llvm_cbe_call2;
  uint32_t llvm_cbe_call3;

  ;
  llvm_cbe_call = malloc(56);
  x = ((struct l_struct_struct_OC_integ_t*)llvm_cbe_call);
  ;
  *((&x->field3)) = 0;
  *((&x->field2)) = 0;
  *((&x->field0)) = ((l_fptr_1*)/*NULL*/0);
  llvm_cbe_call2 = gettimeofday(((&x->field1)), ((uint8_t*)/*NULL*/0));
  set_input(x, llvm_cbe_func);
  llvm_cbe_call3 = pthread_create(((&x->field5)), ((struct l_struct_union_OC_pthread_attr_t*)/*NULL*/0), tick, (((uint8_t*)x)));
  return x;
}


double sine(double llvm_cbe_t) {
  double llvm_cbe_call;
  double llvm_cbe_call2;

  ;
  llvm_cbe_call = atan2(1, 1);
  llvm_cbe_call2 = sin(((4 * llvm_cbe_call) * llvm_cbe_t));
  return llvm_cbe_call2;
}


int main(void) {
  struct l_struct_struct_OC_integ_t* x;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;
  double _8;
  uint32_t llvm_cbe_call3;

  x = new_integ(sine);
  ;
  llvm_cbe_call1 = sleep(2);
  set_input(x, ((l_fptr_1*)/*NULL*/0));
  llvm_cbe_call2 = usleep(500000);
  _8 = *((&x->field2));
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), _8);
  return 0;
}

