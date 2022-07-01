POLLY=1
BMARK=gemver
CFILE=gemver
DIR=/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1
LINK_FLAGS+=
POLLY_FLAGS+=-mllvm -polly-overflow-tracking=never -mllvm -polly-ignore-aliasing -mllvm -polly-parallel-force -mllvm -polly-position=early
TEST_ARGS=1 10
PERF_ARGS=0 30000

include ../../Makefile.generic
