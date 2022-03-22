all: avimod.ll avilib.ll

# compile supporting function file into object (binary)
avimod.ll: avilib.h avimod.c 
	clang -c avimod.c

# compile supporting function file into object (binary)
avilib.ll: avilib.h avilib.c
	clang -c avilib.c

# delete files
clean:
	rm *.ll
