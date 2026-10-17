CC      = cc
CFLAGS  = -std=c99 -O2 -Wall -Wextra
TARGET  = tern
OBJS    = ir_core.o llvm.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

ir_core.o: main.c main.h graph.h
llvm.o:   llvm.c llvm.h graph.h

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean
