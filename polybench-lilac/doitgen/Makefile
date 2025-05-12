#POLLY=1
BMARK=doitgen
TEST_ARGS=1 10 10 10 
PERF_ARGS=0 512 512 512

#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
LOC_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
include ../Makefile.generic
