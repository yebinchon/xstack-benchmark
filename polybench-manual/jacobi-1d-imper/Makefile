BMARK=jacobi-1d-imper
CFILE=jacobi-1d-imper
DIR=/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1
POLLY_FLAGS+=-mllvm -polly-overflow-tracking=never -mllvm -polly-ignore-aliasing -mllvm -polly-parallel-force -mllvm -polly-position=early
LINK_FLAGS+=
TEST_ARGS=1 5 10
PERF_ARGS=0 100 100000000

include ../../Makefile.generic
