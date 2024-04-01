#POLLY=1
BMARK=cholesky
FLAGS=-lm
TEST_ARGS=1 5
PERF_ARGS= 0 10000
ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --simplifycfg

#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
LOC_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
include ../Makefile.generic
