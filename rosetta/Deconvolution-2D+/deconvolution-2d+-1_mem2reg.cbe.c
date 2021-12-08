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
  struct l_unnamed_1 llvm_cbe_t;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _1;
  double llvm_cbe_mul_2e_rl;
  double llvm_cbe_mul_2e_il;
  double llvm_cbe_conv;
  double llvm_cbe_mul_r;
  double llvm_cbe_mul_i;
  struct l_unnamed_1 llvm_cbe_call;
  double _2;
  double _3;
  double llvm_cbe_real_mul_phi;
  double llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi;
  double llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_call7;
  double _4;
  double _5;
  struct l_unnamed_1 llvm_cbe_call8;
  double _6;
  double _7;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  double llvm_cbe_mul_r13;
  double llvm_cbe_mul_i14;
  struct l_unnamed_1 llvm_cbe_call19;
  double _8;
  double _9;
  double llvm_cbe_real_mul_phi21;
  double llvm_cbe_real_mul_phi21__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22;
  double llvm_cbe_imag_mul_phi22__PHI_TEMPORARY;
  struct l_unnamed_1* llvm_cbe_arrayidx24;
  double llvm_cbe_arrayidx24_2e_real;
  double llvm_cbe_arrayidx24_2e_imag;
  double llvm_cbe_t_2e_real;
  double llvm_cbe_t_2e_imag;
  struct l_unnamed_1* llvm_cbe_arrayidx28;
  struct l_unnamed_1* llvm_cbe_arrayidx30;
  double llvm_cbe_arrayidx30_2e_real;
  double llvm_cbe_arrayidx30_2e_imag;
  double llvm_cbe_t_2e_real32;
  double llvm_cbe_t_2e_imag34;
  struct l_unnamed_1* llvm_cbe_arrayidx38;
  double llvm_cbe_real_mul_phi_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted1;
  double llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_call7_2e_splitted1;
  double _10;
  double _11;
  struct l_unnamed_1 llvm_cbe_call8_2e_splitted1;
  double _12;
  double _13;
  struct l_unnamed_1* llvm_cbe_arrayidx_2e_splitted1;
  double llvm_cbe_arrayidx_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx_2e_imag_2e_splitted1;
  double llvm_cbe_mul_r13_2e_splitted1;
  double llvm_cbe_mul_i14_2e_splitted1;
  double llvm_cbe_real_mul_phi_2e_splitted2;
  double llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi_2e_splitted2;
  double llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  struct l_unnamed_1 llvm_cbe_call7_2e_splitted2;
  double _14;
  double _15;
  struct l_unnamed_1 llvm_cbe_call8_2e_splitted2;
  double _16;
  double _17;
  struct l_unnamed_1* llvm_cbe_arrayidx_2e_splitted2;
  double llvm_cbe_arrayidx_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx_2e_imag_2e_splitted2;
  double llvm_cbe_mul_r13_2e_splitted2;
  double llvm_cbe_mul_i14_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted1;
  double llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted1;
  double llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted1;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted1;
  double llvm_cbe_t_2e_real_2e_splitted1;
  double llvm_cbe_t_2e_imag_2e_splitted1;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted1;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted1;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted1;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted1;
  double llvm_cbe_t_2e_real32_2e_splitted1;
  double llvm_cbe_t_2e_imag34_2e_splitted1;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted1;
  double llvm_cbe_real_mul_phi21_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted2;
  double llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted2;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted2;
  double llvm_cbe_t_2e_real_2e_splitted2;
  double llvm_cbe_t_2e_imag_2e_splitted2;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted2;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted2;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted2;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted2;
  double llvm_cbe_t_2e_real32_2e_splitted2;
  double llvm_cbe_t_2e_imag34_2e_splitted2;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted2;
  double llvm_cbe_real_mul_phi21_2e_splitted3;
  double llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted3;
  double llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted3;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted3;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted3;
  double llvm_cbe_t_2e_real_2e_splitted3;
  double llvm_cbe_t_2e_imag_2e_splitted3;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted3;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted3;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted3;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted3;
  double llvm_cbe_t_2e_real32_2e_splitted3;
  double llvm_cbe_t_2e_imag34_2e_splitted3;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted3;
  double llvm_cbe_real_mul_phi21_2e_splitted4;
  double llvm_cbe_real_mul_phi21_2e_splitted4__PHI_TEMPORARY;
  double llvm_cbe_imag_mul_phi22_2e_splitted4;
  double llvm_cbe_imag_mul_phi22_2e_splitted4__PHI_TEMPORARY;
  struct l_unnamed_1* llvm_cbe_arrayidx24_2e_splitted4;
  double llvm_cbe_arrayidx24_2e_real_2e_splitted4;
  double llvm_cbe_arrayidx24_2e_imag_2e_splitted4;
  double llvm_cbe_t_2e_real_2e_splitted4;
  double llvm_cbe_t_2e_imag_2e_splitted4;
  struct l_unnamed_1* llvm_cbe_arrayidx28_2e_splitted4;
  struct l_unnamed_1* llvm_cbe_arrayidx30_2e_splitted4;
  double llvm_cbe_arrayidx30_2e_real_2e_splitted4;
  double llvm_cbe_arrayidx30_2e_imag_2e_splitted4;
  double llvm_cbe_t_2e_real32_2e_splitted4;
  double llvm_cbe_t_2e_imag34_2e_splitted4;
  struct l_unnamed_1* llvm_cbe_arrayidx38_2e_splitted4;

  ;
  ;
  ;
  ;
  if (!(((((int32_t)llvm_cbe_step) < ((int32_t)llvm_cbe_n))&1))) {
  _fft(llvm_cbe_out, llvm_cbe_buf, llvm_cbe_n, (llvm_mul_u32(llvm_cbe_step, 2)));
  _fft(((&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)llvm_cbe_step)))])), ((&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)llvm_cbe_step)))])), llvm_cbe_n, (llvm_mul_u32(llvm_cbe_step, 2)));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)i) < ((int32_t)llvm_cbe_n))&1))) {
  }

  ;
  _1 = PI;
  llvm_cbe_mul_2e_rl = -0 * _1;
  llvm_cbe_mul_2e_il = -1 * _1;
  llvm_cbe_conv = ((double)(int32_t)i);
  llvm_cbe_mul_r = (llvm_cbe_mul_2e_rl * llvm_cbe_conv) - (llvm_cbe_mul_2e_il * 0);
  llvm_cbe_mul_i = (llvm_cbe_mul_2e_rl * 0) + (llvm_cbe_mul_2e_il * llvm_cbe_conv);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r, llvm_cbe_mul_r))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i, llvm_cbe_mul_i))&1))) {
  llvm_cbe_call = __muldc3(llvm_cbe_mul_2e_rl, llvm_cbe_mul_2e_il, llvm_cbe_conv, 0);
  _2 = (llvm_cbe_call.field0);
  _3 = (llvm_cbe_call.field1);
  llvm_cbe_real_mul_phi__PHI_TEMPORARY = _2;   /* for PHI node */
  llvm_cbe_imag_mul_phi__PHI_TEMPORARY = _3;   /* for PHI node */

  llvm_cbe_real_mul_phi = llvm_cbe_real_mul_phi__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi = llvm_cbe_imag_mul_phi__PHI_TEMPORARY;
  llvm_cbe_call7 = __divdc3(llvm_cbe_real_mul_phi, llvm_cbe_imag_mul_phi, (((double)(int32_t)llvm_cbe_n)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7.field1));
  _4 = *((&llvm_cbe_coerce.field0));
  _5 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8 = cexp(_4, _5);
  _6 = (llvm_cbe_call8.field0);
  _7 = (llvm_cbe_call8.field1);
  llvm_cbe_arrayidx = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(i, llvm_cbe_step)))))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  llvm_cbe_mul_r13 = (_6 * llvm_cbe_arrayidx_2e_real) - (_7 * llvm_cbe_arrayidx_2e_imag);
  llvm_cbe_mul_i14 = (_6 * llvm_cbe_arrayidx_2e_imag) + (_7 * llvm_cbe_arrayidx_2e_real);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13, llvm_cbe_mul_r13))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  llvm_cbe_call19 = __muldc3(_6, _7, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _8 = (llvm_cbe_call19.field0);
  _9 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _8;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _9;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  llvm_cbe_arrayidx24_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted2 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  llvm_cbe_arrayidx30_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted2 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  llvm_cbe_arrayidx24_2e_splitted3 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted3 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  llvm_cbe_arrayidx30_2e_splitted3 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted3 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
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
  llvm_cbe_arrayidx24_2e_splitted4 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted4 = *((&llvm_cbe_arrayidx24_2e_splitted4->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted4 = *((&llvm_cbe_arrayidx24_2e_splitted4->field1));
  llvm_cbe_t_2e_real_2e_splitted4 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted4 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted4 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted4->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted4 + llvm_cbe_t_2e_real_2e_splitted4);
  *((&llvm_cbe_arrayidx28_2e_splitted4->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted4 + llvm_cbe_t_2e_imag_2e_splitted4);
  llvm_cbe_arrayidx30_2e_splitted4 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted4 = *((&llvm_cbe_arrayidx30_2e_splitted4->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted4 = *((&llvm_cbe_arrayidx30_2e_splitted4->field1));
  llvm_cbe_t_2e_real32_2e_splitted4 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted4 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted4 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted4->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted4 - llvm_cbe_t_2e_real32_2e_splitted4);
  *((&llvm_cbe_arrayidx38_2e_splitted4->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted4 - llvm_cbe_t_2e_imag34_2e_splitted4);

}
  } else {
    llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted1 = llvm_cbe_real_mul_phi_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted1 = llvm_cbe_imag_mul_phi_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_call7_2e_splitted1 = __divdc3(llvm_cbe_real_mul_phi_2e_splitted1, llvm_cbe_imag_mul_phi_2e_splitted1, (((double)(int32_t)llvm_cbe_n)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7_2e_splitted1.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7_2e_splitted1.field1));
  _10 = *((&llvm_cbe_coerce.field0));
  _11 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8_2e_splitted1 = cexp(_10, _11);
  _12 = (llvm_cbe_call8_2e_splitted1.field0);
  _13 = (llvm_cbe_call8_2e_splitted1.field1);
  llvm_cbe_arrayidx_2e_splitted1 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(i, llvm_cbe_step)))))]);
  llvm_cbe_arrayidx_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx_2e_splitted1->field0));
  llvm_cbe_arrayidx_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx_2e_splitted1->field1));
  llvm_cbe_mul_r13_2e_splitted1 = (_12 * llvm_cbe_arrayidx_2e_real_2e_splitted1) - (_13 * llvm_cbe_arrayidx_2e_imag_2e_splitted1);
  llvm_cbe_mul_i14_2e_splitted1 = (_12 * llvm_cbe_arrayidx_2e_imag_2e_splitted1) + (_13 * llvm_cbe_arrayidx_2e_real_2e_splitted1);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13_2e_splitted1, llvm_cbe_mul_r13_2e_splitted1))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
}
  llvm_cbe_call19 = __muldc3(_6, _7, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _8 = (llvm_cbe_call19.field0);
  _9 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _8;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _9;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  llvm_cbe_arrayidx24_2e_splitted3 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted3 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  llvm_cbe_arrayidx30_2e_splitted3 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted3 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  llvm_cbe_arrayidx24_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted2 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  llvm_cbe_arrayidx30_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted2 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_r13_2e_splitted2;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY = llvm_cbe_mul_i14_2e_splitted2;   /* for PHI node */
  llvm_cbe_real_mul_phi21_2e_splitted1 = llvm_cbe_real_mul_phi21_2e_splitted1__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted1 = llvm_cbe_imag_mul_phi22_2e_splitted1__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted1;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted1;
  llvm_cbe_arrayidx24_2e_splitted1 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx24_2e_splitted1->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx24_2e_splitted1->field1));
  llvm_cbe_t_2e_real_2e_splitted1 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted1 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted1 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted1->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted1 + llvm_cbe_t_2e_real_2e_splitted1);
  *((&llvm_cbe_arrayidx28_2e_splitted1->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted1 + llvm_cbe_t_2e_imag_2e_splitted1);
  llvm_cbe_arrayidx30_2e_splitted1 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted1 = *((&llvm_cbe_arrayidx30_2e_splitted1->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted1 = *((&llvm_cbe_arrayidx30_2e_splitted1->field1));
  llvm_cbe_t_2e_real32_2e_splitted1 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted1 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted1 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted1->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted1 - llvm_cbe_t_2e_real32_2e_splitted1);
  *((&llvm_cbe_arrayidx38_2e_splitted1->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted1 - llvm_cbe_t_2e_imag34_2e_splitted1);

}
}
  } else {
    llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_r;   /* for PHI node */
    llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY = llvm_cbe_mul_i;   /* for PHI node */
  llvm_cbe_real_mul_phi_2e_splitted2 = llvm_cbe_real_mul_phi_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi_2e_splitted2 = llvm_cbe_imag_mul_phi_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_call7_2e_splitted2 = __divdc3(llvm_cbe_real_mul_phi_2e_splitted2, llvm_cbe_imag_mul_phi_2e_splitted2, (((double)(int32_t)llvm_cbe_n)), 0);
  *((&llvm_cbe_coerce.field0)) = ((llvm_cbe_call7_2e_splitted2.field0));
  *((&llvm_cbe_coerce.field1)) = ((llvm_cbe_call7_2e_splitted2.field1));
  _14 = *((&llvm_cbe_coerce.field0));
  _15 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call8_2e_splitted2 = cexp(_14, _15);
  _16 = (llvm_cbe_call8_2e_splitted2.field0);
  _17 = (llvm_cbe_call8_2e_splitted2.field1);
  llvm_cbe_arrayidx_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)(llvm_add_u32(i, llvm_cbe_step)))))]);
  llvm_cbe_arrayidx_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx_2e_splitted2->field0));
  llvm_cbe_arrayidx_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx_2e_splitted2->field1));
  llvm_cbe_mul_r13_2e_splitted2 = (_16 * llvm_cbe_arrayidx_2e_real_2e_splitted2) - (_17 * llvm_cbe_arrayidx_2e_imag_2e_splitted2);
  llvm_cbe_mul_i14_2e_splitted2 = (_16 * llvm_cbe_arrayidx_2e_imag_2e_splitted2) + (_17 * llvm_cbe_arrayidx_2e_real_2e_splitted2);
  if ((((llvm_fcmp_uno(llvm_cbe_mul_r13_2e_splitted2, llvm_cbe_mul_r13_2e_splitted2))&1))) {
  if ((((llvm_fcmp_uno(llvm_cbe_mul_i14, llvm_cbe_mul_i14))&1))) {
  } else {
    llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_r13;   /* for PHI node */
    llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY = llvm_cbe_mul_i14;   /* for PHI node */
}
  llvm_cbe_call19 = __muldc3(_6, _7, llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag);
  _8 = (llvm_cbe_call19.field0);
  _9 = (llvm_cbe_call19.field1);
  llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY = _8;   /* for PHI node */
  llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY = _9;   /* for PHI node */

  llvm_cbe_real_mul_phi21_2e_splitted3 = llvm_cbe_real_mul_phi21_2e_splitted3__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted3 = llvm_cbe_imag_mul_phi22_2e_splitted3__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted3;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted3;
  llvm_cbe_arrayidx24_2e_splitted3 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx24_2e_splitted3->field1));
  llvm_cbe_t_2e_real_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted3 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted3 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted3 + llvm_cbe_t_2e_real_2e_splitted3);
  *((&llvm_cbe_arrayidx28_2e_splitted3->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted3 + llvm_cbe_t_2e_imag_2e_splitted3);
  llvm_cbe_arrayidx30_2e_splitted3 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted3 = *((&llvm_cbe_arrayidx30_2e_splitted3->field1));
  llvm_cbe_t_2e_real32_2e_splitted3 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted3 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted3 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted3 - llvm_cbe_t_2e_real32_2e_splitted3);
  *((&llvm_cbe_arrayidx38_2e_splitted3->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted3 - llvm_cbe_t_2e_imag34_2e_splitted3);

  llvm_cbe_real_mul_phi21_2e_splitted2 = llvm_cbe_real_mul_phi21_2e_splitted2__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22_2e_splitted2 = llvm_cbe_imag_mul_phi22_2e_splitted2__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21_2e_splitted2;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22_2e_splitted2;
  llvm_cbe_arrayidx24_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field0));
  llvm_cbe_arrayidx24_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx24_2e_splitted2->field1));
  llvm_cbe_t_2e_real_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag_2e_splitted2 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28_2e_splitted2 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field0)) = (llvm_cbe_arrayidx24_2e_real_2e_splitted2 + llvm_cbe_t_2e_real_2e_splitted2);
  *((&llvm_cbe_arrayidx28_2e_splitted2->field1)) = (llvm_cbe_arrayidx24_2e_imag_2e_splitted2 + llvm_cbe_t_2e_imag_2e_splitted2);
  llvm_cbe_arrayidx30_2e_splitted2 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field0));
  llvm_cbe_arrayidx30_2e_imag_2e_splitted2 = *((&llvm_cbe_arrayidx30_2e_splitted2->field1));
  llvm_cbe_t_2e_real32_2e_splitted2 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34_2e_splitted2 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38_2e_splitted2 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field0)) = (llvm_cbe_arrayidx30_2e_real_2e_splitted2 - llvm_cbe_t_2e_real32_2e_splitted2);
  *((&llvm_cbe_arrayidx38_2e_splitted2->field1)) = (llvm_cbe_arrayidx30_2e_imag_2e_splitted2 - llvm_cbe_t_2e_imag34_2e_splitted2);

  } else {
    llvm_cbe_real_mul_phi21__PHI_TEMPORARY = llvm_cbe_mul_r13_2e_splitted2;   /* for PHI node */
    llvm_cbe_imag_mul_phi22__PHI_TEMPORARY = llvm_cbe_mul_i14_2e_splitted2;   /* for PHI node */
  llvm_cbe_real_mul_phi21 = llvm_cbe_real_mul_phi21__PHI_TEMPORARY;
  llvm_cbe_imag_mul_phi22 = llvm_cbe_imag_mul_phi22__PHI_TEMPORARY;
  *((&llvm_cbe_t.field0)) = llvm_cbe_real_mul_phi21;
  *((&llvm_cbe_t.field1)) = llvm_cbe_imag_mul_phi22;
  llvm_cbe_arrayidx24 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx24_2e_real = *((&llvm_cbe_arrayidx24->field0));
  llvm_cbe_arrayidx24_2e_imag = *((&llvm_cbe_arrayidx24->field1));
  llvm_cbe_t_2e_real = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx28 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32(i, 2)))))]);
  *((&llvm_cbe_arrayidx28->field0)) = (llvm_cbe_arrayidx24_2e_real + llvm_cbe_t_2e_real);
  *((&llvm_cbe_arrayidx28->field1)) = (llvm_cbe_arrayidx24_2e_imag + llvm_cbe_t_2e_imag);
  llvm_cbe_arrayidx30 = (&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx30_2e_real = *((&llvm_cbe_arrayidx30->field0));
  llvm_cbe_arrayidx30_2e_imag = *((&llvm_cbe_arrayidx30->field1));
  llvm_cbe_t_2e_real32 = *((&llvm_cbe_t.field0));
  llvm_cbe_t_2e_imag34 = *((&llvm_cbe_t.field1));
  llvm_cbe_arrayidx38 = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_sdiv_u32((llvm_add_u32(i, llvm_cbe_n)), 2)))))]);
  *((&llvm_cbe_arrayidx38->field0)) = (llvm_cbe_arrayidx30_2e_real - llvm_cbe_t_2e_real32);
  *((&llvm_cbe_arrayidx38->field1)) = (llvm_cbe_arrayidx30_2e_imag - llvm_cbe_t_2e_imag34);

}
}

}
  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_n)){
  i = llvm_add_u32(i, (llvm_mul_u32(2, llvm_cbe_step)));
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


void fft(struct l_unnamed_1* llvm_cbe_buf, uint32_t llvm_cbe_n) {
  struct l_unnamed_1* llvm_cbe_vla;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  struct l_unnamed_1* llvm_cbe_arrayidx2;

  ;
  ;
  llvm_cbe_vla = (struct l_unnamed_1*) alloca(sizeof(struct l_unnamed_1) * ((((uint64_t)(uint32_t)llvm_cbe_n))));
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_n)){
  llvm_cbe_arrayidx = (&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  llvm_cbe_arrayidx2 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)i)))]);
  *((&llvm_cbe_arrayidx2->field0)) = llvm_cbe_arrayidx_2e_real;
  *((&llvm_cbe_arrayidx2->field1)) = llvm_cbe_arrayidx_2e_imag;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  _fft(llvm_cbe_buf, llvm_cbe_vla, llvm_cbe_n, 1);
}


