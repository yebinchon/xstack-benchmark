/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
#endif

/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef _MSC_VER
#define __forceinline __attribute__((always_inline)) inline
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
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

static __forceinline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static __forceinline int llvm_fcmp_olt(double X, double Y) { return X <  Y; }


/* Global Declarations */

/* Types Declarations */
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_4_double {
  double array[4];
};
struct l_array_3_struct_AC_l_array_4_double {
  struct l_array_4_double array[3];
};
struct l_array_2_struct_AC_l_array_3_struct_AC_l_array_4_double {
  struct l_array_3_struct_AC_l_array_4_double array[2];
};
struct l_array_3_double {
  double array[3];
};
struct l_array_2_struct_AC_l_array_3_double {
  struct l_array_3_double array[2];
};
struct l_array_3_struct_AC_l_array_2_struct_AC_l_array_3_double {
  struct l_array_2_struct_AC_l_array_3_double array[3];
};
struct l_array_6_double {
  double array[6];
};
struct l_array_4_struct_AC_l_array_6_double {
  struct l_array_6_double array[4];
};
struct l_array_4_struct_AC_l_array_4_struct_AC_l_array_6_double {
  struct l_array_4_struct_AC_l_array_6_double array[4];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_unnamed_1 {
  double field0;
  double field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
void _fft(struct l_unnamed_1*, struct l_unnamed_1*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1 cexp(double, double) __ATTRIBUTELIST__((nothrow));
struct l_unnamed_1 __muldc3(double, double, double, double);
struct l_unnamed_1 __divdc3(double, double, double, double);
void fft(struct l_unnamed_1*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
struct l_unnamed_1* pad_two(double*, uint32_t, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* calloc(uint64_t, uint64_t) __ATTRIBUTELIST__((nothrow));
void deconv(double*, uint32_t, double*, uint32_t, double*, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
double cabs(double, double) __ATTRIBUTELIST__((nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
double* unpack2(uint8_t*, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void pack2(double*, uint32_t, uint32_t, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void deconv2(uint8_t*, uint32_t, uint32_t, uint8_t*, uint32_t, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
double* unpack3(uint8_t*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void pack3(double*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void deconv3(uint8_t*, uint32_t, uint32_t, uint32_t, uint8_t*, uint32_t, uint32_t, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
double atan2(double, double) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
double PI __ATTRIBUTE_WEAK__;
static __MSALIGN__(16) struct l_array_2_struct_AC_l_array_3_struct_AC_l_array_4_double __const_OC_main_OC_h __attribute__((aligned(16))) = { { { { { { -6, -8, -5, 9 } }, { { -7, 9, -6, -8 } }, { { 2, -7, 9, 8 } } } }, { { { { 7, 4, 4, -6 } }, { { 9, 9, 4, -4 } }, { { -3, 7, -2, -3 } } } } } };
static __MSALIGN__(16) struct l_array_3_struct_AC_l_array_2_struct_AC_l_array_3_double __const_OC_main_OC_f __attribute__((aligned(16))) = { { { { { { -9, 5, -8 } }, { { 3, 5, 1 } } } }, { { { { -1, -7, 2 } }, { { -5, -6, 6 } } } }, { { { { 8, 5, 8 } }, { { -2, -6, -4 } } } } } };
static __MSALIGN__(16) struct l_array_4_struct_AC_l_array_4_struct_AC_l_array_6_double __const_OC_main_OC_g __attribute__((aligned(16))) = { { { { { { 54, 42, 53, -42, 85, -72 } }, { { 45, -170, 94, -36, 48, 73 } }, { { -39, 65, -112, -16, -78, -72 } }, { { 6, -11, -6, 62, 49, 8 } } } }, { { { { -57, 49, -23, 52, -135, 66 } }, { { -23, 127, -58, -5, -118, 64 } }, { { 87, -16, 121, 23, -41, -12 } }, { { -19, 29, 35, -148, -11, 45 } } } }, { { { { -55, -147, -146, -31, 55, 60 } }, { { -88, -45, -28, 46, -26, -144 } }, { { -12, -107, -34, 150, 249, 66 } }, { { 11, -15, -34, 27, -78, -50 } } } }, { { { { 56, 67, 108, 4, 2, -48 } }, { { 58, 67, 89, 32, 32, -8 } }, { { -42, -31, -103, -30, -23, -8 } }, { { 6, 4, -26, -10, 26, 12 } } } } } };
static struct l_array_16_uint8_t _OC_str = { "deconv3(g, f):\n" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%g " };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };
static struct l_array_17_uint8_t _OC_str_OC_3 = { "\ndeconv3(g, h):\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_mul_u32(uint32_t a, uint32_t b) {
  uint32_t r = a * b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint32_t llvm_neg_u32(uint32_t a) {
  uint32_t r = -a;
  return r;
}


/* Function Bodies */

void _fft(struct l_unnamed_1* llvm_cbe_buf, struct l_unnamed_1* llvm_cbe_out, uint32_t llvm_cbe_n, uint32_t llvm_cbe_step) {
  struct l_unnamed_1* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_step_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_t;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  struct l_unnamed_1* _3;
  struct l_unnamed_1* _4;
  uint32_t _5;
  uint32_t _6;
  struct l_unnamed_1* _7;
  uint32_t _8;
  struct l_unnamed_1* _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint32_t _14;
  double _15;
  double llvm_cbe_mul_2e_rl;
  double llvm_cbe_mul_2e_il;
  uint32_t _16;
  double llvm_cbe_conv;
  double llvm_cbe_mul_r;
  double llvm_cbe_mul_i;
  struct l_unnamed_1 llvm_cbe_call;
  double _17;
  double _18;
  double llvm_cbe_real_mul_phi;
  double llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi;
  double llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  uint32_t _19;
  struct l_unnamed_1 llvm_cbe_call7;
  double _20;
  double _21;
  struct l_unnamed_1 llvm_cbe_call8;
  double _22;
  double _23;
  struct l_unnamed_1* _24;
  uint32_t _25;
  uint32_t _26;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  double llvm_cbe_mul_r13;
  double llvm_cbe_mul_i14;
  struct l_unnamed_1 llvm_cbe_call19;
  double _27;
  double _28;
  double llvm_cbe_real_mul_phi21;
  double llvm_cbe_real_mul_phi21__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22;
  double llvm_cbe_imag_mul_phi22__PHI_TEMPORARY;
  struct l_unnamed_1* _29;
  uint32_t _30;
  struct l_unnamed_1* llvm_cbe_arrayidx24;
  double llvm_cbe_arrayidx24_2e_real;
  double llvm_cbe_arrayidx24_2e_imag;
  double llvm_cbe_t_2e_real;
  double llvm_cbe_t_2e_imag;
  struct l_unnamed_1* _31;
  uint32_t _32;
  struct l_unnamed_1* llvm_cbe_arrayidx28;
  struct l_unnamed_1* _33;
  uint32_t _34;
  struct l_unnamed_1* llvm_cbe_arrayidx30;
  double llvm_cbe_arrayidx30_2e_real;
  double llvm_cbe_arrayidx30_2e_imag;
  double llvm_cbe_t_2e_real32;
  double llvm_cbe_t_2e_imag34;
  struct l_unnamed_1* _35;
  uint32_t _36;
  uint32_t _37;
  struct l_unnamed_1* llvm_cbe_arrayidx38;
  uint32_t _38;
  uint32_t _39;
  double llvm_cbe_real_mul_phi_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted1;
  double llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  uint32_t _40;
  struct l_unnamed_1 llvm_cbe_call7_2e_splitted1;
  double _41;
  double _42;
  struct l_unnamed_1 llvm_cbe_call8_2e_splitted1;
  double _43;
  double _44;
  struct l_unnamed_1* _45;
  uint32_t _46;
  uint32_t _47;
  struct l_unnamed_1* llvm_cbe_arrayidx_2e_splitted1;
  double llvm_cbe_arrayidx_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx_2e_imag_2e_splitted1;
  double llvm_cbe_mul_r13_2e_splitted1;
  double llvm_cbe_mul_i14_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted2;
  double llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted2;
  double llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  uint32_t _48;
  struct l_unnamed_1 llvm_cbe_call7_2e_splitted2;
  double _49;
  double _50;
  struct l_unnamed_1 llvm_cbe_call8_2e_splitted2;
  double _51;
  double _52;
  struct l_unnamed_1* _53;
  uint32_t _54;
  uint32_t _55;
  struct l_unnamed_1* llvm_cbe_arrayidx_2e_splitted2;
  double llvm_cbe_arrayidx_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx_2e_imag_2e_splitted2;
  double llvm_cbe_mul_r13_2e_splitted2;
  double llvm_cbe_mul_i14_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted1;
  double llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted1;
  double llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY;
  struct l_unnamed_1* _56;
  uint32_t _57;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted1;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted1;
  double llvm_cbe_t_2e_real_2e_splitted1;
  double llvm_cbe_t_2e_imag_2e_splitted1;
  struct l_unnamed_1* _58;
  uint32_t _59;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted1;
  struct l_unnamed_1* _60;
  uint32_t _61;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted1;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted1;
  double llvm_cbe_t_2e_real32_2e_splitted1;
  double llvm_cbe_t_2e_imag34_2e_splitted1;
  struct l_unnamed_1* _62;
  uint32_t _63;
  uint32_t _64;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted1;
  double llvm_cbe_real_mul_phi21_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted2;
  double llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  struct l_unnamed_1* _65;
  uint32_t _66;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted2;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted2;
  double llvm_cbe_t_2e_real_2e_splitted2;
  double llvm_cbe_t_2e_imag_2e_splitted2;
  struct l_unnamed_1* _67;
  uint32_t _68;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted2;
  struct l_unnamed_1* _69;
  uint32_t _70;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted2;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted2;
  double llvm_cbe_t_2e_real32_2e_splitted2;
  double llvm_cbe_t_2e_imag34_2e_splitted2;
  struct l_unnamed_1* _71;
  uint32_t _72;
  uint32_t _73;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted3;
  double llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted3;
  double llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  struct l_unnamed_1* _74;
  uint32_t _75;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted3;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted3;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted3;
  double llvm_cbe_t_2e_real_2e_splitted3;
  double llvm_cbe_t_2e_imag_2e_splitted3;
  struct l_unnamed_1* _76;
  uint32_t _77;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted3;
  struct l_unnamed_1* _78;
  uint32_t _79;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted3;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted3;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted3;
  double llvm_cbe_t_2e_real32_2e_splitted3;
  double llvm_cbe_t_2e_imag34_2e_splitted3;
  struct l_unnamed_1* _80;
  uint32_t _81;
  uint32_t _82;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted3;
  double llvm_cbe_real_mul_phi21_2e_splitted4;
  double llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted4;
  double llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY;
  struct l_unnamed_1* _83;
  uint32_t _84;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted4;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted4;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted4;
  double llvm_cbe_t_2e_real_2e_splitted4;
  double llvm_cbe_t_2e_imag_2e_splitted4;
  struct l_unnamed_1* _85;
  uint32_t _86;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted4;
  struct l_unnamed_1* _87;
  uint32_t _88;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted4;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted4;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted4;
  double llvm_cbe_t_2e_real32_2e_splitted4;
  double llvm_cbe_t_2e_imag34_2e_splitted4;
  struct l_unnamed_1* _89;
  uint32_t _90;
  uint32_t _91;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted4;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  llvm_cbe_step_2e_addr = llvm_cbe_step;
  ;
  _1 = llvm_cbe_step_2e_addr;
  _2 = llvm_cbe_n_2e_addr;
  if (!(((((int32_t)_1) < ((int32_t)_2))&1))) {
  _3 = llvm_cbe_out_2e_addr;
  _4 = llvm_cbe_buf_2e_addr;
  _5 = llvm_cbe_n_2e_addr;
  _6 = llvm_cbe_step_2e_addr;
  _fft(_3, _4, _5, (llvm_mul_u32(_6, 2)));
  _7 = llvm_cbe_out_2e_addr;
  _8 = llvm_cbe_step_2e_addr;
  _9 = llvm_cbe_buf_2e_addr;
  _10 = llvm_cbe_step_2e_addr;
  _11 = llvm_cbe_n_2e_addr;
  _12 = llvm_cbe_step_2e_addr;
  _fft(((&_7[((int64_t)(((int64_t)(int32_t)_8)))])), ((&_9[((int64_t)(((int64_t)(int32_t)_10)))])), _11, (llvm_mul_u32(_12, 2)));
  ;
  llvm_cbe_i = 0;

  _13 = llvm_cbe_i;
  _14 = llvm_cbe_n_2e_addr;
  if (!(((((int32_t)_13) < ((int32_t)_14))&1))) {
  }

  ;
  _15 = PI;
  llvm_cbe_mul_2e_rl = -0 * _15;
  llvm_cbe_mul_2e_il = -1 * _15;
  _16 = llvm_cbe_i;
  llvm_cbe_conv = ((double)(int32_t)_16);
  llvm_cbe_mul_r = (llvm_cbe_mul_2e_rl * llvm_cbe_conv) - (llvm_cbe_mul_2e_il * 0);
  llvm_cbe_mul_i = (llvm_cbe_mul_2e_rl * 0) + (llvm_cbe_mul_2e_il * llvm_cbe_conv);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r, llvm_cbe_mul_r))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i, llvm_cbe_mul_i))&1))) {
  llvm_cbe_call = __muldc3(llvm_cbe_mul_2e_rl, llvm_cbe_mul_2e_il, llvm_cbe_conv, 0);
  _17 = (llvm_cbe_call.field0);
  _18 = (llvm_cbe_call.field1);
  llvm_cbe_real_mul_phi__PHI_TEMPORARY = _17;   /* for PHI node */
  llvm_cbe_imag_mul_phi__PHI_TEMPORARY = _18;   /* for PHI node */

  llvm_cbe_real_mul_phi = llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi = llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  _19 = llvm_cbe_n_2e_addr;
  llvm_cbe_call7 = __divdc3(llvm_cbe_real_mul_phi, llvm_cbe_imag_mul_phi, (((double)(int32_t)_19)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7.field1));
  _20 = *((&llvm_cbe_coerce.field0));
  _21 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8 = cexp(_20, _21);
  _22 = (llvm_cbe_call8.field0);
  _23 = (llvm_cbe_call8.field1);
  _24 = llvm_cbe_out_2e_addr;
  _25 = llvm_cbe_i;
  _26 = llvm_cbe_step_2e_addr;
  llvm_cbe_arrayidx = (&_24[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_25, _26)))))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  llvm_cbe_mul_r13 = (_22 * llvm_cbe_arrayidx_2e_real) - (_23 * llvm_cbe_arrayidx_2e_imag);
  llvm_cbe_mul_i14 = (_22 * llvm_cbe_arrayidx_2e_imag) + (_23 * llvm_cbe_arrayidx_2e_real);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13, llvm_cbe_mul_r13))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  llvm_cbe_call19 = __muldc3(_22, _23, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _27 = (llvm_cbe_call19.field0);
  _28 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _27;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _28;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  _65 = llvm_cbe_out_2e_addr;
  _66 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted2 = (&_65[((int64_t)(((int64_t)(int32_t)_66)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  _67 = llvm_cbe_buf_2e_addr;
  _68 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted2 = (&_67[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_68, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  _69 = llvm_cbe_out_2e_addr;
  _70 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted2 = (&_69[((int64_t)(((int64_t)(int32_t)_70)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  _71 = llvm_cbe_buf_2e_addr;
  _72 = llvm_cbe_i;
  _73 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted2 = (&_71[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_72, _73)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  _74 = llvm_cbe_out_2e_addr;
  _75 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted3 = (&_74[((int64_t)(((int64_t)(int32_t)_75)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  _76 = llvm_cbe_buf_2e_addr;
  _77 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted3 = (&_76[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_77, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  _78 = llvm_cbe_out_2e_addr;
  _79 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted3 = (&_78[((int64_t)(((int64_t)(int32_t)_79)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  _80 = llvm_cbe_buf_2e_addr;
  _81 = llvm_cbe_i;
  _82 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted3 = (&_80[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_81, _82)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

}
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted4 = llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted4 = llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted4;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted4;
  _83 = llvm_cbe_out_2e_addr;
  _84 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted4 = (&_83[((int64_t)(((int64_t)(int32_t)_84)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted4 = *((&llvm_cbe_arrayidx24_2e_splitted4->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted4 = *((&llvm_cbe_arrayidx24_2e_splitted4->field1));
  llvm_cbe_t_2e_real_2e_splitted4 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted4 = *((&llvm_cbe_t.field1));
  _85 = llvm_cbe_buf_2e_addr;
  _86 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted4 = (&_85[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_86, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted4->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted4 + llvm_cbe_t_2e_real_2e_splitted4);
  *((&llvm_cbe_arrayidx28_2e_splitted4->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted4 + llvm_cbe_t_2e_imag_2e_splitted4);
  _87 = llvm_cbe_out_2e_addr;
  _88 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted4 = (&_87[((int64_t)(((int64_t)(int32_t)_88)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted4 = *((&llvm_cbe_arrayidx30_2e_splitted4->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted4 = *((&llvm_cbe_arrayidx30_2e_splitted4->field1));
  llvm_cbe_t_2e_real32_2e_splitted4 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted4 = *((&llvm_cbe_t.field1));
  _89 = llvm_cbe_buf_2e_addr;
  _90 = llvm_cbe_i;
  _91 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted4 = (&_89[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_90, _91)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted4->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted4 - llvm_cbe_t_2e_real32_2e_splitted4);
  *((&llvm_cbe_arrayidx38_2e_splitted4->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted4 - llvm_cbe_t_2e_imag34_2e_splitted4);

}
  } else {
    llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted1 = llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted1 = llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  _40 = llvm_cbe_n_2e_addr;
  llvm_cbe_call7_2e_splitted1 = __divdc3(llvm_cbe_real_mul_phi_2e_splitted1, llvm_cbe_imag_mul_phi_2e_splitted1, (((double)(int32_t)_40)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7_2e_splitted1.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7_2e_splitted1.field1));
  _41 = *((&llvm_cbe_coerce.field0));
  _42 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8_2e_splitted1 = cexp(_41, _42);
  _43 = (llvm_cbe_call8_2e_splitted1.field0);
  _44 = (llvm_cbe_call8_2e_splitted1.field1);
  _45 = llvm_cbe_out_2e_addr;
  _46 = llvm_cbe_i;
  _47 = llvm_cbe_step_2e_addr;
  llvm_cbe_arrayidx_2e_splitted1 = (&_45[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_46, _47)))))]);
  llvm_cbe_arrayidx_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx_2e_splitted1->field0));
  llvm_cbe_arrayidx_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx_2e_splitted1->field1));
  llvm_cbe_mul_r13_2e_splitted1 = (_43 * llvm_cbe_arrayidx_2e_real_2e_splitted1) - (_44 * llvm_cbe_arrayidx_2e_imag_2e_splitted1);
  llvm_cbe_mul_i14_2e_splitted1 = (_43 * llvm_cbe_arrayidx_2e_imag_2e_splitted1) + (_44 * llvm_cbe_arrayidx_2e_real_2e_splitted1);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13_2e_splitted1, llvm_cbe_mul_r13_2e_splitted1))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
}
  llvm_cbe_call19 = __muldc3(_22, _23, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _27 = (llvm_cbe_call19.field0);
  _28 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _27;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _28;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  _74 = llvm_cbe_out_2e_addr;
  _75 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted3 = (&_74[((int64_t)(((int64_t)(int32_t)_75)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  _76 = llvm_cbe_buf_2e_addr;
  _77 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted3 = (&_76[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_77, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  _78 = llvm_cbe_out_2e_addr;
  _79 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted3 = (&_78[((int64_t)(((int64_t)(int32_t)_79)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  _80 = llvm_cbe_buf_2e_addr;
  _81 = llvm_cbe_i;
  _82 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted3 = (&_80[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_81, _82)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  _65 = llvm_cbe_out_2e_addr;
  _66 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted2 = (&_65[((int64_t)(((int64_t)(int32_t)_66)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  _67 = llvm_cbe_buf_2e_addr;
  _68 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted2 = (&_67[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_68, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  _69 = llvm_cbe_out_2e_addr;
  _70 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted2 = (&_69[((int64_t)(((int64_t)(int32_t)_70)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  _71 = llvm_cbe_buf_2e_addr;
  _72 = llvm_cbe_i;
  _73 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted2 = (&_71[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_72, _73)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r13_2e_splitted2;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i14_2e_splitted2;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted1 = llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted1 = llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted1;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted1;
  _56 = llvm_cbe_out_2e_addr;
  _57 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted1 = (&_56[((int64_t)(((int64_t)(int32_t)_57)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx24_2e_splitted1->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx24_2e_splitted1->field1));
  llvm_cbe_t_2e_real_2e_splitted1 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted1 = *((&llvm_cbe_t.field1));
  _58 = llvm_cbe_buf_2e_addr;
  _59 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted1 = (&_58[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_59, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted1->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted1 + llvm_cbe_t_2e_real_2e_splitted1);
  *((&llvm_cbe_arrayidx28_2e_splitted1->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted1 + llvm_cbe_t_2e_imag_2e_splitted1);
  _60 = llvm_cbe_out_2e_addr;
  _61 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted1 = (&_60[((int64_t)(((int64_t)(int32_t)_61)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx30_2e_splitted1->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx30_2e_splitted1->field1));
  llvm_cbe_t_2e_real32_2e_splitted1 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted1 = *((&llvm_cbe_t.field1));
  _62 = llvm_cbe_buf_2e_addr;
  _63 = llvm_cbe_i;
  _64 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted1 = (&_62[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_63, _64)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted1->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted1 - llvm_cbe_t_2e_real32_2e_splitted1);
  *((&llvm_cbe_arrayidx38_2e_splitted1->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted1 - llvm_cbe_t_2e_imag34_2e_splitted1);

}
}
  } else {
    llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted2 = llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted2 = llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  _48 = llvm_cbe_n_2e_addr;
  llvm_cbe_call7_2e_splitted2 = __divdc3(llvm_cbe_real_mul_phi_2e_splitted2, llvm_cbe_imag_mul_phi_2e_splitted2, (((double)(int32_t)_48)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7_2e_splitted2.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7_2e_splitted2.field1));
  _49 = *((&llvm_cbe_coerce.field0));
  _50 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8_2e_splitted2 = cexp(_49, _50);
  _51 = (llvm_cbe_call8_2e_splitted2.field0);
  _52 = (llvm_cbe_call8_2e_splitted2.field1);
  _53 = llvm_cbe_out_2e_addr;
  _54 = llvm_cbe_i;
  _55 = llvm_cbe_step_2e_addr;
  llvm_cbe_arrayidx_2e_splitted2 = (&_53[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(_54, _55)))))]);
  llvm_cbe_arrayidx_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx_2e_splitted2->field0));
  llvm_cbe_arrayidx_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx_2e_splitted2->field1));
  llvm_cbe_mul_r13_2e_splitted2 = (_51 * llvm_cbe_arrayidx_2e_real_2e_splitted2) - (_52 * llvm_cbe_arrayidx_2e_imag_2e_splitted2);
  llvm_cbe_mul_i14_2e_splitted2 = (_51 * llvm_cbe_arrayidx_2e_imag_2e_splitted2) + (_52 * llvm_cbe_arrayidx_2e_real_2e_splitted2);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13_2e_splitted2, llvm_cbe_mul_r13_2e_splitted2))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
}
  llvm_cbe_call19 = __muldc3(_22, _23, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _27 = (llvm_cbe_call19.field0);
  _28 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _27;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _28;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  _74 = llvm_cbe_out_2e_addr;
  _75 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted3 = (&_74[((int64_t)(((int64_t)(int32_t)_75)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  _76 = llvm_cbe_buf_2e_addr;
  _77 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted3 = (&_76[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_77, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  _78 = llvm_cbe_out_2e_addr;
  _79 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted3 = (&_78[((int64_t)(((int64_t)(int32_t)_79)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  _80 = llvm_cbe_buf_2e_addr;
  _81 = llvm_cbe_i;
  _82 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted3 = (&_80[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_81, _82)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  _65 = llvm_cbe_out_2e_addr;
  _66 = llvm_cbe_i;
  llvm_cbe_arrayidx24_2e_splitted2 = (&_65[((int64_t)(((int64_t)(int32_t)_66)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  _67 = llvm_cbe_buf_2e_addr;
  _68 = llvm_cbe_i;
  llvm_cbe_arrayidx28_2e_splitted2 = (&_67[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_68, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  _69 = llvm_cbe_out_2e_addr;
  _70 = llvm_cbe_i;
  llvm_cbe_arrayidx30_2e_splitted2 = (&_69[((int64_t)(((int64_t)(int32_t)_70)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  _71 = llvm_cbe_buf_2e_addr;
  _72 = llvm_cbe_i;
  _73 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38_2e_splitted2 = (&_71[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_72, _73)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21__PHI_TEMPORARY = llvm_cbe_mul_r13_2e_splitted2;   /* for PHI node */
    llvm_cbe_imag_mul_phi22__PHI_TEMPORARY = llvm_cbe_mul_i14_2e_splitted2;   /* for PHI node */
  llvm_cbe_real_mul_phi21 = llvm_cbe_real_mul_phi21__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22 = llvm_cbe_imag_mul_phi22__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22;
  _29 = llvm_cbe_out_2e_addr;
  _30 = llvm_cbe_i;
  llvm_cbe_arrayidx24 = (&_29[((int64_t)(((int64_t)(int32_t)_30)))]);
  llvm_cbe_arrayidx24_2e_real = *((&llvm_cbe_arrayidx24->field0));
  llvm_cbe_arrayidx24_2e_imag = *((&llvm_cbe_arrayidx24->field1));
  llvm_cbe_t_2e_real = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag = *((&llvm_cbe_t.field1));
  _31 = llvm_cbe_buf_2e_addr;
  _32 = llvm_cbe_i;
  llvm_cbe_arrayidx28 = (&_31[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(_32, 2)))))]);
  *((&llvm_cbe_arrayidx28->field0)) = (llvm_cbe_arrayidx24_2e_real + llvm_cbe_t_2e_real);
  *((&llvm_cbe_arrayidx28->field1)) = (llvm_cbe_arrayidx24_2e_imag + llvm_cbe_t_2e_imag);
  _33 = llvm_cbe_out_2e_addr;
  _34 = llvm_cbe_i;
  llvm_cbe_arrayidx30 = (&_33[((int64_t)(((int64_t)(int32_t)_34)))]);
  llvm_cbe_arrayidx30_2e_real = *((&llvm_cbe_arrayidx30->field0));
  llvm_cbe_arrayidx30_2e_imag = *((&llvm_cbe_arrayidx30->field1));
  llvm_cbe_t_2e_real32 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34 = *((&llvm_cbe_t.field1));
  _35 = llvm_cbe_buf_2e_addr;
  _36 = llvm_cbe_i;
  _37 = llvm_cbe_n_2e_addr;
  llvm_cbe_arrayidx38 = (&_35[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(_36, _37)), 2)))))]);
  *((&llvm_cbe_arrayidx38->field0)) = (llvm_cbe_arrayidx30_2e_real - llvm_cbe_t_2e_real32);
  *((&llvm_cbe_arrayidx38->field1)) = (llvm_cbe_arrayidx30_2e_imag - llvm_cbe_t_2e_imag34);

}
}

}
  _13 = llvm_cbe_i;
  _14 = llvm_cbe_n_2e_addr;
while (((int32_t)_13) < ((int32_t)_14)){
  _38 = llvm_cbe_step_2e_addr;
  _39 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_39, (llvm_mul_u32(2, _38))));

  _13 = llvm_cbe_i;
  _14 = llvm_cbe_n_2e_addr;
}
  return;
}


void fft(struct l_unnamed_1* llvm_cbe_buf, uint32_t llvm_cbe_n) {
  struct l_unnamed_1* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t _92;
  uint64_t _93;
  struct l_unnamed_1* llvm_cbe_vla;
  uint32_t _94;
  uint32_t _95;
  struct l_unnamed_1* _96;
  uint32_t _97;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  uint32_t _98;
  struct l_unnamed_1* llvm_cbe_arrayidx2;
  uint32_t _99;
  struct l_unnamed_1* _100;
  uint32_t _101;
  uint8_t* _102;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  _92 = llvm_cbe_n_2e_addr;
  _93 = ((uint64_t)(uint32_t)_92);
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (struct l_unnamed_1*) alloca(sizeof(struct l_unnamed_1) * (_93));
  llvm_cbe___vla_expr0 = _93;
  ;
  ;
  ;
  llvm_cbe_i = 0;

  _94 = llvm_cbe_i;
  _95 = llvm_cbe_n_2e_addr;
while (((int32_t)_94) < ((int32_t)_95)){
  _96 = llvm_cbe_buf_2e_addr;
  _97 = llvm_cbe_i;
  llvm_cbe_arrayidx = (&_96[((int64_t)(((int64_t)(int32_t)_97)))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  _98 = llvm_cbe_i;
  llvm_cbe_arrayidx2 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_98)))]);
  *((&llvm_cbe_arrayidx2->field0)) = llvm_cbe_arrayidx_2e_real;
  *((&llvm_cbe_arrayidx2->field1)) = llvm_cbe_arrayidx_2e_imag;

  _99 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_99, 1));

  _94 = llvm_cbe_i;
  _95 = llvm_cbe_n_2e_addr;
}
  _100 = llvm_cbe_buf_2e_addr;
  _101 = llvm_cbe_n_2e_addr;
  _fft(_100, llvm_cbe_vla, _101, 1);
  _102 = llvm_cbe_saved_stack;
}


struct l_unnamed_1* pad_two(double* llvm_cbe_g, uint32_t llvm_cbe_len, uint32_t* llvm_cbe_ns) {
  double* llvm_cbe_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_ns_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_n;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_buf;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t* _103;
  uint32_t _104;
  uint32_t* _105;
  uint32_t _106;
  uint32_t _107;
  uint32_t _108;
  uint32_t _109;
  uint32_t _110;
  uint8_t* llvm_cbe_call;
  uint32_t _111;
  uint32_t _112;
  double* _113;
  uint32_t _114;
  double _115;
  struct l_unnamed_1* _116;
  uint32_t _117;
  struct l_unnamed_1* llvm_cbe_arrayidx4;
  uint32_t _118;
  uint32_t _119;
  uint32_t* _120;
  struct l_unnamed_1* _121;

  llvm_cbe_g_2e_addr = llvm_cbe_g;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  llvm_cbe_ns_2e_addr = llvm_cbe_ns;
  ;
  ;
  llvm_cbe_n = 1;
  _103 = llvm_cbe_ns_2e_addr;
  _104 = *_103;
  if ((((_104 != 0u)&1))) {
  _105 = llvm_cbe_ns_2e_addr;
  _106 = *_105;
  llvm_cbe_n = _106;

  } else {

  _107 = llvm_cbe_n;
  _108 = llvm_cbe_len_2e_addr;
  if (!(((((int32_t)_107) < ((int32_t)_108))&1))) {
  }

  _109 = llvm_cbe_n;
  llvm_cbe_n = (llvm_mul_u32(_109, 2));


}
  _107 = llvm_cbe_n;
  _108 = llvm_cbe_len_2e_addr;
while (((int32_t)_107) < ((int32_t)_108)){
  _107 = llvm_cbe_n;
  _108 = llvm_cbe_len_2e_addr;
}
  ;
  _110 = llvm_cbe_n;
  llvm_cbe_call = calloc(16, (((int64_t)(int32_t)_110)));
  llvm_cbe_buf = (((struct l_unnamed_1*)llvm_cbe_call));
  ;
  llvm_cbe_i = 0;

  _111 = llvm_cbe_i;
  _112 = llvm_cbe_len_2e_addr;
while (((int32_t)_111) < ((int32_t)_112)){
  _113 = llvm_cbe_g_2e_addr;
  _114 = llvm_cbe_i;
  _115 = *((&_113[((int64_t)(((int64_t)(int32_t)_114)))]));
  _116 = llvm_cbe_buf;
  _117 = llvm_cbe_i;
  llvm_cbe_arrayidx4 = (&_116[((int64_t)(((int64_t)(int32_t)_117)))]);
  *((&llvm_cbe_arrayidx4->field0)) = _115;
  *((&llvm_cbe_arrayidx4->field1)) = 0;

  _118 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_118, 1));

  _111 = llvm_cbe_i;
  _112 = llvm_cbe_len_2e_addr;
}
  _119 = llvm_cbe_n;
  _120 = llvm_cbe_ns_2e_addr;
  *_120 = _119;
  _121 = llvm_cbe_buf;
  return _121;
}


void deconv(double* llvm_cbe_g, uint32_t llvm_cbe_lg, double* llvm_cbe_f, uint32_t llvm_cbe_lf, double* llvm_cbe_out, uint32_t llvm_cbe_row_len) {
  double* llvm_cbe_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_lg_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_f_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_lf_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_row_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_ns;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_g2;    /* Address-exposed local */
  struct l_unnamed_1* llvm_cbe_f2;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_i7;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  uint32_t llvm_cbe_i20;    /* Address-exposed local */
  double* _122;
  uint32_t _123;
  struct l_unnamed_1* llvm_cbe_call;
  double* _124;
  uint32_t _125;
  struct l_unnamed_1* llvm_cbe_call1;
  struct l_unnamed_1* _126;
  uint32_t _127;
  struct l_unnamed_1* _128;
  uint32_t _129;
  uint32_t _130;
  uint64_t _131;
  struct l_unnamed_1* llvm_cbe_vla;
  uint32_t _132;
  uint32_t _133;
  struct l_unnamed_1* _134;
  uint32_t _135;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  struct l_unnamed_1* _136;
  uint32_t _137;
  struct l_unnamed_1* llvm_cbe_arrayidx3;
  double llvm_cbe_arrayidx3_2e_real;
  double llvm_cbe_arrayidx3_2e_imag;
  struct l_unnamed_1 llvm_cbe_call4;
  uint32_t _138;
  struct l_unnamed_1* llvm_cbe_arrayidx6;
  uint32_t _139;
  uint32_t _140;
  uint32_t _141;
  uint32_t _142;
  uint32_t _143;
  struct l_unnamed_1* llvm_cbe_arrayidx12;
  double llvm_cbe_arrayidx12_2e_real;
  double llvm_cbe_arrayidx12_2e_imag;
  double _144;
  double _145;
  double llvm_cbe_call13;
  uint32_t _146;
  struct l_unnamed_1* llvm_cbe_arrayidx16;
  uint32_t _147;
  uint32_t _148;
  uint32_t _149;
  uint32_t _150;
  uint32_t _151;
  uint32_t _152;
  uint32_t _153;
  uint32_t _154;
  struct l_unnamed_1* llvm_cbe_arrayidx26;
  double llvm_cbe_arrayidx26_2e_real;
  double llvm_cbe_arrayidx26_2e_imag;
  struct l_unnamed_1 llvm_cbe_call27;
  double _155;
  double* _156;
  uint32_t _157;
  uint32_t _158;
  struct l_unnamed_1* _159;
  struct l_unnamed_1* _160;
  uint8_t* _161;

  llvm_cbe_g_2e_addr = llvm_cbe_g;
  ;
  llvm_cbe_lg_2e_addr = llvm_cbe_lg;
  ;
  llvm_cbe_f_2e_addr = llvm_cbe_f;
  ;
  llvm_cbe_lf_2e_addr = llvm_cbe_lf;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  llvm_cbe_row_len_2e_addr = llvm_cbe_row_len;
  ;
  ;
  llvm_cbe_ns = 0;
  ;
  _122 = llvm_cbe_g_2e_addr;
  _123 = llvm_cbe_lg_2e_addr;
  llvm_cbe_call = pad_two(_122, _123, (&llvm_cbe_ns));
  llvm_cbe_g2 = llvm_cbe_call;
  ;
  _124 = llvm_cbe_f_2e_addr;
  _125 = llvm_cbe_lf_2e_addr;
  llvm_cbe_call1 = pad_two(_124, _125, (&llvm_cbe_ns));
  llvm_cbe_f2 = llvm_cbe_call1;
  _126 = llvm_cbe_g2;
  _127 = llvm_cbe_ns;
  fft(_126, _127);
  _128 = llvm_cbe_f2;
  _129 = llvm_cbe_ns;
  fft(_128, _129);
  _130 = llvm_cbe_ns;
  _131 = ((uint64_t)(uint32_t)_130);
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (struct l_unnamed_1*) alloca(sizeof(struct l_unnamed_1) * (_131));
  llvm_cbe___vla_expr0 = _131;
  ;
  ;
  ;
  llvm_cbe_i = 0;

  _132 = llvm_cbe_i;
  _133 = llvm_cbe_ns;
while (((int32_t)_132) < ((int32_t)_133)){
  _134 = llvm_cbe_g2;
  _135 = llvm_cbe_i;
  llvm_cbe_arrayidx = (&_134[((int64_t)(((int64_t)(int32_t)_135)))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  _136 = llvm_cbe_f2;
  _137 = llvm_cbe_i;
  llvm_cbe_arrayidx3 = (&_136[((int64_t)(((int64_t)(int32_t)_137)))]);
  llvm_cbe_arrayidx3_2e_real = *((&llvm_cbe_arrayidx3->field0));
  llvm_cbe_arrayidx3_2e_imag = *((&llvm_cbe_arrayidx3->field1));
  llvm_cbe_call4 = __divdc3(llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag, llvm_cbe_arrayidx3_2e_real, llvm_cbe_arrayidx3_2e_imag);
  _138 = llvm_cbe_i;
  llvm_cbe_arrayidx6 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_138)))]);
  *((&llvm_cbe_arrayidx6->field0)) = ((llvm_cbe_call4.field0));
  *((&llvm_cbe_arrayidx6->field1)) = ((llvm_cbe_call4.field1));

  _139 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_139, 1));

  _132 = llvm_cbe_i;
  _133 = llvm_cbe_ns;
}
  _140 = llvm_cbe_ns;
  fft(llvm_cbe_vla, _140);
  ;
  llvm_cbe_i7 = 0;

  _141 = llvm_cbe_i7;
  _142 = llvm_cbe_ns;
while (((int32_t)_141) < ((int32_t)_142)){
  _143 = llvm_cbe_i7;
  llvm_cbe_arrayidx12 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_143)))]);
  llvm_cbe_arrayidx12_2e_real = *((&llvm_cbe_arrayidx12->field0));
  llvm_cbe_arrayidx12_2e_imag = *((&llvm_cbe_arrayidx12->field1));
  *((&llvm_cbe_coerce.field0)) = llvm_cbe_arrayidx12_2e_real;
  *((&llvm_cbe_coerce.field1)) = 0;
  _144 = *((&llvm_cbe_coerce.field0));
  _145 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call13 = cabs(_144, _145);
  if ((((llvm_fcmp_olt(llvm_cbe_call13, 1.0E-10))&1))) {
  _146 = llvm_cbe_i7;
  llvm_cbe_arrayidx16 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)_146)))]);
  *((&llvm_cbe_arrayidx16->field0)) = 0;
  *((&llvm_cbe_arrayidx16->field1)) = 0;

}

  _147 = llvm_cbe_i7;
  llvm_cbe_i7 = (llvm_add_u32(_147, 1));

  _141 = llvm_cbe_i7;
  _142 = llvm_cbe_ns;
}
  ;
  llvm_cbe_i20 = 0;

  uint32_t llvm_cbe_sub;
  uint32_t llvm_cbe_sub22;
  _148 = llvm_cbe_i20;
  _149 = llvm_cbe_lf_2e_addr;
  _150 = llvm_cbe_lg_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_149, _150);
  _151 = llvm_cbe_row_len_2e_addr;
  llvm_cbe_sub22 = llvm_sub_u32((llvm_sub_u32(_149, _150)), _151);
while (((int32_t)_148) > ((int32_t)llvm_cbe_sub22)){
  _152 = llvm_cbe_i20;
  _153 = llvm_cbe_ns;
  _154 = llvm_cbe_ns;
  llvm_cbe_arrayidx26 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32(_152, _153)), _154)))))]);
  llvm_cbe_arrayidx26_2e_real = *((&llvm_cbe_arrayidx26->field0));
  llvm_cbe_arrayidx26_2e_imag = *((&llvm_cbe_arrayidx26->field1));
  llvm_cbe_call27 = __divdc3(llvm_cbe_arrayidx26_2e_real, llvm_cbe_arrayidx26_2e_imag, 32, 0);
  _155 = (llvm_cbe_call27.field1);
  _156 = llvm_cbe_out_2e_addr;
  _157 = llvm_cbe_i20;
  *((&_156[((int64_t)(((int64_t)(int32_t)(llvm_neg_u32(_157)))))])) = ((llvm_cbe_call27.field0));

  _158 = llvm_cbe_i20;
  llvm_cbe_i20 = (llvm_add_u32(_158, -1));

  _148 = llvm_cbe_i20;
  _149 = llvm_cbe_lf_2e_addr;
  _150 = llvm_cbe_lg_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_149, _150);
  _151 = llvm_cbe_row_len_2e_addr;
  llvm_cbe_sub22 = llvm_sub_u32((llvm_sub_u32(_149, _150)), _151);
}
  _159 = llvm_cbe_g2;
  free((((uint8_t*)_159)));
  _160 = llvm_cbe_f2;
  free((((uint8_t*)_160)));
  _161 = llvm_cbe_saved_stack;
}


double* unpack2(uint8_t* llvm_cbe_m, uint32_t llvm_cbe_rows, uint32_t llvm_cbe_len, uint32_t llvm_cbe_to_len) {
  uint8_t* llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_rows_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_len_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_buf;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t _162;
  uint32_t _163;
  uint8_t* llvm_cbe_call;
  uint32_t _164;
  uint32_t _165;
  uint32_t _166;
  uint32_t _167;
  uint32_t _168;
  uint8_t* _169;
  uint32_t _170;
  uint32_t _171;
  double _172;
  double* _173;
  uint32_t _174;
  uint32_t _175;
  uint32_t _176;
  uint32_t _177;
  uint32_t _178;
  double* _179;

  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  llvm_cbe_rows_2e_addr = llvm_cbe_rows;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  llvm_cbe_to_len_2e_addr = llvm_cbe_to_len;
  ;
  ;
  _162 = llvm_cbe_rows_2e_addr;
  _163 = llvm_cbe_to_len_2e_addr;
  llvm_cbe_call = calloc(8, (((int64_t)(int32_t)(llvm_mul_u32(_162, _163)))));
  llvm_cbe_buf = (((double*)llvm_cbe_call));
  ;
  llvm_cbe_i = 0;

  _164 = llvm_cbe_i;
  _165 = llvm_cbe_rows_2e_addr;
while (((int32_t)_164) < ((int32_t)_165)){
  ;
  llvm_cbe_j = 0;

  _166 = llvm_cbe_j;
  _167 = llvm_cbe_len_2e_addr;
while (((int32_t)_166) < ((int32_t)_167)){
  _168 = llvm_cbe_len_2e_addr;
  _169 = llvm_cbe_m_2e_addr;
  _170 = llvm_cbe_i;
  _171 = llvm_cbe_j;
  _172 = *((&((&(((double*)_169))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_170)), (((uint64_t)(uint32_t)_168)))))]))[((int64_t)(((int64_t)(int32_t)_171)))]));
  _173 = llvm_cbe_buf;
  _174 = llvm_cbe_i;
  _175 = llvm_cbe_to_len_2e_addr;
  _176 = llvm_cbe_j;
  *((&_173[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32(_174, _175)), _176)))))])) = _172;

  _177 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_177, 1));

  _166 = llvm_cbe_j;
  _167 = llvm_cbe_len_2e_addr;
}

  _178 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_178, 1));

  _164 = llvm_cbe_i;
  _165 = llvm_cbe_rows_2e_addr;
}
  _179 = llvm_cbe_buf;
  return _179;
}


void pack2(double* llvm_cbe_buf, uint32_t llvm_cbe_rows, uint32_t llvm_cbe_from_len, uint32_t llvm_cbe_to_len, uint8_t* llvm_cbe_out) {
  double* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_rows_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_from_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_len_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t _180;
  uint32_t _181;
  uint32_t _182;
  uint32_t _183;
  double* _184;
  uint32_t _185;
  uint32_t _186;
  uint32_t _187;
  double _188;
  uint32_t _189;
  uint8_t* _190;
  uint32_t _191;
  uint32_t _192;
  uint32_t _193;
  uint32_t _194;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_rows_2e_addr = llvm_cbe_rows;
  ;
  llvm_cbe_from_len_2e_addr = llvm_cbe_from_len;
  ;
  llvm_cbe_to_len_2e_addr = llvm_cbe_to_len;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  llvm_cbe_i = 0;

  _180 = llvm_cbe_i;
  _181 = llvm_cbe_rows_2e_addr;
while (((int32_t)_180) < ((int32_t)_181)){
  ;
  llvm_cbe_j = 0;

  _182 = llvm_cbe_j;
  _183 = llvm_cbe_to_len_2e_addr;
while (((int32_t)_182) < ((int32_t)_183)){
  _184 = llvm_cbe_buf_2e_addr;
  _185 = llvm_cbe_i;
  _186 = llvm_cbe_from_len_2e_addr;
  _187 = llvm_cbe_j;
  _188 = *((&_184[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32(_185, _186)), _187)))))]));
  _189 = llvm_cbe_to_len_2e_addr;
  _190 = llvm_cbe_out_2e_addr;
  _191 = llvm_cbe_i;
  _192 = llvm_cbe_j;
  *((&((&(((double*)_190))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_191)), (((uint64_t)(uint32_t)_189)))))]))[((int64_t)(((int64_t)(int32_t)_192)))])) = (_188 / 4);

  _193 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_193, 1));

  _182 = llvm_cbe_j;
  _183 = llvm_cbe_to_len_2e_addr;
}

  _194 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_194, 1));

  _180 = llvm_cbe_i;
  _181 = llvm_cbe_rows_2e_addr;
}
  return;
}


