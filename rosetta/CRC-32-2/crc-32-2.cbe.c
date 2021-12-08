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
  uint32_t llvm_cbe_crc_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_buf_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_len_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_rem;    /* Address-exposed local */
  uint8_t llvm_cbe_octet;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint8_t* llvm_cbe_p;    /* Address-exposed local */
  uint8_t* llvm_cbe_q;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint32_t _3;
  uint32_t _4;
  uint32_t _5;
  uint32_t _6;
  uint32_t _7;
  uint32_t _8;
  uint32_t _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t _12;
  uint32_t _13;
  uint8_t* _14;
  uint64_t _15;
  uint8_t* _16;
  uint8_t* _17;
  uint8_t* _18;
  uint8_t* _19;
  uint8_t _20;
  uint32_t _21;
  uint32_t _22;
  uint8_t _23;
  uint32_t _24;
  uint8_t* _25;
  uint32_t _26;

  llvm_cbe_crc_2e_addr = llvm_cbe_crc;
  ;
  llvm_cbe_buf_2e_addr = llvm_cbe_buf;
  ;
  llvm_cbe_len_2e_addr = llvm_cbe_len;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  _1 = rc_crc32_OC_have_table;
  if ((((_1 == 0u)&1))) {
  llvm_cbe_i = 0;

  _2 = llvm_cbe_i;
  if (!(((((int32_t)_2) < ((int32_t)256u))&1))) {
  }

  _3 = llvm_cbe_i;
  llvm_cbe_rem = _3;
  llvm_cbe_j = 0;

  rc_crc32_OC_have_table = 1;

  _4 = llvm_cbe_j;
  if (!(((((int32_t)_4) < ((int32_t)8u))&1))) {
  }

}
  _2 = llvm_cbe_i;
while (((int32_t)_2) < ((int32_t)256u)){
  _4 = llvm_cbe_j;
while (((int32_t)_4) < ((int32_t)8u)){
  _5 = llvm_cbe_rem;
  if (((((_5 & 1) != 0u)&1))) {
  _6 = llvm_cbe_rem;
  llvm_cbe_rem = (llvm_lshr_u32(_6, 1));
  _7 = llvm_cbe_rem;
  llvm_cbe_rem = (_7 ^ -306674912);

  } else {
  _8 = llvm_cbe_rem;
  llvm_cbe_rem = (llvm_lshr_u32(_8, 1));

}

  _9 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_9, 1));

  _4 = llvm_cbe_j;
}
  _10 = llvm_cbe_rem;
  _11 = llvm_cbe_i;
  *((&rc_crc32_OC_table.array[((int64_t)(((int64_t)(int32_t)_11)))])) = _10;

  _12 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_12, 1));

  _2 = llvm_cbe_i;
}
  _13 = llvm_cbe_crc_2e_addr;
  llvm_cbe_crc_2e_addr = (~(_13));
  _14 = llvm_cbe_buf_2e_addr;
  _15 = llvm_cbe_len_2e_addr;
  llvm_cbe_q = ((&_14[((int64_t)_15)]));
  _16 = llvm_cbe_buf_2e_addr;
  llvm_cbe_p = _16;

  _17 = llvm_cbe_p;
  _18 = llvm_cbe_q;
while (((uint64_t)_17) < ((uint64_t)_18)){
  _19 = llvm_cbe_p;
  _20 = *_19;
  llvm_cbe_octet = _20;
  _21 = llvm_cbe_crc_2e_addr;
  _22 = llvm_cbe_crc_2e_addr;
  _23 = llvm_cbe_octet;
  _24 = *((&rc_crc32_OC_table.array[((int64_t)(((uint64_t)(uint32_t)((_22 & 255) ^ (((uint32_t)(uint8_t)_23))))))]));
  llvm_cbe_crc_2e_addr = ((llvm_lshr_u32(_21, 8)) ^ _24);

  _25 = llvm_cbe_p;
  llvm_cbe_p = ((&_25[((int32_t)1)]));

  _17 = llvm_cbe_p;
  _18 = llvm_cbe_q;
}
  _26 = llvm_cbe_crc_2e_addr;
  return (~(_26));
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s;    /* Address-exposed local */
  uint8_t* _27;
  uint8_t* _28;
  uint64_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call2;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_s = ((&_OC_str.array[((int64_t)0)]));
  _27 = llvm_cbe_s;
  _28 = llvm_cbe_s;
  llvm_cbe_call = strlen(_28);
  llvm_cbe_call1 = rc_crc32(0, _27, llvm_cbe_call);
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call1);
  return 0;
}

