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
uint64_t raiseTo(uint64_t, uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
uint64_t properDivisorSum(uint64_t) __ATTRIBUTELIST__((noinline, nothrow));
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
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
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

uint64_t raiseTo(uint64_t llvm_cbe_base, uint64_t llvm_cbe_power) {
  uint64_t llvm_cbe_base_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_power_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_result;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t _1;
  uint64_t _2;
  uint64_t _3;
  uint64_t _4;
  uint64_t _5;
  uint64_t _6;

  llvm_cbe_base_2e_addr = llvm_cbe_base;
  ;
  llvm_cbe_power_2e_addr = llvm_cbe_power;
  ;
  ;
  llvm_cbe_result = 1;
  ;
  llvm_cbe_i = 0;

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_power_2e_addr;
while (((uint64_t)_1) < ((uint64_t)_2)){
  _3 = llvm_cbe_base_2e_addr;
  _4 = llvm_cbe_result;
  llvm_cbe_result = (llvm_mul_u64(_4, _3));

  _5 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_5, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_power_2e_addr;
}
  _6 = llvm_cbe_result;
  return _6;
}


uint64_t properDivisorSum(uint64_t llvm_cbe_n) {
  uint64_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  uint64_t llvm_cbe_prod;    /* Address-exposed local */
  uint64_t llvm_cbe_temp;    /* Address-exposed local */
  uint64_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t llvm_cbe_count;    /* Address-exposed local */
  uint64_t _7;
  uint64_t _8;
  uint64_t _9;
  uint64_t _10;
  uint64_t _11;
  uint64_t _12;
  uint64_t llvm_cbe_call;
  uint64_t _13;
  uint64_t _14;
  uint64_t _15;
  uint64_t _16;
  uint64_t _17;
  uint64_t _18;
  uint64_t _19;
  uint64_t _20;
  uint64_t _21;
  uint64_t _22;
  uint64_t _23;
  uint64_t _24;
  uint64_t _25;
  uint64_t _26;
  uint64_t _27;
  uint64_t llvm_cbe_call18;
  uint64_t _28;
  uint64_t _29;
  uint64_t _30;
  uint64_t _31;
  uint64_t _32;
  uint64_t _33;
  uint64_t _34;
  uint64_t _35;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  llvm_cbe_prod = 1;
  ;
  _7 = llvm_cbe_n_2e_addr;
  llvm_cbe_temp = _7;
  ;
  ;
  llvm_cbe_count = 0;

  uint64_t llvm_cbe_rem;
  _8 = llvm_cbe_n_2e_addr;
  llvm_cbe_rem = llvm_urem_u64(_8, 2);
while (llvm_cbe_rem == UINT64_C(0)){
  _9 = llvm_cbe_count;
  llvm_cbe_count = (llvm_add_u64(_9, 1));
  _10 = llvm_cbe_n_2e_addr;
  llvm_cbe_n_2e_addr = (llvm_udiv_u64(_10, 2));

  _8 = llvm_cbe_n_2e_addr;
  llvm_cbe_rem = llvm_urem_u64(_8, 2);
}
  _11 = llvm_cbe_count;
  if ((((_11 != UINT64_C(0))&1))) {
  _12 = llvm_cbe_count;
  llvm_cbe_call = raiseTo(2, (llvm_add_u64(_12, 1)));
  _13 = llvm_cbe_prod;
  llvm_cbe_prod = (llvm_mul_u64(_13, (llvm_sub_u64(llvm_cbe_call, 1))));

}
  llvm_cbe_i = 3;

  uint64_t llvm_cbe_mul2;
  _14 = llvm_cbe_i;
  _15 = llvm_cbe_i;
  llvm_cbe_mul2 = llvm_mul_u64(_14, _15);
  _16 = llvm_cbe_n_2e_addr;
while (((uint64_t)llvm_cbe_mul2) <= ((uint64_t)_16)){
  llvm_cbe_count = 0;

  uint64_t llvm_cbe_rem5;
  _17 = llvm_cbe_n_2e_addr;
  _18 = llvm_cbe_i;
  llvm_cbe_rem5 = llvm_urem_u64(_17, _18);
while (llvm_cbe_rem5 == UINT64_C(0)){
  _19 = llvm_cbe_count;
  llvm_cbe_count = (llvm_add_u64(_19, 1));
  _20 = llvm_cbe_i;
  _21 = llvm_cbe_n_2e_addr;
  llvm_cbe_n_2e_addr = (llvm_udiv_u64(_21, _20));

  _17 = llvm_cbe_n_2e_addr;
  _18 = llvm_cbe_i;
  llvm_cbe_rem5 = llvm_urem_u64(_17, _18);
}
  _22 = llvm_cbe_count;
  if ((((_22 == UINT64_C(1))&1))) {
  _23 = llvm_cbe_i;
  _24 = llvm_cbe_prod;
  llvm_cbe_prod = (llvm_mul_u64(_24, (llvm_add_u64(_23, 1))));

  } else {
  _25 = llvm_cbe_count;
  if ((((((uint64_t)_25) > ((uint64_t)UINT64_C(1)))&1))) {
  _26 = llvm_cbe_i;
  _27 = llvm_cbe_count;
  llvm_cbe_call18 = raiseTo(_26, (llvm_add_u64(_27, 1)));
  _28 = llvm_cbe_i;
  _29 = llvm_cbe_prod;
  llvm_cbe_prod = (llvm_mul_u64(_29, (llvm_udiv_u64((llvm_sub_u64(llvm_cbe_call18, 1)), (llvm_sub_u64(_28, 1))))));

}

}

  _30 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u64(_30, 2));

  _14 = llvm_cbe_i;
  _15 = llvm_cbe_i;
  llvm_cbe_mul2 = llvm_mul_u64(_14, _15);
  _16 = llvm_cbe_n_2e_addr;
}
  _31 = llvm_cbe_n_2e_addr;
  if ((((((uint64_t)_31) > ((uint64_t)UINT64_C(2)))&1))) {
  _32 = llvm_cbe_n_2e_addr;
  _33 = llvm_cbe_prod;
  llvm_cbe_prod = (llvm_mul_u64(_33, (llvm_add_u64(_32, 1))));

  _34 = llvm_cbe_prod;
  _35 = llvm_cbe_temp;
  return (llvm_sub_u64(_34, _35));
}
  _34 = llvm_cbe_prod;
  _35 = llvm_cbe_temp;
  return (llvm_sub_u64(_34, _35));
}