void deconv2(uint8_t* llvm_cbe_g, uint32_t llvm_cbe_row_g, uint32_t llvm_cbe_col_g, uint8_t* llvm_cbe_f, uint32_t llvm_cbe_row_f, uint32_t llvm_cbe_col_f, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_row_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_col_g_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_f_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_row_f_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_col_f_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_g2;    /* Address-exposed local */
  double* llvm_cbe_f2;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint8_t* _195;
  uint32_t _196;
  uint32_t _197;
  uint32_t _198;
  double* llvm_cbe_call;
  uint8_t* _199;
  uint32_t _200;
  uint32_t _201;
  uint32_t _202;
  double* llvm_cbe_call1;
  uint32_t _203;
  uint32_t _204;
  uint32_t _205;
  uint64_t _206;
  double* llvm_cbe_vla;
  double* _207;
  uint32_t _208;
  uint32_t _209;
  double* _210;
  uint32_t _211;
  uint32_t _212;
  uint32_t _213;
  uint32_t _214;
  uint32_t _215;
  uint32_t _216;
  uint32_t _217;
  uint32_t _218;
  uint8_t* _219;
  double* _220;
  double* _221;
  uint8_t* _222;

  llvm_cbe_g_2e_addr = llvm_cbe_g;
  ;
  llvm_cbe_row_g_2e_addr = llvm_cbe_row_g;
  ;
  llvm_cbe_col_g_2e_addr = llvm_cbe_col_g;
  ;
  llvm_cbe_f_2e_addr = llvm_cbe_f;
  ;
  llvm_cbe_row_f_2e_addr = llvm_cbe_row_f;
  ;
  llvm_cbe_col_f_2e_addr = llvm_cbe_col_f;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  _195 = llvm_cbe_g_2e_addr;
  _196 = llvm_cbe_row_g_2e_addr;
  _197 = llvm_cbe_col_g_2e_addr;
  _198 = llvm_cbe_col_g_2e_addr;
  llvm_cbe_call = unpack2(_195, _196, _197, _198);
  llvm_cbe_g2 = llvm_cbe_call;
  ;
  _199 = llvm_cbe_f_2e_addr;
  _200 = llvm_cbe_row_f_2e_addr;
  _201 = llvm_cbe_col_f_2e_addr;
  _202 = llvm_cbe_col_g_2e_addr;
  llvm_cbe_call1 = unpack2(_199, _200, _201, _202);
  llvm_cbe_f2 = llvm_cbe_call1;
  _203 = llvm_cbe_row_g_2e_addr;
  _204 = llvm_cbe_row_f_2e_addr;
  _205 = llvm_cbe_col_g_2e_addr;
  _206 = ((uint64_t)(uint32_t)(llvm_mul_u32((llvm_add_u32((llvm_sub_u32(_203, _204)), 1)), _205)));
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (double*) alloca(sizeof(double) * (_206));
  llvm_cbe___vla_expr0 = _206;
  ;
  ;
  _207 = llvm_cbe_g2;
  _208 = llvm_cbe_row_g_2e_addr;
  _209 = llvm_cbe_col_g_2e_addr;
  _210 = llvm_cbe_f2;
  _211 = llvm_cbe_row_f_2e_addr;
  _212 = llvm_cbe_col_g_2e_addr;
  _213 = llvm_cbe_col_g_2e_addr;
  deconv(_207, (llvm_mul_u32(_208, _209)), _210, (llvm_mul_u32(_211, _212)), llvm_cbe_vla, _213);
  _214 = llvm_cbe_row_g_2e_addr;
  _215 = llvm_cbe_row_f_2e_addr;
  _216 = llvm_cbe_col_g_2e_addr;
  _217 = llvm_cbe_col_g_2e_addr;
  _218 = llvm_cbe_col_f_2e_addr;
  _219 = llvm_cbe_out_2e_addr;
  pack2(llvm_cbe_vla, (llvm_add_u32((llvm_sub_u32(_214, _215)), 1)), _216, (llvm_add_u32((llvm_sub_u32(_217, _218)), 1)), _219);
  _220 = llvm_cbe_g2;
  free((((uint8_t*)_220)));
  _221 = llvm_cbe_f2;
  free((((uint8_t*)_221)));
  _222 = llvm_cbe_saved_stack;
}


