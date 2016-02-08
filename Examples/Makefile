
APRON_INSTALL=${HOME}/opt/apron-install
LLVM_INSTALL=${HOME}/opt/llvm-install

LLVM_BIN=${LLVM_INSTALL}/bin
CC=${LLVM_BIN}/clang
CXX=${LLVM_BIN}/clang++
DIS=${LLVM_BIN}/llvm-dis
OBJDUMP=${LLVM_BIN}/llvm-objdump

%.bc: %.c
	${CC} -emit-llvm -g -Wall -c $^ -O3

%: %.c
	${CC} -o $@ $^ -O3

%.ll: %.bc
	${DIS} $^

%.dump: %
	${OBJDUMP} -d $^ > $@

