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
  double r;
  double r__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double a;
  double b;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  r__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = llvm_cbe_expansions;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
while (((uint32_t)i) > ((uint32_t)0u)){
  a = llvm_cbe_f_a(i);
  ;
  b = llvm_cbe_f_b(i);
  ;
  r = b / (a + r);
  ;

  i = llvm_add_u32(i, -1);
  ;
  r__PHI_TEMPORARY = r;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  ;
  ;
}
  a = llvm_cbe_f_a(0);
  ;
  return (a + r);
}


double sqrt2_a(uint32_t llvm_cbe_n) {
  uint64_t _1;

  ;
  _1 = ((uint64_t)(bool)(((llvm_cbe_n != 0u)&1)));
  return (llvm_select_f64((((llvm_cbe_n != 0u)&1)), 2, 1));
}


double sqrt2_b(uint32_t llvm_cbe_n) {
  ;
  return 1;
}


double napier_a(uint32_t llvm_cbe_n) {
  double llvm_cbe_conv;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;

  ;
  if ((((llvm_cbe_n != 0u)&1))) {
  llvm_cbe_conv = ((double)(uint32_t)llvm_cbe_n);
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = 2;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


double napier_b(uint32_t llvm_cbe_n) {
  double llvm_cbe_sub;
  double llvm_cbe_cond;
  double llvm_cbe_cond__PHI_TEMPORARY;

  ;
  if ((((llvm_fcmp_ogt((((double)(uint32_t)llvm_cbe_n)), 1))&1))) {
  llvm_cbe_sub = (((double)(uint32_t)llvm_cbe_n)) - 1;
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_sub;   /* for PHI node */

  } else {
  llvm_cbe_cond__PHI_TEMPORARY = 1;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


double pi_a(uint32_t llvm_cbe_n) {
  uint64_t _2;

  ;
  _2 = ((uint64_t)(bool)(((llvm_cbe_n != 0u)&1)));
  return (llvm_select_f64((((llvm_cbe_n != 0u)&1)), 6, 3));
}


double pi_b(uint32_t llvm_cbe_n) {
  double c;

  ;
  c = (2 * (((double)(uint32_t)llvm_cbe_n))) - 1;
  ;
  return (c * c);
}


int main(void) {
  double sqrt2;
  double napier;
  double pi;
  uint32_t llvm_cbe_call3;

  sqrt2 = calc(sqrt2_a, sqrt2_b, 1000);
  ;
  napier = calc(napier_a, napier_b, 1000);
  ;
  pi = calc(pi_a, pi_b, 1000);
  ;
  llvm_cbe_call3 = printf(((&_OC_str.array[((int64_t)0)])), sqrt2, napier, pi);
  return 0;
}

