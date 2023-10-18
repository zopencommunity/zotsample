#
# Simple compile and link of C and C++ code.
# Need to change the linker to CCC (C++) from CC
#
CCC ?= clang++
CC ?= clang
LD := $(CCC)

all: zotsample
clean:
	rm -f bin/*.o bin/zotsample

check:
	./check.sh

install:
	./install.sh

zotsample: src/main.o src/fn.o
	$(LD) $(LDFLAGS) -o$@ $^ 
