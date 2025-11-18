/* Provide Declarations */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
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

static __forceinline int llvm_fcmp_olt(double X, double Y) { return X <  Y; }


/* Global Declarations */

/* Types Declarations */
struct __FIXME__l_struct_struct_OC_record;
struct __FIXME__l_struct_struct_OC_latLong;
struct __FIXME__l_struct_struct_OC_dim3;
struct __FIXME__l_unnamed_1;

/* Function definitions */

/* Types Definitions */
struct __FIXME__l_array_1_uint8_t {
  uint8_t array[1];
};
struct __FIXME__l_array_20_uint8_t {
  uint8_t array[20];
};
struct __FIXME__l_array_53_uint8_t {
  uint8_t array[53];
};
struct __FIXME__l_struct_struct_OC_record {
  uint8_t __FIXME__l_struct_struct_OC_record_field0[53];
  float __FIXME__l_struct_struct_OC_record_field1;
};
struct __FIXME__l_struct_struct_OC_latLong {
  float __FIXME__l_struct_struct_OC_latLong_field0;
  float __FIXME__l_struct_struct_OC_latLong_field1;
};
struct __FIXME__l_struct_struct_OC_dim3 {
  uint32_t __FIXME__l_struct_struct_OC_dim3_field0;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field1;
  uint32_t __FIXME__l_struct_struct_OC_dim3_field2;
};
struct __FIXME__l_unnamed_1 {
  uint64_t __FIXME__l_unnamed_1_field0;
  uint32_t __FIXME__l_unnamed_1_field1;
};

/* External Global Variable Declarations */

