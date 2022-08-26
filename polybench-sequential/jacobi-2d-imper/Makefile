POLLY=1
BMARK=jacobi-2d-imper
CFILE=jacobi-2d-imper
DIR=/scratch/yc0769/xstack-benchmark/xstack-benchmark/polybench-3.1
POLLY_FLAGS+=-mllvm -polly-overflow-tracking=never -mllvm -polly-ignore-aliasing -mllvm -polly-parallel-force -mllvm -polly-position=early
TEST_ARGS=1 10 5
PERF_ARGS=0 8000 100 

include ../../Makefile.generic