double* unpack3(uint8_t* llvm_cbe_m, uint32_t llvm_cbe_x, uint32_t llvm_cbe_y, uint32_t llvm_cbe_z, uint32_t llvm_cbe_to_y, uint32_t llvm_cbe_to_z) {
  uint8_t* llvm_cbe_m_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_z_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_z_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_buf;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint32_t _223;
  uint32_t _224;
  uint32_t _225;
  uint8_t* llvm_cbe_call;
  uint32_t _226;
  uint32_t _227;
  uint32_t _228;
  uint32_t _229;
  uint32_t _230;
  uint32_t _231;
  uint32_t _232;
  uint32_t _233;
  uint64_t _234;
  uint8_t* _235;
  uint32_t _236;
  uint32_t _237;
  uint32_t _238;
  double _239;
  double* _240;
  uint32_t _241;
  uint32_t _242;
  uint32_t _243;
  uint32_t _244;
  uint32_t _245;
  uint32_t _246;
  uint32_t _247;
  uint32_t _248;
  double* _249;

  llvm_cbe_m_2e_addr = llvm_cbe_m;
  ;
  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_z_2e_addr = llvm_cbe_z;
  ;
  llvm_cbe_to_y_2e_addr = llvm_cbe_to_y;
  ;
  llvm_cbe_to_z_2e_addr = llvm_cbe_to_z;
  ;
  ;
  _223 = llvm_cbe_x_2e_addr;
  _224 = llvm_cbe_to_y_2e_addr;
  _225 = llvm_cbe_to_z_2e_addr;
  llvm_cbe_call = calloc(8, (((int64_t)(int32_t)(llvm_mul_u32((llvm_mul_u32(_223, _224)), _225)))));
  llvm_cbe_buf = (((double*)llvm_cbe_call));
  ;
  llvm_cbe_i = 0;

  _226 = llvm_cbe_i;
  _227 = llvm_cbe_x_2e_addr;
while (((int32_t)_226) < ((int32_t)_227)){
  ;
  llvm_cbe_j = 0;

  _228 = llvm_cbe_j;
  _229 = llvm_cbe_y_2e_addr;
while (((int32_t)_228) < ((int32_t)_229)){
  ;
  llvm_cbe_k = 0;

  _230 = llvm_cbe_k;
  _231 = llvm_cbe_z_2e_addr;
while (((int32_t)_230) < ((int32_t)_231)){
  _232 = llvm_cbe_y_2e_addr;
  _233 = llvm_cbe_z_2e_addr;
  _234 = ((uint64_t)(uint32_t)_233);
  _235 = llvm_cbe_m_2e_addr;
  _236 = llvm_cbe_i;
  _237 = llvm_cbe_j;
  _238 = llvm_cbe_k;
  _239 = *((&((&((&(((double*)_235))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_236)), (llvm_mul_u64((((uint64_t)(uint32_t)_232)), _234)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_237)), _234)))]))[((int64_t)(((int64_t)(int32_t)_238)))]));
  _240 = llvm_cbe_buf;
  _241 = llvm_cbe_i;
  _242 = llvm_cbe_to_y_2e_addr;
  _243 = llvm_cbe_j;
  _244 = llvm_cbe_to_z_2e_addr;
  _245 = llvm_cbe_k;
  *((&_240[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32((llvm_add_u32((llvm_mul_u32(_241, _242)), _243)), _244)), _245)))))])) = _239;

  _246 = llvm_cbe_k;
  llvm_cbe_k = (llvm_add_u32(_246, 1));

  _230 = llvm_cbe_k;
  _231 = llvm_cbe_z_2e_addr;
}

  _247 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_247, 1));

  _228 = llvm_cbe_j;
  _229 = llvm_cbe_y_2e_addr;
}

  _248 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_248, 1));

  _226 = llvm_cbe_i;
  _227 = llvm_cbe_x_2e_addr;
}
  _249 = llvm_cbe_buf;
  return _249;
}