/* Function Declarations */
int main(int, char **) __ATTRIBUTELIST__((noinline));
uint32_t parseCommandline(uint32_t, uint8_t**, uint8_t*, uint32_t*, float*, float*, uint32_t*, uint32_t*, uint32_t*, uint32_t*) __ATTRIBUTELIST__((noinline, nothrow));
void printUsage(void) __ATTRIBUTELIST__((noinline));
uint32_t loadData(uint8_t*, struct __FIXME__l_struct_struct_OC_record*, struct __FIXME__l_struct_struct_OC_latLong*) __ATTRIBUTELIST__((noinline));
void findLowest(struct __FIXME__l_struct_struct_OC_record*, float*, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
//uint32_t feof(FILE*) __ATTRIBUTELIST__((nothrow));
//uint8_t* fgets(uint8_t*, uint32_t, FILE*);
//double atof(uint8_t*) __ATTRIBUTELIST__((nothrow, pure));
//uint8_t* strncpy(uint8_t*, uint8_t*, uint64_t) __ATTRIBUTELIST__((nothrow));
//float sqrt(float);
void euclid(struct __FIXME__l_struct_struct_OC_latLong*, float*, uint32_t, float, float, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint8_t _OC_str[20] = { "%s --> Distance=%f\n" };
uint8_t _OC_str_OC_1[2] = { "r" };
uint8_t _OC_str_OC_2[4] = { "%s\n" };
uint8_t _OC_str_OC_3[24] = { "error reading filelist\n" };
uint8_t _OC_str_OC_4[20] = { "error opening a db\n" };
uint8_t _OC_str_OC_5[24] = { "Nearest Neighbor Usage\n" };
uint8_t _OC_str_OC_6[2] = { "\n" };
uint8_t _OC_str_OC_7[90] = { "nearestNeighbor [filename] -r [int] -lat [float] -lng [float] [-hqt] [-p [int] -d [int]]\n" };
uint8_t _OC_str_OC_8[10] = { "example:\n" };
uint8_t _OC_str_OC_9[55] = { "$ ./nearestNeighbor filelist.txt -r 5 -lat 30 -lng 90\n" };
uint8_t _OC_str_OC_10[59] = { "filename     the filename that lists the data input files\n" };
uint8_t _OC_str_OC_11[60] = { "-r [int]     the number of records to return (default: 10)\n" };
uint8_t _OC_str_OC_12[62] = { "-lat [float] the latitude for nearest neighbors (default: 0)\n" };
uint8_t _OC_str_OC_13[63] = { "-lng [float] the longitude for nearest neighbors (default: 0)\n" };
uint8_t _OC_str_OC_14[36] = { "-h, --help   Display the help file\n" };
uint8_t _OC_str_OC_15[52] = { "-q           Quiet mode. Suppress all text output.\n" };
uint8_t _OC_str_OC_16[40] = { "-t           Print timing information.\n" };
uint8_t _OC_str_OC_17[73] = { "-p [int]     Choose the platform (must choose both platform and device)\n" };
uint8_t _OC_str_OC_18[71] = { "-d [int]     Choose the device (must choose both platform and device)\n" };
uint8_t _OC_str_OC_19[60] = { "Notes: 1. The filename is required as the first parameter.\n" };
uint8_t _OC_str_OC_20[61] = { "       2. If you declare either the device or the platform,\n" };
uint8_t _OC_str_OC_21[35] = { "          you must declare both.\n\n" };


/* LLVM Intrinsic Builtin Function Bodies */
static __forceinline uint32_t llvm_add_u32(uint32_t a, uint32_t b) {
  uint32_t r = a + b;
  return r;
}
static __forceinline uint64_t llvm_add_u64(uint64_t a, uint64_t b) {
  uint64_t r = a + b;
  return r;
}
static __forceinline float llvm_fadd_f32(float a, float b) {
  float r = a + b;
  return r;
}
static __forceinline uint64_t llvm_sub_u64(uint64_t a, uint64_t b) {
  uint64_t r = a - b;
  return r;
}
static __forceinline float llvm_fsub_f32(float a, float b) {
  float r = a - b;
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
static __forceinline float llvm_fmul_f32(float a, float b) {
  float r = a * b;
  return r;
}
static __forceinline uint64_t llvm_udiv_u64(uint64_t a, uint64_t b) {
  uint64_t r = a / b;
  return r;
}


/* Function Bodies */

// MAIN START
int main(int argc, char ** argv) {
  float lat;    /* Address-exposed local */
  float lng;    /* Address-exposed local */
  uint32_t quiet;    /* Address-exposed local */
  uint32_t timing;    /* Address-exposed local */
  uint32_t platform;    /* Address-exposed local */
  uint32_t device;    /* Address-exposed local */
  uint8_t filename[100];    /* Address-exposed local */
  uint32_t resultsCount;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 gridDim;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp26;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp26_2e_coerce;    /* Address-exposed local */
  uint8_t* records;
  uint8_t* locations;
  int32_t __FIXME__call2;
  int32_t numRecords;
  uint64_t blocks;
  uint64_t gridY;
  uint8_t* distances;
  uint32_t i;
  uint32_t j;
  uint32_t k;

// INSERT COMMENT IFELSE: main::entry
  quiet = 0;
  timing = 0;
  platform = 0;
  device = 0;
  records = malloc(60000000);
  locations = malloc(8000000);
  resultsCount = 10;
  __FIXME__call2 = parseCommandline(argc, argv, filename, (&resultsCount), (&lat), (&lng), (&quiet), (&timing), (&platform), (&device));
  if (__FIXME__call2 != 0) { // IFELSE MARKER: entry IF
printUsage();
return 0;
  }
// INSERT COMMENT IFELSE: main::if.end
  numRecords = loadData(filename, ((struct __FIXME__l_struct_struct_OC_record*)records), ((struct __FIXME__l_struct_struct_OC_latLong*)locations));
  if (resultsCount > numRecords) { // IFELSE MARKER: if.end IF
  resultsCount = numRecords;
  }
  printf("Loaded %d records\n", numRecords);
  blocks = (((numRecords + 256) - 1) / 256);
  gridY = (((blocks + 65535) - 1) / 65535);
  gridDim.__FIXME__l_struct_struct_OC_dim3_field0 = (((blocks + gridY) - 1) / gridY);
  gridDim.__FIXME__l_struct_struct_OC_dim3_field1 = gridY;
  gridDim.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  distances = malloc(4 * numRecords);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&gridDim)), 12);
  __FIXME__agg_2e_tmp26.__FIXME__l_struct_struct_OC_dim3_field0 = 256;
  __FIXME__agg_2e_tmp26.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  __FIXME__agg_2e_tmp26.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp26_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp26)), 12);
// INSERT COMMENT LOOP: main::header.0
#pragma omp parallel for collapse(3)
for(int32_t i = 0; i < (((blocks + gridY) - 1) / gridY);   i = i + 1) {
for(int32_t j = 0; j < gridY;   j = j + 1) {
for(int32_t k = 0; k < 256;   k = k + 1) {
euclid(((struct __FIXME__l_struct_struct_OC_latLong*)locations), ((float*)distances), numRecords, lat, lng, (((blocks + gridY) - 1) / gridY), gridY, 1, 256, 1, 1, i, j, 0, k, 0, 0);
}
}
}
// INSERT COMMENT IFELSE: main::kcall.end
  findLowest(((struct __FIXME__l_struct_struct_OC_record*)records), ((float*)distances), numRecords, resultsCount);
;
  if (quiet == 0) { // IFELSE MARKER: kcall.end IF
// INSERT COMMENT LOOP: main::for.cond
for(int64_t i = 0; i < resultsCount;   i = i + 1) {
  printf((_OC_str), (((struct __FIXME__l_struct_struct_OC_record*)records)+i)->__FIXME__l_struct_struct_OC_record_field0, ((double)(((struct __FIXME__l_struct_struct_OC_record*)records)+i)->__FIXME__l_struct_struct_OC_record_field1));
}
  }
