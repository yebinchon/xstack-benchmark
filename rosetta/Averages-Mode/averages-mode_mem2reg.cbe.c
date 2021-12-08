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
static __forceinline int llvm_fcmp_une(double X, double Y) { return X != Y; }


/* Global Declarations */

/* Types Declarations */
struct l_struct_struct_OC_vcount;

/* Function definitions */

/* Types Definitions */
struct l_struct_struct_OC_vcount {
  double field0;
  uint32_t field1;
};
struct l_array_13_double {
  double array[13];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_25_uint8_t {
  uint8_t array[25];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t cmp_dbl(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t vc_cmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t get_mode(double*, uint32_t, struct l_struct_struct_OC_vcount**) __ATTRIBUTELIST__((noinline, nothrow));
void qsort(uint8_t*, uint64_t, uint64_t, l_fptr_1*);
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_13_double __const_OC_main_OC_values __attribute__((aligned(16))) = { { 1, 3, 6, 6, 6, 6, 7, 7, 12, 12, 12, 12, 17 } };
static struct l_array_15_uint8_t _OC_str = { "got %d modes:\n" };
static struct l_array_25_uint8_t _OC_str_OC_1 = { "\tvalue = %g, count = %d\n" };


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

uint32_t cmp_dbl(uint8_t* llvm_cbe_a, uint8_t* llvm_cbe_b) {
  double _1;
  double _2;
  double x;
  uint32_t llvm_cbe_conv;
  uint32_t llvm_cbe_cond;
  uint32_t llvm_cbe_cond__PHI_TEMPORARY;

  ;
  ;
  _1 = *(((double*)llvm_cbe_a));
  _2 = *(((double*)llvm_cbe_b));
  x = _1 - _2;
  ;
  if ((((llvm_fcmp_olt(x, 0))&1))) {
  llvm_cbe_cond__PHI_TEMPORARY = -1;   /* for PHI node */

  } else {
  llvm_cbe_conv = ((uint32_t)(bool)(((llvm_fcmp_ogt(x, 0))&1)));
  llvm_cbe_cond__PHI_TEMPORARY = llvm_cbe_conv;   /* for PHI node */

}
  llvm_cbe_cond = llvm_cbe_cond__PHI_TEMPORARY;
  return llvm_cbe_cond;
}


uint32_t vc_cmp(uint8_t* llvm_cbe_a, uint8_t* llvm_cbe_b) {
  uint32_t _3;
  uint32_t _4;

  ;
  ;
  _3 = *((&(((struct l_struct_struct_OC_vcount*)llvm_cbe_b))->field1));
  _4 = *((&(((struct l_struct_struct_OC_vcount*)llvm_cbe_a))->field1));
  return (llvm_sub_u32(_3, _4));
}


uint32_t get_mode(double* llvm_cbe_x, uint32_t llvm_cbe_len, struct l_struct_struct_OC_vcount** llvm_cbe_list) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  double _5;
  double _6;
  uint8_t* llvm_cbe_call;
  struct l_struct_struct_OC_vcount* vc;
  double _7;
  double _8;
  double _9;
  double _10;
  uint32_t* llvm_cbe_c34;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  bool _14;
  bool _14__PHI_TEMPORARY;

  ;
  ;
  ;
  qsort((((uint8_t*)llvm_cbe_x)), (((int64_t)(int32_t)llvm_cbe_len)), 8, cmp_dbl);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 1;   /* for PHI node */

  uint32_t llvm_cbe_sub;
  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_len, 1);
while (((int32_t)i) < ((int32_t)llvm_cbe_sub)){

  i = llvm_add_u32(i, 1);
  ;
  _5 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)i)))]));
  _6 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(i, 1)))))]));
  j = llvm_add_u32(j, (((uint32_t)(bool)(((llvm_fcmp_une(_5, _6))&1)))));
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_len, 1);
}
  llvm_cbe_call = malloc((llvm_mul_u64(16, (((int64_t)(int32_t)j)))));
  vc = ((struct l_struct_struct_OC_vcount*)llvm_cbe_call);
  ;
  *llvm_cbe_list = vc;
  _7 = *((&(*llvm_cbe_x)));
  *((&((&(*vc)))->field0)) = _7;
  *((&((&(*vc)))->field1)) = 1;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub12;
  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_sub12 = llvm_sub_u32(llvm_cbe_len, 1);
while (((int32_t)i) < ((int32_t)llvm_cbe_sub12)){
  _8 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)i)))]));
  _9 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(i, 1)))))]));
  if ((((llvm_fcmp_une(_8, _9))&1))) {
  _10 = *((&llvm_cbe_x[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(i, 1)))))]));
  j = llvm_add_u32(j, 1);
  ;
  *((&((&vc[((int64_t)(((int64_t)(int32_t)j)))]))->field0)) = _10;
  j__PHI_TEMPORARY = j;   /* for PHI node */

}
  j = j__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  llvm_cbe_c34 = (&((&vc[((int64_t)(((int64_t)(int32_t)j)))]))->field1);
  _11 = *llvm_cbe_c34;
  *llvm_cbe_c34 = (llvm_add_u32(_11, 1));
  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_sub12 = llvm_sub_u32(llvm_cbe_len, 1);
}
  qsort((((uint8_t*)vc)), (((int64_t)(int32_t)(llvm_add_u32(j, 1)))), 16, vc_cmp);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

){
  _12 = *((&((&vc[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
  _13 = *((&((&(*vc)))->field1));
  _14__PHI_TEMPORARY = (((_12 == _13)&1));   /* for PHI node */

  _14 = ((_14__PHI_TEMPORARY)&1);
  if (!_14) {

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)i) <= ((int32_t)j))&1))) {
    _14__PHI_TEMPORARY = 0;   /* for PHI node */
  }

}
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_cmp40 = ((((int32_t)i) <= ((int32_t)j))&1);
    if (!(((((int32_t)i) <= ((int32_t)j))&1))) {
    _14__PHI_TEMPORARY = 0;   /* for PHI node */
  }

;
}
  return i;
}


int main(void) {
  __MSALIGN__(16) struct l_array_13_double llvm_cbe_values __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_struct_struct_OC_vcount* llvm_cbe_vc;    /* Address-exposed local */
  uint8_t* _15;
  uint32_t n_modes;
  uint32_t llvm_cbe_call1;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  struct l_struct_struct_OC_vcount* _16;
  double _17;
  struct l_struct_struct_OC_vcount* _18;
  uint32_t _19;
  uint32_t llvm_cbe_call4;
  struct l_struct_struct_OC_vcount* _20;

  ;
  _15 = memcpy((((uint8_t*)(&llvm_cbe_values))), ((uint8_t*)(&__const_OC_main_OC_values)), 104);
  ;
  n_modes = get_mode(((&llvm_cbe_values.array[((int64_t)0)])), 13, (&llvm_cbe_vc));
  ;
  llvm_cbe_call1 = printf(((&_OC_str.array[((int64_t)0)])), n_modes);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)n_modes)){
  _16 = llvm_cbe_vc;
  _17 = *((&((&_16[((int64_t)(((int64_t)(int32_t)i)))]))->field0));
  _18 = llvm_cbe_vc;
  _19 = *((&((&_18[((int64_t)(((int64_t)(int32_t)i)))]))->field1));
  llvm_cbe_call4 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _17, _19);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  _20 = llvm_cbe_vc;
  free((((uint8_t*)_20)));
  return 0;
}

