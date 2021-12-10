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
  l_fptr_1* llvm_cbe_f_2e_addr;    /* Address-exposed local */
  double llvm_cbe_dx_2e_addr;    /* Address-exposed local */
  double llvm_cbe_x_2e_addr;    /* Address-exposed local */
  double llvm_cbe_y_2e_addr;    /* Address-exposed local */
  double llvm_cbe_k1;    /* Address-exposed local */
  double llvm_cbe_k2;    /* Address-exposed local */
  double llvm_cbe_k3;    /* Address-exposed local */
  double llvm_cbe_k4;    /* Address-exposed local */
  double _1;
  l_fptr_1* _2;
  double _3;
  double _4;
  double llvm_cbe_call;
  double _5;
  l_fptr_1* _6;
  double _7;
  double _8;
  double _9;
  double _10;
  double llvm_cbe_call3;
  double _11;
  l_fptr_1* _12;
  double _13;
  double _14;
  double _15;
  double _16;
  double llvm_cbe_call9;
  double _17;
  l_fptr_1* _18;
  double _19;
  double _20;
  double _21;
  double _22;
  double llvm_cbe_call13;
  double _23;
  double _24;
  double _25;
  double _26;
  double _27;

  llvm_cbe_f_2e_addr = llvm_cbe_f;
  ;
  llvm_cbe_dx_2e_addr = llvm_cbe_dx;
  ;
  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  ;
  _1 = llvm_cbe_dx_2e_addr;
  _2 = llvm_cbe_f_2e_addr;
  _3 = llvm_cbe_x_2e_addr;
  _4 = llvm_cbe_y_2e_addr;
  llvm_cbe_call = _2(_3, _4);
  llvm_cbe_k1 = (_1 * llvm_cbe_call);
  ;
  _5 = llvm_cbe_dx_2e_addr;
  _6 = llvm_cbe_f_2e_addr;
  _7 = llvm_cbe_x_2e_addr;
  _8 = llvm_cbe_dx_2e_addr;
  _9 = llvm_cbe_y_2e_addr;
  _10 = llvm_cbe_k1;
  llvm_cbe_call3 = _6((_7 + (_8 / 2)), (_9 + (_10 / 2)));
  llvm_cbe_k2 = (_5 * llvm_cbe_call3);
  ;
  _11 = llvm_cbe_dx_2e_addr;
  _12 = llvm_cbe_f_2e_addr;
  _13 = llvm_cbe_x_2e_addr;
  _14 = llvm_cbe_dx_2e_addr;
  _15 = llvm_cbe_y_2e_addr;
  _16 = llvm_cbe_k2;
  llvm_cbe_call9 = _12((_13 + (_14 / 2)), (_15 + (_16 / 2)));
  llvm_cbe_k3 = (_11 * llvm_cbe_call9);
  ;
  _17 = llvm_cbe_dx_2e_addr;
  _18 = llvm_cbe_f_2e_addr;
  _19 = llvm_cbe_x_2e_addr;
  _20 = llvm_cbe_dx_2e_addr;
  _21 = llvm_cbe_y_2e_addr;
  _22 = llvm_cbe_k3;
  llvm_cbe_call13 = _18((_19 + _20), (_21 + _22));
  llvm_cbe_k4 = (_17 * llvm_cbe_call13);
  _23 = llvm_cbe_y_2e_addr;
  _24 = llvm_cbe_k1;
  _25 = llvm_cbe_k2;
  _26 = llvm_cbe_k3;
  _27 = llvm_cbe_k4;
  return (_23 + ((((_24 + (2 * _25)) + (2 * _26)) + _27) / 6));
}


