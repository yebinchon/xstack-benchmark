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



/* Global Declarations */

/* Types Declarations */
struct __FIXME__l_struct_struct_OC_Node;
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
struct __FIXME__l_struct_struct_OC_Node {
  uint32_t __FIXME__l_struct_struct_OC_Node_field0;
  uint32_t __FIXME__l_struct_struct_OC_Node_field1;
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
void BFSGraph(uint32_t, uint8_t**) __ATTRIBUTELIST__((noinline));
void Usage(uint32_t, uint8_t**) __ATTRIBUTELIST__((noinline));
void Kernel(struct __FIXME__l_struct_struct_OC_Node*, uint32_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));
void Kernel2(uint8_t*, uint8_t*, uint8_t*, uint8_t*, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t, uint32_t) __ATTRIBUTELIST__((noinline, nothrow));


/* Global Variable Definitions and Initialization */
uint32_t no_of_nodes;
uint32_t edge_list_size;
FILE* fp;
uint8_t _OC_str_OC_1[14] = { "Reading File\n" };
uint8_t _OC_str_OC_2[2] = { "r" };
uint8_t _OC_str_OC_3[3] = { "%d" };
uint8_t _OC_str_OC_4[6] = { "%d %d" };
uint8_t _OC_str_OC_5[11] = { "Read File\n" };
uint8_t _OC_str_OC_6[33] = { "Copied Everything to GPU memory\n" };
uint8_t _OC_str_OC_7[27] = { "Start traversing the tree\n" };
uint8_t _OC_str_OC_8[11] = { "result.txt" };
uint8_t _OC_str_OC_9[2] = { "w" };
uint8_t _OC_str_OC_10[13] = { "%d) cost:%d\n" };
uint8_t _OC_str_OC_11[29] = { "Result stored in result.txt\n" };
uint8_t _OC_str[24] = { "Usage: %s <input_file>\n" };


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
static __forceinline double llvm_OC_ceil_OC_f64(double a) {
  double r;
  r = ceil(a);
  return r;
}


/* Function Bodies */

// MAIN START
int main(int argc, char ** argv) {
  no_of_nodes = 0;
  edge_list_size = 0;
BFSGraph(argc, argv);
  return 0;
}
// MAIN END