void pack3(double* llvm_cbe_buf, uint32_t llvm_cbe_x, uint32_t llvm_cbe_y, uint32_t llvm_cbe_z, uint32_t llvm_cbe_to_y, uint32_t llvm_cbe_to_z, uint8_t* llvm_cbe_out) {
  double* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_x_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_z_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_y_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_to_z_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint32_t _250;
  uint32_t _251;
  uint32_t _252;
  uint32_t _253;
  uint32_t _254;
  uint32_t _255;
  double* _256;
  uint32_t _257;
  uint32_t _258;
  uint32_t _259;
  uint32_t _260;
  uint32_t _261;
  double _262;
  uint32_t _263;
  uint32_t _264;
  uint64_t _265;
  uint8_t* _266;
  uint32_t _267;
  uint32_t _268;
  uint32_t _269;
  uint32_t _270;
  uint32_t _271;
  uint32_t _272;

  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_x_2e_addr = llvm_cbe_x;
  ;
  llvm_cbe_y_2e_addr = llvm_cbe_y;
  ;
  llvm_cbe_z_2e_addr = llvm_cbe_z;
  ;
  llvm_cbe_to_y_2e_addr = llvm_cbe_to_y;
  ;
  llvm_cbe_to_z_2e_addr = llvm_cbe_to_z;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  llvm_cbe_i = 0;

  _250 = llvm_cbe_i;
  _251 = llvm_cbe_x_2e_addr;
while (((int32_t)_250) < ((int32_t)_251)){
  ;
  llvm_cbe_j = 0;

  _252 = llvm_cbe_j;
  _253 = llvm_cbe_to_y_2e_addr;
while (((int32_t)_252) < ((int32_t)_253)){
  ;
  llvm_cbe_k = 0;

  _254 = llvm_cbe_k;
  _255 = llvm_cbe_to_z_2e_addr;
while (((int32_t)_254) < ((int32_t)_255)){
  _256 = llvm_cbe_buf_2e_addr;
  _257 = llvm_cbe_i;
  _258 = llvm_cbe_y_2e_addr;
  _259 = llvm_cbe_j;
  _260 = llvm_cbe_z_2e_addr;
  _261 = llvm_cbe_k;
  _262 = *((&_256[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32((llvm_add_u32((llvm_mul_u32(_257, _258)), _259)), _260)), _261)))))]));
  _263 = llvm_cbe_to_y_2e_addr;
  _264 = llvm_cbe_to_z_2e_addr;
  _265 = ((uint64_t)(uint32_t)_264);
  _266 = llvm_cbe_out_2e_addr;
  _267 = llvm_cbe_i;
  _268 = llvm_cbe_j;
  _269 = llvm_cbe_k;
  *((&((&((&(((double*)_266))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_267)), (llvm_mul_u64((((uint64_t)(uint32_t)_263)), _265)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_268)), _265)))]))[((int64_t)(((int64_t)(int32_t)_269)))])) = (_262 / 4);

  _270 = llvm_cbe_k;
  llvm_cbe_k = (llvm_add_u32(_270, 1));

  _254 = llvm_cbe_k;
  _255 = llvm_cbe_to_z_2e_addr;
}

  _271 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_271, 1));

  _252 = llvm_cbe_j;
  _253 = llvm_cbe_to_y_2e_addr;
}

  _272 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_272, 1));

  _250 = llvm_cbe_i;
  _251 = llvm_cbe_x_2e_addr;
}
  return;
}


