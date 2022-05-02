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
  uint8_t field19[1];
  uint8_t* field20;
  uint64_t field21;
  void* field22;
  void* field23;
  struct l_struct_struct_OC__IO_FILE* field24;
  uint8_t* field25;
  uint64_t field26;
  uint32_t field27;
  uint8_t field28[20];
};

/* External Global Variable Declarations */
extern struct l_struct_struct_OC__IO_FILE* stderr;

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((nothrow));
uint64_t strtol(uint8_t*, uint8_t**, uint32_t) __ATTRIBUTELIST__((nothrow));
uint8_t* malloc(uint64_t) __ATTRIBUTELIST__((nothrow));
uint32_t fprintf(struct l_struct_struct_OC__IO_FILE*, uint8_t*, ...) __ATTRIBUTELIST__((nothrow));
uint32_t fputc(uint32_t, struct l_struct_struct_OC__IO_FILE*) __ATTRIBUTELIST__((nothrow));
void free(uint8_t*) __ATTRIBUTELIST__((nothrow));
uint8_t* memset(uint8_t*, uint32_t, uint64_t);


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_mul_u64(uint64_t a, uint64_t b) {
  uint64_t r = a * b;
  return r;
}
static __forceinline uint8_t llvm_udiv_u8(uint8_t a, uint8_t b) {
  uint8_t r = a / b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint64_t llvm_cbe_call_2e_i;
  uint8_t* llvm_cbe_call2;
  uint8_t* llvm_cbe_call5;
  uint8_t* llvm_cbe_call8;
  uint8_t* llvm_cbe_call11;
  uint8_t* llvm_cbe_call14;
  uint8_t* llvm_cbe_call17;
  uint8_t* llvm_cbe_call20;
  uint8_t* llvm_cbe_call23;
  uint8_t* llvm_cbe_call26;
  uint8_t* _1;
  uint8_t* _2;
  int64_t i;
  int64_t j;
  double _3;
  double _4;
  uint32_t llvm_cbe_i_2e_02_2e_i;
  uint32_t llvm_cbe_call_2e_i93;
  uint32_t llvm_cbe_fputc_2e_i;

  llvm_cbe_call_2e_i =  /*tail*/ strtol((llvm_cbe_argv[1]), ((uint8_t**)/*NULL*/0), 10);
;
  llvm_cbe_call2 =  /*tail*/ malloc(72);
;
  llvm_cbe_call5 =  /*tail*/ malloc(24);
;
  llvm_cbe_call8 =  /*tail*/ malloc(24);
;
  llvm_cbe_call11 =  /*tail*/ malloc(24);
;
  llvm_cbe_call14 =  /*tail*/ malloc(24);
;
  llvm_cbe_call17 =  /*tail*/ malloc(24);
;
  llvm_cbe_call20 =  /*tail*/ malloc(24);
;
  llvm_cbe_call23 =  /*tail*/ malloc(24);
;
  llvm_cbe_call26 =  /*tail*/ malloc(24);
;
  _1 = memset(llvm_cbe_call20, 0, 24);
;
  _2 = memset(llvm_cbe_call17, 0, 24);
;
for(i = 0; !(i == 3);  i = (i + 1)){
  ((double*)llvm_cbe_call5)[i] = ((double)(int32_t)((uint32_t)i));
  ((double*)llvm_cbe_call11)[i] = ((double)(uint8_t)(((uint8_t)(i + 1)) / 3)) * 0.5;
  ((double*)llvm_cbe_call8)[i] = ((double)(uint8_t)(((uint8_t)(i + 1)) / 3)) * 0.25;
  ((double*)llvm_cbe_call14)[i] = ((double)(uint8_t)(((uint8_t)(i + 1)) / 3)) / 6;
  ((double*)llvm_cbe_call23)[i] = ((double)(uint8_t)(((uint8_t)(i + 1)) / 3)) * 0.125;
  ((double*)llvm_cbe_call26)[i] = ((double)(uint8_t)(((uint8_t)(i + 1)) / 3)) / 9;
for(j = 0; !(j == 3);  j = (j + 1)){
  (((double*)llvm_cbe_call2)+i * 3)[j] = ((double)(int32_t)((uint32_t)i)) * ((double)(int32_t)((uint32_t)j)) / 3;
}
}
for(i = 0; !(i == 3);  i = (i + 1)){
for(j = 0; !(j == 3);  j = (j + 1)){
  (((double*)llvm_cbe_call2)+i * 3)[j] = ((((((double*)llvm_cbe_call2)+i * 3)[j]) + (((double*)llvm_cbe_call5)[i]) * (((double*)llvm_cbe_call8)[j])) + (((double*)llvm_cbe_call11)[i]) * (((double*)llvm_cbe_call14)[j]));
}
}
  _3 = 0;
for(i = 0; !(i == 3);  i = (i + 1)){
for(j = 0; !(j == 3);  j = (j + 1)){
  _3 = (_3 + ((((double*)llvm_cbe_call2)+i)[j * 3]) * 12313 * (((double*)llvm_cbe_call23)[j]));
}
  ((double*)llvm_cbe_call20)[i] = _3;
llvm_cbe_for_2e_inc45_2e_i_2e_for_2e_cond26_2e_preheader_2e_i_crit_edge:
  _3 = (((double*)llvm_cbe_call20)[(i + 1)]);
}
}

