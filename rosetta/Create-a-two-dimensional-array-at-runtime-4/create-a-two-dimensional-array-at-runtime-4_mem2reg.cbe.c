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



/* Global Declarations */

/* Types Declarations */

/* Function definitions */

/* Types Definitions */
struct l_array_23_uint8_t {
  uint8_t array[23];
};
struct l_array_3_uint8_t {
  uint8_t array[3];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t __isoc99_scanf(uint8_t*, ...);
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_23_uint8_t _OC_str = { "Enter size of array:  " };
static struct l_array_3_uint8_t _OC_str_OC_1 = { "%d" };
static struct l_array_4_uint8_t _OC_str_OC_2 = { "%d " };
static struct l_array_2_uint8_t _OC_str_OC_3 = { "\n" };


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
static __forceinline uint64_t llvm_neg_u64(uint64_t a) {
  uint64_t r = -a;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_user1;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint32_t llvm_cbe_call1;
  uint32_t _1;
  uint32_t _2;
  uint8_t* llvm_cbe_call3;
  uint32_t* a1;
  uint32_t _3;
  uint8_t* llvm_cbe_call6;
  uint32_t** array;
  uint32_t llvm_cbe_row_2e_0;
  uint32_t llvm_cbe_row_2e_0__PHI_TEMPORARY;
  uint32_t offset;
  uint32_t offset__PHI_TEMPORARY;
  uint32_t _4;
  uint32_t col;
  uint32_t col__PHI_TEMPORARY;
  uint32_t _5;
  uint32_t* _6;
  uint32_t _7;
  uint32_t row;
  uint32_t row__PHI_TEMPORARY;
  uint32_t _8;
  uint32_t* _9;
  uint32_t _10;
  uint32_t _11;
  uint32_t llvm_cbe_call33;
  uint32_t llvm_cbe_call37;

  ;
  ;
  ;
  llvm_cbe_user1 = 0;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])));
  llvm_cbe_call1 = __isoc99_scanf(((&_OC_str_OC_1.array[((int64_t)0)])), (&llvm_cbe_user1));
  _1 = llvm_cbe_user1;
  _2 = llvm_cbe_user1;
  ;
  llvm_cbe_call3 = malloc((llvm_mul_u64((((int64_t)(int32_t)(llvm_sdiv_u32((llvm_mul_u32((llvm_add_u32(_1, 1)), _2)), 2)))), 4)));
  a1 = ((uint32_t*)llvm_cbe_call3);
  ;
  _3 = llvm_cbe_user1;
  llvm_cbe_call6 = malloc((llvm_mul_u64((((int64_t)(int32_t)_3)), 8)));
  array = ((uint32_t**)llvm_cbe_call6);
  ;
  ;
  ;
  llvm_cbe_row_2e_0__PHI_TEMPORARY = 0;   /* for PHI node */
  offset__PHI_TEMPORARY = 0;   /* for PHI node */

  llvm_cbe_row_2e_0 = llvm_cbe_row_2e_0__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
  _4 = llvm_cbe_user1;
while (((int32_t)llvm_cbe_row_2e_0) < ((int32_t)_4)){
  *((&array[((int64_t)(((int64_t)(int32_t)llvm_cbe_row_2e_0)))])) = ((&((&a1[((int64_t)(((int64_t)(int32_t)offset)))]))[((int64_t)(llvm_neg_u64((((int64_t)(int32_t)llvm_cbe_row_2e_0)))))]));
  ;
  col__PHI_TEMPORARY = llvm_cbe_row_2e_0;   /* for PHI node */

  col = col__PHI_TEMPORARY;
  ;
  _5 = llvm_cbe_user1;
while (((int32_t)col) < ((int32_t)_5)){
  _6 = *((&array[((int64_t)(((int64_t)(int32_t)llvm_cbe_row_2e_0)))]));
  *((&_6[((int64_t)(((int64_t)(int32_t)col)))])) = (llvm_sub_u32((llvm_add_u32(1, col)), llvm_cbe_row_2e_0));

  col = llvm_add_u32(col, 1);
  ;
  col__PHI_TEMPORARY = col;   /* for PHI node */

  col = col__PHI_TEMPORARY;
  ;
  _5 = llvm_cbe_user1;
}

  _7 = llvm_cbe_user1;
  offset = llvm_add_u32(offset, (llvm_sub_u32(_7, llvm_cbe_row_2e_0)));
  ;
  row = llvm_add_u32(llvm_cbe_row_2e_0, 1);
  ;
  llvm_cbe_row_2e_0__PHI_TEMPORARY = row;   /* for PHI node */
  offset__PHI_TEMPORARY = offset;   /* for PHI node */

  llvm_cbe_row_2e_0 = llvm_cbe_row_2e_0__PHI_TEMPORARY;
  offset = offset__PHI_TEMPORARY;
  ;
  ;
  _4 = llvm_cbe_user1;
}
  ;
  row__PHI_TEMPORARY = 0;   /* for PHI node */

  row = row__PHI_TEMPORARY;
  ;
  _8 = llvm_cbe_user1;
while (((int32_t)row) < ((int32_t)_8)){
  _9 = *((&array[((int64_t)(((int64_t)(int32_t)row)))]));
  _10 = llvm_cbe_user1;
  _11 = *((&_9[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_10, 1)))))]));
  llvm_cbe_call33 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _11);

  row = llvm_add_u32(row, 1);
  ;
  row__PHI_TEMPORARY = row;   /* for PHI node */

  row = row__PHI_TEMPORARY;
  ;
  _8 = llvm_cbe_user1;
}
  llvm_cbe_call37 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));
  free((((uint8_t*)array)));
  free((((uint8_t*)a1)));
  return 0;
}

