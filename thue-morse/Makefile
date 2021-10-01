# C compiler
CC = clang
FLAGS =

SRC = $(shell ls *.c)
OBJ = $(SRC:.c=.o)
HDR = $(shell ls *h)

TARGET = $(SRC:.c=)

all : $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) $(FLAGS) -lc -o $@

%.o : %.c
	$(CC) -c $<

$(OBJ) : $(HDR)

clean:
	rm -f $(OBJ) $(TARGET)
	