void printSeries(uint64_t* llvm_cbe_arr, uint32_t llvm_cbe_size, uint8_t* llvm_cbe_type) {
  uint64_t* llvm_cbe_arr_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_size_2e_addr;    /* Address-exposed local */
  uint8_t* llvm_cbe_type_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint64_t* _36;
  uint64_t _37;
  uint8_t* _38;
  uint32_t llvm_cbe_call;
  uint32_t _39;
  uint32_t _40;
  uint64_t* _41;
  uint32_t _42;
  uint64_t _43;
  uint32_t llvm_cbe_call2;
  uint32_t _44;
  uint64_t* _45;
  uint32_t _46;
  uint64_t _47;
  uint32_t llvm_cbe_call5;

  llvm_cbe_arr_2e_addr = llvm_cbe_arr;
  ;
  llvm_cbe_size_2e_addr = llvm_cbe_size;
  ;
  llvm_cbe_type_2e_addr = llvm_cbe_type;
  ;
  ;
  _36 = llvm_cbe_arr_2e_addr;
  _37 = *((&(*_36)));
  _38 = llvm_cbe_type_2e_addr;
  llvm_cbe_call = printf(((&_OC_str.array[((int64_t)0)])), _37, _38);
  llvm_cbe_i = 0;

  uint32_t llvm_cbe_sub;
  _39 = llvm_cbe_i;
  _40 = llvm_cbe_size_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_40, 1);
while (((int32_t)_39) < ((int32_t)llvm_cbe_sub)){
  _41 = llvm_cbe_arr_2e_addr;
  _42 = llvm_cbe_i;
  _43 = *((&_41[((int64_t)(((int64_t)(int32_t)_42)))]));
  llvm_cbe_call2 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), _43);

  _44 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_44, 1));

  _39 = llvm_cbe_i;
  _40 = llvm_cbe_size_2e_addr;
  llvm_cbe_sub = llvm_sub_u32(_40, 1);
}
  _45 = llvm_cbe_arr_2e_addr;
  _46 = llvm_cbe_i;
  _47 = *((&_45[((int64_t)(((int64_t)(int32_t)_46)))]));
  llvm_cbe_call5 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), _47);
}


