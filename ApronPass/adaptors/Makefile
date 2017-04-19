include ../Makefile.env

C_SRC := $(wildcard *.c)
TARGETS := $(addprefix lib, $(C_SRC:.c=_adaptor.so))

all: ${TARGETS}

lib%_adaptor.so: %.o
	@ echo '[LD]	[$^]	[$@]'
	@ ${CXX} -Wl,-soname,$@ -o $@ $^ ${LDFLAGS}

%.o: %.c
	@ echo '[CC]	[$^]	[$@]'
	@ ${CC} -c -o $@ $^ ${CFLAGS}

%.o: %.cpp
	@ echo '[CXX]	[$^]	[$@]'
	@ ${CXX} -c -o $@ $^ ${CXXFLAGS}

clean:
	@ echo '[RM]	[${TARGETS}]'
	@ rm -f ${TARGETS}
