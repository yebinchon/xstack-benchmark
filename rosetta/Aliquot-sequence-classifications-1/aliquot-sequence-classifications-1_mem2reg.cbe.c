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
struct l_struct_struct_OC__IO_FILE;

/* Function definitions */

/* Types Definitions */
struct l_array_1_uint8_t {
  uint8_t array[1];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_struct_struct_OC__IO_FILE {
  uint32_t field0;
  uint8_t* field1;
  uint8_t* field2;
  uint8_t* field3;
  uint8_t* field4;
  uint8_t* field5;
  uint8_t* field6;
  uint8_t* field7;
  uint8_t* field8;
  uint8_t* field9;
  uint8_t* field10;
  uint8_t* field11;
  void* field12;
  struct l_struct_struct_OC__IO_FILE* field13;
  uint32_t field14;
  uint32_t field15;
  uint64_t field16;
  uint16_t field17;
  uint8_t field18;
  struct l_array_1_uint8_t field19;
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  struct l_array_20_uint8_t field28;
};
struct l_array_38_uint8_t {
  uint8_t array[38];
};
struct l_array_7_uint8_t {
  uint8_t array[7];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_12_uint8_t {
  uint8_t array[12];
};
struct l_array_8_uint8_t {
  uint8_t array[8];
};
struct l_array_9_uint8_t {
  uint8_t array[9];
};
struct l_array_16_uint8_t {
  uint8_t array[16];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_30_uint8_t {
  uint8_t array[30];
};
struct l_array_16_uint64_t {
  uint64_t array[16];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};

/* External Global Variable Declarations */

/* Function Declarations */
uint64_t bruteForceProperDivisorSum(uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
void printSeries(uint64_t*, uint32_t, uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
void aliquotClassifier(uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
void processFile(uint8_t*) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC__IO_FILE* fopen(uint8_t*, uint8_t*);
uint8_t* fgets(uint8_t*, uint32_t, struct l_struct_struct_OC__IO_FILE*);
uint64_t strtoull(uint8_t*, uint8_t**, uint32_t) __ATTRIBUTELIST__((nothrow));
uint32_t fclose(struct l_struct_struct_OC__IO_FILE*);
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
uint8_t* strchr(uint8_t*, uint32_t) __ATTRIBUTELIST__((nothrow, pure));


/* Global Variable Definitions and Initialization */
static struct l_array_38_uint8_t _OC_str = { "\nInteger : %llu, Type : %s, Series : " };
static struct l_array_7_uint8_t _OC_str_OC_1 = { "%llu, " };
static struct l_array_5_uint8_t _OC_str_OC_2 = { "%llu" };
static struct l_array_12_uint8_t _OC_str_OC_3 = { "Terminating" };
static struct l_array_8_uint8_t _OC_str_OC_4 = { "Perfect" };
static struct l_array_9_uint8_t _OC_str_OC_5 = { "Amicable" };
static struct l_array_9_uint8_t _OC_str_OC_6 = { "Aspiring" };
static struct l_array_9_uint8_t _OC_str_OC_7 = { "Sociable" };
static struct l_array_7_uint8_t _OC_str_OC_8 = { "Cyclic" };
static struct l_array_16_uint8_t _OC_str_OC_9 = { "Non-Terminating" };
static struct l_array_2_uint8_t _OC_str_OC_10 = { "r" };
static struct l_array_30_uint8_t _OC_str_OC_11 = { "Usage : %s <positive integer>" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint8_t* llvm_select_pu8(bool condition, uint8_t* iftrue, uint8_t* ifnot) {
  uint8_t* r;
  r = condition ? iftrue : ifnot;
  return r;
}
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint32_t llvm_sub_u32(uint32_t a, uint32_t b) {
  uint32_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}
static __forceinline uint64_t llvm_urem_u64(uint64_t a, uint64_t b) {
  uint64_t r = a % b;
  return r;
}


/* Function Bodies */

uint64_t bruteForceProperDivisorSum(uint64_t llvm_cbe_n) {
  uint64_t i;
  uint64_t i__PHI_TEMPORARY;
  uint64_t sum;
  uint64_t sum__PHI_TEMPORARY;
  uint64_t llvm_cbe_sum_2e_1_2e_splitted1;
  uint64_t llvm_cbe_sum_2e_1_2e_splitted1__PHI_TEMPORARY;
  uint64_t llvm_cbe_sum_2e_1_2e_splitted2;
  uint64_t llvm_cbe_sum_2e_1_2e_splitted2__PHI_TEMPORARY;

  ;
  ;
  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */
  sum__PHI_TEMPORARY = 0;   /* for PHI node */

  uint64_t llvm_cbe_add;
  uint64_t llvm_cbe_div;
  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_add = llvm_add_u64(llvm_cbe_n, 1);
  llvm_cbe_div = llvm_udiv_u64((llvm_add_u64(llvm_cbe_n, 1)), 2);
while (((uint64_t)i) < ((uint64_t)llvm_cbe_div)){
  if (((((llvm_urem_u64(llvm_cbe_n, i)) == UINT64_C(0))&1))) {
  if ((((llvm_cbe_n != i)&1))) {
  sum = llvm_add_u64(sum, i);
  ;
  sum__PHI_TEMPORARY = sum;   /* for PHI node */

  sum = sum__PHI_TEMPORARY;
  ;

  } else {
    llvm_cbe_sum_2e_1_2e_splitted1__PHI_TEMPORARY = sum;   /* for PHI node */
  llvm_cbe_sum_2e_1_2e_splitted1 = llvm_cbe_sum_2e_1_2e_splitted1__PHI_TEMPORARY;
  ;

}
  } else {
    llvm_cbe_sum_2e_1_2e_splitted2__PHI_TEMPORARY = sum;   /* for PHI node */
  llvm_cbe_sum_2e_1_2e_splitted2 = llvm_cbe_sum_2e_1_2e_splitted2__PHI_TEMPORARY;
  ;

}
  i = llvm_add_u64(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */
  sum__PHI_TEMPORARY = sum;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  sum = sum__PHI_TEMPORARY;
  ;
  ;
  llvm_cbe_add = llvm_add_u64(llvm_cbe_n, 1);
  llvm_cbe_div = llvm_udiv_u64((llvm_add_u64(llvm_cbe_n, 1)), 2);
}
  return sum;
}


void printSeries(uint64_t* llvm_cbe_arr, uint32_t llvm_cbe_size, uint8_t* llvm_cbe_type) {
  uint64_t _1;
  uint32_t llvm_cbe_call;
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _2;
  uint32_t llvm_cbe_call2;
  uint64_t _3;
  uint32_t llvm_cbe_call5;

  ;
  ;
  ;
  _1 = *((&(*llvm_cbe_arr)));
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _1, llvm_cbe_type);
  ;
  i__PHI_TEMPORARY = 0;   /* for PHI node */

  uint32_t llvm_cbe_sub;
  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_size, 1);
while (((int32_t)i) < ((int32_t)llvm_cbe_sub)){
  _2 = *((&llvm_cbe_arr[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _2);

  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  llvm_cbe_sub = llvm_sub_u32(llvm_cbe_size, 1);
}
  _3 = *((&llvm_cbe_arr[((int64_t)(((int64_t)(int32_t)i)))]));
  llvm_cbe_call5 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _3);
}


void aliquotClassifier(uint64_t llvm_cbe_n) {
  __MSALIGN__(16) struct l_array_16_uint64_t llvm_cbe_arr __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t i;
  uint32_t i__PHI_TEMPORARY;
  uint64_t _4;
  uint64_t llvm_cbe_call;
  uint64_t _5;
  uint64_t _6;
  uint64_t _7;
  uint64_t _8;
  uint64_t _9;
  uint64_t* llvm_cbe_arraydecay;
  uint32_t llvm_cbe_add;
  uint64_t _10;
  uint64_t _11;
  uint64_t _12;
  uint64_t _13;
  uint64_t _14;
  uint64_t _15;
  bool _16;
  bool _16__PHI_TEMPORARY;
  uint64_t _17;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond46;
  uint8_t* llvm_cbe_cond46__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond48;
  uint8_t* llvm_cbe_cond48__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond50;
  uint8_t* llvm_cbe_cond50__PHI_TEMPORARY;
  uint32_t j;
  uint32_t j__PHI_TEMPORARY;
  uint64_t _18;
  uint64_t _19;
  uint64_t* llvm_cbe_arraydecay_2e_splitted1;
  uint32_t llvm_cbe_add_2e_splitted1;
  uint64_t _20;
  uint64_t* llvm_cbe_arraydecay_2e_splitted2;
  uint32_t llvm_cbe_add_2e_splitted2;
  uint64_t _21;
  uint64_t _22;
  uint64_t _23;
  uint64_t _24;
  uint64_t _25;
  uint64_t _26;

  ;
  ;
  *((&llvm_cbe_arr.array[((int64_t)0)])) = llvm_cbe_n;
  ;
  i__PHI_TEMPORARY = 1;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
while (((int32_t)i) < ((int32_t)16u)){
  _4 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  llvm_cbe_call = bruteForceProperDivisorSum(_4);
  *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))])) = llvm_cbe_call;
  _5 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_5 == UINT64_C(0))&1))) {
  llvm_cbe_arraydecay_2e_splitted2 = (&llvm_cbe_arr.array[((int64_t)0)]);
  llvm_cbe_add_2e_splitted2 = llvm_add_u32(i, 1);
  _21 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_21 == UINT64_C(0))&1))) {
  llvm_cbe_cond50__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _11 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_11 == llvm_cbe_n)&1))) {
  if ((((i == 1u)&1))) {
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _12 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_12 == llvm_cbe_n)&1))) {
  if ((((i == 2u)&1))) {
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _23 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _24 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_23 == _24)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  _16 = ((_16__PHI_TEMPORARY)&1);
  _17 = ((uint64_t)(bool)_16);
  llvm_cbe_cond = llvm_select_pu8(_16, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _25 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _26 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_25 == _26)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
}
}
  } else {
  _22 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_22 == llvm_cbe_n)&1))) {
  if ((((i == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _23 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _24 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_23 == _24)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  } else {
  _13 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _14 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_13 == _14)&1))) {
}
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

  _16 = ((_16__PHI_TEMPORARY)&1);
  _17 = ((uint64_t)(bool)_16);
  llvm_cbe_cond = llvm_select_pu8(_16, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
  if ((((i == 1u)&1))) {
  } else {
}
  _22 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_22 == llvm_cbe_n)&1))) {
  if ((((i == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _23 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _24 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_23 == _24)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  } else {
  _13 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _14 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_13 == _14)&1))) {
}
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

  _16 = ((_16__PHI_TEMPORARY)&1);
  _17 = ((uint64_t)(bool)_16);
  llvm_cbe_cond = llvm_select_pu8(_16, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _12 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_12 == llvm_cbe_n)&1))) {
  } else {
}
  if ((((i == 2u)&1))) {
  } else {
}
  _13 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _14 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_13 == _14)&1))) {
}
  llvm_cbe_cond48 = llvm_cbe_cond48__PHI_TEMPORARY;
  llvm_cbe_cond50__PHI_TEMPORARY = llvm_cbe_cond48;   /* for PHI node */

  _25 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _26 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_25 == _26)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _23 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _24 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_23 == _24)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

  _16 = ((_16__PHI_TEMPORARY)&1);
  _17 = ((uint64_t)(bool)_16);
  llvm_cbe_cond = llvm_select_pu8(_16, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _6 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_6 == llvm_cbe_n)&1))) {
  llvm_cbe_arraydecay_2e_splitted1 = (&llvm_cbe_arr.array[((int64_t)0)]);
  llvm_cbe_add_2e_splitted1 = llvm_add_u32(i, 1);
  _20 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_20 == UINT64_C(0))&1))) {
  llvm_cbe_cond50__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _11 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_11 == llvm_cbe_n)&1))) {
  } else {
}
  if ((((i == 1u)&1))) {
  } else {
}
  _22 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_22 == llvm_cbe_n)&1))) {
  if ((((i == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _23 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _24 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_23 == _24)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  } else {
  _13 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _14 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_13 == _14)&1))) {
}
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

  _16 = ((_16__PHI_TEMPORARY)&1);
  _17 = ((uint64_t)(bool)_16);
  llvm_cbe_cond = llvm_select_pu8(_16, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _12 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_12 == llvm_cbe_n)&1))) {
  } else {
}
  if ((((i == 2u)&1))) {
  } else {
}
  _13 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _14 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_13 == _14)&1))) {
}
  llvm_cbe_cond48 = llvm_cbe_cond48__PHI_TEMPORARY;
  llvm_cbe_cond50__PHI_TEMPORARY = llvm_cbe_cond48;   /* for PHI node */

  _25 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _26 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_25 == _26)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _23 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _24 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_23 == _24)&1))) {
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

}
  _15 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _16__PHI_TEMPORARY = (((_15 != llvm_cbe_n)&1));   /* for PHI node */

  _16 = ((_16__PHI_TEMPORARY)&1);
  _17 = ((uint64_t)(bool)_16);
  llvm_cbe_cond = llvm_select_pu8(_16, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _7 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _8 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_7 == _8)&1))) {
  _9 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_9 != llvm_cbe_n)&1))) {
  llvm_cbe_arraydecay = (&llvm_cbe_arr.array[((int64_t)0)]);
  llvm_cbe_add = llvm_add_u32(i, 1);
  _10 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_10 == UINT64_C(0))&1))) {
  } else {
}
  } else {
  ;
  j__PHI_TEMPORARY = 1;   /* for PHI node */

  j = j__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)j) < ((int32_t)i))&1))) {
  }

  _18 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)j)))]));
  _19 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_18 == _19)&1))) {
  printSeries(((&llvm_cbe_arr.array[((int64_t)0)])), (llvm_add_u32(i, 1)), ((&_OC_str_OC_8.array[((int64_t)0)])));
  return;
}


  i = llvm_add_u32(i, 1);
  ;
  i__PHI_TEMPORARY = i;   /* for PHI node */

  j = llvm_add_u32(j, 1);
  ;
  j__PHI_TEMPORARY = j;   /* for PHI node */

  i = i__PHI_TEMPORARY;
  ;
  if (!(((((int32_t)i) < ((int32_t)16u))&1))) {
  }

  _4 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  llvm_cbe_call = bruteForceProperDivisorSum(_4);
  *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))])) = llvm_cbe_call;
  _5 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_5 == UINT64_C(0))&1))) {
  } else {
  _6 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_6 == llvm_cbe_n)&1))) {
  } else {
  _7 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  _8 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(i, 1)))))]));
  if ((((_7 == _8)&1))) {
  _9 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)i)))]));
  if ((((_9 != llvm_cbe_n)&1))) {
  } else {
}
  } else {
  ;
  j__PHI_TEMPORARY = 1;   /* for PHI node */

}
}
}
  printSeries(((&llvm_cbe_arr.array[((int64_t)0)])), (llvm_add_u32(i, 1)), ((&_OC_str_OC_9.array[((int64_t)0)])));

}
  } else {
}
}
}
  j = j__PHI_TEMPORARY;
  ;
