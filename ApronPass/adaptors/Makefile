

#BASE_FILES = Value BasicBlock CallGraph
OBJS = apron.o src/Value.o src/BasicBlock.o src/CallGraph.o

APRON_INSTALL=${HOME}/opt/apron-install
LLVM_INSTALL=${HOME}/opt/llvm-install
CXXFLAGS=$(shell ${LLVM_INSTALL}/bin/llvm-config --cxxflags)
CXXFLAGS+= -I${APRON_INSTALL}/include
CXXFLAGS+= -I../include -fPIC -g
LDFLAGS=$(shell ${LLVM_INSTALL}/bin/llvm-config --ldflags)
LDFLAGS+= -L${APRON_INSTALL}/lib -lapron_debug
LDFLAGS+= -shared -fPIC 
CC=${LLVM_INSTALL}/bin/clang
CXX=${LLVM_INSTALL}/bin/clang++

C_SRC := $(wildcard *.c)
TARGETS := $(addprefix lib, $(C_SRC:.c=_adaptor.so))

all: ${TARGETS}

lib%_adaptor.so: %.o
	@ echo '[LD]	[$^]	[$@]'
	@ ${CXX} -Wl,-soname,$@ -o $@ $^ ${LDFLAGS}

%.o: %.c
	@ echo '[CC]	[$^]	[$@]'
	@ ${CC} -c -o $@ $^ ${CXXFLAGS}

%.o: %.cpp
	@ echo '[CXX]	[$^]	[$@]'
	@ ${CXX} -c -o $@ $^ ${CXXFLAGS}

clean:
	@ echo '[RM]	[${TARGETS}]'
	@ rm -f ${TARGETS}
