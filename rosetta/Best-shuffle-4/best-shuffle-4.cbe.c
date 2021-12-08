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
  uint8_t* llvm_cbe_s_2e_addr;    /* Address-exposed local */
  uint32_t* llvm_cbe_diff_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_j;    /* Address-exposed local */
  uint32_t llvm_cbe_max;    /* Address-exposed local */
  uint32_t llvm_cbe_l;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_128_uint32_t llvm_cbe_cnt __attribute__((aligned(16)));    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_256_uint8_t llvm_cbe_buf __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* llvm_cbe_r;    /* Address-exposed local */
  uint8_t* _1;
  uint64_t llvm_cbe_call;
  uint8_t* _2;
  uint8_t* _3;
  uint32_t _4;
  uint32_t _5;
  uint8_t* _6;
  uint32_t _7;
  uint8_t _8;
  uint32_t* llvm_cbe_arrayidx4;
  uint32_t _9;
  uint32_t llvm_cbe_inc;
  uint32_t _10;
  uint8_t* _11;
  uint32_t _12;
  uint8_t _13;
  uint32_t _14;
  uint32_t _15;
  uint32_t _16;
  uint32_t _17;
  uint32_t* llvm_cbe_arrayidx18;
  uint32_t _18;
  uint32_t _19;
  uint32_t _20;
  uint32_t _21;
  uint8_t* _22;
  uint8_t* llvm_cbe_call26;
  uint32_t _23;
  uint32_t _24;
  uint32_t _25;
  uint32_t _26;
  uint8_t* _27;
  uint32_t _28;
  uint8_t _29;
  uint32_t _30;
  uint8_t _31;
  uint32_t _32;
  uint32_t _33;
  uint32_t _34;
  uint8_t _35;
  uint8_t* _36;
  uint32_t _37;
  uint32_t _38;
  uint8_t* llvm_cbe_arrayidx51;
  uint8_t _39;
  uint32_t _40;
  uint32_t _41;
  uint32_t* _42;
  uint32_t _43;
  uint32_t _44;
  uint8_t* _45;
  uint32_t _46;
  uint8_t _47;
  uint8_t* _48;
  uint32_t _49;
  uint8_t _50;
  uint32_t* _51;
  uint32_t _52;
  uint32_t _53;
  uint8_t* _54;

  llvm_cbe_s_2e_addr = llvm_cbe_s;
  ;
  llvm_cbe_diff_2e_addr = llvm_cbe_diff;
  ;
  ;
  ;
  llvm_cbe_j = 0;
  ;
  llvm_cbe_max = 0;
  ;
  _1 = llvm_cbe_s_2e_addr;
  llvm_cbe_call = strlen(_1);
  llvm_cbe_l = (((uint32_t)llvm_cbe_call));
  ;
  _2 = memset((((uint8_t*)(&llvm_cbe_cnt))), 0, 512);
  ;
  _3 = memset((((uint8_t*)(&llvm_cbe_buf))), 0, 256);
  ;
  llvm_cbe_i = 0;

  _4 = llvm_cbe_i;
  _5 = llvm_cbe_l;
while (((int32_t)_4) < ((int32_t)_5)){
  _6 = llvm_cbe_s_2e_addr;
  _7 = llvm_cbe_i;
  _8 = *((&_6[((int64_t)(((int64_t)(int32_t)_7)))]));
  llvm_cbe_arrayidx4 = (&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_8)))))]);
  _9 = *llvm_cbe_arrayidx4;
  llvm_cbe_inc = llvm_add_u32(_9, 1);
  *llvm_cbe_arrayidx4 = llvm_cbe_inc;
  _10 = llvm_cbe_max;
  if ((((((int32_t)llvm_cbe_inc) > ((int32_t)_10))&1))) {
  _11 = llvm_cbe_s_2e_addr;
  _12 = llvm_cbe_i;
  _13 = *((&_11[((int64_t)(((int64_t)(int32_t)_12)))]));
  _14 = *((&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)(((int32_t)(int8_t)_13)))))]));
  llvm_cbe_max = _14;

}

  _15 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_15, 1));

  _4 = llvm_cbe_i;
  _5 = llvm_cbe_l;
}
  llvm_cbe_i = 0;

  _16 = llvm_cbe_i;