struct l_unnamed_1* pad_two(double* llvm_cbe_g, uint32_t llvm_cbe_len, uint32_t* llvm_cbe_ns) {
  uint32_t _18;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call;
  struct l_unnamed_1* buf;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _19;
  struct l_unnamed_1* llvm_cbe_arrayidx4;

  ;
  ;
  ;
  ;
  _18 = *llvm_cbe_ns;
  if ((((_18 != 0u)&1))) {
  n = *llvm_cbe_ns;
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  } else {
  n__PHI_TEMPORARY = 1;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)n) < ((int32_t)llvm_cbe_len))&1))) {
  }

  n = llvm_mul_u32(n, 2);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  n__PHI_TEMPORARY = n;   /* for PHI node */

}
  n = n__PHI_TEMPORARY;
  ;
while (((int32_t)n) < ((int32_t)llvm_cbe_len)){
  n = n__PHI_TEMPORARY;
  ;
}
  n = n__PHI_TEMPORARY;
  ;
  llvm_cbe_call = calloc(16, (((int64_t)(int32_t)n)));
  buf = ((struct l_unnamed_1*)llvm_cbe_call);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_len)){
  _19 = *((&llvm_cbe_g[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_arrayidx4 = (&buf[((int64_t)(((int64_t)(int32_t)i)))]);
  *((&llvm_cbe_arrayidx4->field0)) = _19;
  *((&llvm_cbe_arrayidx4->field1)) = 0;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  *llvm_cbe_ns = n;
  return buf;
}


void deconv(double* llvm_cbe_g, uint32_t llvm_cbe_lg, double* llvm_cbe_f, uint32_t llvm_cbe_lf, double* llvm_cbe_out, uint32_t llvm_cbe_row_len) {
  uint32_t llvm_cbe_ns;    /* Address-exposed local */
  struct l_unnamed_1 llvm_cbe_coerce;    /* Address-exposed local */
  struct l_unnamed_1* g2;
  struct l_unnamed_1* f2;
  uint32_t _20;
  uint32_t _21;
  uint32_t _22;
  struct l_unnamed_1* llvm_cbe_vla;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t _23;
  struct l_unnamed_1* llvm_cbe_arrayidx;
  double llvm_cbe_arrayidx_2e_real;
  double llvm_cbe_arrayidx_2e_imag;
  struct l_unnamed_1* llvm_cbe_arrayidx3;
  double llvm_cbe_arrayidx3_2e_real;
  double llvm_cbe_arrayidx3_2e_imag;
  struct l_unnamed_1 llvm_cbe_call4;
  struct l_unnamed_1* llvm_cbe_arrayidx6;
  uint32_t _24;
  uint32_t _25;
  struct l_unnamed_1* llvm_cbe_arrayidx12;
  double llvm_cbe_arrayidx12_2e_real;
  double llvm_cbe_arrayidx12_2e_imag;
  double _26;
  double _27;
  double llvm_cbe_call13;
  struct l_unnamed_1* llvm_cbe_arrayidx16;
  uint32_t _28;
  uint32_t _29;
  struct l_unnamed_1* llvm_cbe_arrayidx26;
  double llvm_cbe_arrayidx26_2e_real;
  double llvm_cbe_arrayidx26_2e_imag;
  struct l_unnamed_1 llvm_cbe_call27;
  double _30;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_ns = 0;
  g2 = pad_two(llvm_cbe_g, llvm_cbe_lg, (&llvm_cbe_ns));
  ;
  f2 = pad_two(llvm_cbe_f, llvm_cbe_lf, (&llvm_cbe_ns));
  ;
  _20 = llvm_cbe_ns;
  fft(g2, _20);
  _21 = llvm_cbe_ns;
  fft(f2, _21);
  _22 = llvm_cbe_ns;
  llvm_cbe_vla = (struct l_unnamed_1*) alloca(sizeof(struct l_unnamed_1) * ((((uint64_t)(uint32_t)_22))));
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _23 = llvm_cbe_ns;
while (((int32_t)i) < ((int32_t)_23)){
  llvm_cbe_arrayidx = (&g2[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx_2e_real = *((&llvm_cbe_arrayidx->field0));
  llvm_cbe_arrayidx_2e_imag = *((&llvm_cbe_arrayidx->field1));
  llvm_cbe_arrayidx3 = (&f2[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx3_2e_real = *((&llvm_cbe_arrayidx3->field0));
  llvm_cbe_arrayidx3_2e_imag = *((&llvm_cbe_arrayidx3->field1));
  llvm_cbe_call4 = __divdc3(llvm_cbe_arrayidx_2e_real, llvm_cbe_arrayidx_2e_imag, llvm_cbe_arrayidx3_2e_real, llvm_cbe_arrayidx3_2e_imag);
  llvm_cbe_arrayidx6 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)i)))]);
  *((&llvm_cbe_arrayidx6->field0)) = ((llvm_cbe_call4.field0));
  *((&llvm_cbe_arrayidx6->field1)) = ((llvm_cbe_call4.field1));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _23 = llvm_cbe_ns;
}
  _24 = llvm_cbe_ns;
  fft(llvm_cbe_vla, _24);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _25 = llvm_cbe_ns;
while (((int32_t)i) < ((int32_t)_25)){
  llvm_cbe_arrayidx12 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)i)))]);
  llvm_cbe_arrayidx12_2e_real = *((&llvm_cbe_arrayidx12->field0));
  llvm_cbe_arrayidx12_2e_imag = *((&llvm_cbe_arrayidx12->field1));
  *((&llvm_cbe_coerce.field0)) = llvm_cbe_arrayidx12_2e_real;
  *((&llvm_cbe_coerce.field1)) = 0;
  _26 = *((&llvm_cbe_coerce.field0));
  _27 = *((&llvm_cbe_coerce.field1));
  llvm_cbe_call13 = cabs(_26, _27);
  if ((((llvm_fcmp_olt(llvm_cbe_call13, 1.0E-10))&1))) {
  llvm_cbe_arrayidx16 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)i)))]);
  *((&llvm_cbe_arrayidx16->field0)) = 0;
  *((&llvm_cbe_arrayidx16->field1)) = 0;

}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  _25 = llvm_cbe_ns;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub;
  uint32_t llvm_cbe_sub22;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_lf, llvm_cbe_lg);
  llvm_cbe_sub22 = llvm_sub_u32((llvm_sub_u32(llvm_cbe_lf, llvm_cbe_lg)), llvm_cbe_row_len);
