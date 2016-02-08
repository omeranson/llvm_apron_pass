

#BASE_FILES = Value BasicBlock CallGraph
OBJS = apron.o src/Value.o src/BasicBlock.o src/CallGraph.o

APRON_INSTALL=${HOME}/opt/apron-install
CXXFLAGS=$(shell llvm-config --cxxflags)
CXXFLAGS+= -I${APRON_INSTALL}/include
CXXFLAGS+= -Iinclude -fPIC -g
LDFLAGS=$(shell llvm-config --ldflags)
LDFLAGS+= -L${APRON_INSTALL}/lib -lapron_debug
LDFLAGS+= -shared -fPIC 
CC=gcc

all: ${OBJS} libapron.so

%.so: ${OBJS}
	@ ${CC} -Wl,-soname,$@ -o $@ $^ ${LDFLAGS}

%.o: %.c
	@ ${CC} -o $@ $^ ${CXXFLAGS}

clean:
	@ rm -f ${OBJS} libapron.so
