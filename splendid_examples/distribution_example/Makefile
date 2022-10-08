POLLY=0
BMARK=distribution
CFILE=mayAlias
#POLLY_FLAGS+=-mllvm -polly-overflow-tracking=never -mllvm -polly-ignore-aliasing -mllvm -polly-parallel-force -mllvm -polly-position=early
POLLY_FLAGS+= -ffast-math -mllvm -polly-process-unprofitable -mllvm -polly-overflow-tracking=never -mllvm -polly-parallel-force -mllvm -polly-position=early
COMPILE_FLAGS=-
LINK_FLAGS+= -lm
TEST_ARGS=1 5 10
PERF_ARGS=0 100 100000000
CC=clang
PLAIN=benchmark
OBJFILES_BC?= $(shell find . -name \*.c -not -path \*.cbe.c | sed -e "s/\.c/.bc/" ) $(shell find . -name \*.C -not -path \*.cbe.C | sed -e "s/\.C/.bc/" ) $(shell find . -name \*.cpp -not -path \*.cbe.cpp | sed -e "s/\.cpp/.bc/" )  $(shell find . -name \*.cc -not -path \*.cbe.cc | sed -e "s/\.cc/.bc/" )

$(PLAIN).bc : $(OBJFILES_BC)
	llvm-link $(LLVM_LINK_FLAGS) $^ -o $@

%.bc: %.c
	#$(CC) -O2 -fno-lax-vector-conversions -fno-vectorize -fno-slp-vectorize -g -c -emit-llvm $< -o $@
	$(CC) -O2 -disable-llvm-passes -mllvm -polly -mllvm -polly-tiling=false -fno-unroll-loops  -mllvm -enable-loop-distribute -fno-lax-vector-conversions -fno-vectorize -fno-slp-vectorize -g -c -emit-llvm $< -o $@
	opt -loop-simplify $@ -S -o $@

$(PLAIN).ll : $(PLAIN).bc
	llvm-dis $^

$(PLAIN).exe : $(BMARK).c
	$(CC) -DPERF=1 -lm -g -O3 -fopenmp $< -o $@

$(PLAIN).cbe.c: $(PLAIN).ll
	opt $< -o $(PLAIN).bc
	llvm-cbe $(PLAIN).bc
	llvm-dis $(PLAIN).bc #just for debugging

$(PLAIN).cbe.exe: $(PLAIN).cbe.c
	$(CC) -g -O3 $< $(LINK_FLAGS) -o $@

check_correctness: $(PLAIN).cbe.exe $(PLAIN).exe
	./$(PLAIN).exe $(TEST_ARGS) > $(PLAIN).out 2>&1
	./$(PLAIN).cbe.exe $(TEST_ARGS) > $(PLAIN).cbe.out 2>&1
	diff $(PLAIN).out $(PLAIN).cbe.out

clean:
	rm -rf *.bc *.out *.ll *.cbe.c *.exe *.o
