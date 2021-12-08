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
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_128_uint32_t {
  uint32_t array[128];
};
struct l_array_256_uint8_t {
  uint8_t array[256];
};
struct l_array_7_uint8_t_KC_ {
  uint8_t* array[7];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint8_t* best_shuffle(uint8_t*, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t strlen(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint8_t* strdup(uint8_t*) __ATTRIBUTELIST__((nothrow));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_12_uint8_t _OC_str = { "abracadabra" };
static struct l_array_7_uint8_t _OC_str_OC_1 = { "seesaw" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "elk" };
static struct l_array_8_uint8_t _OC_str_OC_3 = { "grrrrrr" };
static struct l_array_3_uint8_t _OC_str_OC_4 = { "up" };
static struct l_array_2_uint8_t _OC_str_OC_5 = { "a" };
static struct l_array_12_uint8_t _OC_str_OC_6 = { "%s %s (%d)\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}


/* Function Bodies */

uint8_t* best_shuffle(uint8_t* llvm_cbe_s, uint32_t* llvm_cbe_diff) {
  __MSALIGN__(16) struct l_array_128_uint32_t llvm_cbe_cnt __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_256_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint64_t llvm_cbe_call;
  uint32_t l;
  uint8_t* _1;
  uint8_t* _2;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t max;
  uint32_t max__PHI_TEMPORARY;
  uint8_t _3;
  uint32_t* llvm_cbe_arrayidx4;
  uint32_t _4;
  uint32_t llvm_cbe_inc;
  uint8_t _5;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t _6;
  uint8_t* r;
  uint8_t _7;
  uint8_t _8;
  uint8_t _9;
  uint8_t* llvm_cbe_arrayidx51;
  uint8_t _10;
  uint8_t _11;
  uint8_t _12;
  uint32_t _13;

  ;
  ;
  ;
  ;
  llvm_cbe_call = strlen(llvm_cbe_s);
  l = ((uint32_t)llvm_cbe_call);
  ;
  ;
  _1 = memset((((uint8_t*)(&llvm_cbe_cnt))), 0, 512);
  ;
  _2 = memset((((uint8_t*)(&llvm_cbe_buf))), 0, 256);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  max__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  max = max__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)l)){
  _3 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_arrayidx4 = (&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_3)))))]);
  _4 = *llvm_cbe_arrayidx4;
  llvm_cbe_inc = llvm_add_u32(_4, 1);
  *llvm_cbe_arrayidx4 = llvm_cbe_inc;
  if ((((((int32_t)llvm_cbe_inc) > ((int32_t)max))&1))) {
  _5 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  max = *((&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_5)))))]));
  ;
  max__PHI_TEMPORARY = max;   /* for PHI node */

}
  max = max__PHI_TEMPORARY;
  ;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  max__PHI_TEMPORARY = max;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  max = max__PHI_TEMPORARY;
  ;
  ;
}
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)i) < ((int32_t)128u)){
  j__PHI_TEMPORARY = j;   /* for PHI node */

  uint64_t llvm_cbe_idxprom17;
  uint32_t llvm_cbe_dec;
  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom17 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx18 = (&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)i)))]);
  _6 = *llvm_cbe_arrayidx18;
  llvm_cbe_dec = llvm_add_u32(_6, -1);
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_6, -1));
while (_6 != 0u){
  j = llvm_add_u32(j, 1);
  ;
  *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)j)))])) = (((uint8_t)i));
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom17 = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx18 = (&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)i)))]);
  _6 = *llvm_cbe_arrayidx18;
  llvm_cbe_dec = llvm_add_u32(_6, -1);
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_6, -1));
}

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  r = strdup(llvm_cbe_s);
  ;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)l)){
  ;
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)l)){
  _7 = *((&r[((int64_t)(((int64_t)(int32_t)i)))]));
  _8 = *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)j)))]));
  if (((((((int32_t)(int8_t)_7)) == (((int32_t)(int8_t)_8)))&1))) {
  _9 = *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32(j, max)), l)))))]));
  *((&r[((int64_t)(((int64_t)(int32_t)i)))])) = (((uint8_t)((((int32_t)(int8_t)_9)) & -129)));
  llvm_cbe_arrayidx51 = (&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)j)))]);
  _10 = *llvm_cbe_arrayidx51;
  *llvm_cbe_arrayidx51 = (((uint8_t)((((int32_t)(int8_t)_10)) | 128)));
  break;
  } else {

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)j) < ((int32_t)l))&1))) {
  }

}
  j = j__PHI_TEMPORARY;
  ;
}


  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  *llvm_cbe_diff = 0;
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)l)){
  _11 = *((&r[((int64_t)(((int64_t)(int32_t)i)))]));
  _12 = *((&llvm_cbe_s[((int64_t)(((int64_t)(int32_t)i)))]));
  _13 = *llvm_cbe_diff;
  *llvm_cbe_diff = (llvm_add_u32(_13, (((uint32_t)(bool)((((((int32_t)(int8_t)_11)) == (((int32_t)(int8_t)_12)))&1))))));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return r;
}


int main(void) {
  uint32_t llvm_cbe_d;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_7_uint8_t_KC_ llvm_cbe_t __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _14;
  uint8_t* _15;
  struct l_array_7_uint8_t_KC_* _16;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _17;
  uint8_t* _18;
  uint8_t* r;
  uint8_t* _19;
  uint32_t _20;
  uint32_t llvm_cbe_call5;

  ;
  ;
  _14 = ((uint8_t*)(&llvm_cbe_t));
  _15 = memset(_14, 0, 56);
  _16 = ((struct l_array_7_uint8_t_KC_*)_14);
  *((&(*_16).array[((int32_t)0)])) = ((&_OC_str.array[((int32_t)0)]));
  *((&(*_16).array[((int32_t)1)])) = ((&_OC_str_OC_1.array[((int32_t)0)]));
  *((&(*_16).array[((int32_t)2)])) = ((&_OC_str_OC_2.array[((int32_t)0)]));
  *((&(*_16).array[((int32_t)3)])) = ((&_OC_str_OC_3.array[((int32_t)0)]));
  *((&(*_16).array[((int32_t)4)])) = ((&_OC_str_OC_4.array[((int32_t)0)]));
  *((&(*_16).array[((int32_t)5)])) = ((&_OC_str_OC_5.array[((int32_t)0)]));
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)i)))]);
  _17 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)i)))]));
while (_17 != ((uint8_t*)/*NULL*/0)){
  _18 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)i)))]));
  r = best_shuffle(_18, (&llvm_cbe_d));
  ;
  _19 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _20 = llvm_cbe_d;
  llvm_cbe_call5 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), _19, r, _20);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_idxprom = ((int64_t)(int32_t)i);
  llvm_cbe_arrayidx = (&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)i)))]);
  _17 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)i)))]));
}
  return 0;
}