while (((int32_t)i) > ((int32_t)llvm_cbe_sub22)){
  _28 = llvm_cbe_ns;
  _29 = llvm_cbe_ns;
  llvm_cbe_arrayidx26 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32(i, _28)), _29)))))]);
  llvm_cbe_arrayidx26_2e_real = *((&llvm_cbe_arrayidx26->field0));
  llvm_cbe_arrayidx26_2e_imag = *((&llvm_cbe_arrayidx26->field1));
  llvm_cbe_call27 = __divdc3(llvm_cbe_arrayidx26_2e_real, llvm_cbe_arrayidx26_2e_imag, 32, 0);
  _30 = (llvm_cbe_call27.field1);
  *((&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)(llvm_neg_u32(i)))))])) = ((llvm_cbe_call27.field0));

  i = llvm_add_u32(i, -1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_lf, llvm_cbe_lg);
  llvm_cbe_sub22 = llvm_sub_u32((llvm_sub_u32(llvm_cbe_lf, llvm_cbe_lg)), llvm_cbe_row_len);
}
  free((((uint8_t*)g2)));
  free((((uint8_t*)f2)));
}


double* unpack2(uint8_t* llvm_cbe_m, uint32_t llvm_cbe_rows, uint32_t llvm_cbe_len, uint32_t llvm_cbe_to_len) {
  uint8_t* llvm_cbe_call;
  double* buf;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  double _31;

  ;
  ;
  ;
  ;
  llvm_cbe_call = calloc(8, (((int64_t)(int32_t)(llvm_mul_u32(llvm_cbe_rows, llvm_cbe_to_len)))));
  buf = ((double*)llvm_cbe_call);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_rows)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_len)){
  _31 = *((&((&(((double*)llvm_cbe_m))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)i)), (((uint64_t)(uint32_t)llvm_cbe_len)))))]))[((int64_t)(((int64_t)(int32_t)j)))]));
  *((&buf[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32(i, llvm_cbe_to_len)), j)))))])) = _31;

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return buf;
}