while (((int32_t)j) < ((int32_t)i)){
  j = j__PHI_TEMPORARY;
  ;
}
  i = i__PHI_TEMPORARY;
  ;
}
  llvm_cbe_cond46 = llvm_cbe_cond46__PHI_TEMPORARY;
  llvm_cbe_cond48__PHI_TEMPORARY = llvm_cbe_cond46;   /* for PHI node */

  llvm_cbe_cond50 = llvm_cbe_cond50__PHI_TEMPORARY;
  printSeries(llvm_cbe_arraydecay, llvm_cbe_add, llvm_cbe_cond50);

  return;
}


void processFile(uint8_t* llvm_cbe_fileName) {
  __MSALIGN__(16) struct l_array_21_uint8_t llvm_cbe_str __attribute__((aligned(16)));    /* Address-exposed local */
  struct l_struct_struct_OC__IO_FILE* fp;
  uint8_t* llvm_cbe_call1;
  uint64_t llvm_cbe_call3;
  uint32_t llvm_cbe_call4;

  ;
  fp = fopen(llvm_cbe_fileName, ((&_OC_str_OC_10.array[((int64_t)0)])));
  ;
  ;

  uint8_t* llvm_cbe_arraydecay;
  llvm_cbe_arraydecay = (&llvm_cbe_str.array[((int64_t)0)]);
  llvm_cbe_call1 = fgets(((&llvm_cbe_str.array[((int64_t)0)])), 21, fp);
while (llvm_cbe_call1 != ((uint8_t*)/*NULL*/0)){
  llvm_cbe_call3 = strtoull(((&llvm_cbe_str.array[((int64_t)0)])), ((uint8_t**)/*NULL*/0), 10);
  aliquotClassifier(llvm_cbe_call3);

  llvm_cbe_arraydecay = (&llvm_cbe_str.array[((int64_t)0)]);
  llvm_cbe_call1 = fgets(((&llvm_cbe_str.array[((int64_t)0)])), 21, fp);
}
  llvm_cbe_call4 = fclose(fp);
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argC = (uint32_t)argc;
  uint8_t** llvm_cbe_argV = (uint8_t**)argv;
  uint8_t* _27;
  uint32_t llvm_cbe_call;
  uint8_t* _28;
  uint8_t* llvm_cbe_call2;
  uint8_t* _29;
  uint8_t* _30;
  uint64_t llvm_cbe_call8;

  ;
  ;
  if ((((llvm_cbe_argC != 2u)&1))) {
  _27 = *((&(*llvm_cbe_argV)));
  llvm_cbe_call = printf(((&_OC_str_OC_11.array[((int64_t)0)])), _27);

  return 0;
}
  _28 = *((&llvm_cbe_argV[((int64_t)1)]));
  llvm_cbe_call2 = strchr(_28, 46);
  if ((((llvm_cbe_call2 != ((uint8_t*)/*NULL*/0))&1))) {
  _29 = *((&llvm_cbe_argV[((int64_t)1)]));
  processFile(_29);

  } else {
  _30 = *((&llvm_cbe_argV[((int64_t)1)]));
  llvm_cbe_call8 = strtoull(_30, ((uint8_t**)/*NULL*/0), 10);
  aliquotClassifier(llvm_cbe_call8);

}

  return 0;
}