while (((int32_t)_16) < ((int32_t)128u)){

  uint64_t llvm_cbe_idxprom17;
  uint32_t llvm_cbe_dec;
  _17 = llvm_cbe_i;
  llvm_cbe_idxprom17 = ((int64_t)(int32_t)_17);
  llvm_cbe_arrayidx18 = (&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)_17)))]);
  _18 = *llvm_cbe_arrayidx18;
  llvm_cbe_dec = llvm_add_u32(_18, -1);
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_18, -1));
while (_18 != 0u){
  _19 = llvm_cbe_i;
  _20 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_20, 1));
  *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)_20)))])) = (((uint8_t)_19));

  _17 = llvm_cbe_i;
  llvm_cbe_idxprom17 = ((int64_t)(int32_t)_17);
  llvm_cbe_arrayidx18 = (&llvm_cbe_cnt.array[((int64_t)(((int64_t)(int32_t)_17)))]);
  _18 = *llvm_cbe_arrayidx18;
  llvm_cbe_dec = llvm_add_u32(_18, -1);
  *llvm_cbe_arrayidx18 = (llvm_add_u32(_18, -1));
}

  _21 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_21, 1));

  _16 = llvm_cbe_i;
}
  _22 = llvm_cbe_s_2e_addr;
  llvm_cbe_call26 = strdup(_22);
  llvm_cbe_r = llvm_cbe_call26;
  llvm_cbe_i = 0;

  _23 = llvm_cbe_i;
  _24 = llvm_cbe_l;
while (((int32_t)_23) < ((int32_t)_24)){
  llvm_cbe_j = 0;

  _25 = llvm_cbe_j;
  _26 = llvm_cbe_l;
while (((int32_t)_25) < ((int32_t)_26)){
  _27 = llvm_cbe_r;
  _28 = llvm_cbe_i;
  _29 = *((&_27[((int64_t)(((int64_t)(int32_t)_28)))]));
  _30 = llvm_cbe_j;
  _31 = *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)_30)))]));
  if (((((((int32_t)(int8_t)_29)) == (((int32_t)(int8_t)_31)))&1))) {
  _32 = llvm_cbe_j;
  _33 = llvm_cbe_max;
  _34 = llvm_cbe_l;
  _35 = *((&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)(llvm_srem_u32((llvm_add_u32(_32, _33)), _34)))))]));
  _36 = llvm_cbe_r;
  _37 = llvm_cbe_i;
  *((&_36[((int64_t)(((int64_t)(int32_t)_37)))])) = (((uint8_t)((((int32_t)(int8_t)_35)) & -129)));
  _38 = llvm_cbe_j;
  llvm_cbe_arrayidx51 = (&llvm_cbe_buf.array[((int64_t)(((int64_t)(int32_t)_38)))]);
  _39 = *llvm_cbe_arrayidx51;
  *llvm_cbe_arrayidx51 = (((uint8_t)((((int32_t)(int8_t)_39)) | 128)));
  break;
  } else {

  _40 = llvm_cbe_j;
  llvm_cbe_j = (llvm_add_u32(_40, 1));

  _25 = llvm_cbe_j;
  _26 = llvm_cbe_l;
  if (!(((((int32_t)_25) < ((int32_t)_26))&1))) {
  }

}
  _25 = llvm_cbe_j;
  _26 = llvm_cbe_l;
}


  _41 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_41, 1));

  _23 = llvm_cbe_i;
  _24 = llvm_cbe_l;
}
  _42 = llvm_cbe_diff_2e_addr;
  *_42 = 0;
  llvm_cbe_i = 0;

  _43 = llvm_cbe_i;
  _44 = llvm_cbe_l;
