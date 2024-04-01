#POLLY=1
BMARK=gemver
TEST_ARGS=1 10
PERF_ARGS=0 15000

#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
LOC_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
include ../Makefile.generic
