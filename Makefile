#
# Simple compile and link of C and C++ code.
# Need to change the linker to CCC (C++) from CC
# This is the zotsample-1.2 branch
#
CCC = clang++
CC = clang
LD := $(CCC)
LOGPFX := $(shell date +%FT%T%Z)

.PHONY: clean check install

all: src/zotsample
clean:
	rm -f src/*.o src/zotsample

check:
	./check | tee log/check_$(LOGPFX).log

install: 
	./install | tee log/install_$(LOGPFX).log

src/zotsample: src/main.o src/fn.o
	$(LD) -o$@ $^ | tee log/build_$(LOGPFX).log
