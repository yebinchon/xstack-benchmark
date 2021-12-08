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

/* Function definitions */

/* Types Definitions */
struct l_array_296_uint8_t {
  uint8_t array[296];
};
struct l_array_17_uint8_t {
  uint8_t array[17];
};
struct l_array_20_uint8_t {
  uint8_t array[20];
};
struct l_array_10_uint8_t {
  uint8_t array[10];
};
struct l_array_5_uint8_t {
  uint8_t array[5];
};
struct l_array_6_uint8_t {
  uint8_t array[6];
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(void) __ATTRIBUTELIST__((noinline, nothrow));
uint32_t printf(uint8_t*, ...);
uint32_t putchar(uint32_t);
uint32_t puts(uint8_t*);


/* Global Variable Definitions and Initialization */
static struct l_array_296_uint8_t _OC_str = { "Character,Speech\nThe multitude,The messiah! Show us the messiah!\nBrians mother,<angry>Now you listen here! He's not the messiah; he's a very naughty boy! Now go away!</angry>\nThe multitude,Who are you?\nBrians mother,I'm his mother; that's who!\nThe multitude,Behold his mother! Behold his mother!" };
uint8_t* input = ((&_OC_str.array[((int32_t)0)]));
static struct l_array_17_uint8_t _OC_str_OC_1 = { "<table>\n<tr><td>" };
static struct l_array_20_uint8_t _OC_str_OC_2 = { "</td></tr>\n<tr><td>" };
static struct l_array_10_uint8_t _OC_str_OC_3 = { "</td><td>" };
static struct l_array_5_uint8_t _OC_str_OC_4 = { "&lt;" };
static struct l_array_5_uint8_t _OC_str_OC_5 = { "&gt;" };
static struct l_array_6_uint8_t _OC_str_OC_6 = { "&amp;" };
static struct l_array_20_uint8_t _OC_str_OC_7 = { "</td></tr>\n</table>" };


/* LLVM Intrinsic Builtin Function Bodies */


/* Function Bodies */

int main(void) {
  uint32_t llvm_cbe_retval;    /* Address-exposed local */
  uint8_t* llvm_cbe_s;    /* Address-exposed local */
  uint32_t llvm_cbe_call;
  uint8_t* _1;
  uint8_t* _2;
  uint8_t _3;
  uint8_t* _4;
  uint8_t _5;
  uint32_t llvm_cbe_call1;
  uint32_t llvm_cbe_call3;
  uint32_t llvm_cbe_call5;
  uint32_t llvm_cbe_call7;
  uint32_t llvm_cbe_call9;
  uint8_t* _6;
  uint8_t _7;
  uint32_t llvm_cbe_call11;
  uint8_t* _8;
  uint32_t llvm_cbe_call12;

  llvm_cbe_retval = 0;
  ;
  llvm_cbe_call = printf(((&_OC_str_OC_1.array[((int64_t)0)])));
  _1 = input;
  llvm_cbe_s = _1;

  _2 = llvm_cbe_s;
  _3 = *_2;
while (_3 != ((uint8_t)0)){
  _4 = llvm_cbe_s;
  _5 = *_4;
  switch ((((int32_t)(int8_t)_5))) {
  default:
  case 10u:
    break;
  case 44u:
    break;
  case 60u:
    break;
  case 62u:
    break;
  case 38u:
    break;
  }

  llvm_cbe_call9 = printf(((&_OC_str_OC_6.array[((int64_t)0)])));

  llvm_cbe_call7 = printf(((&_OC_str_OC_5.array[((int64_t)0)])));

  llvm_cbe_call5 = printf(((&_OC_str_OC_4.array[((int64_t)0)])));

  llvm_cbe_call3 = printf(((&_OC_str_OC_3.array[((int64_t)0)])));

  llvm_cbe_call1 = printf(((&_OC_str_OC_2.array[((int64_t)0)])));

  _6 = llvm_cbe_s;
  _7 = *_6;
  llvm_cbe_call11 = putchar((((int32_t)(int8_t)_7)));


  _8 = llvm_cbe_s;
  llvm_cbe_s = ((&_8[((int32_t)1)]));

  _2 = llvm_cbe_s;
  _3 = *_2;
}
  llvm_cbe_call12 = puts(((&_OC_str_OC_7.array[((int64_t)0)])));
  return 0;
}

