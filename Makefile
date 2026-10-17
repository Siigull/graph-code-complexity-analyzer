CC      = cc
CFLAGS  = -std=c99 -O2 -Wall -Wextra
TARGET  = tern
OBJS    = main.o llvm.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

main.o:	main.c main.h
llvm.o:	llvm.c llvm.h

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean
