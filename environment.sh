export LLVM_INSTALL=
export APRON_INSTALL=$HOME/opt/apron-install
export APRON_LIB=$APRON_INSTALL/lib
export LLVM_INSTALL=$HOME/opt/llvm-install
export LLVM_LIB=$LLVM_INSTALL/lib
export LD_LIBRARY_PATH=$LLVM_LIB:$APRON_LIB
export LLVM_OPT=$LLVM_INSTALL/bin/opt