void pack2(double* llvm_cbe_buf, uint32_t llvm_cbe_rows, uint32_t llvm_cbe_from_len, uint32_t llvm_cbe_to_len, uint8_t* llvm_cbe_out) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  double _32;

  ;
  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_rows)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_to_len)){
  _32 = *((&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32(i, llvm_cbe_from_len)), j)))))]));
  *((&((&(((double*)llvm_cbe_out))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)i)), (((uint64_t)(uint32_t)llvm_cbe_to_len)))))]))[((int64_t)(((int64_t)(int32_t)j)))])) = (_32 / 4);

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


void deconv2(uint8_t* llvm_cbe_g, uint32_t llvm_cbe_row_g, uint32_t llvm_cbe_col_g, uint8_t* llvm_cbe_f, uint32_t llvm_cbe_row_f, uint32_t llvm_cbe_col_f, uint8_t* llvm_cbe_out) {
  double* g2;
  double* f2;
  double* llvm_cbe_vla;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  g2 = unpack2(llvm_cbe_g, llvm_cbe_row_g, llvm_cbe_col_g, llvm_cbe_col_g);
  ;
  f2 = unpack2(llvm_cbe_f, llvm_cbe_row_f, llvm_cbe_col_f, llvm_cbe_col_g);
  ;
  llvm_cbe_vla = (double*) alloca(sizeof(double) * ((((uint64_t)(uint32_t)(llvm_mul_u32((llvm_add_u32((llvm_sub_u32(llvm_cbe_row_g, llvm_cbe_row_f)), 1)), llvm_cbe_col_g))))));
  ;
  ;
  deconv(g2, (llvm_mul_u32(llvm_cbe_row_g, llvm_cbe_col_g)), f2, (llvm_mul_u32(llvm_cbe_row_f, llvm_cbe_col_g)), llvm_cbe_vla, llvm_cbe_col_g);
  pack2(llvm_cbe_vla, (llvm_add_u32((llvm_sub_u32(llvm_cbe_row_g, llvm_cbe_row_f)), 1)), llvm_cbe_col_g, (llvm_add_u32((llvm_sub_u32(llvm_cbe_col_g, llvm_cbe_col_f)), 1)), llvm_cbe_out);
  free((((uint8_t*)g2)));
  free((((uint8_t*)f2)));
}


