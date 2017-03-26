OBJS = apron.o src/Value.o src/BasicBlock.o src/CallGraph.o

include Makefile.env

all: ${OBJS} libapronpass.so
	@ ${MAKE} -C adaptors

%.so: ${OBJS}
	@ echo '[LD]	[$^]	[$@]'
	@ ${CXX} -Wl,-soname,$@ -o $@ $^ ${LDFLAGS}

%.o: %.c
	@ echo '[CC]	[$^]	[$@]'
	@ ${CC} -c -o $@ $^ ${CXXFLAGS}

%.o: %.cpp
	@ echo '[CXX]	[$^]	[$@]'
	@ ${CXX} -c -o $@ $^ ${CXXFLAGS}

clean:
	@ echo '[RM]	[${OBJS} libapronpass.so]'
	@ rm -f ${OBJS} libapronpass.so