void aliquotClassifier(uint64_t llvm_cbe_n) {
  uint64_t llvm_cbe_n_2e_addr;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_16_uint64_t llvm_cbe_arr __attribute__((aligned(16)));    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint64_t _48;
  uint32_t _49;
  uint32_t _50;
  uint64_t _51;
  uint64_t llvm_cbe_call;
  uint32_t _52;
  uint32_t _53;
  uint64_t _54;
  uint32_t _55;
  uint64_t _56;
  uint64_t _57;
  uint32_t _58;
  uint64_t _59;
  uint32_t _60;
  uint64_t _61;
  uint32_t _62;
  uint64_t _63;
  uint64_t _64;
  uint64_t* llvm_cbe_arraydecay;
  uint32_t _65;
  uint32_t llvm_cbe_add;
  uint32_t _66;
  uint64_t _67;
  uint32_t _68;
  uint64_t _69;
  uint64_t _70;
  uint32_t _71;
  uint32_t _72;
  uint64_t _73;
  uint64_t _74;
  uint32_t _75;
  uint32_t _76;
  uint64_t _77;
  uint32_t _78;
  uint64_t _79;
  uint32_t _80;
  uint64_t _81;
  uint64_t _82;
  bool _83;
  bool _83__PHI_TEMPORARY;
  uint64_t _84;
  uint8_t* llvm_cbe_cond;
  uint8_t* llvm_cbe_cond46;
  uint8_t* llvm_cbe_cond46__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond48;
  uint8_t* llvm_cbe_cond48__PHI_TEMPORARY;
  uint8_t* llvm_cbe_cond50;
  uint8_t* llvm_cbe_cond50__PHI_TEMPORARY;
  uint32_t _85;
  uint32_t _86;
  uint32_t _87;
  uint64_t _88;
  uint32_t _89;
  uint64_t _90;
  uint32_t _91;
  uint32_t _92;
  uint32_t _93;
  uint32_t _94;
  uint64_t* llvm_cbe_arraydecay_2e_splitted1;
  uint32_t _95;
  uint32_t llvm_cbe_add_2e_splitted1;
  uint32_t _96;
  uint64_t _97;
  uint64_t* llvm_cbe_arraydecay_2e_splitted2;
  uint32_t _98;
  uint32_t llvm_cbe_add_2e_splitted2;
  uint32_t _99;
  uint64_t _100;
  uint32_t _101;
  uint64_t _102;
  uint64_t _103;
  uint32_t _104;
  uint64_t _105;
  uint32_t _106;
  uint64_t _107;
  uint32_t _108;
  uint64_t _109;
  uint32_t _110;
  uint64_t _111;

  llvm_cbe_n_2e_addr = llvm_cbe_n;
  ;
  ;
  ;
  ;
  _48 = llvm_cbe_n_2e_addr;
  *((&llvm_cbe_arr.array[((int64_t)0)])) = _48;
  llvm_cbe_i = 1;

  _49 = llvm_cbe_i;
while (((int32_t)_49) < ((int32_t)16u)){
  _50 = llvm_cbe_i;
  _51 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_50, 1)))))]));
  llvm_cbe_call = properDivisorSum(_51);
  _52 = llvm_cbe_i;
  *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_52)))])) = llvm_cbe_call;
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_53)))]));
  if ((((_54 == UINT64_C(0))&1))) {
  llvm_cbe_arraydecay_2e_splitted2 = (&llvm_cbe_arr.array[((int64_t)0)]);
  _98 = llvm_cbe_i;
  llvm_cbe_add_2e_splitted2 = llvm_add_u32(_98, 1);
  _99 = llvm_cbe_i;
  _100 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_99)))]));
  if ((((_100 == UINT64_C(0))&1))) {
  llvm_cbe_cond50__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _68 = llvm_cbe_i;
  _69 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_68)))]));
  _70 = llvm_cbe_n_2e_addr;
  if ((((_69 == _70)&1))) {
  _71 = llvm_cbe_i;
  if ((((_71 == 1u)&1))) {
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _72 = llvm_cbe_i;
  _73 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_72)))]));
  _74 = llvm_cbe_n_2e_addr;
  if ((((_73 == _74)&1))) {
  _75 = llvm_cbe_i;
  if ((((_75 == 2u)&1))) {
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _104 = llvm_cbe_i;
  _105 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_i;
  _107 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_106, 1)))))]));
  if ((((_105 == _107)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  _83 = ((_83__PHI_TEMPORARY)&1);
  _84 = ((uint64_t)(bool)_83);
  llvm_cbe_cond = llvm_select_pu8(_83, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _108 = llvm_cbe_i;
  _109 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_108)))]));
  _110 = llvm_cbe_i;
  _111 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_110, 1)))))]));
  if ((((_109 == _111)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
}
}
  } else {
  _101 = llvm_cbe_i;
  _102 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_101)))]));
  _103 = llvm_cbe_n_2e_addr;
  if ((((_102 == _103)&1))) {
  _75 = llvm_cbe_i;
  if ((((_75 == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _104 = llvm_cbe_i;
  _105 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_i;
  _107 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_106, 1)))))]));
  if ((((_105 == _107)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  } else {
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_i;
  _79 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_78, 1)))))]));
  if ((((_77 == _79)&1))) {
}
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

  _83 = ((_83__PHI_TEMPORARY)&1);
  _84 = ((uint64_t)(bool)_83);
  llvm_cbe_cond = llvm_select_pu8(_83, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
}
  _71 = llvm_cbe_i;
  if ((((_71 == 1u)&1))) {
  } else {
}
  _101 = llvm_cbe_i;
  _102 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_101)))]));
  _103 = llvm_cbe_n_2e_addr;
  if ((((_102 == _103)&1))) {
  _75 = llvm_cbe_i;
  if ((((_75 == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _104 = llvm_cbe_i;
  _105 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_i;
  _107 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_106, 1)))))]));
  if ((((_105 == _107)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  } else {
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_i;
  _79 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_78, 1)))))]));
  if ((((_77 == _79)&1))) {
}
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

  _83 = ((_83__PHI_TEMPORARY)&1);
  _84 = ((uint64_t)(bool)_83);
  llvm_cbe_cond = llvm_select_pu8(_83, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _72 = llvm_cbe_i;
  _73 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_72)))]));
  _74 = llvm_cbe_n_2e_addr;
  if ((((_73 == _74)&1))) {
  } else {
}
  _75 = llvm_cbe_i;
  if ((((_75 == 2u)&1))) {
  } else {
}
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_i;
  _79 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_78, 1)))))]));
  if ((((_77 == _79)&1))) {
}
  llvm_cbe_cond48 = llvm_cbe_cond48__PHI_TEMPORARY;
  llvm_cbe_cond50__PHI_TEMPORARY = llvm_cbe_cond48;   /* for PHI node */

  _108 = llvm_cbe_i;
  _109 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_108)))]));
  _110 = llvm_cbe_i;
  _111 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_110, 1)))))]));
  if ((((_109 == _111)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _104 = llvm_cbe_i;
  _105 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_i;
  _107 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_106, 1)))))]));
  if ((((_105 == _107)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

  _83 = ((_83__PHI_TEMPORARY)&1);
  _84 = ((uint64_t)(bool)_83);
  llvm_cbe_cond = llvm_select_pu8(_83, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  if ((((_56 == _57)&1))) {
  llvm_cbe_arraydecay_2e_splitted1 = (&llvm_cbe_arr.array[((int64_t)0)]);
  _95 = llvm_cbe_i;
  llvm_cbe_add_2e_splitted1 = llvm_add_u32(_95, 1);
  _96 = llvm_cbe_i;
  _97 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_96)))]));
  if ((((_97 == UINT64_C(0))&1))) {
  llvm_cbe_cond50__PHI_TEMPORARY = ((&_OC_str_OC_3.array[((int64_t)0)]));   /* for PHI node */

  } else {
  _68 = llvm_cbe_i;
  _69 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_68)))]));
  _70 = llvm_cbe_n_2e_addr;
  if ((((_69 == _70)&1))) {
  } else {
}
  _71 = llvm_cbe_i;
  if ((((_71 == 1u)&1))) {
  } else {
}
  _101 = llvm_cbe_i;
  _102 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_101)))]));
  _103 = llvm_cbe_n_2e_addr;
  if ((((_102 == _103)&1))) {
  _75 = llvm_cbe_i;
  if ((((_75 == 2u)&1))) {
  } else {
}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _104 = llvm_cbe_i;
  _105 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_i;
  _107 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_106, 1)))))]));
  if ((((_105 == _107)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  } else {
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_i;
  _79 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_78, 1)))))]));
  if ((((_77 == _79)&1))) {
}
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

  _83 = ((_83__PHI_TEMPORARY)&1);
  _84 = ((uint64_t)(bool)_83);
  llvm_cbe_cond = llvm_select_pu8(_83, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  llvm_cbe_cond48__PHI_TEMPORARY = ((&_OC_str_OC_4.array[((int64_t)0)]));   /* for PHI node */

  _72 = llvm_cbe_i;
  _73 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_72)))]));
  _74 = llvm_cbe_n_2e_addr;
  if ((((_73 == _74)&1))) {
  } else {
}
  _75 = llvm_cbe_i;
  if ((((_75 == 2u)&1))) {
  } else {
}
  _76 = llvm_cbe_i;
  _77 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_76)))]));
  _78 = llvm_cbe_i;
  _79 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_78, 1)))))]));
  if ((((_77 == _79)&1))) {
}
  llvm_cbe_cond48 = llvm_cbe_cond48__PHI_TEMPORARY;
  llvm_cbe_cond50__PHI_TEMPORARY = llvm_cbe_cond48;   /* for PHI node */

  _108 = llvm_cbe_i;
  _109 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_108)))]));
  _110 = llvm_cbe_i;
  _111 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_110, 1)))))]));
  if ((((_109 == _111)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  llvm_cbe_cond46__PHI_TEMPORARY = ((&_OC_str_OC_5.array[((int64_t)0)]));   /* for PHI node */

  _104 = llvm_cbe_i;
  _105 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_104)))]));
  _106 = llvm_cbe_i;
  _107 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_106, 1)))))]));
  if ((((_105 == _107)&1))) {
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

}
  _80 = llvm_cbe_i;
  _81 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_80)))]));
  _82 = llvm_cbe_n_2e_addr;
  _83__PHI_TEMPORARY = (((_81 != _82)&1));   /* for PHI node */

  _83 = ((_83__PHI_TEMPORARY)&1);
  _84 = ((uint64_t)(bool)_83);
  llvm_cbe_cond = llvm_select_pu8(_83, ((&_OC_str_OC_6.array[((int64_t)0)])), ((&_OC_str_OC_7.array[((int64_t)0)])));
  llvm_cbe_cond46__PHI_TEMPORARY = llvm_cbe_cond;   /* for PHI node */

}
  } else {
  _58 = llvm_cbe_i;
  _59 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_58)))]));
  _60 = llvm_cbe_i;
  _61 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_60, 1)))))]));
  if ((((_59 == _61)&1))) {
  _62 = llvm_cbe_i;
  _63 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_62)))]));
  _64 = llvm_cbe_n_2e_addr;
  if ((((_63 != _64)&1))) {
  llvm_cbe_arraydecay = (&llvm_cbe_arr.array[((int64_t)0)]);
  _65 = llvm_cbe_i;
  llvm_cbe_add = llvm_add_u32(_65, 1);
  _66 = llvm_cbe_i;
  _67 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_66)))]));
  if ((((_67 == UINT64_C(0))&1))) {
  } else {
}
  } else {
  llvm_cbe_j = 1;

  _85 = llvm_cbe_j;
  _86 = llvm_cbe_i;
  if (!(((((int32_t)_85) < ((int32_t)_86))&1))) {
  }

  _87 = llvm_cbe_j;
  _88 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_87)))]));
  _89 = llvm_cbe_i;
  _90 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_89)))]));
  if ((((_88 == _90)&1))) {
  _91 = llvm_cbe_i;
  printSeries(((&llvm_cbe_arr.array[((int64_t)0)])), (llvm_add_u32(_91, 1)), ((&_OC_str_OC_8.array[((int64_t)0)])));
  return;
}


  _93 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_93, 1));

  _92 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_92, 1));

  _49 = llvm_cbe_i;
  if (!(((((int32_t)_49) < ((int32_t)16u))&1))) {
  }

  _50 = llvm_cbe_i;
  _51 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_50, 1)))))]));
  llvm_cbe_call = properDivisorSum(_51);
  _52 = llvm_cbe_i;
  *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_52)))])) = llvm_cbe_call;
  _53 = llvm_cbe_i;
  _54 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_53)))]));
  if ((((_54 == UINT64_C(0))&1))) {
  } else {
  _55 = llvm_cbe_i;
  _56 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_55)))]));
  _57 = llvm_cbe_n_2e_addr;
  if ((((_56 == _57)&1))) {
  } else {
  _58 = llvm_cbe_i;
  _59 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_58)))]));
  _60 = llvm_cbe_i;
  _61 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)(llvm_sub_u32(_60, 1)))))]));
  if ((((_59 == _61)&1))) {
  _62 = llvm_cbe_i;
  _63 = *((&llvm_cbe_arr.array[((int64_t)(((int64_t)(int32_t)_62)))]));
  _64 = llvm_cbe_n_2e_addr;
  if ((((_63 != _64)&1))) {
  } else {
}
  } else {
  llvm_cbe_j = 1;

}
}
}
  _94 = llvm_cbe_i;
  printSeries(((&llvm_cbe_arr.array[((int64_t)0)])), (llvm_add_u32(_94, 1)), ((&_OC_str_OC_9.array[((int64_t)0)])));

}
  } else {
}
}
}
  _85 = llvm_cbe_j;
  _86 = llvm_cbe_i;
