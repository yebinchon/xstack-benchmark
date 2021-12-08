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
  uint64_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t llvm_cbe_sum;    /* Address-exposed local */
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint64_t _4;
  uint64_t _5;
  uint64_t _6;
  uint64_t _7;
  uint64_t _8;
  uint64_t _9;
  uint64_t _10;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  llvm_cbe_sum = 0;
  llvm_cbe_i = 1;

  uint64_t llvm_cbe_add;
  uint64_t llvm_cbe_div;
  _1 = llvm_cbe_i;
  _2 = llvm_cbe_n_2e_addr;
  llvm_cbe_add = llvm_add_u64(_2, 1);
  llvm_cbe_div = llvm_udiv_u64((llvm_add_u64(_2, 1)), 2);
while (((uint64_t)_1) < ((uint64_t)llvm_cbe_div)){
  _3 = llvm_cbe_n_2e_addr;
  _4 = llvm_cbe_i;
  if (((((llvm_urem_u64(_3, _4)) == UINT64_C(0))&1))) {
  _5 = llvm_cbe_n_2e_addr;
  _6 = llvm_cbe_i;
  if ((((_5 != _6)&1))) {
  _7 = llvm_cbe_i;
  _8 = llvm_cbe_sum;
  llvm_cbe_sum = (llvm_add_u64(_8, _7));


  } else {

}
  } else {

}
  _9 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_9, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_n_2e_addr;
  llvm_cbe_add = llvm_add_u64(_2, 1);
  llvm_cbe_div = llvm_udiv_u64((llvm_add_u64(_2, 1)), 2);
}
  _10 = llvm_cbe_sum;
  return _10;
}


void printSeries(uint64_t* llvm_cbe_arr, uint32_t llvm_cbe_size, uint8_t* llvm_cbe_type) {
  uint64_t* llvm_cbe_arr_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_size_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_type_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t* _11;
  uint64_t _12;
  uint8_t* _13;
  uint32_t llvm_cbe_call;
  uint32_t _14;
  uint32_t _15;
  uint64_t* _16;
  uint32_t _17;
  uint64_t _18;
  uint32_t llvm_cbe_call2;
  uint32_t _19;
  uint64_t* _20;
  uint32_t _21;
  uint64_t _22;
  uint32_t llvm_cbe_call5;

  llvm_cbe_arr_2e_addr = llvm_cbe_arr;
  ;
  llvm_cbe_size_2e_addr = llvm_cbe_size;
  ;
  llvm_cbe_type_2e_addr = llvm_cbe_type;
  ;
  ;
  _11 = llvm_cbe_arr_2e_addr;
  _12 = *((&(*_11)));
  _13 = llvm_cbe_type_2e_addr;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _12, _13);
  llvm_cbe_i = 0;

  uint32_t llvm_cbe_sub;
  _14 = llvm_cbe_i;
  _15 = llvm_cbe_size_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_15, 1);
while (((int32_t)_14) < ((int32_t)llvm_cbe_sub)){
  _16 = llvm_cbe_arr_2e_addr;
  _17 = llvm_cbe_i;
  _18 = *((&_16[((int64_t)(((int64_t)(int32_t)_17)))]));
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _18);

  _19 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_19, 1));

  _14 = llvm_cbe_i;
  _15 = llvm_cbe_size_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_15, 1);
}
  _20 = llvm_cbe_arr_2e_addr;
  _21 = llvm_cbe_i;
  _22 = *((&_20[((int64_t)(((int64_t)(int32_t)_21)))]));
  llvm_cbe_call5 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _22);
}


