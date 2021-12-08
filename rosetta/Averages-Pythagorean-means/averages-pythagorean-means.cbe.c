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
struct l_array_22_uint8_t {
  uint8_t array[22];
};
struct l_array_21_uint8_t {
  uint8_t array[21];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline, nothrow));
double atof(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
uint32_t printf(uint8_t*, ...);
double pow(double, double) __ATTRIBUTELIST__((nothrow));


/* Global Variable Definitions and Initialization */
static struct l_array_22_uint8_t _OC_str = { "Arithmetic mean = %f\n" };
static struct l_array_21_uint8_t _OC_str_OC_1 = { "Geometric mean = %f\n" };
static struct l_array_20_uint8_t _OC_str_OC_2 = { "Harmonic mean = %f\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint32_t llvm_cbe_argc_2e_addr;    /* Address-exposed local */
  uint8_t** llvm_cbe_argv_2e_addr;    /* Address-exposed local */
  uint32_t llvm_cbe_i;    /* Address-exposed local */
  uint32_t llvm_cbe_count;    /* Address-exposed local */
  double llvm_cbe_f;    /* Address-exposed local */
  double llvm_cbe_sum;    /* Address-exposed local */
  double llvm_cbe_prod;    /* Address-exposed local */
  double llvm_cbe_resum;    /* Address-exposed local */
  uint32_t _1;
  uint32_t _2;
  uint8_t** _3;
  uint32_t _4;
  uint8_t* _5;
  double llvm_cbe_call;
  uint32_t _6;
  double _7;
  double _8;
  double _9;
  double _10;
  double _11;
  double _12;
  uint32_t _13;
  double _14;
  uint32_t _15;
  uint32_t llvm_cbe_call4;
  double _16;
  uint32_t _17;
  double llvm_cbe_call7;
  uint32_t llvm_cbe_call8;
  uint32_t _18;
  double _19;
  uint32_t llvm_cbe_call11;

  llvm_cbe_retval = 0;
  llvm_cbe_argc_2e_addr = llvm_cbe_argc;
  ;
  llvm_cbe_argv_2e_addr = llvm_cbe_argv;
  ;
  ;
  ;
  llvm_cbe_count = 0;
  ;
  ;
  llvm_cbe_sum = 0;
  ;
  llvm_cbe_prod = 1;
  ;
  llvm_cbe_resum = 0;
  llvm_cbe_i = 1;

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_argc_2e_addr;
while (((int32_t)_1) < ((int32_t)_2)){
  _3 = llvm_cbe_argv_2e_addr;
  _4 = llvm_cbe_i;
  _5 = *((&_3[((int64_t)(((int64_t)(int32_t)_4)))]));
  llvm_cbe_call = atof(_5);
  llvm_cbe_f = llvm_cbe_call;
  _6 = llvm_cbe_count;
  llvm_cbe_count = (llvm_add_u32(_6, 1));
  _7 = llvm_cbe_f;
  _8 = llvm_cbe_sum;
  llvm_cbe_sum = (_8 + _7);
  _9 = llvm_cbe_f;
  _10 = llvm_cbe_prod;
  llvm_cbe_prod = (_10 * _9);
  _11 = llvm_cbe_f;
  _12 = llvm_cbe_resum;
  llvm_cbe_resum = (_12 + (1 / _11));

  _13 = llvm_cbe_i;
  llvm_cbe_i = (llvm_add_u32(_13, 1));

  _1 = llvm_cbe_i;
  _2 = llvm_cbe_argc_2e_addr;
}
  _14 = llvm_cbe_sum;
  _15 = llvm_cbe_count;
  llvm_cbe_call4 = printf(((&_OC_str.array[((int64_t)0)])), (_14 / (((double)(int32_t)_15))));
  _16 = llvm_cbe_prod;
  _17 = llvm_cbe_count;
  llvm_cbe_call7 = pow(_16, (1 / (((double)(int32_t)_17))));
  llvm_cbe_call8 = printf(((&_OC_str_OC_1.array[((int64_t)0)])), llvm_cbe_call7);
  _18 = llvm_cbe_count;
  _19 = llvm_cbe_resum;
  llvm_cbe_call11 = printf(((&_OC_str_OC_2.array[((int64_t)0)])), ((((double)(int32_t)_18)) / _19));
  return 0;
}

