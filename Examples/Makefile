APRON_MANAGER?=box

include ../ApronPass/Makefile.env

TARGET?=simple

all: ${TARGET}-O3-mergereturn-named.bc ${TARGET}-O3-mergereturn-named.ll
	@ ${MAKE} ${TARGET}-O3-mergereturn-named.apron APRON_MANAGER=box
	@ ${MAKE} ${TARGET}-O3-mergereturn-named.apron APRON_MANAGER=oct
	# @ ${MAKE} ${TARGET}-O3-mergereturn-named.apron APRON_MANAGER=polka
	@ ${MAKE} ${TARGET}-O3-mergereturn-named.apron APRON_MANAGER=ap_ppl
	# @ ${MAKE} ${TARGET}-O3-mergereturn-named.apron APRON_MANAGER=t1p # Broken

%.bc: %.c
	@ echo '[CC -emit-llvm]	[$<]	[$@]'
	# It's important to have -O3 optimisation, to eliminate loads from code
	@ ${CC} -flto -Wall -c -o $@ $^

%: %.c
	@ echo '[CC]	[$<]	[$@]'
	${CC} -o $@ $^

%-mergereturn.bc: %.bc
	@ echo '[OPT -mergereturn]	[$^]	[$@]'
	${OPT} -mergereturn $^ > $@

%-O3.bc: %.bc
	@ echo '[OPT -O3]	[$^]	[$@]'
	${OPT} -O3 $^ > $@

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
	@ env LD_LIBRARY_PATH=${LD_LIBRARY_PATH} ${OPT} -load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}_debug.so -load ${APRON_INSTALL}/lib/libapron_debug.so -load ../ApronPass/adaptors/lib${APRON_MANAGER}_adaptor.so -load ../ApronPass/libapronpass.so -apron -d -update-count-max=11 -widening-threshold=10 $^ 1>/dev/null 2> $@
else
%.apron.${APRON_MANAGER}: %.bc
	@ echo '[OPT2]	[$@]'
	@ env LD_LIBRARY_PATH=${LD_LIBRARY_PATH} ${OPT} -load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}MPQ_debug.so -load ${APRON_INSTALL}/lib/libapron_debug.so -load ../ApronPass/adaptors/lib${APRON_MANAGER}_adaptor.so -load ../ApronPass/libapronpass.so -apron -d -update-count-max=11 -widening-threshold=10 $^ 1>/dev/null 2> $@
endif