while (((int32_t)_43) < ((int32_t)_44)){
  _45 = llvm_cbe_r;
  _46 = llvm_cbe_i;
  _47 = *((&_45[((int64_t)(((int64_t)(int32_t)_46)))]));
  _48 = llvm_cbe_s_2e_addr;
  _49 = llvm_cbe_i;
  _50 = *((&_48[((int64_t)(((int64_t)(int32_t)_49)))]));
  _51 = llvm_cbe_diff_2e_addr;
  _52 = *_51;
  *_51 = (llvm_add_u32(_52, (((uint32_t)(bool)((((((int32_t)(int8_t)_47)) == (((int32_t)(int8_t)_50)))&1))))));

  _53 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_53, 1));

  _43 = llvm_cbe_i;
  _44 = llvm_cbe_l;
}
  _54 = llvm_cbe_r;
  return _54;
}


int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_d;    /* Address-exposed local */
  uint8_t* llvm_cbe_r;    /* Address-exposed local */
  __MSALIGN__(16) struct l_array_7_uint8_t_KC_ llvm_cbe_t __attribute__((aligned(16)));    /* Address-exposed local */
  uint8_t* _55;
  uint8_t* _56;
  struct l_array_7_uint8_t_KC_* _57;
  uint32_t _58;
  uint8_t* _59;
  uint32_t _60;
  uint8_t* _61;
  uint8_t* llvm_cbe_call;
  uint32_t _62;
  uint8_t* _63;
  uint8_t* _64;
  uint32_t _65;
  uint32_t llvm_cbe_call5;
  uint32_t _66;

  llvm_cbe_retval = 0;
  ;
  ;
  ;
  ;
  _55 = ((uint8_t*)(&llvm_cbe_t));
  _56 = memset(_55, 0, 56);
  _57 = ((struct l_array_7_uint8_t_KC_*)_55);
  *((&(*_57).array[((int32_t)0)])) = ((&_OC_str.array[((int32_t)0)]));
  *((&(*_57).array[((int32_t)1)])) = ((&_OC_str_OC_1.array[((int32_t)0)]));
  *((&(*_57).array[((int32_t)2)])) = ((&_OC_str_OC_2.array[((int32_t)0)]));
  *((&(*_57).array[((int32_t)3)])) = ((&_OC_str_OC_3.array[((int32_t)0)]));
  *((&(*_57).array[((int32_t)4)])) = ((&_OC_str_OC_4.array[((int32_t)0)]));
  *((&(*_57).array[((int32_t)5)])) = ((&_OC_str_OC_5.array[((int32_t)0)]));
  llvm_cbe_i = 0;

  uint64_t llvm_cbe_idxprom;
  uint8_t** llvm_cbe_arrayidx;
  _58 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_58);
  llvm_cbe_arrayidx = (&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)_58)))]);
  _59 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)_58)))]));
while (_59 != ((uint8_t*)/*NULL*/0)){
  _60 = llvm_cbe_i;
  _61 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)_60)))]));
  llvm_cbe_call = best_shuffle(_61, (&llvm_cbe_d));
  llvm_cbe_r = llvm_cbe_call;
  _62 = llvm_cbe_i;
  _63 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)_62)))]));
  _64 = llvm_cbe_r;
  _65 = llvm_cbe_d;
  llvm_cbe_call5 = printf(((&_OC_str_OC_6.array[((int64_t)0)])), _63, _64, _65);

  _66 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_66, 1));

  _58 = llvm_cbe_i;
  llvm_cbe_idxprom = ((int64_t)(int32_t)_58);
  llvm_cbe_arrayidx = (&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)_58)))]);
  _59 = *((&llvm_cbe_t.array[((int64_t)(((int64_t)(int32_t)_58)))]));
}
  return 0;
}