free(((uint8_t*)((float*)distances)));
  return 0;
}
// MAIN END


// FUNCTION ORDER ID 0 START
// INSERT COMMENT FUNCTION: parseCommandline
uint32_t parseCommandline(uint32_t argc, uint8_t** argv, uint8_t* filename, uint32_t* r, float* lat, float* lng, uint32_t* q, uint32_t* t, uint32_t* p, uint32_t* d) {
  int64_t i;
  uint8_t help;
  uint32_t __FIXME__retval_2e_0;

// INSERT COMMENT IFELSE: parseCommandline::entry
  if (argc < 2) { // IFELSE MARKER: entry IF
  return 1;
  }
  strncpy(filename, argv[1], 100);
  i = 1;
  help = ((uint8_t)0);
// INSERT COMMENT LOOP: parseCommandline::for.cond
while (i < argc) {
  if (argv[i][0] == 45) { // IFELSE MARKER: for.body IF
  switch (argv[i][1]) {
  case 114:
  i = i + 1;
  uint32_t __FIXME__call12 = atoi(argv[i]);
  *r = __FIXME__call12;
    break;
  case 108:
  double __FIXME__call22 = atof(argv[(i + 1)]);
  if(argv[i][2] == 'a') {
  *lat = ((float)__FIXME__call22);
  }
  else {
  *lng = ((float)__FIXME__call22);
  }
  i = i + 1;
    break;
  case 104:
  help = ((uint8_t)1);
    break;
  case 113:
  *q = 1;
    break;
  case 116:
  *t = 1;
    break;
  case 112:
  i = i + 1;
  uint32_t __FIXME__call38 = atoi(argv[i]);
  *p = __FIXME__call38;
    break;
  case 100:
  i = i + 1;
  uint32_t __FIXME__call43 = atoi(argv[i]);
  *d = __FIXME__call43;
    break;
  default:
    break;
  }
  }
  i = i + 1;
}
// INSERT COMMENT IFELSE: parseCommandline::for.end
  if (*d >= 0) { // IFELSE MARKER: for.end IF
  if (*p < 0) { // IFELSE MARKER: land.lhs.true IF
  __FIXME__retval_2e_0 = 1;
  }
  } else { // IFELSE MARKER: for.end ELSE
  if (*p >= 0) { // IFELSE MARKER: lor.lhs.false IF
  if (*d < 0) { // IFELSE MARKER: land.lhs.true49 IF
  __FIXME__retval_2e_0 = 1;
  }
  } else { // IFELSE MARKER: lor.lhs.false ELSE
  if (help) { // IFELSE MARKER: lor.lhs.false51 IF
  __FIXME__retval_2e_0 = 1;
  }
  __FIXME__retval_2e_0 = 0;
  }
  if (help) { // IFELSE MARKER: lor.lhs.false51 IF
  __FIXME__retval_2e_0 = 1;
  }
  __FIXME__retval_2e_0 = 0;
  }
// INSERT COMMENT IFELSE: parseCommandline::lor.lhs.false
  if (*p >= 0) { // IFELSE MARKER: lor.lhs.false IF
  if (*d < 0) { // IFELSE MARKER: land.lhs.true49 IF
  __FIXME__retval_2e_0 = 1;
  }
  } else { // IFELSE MARKER: lor.lhs.false ELSE
  if (help) { // IFELSE MARKER: lor.lhs.false51 IF
  __FIXME__retval_2e_0 = 1;
  }
  __FIXME__retval_2e_0 = 0;
  }
// INSERT COMMENT IFELSE: parseCommandline::lor.lhs.false51
  if (help) { // IFELSE MARKER: lor.lhs.false51 IF
  __FIXME__retval_2e_0 = 1;
  }
  __FIXME__retval_2e_0 = 0;
  return __FIXME__retval_2e_0;
}
// FUNCTION ORDER ID 0 END


// FUNCTION ORDER ID 1 START
// INSERT COMMENT FUNCTION: printUsage
void printUsage(void) {

  printf((_OC_str_OC_5));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_7));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_8));
  printf((_OC_str_OC_9));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_10));
  printf((_OC_str_OC_11));
  printf((_OC_str_OC_12));
  printf((_OC_str_OC_13));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_14));
  printf((_OC_str_OC_15));
  printf((_OC_str_OC_16));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_17));
  printf((_OC_str_OC_18));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_6));
  printf((_OC_str_OC_19));
  printf((_OC_str_OC_20));
  printf((_OC_str_OC_21));
}
// FUNCTION ORDER ID 1 END


