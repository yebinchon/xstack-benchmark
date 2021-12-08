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

static __forceinline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }


/* Global Declarations */

/* Types Declarations */
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_unnamed_1 {
  double field0;
  double field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
void cprint(double, double) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void complex_operations(void) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 __muldc3(double, double, double, double);
struct l_unnamed_1 __divdc3(double, double, double, double);
int main(void) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_7_uint8_t _OC_str = { "%f%+fI" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "\na=" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "\nb=" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "\na+b=" };
static struct l_array_6_uint8_t _OC_str_OC_4 = { "\na*b=" };
static struct l_array_6_uint8_t _OC_str_OC_5 = { "\n1/c=" };
static struct l_array_5_uint8_t _OC_str_OC_6 = { "\n-a=" };
static struct l_array_9_uint8_t _OC_str_OC_7 = { "\nconj a=" };
static struct l_array_2_uint8_t _OC_str_OC_8 = { "\n" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

void cprint(double llvm_cbe_c_2e_coerce0, double llvm_cbe_c_2e_coerce1) {
  struct l_unnamed_1 llvm_cbe_c;    /* Address-exposed local */
  double llvm_cbe_c_2e_real;
  double llvm_cbe_c_2e_imag;
  double llvm_cbe_c_2e_real2;
  double llvm_cbe_c_2e_imag4;
  uint32_t llvm_cbe_call;

  *((&llvm_cbe_c.field0)) = llvm_cbe_c_2e_coerce0;
  *((&llvm_cbe_c.field1)) = llvm_cbe_c_2e_coerce1;
  ;
  llvm_cbe_c_2e_real = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag = *((&llvm_cbe_c.field1));
  llvm_cbe_c_2e_real2 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag4 = *((&llvm_cbe_c.field1));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), llvm_cbe_c_2e_real, llvm_cbe_c_2e_imag4);
}


