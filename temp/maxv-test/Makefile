CC      = cc
CFLAGS  = -std=c99 -O2 -g -Wall -Wextra -MMD -MP
TARGET  = tern
OBJS    = main.o llvm.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

main.o:	main.c
llvm.o:	llvm.c

-include $(OBJS:.o=.d)

clean:
	rm -f $(TARGET) $(OBJS) $(OBJS:.o=.d)

.PHONY: all clean