// FUNCTION ORDER ID 0 START
// INSERT COMMENT FUNCTION: BFSGraph
void BFSGraph(uint32_t argc, uint8_t** argv) {
  uint32_t source;    /* Address-exposed local */
  uint32_t start;    /* Address-exposed local */
  uint32_t edgeno;    /* Address-exposed local */
  uint32_t id;    /* Address-exposed local */
  uint32_t cost;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 grid;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 threads;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp105;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp105_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp108;    /* Address-exposed local */
  struct __FIXME__l_struct_struct_OC_dim3 __FIXME__agg_2e_tmp109;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp108_2e_coerce;    /* Address-exposed local */
  struct __FIXME__l_unnamed_1 __FIXME__agg_2e_tmp109_2e_coerce;    /* Address-exposed local */
  FILE* __FIXME__call1;
  double __FIXME__1;
  uint32_t num_of_threads_per_block;
  uint32_t num_of_blocks;
  uint8_t* h_graph_nodes;
  uint8_t* h_graph_mask;
  uint8_t* h_updating_graph_mask;
  uint8_t* h_graph_visited;
  int64_t i;
  uint8_t* h_graph_edges;
  uint8_t* h_cost;
  uint8_t* stop;
  uint32_t __FIXME__indvar_2e_0;
  uint32_t __FIXME__indvar_2e_1;
  uint32_t __FIXME__indvar_2e_019;
  uint32_t __FIXME__indvar_2e_116;
  FILE* fpo;

// INSERT COMMENT IFELSE: BFSGraph::entry
  printf((_OC_str_OC_1));
  __FIXME__call1 = fopen(argv[1], (_OC_str_OC_2));
  fp = __FIXME__call1;
  source = 0;
  fscanf(fp, (_OC_str_OC_3), (&no_of_nodes));
  if (no_of_nodes > 512) { // IFELSE MARKER: entry IF
  __FIXME__1 = /*__FIXME__INTRINSIC_CALL__*/llvm_OC_ceil_OC_f64(((double)(no_of_nodes) / 512));
  num_of_threads_per_block = 512;
  }
  h_graph_nodes = malloc(8 * no_of_nodes);
  h_graph_mask = malloc(1 * no_of_nodes);
  h_updating_graph_mask = malloc(1 * no_of_nodes);
  h_graph_visited = malloc(1 * no_of_nodes);
// INSERT COMMENT LOOP: BFSGraph::for.cond
for(int64_t i = 0; i < no_of_nodes;   i = i + 1) {
  fscanf(fp, (_OC_str_OC_4), (&start), (&edgeno));
  (((struct __FIXME__l_struct_struct_OC_Node*)h_graph_nodes)+i)->__FIXME__l_struct_struct_OC_Node_field0 = start;
  (((struct __FIXME__l_struct_struct_OC_Node*)h_graph_nodes)+i)->__FIXME__l_struct_struct_OC_Node_field1 = edgeno;
  h_graph_mask[i] = 0;
  h_updating_graph_mask[i] = 0;
  h_graph_visited[i] = 0;
}
  fscanf(fp, (_OC_str_OC_3), (&source));
  source = 0;
  h_graph_mask[source] = 1;
  h_graph_visited[source] = 1;
  fscanf(fp, (_OC_str_OC_3), (&edge_list_size));
  h_graph_edges = malloc(4 * edge_list_size);
// INSERT COMMENT LOOP: BFSGraph::for.cond36
for(int64_t i = 0; i < edge_list_size;   i = i + 1) {
  fscanf(fp, (_OC_str_OC_3), (&id));
  fscanf(fp, (_OC_str_OC_3), (&cost));
  ((uint32_t*)h_graph_edges)[i] = id;
}
// INSERT COMMENT IFELSE: BFSGraph::for.end45
  if (fp != ((FILE*)0)) { // IFELSE MARKER: for.end45 IF
  fclose(fp);
  }
  printf((_OC_str_OC_5));
  h_cost = malloc(4 * no_of_nodes);
// INSERT COMMENT LOOP: BFSGraph::for.cond84
for(int64_t i = 0; i < no_of_nodes;   i = i + 1) {
  ((uint32_t*)h_cost)[i] = -1;
}
  ((uint32_t*)h_cost)[source] = 0;
  printf((_OC_str_OC_6));
  grid.__FIXME__l_struct_struct_OC_dim3_field0 = num_of_blocks;
  grid.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  grid.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  threads.__FIXME__l_struct_struct_OC_dim3_field0 = num_of_threads_per_block;
  threads.__FIXME__l_struct_struct_OC_dim3_field1 = 1;
  threads.__FIXME__l_struct_struct_OC_dim3_field2 = 1;
  printf((_OC_str_OC_7));
  stop = malloc(1);
// INSERT COMMENT LOOP: BFSGraph::do.body
do {
  *stop = 0;
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp105)), ((uint8_t*)(&threads)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp105_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp105)), 12);
#pragma omp parallel for collapse(2)
for(int32_t __FIXME__indvar_2e_0 = 0; __FIXME__indvar_2e_0 < num_of_blocks;   __FIXME__indvar_2e_0 = __FIXME__indvar_2e_0 + 1) {
for(int32_t __FIXME__indvar_2e_1 = 0; __FIXME__indvar_2e_1 < num_of_threads_per_block;   __FIXME__indvar_2e_1 = __FIXME__indvar_2e_1 + 1) {
Kernel(((struct __FIXME__l_struct_struct_OC_Node*)h_graph_nodes), ((uint32_t*)h_graph_edges), h_graph_mask, h_updating_graph_mask, h_graph_visited, ((uint32_t*)h_cost), no_of_nodes, num_of_blocks, 1, 1, num_of_threads_per_block, 1, 1, __FIXME__indvar_2e_0, 0, 0, __FIXME__indvar_2e_1, 0, 0);
}
}
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp108)), ((uint8_t*)(&grid)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp109)), ((uint8_t*)(&threads)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp108_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp108)), 12);
  memcpy(((uint8_t*)(&__FIXME__agg_2e_tmp109_2e_coerce)), ((uint8_t*)(&__FIXME__agg_2e_tmp109)), 12);
