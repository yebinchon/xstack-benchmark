POLLY=1
BMARK=mayAlias
CFILE=mayAlias
#POLLY_FLAGS+=-mllvm -polly-overflow-tracking=never -mllvm -polly-ignore-aliasing -mllvm -polly-parallel-force -mllvm -polly-position=early
POLLY_FLAGS+= -ffast-math -mllvm -polly-process-unprofitable -mllvm -polly-overflow-tracking=never -mllvm -polly-parallel-force -mllvm -polly-position=early
LINK_FLAGS+= -lm
TEST_ARGS=1 5 10
PERF_ARGS=0 100 100000000

include ../../Makefile.generic
