# C compiler
CC = clang
FLAGS = -lgmp

SRC = $(shell ls *.c)
OBJ = $(SRC:.c=.o)
HDR = $(shell ls *h)

TARGET = $(SRC:.c=)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) $(FLAGS) -lc -o $@

%.o : %.c
	$(CC) -c $<

$(OBJ) : $(HDR)

all : $(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
	