double rate(double llvm_cbe_x, double llvm_cbe_y) {
  double llvm_cbe_x_2e_addr;    /* Address-exposed local */
  double llvm_cbe_y_2e_addr;    /* Address-exposed local */
  double _28;
  double _29;
  double llvm_cbe_call;

  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  _28 = llvm_cbe_x_2e_addr;
  _29 = llvm_cbe_y_2e_addr;
  llvm_cbe_call = sqrt(_29);
  return (_28 * llvm_cbe_call);
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  double* llvm_cbe_y;    /* Address-exposed local */
  double llvm_cbe_x;    /* Address-exposed local */
  double llvm_cbe_y2;    /* Address-exposed local */
  double llvm_cbe_x0;    /* Address-exposed local */
  double llvm_cbe_x1;    /* Address-exposed local */
  double llvm_cbe_dx;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  double _30;
  double _31;
  double _32;
  uint32_t _33;
  uint8_t* llvm_cbe_call;
  double* _34;
  uint32_t _35;
  uint32_t _36;
  double _37;
  double _38;
  double _39;
  uint32_t _40;
  double* _41;
  uint32_t _42;
  double _43;
  double llvm_cbe_call9;
  double* _44;
  uint32_t _45;
  uint32_t _46;
  uint32_t llvm_cbe_call12;
  uint32_t _47;
  uint32_t _48;
  double _49;
  double _50;
  uint32_t _51;
  double _52;
  double _53;
  double llvm_cbe_call23;
  double _54;
  double* _55;
  uint32_t _56;
  double _57;
  double* _58;
  uint32_t _59;
  double _60;
  double _61;
  uint32_t llvm_cbe_call30;
  uint32_t _62;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  llvm_cbe_x0 = 0;
  ;
  llvm_cbe_x1 = 10;
  ;
  llvm_cbe_dx = 0.10000000000000001;
  ;
  ;
  _30 = llvm_cbe_x1;
  _31 = llvm_cbe_x0;
  _32 = llvm_cbe_dx;
  llvm_cbe_n = (((int32_t)(1 + ((_30 - _31) / _32))));
  _33 = llvm_cbe_n;
  llvm_cbe_call = malloc((llvm_mul_u64(8, (((int64_t)(int32_t)_33)))));
  llvm_cbe_y = (((double*)llvm_cbe_call));
  _34 = llvm_cbe_y;
  *((&(*_34))) = 1;
  llvm_cbe_i = 1;

  _35 = llvm_cbe_i;
  _36 = llvm_cbe_n;
while (((int32_t)_35) < ((int32_t)_36)){
  _37 = llvm_cbe_dx;
  _38 = llvm_cbe_x0;
  _39 = llvm_cbe_dx;
  _40 = llvm_cbe_i;
  _41 = llvm_cbe_y;
  _42 = llvm_cbe_i;
  _43 = *((&_41[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_42, 1)))))]));
  llvm_cbe_call9 = rk4(rate, _37, (_38 + (_39 * (((double)(int32_t)(llvm_sub_u32(_40, 1)))))), _43);
  _44 = llvm_cbe_y;
  _45 = llvm_cbe_i;
  *((&_44[((int64_t)(((int64_t)(int32_t)_45)))])) = llvm_cbe_call9;

  _46 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_46, 1));

  _35 = llvm_cbe_i;
  _36 = llvm_cbe_n;
}
  llvm_cbe_call12 = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_i = 0;

  _47 = llvm_cbe_i;
  _48 = llvm_cbe_n;
while (((int32_t)_47) < ((int32_t)_48)){
  _49 = llvm_cbe_x0;
  _50 = llvm_cbe_dx;
  _51 = llvm_cbe_i;
  llvm_cbe_x = (_49 + (_50 * (((double)(int32_t)_51))));
  _52 = llvm_cbe_x;
  _53 = llvm_cbe_x;
  llvm_cbe_call23 = pow((((_52 * _53) / 4) + 1), 2);
  llvm_cbe_y2 = llvm_cbe_call23;
  _54 = llvm_cbe_x;
  _55 = llvm_cbe_y;
  _56 = llvm_cbe_i;
  _57 = *((&_55[((int64_t)(((int64_t)(int32_t)_56)))]));
  _58 = llvm_cbe_y;
  _59 = llvm_cbe_i;
  _60 = *((&_58[((int64_t)(((int64_t)(int32_t)_59)))]));
  _61 = llvm_cbe_y2;
  llvm_cbe_call30 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _54, _57, ((_60 / _61) - 1));

  _62 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_62, 10));

  _47 = llvm_cbe_i;
  _48 = llvm_cbe_n;
}
  return 0;
}

