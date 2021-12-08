/* Provide Declarations */
#include <stdint.h>
#ifndef __cplusplus
typedef unsigned char bool;
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
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_2_uint8_t {
  uint8_t array[2];
};
struct l_array_60_uint8_t {
  uint8_t array[60];
};
struct l_array_94_uint8_t {
  uint8_t array[94];
};
struct l_array_90_uint8_t {
  uint8_t array[90];
};
struct l_array_125_uint8_t {
  uint8_t array[125];
};
struct l_array_81_uint8_t {
  uint8_t array[81];
};
struct l_array_113_uint8_t {
  uint8_t array[113];
};
struct l_array_127_uint8_t {
  uint8_t array[127];
};
struct l_array_4_uint8_t {
  uint8_t array[4];
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

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
struct l_struct_struct_OC__IO_FILE* fopen(uint8_t*, uint8_t*);
uint32_t fprintf(struct l_struct_struct_OC__IO_FILE*, uint8_t*, ...);
uint32_t fclose(struct l_struct_struct_OC__IO_FILE*);


/* Global Variable Definitions and Initialization */
static struct l_array_10_uint8_t _OC_str = { "TAPE.FILE" };
static struct l_array_2_uint8_t _OC_str_OC_1 = { "w" };
static struct l_array_60_uint8_t _OC_str_OC_2 = { "This code should be able to write a file to magnetic tape.\n" };
static struct l_array_94_uint8_t _OC_str_OC_3 = { "The Wikipedia page on Magnetic tape data storage shows that magnetic tapes are still in use.\n" };
static struct l_array_90_uint8_t _OC_str_OC_4 = { "In fact, the latest format, at the time of writing this code is TS1155 released in 2017.\n" };
static struct l_array_125_uint8_t _OC_str_OC_5 = { "And since C is already 44, maybe 45, years old in 2017, I am sure someone somewhere did use a C compiler on magnetic tapes.\n" };
static struct l_array_81_uint8_t _OC_str_OC_6 = { "If you happen to have one, please try to compile and execute me on that system.\n" };
static struct l_array_113_uint8_t _OC_str_OC_7 = { "My creator tested me on an i5 machine with SSD and RAM that couldn't have even been dreamt of by Denis Ritchie.\n" };
static struct l_array_127_uint8_t _OC_str_OC_8 = { "Who knows ? Maybe he did foresee today, after all he created something which is still young after 44-45 years and counting...\n" };
static struct l_array_4_uint8_t _OC_str_OC_9 = { "EOF" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  struct l_struct_struct_OC__IO_FILE* llvm_cbe_fp;    /* Address-exposed local */
  struct l_struct_struct_OC__IO_FILE* llvm_cbe_call;
  struct l_struct_struct_OC__IO_FILE* _1;
  uint32_t llvm_cbe_call1;
  struct l_struct_struct_OC__IO_FILE* _2;
  uint32_t llvm_cbe_call2;
  struct l_struct_struct_OC__IO_FILE* _3;
  uint32_t llvm_cbe_call3;
  struct l_struct_struct_OC__IO_FILE* _4;
  uint32_t llvm_cbe_call4;
  struct l_struct_struct_OC__IO_FILE* _5;
  uint32_t llvm_cbe_call5;
  struct l_struct_struct_OC__IO_FILE* _6;
  uint32_t llvm_cbe_call6;
  struct l_struct_struct_OC__IO_FILE* _7;
  uint32_t llvm_cbe_call7;
  struct l_struct_struct_OC__IO_FILE* _8;
  uint32_t llvm_cbe_call8;
  struct l_struct_struct_OC__IO_FILE* _9;
  uint32_t llvm_cbe_call9;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_call = fopen(((&_OC_str.array[((int64_t)0)])), ((&_OC_str_OC_1.array[((int64_t)0)])));
  llvm_cbe_fp = llvm_cbe_call;
  _1 = llvm_cbe_fp;
  llvm_cbe_call1 = fprintf(_1, ((&_OC_str_OC_2.array[((int64_t)0)])));
  _2 = llvm_cbe_fp;
  llvm_cbe_call2 = fprintf(_2, ((&_OC_str_OC_3.array[((int64_t)0)])));
  _3 = llvm_cbe_fp;
  llvm_cbe_call3 = fprintf(_3, ((&_OC_str_OC_4.array[((int64_t)0)])));
  _4 = llvm_cbe_fp;
  llvm_cbe_call4 = fprintf(_4, ((&_OC_str_OC_5.array[((int64_t)0)])));
  _5 = llvm_cbe_fp;
  llvm_cbe_call5 = fprintf(_5, ((&_OC_str_OC_6.array[((int64_t)0)])));
  _6 = llvm_cbe_fp;
  llvm_cbe_call6 = fprintf(_6, ((&_OC_str_OC_7.array[((int64_t)0)])));
  _7 = llvm_cbe_fp;
  llvm_cbe_call7 = fprintf(_7, ((&_OC_str_OC_8.array[((int64_t)0)])));
  _8 = llvm_cbe_fp;
  llvm_cbe_call8 = fprintf(_8, ((&_OC_str_OC_9.array[((int64_t)0)])));
  _9 = llvm_cbe_fp;
  llvm_cbe_call9 = fclose(_9);
  return 0;
}