void deconv3(uint8_t* llvm_cbe_g, uint32_t llvm_cbe_gx, uint32_t llvm_cbe_gy, uint32_t llvm_cbe_gz, uint8_t* llvm_cbe_f, uint32_t llvm_cbe_fx, uint32_t llvm_cbe_fy, uint32_t llvm_cbe_fz, uint8_t* llvm_cbe_out) {
  uint8_t* llvm_cbe_g_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_gx_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_gy_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_gz_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_f_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_fx_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_fy_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_fz_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_out_2e_addr;    /* Address-exposed local */
  double* llvm_cbe_g2;    /* Address-exposed local */
  double* llvm_cbe_f2;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint8_t* _273;
  uint32_t _274;
  uint32_t _275;
  uint32_t _276;
  uint32_t _277;
  uint32_t _278;
  double* llvm_cbe_call;
  uint8_t* _279;
  uint32_t _280;
  uint32_t _281;
  uint32_t _282;
  uint32_t _283;
  uint32_t _284;
  double* llvm_cbe_call1;
  uint32_t _285;
  uint32_t _286;
  uint32_t _287;
  uint32_t _288;
  uint64_t _289;
  double* llvm_cbe_vla;
  double* _290;
  uint32_t _291;
  uint32_t _292;
  uint32_t _293;
  double* _294;
  uint32_t _295;
  uint32_t _296;
  uint32_t _297;
  uint32_t _298;
  uint32_t _299;
  uint32_t _300;
  uint32_t _301;
  uint32_t _302;
  uint32_t _303;
  uint32_t _304;
  uint32_t _305;
  uint32_t _306;
  uint32_t _307;
  uint8_t* _308;
  double* _309;
  double* _310;
  uint8_t* _311;

  llvm_cbe_g_2e_addr = llvm_cbe_g;
  ;
  llvm_cbe_gx_2e_addr = llvm_cbe_gx;
  ;
  llvm_cbe_gy_2e_addr = llvm_cbe_gy;
  ;
  llvm_cbe_gz_2e_addr = llvm_cbe_gz;
  ;
  llvm_cbe_f_2e_addr = llvm_cbe_f;
  ;
  llvm_cbe_fx_2e_addr = llvm_cbe_fx;
  ;
  llvm_cbe_fy_2e_addr = llvm_cbe_fy;
  ;
  llvm_cbe_fz_2e_addr = llvm_cbe_fz;
  ;
  llvm_cbe_out_2e_addr = llvm_cbe_out;
  ;
  ;
  _273 = llvm_cbe_g_2e_addr;
  _274 = llvm_cbe_gx_2e_addr;
  _275 = llvm_cbe_gy_2e_addr;
  _276 = llvm_cbe_gz_2e_addr;
  _277 = llvm_cbe_gy_2e_addr;
  _278 = llvm_cbe_gz_2e_addr;
  llvm_cbe_call = unpack3(_273, _274, _275, _276, _277, _278);
  llvm_cbe_g2 = llvm_cbe_call;
  ;
  _279 = llvm_cbe_f_2e_addr;
  _280 = llvm_cbe_fx_2e_addr;
  _281 = llvm_cbe_fy_2e_addr;
  _282 = llvm_cbe_fz_2e_addr;
  _283 = llvm_cbe_gy_2e_addr;
  _284 = llvm_cbe_gz_2e_addr;
  llvm_cbe_call1 = unpack3(_279, _280, _281, _282, _283, _284);
  llvm_cbe_f2 = llvm_cbe_call1;
  _285 = llvm_cbe_gx_2e_addr;
  _286 = llvm_cbe_fx_2e_addr;
  _287 = llvm_cbe_gy_2e_addr;
  _288 = llvm_cbe_gz_2e_addr;
  _289 = ((uint64_t)(uint32_t)(llvm_mul_u32((llvm_mul_u32((llvm_add_u32((llvm_sub_u32(_285, _286)), 1)), _287)), _288)));
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (double*) alloca(sizeof(double) * (_289));
  llvm_cbe___vla_expr0 = _289;
  ;
  ;
  _290 = llvm_cbe_g2;
  _291 = llvm_cbe_gx_2e_addr;
  _292 = llvm_cbe_gy_2e_addr;
  _293 = llvm_cbe_gz_2e_addr;
  _294 = llvm_cbe_f2;
  _295 = llvm_cbe_fx_2e_addr;
  _296 = llvm_cbe_gy_2e_addr;
  _297 = llvm_cbe_gz_2e_addr;
  _298 = llvm_cbe_gy_2e_addr;
  _299 = llvm_cbe_gz_2e_addr;
  deconv(_290, (llvm_mul_u32((llvm_mul_u32(_291, _292)), _293)), _294, (llvm_mul_u32((llvm_mul_u32(_295, _296)), _297)), llvm_cbe_vla, (llvm_mul_u32(_298, _299)));
  _300 = llvm_cbe_gx_2e_addr;
  _301 = llvm_cbe_fx_2e_addr;
  _302 = llvm_cbe_gy_2e_addr;
  _303 = llvm_cbe_gz_2e_addr;
  _304 = llvm_cbe_gy_2e_addr;
  _305 = llvm_cbe_fy_2e_addr;
  _306 = llvm_cbe_gz_2e_addr;
  _307 = llvm_cbe_fz_2e_addr;
  _308 = llvm_cbe_out_2e_addr;
  pack3(llvm_cbe_vla, (llvm_add_u32((llvm_sub_u32(_300, _301)), 1)), _302, _303, (llvm_add_u32((llvm_sub_u32(_304, _305)), 1)), (llvm_add_u32((llvm_sub_u32(_306, _307)), 1)), _308);
  _309 = llvm_cbe_g2;
  free((((uint8_t*)_309)));
  _310 = llvm_cbe_f2;
  free((((uint8_t*)_310)));
  _311 = llvm_cbe_saved_stack;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_2_struct_AC_l_array_3_struct_AC_l_array_4_double llvm_cbe_h __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_hx;    /* Address-exposed local */
  uint32_t llvm_cbe_hy;    /* Address-exposed local */
  uint32_t llvm_cbe_hz;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_struct_AC_l_array_2_struct_AC_l_array_3_double llvm_cbe_f __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_fx;    /* Address-exposed local */
  uint32_t llvm_cbe_fy;    /* Address-exposed local */
  uint32_t llvm_cbe_fz;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_struct_AC_l_array_4_struct_AC_l_array_6_double llvm_cbe_g __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_gx;    /* Address-exposed local */
  uint32_t llvm_cbe_gy;    /* Address-exposed local */
  uint32_t llvm_cbe_gz;    /* Address-exposed local */
  uint8_t* llvm_cbe_saved_stack;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr0;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr1;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr2;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_k;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr3;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr4;    /* Address-exposed local */
  uint64_t llvm_cbe___vla_expr5;    /* Address-exposed local */
  uint32_t llvm_cbe_i44;    /* Address-exposed local */
  uint32_t llvm_cbe_j50;    /* Address-exposed local */
  uint32_t llvm_cbe_k56;    /* Address-exposed local */
  double llvm_cbe_call;
  uint8_t* _312;
  uint8_t* _313;
  uint8_t* _314;
  uint32_t _315;
  uint32_t _316;
  uint64_t _317;
  uint32_t _318;
  uint32_t _319;
  uint64_t _320;
  uint32_t _321;
  uint32_t _322;
  uint64_t _323;
  double* llvm_cbe_vla;
  uint32_t _324;
  uint32_t _325;
  uint32_t _326;
  uint32_t _327;
  uint32_t _328;
  uint32_t _329;
  uint32_t llvm_cbe_call6;
  uint32_t _330;
  uint32_t _331;
  uint32_t _332;
  uint32_t _333;
  uint32_t _334;
  uint32_t _335;
  uint32_t _336;
  uint32_t _337;
  uint32_t _338;
  uint32_t _339;
  uint32_t _340;
  uint32_t _341;
  double _342;
  uint32_t llvm_cbe_call23;
  uint32_t _343;
  uint32_t llvm_cbe_call24;
  uint32_t _344;
  uint32_t _345;
  uint32_t _346;
  uint32_t _347;
  uint32_t llvm_cbe_call30;
  uint32_t _348;
  uint32_t _349;
  uint32_t _350;
  uint64_t _351;
  uint32_t _352;
  uint32_t _353;
  uint64_t _354;
  uint32_t _355;
  uint32_t _356;
  uint64_t _357;
  double* llvm_cbe_vla40;
  uint32_t _358;
  uint32_t _359;
  uint32_t _360;
  uint32_t _361;
  uint32_t _362;
  uint32_t _363;
  uint32_t llvm_cbe_call43;
  uint32_t _364;
  uint32_t _365;
  uint32_t _366;
  uint32_t _367;
  uint32_t _368;
  uint32_t _369;
  uint32_t _370;
  uint32_t _371;
  uint32_t _372;
  uint32_t _373;
  uint32_t _374;
  uint32_t _375;
  double _376;
  uint32_t llvm_cbe_call68;
  uint32_t _377;
  uint32_t llvm_cbe_call72;
  uint32_t _378;
  uint32_t _379;
  uint32_t _380;
  uint32_t _381;
  uint32_t llvm_cbe_call79;
  uint32_t _382;
  uint8_t* _383;
  uint32_t _384;

  llvm_cbe_retval = 0;
  llvm_cbe_call = atan2(1, 1);
  PI = (llvm_cbe_call * 4);
  ;
  _312 = memcpy((((uint8_t*)(&llvm_cbe_h))), ((uint8_t*)(&__const_OC_main_OC_h)), 192);
  ;
  llvm_cbe_hx = 2;
  ;
  llvm_cbe_hy = 3;
  ;
  llvm_cbe_hz = 4;
  ;
  _313 = memcpy((((uint8_t*)(&llvm_cbe_f))), ((uint8_t*)(&__const_OC_main_OC_f)), 144);
  ;
  llvm_cbe_fx = 3;
  ;
  llvm_cbe_fy = 2;
  ;
  llvm_cbe_fz = 3;
  ;
  _314 = memcpy((((uint8_t*)(&llvm_cbe_g))), ((uint8_t*)(&__const_OC_main_OC_g)), 768);
  ;
  llvm_cbe_gx = 4;
  ;
  llvm_cbe_gy = 4;
  ;
  llvm_cbe_gz = 6;
  _315 = llvm_cbe_gx;
  _316 = llvm_cbe_fx;
  _317 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(_315, _316)), 1)));
  _318 = llvm_cbe_gy;
  _319 = llvm_cbe_fy;
  _320 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(_318, _319)), 1)));
  _321 = llvm_cbe_gz;
  _322 = llvm_cbe_fz;
  _323 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(_321, _322)), 1)));
  llvm_cbe_saved_stack = ((uint8_t*)/*NULL*/0);
  llvm_cbe_vla = (double*) alloca(sizeof(double) * ((llvm_mul_u64((llvm_mul_u64(_317, _320)), _323))));
  llvm_cbe___vla_expr0 = _317;
  llvm_cbe___vla_expr1 = _320;
  llvm_cbe___vla_expr2 = _323;
  ;
  ;
  ;
  ;
  _324 = llvm_cbe_gx;
  _325 = llvm_cbe_gy;
  _326 = llvm_cbe_gz;
  _327 = llvm_cbe_fx;
  _328 = llvm_cbe_fy;
  _329 = llvm_cbe_fz;
  deconv3((((uint8_t*)((&llvm_cbe_g.array[((int64_t)0)])))), _324, _325, _326, (((uint8_t*)((&llvm_cbe_f.array[((int64_t)0)])))), _327, _328, _329, (((uint8_t*)llvm_cbe_vla)));
  llvm_cbe_call6 = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  llvm_cbe_i = 0;

  uint32_t llvm_cbe_sub7;
  uint32_t llvm_cbe_add8;
  _330 = llvm_cbe_i;
  _331 = llvm_cbe_gx;
  _332 = llvm_cbe_fx;
  llvm_cbe_sub7 = llvm_sub_u32(_331, _332);
  llvm_cbe_add8 = llvm_add_u32((llvm_sub_u32(_331, _332)), 1);