while (((int32_t)_85) < ((int32_t)_86)){
  _85 = llvm_cbe_j;
  _86 = llvm_cbe_i;
}
  _49 = llvm_cbe_i;
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
  uint8_t* _112;
  struct l_struct_struct_OC__IO_FILE* llvm_cbe_call;
  struct l_struct_struct_OC__IO_FILE* _113;
  uint8_t* llvm_cbe_call1;
  uint64_t llvm_cbe_call3;
  struct l_struct_struct_OC__IO_FILE* _114;
  uint32_t llvm_cbe_call4;

  llvm_cbe_fileName_2e_addr = llvm_cbe_fileName;
  ;
  ;
  _112 = llvm_cbe_fileName_2e_addr;
  llvm_cbe_call = fopen(_112, ((&_OC_str_OC_10.array[((int64_t)0)])));
  llvm_cbe_fp = llvm_cbe_call;
  ;

  uint8_t* llvm_cbe_arraydecay;
  llvm_cbe_arraydecay = (&llvm_cbe_str.array[((int64_t)0)]);
  _113 = llvm_cbe_fp;
  llvm_cbe_call1 = fgets(((&llvm_cbe_str.array[((int64_t)0)])), 21, _113);
while (llvm_cbe_call1 != ((uint8_t*)/*NULL*/0)){
  llvm_cbe_call3 = strtoull(((&llvm_cbe_str.array[((int64_t)0)])), ((uint8_t**)/*NULL*/0), 10);
  aliquotClassifier(llvm_cbe_call3);

  llvm_cbe_arraydecay = (&llvm_cbe_str.array[((int64_t)0)]);
  _113 = llvm_cbe_fp;
  llvm_cbe_call1 = fgets(((&llvm_cbe_str.array[((int64_t)0)])), 21, _113);
}
  _114 = llvm_cbe_fp;
  llvm_cbe_call4 = fclose(_114);
}


