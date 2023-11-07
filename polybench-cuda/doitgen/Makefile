#POLLY=1
BMARK=doitgen
CFILE=doitgen
DIR=/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1
POLLY_FLAGS+=-mllvm -polly-use-runtime-alias-checks=0 -mllvm -polly-overflow-tracking=never -mllvm -polly-ignore-aliasing -mllvm -polly-parallel-force -mllvm -polly-position=early
TEST_ARGS=1 10 10 10 
PERF_ARGS=0 512 512 512

include ../../Makefile.generic
