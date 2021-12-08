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
struct l_array_256_uint32_t {
  uint32_t array[256];
};
struct l_array_44_uint8_t {
  uint8_t array[44];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint32_t rc_crc32(uint32_t, uint8_t*, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));


/* Global Variable Definitions and Initialization */
static __MSALIGN__(16) struct l_array_256_uint32_t rc_crc32_OC_table __attribute__((aligned(16)));
static uint32_t rc_crc32_OC_have_table;
static struct l_array_44_uint8_t _OC_str = { "The quick brown fox jumps over the lazy dog" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "%X\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_lshr_u32(uint32_t a, uint32_t b) {
  uint32_t r = a >> b;
  return r;
}


/* Function Bodies */

uint32_t rc_crc32(uint32_t llvm_cbe_crc, uint8_t* llvm_cbe_buf, uint64_t llvm_cbe_len) {
  uint32_t _1;
  uint32_t llvm_cbe_i_2e_0;
  uint32_t llvm_cbe_i_2e_0__PHI_TEMPORARY;
  uint32_t rem;
  uint32_t rem__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t i;
  uint32_t crc;
  uint8_t* q;
  uint8_t* p;
  uint8_t* p__PHI_TEMPORARY;
  uint32_t crc__PHI_TEMPORARY;
  uint8_t octet;
  uint32_t _2;

  ;
  ;
  ;
  _1 = rc_crc32_OC_have_table;
  if ((((_1 == 0u)&1))) {
  ;
  llvm_cbe_i_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_i_2e_0 = llvm_cbe_i_2e_0__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)llvm_cbe_i_2e_0) < ((int32_t)256u))&1))) {
  }

  ;
  ;
  rem__PHI_TEMPORARY = llvm_cbe_i_2e_0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  rc_crc32_OC_have_table = 1;

  rem = rem__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
  if (!(((((int32_t)j) < ((int32_t)8u))&1))) {
  }

}
  llvm_cbe_i_2e_0 = llvm_cbe_i_2e_0__PHI_TEMPORARY;
  ;
while (((int32_t)llvm_cbe_i_2e_0) < ((int32_t)256u)){
  rem = rem__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)8u)){
  if (((((rem & 1) != 0u)&1))) {
  ;
  rem = (llvm_lshr_u32(rem, 1)) ^ -306674912;
  ;
  rem__PHI_TEMPORARY = rem;   /* for PHI node */

  } else {
  rem = llvm_lshr_u32(rem, 1);
  ;
  rem__PHI_TEMPORARY = rem;   /* for PHI node */

}
  rem = rem__PHI_TEMPORARY;
  ;

  j = llvm_add_u32(j, 1);
  ;
  rem__PHI_TEMPORARY = rem;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  rem = rem__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  *((&rc_crc32_OC_table.array[((int64_t)(((int64_t)(int32_t)llvm_cbe_i_2e_0)))])) = rem;

  i = llvm_add_u32(llvm_cbe_i_2e_0, 1);
  ;
  llvm_cbe_i_2e_0__PHI_TEMPORARY = i;   /* for PHI node */

  llvm_cbe_i_2e_0 = llvm_cbe_i_2e_0__PHI_TEMPORARY;
  ;
}
  crc = ~(llvm_cbe_crc);
  ;
  q = (&llvm_cbe_buf[((int64_t)llvm_cbe_len)]);
  ;
  ;
  p__PHI_TEMPORARY = llvm_cbe_buf;   /* for PHI node */
  crc__PHI_TEMPORARY = crc;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  crc = crc__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)p) < ((uint64_t)q)){
  octet = *p;
  ;
  _2 = *((&rc_crc32_OC_table.array[((int64_t)(((uint64_t)(uint32_t)((crc & 255) ^ (((uint32_t)(uint8_t)octet))))))]));
  crc = (llvm_lshr_u32(crc, 8)) ^ _2;
  ;

  p = (&p[((int32_t)1)]);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */
  crc__PHI_TEMPORARY = crc;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  crc = crc__PHI_TEMPORARY;
  ;
  ;
}
  return (~(crc));
}


int main(void) {
  uint64_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;

  ;
  llvm_cbe_call = strlen(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = rc_crc32(0, ((&_OC_str.array[((int64_t)0)])), llvm_cbe_call);
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call1);
  return 0;
}