int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argC = (uint32_t)argc;
  uint8_t** llvm_cbe_argV = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argC_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argV_2e_addr;    /* Address-exposed local */
  uint32_t _115;
  uint8_t** _116;
  uint8_t* _117;
  uint32_t llvm_cbe_call;
  uint8_t** _118;
  uint8_t* _119;
  uint8_t* llvm_cbe_call2;
  uint8_t** _120;
  uint8_t* _121;
  uint8_t** _122;
  uint8_t* _123;
  uint64_t llvm_cbe_call8;

  llvm_cbe_retval = 0;
  llvm_cbe_argC_2e_addr = llvm_cbe_argC;
  ;
  llvm_cbe_argV_2e_addr = llvm_cbe_argV;
  ;
  _115 = llvm_cbe_argC_2e_addr;
  if ((((_115 != 2u)&1))) {
  _116 = llvm_cbe_argV_2e_addr;
  _117 = *((&(*_116)));
  llvm_cbe_call = printf(((&_OC_str_OC_11.array[((int64_t)0)])), _117);

  return 0;
}
  _118 = llvm_cbe_argV_2e_addr;
  _119 = *((&_118[((int64_t)1)]));
  llvm_cbe_call2 = strchr(_119, 46);
  if ((((llvm_cbe_call2 != ((uint8_t*)/*NULL*/0))&1))) {
  _120 = llvm_cbe_argV_2e_addr;
  _121 = *((&_120[((int64_t)1)]));
  processFile(_121);

  } else {
  _122 = llvm_cbe_argV_2e_addr;
  _123 = *((&_122[((int64_t)1)]));
  llvm_cbe_call8 = strtoull(_123, ((uint8_t**)/*NULL*/0), 10);
  aliquotClassifier(llvm_cbe_call8);

}

  return 0;
}