while (((int32_t)_330) < ((int32_t)llvm_cbe_add8)){
  ;
  llvm_cbe_j = 0;

  uint32_t llvm_cbe_sub10;
  uint32_t llvm_cbe_add11;
  _333 = llvm_cbe_j;
  _334 = llvm_cbe_gy;
  _335 = llvm_cbe_fy;
  llvm_cbe_sub10 = llvm_sub_u32(_334, _335);
  llvm_cbe_add11 = llvm_add_u32((llvm_sub_u32(_334, _335)), 1);
while (((int32_t)_333) < ((int32_t)llvm_cbe_add11)){
  ;
  llvm_cbe_k = 0;

  uint32_t llvm_cbe_sub15;
  uint32_t llvm_cbe_add16;
  _336 = llvm_cbe_k;
  _337 = llvm_cbe_gz;
  _338 = llvm_cbe_fz;
  llvm_cbe_sub15 = llvm_sub_u32(_337, _338);
  llvm_cbe_add16 = llvm_add_u32((llvm_sub_u32(_337, _338)), 1);
while (((int32_t)_336) < ((int32_t)llvm_cbe_add16)){
  _339 = llvm_cbe_i;
  _340 = llvm_cbe_j;
  _341 = llvm_cbe_k;
  _342 = *((&((&((&llvm_cbe_vla[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_339)), (llvm_mul_u64(_320, _323)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_340)), _323)))]))[((int64_t)(((int64_t)(int32_t)_341)))]));
  llvm_cbe_call23 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _342);

  _343 = llvm_cbe_k;
  llvm_cbe_k = (llvm_add_u32(_343, 1));

  _336 = llvm_cbe_k;
  _337 = llvm_cbe_gz;
  _338 = llvm_cbe_fz;
  llvm_cbe_sub15 = llvm_sub_u32(_337, _338);
  llvm_cbe_add16 = llvm_add_u32((llvm_sub_u32(_337, _338)), 1);
}
  llvm_cbe_call24 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  _344 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_344, 1));

  _333 = llvm_cbe_j;
  _334 = llvm_cbe_gy;
  _335 = llvm_cbe_fy;
  llvm_cbe_sub10 = llvm_sub_u32(_334, _335);
  llvm_cbe_add11 = llvm_add_u32((llvm_sub_u32(_334, _335)), 1);
}
  _345 = llvm_cbe_i;
  _346 = llvm_cbe_gx;
  _347 = llvm_cbe_fx;
  if ((((((int32_t)_345) < ((int32_t)(llvm_sub_u32(_346, _347))))&1))) {
  llvm_cbe_call30 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

}

  _348 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_348, 1));

  _330 = llvm_cbe_i;
  _331 = llvm_cbe_gx;
  _332 = llvm_cbe_fx;
  llvm_cbe_sub7 = llvm_sub_u32(_331, _332);
  llvm_cbe_add8 = llvm_add_u32((llvm_sub_u32(_331, _332)), 1);
}
  _349 = llvm_cbe_gx;
  _350 = llvm_cbe_hx;
  _351 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(_349, _350)), 1)));
  _352 = llvm_cbe_gy;
  _353 = llvm_cbe_hy;
  _354 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(_352, _353)), 1)));
  _355 = llvm_cbe_gz;
  _356 = llvm_cbe_hz;
  _357 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(_355, _356)), 1)));
  llvm_cbe_vla40 = (double*) alloca(sizeof(double) * ((llvm_mul_u64((llvm_mul_u64(_351, _354)), _357))));
  llvm_cbe___vla_expr3 = _351;
  llvm_cbe___vla_expr4 = _354;
  llvm_cbe___vla_expr5 = _357;
  ;
  ;
  ;
  ;
  _358 = llvm_cbe_gx;
  _359 = llvm_cbe_gy;
  _360 = llvm_cbe_gz;
  _361 = llvm_cbe_hx;
  _362 = llvm_cbe_hy;
  _363 = llvm_cbe_hz;
  deconv3((((uint8_t*)((&llvm_cbe_g.array[((int64_t)0)])))), _358, _359, _360, (((uint8_t*)((&llvm_cbe_h.array[((int64_t)0)])))), _361, _362, _363, (((uint8_t*)llvm_cbe_vla40)));
  llvm_cbe_call43 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  ;
  llvm_cbe_i44 = 0;

  uint32_t llvm_cbe_sub46;
  uint32_t llvm_cbe_add47;
  _364 = llvm_cbe_i44;
  _365 = llvm_cbe_gx;
  _366 = llvm_cbe_hx;
  llvm_cbe_sub46 = llvm_sub_u32(_365, _366);
  llvm_cbe_add47 = llvm_add_u32((llvm_sub_u32(_365, _366)), 1);
