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

static __forceinline int llvm_fcmp_olt(double X, double Y) { return X <  Y; }
static __forceinline int llvm_fcmp_ogt(double X, double Y) { return X >  Y; }


/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC_floatList;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_floatList {
  float* field0;
  uint32_t field1;
};
struct l_array_6_float {
  float array[6];
};
struct l_array_5_float {
  float array[5];
};
struct l_array_24_uint8_t {
  uint8_t array[24];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t floatcmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
float median(struct l_struct_struct_OC_floatList*) __ATTRIBUTELIST__((noinline, nothrow));
void qsort(uint8_t*, uint64_t, uint64_t, l_fptr_1*);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_6_float main_OC_floats1 __attribute__((aligned(16))) = { { 5.0999999, 2.5999999, 6.1999998, 8.80000019, 4.5999999, 4.0999999 } };
static struct l_struct_struct_OC_floatList main_OC_flist1 = { ((&main_OC_floats1.array[((int32_t)0)])), 6 };
static __MSALIGN__(16) struct l_array_5_float main_OC_floats2 __attribute__((aligned(16))) = { { 5.0999999, 2.5999999, 8.80000019, 4.5999999, 4.0999999 } };
static struct l_struct_struct_OC_floatList main_OC_flist2 = { ((&main_OC_floats2.array[((int32_t)0)])), 5 };
static struct l_array_24_uint8_t _OC_str = { "flist1 median is %7.2f\n" };
static struct l_array_24_uint8_t _OC_str_OC_1 = { "flist2 median is %7.2f\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline float llvm_fadd_f32(float a, float b) {
  float r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}


/* Function Bodies */

uint32_t floatcmp(uint8_t* llvm_cbe_a, uint8_t* llvm_cbe_b) {
  float _1;
  float _2;
  float _3;
  float _4;
  uint32_t llvm_cbe_conv;
  uint32_t llvm_cbe_retval_2e_0;
  uint32_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  ;
  _1 = *(((float*)llvm_cbe_a));
  _2 = *(((float*)llvm_cbe_b));
  if ((((llvm_fcmp_olt(_1, _2))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = -1;   /* for PHI node */

  } else {
  _3 = *(((float*)llvm_cbe_a));
  _4 = *(((float*)llvm_cbe_b));
  llvm_cbe_conv = ((uint32_t)(bool)(((llvm_fcmp_ogt(_3, _4))&1)));
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */

}
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


float median(struct l_struct_struct_OC_floatList* llvm_cbe_fl) {
  float* _5;
  uint32_t _6;
  float* _7;
  uint32_t _8;
  float _9;
  float* _10;
  uint32_t _11;
  float _12;

  ;
  _5 = *((&llvm_cbe_fl->field0));
  _6 = *((&llvm_cbe_fl->field1));
  qsort((((uint8_t*)_5)), (((int64_t)(int32_t)_6)), 4, floatcmp);
  _7 = *((&llvm_cbe_fl->field0));
  _8 = *((&llvm_cbe_fl->field1));
  _9 = *((&_7[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_8, 2)))))]));
  _10 = *((&llvm_cbe_fl->field0));
  _11 = *((&llvm_cbe_fl->field1));
  _12 = *((&_10[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_sub_u32(_11, 1)), 2)))))]));
  return (((float)(0.5 * (((double)(llvm_fadd_f32(_9, _12)))))));
}


int main(void) {
  float llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  float llvm_cbe_call2;
  uint32_t llvm_cbe_call4;

  llvm_cbe_call = median((&main_OC_flist1));
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), (((double)llvm_cbe_call)));
  llvm_cbe_call2 = median((&main_OC_flist2));
  llvm_cbe_call4 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), (((double)llvm_cbe_call2)));
  return 0;
}

