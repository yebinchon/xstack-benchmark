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


/* Global Variable Definitions and Initialization */
static uint8_t _OC_str[8] = { "%0.2lf " };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
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
static __forceinline uint32_t llvm_srem_u32(int32_t a, int32_t b) {
  uint32_t r = a % b;
  return r;
}
static __forceinline uint64_t llvm_ashr_u64(int64_t a, int64_t b) {
  uint64_t r = a >> b;
  return r;
}


/* Function Bodies */

int main(int argc, char ** argv) {
  uint32_t llvm_cbe_argc = (uint32_t)argc;
  uint8_t** llvm_cbe_argv = (uint8_t**)argv;
  uint64_t llvm_cbe_call_2e_i;
  uint64_t llvm_cbe_call_2e_i39;
  int64_t nj;
  uint8_t* llvm_cbe_call6;
  uint8_t* llvm_cbe_call10;
  uint64_t _1;
  uint64_t _2;
  uint64_t i;
  int64_t j;
  double _3;
  int64_t k;
  uint32_t llvm_cbe_mul_2e_i45;
  uint32_t llvm_cbe_call_2e_i48;
  uint32_t llvm_cbe_fputc26_2e_i;
  uint32_t llvm_cbe_fputc_2e_i;

  llvm_cbe_call_2e_i =  /*tail*/ strtol((llvm_cbe_argv[1]), ((uint8_t**)/*NULL*/0), 10);
;
  llvm_cbe_call_2e_i39 =  /*tail*/ strtol((llvm_cbe_argv[2]), ((uint8_t**)/*NULL*/0), 10);
;
  nj =  /*tail*/ strtol((llvm_cbe_argv[3]), ((uint8_t**)/*NULL*/0), 10);
;
  llvm_cbe_call6 =  /*tail*/ malloc((llvm_cbe_call_2e_i39 << 3) * llvm_cbe_call_2e_i39 & 34359738360);
;
  llvm_cbe_call10 =  /*tail*/ malloc(((llvm_cbe_call_2e_i39 << 32) * nj >> 29));
;
for(i = 0; !(i == llvm_cbe_call_2e_i39);  i = (i + 1)){
for(j = 0; !(j == nj);  j = (j + 1)){
  (((double*)llvm_cbe_call10)+i * nj)[j] = ((double)(int32_t)((uint32_t)i)) * ((double)(int32_t)((uint32_t)j)) / ((double)(int32_t)((uint32_t)llvm_cbe_call_2e_i39));
}
}
for(i = 0; !(i == llvm_cbe_call_2e_i39);  i = (i + 1)){
for(j = 0; !(j == llvm_cbe_call_2e_i39);  j = (j + 1)){
  (((double*)llvm_cbe_call6)+i * llvm_cbe_call_2e_i39)[j] = ((double)(int32_t)((uint32_t)i)) * ((double)(int32_t)((uint32_t)j)) / ((double)(int32_t)((uint32_t)llvm_cbe_call_2e_i39));
}
}
for(i = 0; !(i == llvm_cbe_call_2e_i39);  i = (i + 1)){
for(j = 0; !(j == llvm_cbe_call_2e_i39);  j = (j + 1)){
  (((double*)llvm_cbe_call6)+i * llvm_cbe_call_2e_i39)[j] = ((((double*)llvm_cbe_call6)+i * llvm_cbe_call_2e_i39)[j]) * 2123;
}
}
for(i = 0; !(i == llvm_cbe_call_2e_i39);  i = (i + 1)){
for(j = 0; !(j == llvm_cbe_call_2e_i39);  j = (j + 1)){
  _3 = ((((double*)llvm_cbe_call6)+i * llvm_cbe_call_2e_i39)[j]);
for(k = 0; !(k == nj);  k = (k + 1)){
  _3 = (_3 + ((((double*)llvm_cbe_call10)+i * nj)[k]) * 32412 * ((((double*)llvm_cbe_call10)+j * nj)[k]));
}
  (((double*)llvm_cbe_call6)+i * llvm_cbe_call_2e_i39)[j] = _3;
}
}
  if (((uint32_t)llvm_cbe_call_2e_i) == 1) {
for(i = 0; !(i == llvm_cbe_call_2e_i39);  i = (i + 1)){
  llvm_cbe_mul_2e_i45 = ((uint32_t)i) * ((uint32_t)llvm_cbe_call_2e_i39);
for(j = 0; !(j == llvm_cbe_call_2e_i39);  j = (j + 1)){
  llvm_cbe_call_2e_i48 =  /*tail*/ fprintf((stderr), (_OC_str), ((((double*)llvm_cbe_call6)+i * llvm_cbe_call_2e_i39)[j]));
;
  if ((int)(llvm_cbe_mul_2e_i45 + ((uint32_t)j)) % (int)20 == 0) {
  llvm_cbe_fputc26_2e_i =  /*tail*/ fputc(10, (stderr));
;
}

}
}
  llvm_cbe_fputc_2e_i =  /*tail*/ fputc(10, (stderr));
;
 /*tail*/ free(llvm_cbe_call6);
 /*tail*/ free(llvm_cbe_call10);
  return 0;
}

 /*tail*/ free(llvm_cbe_call6);
 /*tail*/ free(llvm_cbe_call10);
  return 0;
}

