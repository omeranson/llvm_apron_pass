APRON_MANAGER?=box

include ../ApronPass/Makefile.env

%.bc: %.c
	@ echo '[CC -emit-llvm]	[$<]	[$@]'
	# It's important to have -O3 optimisation, to eliminate loads from code
	@ ${CC} -emit-llvm -g -Wall -c $^ -O3

%: %.c
	@ echo '[CC]	[$<]	[$@]'
	${CC} -o $@ $^ -O3

%-mergereturn.bc: %.bc
	@ echo '[OPT -mergereturn]	[$^]	[$@]'
	${OPT} -mergereturn $^ > $@

%-named.bc: %.bc
	@ echo '[OPT -instnamer]	[$^]	[$@]'
	${OPT} -instnamer $^ > $@

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
	@ echo '[OPT2]	[$@]'
	@ env LD_LIBRARY_PATH=${LD_LIBRARY_PATH} ${OPT} -load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}_debug.so -load ${APRON_INSTALL}/lib/libapron_debug.so -load ../ApronPass/adaptors/lib${APRON_MANAGER}_adaptor.so -load ../ApronPass/libapronpass.so -apron < $^ 2> $@
else
%.apron.${APRON_MANAGER}: %.bc
	@ echo '[OPT2]	[$@]'
	@ env LD_LIBRARY_PATH=${LD_LIBRARY_PATH} ${OPT} -load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}MPQ_debug.so -load ${APRON_INSTALL}/lib/libapron_debug.so -load ../ApronPass/adaptors/lib${APRON_MANAGER}_adaptor.so -load ../ApronPass/libapronpass.so -apron < $^ 2> $@
endif
