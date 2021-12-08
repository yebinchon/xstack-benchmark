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

static __forceinline int llvm_fcmp_ogt(double X, double Y) { return X >  Y; }


/* Global Declarations */

/* Types Declarations */

/* Function definitions */
typedef double l_fptr_1(uint32_t);


/* Types Definitions */
struct l_array_25_uint8_t {
  uint8_t array[25];
};

/* External Global Variable Declarations */

/* Function Declarations */
double calc(l_fptr_1*, l_fptr_1*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt2_a(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt2_b(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double napier_a(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double napier_b(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double pi_a(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double pi_b(uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static struct l_array_25_uint8_t _OC_str = { "%12.10g\n%12.10g\n%12.10g\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline double llvm_select_f64(bool condition, double iftrue, double ifnot) {
  double r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

double calc(l_fptr_1* llvm_cbe_f_a, l_fptr_1* llvm_cbe_f_b, uint32_t llvm_cbe_expansions) {
  l_fptr_1* llvm_cbe_f_a_2e_addr;    /* Address-exposed local */
  l_fptr_1* llvm_cbe_f_b_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_expansions_2e_addr;    /* Address-exposed local */
  double llvm_cbe_a;    /* Address-exposed local */
  double llvm_cbe_b;    /* Address-exposed local */
  double llvm_cbe_r;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  l_fptr_1* _3;
  uint32_t _4;
  double llvm_cbe_call;
  l_fptr_1* _5;
  uint32_t _6;
  double llvm_cbe_call1;
  double _7;
  double _8;
  double _9;
  uint32_t _10;
  l_fptr_1* _11;
  double llvm_cbe_call2;
  double _12;
  double _13;

  llvm_cbe_f_a_2e_addr = llvm_cbe_f_a;
  ;
  llvm_cbe_f_b_2e_addr = llvm_cbe_f_b;
  ;
  llvm_cbe_expansions_2e_addr = llvm_cbe_expansions;
  ;
  ;
  ;
  ;
  llvm_cbe_r = 0;
  llvm_cbe_b = 0;
  llvm_cbe_a = 0;
  ;
  _1 = llvm_cbe_expansions_2e_addr;
  llvm_cbe_i = _1;

  _2 = llvm_cbe_i;
while (((uint32_t)_2) > ((uint32_t)0u)){
  _3 = llvm_cbe_f_a_2e_addr;
  _4 = llvm_cbe_i;
  llvm_cbe_call = _3(_4);
  llvm_cbe_a = llvm_cbe_call;
  _5 = llvm_cbe_f_b_2e_addr;
  _6 = llvm_cbe_i;
  llvm_cbe_call1 = _5(_6);
  llvm_cbe_b = llvm_cbe_call1;
  _7 = llvm_cbe_b;
  _8 = llvm_cbe_a;
  _9 = llvm_cbe_r;
  llvm_cbe_r = (_7 / (_8 + _9));

  _10 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_10, -1));

  _2 = llvm_cbe_i;
}
  _11 = llvm_cbe_f_a_2e_addr;
  llvm_cbe_call2 = _11(0);
  llvm_cbe_a = llvm_cbe_call2;
  _12 = llvm_cbe_a;
  _13 = llvm_cbe_r;
  return (_12 + _13);
}


double sqrt2_a(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _14;
  uint64_t _15;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _14 = llvm_cbe_n_2e_addr;
  _15 = ((uint64_t)(bool)(((_14 != 0u)&1)));
  return (llvm_select_f64((((_14 != 0u)&1)), 2, 1));
}


double sqrt2_b(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  return 1;
}


double napier_a(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _16;
  uint32_t _17;
  double llvm_cbe_conv;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _16 = llvm_cbe_n_2e_addr;
  if ((((_16 != 0u)&1))) {
  _17 = llvm_cbe_n_2e_addr;
  llvm_cbe_conv = ((double)(uint32_t)_17);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = 2;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


double napier_b(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _18;
  uint32_t _19;
  double llvm_cbe_sub;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _18 = llvm_cbe_n_2e_addr;
  if ((((llvm_fcmp_ogt((((double)(uint32_t)_18)), 1))&1))) {
  _19 = llvm_cbe_n_2e_addr;
  llvm_cbe_sub = (((double)(uint32_t)_19)) - 1;
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_sub;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = 1;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


double pi_a(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t _20;
  uint64_t _21;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _20 = llvm_cbe_n_2e_addr;
  _21 = ((uint64_t)(bool)(((_20 != 0u)&1)));
  return (llvm_select_f64((((_20 != 0u)&1)), 6, 3));
}


double pi_b(uint32_t llvm_cbe_n) {
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  double llvm_cbe_c;    /* Address-exposed local */
  uint32_t _22;
  double _23;
  double _24;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  _22 = llvm_cbe_n_2e_addr;
  llvm_cbe_c = ((2 * (((double)(uint32_t)_22))) - 1);
  _23 = llvm_cbe_c;
  _24 = llvm_cbe_c;
  return (_23 * _24);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  double llvm_cbe_sqrt2;    /* Address-exposed local */
  double llvm_cbe_napier;    /* Address-exposed local */
  double llvm_cbe_pi;    /* Address-exposed local */
  double llvm_cbe_call;
  double llvm_cbe_call1;
  double llvm_cbe_call2;
  double _25;
  double _26;
  double _27;
  uint32_t llvm_cbe_call3;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  llvm_cbe_call = calc(sqrt2_a, sqrt2_b, 1000);
  llvm_cbe_sqrt2 = llvm_cbe_call;
  llvm_cbe_call1 = calc(napier_a, napier_b, 1000);
  llvm_cbe_napier = llvm_cbe_call1;
  llvm_cbe_call2 = calc(pi_a, pi_b, 1000);
  llvm_cbe_pi = llvm_cbe_call2;
  _25 = llvm_cbe_sqrt2;
  _26 = llvm_cbe_napier;
  _27 = llvm_cbe_pi;
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), _25, _26, _27);
  return 0;
}

