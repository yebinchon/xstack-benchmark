
ifdef OUTPUT
override OUTPUT = -DOUTPUT
endif

# link objects(binaries) together
heartwall: main.ll ./AVI/avilib.ll ./AVI/avimod.ll
	clang main.ll ./AVI/avilib.ll ./AVI/avimod.ll -lm -fopenmp -o heartwall

# compile main function file into object (binary)
main.ll: main.c define.c kernel.c
	clang $(OUTPUT) main.c -I./AVI -c -O3 -fopenmp -o main.ll

./AVI/avilib.ll ./AVI/avimod.ll:
	cd AVI; make;

# delete all object files
clean:
	rm -f *.bc AVI/*.bc *.o AVI/*.o  *.ll AVI/*.ll heartwall