void complex_operations(void) {
  struct l_unnamed_1 llvm_cbe_a;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_b;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_c;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce6;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce18;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce36;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce49;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce61;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce73;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  double llvm_cbe_a_2e_real;
  double llvm_cbe_a_2e_imag;
  double _1;
  double _2;
  uint32_t llvm_cbe_call3;
  double llvm_cbe_b_2e_real;
  double llvm_cbe_b_2e_imag;
  double _3;
  double _4;
  double llvm_cbe_a_2e_real8;
  double llvm_cbe_a_2e_imag10;
  double llvm_cbe_b_2e_real12;
  double llvm_cbe_b_2e_imag14;
  uint32_t llvm_cbe_call15;
  double llvm_cbe_c_2e_real;
  double llvm_cbe_c_2e_imag;
  double _5;
  double _6;
  double llvm_cbe_a_2e_real20;
  double llvm_cbe_a_2e_imag22;
  double llvm_cbe_b_2e_real24;
  double llvm_cbe_b_2e_imag26;
  double llvm_cbe_mul_r;
  double llvm_cbe_mul_i;
  struct l_unnamed_1 llvm_cbe_call28;
  double _7;
  double _8;
  double llvm_cbe_real_mul_phi;
  double llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi;
  double llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  uint32_t llvm_cbe_call31;
  double llvm_cbe_c_2e_real33;
  double llvm_cbe_c_2e_imag35;
  double _9;
  double _10;
  double llvm_cbe_a_2e_real38;
  double llvm_cbe_a_2e_imag40;
  struct l_unnamed_1 llvm_cbe_call41;
  uint32_t llvm_cbe_call44;
  double llvm_cbe_c_2e_real46;
  double llvm_cbe_c_2e_imag48;
  double _11;
  double _12;
  double llvm_cbe_a_2e_real51;
  double llvm_cbe_a_2e_imag53;
  uint32_t llvm_cbe_call56;
  double llvm_cbe_c_2e_real58;
  double llvm_cbe_c_2e_imag60;
  double _13;
  double _14;
  double llvm_cbe_a_2e_real63;
  double llvm_cbe_a_2e_imag65;
  uint32_t llvm_cbe_call68;
  double llvm_cbe_c_2e_real70;
  double llvm_cbe_c_2e_imag72;
  double _15;
  double _16;
  uint32_t llvm_cbe_call74;
  double llvm_cbe_real_mul_phi_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted1;
  double llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  uint32_t llvm_cbe_call31_2e_splitted1;
  double llvm_cbe_c_2e_real33_2e_splitted1;
  double llvm_cbe_c_2e_imag35_2e_splitted1;
  double _17;
  double _18;
  double llvm_cbe_a_2e_real38_2e_splitted1;
  double llvm_cbe_a_2e_imag40_2e_splitted1;
  struct l_unnamed_1 llvm_cbe_call41_2e_splitted1;
  uint32_t llvm_cbe_call44_2e_splitted1;
  double llvm_cbe_c_2e_real46_2e_splitted1;
  double llvm_cbe_c_2e_imag48_2e_splitted1;
  double _19;
  double _20;
  double llvm_cbe_a_2e_real51_2e_splitted1;
  double llvm_cbe_a_2e_imag53_2e_splitted1;
  uint32_t llvm_cbe_call56_2e_splitted1;
  double llvm_cbe_c_2e_real58_2e_splitted1;
  double llvm_cbe_c_2e_imag60_2e_splitted1;
  double _21;
  double _22;
  double llvm_cbe_a_2e_real63_2e_splitted1;
  double llvm_cbe_a_2e_imag65_2e_splitted1;
  uint32_t llvm_cbe_call68_2e_splitted1;
  double llvm_cbe_c_2e_real70_2e_splitted1;
  double llvm_cbe_c_2e_imag72_2e_splitted1;
  double _23;
  double _24;
  uint32_t llvm_cbe_call74_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted2;
  double llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted2;
  double llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  uint32_t llvm_cbe_call31_2e_splitted2;
  double llvm_cbe_c_2e_real33_2e_splitted2;
  double llvm_cbe_c_2e_imag35_2e_splitted2;
  double _25;
  double _26;
  double llvm_cbe_a_2e_real38_2e_splitted2;
  double llvm_cbe_a_2e_imag40_2e_splitted2;
  struct l_unnamed_1 llvm_cbe_call41_2e_splitted2;
  uint32_t llvm_cbe_call44_2e_splitted2;
  double llvm_cbe_c_2e_real46_2e_splitted2;
  double llvm_cbe_c_2e_imag48_2e_splitted2;
  double _27;
  double _28;
  double llvm_cbe_a_2e_real51_2e_splitted2;
  double llvm_cbe_a_2e_imag53_2e_splitted2;
  uint32_t llvm_cbe_call56_2e_splitted2;
  double llvm_cbe_c_2e_real58_2e_splitted2;
  double llvm_cbe_c_2e_imag60_2e_splitted2;
  double _29;
  double _30;
  double llvm_cbe_a_2e_real63_2e_splitted2;
  double llvm_cbe_a_2e_imag65_2e_splitted2;
  uint32_t llvm_cbe_call68_2e_splitted2;
  double llvm_cbe_c_2e_real70_2e_splitted2;
  double llvm_cbe_c_2e_imag72_2e_splitted2;
  double _31;
  double _32;
  uint32_t llvm_cbe_call74_2e_splitted2;

  ;
  *((&llvm_cbe_a.field0)) = 1;
  *((&llvm_cbe_a.field1)) = 1;
  ;
  *((&llvm_cbe_b.field0)) = 3.1415899999999999;
  *((&llvm_cbe_b.field1)) = 1.2;
  ;
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  llvm_cbe_a_2e_real = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_coerce.field0)) = llvm_cbe_a_2e_real;
  *((&llvm_cbe_coerce.field1)) = llvm_cbe_a_2e_imag;
  _1 = *((&llvm_cbe_coerce.field0));
  _2 = *((&llvm_cbe_coerce.field1));
  cprint(_1, _2);
  llvm_cbe_call3 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_b_2e_real = *((&llvm_cbe_b.field0));
  llvm_cbe_b_2e_imag = *((&llvm_cbe_b.field1));
  *((&llvm_cbe_coerce6.field0)) = llvm_cbe_b_2e_real;
  *((&llvm_cbe_coerce6.field1)) = llvm_cbe_b_2e_imag;
  _3 = *((&llvm_cbe_coerce6.field0));
  _4 = *((&llvm_cbe_coerce6.field1));
  cprint(_3, _4);
  llvm_cbe_a_2e_real8 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag10 = *((&llvm_cbe_a.field1));
  llvm_cbe_b_2e_real12 = *((&llvm_cbe_b.field0));
  llvm_cbe_b_2e_imag14 = *((&llvm_cbe_b.field1));
  *((&llvm_cbe_c.field0)) = (llvm_cbe_a_2e_real8 + llvm_cbe_b_2e_real12);
  *((&llvm_cbe_c.field1)) = (llvm_cbe_a_2e_imag10 + llvm_cbe_b_2e_imag14);
  llvm_cbe_call15 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  llvm_cbe_c_2e_real = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce18.field0)) = llvm_cbe_c_2e_real;
  *((&llvm_cbe_coerce18.field1)) = llvm_cbe_c_2e_imag;
  _5 = *((&llvm_cbe_coerce18.field0));
  _6 = *((&llvm_cbe_coerce18.field1));
  cprint(_5, _6);
  llvm_cbe_a_2e_real20 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag22 = *((&llvm_cbe_a.field1));
  llvm_cbe_b_2e_real24 = *((&llvm_cbe_b.field0));
  llvm_cbe_b_2e_imag26 = *((&llvm_cbe_b.field1));
  llvm_cbe_mul_r = (llvm_cbe_a_2e_real20 * llvm_cbe_b_2e_real24) - (llvm_cbe_a_2e_imag22 * llvm_cbe_b_2e_imag26);
  llvm_cbe_mul_i = (llvm_cbe_a_2e_real20 * llvm_cbe_b_2e_imag26) + (llvm_cbe_a_2e_imag22 * llvm_cbe_b_2e_real24);
  if (!(((llvm_fcmp_uno(llvm_cbe_mul_r, llvm_cbe_mul_r))&1))) {
    llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted2 = llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted2 = llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_c.field0)) = llvm_cbe_real_mul_phi_2e_splitted2;
  *((&llvm_cbe_c.field1)) = llvm_cbe_imag_mul_phi_2e_splitted2;
  llvm_cbe_call31_2e_splitted2 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  llvm_cbe_c_2e_real33_2e_splitted2 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag35_2e_splitted2 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce36.field0)) = llvm_cbe_c_2e_real33_2e_splitted2;
  *((&llvm_cbe_coerce36.field1)) = llvm_cbe_c_2e_imag35_2e_splitted2;
  _25 = *((&llvm_cbe_coerce36.field0));
  _26 = *((&llvm_cbe_coerce36.field1));
  cprint(_25, _26);
  llvm_cbe_a_2e_real38_2e_splitted2 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag40_2e_splitted2 = *((&llvm_cbe_a.field1));
  llvm_cbe_call41_2e_splitted2 = __divdc3(1, 0, llvm_cbe_a_2e_real38_2e_splitted2, llvm_cbe_a_2e_imag40_2e_splitted2);
  *((&llvm_cbe_c.field0)) = ((llvm_cbe_call41_2e_splitted2.field0));
  *((&llvm_cbe_c.field1)) = ((llvm_cbe_call41_2e_splitted2.field1));
  llvm_cbe_call44_2e_splitted2 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  llvm_cbe_c_2e_real46_2e_splitted2 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag48_2e_splitted2 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce49.field0)) = llvm_cbe_c_2e_real46_2e_splitted2;
  *((&llvm_cbe_coerce49.field1)) = llvm_cbe_c_2e_imag48_2e_splitted2;
  _27 = *((&llvm_cbe_coerce49.field0));
  _28 = *((&llvm_cbe_coerce49.field1));
  cprint(_27, _28);
  llvm_cbe_a_2e_real51_2e_splitted2 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag53_2e_splitted2 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_c.field0)) = (-(llvm_cbe_a_2e_real51_2e_splitted2));
  *((&llvm_cbe_c.field1)) = (-(llvm_cbe_a_2e_imag53_2e_splitted2));
  llvm_cbe_call56_2e_splitted2 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_c_2e_real58_2e_splitted2 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag60_2e_splitted2 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce61.field0)) = llvm_cbe_c_2e_real58_2e_splitted2;
  *((&llvm_cbe_coerce61.field1)) = llvm_cbe_c_2e_imag60_2e_splitted2;
  _29 = *((&llvm_cbe_coerce61.field0));
  _30 = *((&llvm_cbe_coerce61.field1));
  cprint(_29, _30);
  llvm_cbe_a_2e_real63_2e_splitted2 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag65_2e_splitted2 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_c.field0)) = llvm_cbe_a_2e_real63_2e_splitted2;
  *((&llvm_cbe_c.field1)) = (-(llvm_cbe_a_2e_imag65_2e_splitted2));
  llvm_cbe_call68_2e_splitted2 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_c_2e_real70_2e_splitted2 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag72_2e_splitted2 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce73.field0)) = llvm_cbe_c_2e_real70_2e_splitted2;
  *((&llvm_cbe_coerce73.field1)) = llvm_cbe_c_2e_imag72_2e_splitted2;
  _31 = *((&llvm_cbe_coerce73.field0));
  _32 = *((&llvm_cbe_coerce73.field1));
  cprint(_31, _32);
  llvm_cbe_call74_2e_splitted2 = printf(((&_OC_str_OC_8.array[((int64_t)0)])));
}
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i, llvm_cbe_mul_i))&1))) {
  llvm_cbe_call28 = __muldc3(llvm_cbe_a_2e_real20, llvm_cbe_a_2e_imag22, llvm_cbe_b_2e_real24, llvm_cbe_b_2e_imag26);
  _7 = (llvm_cbe_call28.field0);
  _8 = (llvm_cbe_call28.field1);
  llvm_cbe_real_mul_phi__PHI_TEMPORARY = _7;   /* for PHI node */
  llvm_cbe_imag_mul_phi__PHI_TEMPORARY = _8;   /* for PHI node */

  llvm_cbe_real_mul_phi = llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi = llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  *((&llvm_cbe_c.field0)) = llvm_cbe_real_mul_phi;
  *((&llvm_cbe_c.field1)) = llvm_cbe_imag_mul_phi;
  llvm_cbe_call31 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  llvm_cbe_c_2e_real33 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag35 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce36.field0)) = llvm_cbe_c_2e_real33;
  *((&llvm_cbe_coerce36.field1)) = llvm_cbe_c_2e_imag35;
  _9 = *((&llvm_cbe_coerce36.field0));
  _10 = *((&llvm_cbe_coerce36.field1));
  cprint(_9, _10);
  llvm_cbe_a_2e_real38 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag40 = *((&llvm_cbe_a.field1));
  llvm_cbe_call41 = __divdc3(1, 0, llvm_cbe_a_2e_real38, llvm_cbe_a_2e_imag40);
  *((&llvm_cbe_c.field0)) = ((llvm_cbe_call41.field0));
  *((&llvm_cbe_c.field1)) = ((llvm_cbe_call41.field1));
  llvm_cbe_call44 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  llvm_cbe_c_2e_real46 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag48 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce49.field0)) = llvm_cbe_c_2e_real46;
  *((&llvm_cbe_coerce49.field1)) = llvm_cbe_c_2e_imag48;
  _11 = *((&llvm_cbe_coerce49.field0));
  _12 = *((&llvm_cbe_coerce49.field1));
  cprint(_11, _12);
  llvm_cbe_a_2e_real51 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag53 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_c.field0)) = (-(llvm_cbe_a_2e_real51));
  *((&llvm_cbe_c.field1)) = (-(llvm_cbe_a_2e_imag53));
  llvm_cbe_call56 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_c_2e_real58 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag60 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce61.field0)) = llvm_cbe_c_2e_real58;
  *((&llvm_cbe_coerce61.field1)) = llvm_cbe_c_2e_imag60;
  _13 = *((&llvm_cbe_coerce61.field0));
  _14 = *((&llvm_cbe_coerce61.field1));
  cprint(_13, _14);
  llvm_cbe_a_2e_real63 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag65 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_c.field0)) = llvm_cbe_a_2e_real63;
  *((&llvm_cbe_c.field1)) = (-(llvm_cbe_a_2e_imag65));
  llvm_cbe_call68 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_c_2e_real70 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag72 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce73.field0)) = llvm_cbe_c_2e_real70;
  *((&llvm_cbe_coerce73.field1)) = llvm_cbe_c_2e_imag72;
  _15 = *((&llvm_cbe_coerce73.field0));
  _16 = *((&llvm_cbe_coerce73.field1));
  cprint(_15, _16);
  llvm_cbe_call74 = printf(((&_OC_str_OC_8.array[((int64_t)0)])));
  return;
  } else {
    llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted1 = llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted1 = llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  *((&llvm_cbe_c.field0)) = llvm_cbe_real_mul_phi_2e_splitted1;
  *((&llvm_cbe_c.field1)) = llvm_cbe_imag_mul_phi_2e_splitted1;
  llvm_cbe_call31_2e_splitted1 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  llvm_cbe_c_2e_real33_2e_splitted1 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag35_2e_splitted1 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce36.field0)) = llvm_cbe_c_2e_real33_2e_splitted1;
  *((&llvm_cbe_coerce36.field1)) = llvm_cbe_c_2e_imag35_2e_splitted1;
  _17 = *((&llvm_cbe_coerce36.field0));
  _18 = *((&llvm_cbe_coerce36.field1));
  cprint(_17, _18);
  llvm_cbe_a_2e_real38_2e_splitted1 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag40_2e_splitted1 = *((&llvm_cbe_a.field1));
  llvm_cbe_call41_2e_splitted1 = __divdc3(1, 0, llvm_cbe_a_2e_real38_2e_splitted1, llvm_cbe_a_2e_imag40_2e_splitted1);
  *((&llvm_cbe_c.field0)) = ((llvm_cbe_call41_2e_splitted1.field0));
  *((&llvm_cbe_c.field1)) = ((llvm_cbe_call41_2e_splitted1.field1));
  llvm_cbe_call44_2e_splitted1 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  llvm_cbe_c_2e_real46_2e_splitted1 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag48_2e_splitted1 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce49.field0)) = llvm_cbe_c_2e_real46_2e_splitted1;
  *((&llvm_cbe_coerce49.field1)) = llvm_cbe_c_2e_imag48_2e_splitted1;
  _19 = *((&llvm_cbe_coerce49.field0));
  _20 = *((&llvm_cbe_coerce49.field1));
  cprint(_19, _20);
  llvm_cbe_a_2e_real51_2e_splitted1 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag53_2e_splitted1 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_c.field0)) = (-(llvm_cbe_a_2e_real51_2e_splitted1));
  *((&llvm_cbe_c.field1)) = (-(llvm_cbe_a_2e_imag53_2e_splitted1));
  llvm_cbe_call56_2e_splitted1 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));
  llvm_cbe_c_2e_real58_2e_splitted1 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag60_2e_splitted1 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce61.field0)) = llvm_cbe_c_2e_real58_2e_splitted1;
  *((&llvm_cbe_coerce61.field1)) = llvm_cbe_c_2e_imag60_2e_splitted1;
  _21 = *((&llvm_cbe_coerce61.field0));
  _22 = *((&llvm_cbe_coerce61.field1));
  cprint(_21, _22);
  llvm_cbe_a_2e_real63_2e_splitted1 = *((&llvm_cbe_a.field0));
  llvm_cbe_a_2e_imag65_2e_splitted1 = *((&llvm_cbe_a.field1));
  *((&llvm_cbe_c.field0)) = llvm_cbe_a_2e_real63_2e_splitted1;
  *((&llvm_cbe_c.field1)) = (-(llvm_cbe_a_2e_imag65_2e_splitted1));
  llvm_cbe_call68_2e_splitted1 = printf(((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_c_2e_real70_2e_splitted1 = *((&llvm_cbe_c.field0));
  llvm_cbe_c_2e_imag72_2e_splitted1 = *((&llvm_cbe_c.field1));
  *((&llvm_cbe_coerce73.field0)) = llvm_cbe_c_2e_real70_2e_splitted1;
  *((&llvm_cbe_coerce73.field1)) = llvm_cbe_c_2e_imag72_2e_splitted1;
  _23 = *((&llvm_cbe_coerce73.field0));
  _24 = *((&llvm_cbe_coerce73.field1));
  cprint(_23, _24);
  llvm_cbe_call74_2e_splitted1 = printf(((&_OC_str_OC_8.array[((int64_t)0)])));
  return;
}
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */

  llvm_cbe_retval = 0;
  complex_operations();
  return 0;
}

