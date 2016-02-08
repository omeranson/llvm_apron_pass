
LLVM_INSTALL=${HOME}/opt/llvm-3.4.2.install-cmake
LLVM_INCLUDE=${LLVM_INSTALL}/include
LLVM_LIB=${LLVM_INSTALL}/lib
LLVM_BIN=${LLVM_INSTALL}/bin
CLANG=${LLVM_BIN}/clang
CC=gcc


%.bc: %.c
	${CLANG} -emit-llvm -g -Wall -I${KLEE_INSTALL}/include -c $^ -O3

%: %.c
	#${CC} -I${KLEE_INSTALL}/include -L${KLEE_INSTALL}/lib -lkleeRuntest -o $@ $^
	${CLANG} -I${KLEE_INSTALL}/include -L${KLEE_INSTALL}/lib -lkleeRuntest -o $@ $^ -O3

%.ll: %.bc
	${LLVM_BIN}/llvm-dis $^

%.dump: %
	${LLVM_BIN}/llvm-objdump -d $^ > $@

