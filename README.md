An LLVM compiler pass, which uses apron to infer numeric properties about
functions.

Installation:
	Install apron [1].
	Install llvm [2]. Tested with version 3.4.2.

Verify the paths in the Makefiles are correct.
To run the pass: opt -apron -load ... < file.bc. file.bc is a bitcode file
compiled by LLVM from a source file (e.g. a C file). The -load parameter must
include each used library, e.g. the compilation output of the ApronPass folder,
and the relevant apron shared objects.

e.g.:
opt -load $HOME/opt/apron-install/lib/libboxMPQ_debug.so -load ../ApronPass/libapron.so -load $HOME/opt/apron-install/lib/libapron_debug.so -apron < simple.bc

The output format hasn't been decided upon. It changes on the whim of what we're
looking for at a given moment.

[1] http://apron.cri.ensmp.fr/library/
[2] http://llvm.org/

