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
typedef double l_fptr_1(double, double);


/* Types Definitions */
struct l_array_28_uint8_t {
  uint8_t array[28];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
double rk4(l_fptr_1*, double, double, double) __ATTRIBUTELIST__((noinline, nothrow));
double rate(double, double) __ATTRIBUTELIST__((noinline, nothrow));
double sqrt(double) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
double pow(double, double) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_28_uint8_t _OC_str = { "x\ty\trel. err.\n------------\n" };
static struct l_array_10_uint8_t _OC_str_OC_1 = { "%g\t%g\t%g\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}


/* Function Bodies */

double rk4(l_fptr_1* llvm_cbe_f, double llvm_cbe_dx, double llvm_cbe_x, double llvm_cbe_y) {
  double llvm_cbe_call;
  double k1;
  double llvm_cbe_call3;
  double k2;
  double llvm_cbe_call9;
  double k3;
  double llvm_cbe_call13;

  ;
  ;
  ;
  ;
  llvm_cbe_call = llvm_cbe_f(llvm_cbe_x, llvm_cbe_y);
  k1 = llvm_cbe_dx * llvm_cbe_call;
  ;
  llvm_cbe_call3 = llvm_cbe_f((llvm_cbe_x + (llvm_cbe_dx / 2)), (llvm_cbe_y + (k1 / 2)));
  k2 = llvm_cbe_dx * llvm_cbe_call3;
  ;
  llvm_cbe_call9 = llvm_cbe_f((llvm_cbe_x + (llvm_cbe_dx / 2)), (llvm_cbe_y + (k2 / 2)));
  k3 = llvm_cbe_dx * llvm_cbe_call9;
  ;
  llvm_cbe_call13 = llvm_cbe_f((llvm_cbe_x + llvm_cbe_dx), (llvm_cbe_y + k3));
  ;
  return (llvm_cbe_y + ((((k1 + (2 * k2)) + (2 * k3)) + (llvm_cbe_dx * llvm_cbe_call13)) / 6));
}


double rate(double llvm_cbe_x, double llvm_cbe_y) {
  double llvm_cbe_call;

  ;
  ;
  llvm_cbe_call = sqrt(llvm_cbe_y);
  return (llvm_cbe_x * llvm_cbe_call);
}


int main(void) {
  uint32_t n;
  uint8_t* llvm_cbe_call;
  double* y;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _1;
  double llvm_cbe_call9;
  uint32_t llvm_cbe_call12;
  double x;
  double y2;
  double _2;
  double _3;
  uint32_t llvm_cbe_call30;

  ;
  ;
  ;
  n = ((int32_t)(1 + ((10 - 0) / 0.10000000000000001)));
  ;
  llvm_cbe_call = malloc((llvm_mul_u64(8, (((int64_t)(int32_t)n)))));
  y = ((double*)llvm_cbe_call);
  ;
  *((&(*y))) = 1;
  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)n)){
  _1 = *((&y[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  llvm_cbe_call9 = rk4(rate, 0.10000000000000001, (0 + (0.10000000000000001 * (((double)(int32_t)(llvm_sub_u32(i, 1)))))), _1);
  *((&y[((int64_t)(((int64_t)(int32_t)i)))])) = llvm_cbe_call9;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call12 = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)n)){
  x = 0 + (0.10000000000000001 * (((double)(int32_t)i)));
  ;
  y2 = pow((((x * x) / 4) + 1), 2);
  ;
  _2 = *((&y[((int64_t)(((int64_t)(int32_t)i)))]));
  _3 = *((&y[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call30 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), x, _2, ((_3 / y2) - 1));

  i = llvm_add_u32(i, 10);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