void aliquotClassifier(uint64_t llvm_cbe_n) {
  uint64_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint64_t llvm_cbe_arr __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint64_t _23;
  uint32_t _24;
  uint32_t _25;
  uint64_t _26;
  uint64_t llvm_cbe_call;
  uint32_t _27;
  uint32_t _28;
  uint64_t _29;
  uint32_t _30;
  uint64_t _31;
  uint64_t _32;
  uint32_t _33;
  uint64_t _34;
  uint32_t _35;
  uint64_t _36;
  uint32_t _37;
  uint64_t _38;
  uint64_t _39;
  uint64_t* llvm_cbe_arraydecay;
  uint32_t _40;
  uint32_t llvm_cbe_add;
  uint32_t _41;
  uint64_t _42;
  uint32_t _43;
  uint64_t _44;
  uint64_t _45;
  uint32_t _46;
  uint32_t _47;
  uint64_t _48;
  uint64_t _49;
  uint32_t _50;
  uint32_t _51;
  uint64_t _52;
  uint32_t _53;
  uint64_t _54;
  uint32_t _55;
  uint64_t _56;
  uint64_t _57;
  bool _58;
  bool _58__PHI_TEMPORARY;
  uint64_t _59;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond46;
  uint8_t* llvm_cbe_cond46__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond48;
  uint8_t* llvm_cbe_cond48__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond50;
  uint8_t* llvm_cbe_cond50__PHI_TEMPORARY;
  uint32_t _60;
  uint32_t _61;
  uint32_t _62;
  uint64_t _63;
  uint32_t _64;
  uint64_t _65;
  uint32_t _66;
  uint32_t _67;
  uint32_t _68;
  uint32_t _69;
  uint64_t* llvm_cbe_arraydecay_2e_splitted1;
  uint32_t _70;
  uint32_t llvm_cbe_add_2e_splitted1;
  uint32_t _71;
  uint64_t _72;
  uint64_t* llvm_cbe_arraydecay_2e_splitted2;
  uint32_t _73;
  uint32_t llvm_cbe_add_2e_splitted2;
  uint32_t _74;
  uint64_t _75;
  uint32_t _76;
  uint64_t _77;
  uint64_t _78;
  uint32_t _79;
  uint64_t _80;
  uint32_t _81;
  uint64_t _82;
  uint32_t _83;
  uint64_t _84;
  uint32_t _85;
  uint64_t _86;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  ;
  _23 = llvm_cbe_n_2e_addr;
  *((&llvm_cbe_arr.array[((int64_t)0)])) = _23;
  llvm_cbe_i = 1;

  _24 = llvm_cbe_i;
while (((int32_t)_24) < ((int32_t)16u)){
  _25 = llvm_cbe_i;
  _26 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_25, 1)))))]));
  llvm_cbe_call = bruteForceProperDivisorSum(_26);
  _27 = llvm_cbe_i;
  *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_27)))])) = llvm_cbe_call;
  _28 = llvm_cbe_i;
  _29 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_28)))]));
  if ((((_29 == UINT64_C(0))&1))) {
  llvm_cbe_arraydecay_2e_splitted2 = (&llvm_cbe_arr.array[((int64_t)0)]);
  _73 = llvm_cbe_i;
  llvm_cbe_add_2e_splitted2 = llvm_add_u32(_73, 1);
  _74 = llvm_cbe_i;
  _75 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_74)))]));
  if ((((_75 == UINT64_C(0))&1))) {
  llvm_cbe_cond50__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _43 = llvm_cbe_i;
  _44 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_43)))]));
  _45 = llvm_cbe_n_2e_addr;
  if ((((_44 == _45)&1))) {
  _46 = llvm_cbe_i;
  if ((((_46 == 1u)&1))) {
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _47 = llvm_cbe_i;
  _48 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_47)))]));
  _49 = llvm_cbe_n_2e_addr;
  if ((((_48 == _49)&1))) {
  _50 = llvm_cbe_i;
  if ((((_50 == 2u)&1))) {
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _79 = llvm_cbe_i;
  _80 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_79)))]));
  _81 = llvm_cbe_i;
  _82 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_81, 1)))))]));
  if ((((_80 == _82)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  _58 = ((_58__PHI_TEMPORARY)&1);
  _59 = ((uint64_t)(bool)_58);
  llvm_cbe_cond = llvm_select_pu8(_58, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _83 = llvm_cbe_i;
  _84 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_83)))]));
  _85 = llvm_cbe_i;
  _86 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_85, 1)))))]));
  if ((((_84 == _86)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
}
}
  } else {
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_n_2e_addr;
  if ((((_77 == _78)&1))) {
  _50 = llvm_cbe_i;
  if ((((_50 == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _79 = llvm_cbe_i;
  _80 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_79)))]));
  _81 = llvm_cbe_i;
  _82 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_81, 1)))))]));
  if ((((_80 == _82)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  } else {
  _51 = llvm_cbe_i;
  _52 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_51)))]));
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_53, 1)))))]));
  if ((((_52 == _54)&1))) {
}
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

  _58 = ((_58__PHI_TEMPORARY)&1);
  _59 = ((uint64_t)(bool)_58);
  llvm_cbe_cond = llvm_select_pu8(_58, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
  _46 = llvm_cbe_i;
  if ((((_46 == 1u)&1))) {
  } else {
}
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_n_2e_addr;
  if ((((_77 == _78)&1))) {
  _50 = llvm_cbe_i;
  if ((((_50 == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _79 = llvm_cbe_i;
  _80 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_79)))]));
  _81 = llvm_cbe_i;
  _82 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_81, 1)))))]));
  if ((((_80 == _82)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  } else {
  _51 = llvm_cbe_i;
  _52 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_51)))]));
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_53, 1)))))]));
  if ((((_52 == _54)&1))) {
}
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

  _58 = ((_58__PHI_TEMPORARY)&1);
  _59 = ((uint64_t)(bool)_58);
  llvm_cbe_cond = llvm_select_pu8(_58, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _47 = llvm_cbe_i;
  _48 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_47)))]));
  _49 = llvm_cbe_n_2e_addr;
  if ((((_48 == _49)&1))) {
  } else {
}
  _50 = llvm_cbe_i;
  if ((((_50 == 2u)&1))) {
  } else {
}
  _51 = llvm_cbe_i;
  _52 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_51)))]));
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_53, 1)))))]));
  if ((((_52 == _54)&1))) {
}
  llvm_cbe_cond48 = llvm_cbe_cond48__PHI_TEMPORARY;
  llvm_cbe_cond50__PHI_TEMPORARY = llvm_cbe_cond48;   /* for PHI node */

  _83 = llvm_cbe_i;
  _84 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_83)))]));
  _85 = llvm_cbe_i;
  _86 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_85, 1)))))]));
  if ((((_84 == _86)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _79 = llvm_cbe_i;
  _80 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_79)))]));
  _81 = llvm_cbe_i;
  _82 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_81, 1)))))]));
  if ((((_80 == _82)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

  _58 = ((_58__PHI_TEMPORARY)&1);
  _59 = ((uint64_t)(bool)_58);
  llvm_cbe_cond = llvm_select_pu8(_58, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _30 = llvm_cbe_i;
  _31 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_30)))]));
  _32 = llvm_cbe_n_2e_addr;
  if ((((_31 == _32)&1))) {
  llvm_cbe_arraydecay_2e_splitted1 = (&llvm_cbe_arr.array[((int64_t)0)]);
  _70 = llvm_cbe_i;
  llvm_cbe_add_2e_splitted1 = llvm_add_u32(_70, 1);
  _71 = llvm_cbe_i;
  _72 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_71)))]));
  if ((((_72 == UINT64_C(0))&1))) {
  llvm_cbe_cond50__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _43 = llvm_cbe_i;
  _44 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_43)))]));
  _45 = llvm_cbe_n_2e_addr;
  if ((((_44 == _45)&1))) {
  } else {
}
  _46 = llvm_cbe_i;
  if ((((_46 == 1u)&1))) {
  } else {
}
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_n_2e_addr;
  if ((((_77 == _78)&1))) {
  _50 = llvm_cbe_i;
  if ((((_50 == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _79 = llvm_cbe_i;
  _80 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_79)))]));
  _81 = llvm_cbe_i;
  _82 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_81, 1)))))]));
  if ((((_80 == _82)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  } else {
  _51 = llvm_cbe_i;
  _52 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_51)))]));
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_53, 1)))))]));
  if ((((_52 == _54)&1))) {
}
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

  _58 = ((_58__PHI_TEMPORARY)&1);
  _59 = ((uint64_t)(bool)_58);
  llvm_cbe_cond = llvm_select_pu8(_58, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _47 = llvm_cbe_i;
  _48 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_47)))]));
  _49 = llvm_cbe_n_2e_addr;
  if ((((_48 == _49)&1))) {
  } else {
}
  _50 = llvm_cbe_i;
  if ((((_50 == 2u)&1))) {
  } else {
}
  _51 = llvm_cbe_i;
  _52 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_51)))]));
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_53, 1)))))]));
  if ((((_52 == _54)&1))) {
}
  llvm_cbe_cond48 = llvm_cbe_cond48__PHI_TEMPORARY;
  llvm_cbe_cond50__PHI_TEMPORARY = llvm_cbe_cond48;   /* for PHI node */

  _83 = llvm_cbe_i;
  _84 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_83)))]));
  _85 = llvm_cbe_i;
  _86 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_85, 1)))))]));
  if ((((_84 == _86)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _79 = llvm_cbe_i;
  _80 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_79)))]));
  _81 = llvm_cbe_i;
  _82 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_81, 1)))))]));
  if ((((_80 == _82)&1))) {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

}
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  _58__PHI_TEMPORARY = (((_56 != _57)&1));   /* for PHI node */

  _58 = ((_58__PHI_TEMPORARY)&1);
  _59 = ((uint64_t)(bool)_58);
  llvm_cbe_cond = llvm_select_pu8(_58, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _33 = llvm_cbe_i;
  _34 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_33)))]));
  _35 = llvm_cbe_i;
  _36 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_35, 1)))))]));
  if ((((_34 == _36)&1))) {
  _37 = llvm_cbe_i;
  _38 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_37)))]));
  _39 = llvm_cbe_n_2e_addr;
  if ((((_38 != _39)&1))) {
  llvm_cbe_arraydecay = (&llvm_cbe_arr.array[((int64_t)0)]);
  _40 = llvm_cbe_i;
  llvm_cbe_add = llvm_add_u32(_40, 1);
  _41 = llvm_cbe_i;
  _42 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_41)))]));
  if ((((_42 == UINT64_C(0))&1))) {
  } else {
}
  } else {
  llvm_cbe_j = 1;

  _60 = llvm_cbe_j;
  _61 = llvm_cbe_i;
  if (!(((((int32_t)_60) < ((int32_t)_61))&1))) {
  }

  _62 = llvm_cbe_j;
  _63 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_62)))]));
  _64 = llvm_cbe_i;
  _65 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_64)))]));
  if ((((_63 == _65)&1))) {
  _66 = llvm_cbe_i;
  printSeries(((&llvm_cbe_arr.array[((int64_t)0)])), (llvm_add_u32(_66, 1)), ((&_OC_str_OC_8.array[((int64_t)0)])));
  return;
}


  _68 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_68, 1));

  _67 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_67, 1));

  _24 = llvm_cbe_i;
  if (!(((((int32_t)_24) < ((int32_t)16u))&1))) {
  }

  _25 = llvm_cbe_i;
  _26 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_25, 1)))))]));
  llvm_cbe_call = bruteForceProperDivisorSum(_26);
  _27 = llvm_cbe_i;
  *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_27)))])) = llvm_cbe_call;
  _28 = llvm_cbe_i;
  _29 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_28)))]));
  if ((((_29 == UINT64_C(0))&1))) {
  } else {
  _30 = llvm_cbe_i;
  _31 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_30)))]));
  _32 = llvm_cbe_n_2e_addr;
  if ((((_31 == _32)&1))) {
  } else {
  _33 = llvm_cbe_i;
  _34 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_33)))]));
  _35 = llvm_cbe_i;
  _36 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_35, 1)))))]));
  if ((((_34 == _36)&1))) {
  _37 = llvm_cbe_i;
  _38 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_37)))]));
  _39 = llvm_cbe_n_2e_addr;
  if ((((_38 != _39)&1))) {
  } else {
}
  } else {
  llvm_cbe_j = 1;

}
}
}
  _69 = llvm_cbe_i;
  printSeries(((&llvm_cbe_arr.array[((int64_t)0)])), (llvm_add_u32(_69, 1)), ((&_OC_str_OC_9.array[((int64_t)0)])));

}
  } else {
}
}
}
  _60 = llvm_cbe_j;
  _61 = llvm_cbe_i;
