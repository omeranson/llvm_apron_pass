OBJS = apron.o src/Value.o src/BasicBlock.o src/CallGraph.o
HEADERS = $(shell find -name *.h)

include Makefile.env

all: ${OBJS} libapronpass.so
	@ ${MAKE} -C adaptors

%.so: ${OBJS} $(HEADERS)
	@ echo '[LD]	[${OBJS}]	[$@]'
	@ ${CXX} -Wl,-soname,$@ -o $@ ${OBJS} ${LDFLAGS}

%.o: %.c $(HEADERS)
	@ echo '[CC]	[$<]	[$@]'
	@ ${CC} -c -o $@ $< ${CXXFLAGS}

%.o: %.cpp $(HEADERS)
	@ echo '[CXX]	[$<]	[$@]'
	@ ${CXX} -c -o $@ $< ${CXXFLAGS}

clean:
	@ echo '[RM]	[${OBJS} libapronpass.so]'
	@ rm -f ${OBJS} libapronpass.so