double* unpack3(uint8_t* llvm_cbe_m, uint32_t llvm_cbe_x, uint32_t llvm_cbe_y, uint32_t llvm_cbe_z, uint32_t llvm_cbe_to_y, uint32_t llvm_cbe_to_z) {
  uint8_t* llvm_cbe_call;
  double* buf;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  uint64_t _33;
  double _34;

  ;
  ;
  ;
  ;
  ;
  ;
  llvm_cbe_call = calloc(8, (((int64_t)(int32_t)(llvm_mul_u32((llvm_mul_u32(llvm_cbe_x, llvm_cbe_to_y)), llvm_cbe_to_z)))));
  buf = ((double*)llvm_cbe_call);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_x)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_y)){
  ;
  k__PHI_TEMPORARY = 0;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
while (((int32_t)k) < ((int32_t)llvm_cbe_z)){
  _33 = ((uint64_t)(uint32_t)llvm_cbe_z);
  _34 = *((&((&((&(((double*)llvm_cbe_m))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)i)), (llvm_mul_u64((((uint64_t)(uint32_t)llvm_cbe_y)), _33)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)j)), _33)))]))[((int64_t)(((int64_t)(int32_t)k)))]));
  *((&buf[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32((llvm_add_u32((llvm_mul_u32(i, llvm_cbe_to_y)), j)), llvm_cbe_to_z)), k)))))])) = _34;

  k = llvm_add_u32(k, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
}

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return buf;
}