// FUNCTION ORDER ID 2 START
// INSERT COMMENT FUNCTION: loadData
uint32_t loadData(uint8_t* filename, struct __FIXME__l_struct_struct_OC_record* records, struct __FIXME__l_struct_struct_OC_latLong* locations) {
  uint8_t dbname[64];    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_record record;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_latLong latLong;    /* Address-exposed local */
  uint8_t substr[6];    /* Address-exposed local */
  FILE* flist;
  int32_t recNum;
  int64_t i;

  flist = fopen(filename, (_OC_str_OC_1));
  recNum = 0;
// INSERT COMMENT LOOP: loadData::while.cond
while (!feof(flist)) {
  uint32_t __FIXME__call2 = fscanf(flist, (_OC_str_OC_2), dbname);
  if (__FIXME__call2 != 1) { // IFELSE MARKER: while.body IF
  fprintf(stderr, (_OC_str_OC_3));
exit(0);
  }
  FILE* fp = fopen(dbname, (_OC_str_OC_1));
  if (fp == ((FILE*)0)) { // IFELSE MARKER: if.end IF
  printf((_OC_str_OC_4));
exit(1);
  }
while (!feof(fp)) {
  fgets(record.__FIXME__l_struct_struct_OC_record_field0, 49, fp);
  fgetc(fp);
for(int64_t i = 0; i < 5;   i = i + 1) {
  substr[i] = (&record.__FIXME__l_struct_struct_OC_record_field0)[0][i+28];
}
  substr[5] = 0;
  double __FIXME__call24 = atof(substr);
  latLong.__FIXME__l_struct_struct_OC_latLong_field0 = ((float)__FIXME__call24);
for(int64_t i = 0; i < 5;   i = i + 1) {
  substr[i] = (&record.__FIXME__l_struct_struct_OC_record_field0)[0][i+33];
}
  substr[5] = 0;
  double __FIXME__call27 = atof(substr);
  latLong.__FIXME__l_struct_struct_OC_latLong_field1 = ((float)__FIXME__call27);
  recNum = recNum + 1;
}
fclose(fp);
}
  fclose(flist);
  return recNum;
}
// FUNCTION ORDER ID 2 END


// FUNCTION ORDER ID 3 START
// INSERT COMMENT FUNCTION: findLowest
void findLowest(struct __FIXME__l_struct_struct_OC_record* records, float* distances, uint32_t numRecords, uint32_t topN) {
  int64_t i;
  int64_t j;
  int64_t __FIXME__minLoc_2e_0;
  int64_t __FIXME__minLoc_2e_0_2e_lcssa;
  float tempDist;
  struct __FIXME__l_struct_struct_OC_record tempRec;

// INSERT COMMENT LOOP: findLowest::for.cond
for(int64_t i = 0; i < topN;   i = i + 1) {
  __FIXME__minLoc_2e_0 = i;
for(int64_t j = i; j < numRecords;   j = j + 1) {
  if (llvm_fcmp_olt(distances[j], distances[__FIXME__minLoc_2e_0])) { // IFELSE MARKER: for.body3 IF
  }
}
  memcpy(((uint8_t*)(&tempRec)), ((uint8_t*)(records+i)), 60);
  memcpy(((uint8_t*)(records+i)), ((uint8_t*)(records+__FIXME__minLoc_2e_0)), 60);
  memcpy(((uint8_t*)(records+__FIXME__minLoc_2e_0)), ((uint8_t*)(&tempRec)), 60);
  tempDist = distances[i];
  distances[i] = distances[__FIXME__minLoc_2e_0];
  distances[__FIXME__minLoc_2e_0] = tempDist;
  (records+i)->__FIXME__l_struct_struct_OC_record_field1 = distances[i];
}
  return;
}
// FUNCTION ORDER ID 3 END


// FUNCTION ORDER ID 4 START
// INSERT COMMENT FUNCTION: euclid
void euclid(struct __FIXME__l_struct_struct_OC_latLong* d_locations, float* d_distances, uint32_t numRecords, float lat, float lng, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t globalId;
  float __FIXME__4;

// INSERT COMMENT IFELSE: euclid::entry
  globalId = __FIXME__blockDim_2e_x * (__FIXME__gridDim_2e_x * __FIXME__blockIdx_2e_y + __FIXME__blockIdx_2e_x) + __FIXME__threadIdx_2e_x;
  if (globalId < numRecords) { // IFELSE MARKER: entry IF
  __FIXME__4 = sqrt((lat - (d_locations+globalId)->__FIXME__l_struct_struct_OC_latLong_field0) * (lat - (d_locations+globalId)->__FIXME__l_struct_struct_OC_latLong_field0) + (lng - (d_locations+globalId)->__FIXME__l_struct_struct_OC_latLong_field1) * (lng - (d_locations+globalId)->__FIXME__l_struct_struct_OC_latLong_field1));
  d_distances[globalId] = __FIXME__4;
  }
  return;
}
// FUNCTION ORDER ID 4 END