#pragma omp parallel for collapse(2)
for(int32_t __FIXME__indvar_2e_019 = 0; __FIXME__indvar_2e_019 < num_of_blocks;   __FIXME__indvar_2e_019 = __FIXME__indvar_2e_019 + 1) {
for(int32_t __FIXME__indvar_2e_116 = 0; __FIXME__indvar_2e_116 < num_of_threads_per_block;   __FIXME__indvar_2e_116 = __FIXME__indvar_2e_116 + 1) {
Kernel2(h_graph_mask, h_updating_graph_mask, h_graph_visited, stop, no_of_nodes, num_of_blocks, 1, 1, num_of_threads_per_block, 1, 1, __FIXME__indvar_2e_019, 0, 0, __FIXME__indvar_2e_116, 0, 0);
}
}
} while(*stop);
  fpo = fopen((_OC_str_OC_8), (_OC_str_OC_9));
// INSERT COMMENT LOOP: BFSGraph::for.cond121
for(int64_t i = 0; i < no_of_nodes;   i = i + 1) {
  fprintf(fpo, (_OC_str_OC_10), i, ((uint32_t*)h_cost)[i]);
}
  fclose(fpo);
  printf((_OC_str_OC_11));
free(((uint8_t*)((struct __FIXME__l_struct_struct_OC_Node*)h_graph_nodes)));
free(((uint8_t*)((uint32_t*)h_graph_edges)));
free(h_graph_mask);
free(h_updating_graph_mask);
free(h_graph_visited);
free(((uint8_t*)((uint32_t*)h_cost)));
}
// FUNCTION ORDER ID 0 END


// FUNCTION ORDER ID 1 START
// INSERT COMMENT FUNCTION: Kernel
void Kernel(struct __FIXME__l_struct_struct_OC_Node* g_graph_nodes, uint32_t* g_graph_edges, uint8_t* g_graph_mask, uint8_t* g_updating_graph_mask, uint8_t* g_graph_visited, uint32_t* g_cost, uint32_t no_of_nodes, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t tid;
  int64_t i;

// INSERT COMMENT IFELSE: Kernel::entry
  tid = __FIXME__blockIdx_2e_x * 512 + __FIXME__threadIdx_2e_x;
  if (tid < no_of_nodes) { // IFELSE MARKER: entry IF
  if (g_graph_mask[tid]) { // IFELSE MARKER: land.lhs.true IF
  g_graph_mask[tid] = 0;
for(int64_t i = (g_graph_nodes+tid)->__FIXME__l_struct_struct_OC_Node_field0; i < (g_graph_nodes+tid)->__FIXME__l_struct_struct_OC_Node_field1 + (g_graph_nodes+tid)->__FIXME__l_struct_struct_OC_Node_field0;   i = i + 1) {
  if (g_graph_visited[g_graph_edges[i]]) { // IFELSE MARKER: for.body IF
  } else { // IFELSE MARKER: for.body ELSE
  g_cost[g_graph_edges[i]] = g_cost[tid] + 1;
  g_updating_graph_mask[g_graph_edges[i]] = 1;
  }
}
  }
  }
  return;
}
// FUNCTION ORDER ID 1 END


// FUNCTION ORDER ID 2 START
// INSERT COMMENT FUNCTION: Kernel2
void Kernel2(uint8_t* g_graph_mask, uint8_t* g_updating_graph_mask, uint8_t* g_graph_visited, uint8_t* g_over, uint32_t no_of_nodes, uint32_t __FIXME__gridDim_2e_x, uint32_t __FIXME__gridDim_2e_y, uint32_t __FIXME__gridDim_2e_z, uint32_t __FIXME__blockDim_2e_x, uint32_t __FIXME__blockDim_2e_y, uint32_t __FIXME__blockDim_2e_z, uint32_t __FIXME__blockIdx_2e_x, uint32_t __FIXME__blockIdx_2e_y, uint32_t __FIXME__blockIdx_2e_z, uint32_t __FIXME__threadIdx_2e_x, uint32_t __FIXME__threadIdx_2e_y, uint32_t __FIXME__threadIdx_2e_z) {
  int64_t tid;

// INSERT COMMENT IFELSE: Kernel2::entry
  tid = __FIXME__blockIdx_2e_x * 512 + __FIXME__threadIdx_2e_x;
  if (tid < no_of_nodes) { // IFELSE MARKER: entry IF
  if (g_updating_graph_mask[tid]) { // IFELSE MARKER: land.lhs.true IF
  g_graph_mask[tid] = 1;
  g_graph_visited[tid] = 1;
  *g_over = 1;
  g_updating_graph_mask[tid] = 0;
  }
  }
  return;
}
// FUNCTION ORDER ID 2 END

