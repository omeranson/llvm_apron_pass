
APRON_INSTALL=${HOME}/opt/apron-install
LLVM_INSTALL=${HOME}/opt/llvm-install

#APRON_MANAGER?=box
APRON_MANAGER=ap_ppl

LLVM_BIN=${LLVM_INSTALL}/bin
CC=${LLVM_BIN}/clang
CXX=${LLVM_BIN}/clang++
DIS=${LLVM_BIN}/llvm-dis
OBJDUMP=${LLVM_BIN}/llvm-objdump
OPT=${LLVM_BIN}/opt

%.bc: %.c
	${CC} -emit-llvm -g -Wall -c $^ -O3

%: %.c
	${CC} -o $@ $^ -O3

%.ll: %.bc
	${DIS} $^

%.dump: %
	${OBJDUMP} -d $^ > $@

.PHONY: %.apron
%.apron:
	@ echo '[RM]	[$@.${APRON_MANAGER}]'
	@ rm -f $@.${APRON_MANAGER}
	@ echo '[OPT]	[$@.${APRON_MANAGER}]'
	@ ${MAKE} $@.${APRON_MANAGER}

ifeq (${APRON_MANAGER},ap_ppl)
%.apron.${APRON_MANAGER}: %.bc
	@ ${OPT} -load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}_debug.so -load ${APRON_INSTALL}/lib/libapron_debug.so -load ../ApronPass/adaptors/lib${APRON_MANAGER}_adaptor.so -load ../ApronPass/libapron.so -apron < $^ 2> $@
else
%.apron.${APRON_MANAGER}: %.bc
	@ ${OPT} -load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}MPQ_debug.so -load ${APRON_INSTALL}/lib/libapron_debug.so -load ../ApronPass/adaptors/lib${APRON_MANAGER}_adaptor.so -load ../ApronPass/libapron.so -apron < $^ 2> $@
endif
