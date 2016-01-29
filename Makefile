
all: libapron.so

OBJS = apron.o

APRON_INSTALL=/home/oanson/Documents/ProgramAnalysis/Project/apron-install
CXXFLAGS=$(shell llvm-config --cxxflags)
CXXFLAGS+=-I${APRON_INSTALL}/include
LDFLAGS=$(shell llvm-config --ldflags)
LDFLAGS+=-L${APRON_INSTALL}/lib -lapron
%.so: ${OBJS}
	gcc -shared -fPIC -Wl,-soname,$@ -o $@ $^ ${LDFLAGS}

%.o: %.c
	gcc -c -fPIC -o $@ $^ ${CXXFLAGS}