while (((int32_t)_364) < ((int32_t)llvm_cbe_add47)){
  ;
  llvm_cbe_j50 = 0;

  uint32_t llvm_cbe_sub52;
  uint32_t llvm_cbe_add53;
  _367 = llvm_cbe_j50;
  _368 = llvm_cbe_gy;
  _369 = llvm_cbe_hy;
  llvm_cbe_sub52 = llvm_sub_u32(_368, _369);
  llvm_cbe_add53 = llvm_add_u32((llvm_sub_u32(_368, _369)), 1);
while (((int32_t)_367) < ((int32_t)llvm_cbe_add53)){
  ;
  llvm_cbe_k56 = 0;

  uint32_t llvm_cbe_sub58;
  uint32_t llvm_cbe_add59;
  _370 = llvm_cbe_k56;
  _371 = llvm_cbe_gz;
  _372 = llvm_cbe_hz;
  llvm_cbe_sub58 = llvm_sub_u32(_371, _372);
  llvm_cbe_add59 = llvm_add_u32((llvm_sub_u32(_371, _372)), 1);
while (((int32_t)_370) < ((int32_t)llvm_cbe_add59)){
  _373 = llvm_cbe_i44;
  _374 = llvm_cbe_j50;
  _375 = llvm_cbe_k56;
  _376 = *((&((&((&llvm_cbe_vla40[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_373)), (llvm_mul_u64(_354, _357)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)_374)), _357)))]))[((int64_t)(((int64_t)(int32_t)_375)))]));
  llvm_cbe_call68 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _376);

  _377 = llvm_cbe_k56;
  llvm_cbe_k56 = (llvm_add_u32(_377, 1));

  _370 = llvm_cbe_k56;
  _371 = llvm_cbe_gz;
  _372 = llvm_cbe_hz;
  llvm_cbe_sub58 = llvm_sub_u32(_371, _372);
  llvm_cbe_add59 = llvm_add_u32((llvm_sub_u32(_371, _372)), 1);
}
  llvm_cbe_call72 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  _378 = llvm_cbe_j50;
  llvm_cbe_j50 = (llvm_add_u32(_378, 1));

  _367 = llvm_cbe_j50;
  _368 = llvm_cbe_gy;
  _369 = llvm_cbe_hy;
  llvm_cbe_sub52 = llvm_sub_u32(_368, _369);
  llvm_cbe_add53 = llvm_add_u32((llvm_sub_u32(_368, _369)), 1);
}
  _379 = llvm_cbe_i44;
  _380 = llvm_cbe_gx;
  _381 = llvm_cbe_hx;
  if ((((((int32_t)_379) < ((int32_t)(llvm_sub_u32(_380, _381))))&1))) {
  llvm_cbe_call79 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

}

  _382 = llvm_cbe_i44;
  llvm_cbe_i44 = (llvm_add_u32(_382, 1));

  _364 = llvm_cbe_i44;
  _365 = llvm_cbe_gx;
  _366 = llvm_cbe_hx;
  llvm_cbe_sub46 = llvm_sub_u32(_365, _366);
  llvm_cbe_add47 = llvm_add_u32((llvm_sub_u32(_365, _366)), 1);
}
  _383 = llvm_cbe_saved_stack;
  _384 = llvm_cbe_retval;
  return _384;
}

