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
typedef uint32_t l_fptr_1(uint8_t*, uint8_t*);


/* Types Definitions */
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};
struct l_array_5_uint8_t_KC_ {
  uint8_t* array[5];
};

/* External Global Variable Declarations */

/* Function Declarations */
void perm_sort(uint8_t*, uint32_t, uint64_t, l_fptr_1*) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint32_t scmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t strcmp(uint8_t*, uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint8_t* memcpy(uint8_t*, uint8_t*, uint64_t);
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static struct l_array_5_uint8_t _OC_str = { "spqr" };
static struct l_array_4_uint8_t _OC_str_OC_1 = { "abc" };
static struct l_array_12_uint8_t _OC_str_OC_2 = { "giant squid" };
static struct l_array_6_uint8_t _OC_str_OC_3 = { "stuff" };
static struct l_array_4_uint8_t _OC_str_OC_4 = { "def" };
static struct l_array_4_uint8_t _OC_str_OC_5 = { "%s\n" };


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
static __forceinline uint64_t llvm_neg_u64(uint64_t a) {
  uint64_t r = -a;
  return r;
}


/* Function Bodies */

void perm_sort(uint8_t* llvm_cbe_a, uint32_t llvm_cbe_n, uint64_t llvm_cbe_msize, l_fptr_1* llvm_cbe__cmp) {
  uint8_t* tmp;
  uint8_t* q;
  uint8_t* q__PHI_TEMPORARY;
  uint8_t* p;
  uint8_t* p__PHI_TEMPORARY;
  uint8_t* llvm_cbe_add_2e_ptr2;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call18;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t* _3;
  uint8_t* _4;
  uint8_t* _5;
  uint8_t* _6;

  ;
  ;
  ;
  ;
  tmp = malloc(llvm_cbe_msize);
  ;

){
  p = p__PHI_TEMPORARY;
  q = q__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)p) > ((uint64_t)llvm_cbe_a)){
  llvm_cbe_add_2e_ptr2 = (&p[((int64_t)(llvm_neg_u64(llvm_cbe_msize)))]);
  ;
  llvm_cbe_call3 = llvm_cbe__cmp(llvm_cbe_add_2e_ptr2, p);
  if ((((((int32_t)llvm_cbe_call3) > ((int32_t)0u))&1))) {
  break;
  } else {

  ;
  p__PHI_TEMPORARY = llvm_cbe_add_2e_ptr2;   /* for PHI node */
  q__PHI_TEMPORARY = llvm_cbe_add_2e_ptr2;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  q = q__PHI_TEMPORARY;
  ;
  ;
  if (!(((((uint64_t)p) > ((uint64_t)llvm_cbe_a))&1))) {
  }

}
  p = p__PHI_TEMPORARY;
  q = q__PHI_TEMPORARY;
  ;
  ;
}
  q__PHI_TEMPORARY = q;   /* for PHI node */

  q = q__PHI_TEMPORARY;
  ;
  if (!(((((uint64_t)p) <= ((uint64_t)llvm_cbe_a))&1))) {
  free(tmp);
}
  p = (&llvm_cbe_a[((int64_t)(llvm_mul_u64(llvm_cbe_msize, (((int64_t)(int32_t)(llvm_sub_u32(llvm_cbe_n, 1)))))))]);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  ;
while (((uint64_t)p) > ((uint64_t)q)){
  llvm_cbe_call18 = llvm_cbe__cmp(q, p);
  if ((((((int32_t)llvm_cbe_call18) > ((int32_t)0u))&1))) {
  break;
  } else {

  p = (&p[((int64_t)(llvm_neg_u64(llvm_cbe_msize)))]);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  ;
  if (!(((((uint64_t)p) > ((uint64_t)q))&1))) {
  }

}
  p = p__PHI_TEMPORARY;
  ;
}

  _1 = memcpy(tmp, p, llvm_cbe_msize);
  _2 = memcpy(p, q, llvm_cbe_msize);
  _3 = memcpy(q, tmp, llvm_cbe_msize);
  q = (&q[((int64_t)llvm_cbe_msize)]);
  ;
  p = (&llvm_cbe_a[((int64_t)(llvm_mul_u64(llvm_cbe_msize, (((int64_t)(int32_t)(llvm_sub_u32(llvm_cbe_n, 1)))))))]);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */
  q__PHI_TEMPORARY = q;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  q = q__PHI_TEMPORARY;
  ;
  ;
