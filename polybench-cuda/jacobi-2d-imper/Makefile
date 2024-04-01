#POLLY=1
BMARK=jacobi-2d-imper
TEST_ARGS=1 10 5
PERF_ARGS=0 10000 500 

#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
LOC_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
include ../Makefile.generic
