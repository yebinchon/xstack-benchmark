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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_3_uint32_t {
  uint32_t array[3];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};

/* External Global Variable Declarations */

/* Function Declarations */
void reverse(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
void to_bt(uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t from_bt(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int8_t last_char(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void add(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strcpy(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* strcat(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow));
void unary_minus(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void subtract(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
void mult(uint8_t*, uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_3_uint8_t to_bt_OC_d = { "0+-" };
static struct l_array_3_uint32_t to_bt_OC_v = { { 0, 1, -1 } };
static __MSALIGN__(16) struct l_array_16_uint8_t __const_OC_mult_OC_r __attribute__((aligned(16))) = { "0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00" };
static struct l_array_2_uint8_t _OC_str = { "0" };
static struct l_array_8_uint8_t _OC_str_OC_1 = { "+-0++0+" };
static struct l_array_6_uint8_t _OC_str_OC_2 = { "+-++-" };
static struct l_array_20_uint8_t _OC_str_OC_3 = { "      a: %14s %10d\n" };
static struct l_array_20_uint8_t _OC_str_OC_4 = { "      b: %14s %10d\n" };
static struct l_array_20_uint8_t _OC_str_OC_5 = { "      c: %14s %10d\n" };
static struct l_array_20_uint8_t _OC_str_OC_6 = { "a*(b-c): %14s %10d\n" };


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


/* Function Bodies */

void reverse(uint8_t* llvm_cbe_p) {
  uint64_t len;
  uint8_t* r;
  uint8_t* r__PHI_TEMPORARY;
  uint8_t* p;
  uint8_t* p__PHI_TEMPORARY;
  uint8_t _1;
  uint8_t _2;
  uint8_t _3;
  uint8_t _4;
  uint8_t _5;
  uint8_t _6;

  ;
  len = strlen(llvm_cbe_p);
  ;
  r = (&((&llvm_cbe_p[((int64_t)len)]))[((int64_t)-1)]);
  ;
  r__PHI_TEMPORARY = r;   /* for PHI node */
  p__PHI_TEMPORARY = llvm_cbe_p;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  p = p__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)p) < ((uint64_t)r)){
  _1 = *r;
  _2 = *p;
  *p = (((uint8_t)((((int32_t)(int8_t)_2)) ^ (((int32_t)(int8_t)_1)))));
  _3 = *p;
  _4 = *r;
  *r = (((uint8_t)((((int32_t)(int8_t)_4)) ^ (((int32_t)(int8_t)_3)))));
  r = (&r[((int32_t)-1)]);
  ;
  _5 = *r;
  p = (&p[((int32_t)1)]);
  ;
  _6 = *p;
  *p = (((uint8_t)((((int32_t)(int8_t)_6)) ^ (((int32_t)(int8_t)_5)))));
  r__PHI_TEMPORARY = r;   /* for PHI node */
  p__PHI_TEMPORARY = p;   /* for PHI node */

  r = r__PHI_TEMPORARY;
  p = p__PHI_TEMPORARY;
  ;
  ;
}
  return;
}


void to_bt(uint32_t llvm_cbe_n, uint8_t* llvm_cbe_b) {
  uint8_t* ptr;
  uint8_t* ptr__PHI_TEMPORARY;
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint32_t r;
  uint32_t r__PHI_TEMPORARY;
  uint8_t _7;
  uint32_t _8;

  ;
  ;
  ;
  *llvm_cbe_b = 0;
  ptr__PHI_TEMPORARY = llvm_cbe_b;   /* for PHI node */
  n__PHI_TEMPORARY = llvm_cbe_n;   /* for PHI node */

  ptr = ptr__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
while (n != 0u){
  r = llvm_srem_u32(n, 3);
  ;
  if ((((((int32_t)r) < ((int32_t)0u))&1))) {
  r = llvm_add_u32(r, 3);
  ;
  r__PHI_TEMPORARY = r;   /* for PHI node */

}
  r = r__PHI_TEMPORARY;
  ;
  _7 = *((&to_bt_OC_d.array[((int64_t)(((int64_t)(int32_t)r)))]));
  *ptr = _7;
  ptr = (&ptr[((int32_t)1)]);
  ;
  *ptr = 0;
  _8 = *((&to_bt_OC_v.array[((int64_t)(((int64_t)(int32_t)r)))]));
  ;
  n = llvm_sdiv_u32((llvm_sub_u32(n, _8)), 3);
  ;
  ptr__PHI_TEMPORARY = ptr;   /* for PHI node */
  n__PHI_TEMPORARY = n;   /* for PHI node */

  ptr = ptr__PHI_TEMPORARY;
  n = n__PHI_TEMPORARY;
  ;
  ;
}
  reverse(llvm_cbe_b);
}


uint32_t from_bt(uint8_t* llvm_cbe_a) {
  uint32_t n;
  uint32_t n__PHI_TEMPORARY;
  uint8_t* a;
  uint8_t* a__PHI_TEMPORARY;
  uint8_t _9;
  uint8_t _10;
  uint8_t _11;

  ;
  ;
  n__PHI_TEMPORARY = 0;   /* for PHI node */
  a__PHI_TEMPORARY = llvm_cbe_a;   /* for PHI node */

  uint32_t llvm_cbe_conv;
  n = n__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
  _9 = *a;
  llvm_cbe_conv = ((int32_t)(int8_t)_9);
while (llvm_cbe_conv != 0u){
  n = llvm_mul_u32(n, 3);
  ;
  _10 = *a;
  if (((((((int32_t)(int8_t)_10)) == 43u)&1))) {
  n = llvm_add_u32(n, 1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

  } else {
  _11 = *a;
  if (((((((int32_t)(int8_t)_11)) == 45u)&1))) {
  n = llvm_add_u32(n, -1);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

}
  n = n__PHI_TEMPORARY;
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */

}
  n = n__PHI_TEMPORARY;
  ;
  a = (&a[((int32_t)1)]);
  ;
  n__PHI_TEMPORARY = n;   /* for PHI node */
  a__PHI_TEMPORARY = a;   /* for PHI node */

  n = n__PHI_TEMPORARY;
  a = a__PHI_TEMPORARY;
  ;
  ;
  _9 = *a;
  llvm_cbe_conv = ((int32_t)(int8_t)_9);
}
  return n;
}


int8_t last_char(uint8_t* llvm_cbe_ptr) {
  uint8_t _12;
  uint8_t* ptr;
  uint8_t* ptr__PHI_TEMPORARY;
  uint8_t _13;
  uint8_t c;
  uint8_t llvm_cbe_retval_2e_0;
  uint8_t llvm_cbe_retval_2e_0__PHI_TEMPORARY;

  ;
  if ((((llvm_cbe_ptr == ((uint8_t*)/*NULL*/0))&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  _12 = *llvm_cbe_ptr;
  if (((((((int32_t)(int8_t)_12)) == 0u)&1))) {
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

    llvm_cbe_retval_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}
  ptr__PHI_TEMPORARY = llvm_cbe_ptr;   /* for PHI node */

  uint32_t llvm_cbe_conv3;
  ptr = ptr__PHI_TEMPORARY;
  ;
  _13 = *ptr;
  llvm_cbe_conv3 = ((int32_t)(int8_t)_13);
while (llvm_cbe_conv3 != 0u){
  ptr = (&ptr[((int32_t)1)]);
  ;
  ptr__PHI_TEMPORARY = ptr;   /* for PHI node */

  ptr = ptr__PHI_TEMPORARY;
  ;
  _13 = *ptr;
  llvm_cbe_conv3 = ((int32_t)(int8_t)_13);
}
  ptr = (&ptr[((int32_t)-1)]);
  ;
  c = *ptr;
  ;
  *ptr = 0;
  llvm_cbe_retval_2e_0__PHI_TEMPORARY = c;   /* for PHI node */

  llvm_cbe_retval_2e_0 = llvm_cbe_retval_2e_0__PHI_TEMPORARY;
  return llvm_cbe_retval_2e_0;
}


void add(uint8_t* llvm_cbe_b1, uint8_t* llvm_cbe_b2, uint8_t* llvm_cbe_out) {
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c2 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_ob1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_ob2 __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_array_3_uint8_t llvm_cbe_d;    /* Address-exposed local */
  uint8_t _14;
  uint8_t _15;
  uint8_t* _16;
  uint8_t* llvm_cbe_call;
  uint8_t* llvm_cbe_call6;
  uint8_t L1;
  uint8_t L2;
  uint8_t L1__PHI_TEMPORARY;
  uint8_t L2__PHI_TEMPORARY;
  uint8_t* llvm_cbe_call86;
  uint8_t* llvm_cbe_call89;
  uint8_t _17;
  uint8_t* llvm_cbe_call94;
  uint8_t _18;
  uint8_t* llvm_cbe_call100;
  uint8_t _19;

  ;
  ;
  ;
  _14 = *llvm_cbe_b1;
  if (((((((int32_t)(int8_t)_14)) != 0u)&1))) {
  _15 = *llvm_cbe_b2;
  if (((((((int32_t)(int8_t)_15)) != 0u)&1))) {
  ;
  ;
  ;
  ;
  ;
  _16 = memset((((uint8_t*)(&llvm_cbe_d))), 0, 3);
  llvm_cbe_call = strcpy(((&llvm_cbe_c1.array[((int64_t)0)])), llvm_cbe_b1);
  llvm_cbe_call6 = strcpy(((&llvm_cbe_c2.array[((int64_t)0)])), llvm_cbe_b2);
  L1 = last_char(((&llvm_cbe_c1.array[((int64_t)0)])));
  ;
  L2 = last_char(((&llvm_cbe_c2.array[((int64_t)0)])));
  ;
  if ((((((int32_t)(((int32_t)(int8_t)L2))) < ((int32_t)(((int32_t)(int8_t)L1))))&1))) {
  L2 = ((uint8_t)((((int32_t)(int8_t)L2)) ^ (((int32_t)(int8_t)L1))));
  ;
  L1 = ((uint8_t)((((int32_t)(int8_t)L1)) ^ (((int32_t)(int8_t)L2))));
  ;
  L2 = ((uint8_t)((((int32_t)(int8_t)L2)) ^ (((int32_t)(int8_t)L1))));
  ;
  L1__PHI_TEMPORARY = L1;   /* for PHI node */
  L2__PHI_TEMPORARY = L2;   /* for PHI node */

}
  L1 = L1__PHI_TEMPORARY;
  L2 = L2__PHI_TEMPORARY;
  ;
  ;
  if (((((((int32_t)(int8_t)L1)) == 45u)&1))) {
  if (((((((int32_t)(int8_t)L2)) == 48u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 45;

}
  if (((((((int32_t)(int8_t)L2)) == 45u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 43;
  *((&llvm_cbe_d.array[((int64_t)1)])) = 45;

}

}
  if (((((((int32_t)(int8_t)L1)) == 43u)&1))) {
  if (((((((int32_t)(int8_t)L2)) == 48u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 43;

}
  if (((((((int32_t)(int8_t)L2)) == 45u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 48;

}
  if (((((((int32_t)(int8_t)L2)) == 43u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 45;
  *((&llvm_cbe_d.array[((int64_t)1)])) = 43;

}

}
  if (!((((((int32_t)(int8_t)L1)) == 48u)&1))) {
  if (((((((int32_t)(int8_t)L2)) == 48u)&1))) {
  *((&llvm_cbe_d.array[((int64_t)0)])) = 48;

}

}
  add(((&llvm_cbe_c1.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)1)])), ((&llvm_cbe_ob1.array[((int64_t)0)])));
  add(((&llvm_cbe_ob1.array[((int64_t)0)])), ((&llvm_cbe_c2.array[((int64_t)0)])), ((&llvm_cbe_ob2.array[((int64_t)0)])));
  llvm_cbe_call86 = strcpy(llvm_cbe_out, ((&llvm_cbe_ob2.array[((int64_t)0)])));
  *((&llvm_cbe_d.array[((int64_t)1)])) = 0;
  llvm_cbe_call89 = strcat(llvm_cbe_out, ((&llvm_cbe_d.array[((int64_t)0)])));

  } else {
  _17 = *llvm_cbe_b1;
  if (((((((int32_t)(int8_t)_17)) != 0u)&1))) {
  llvm_cbe_call94 = strcpy(llvm_cbe_out, llvm_cbe_b1);

  } else {
  _18 = *llvm_cbe_b2;
  if (((((((int32_t)(int8_t)_18)) != 0u)&1))) {
  llvm_cbe_call100 = strcpy(llvm_cbe_out, llvm_cbe_b2);

  } else {
  *llvm_cbe_out = 0;

}
}
}
  } else {
  _19 = *llvm_cbe_b1;
  if (((((((int32_t)(int8_t)_19)) != 0u)&1))) {
  llvm_cbe_call94 = strcpy(llvm_cbe_out, llvm_cbe_b1);

  } else {
  _18 = *llvm_cbe_b2;
  if (((((((int32_t)(int8_t)_18)) != 0u)&1))) {
  } else {
}
  llvm_cbe_call100 = strcpy(llvm_cbe_out, llvm_cbe_b2);

  *llvm_cbe_out = 0;


}
}

  return;
}


void unary_minus(uint8_t* llvm_cbe_b, uint8_t* llvm_cbe_out) {
  uint8_t* out;
  uint8_t* out__PHI_TEMPORARY;
  uint8_t* b;
  uint8_t* b__PHI_TEMPORARY;
  uint8_t _20;
  uint8_t _21;
  uint8_t _22;
  uint8_t _23;

  ;
  ;
  out__PHI_TEMPORARY = llvm_cbe_out;   /* for PHI node */
  b__PHI_TEMPORARY = llvm_cbe_b;   /* for PHI node */

  uint32_t llvm_cbe_conv;
  out = out__PHI_TEMPORARY;
  b = b__PHI_TEMPORARY;
  ;
  ;
  _20 = *b;
  llvm_cbe_conv = ((int32_t)(int8_t)_20);
while (llvm_cbe_conv != 0u){
  _21 = *b;
  if (((((((int32_t)(int8_t)_21)) == 45u)&1))) {
  out = (&out[((int32_t)1)]);
  ;
  *out = 43;
  b = (&b[((int32_t)1)]);
  ;
  out__PHI_TEMPORARY = out;   /* for PHI node */
  b__PHI_TEMPORARY = b;   /* for PHI node */

  } else {
  _22 = *b;
  if (((((((int32_t)(int8_t)_22)) == 43u)&1))) {
  out = (&out[((int32_t)1)]);
  ;
  *out = 45;
  b = (&b[((int32_t)1)]);
  ;
  out__PHI_TEMPORARY = out;   /* for PHI node */
  b__PHI_TEMPORARY = b;   /* for PHI node */

  } else {
  b = (&b[((int32_t)1)]);
  ;
  _23 = *b;
  out = (&out[((int32_t)1)]);
  ;
  *out = _23;
  out__PHI_TEMPORARY = out;   /* for PHI node */
  b__PHI_TEMPORARY = b;   /* for PHI node */

}
}
  out = out__PHI_TEMPORARY;
  b = b__PHI_TEMPORARY;
  ;
  ;
  out__PHI_TEMPORARY = out;   /* for PHI node */
  b__PHI_TEMPORARY = b;   /* for PHI node */

  out = out__PHI_TEMPORARY;
  b = b__PHI_TEMPORARY;
  ;
  ;
  out__PHI_TEMPORARY = out;   /* for PHI node */
  b__PHI_TEMPORARY = b;   /* for PHI node */

  out = out__PHI_TEMPORARY;
  b = b__PHI_TEMPORARY;
  ;
  ;
  _20 = *b;
  llvm_cbe_conv = ((int32_t)(int8_t)_20);
}
  *out = 0;
}


void subtract(uint8_t* llvm_cbe_b1, uint8_t* llvm_cbe_b2, uint8_t* llvm_cbe_out) {
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */

  ;
  ;
  ;
  ;
  unary_minus(llvm_cbe_b2, ((&llvm_cbe_buf.array[((int64_t)0)])));
  add(llvm_cbe_b1, ((&llvm_cbe_buf.array[((int64_t)0)])), llvm_cbe_out);
}


void mult(uint8_t* llvm_cbe_b1, uint8_t* llvm_cbe_b2, uint8_t* llvm_cbe_out) {
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_r __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_t __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c1 __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_c2 __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _24;
  uint8_t* ptr;
  uint8_t* llvm_cbe_call;
  uint8_t* llvm_cbe_call3;
  uint8_t* ptr__PHI_TEMPORARY;
  uint8_t _25;
  uint8_t _26;
  uint8_t* llvm_cbe_call14;
  uint8_t _27;
  uint8_t* llvm_cbe_call24;
  uint8_t* llvm_cbe_call27;
  uint8_t _28;
  uint8_t* llvm_cbe_call36;

  ;
  ;
  ;
  ;
  _24 = memcpy((((uint8_t*)(&llvm_cbe_r))), ((&__const_OC_mult_OC_r.array[((int32_t)0)])), 16);
  ;
  ;
  ;
  ptr = (&llvm_cbe_c2.array[((int64_t)0)]);
  ;
  llvm_cbe_call = strcpy(((&llvm_cbe_c1.array[((int64_t)0)])), llvm_cbe_b1);
  llvm_cbe_call3 = strcpy(((&llvm_cbe_c2.array[((int64_t)0)])), llvm_cbe_b2);
  reverse(((&llvm_cbe_c2.array[((int64_t)0)])));
  ptr__PHI_TEMPORARY = ptr;   /* for PHI node */

  uint32_t llvm_cbe_conv;
  ptr = ptr__PHI_TEMPORARY;
  ;
  _25 = *ptr;
  llvm_cbe_conv = ((int32_t)(int8_t)_25);
while (llvm_cbe_conv != 0u){
  _26 = *ptr;
  if (((((((int32_t)(int8_t)_26)) == 43u)&1))) {
  add(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_c1.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));
  llvm_cbe_call14 = strcpy(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));

}
  _27 = *ptr;
  if (((((((int32_t)(int8_t)_27)) == 45u)&1))) {
  subtract(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_c1.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));
  llvm_cbe_call24 = strcpy(((&llvm_cbe_r.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));

}
  llvm_cbe_call27 = strcat(((&llvm_cbe_c1.array[((int64_t)0)])), ((&_OC_str.array[((int64_t)0)])));
  ptr = (&ptr[((int32_t)1)]);
  ;
  ptr__PHI_TEMPORARY = ptr;   /* for PHI node */

  ptr = ptr__PHI_TEMPORARY;
  ;
  _25 = *ptr;
  llvm_cbe_conv = ((int32_t)(int8_t)_25);
}
  ptr = (&llvm_cbe_r.array[((int64_t)0)]);
  ;
  ptr__PHI_TEMPORARY = ptr;   /* for PHI node */

  uint32_t llvm_cbe_conv30;
  ptr = ptr__PHI_TEMPORARY;
  ;
  _28 = *ptr;
  llvm_cbe_conv30 = ((int32_t)(int8_t)_28);
while (llvm_cbe_conv30 == 48u){
  ptr = (&ptr[((int32_t)1)]);
  ;
  ptr__PHI_TEMPORARY = ptr;   /* for PHI node */

  ptr = ptr__PHI_TEMPORARY;
  ;
  _28 = *ptr;
  llvm_cbe_conv30 = ((int32_t)(int8_t)_28);
}
  llvm_cbe_call36 = strcpy(llvm_cbe_out, ptr);
}


int main(void) {
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_b __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_t __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint8_t llvm_cbe_d __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call8;
  uint32_t llvm_cbe_call9;
  uint32_t llvm_cbe_call10;
  uint32_t llvm_cbe_call11;
  uint32_t llvm_cbe_call14;
  uint32_t llvm_cbe_call15;

  ;
  ;
  ;
  ;
  ;
  to_bt(-436, ((&llvm_cbe_b.array[((int64_t)0)])));
  subtract(((&llvm_cbe_b.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])));
  mult(((&_OC_str_OC_1.array[((int64_t)0)])), ((&llvm_cbe_t.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])));
  llvm_cbe_call = from_bt(((&_OC_str_OC_1.array[((int64_t)0)])));
  llvm_cbe_call5 = printf(((&_OC_str_OC_3.array[((int64_t)0)])), ((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call8 = from_bt(((&llvm_cbe_b.array[((int64_t)0)])));
  llvm_cbe_call9 = printf(((&_OC_str_OC_4.array[((int64_t)0)])), ((&llvm_cbe_b.array[((int64_t)0)])), llvm_cbe_call8);
  llvm_cbe_call10 = from_bt(((&_OC_str_OC_2.array[((int64_t)0)])));
  llvm_cbe_call11 = printf(((&_OC_str_OC_5.array[((int64_t)0)])), ((&_OC_str_OC_2.array[((int64_t)0)])), llvm_cbe_call10);
  llvm_cbe_call14 = from_bt(((&llvm_cbe_d.array[((int64_t)0)])));
  llvm_cbe_call15 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), ((&llvm_cbe_d.array[((int64_t)0)])), llvm_cbe_call14);
  return 0;
}

