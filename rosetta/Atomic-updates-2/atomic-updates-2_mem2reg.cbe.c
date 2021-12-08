/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_10_uint32_t {
  uint32_t array[10];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
void omp_set_num_threads(uint32_t);
uint32_t rand(void) __ATTRIBUTELIST__((nothrow));
uint32_t printf(uint8_t*, ...);


/* Global Variable Definitions and Initialization */
__MSALIGN__(16) struct l_array_10_uint32_t bucket __attribute__((aligned(16))) __ATTRIBUTE_WEAK__;
static struct l_array_4_uint8_t _OC_str = { "%d " };
static struct l_array_10_uint8_t _OC_str_OC_1 = { " Sum: %d\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint32_t llvm_sdiv_u32(int32_t a, int32_t b) {
  uint32_t r = a / b;
  return r;
}


/* Function Bodies */

int main(void) {
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint32_t llvm_cbe_call;
  uint32_t from;
  uint32_t llvm_cbe_call5;
  uint32_t to;
  uint32_t llvm_cbe_call12;
  uint32_t _1;
  uint32_t _2;
  uint32_t diff;
  uint32_t sum;
  uint32_t sum__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint32_t _3;
  uint32_t llvm_cbe_call29;
  uint32_t _4;
  uint32_t llvm_cbe_call35;
  uint32_t _5;
  uint32_t llvm_cbe_call39;
  uint32_t diff__PHI_TEMPORARY;
  uint32_t* llvm_cbe_arrayidx45;
  uint32_t _6;
  uint32_t* llvm_cbe_arrayidx48;
  uint32_t _7;

  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)10u)){
  *((&bucket.array[((int64_t)(((int64_t)(int32_t)i)))])) = 1000;

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  omp_set_num_threads(3);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)10000u)){
  ;
  llvm_cbe_call = rand();
  from = ((int32_t)((10 * (((double)(int32_t)llvm_cbe_call))) / 2147483648));
  ;

){
  if ((((from == to)&1))) {
  llvm_cbe_call5 = rand();
  to = ((int32_t)((10 * (((double)(int32_t)llvm_cbe_call5))) / 2147483648));
  ;

}
  llvm_cbe_call5 = rand();
  llvm_cbe_conv6 = ((double)(int32_t)llvm_cbe_call5);
  llvm_cbe_mul7 = 10 * (((double)(int32_t)llvm_cbe_call5));
  llvm_cbe_div8 = (10 * (((double)(int32_t)llvm_cbe_call5))) / 2147483648;
  to = ((int32_t)((10 * (((double)(int32_t)llvm_cbe_call5))) / 2147483648));
  ;
  
;
}
  llvm_cbe_call12 = rand();
  ;
  switch ((((int32_t)((10 * (((double)(int32_t)llvm_cbe_call12))) / 2147483648)))) {
  default:
  case 0u:
    break;
  case 1u:
    break;
  case 2u:
    break;
  case 3u:
    break;
  }

  ;
  ;
  sum__PHI_TEMPORARY = 0;   /* for PHI node */
  j__PHI_TEMPORARY = 0;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
while (((int32_t)j) < ((int32_t)10u)){
  _3 = *((&bucket.array[((int64_t)(((int64_t)(int32_t)j)))]));
  llvm_cbe_call29 = printf(((&_OC_str.array[((int64_t)0)])), _3);
  _4 = *((&bucket.array[((int64_t)(((int64_t)(int32_t)j)))]));
  sum = llvm_add_u32(sum, _4);
  ;

  j = llvm_add_u32(j, 1);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */
  j__PHI_TEMPORARY = j;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  j = j__PHI_TEMPORARY;
  ;
  ;
}
  llvm_cbe_call35 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), sum);

  _1 = *((&bucket.array[((int64_t)(((int64_t)(int32_t)from)))]));
  _2 = *((&bucket.array[((int64_t)(((int64_t)(int32_t)to)))]));
  diff = llvm_sdiv_u32((llvm_sub_u32(_1, _2)), 2);
  ;
  diff__PHI_TEMPORARY = diff;   /* for PHI node */

  _5 = *((&bucket.array[((int64_t)(((int64_t)(int32_t)from)))]));
  llvm_cbe_call39 = rand();
  diff = ((int32_t)(((((double)(int32_t)_5)) * (((double)(int32_t)llvm_cbe_call39))) / 2147483648));
  ;
  diff__PHI_TEMPORARY = diff;   /* for PHI node */

  diff = diff__PHI_TEMPORARY;
  ;
  llvm_cbe_arrayidx45 = (&bucket.array[((int64_t)(((int64_t)(int32_t)from)))]);
  _6 = *llvm_cbe_arrayidx45;
  *llvm_cbe_arrayidx45 = (llvm_sub_u32(_6, diff));
  llvm_cbe_arrayidx48 = (&bucket.array[((int64_t)(((int64_t)(int32_t)to)))]);
  _7 = *llvm_cbe_arrayidx48;
  *llvm_cbe_arrayidx48 = (llvm_add_u32(_7, diff));

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
}
  return 0;
}

