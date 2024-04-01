BMARK=correlation
TEST_ARGS=1 10 10 
PERF_ARGS=0 4000 4000
FLAGS=-lm
#ADDITIONAL_PASSES=-adce -dce -bdce --globaldce --unreachableblockelim --simplifycfg -instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine
#ADDITIONAL_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
LOC_PASSES=-dce -bdce --globaldce --unreachableblockelim --instcombine -dce
include ../Makefile.generic
