export LLVM_INSTALL=
export APRON_INSTALL=$HOME/SoftwarePackages/apron
export APRON_LIB=$APRON_INSTALL/lib
export LLVM_INSTALL=$HOME/SoftwarePackages/llvm/llvm-3.4/build/Release+Asserts
export LLVM_LIB=$LLVM_INSTALL/lib
export LD_LIBRARY_PATH=$LLVM_LIB:$APRON_LIB
export LLVM_OPT=$LLVM_INSTALL/bin/opt
export CXXFLAGS=-I/usr/include/i386-linux-gnu/c++/4.8