while (((int32_t)_60) < ((int32_t)_61)){
  _60 = llvm_cbe_j;
  _61 = llvm_cbe_i;
}
  _24 = llvm_cbe_i;
}
  llvm_cbe_cond46 = llvm_cbe_cond46__PHI_TEMPORARY;
  llvm_cbe_cond48__PHI_TEMPORARY = llvm_cbe_cond46;   /* for PHI node */

  llvm_cbe_cond50 = llvm_cbe_cond50__PHI_TEMPORARY;
  printSeries(llvm_cbe_arraydecay, llvm_cbe_add, llvm_cbe_cond50);

  return;
}


void processFile(uint8_t* llvm_cbe_fileName) {
  uint8_t* llvm_cbe_fileName_2e_addr;    /* Address-exposed local */
  struct l_struct_struct_OC__IO_FILE* llvm_cbe_fp;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_21_uint8_t llvm_cbe_str __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _87;
  struct l_struct_struct_OC__IO_FILE* llvm_cbe_call;
  struct l_struct_struct_OC__IO_FILE* _88;
  uint8_t* llvm_cbe_call1;
  uint64_t llvm_cbe_call3;
  struct l_struct_struct_OC__IO_FILE* _89;
  uint32_t llvm_cbe_call4;

  llvm_cbe_fileName_2e_addr = llvm_cbe_fileName;
  ;
  ;
  _87 = llvm_cbe_fileName_2e_addr;
  llvm_cbe_call = fopen(_87, ((&_OC_str_OC_10.array[((int64_t)0)])));
  llvm_cbe_fp = llvm_cbe_call;
  ;

  uint8_t* llvm_cbe_arraydecay;
  llvm_cbe_arraydecay = (&llvm_cbe_str.array[((int64_t)0)]);
  _88 = llvm_cbe_fp;
  llvm_cbe_call1 = fgets(((&llvm_cbe_str.array[((int64_t)0)])), 21, _88);
while (llvm_cbe_call1 != ((uint8_t*)/*NULL*/0)){
  llvm_cbe_call3 = strtoull(((&llvm_cbe_str.array[((int64_t)0)])), ((uint8_t**)/*NULL*/0), 10);
  aliquotClassifier(llvm_cbe_call3);

  llvm_cbe_arraydecay = (&llvm_cbe_str.array[((int64_t)0)]);
  _88 = llvm_cbe_fp;
  llvm_cbe_call1 = fgets(((&llvm_cbe_str.array[((int64_t)0)])), 21, _88);
}
  _89 = llvm_cbe_fp;
  llvm_cbe_call4 = fclose(_89);
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argC = (uint32_t)argc;
  uint8_t** llvm_cbe_argV = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argC_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argV_2e_addr;    /* Address-exposed local */
  uint32_t _90;
  uint8_t** _91;
  uint8_t* _92;
  uint32_t llvm_cbe_call;
  uint8_t** _93;
  uint8_t* _94;
  uint8_t* llvm_cbe_call2;
  uint8_t** _95;
  uint8_t* _96;
  uint8_t** _97;
  uint8_t* _98;
  uint64_t llvm_cbe_call8;

  llvm_cbe_retval = 0;
  llvm_cbe_argC_2e_addr = llvm_cbe_argC;
  ;
  llvm_cbe_argV_2e_addr = llvm_cbe_argV;
  ;
  _90 = llvm_cbe_argC_2e_addr;
  if ((((_90 != 2u)&1))) {
  _91 = llvm_cbe_argV_2e_addr;
  _92 = *((&(*_91)));
  llvm_cbe_call = printf(((&_OC_str_OC_11.array[((int64_t)0)])), _92);

  return 0;
}
  _93 = llvm_cbe_argV_2e_addr;
  _94 = *((&_93[((int64_t)1)]));
  llvm_cbe_call2 = strchr(_94, 46);
  if ((((llvm_cbe_call2 != ((uint8_t*)/*NULL*/0))&1))) {
  _95 = llvm_cbe_argV_2e_addr;
  _96 = *((&_95[((int64_t)1)]));
  processFile(_96);

  } else {
  _97 = llvm_cbe_argV_2e_addr;
  _98 = *((&_97[((int64_t)1)]));
  llvm_cbe_call8 = strtoull(_98, ((uint8_t**)/*NULL*/0), 10);
  aliquotClassifier(llvm_cbe_call8);

}

  return 0;
}