void pack3(double* llvm_cbe_buf, uint32_t llvm_cbe_x, uint32_t llvm_cbe_y, uint32_t llvm_cbe_z, uint32_t llvm_cbe_to_y, uint32_t llvm_cbe_to_z, uint8_t* llvm_cbe_out) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  double _35;
  uint64_t _36;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)llvm_cbe_x)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)llvm_cbe_to_y)){
  ;
  k__PHI_TEMPORARY = 0;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
while (((int32_t)k) < ((int32_t)llvm_cbe_to_z)){
  _35 = *((&llvm_cbe_buf[((int64_t)(((int64_t)(int32_t)(llvm_add_u32((llvm_mul_u32((llvm_add_u32((llvm_mul_u32(i, llvm_cbe_y)), j)), llvm_cbe_z)), k)))))]));
  _36 = ((uint64_t)(uint32_t)llvm_cbe_to_z);
  *((&((&((&(((double*)llvm_cbe_out))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)i)), (llvm_mul_u64((((uint64_t)(uint32_t)llvm_cbe_to_y)), _36)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)j)), _36)))]))[((int64_t)(((int64_t)(int32_t)k)))])) = (_35 / 4);

  k = llvm_add_u32(k, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
}

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return;
}


void deconv3(uint8_t* llvm_cbe_g, uint32_t llvm_cbe_gx, uint32_t llvm_cbe_gy, uint32_t llvm_cbe_gz, uint8_t* llvm_cbe_f, uint32_t llvm_cbe_fx, uint32_t llvm_cbe_fy, uint32_t llvm_cbe_fz, uint8_t* llvm_cbe_out) {
  double* g2;
  double* f2;
  double* llvm_cbe_vla;

  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  g2 = unpack3(llvm_cbe_g, llvm_cbe_gx, llvm_cbe_gy, llvm_cbe_gz, llvm_cbe_gy, llvm_cbe_gz);
  ;
  f2 = unpack3(llvm_cbe_f, llvm_cbe_fx, llvm_cbe_fy, llvm_cbe_fz, llvm_cbe_gy, llvm_cbe_gz);
  ;
  llvm_cbe_vla = (double*) alloca(sizeof(double) * ((((uint64_t)(uint32_t)(llvm_mul_u32((llvm_mul_u32((llvm_add_u32((llvm_sub_u32(llvm_cbe_gx, llvm_cbe_fx)), 1)), llvm_cbe_gy)), llvm_cbe_gz))))));
  ;
  ;
  deconv(g2, (llvm_mul_u32((llvm_mul_u32(llvm_cbe_gx, llvm_cbe_gy)), llvm_cbe_gz)), f2, (llvm_mul_u32((llvm_mul_u32(llvm_cbe_fx, llvm_cbe_gy)), llvm_cbe_gz)), llvm_cbe_vla, (llvm_mul_u32(llvm_cbe_gy, llvm_cbe_gz)));
  pack3(llvm_cbe_vla, (llvm_add_u32((llvm_sub_u32(llvm_cbe_gx, llvm_cbe_fx)), 1)), llvm_cbe_gy, llvm_cbe_gz, (llvm_add_u32((llvm_sub_u32(llvm_cbe_gy, llvm_cbe_fy)), 1)), (llvm_add_u32((llvm_sub_u32(llvm_cbe_gz, llvm_cbe_fz)), 1)), llvm_cbe_out);
  free((((uint8_t*)g2)));
  free((((uint8_t*)f2)));
}


