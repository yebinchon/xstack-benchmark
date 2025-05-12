POLLY=1
BMARK=jacobi-1d-imper
TEST_ARGS=1 5 10
PERF_ARGS=0 100 100000000
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
LOC_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce

include ../Makefile.generic
