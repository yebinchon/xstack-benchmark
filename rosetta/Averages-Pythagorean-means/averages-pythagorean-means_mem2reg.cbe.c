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
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
double atof(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint32_t printf(uint8_t*, ...);
double pow(double, double) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_22_uint8_t _OC_str = { "Arithmetic mean = %f\n" };
static struct l_array_21_uint8_t _OC_str_OC_1 = { "Geometric mean = %f\n" };
static struct l_array_20_uint8_t _OC_str_OC_2 = { "Harmonic mean = %f\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t count;
  uint32_t count__PHI_TEMPORARY;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double sum;
  double sum__PHI_TEMPORARY;
  double prod;
  double prod__PHI_TEMPORARY;
  double resum;
  double resum__PHI_TEMPORARY;
  uint8_t* _1;
  double f;
  uint32_t llvm_cbe_call4;
  double llvm_cbe_call7;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call11;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  count__PHI_TEMPORARY = 0;   /* for PHI node */
  i__PHI_TEMPORARY = 1;   /* for PHI node */
  sum__PHI_TEMPORARY = 0;   /* for PHI node */
  prod__PHI_TEMPORARY = 1;   /* for PHI node */
  resum__PHI_TEMPORARY = 0;   /* for PHI node */

  count = count__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  prod = prod__PHI_TEMPORARY;
  resum = resum__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_argc)){
  _1 = *((&llvm_cbe_argv[((int64_t)(((int64_t)(int32_t)i)))]));
  f = atof(_1);
  ;
  count = llvm_add_u32(count, 1);
  ;
  sum = sum + f;
  ;
  prod = prod * f;
  ;
  resum = resum + (1 / f);
  ;

  i = llvm_add_u32(i, 1);
  ;
  count__PHI_TEMPORARY = count;   /* for PHI node */
  i__PHI_TEMPORARY = i;   /* for PHI node */
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  prod__PHI_TEMPORARY = prod;   /* for PHI node */
  resum__PHI_TEMPORARY = resum;   /* for PHI node */

  count = count__PHI_TEMPORARY;
  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  prod = prod__PHI_TEMPORARY;
  resum = resum__PHI_TEMPORARY;
  ;
  ;
  ;
  ;
  ;
}
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), (sum / (((double)(int32_t)count))));
  llvm_cbe_call7 = pow(prod, (1 / (((double)(int32_t)count))));
  llvm_cbe_call8 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call7);
  llvm_cbe_call11 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((((double)(int32_t)count)) / resum));
  return 0;
}