int main(void) {
  __MSALIGN__(16) struct l_array_2_struct_AC_l_array_3_struct_AC_l_array_4_double llvm_cbe_h __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_3_struct_AC_l_array_2_struct_AC_l_array_3_double llvm_cbe_f __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_4_struct_AC_l_array_4_struct_AC_l_array_6_double llvm_cbe_g __attribute__((aligned(16)));    /* Address-exposed local */
  double llvm_cbe_call;
  uint8_t* _37;
  uint8_t* _38;
  uint8_t* _39;
  uint64_t __vla_expr1;
  uint64_t __vla_expr2;
  double* llvm_cbe_vla;
  uint32_t llvm_cbe_call6;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t k;
  uint32_t k__PHI_TEMPORARY;
  double _40;
  uint32_t llvm_cbe_call23;
  uint32_t llvm_cbe_call24;
  uint32_t llvm_cbe_call30;
  uint64_t __vla_expr4;
  uint64_t __vla_expr5;
  double* llvm_cbe_vla40;
  uint32_t llvm_cbe_call43;
  double _41;
  uint32_t llvm_cbe_call68;
  uint32_t llvm_cbe_call72;
  uint32_t llvm_cbe_call79;

  llvm_cbe_call = atan2(1, 1);
  PI = (llvm_cbe_call * 4);
  ;
  _37 = memcpy((((uint8_t*)(&llvm_cbe_h))), ((uint8_t*)(&__const_OC_main_OC_h)), 192);
  ;
  ;
  ;
  ;
  _38 = memcpy((((uint8_t*)(&llvm_cbe_f))), ((uint8_t*)(&__const_OC_main_OC_f)), 144);
  ;
  ;
  ;
  ;
  _39 = memcpy((((uint8_t*)(&llvm_cbe_g))), ((uint8_t*)(&__const_OC_main_OC_g)), 768);
  ;
  ;
  ;
  __vla_expr1 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(4, 2)), 1)));
  __vla_expr2 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(6, 3)), 1)));
  llvm_cbe_vla = (double*) alloca(sizeof(double) * ((llvm_mul_u64((llvm_mul_u64((((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(4, 3)), 1)))), __vla_expr1)), __vla_expr2))));
  ;
  ;
  ;
  ;
  deconv3((((uint8_t*)((&llvm_cbe_g.array[((int64_t)0)])))), 4, 4, 6, (((uint8_t*)((&llvm_cbe_f.array[((int64_t)0)])))), 3, 2, 3, (((uint8_t*)llvm_cbe_vla)));
  llvm_cbe_call6 = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub7;
  uint32_t llvm_cbe_add8;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub7 = llvm_sub_u32(4, 3);
  llvm_cbe_add8 = llvm_add_u32((llvm_sub_u32(4, 3)), 1);