while (((uint64_t)q) < ((uint64_t)p)){
  _4 = memcpy(tmp, p, llvm_cbe_msize);
  _5 = memcpy(p, q, llvm_cbe_msize);
  _6 = memcpy(q, tmp, llvm_cbe_msize);

  q = (&q[((int64_t)llvm_cbe_msize)]);
  ;
  p = (&p[((int64_t)(llvm_neg_u64(llvm_cbe_msize)))]);
  ;
  p__PHI_TEMPORARY = p;   /* for PHI node */
  q__PHI_TEMPORARY = q;   /* for PHI node */

  p = p__PHI_TEMPORARY;
  q = q__PHI_TEMPORARY;
  ;
  ;
}
  q__PHI_TEMPORARY = q;   /* for PHI node */

  q = q__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_n, 1);
  llvm_cbe_conv = ((int64_t)(int32_t)(llvm_sub_u32(llvm_cbe_n, 1)));
  llvm_cbe_mul = llvm_mul_u64(llvm_cbe_msize, (((int64_t)(int32_t)(llvm_sub_u32(llvm_cbe_n, 1)))));
  p = (&llvm_cbe_a[((int64_t)(llvm_mul_u64(llvm_cbe_msize, (((int64_t)(int32_t)(llvm_sub_u32(llvm_cbe_n, 1)))))))]);
  ;
    p__PHI_TEMPORARY = p;   /* for PHI node */
  q__PHI_TEMPORARY = q;   /* for PHI node */

;
}
  free(tmp);
}


uint32_t scmp(uint8_t* llvm_cbe_a, uint8_t* llvm_cbe_b) {
  uint8_t* _7;
  uint8_t* _8;
  uint32_t llvm_cbe_call;

  ;
  ;
  _7 = *(((uint8_t**)llvm_cbe_a));
  _8 = *(((uint8_t**)llvm_cbe_b));
  llvm_cbe_call = strcmp(_7, _8);
  return llvm_cbe_call;
}


int main(void) {
  __MSALIGN__(16) struct l_array_5_uint8_t_KC_ llvm_cbe_strs __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _9;
  uint8_t* _10;
  struct l_array_5_uint8_t_KC_* _11;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint8_t* _12;
  uint32_t llvm_cbe_call;

  ;
  _9 = ((uint8_t*)(&llvm_cbe_strs));
  _10 = memset(_9, 0, 40);
  _11 = ((struct l_array_5_uint8_t_KC_*)_9);
  *((&(*_11).array[((int32_t)0)])) = ((&_OC_str.array[((int32_t)0)]));
  *((&(*_11).array[((int32_t)1)])) = ((&_OC_str_OC_1.array[((int32_t)0)]));
  *((&(*_11).array[((int32_t)2)])) = ((&_OC_str_OC_2.array[((int32_t)0)]));
  *((&(*_11).array[((int32_t)3)])) = ((&_OC_str_OC_3.array[((int32_t)0)]));
  *((&(*_11).array[((int32_t)4)])) = ((&_OC_str_OC_4.array[((int32_t)0)]));
  perm_sort((((uint8_t*)((&llvm_cbe_strs.array[((int64_t)0)])))), 5, 8, scmp);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)5u)){
  _12 = *((&llvm_cbe_strs.array[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call = printf(((&_OC_str_OC_5.array[((int64_t)0)])), _12);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

