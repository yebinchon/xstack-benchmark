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


/* Global Declarations */

/* Types Declarations */
struct l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct l_array_21_double {
  double array[21];
};
struct l_array_16_double {
  double array[16];
};
struct l_array_15_uint8_t {
  uint8_t array[15];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_unnamed_1 {
  double field0;
  double field1;
};
struct l_array_6_double {
  double array[6];
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
void deconv(double*, uint32_t, double*, uint32_t, double*) __ATTRIBUTELIST__((noinline, nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
double atan2(double, double) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
double PI __ATTRIBUTE_WEAK__;
static __MSALIGN__(16) struct l_array_21_double __const_OC_main_OC_g __attribute__((aligned(16))) = { { 24, 75, 71, -34, 3, 22, -45, 23, 245, 25, 52, 25, -67, -96, 96, 31, 55, 36, 29, -43, -7 } };
static __MSALIGN__(16) struct l_array_16_double __const_OC_main_OC_f __attribute__((aligned(16))) = { { -3, -6, -1, 8, -6, 3, -1, -9, -9, 3, -2, 5, 2, -2, -7, -1 } };
static struct l_array_15_uint8_t _OC_str = { "f[] data is : " };
static struct l_array_4_uint8_t _OC_str_OC_1 = { " %g" };
static struct l_array_2_uint8_t _OC_str_OC_2 = { "\n" };
static struct l_array_15_uint8_t _OC_str_OC_3 = { "deconv(g, h): " };
static struct l_array_15_uint8_t _OC_str_OC_4 = { "h[] data is : " };
static struct l_array_15_uint8_t _OC_str_OC_5 = { "deconv(g, f): " };


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


void deconv(double* llvm_cbe_g, uint32_t llvm_cbe_lg, double* llvm_cbe_f, uint32_t llvm_cbe_lf, double* llvm_cbe_out) {
  uint32_t llvm_cbe_ns;    /* Address-exposed local */
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
  uint32_t _26;
  struct l_unnamed_1* llvm_cbe_arrayidx12;
  double llvm_cbe_arrayidx12_2e_real;
  double llvm_cbe_arrayidx12_2e_imag;
  struct l_unnamed_1 llvm_cbe_call13;
  double _27;

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

  uint32_t llvm_cbe_sub;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_lf, llvm_cbe_lg);
while (((int32_t)i) >= ((int32_t)llvm_cbe_sub)){
  _25 = llvm_cbe_ns;
  _26 = llvm_cbe_ns;
  llvm_cbe_arrayidx12 = (&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32(i, _25)), _26)))))]);
  llvm_cbe_arrayidx12_2e_real = *((&llvm_cbe_arrayidx12->field0));
  llvm_cbe_arrayidx12_2e_imag = *((&llvm_cbe_arrayidx12->field1));
  llvm_cbe_call13 = __divdc3(llvm_cbe_arrayidx12_2e_real, llvm_cbe_arrayidx12_2e_imag, 32, 0);
  _27 = (llvm_cbe_call13.field1);
  *((&llvm_cbe_out[((int64_t)(((int64_t)(int32_t)(llvm_neg_u32(i)))))])) = ((llvm_cbe_call13.field0));

  i = llvm_add_u32(i, -1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_lf, llvm_cbe_lg);
}
  free((((uint8_t*)g2)));
  free((((uint8_t*)f2)));
}


int main(void) {
  __MSALIGN__(16) struct l_array_21_double llvm_cbe_g __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_double llvm_cbe_f __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_6_double llvm_cbe_h __attribute__((aligned(16)));    /* Address-exposed local */
  double llvm_cbe_call;
  uint8_t* _28;
  uint8_t* _29;
  uint8_t* _30;
  uint8_t* _31;
  struct l_array_6_double* _32;
  double* llvm_cbe_vla;
  double* llvm_cbe_vla1;
  uint32_t llvm_cbe_call2;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  double _33;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;
  uint32_t llvm_cbe_call5;
  double _34;
  uint32_t llvm_cbe_call13;
  uint32_t llvm_cbe_call17;
  uint32_t llvm_cbe_call18;
  double _35;
  uint32_t llvm_cbe_call25;
  uint32_t llvm_cbe_call29;
  uint32_t llvm_cbe_call30;
  double _36;
  uint32_t llvm_cbe_call39;
  uint32_t llvm_cbe_call43;

  llvm_cbe_call = atan2(1, 1);
  PI = (llvm_cbe_call * 4);
  ;
  _28 = memcpy((((uint8_t*)(&llvm_cbe_g))), ((uint8_t*)(&__const_OC_main_OC_g)), 168);
  ;
  _29 = memcpy((((uint8_t*)(&llvm_cbe_f))), ((uint8_t*)(&__const_OC_main_OC_f)), 128);
  ;
  _30 = ((uint8_t*)(&llvm_cbe_h));
  _31 = memset(_30, 0, 48);
  _32 = ((struct l_array_6_double*)_30);
  *((&(*_32).array[((int32_t)0)])) = -8;
  *((&(*_32).array[((int32_t)1)])) = -9;
  *((&(*_32).array[((int32_t)2)])) = -3;
  *((&(*_32).array[((int32_t)3)])) = -1;
  *((&(*_32).array[((int32_t)4)])) = -6;
  *((&(*_32).array[((int32_t)5)])) = 7;
  ;
  ;
  ;
  llvm_cbe_vla = (double*) alloca(sizeof(double) * ((((uint64_t)(uint32_t)6))));
  ;
  ;
  llvm_cbe_vla1 = (double*) alloca(sizeof(double) * ((((uint64_t)(uint32_t)16))));
  ;
  ;
  llvm_cbe_call2 = printf(((&_OC_str.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)16u)){
  _33 = *((&llvm_cbe_f.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call3 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _33);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call4 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call5 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  deconv(((&llvm_cbe_g.array[((int64_t)0)])), 21, ((&llvm_cbe_h.array[((int64_t)0)])), 6, llvm_cbe_vla1);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)16u)){
  _34 = *((&llvm_cbe_vla1[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call13 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _34);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call17 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call18 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)6u)){
  _35 = *((&llvm_cbe_h.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call25 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _35);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call29 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call30 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));
  deconv(((&llvm_cbe_g.array[((int64_t)0)])), 21, ((&llvm_cbe_f.array[((int64_t)0)])), 16, llvm_cbe_vla);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)6u)){
  _36 = *((&llvm_cbe_vla[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call39 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _36);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_call43 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));
  return 0;
}