while (((int32_t)i) < ((int32_t)llvm_cbe_add8)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub10;
  uint32_t llvm_cbe_add11;
  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_sub10 = llvm_sub_u32(4, 2);
  llvm_cbe_add11 = llvm_add_u32((llvm_sub_u32(4, 2)), 1);
while (((int32_t)j) < ((int32_t)llvm_cbe_add11)){
  ;
  k__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub15;
  uint32_t llvm_cbe_add16;
  k = k__PHI_TEMPORARY;
  ;
  llvm_cbe_sub15 = llvm_sub_u32(6, 3);
  llvm_cbe_add16 = llvm_add_u32((llvm_sub_u32(6, 3)), 1);
while (((int32_t)k) < ((int32_t)llvm_cbe_add16)){
  _40 = *((&((&((&llvm_cbe_vla[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)i)), (llvm_mul_u64(__vla_expr1, __vla_expr2)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)j)), __vla_expr2)))]))[((int64_t)(((int64_t)(int32_t)k)))]));
  llvm_cbe_call23 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _40);

  k = llvm_add_u32(k, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
  llvm_cbe_sub15 = llvm_sub_u32(6, 3);
  llvm_cbe_add16 = llvm_add_u32((llvm_sub_u32(6, 3)), 1);
}
  llvm_cbe_call24 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_sub10 = llvm_sub_u32(4, 2);
  llvm_cbe_add11 = llvm_add_u32((llvm_sub_u32(4, 2)), 1);
}
  if ((((((int32_t)i) < ((int32_t)(llvm_sub_u32(4, 3))))&1))) {
  llvm_cbe_call30 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub7 = llvm_sub_u32(4, 3);
  llvm_cbe_add8 = llvm_add_u32((llvm_sub_u32(4, 3)), 1);
}
  __vla_expr4 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(4, 3)), 1)));
  __vla_expr5 = ((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(6, 4)), 1)));
  llvm_cbe_vla40 = (double*) alloca(sizeof(double) * ((llvm_mul_u64((llvm_mul_u64((((uint64_t)(uint32_t)(llvm_add_u32((llvm_sub_u32(4, 2)), 1)))), __vla_expr4)), __vla_expr5))));
  ;
  ;
  ;
  ;
  deconv3((((uint8_t*)((&llvm_cbe_g.array[((int64_t)0)])))), 4, 4, 6, (((uint8_t*)((&llvm_cbe_h.array[((int64_t)0)])))), 2, 3, 4, (((uint8_t*)llvm_cbe_vla40)));
  llvm_cbe_call43 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub46;
  uint32_t llvm_cbe_add47;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub46 = llvm_sub_u32(4, 2);
  llvm_cbe_add47 = llvm_add_u32((llvm_sub_u32(4, 2)), 1);
while (((int32_t)i) < ((int32_t)llvm_cbe_add47)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub52;
  uint32_t llvm_cbe_add53;
  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_sub52 = llvm_sub_u32(4, 3);
  llvm_cbe_add53 = llvm_add_u32((llvm_sub_u32(4, 3)), 1);
while (((int32_t)j) < ((int32_t)llvm_cbe_add53)){
  ;
  k__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub58;
  uint32_t llvm_cbe_add59;
  k = k__PHI_TEMPORARY;
  ;
  llvm_cbe_sub58 = llvm_sub_u32(6, 4);
  llvm_cbe_add59 = llvm_add_u32((llvm_sub_u32(6, 4)), 1);
while (((int32_t)k) < ((int32_t)llvm_cbe_add59)){
  _41 = *((&((&((&llvm_cbe_vla40[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)i)), (llvm_mul_u64(__vla_expr4, __vla_expr5)))))]))[((int64_t)(llvm_mul_u64((((int64_t)(int32_t)j)), __vla_expr5)))]))[((int64_t)(((int64_t)(int32_t)k)))]));
  llvm_cbe_call68 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _41);

  k = llvm_add_u32(k, 1);
  ;
  k__PHI_TEMPORARY = k;   /* for PHI node */

  k = k__PHI_TEMPORARY;
  ;
  llvm_cbe_sub58 = llvm_sub_u32(6, 4);
  llvm_cbe_add59 = llvm_add_u32((llvm_sub_u32(6, 4)), 1);
}
  llvm_cbe_call72 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_sub52 = llvm_sub_u32(4, 3);
  llvm_cbe_add53 = llvm_add_u32((llvm_sub_u32(4, 3)), 1);
}
  if ((((((int32_t)i) < ((int32_t)(llvm_sub_u32(4, 2))))&1))) {
  llvm_cbe_call79 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub46 = llvm_sub_u32(4, 2);
  llvm_cbe_add47 = llvm_add_u32((llvm_sub_u32(4, 2)), 1);
}
  return 0;
}

