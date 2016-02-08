

#BASE_FILES = Value BasicBlock CallGraph
OBJS = apron.o src/Value.o src/BasicBlock.o src/CallGraph.o

APRON_INSTALL=${HOME}/opt/apron-install
LLVM_INSTALL=${HOME}/opt/llvm-install
CXXFLAGS=$(shell ${LLVM_INSTALL}/bin/llvm-config --cxxflags)
CXXFLAGS+= -I${APRON_INSTALL}/include
CXXFLAGS+= -Iinclude -fPIC -g
LDFLAGS=$(shell ${LLVM_INSTALL}/bin/llvm-config --ldflags)
LDFLAGS+= -L${APRON_INSTALL}/lib -lapron_debug
LDFLAGS+= -shared -fPIC 
CC=${LLVM_INSTALL}/bin/clang
CXX=${LLVM_INSTALL}/bin/clang++

all: ${OBJS} libapron.so

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
	@ rm -f ${OBJS} libapron.so
