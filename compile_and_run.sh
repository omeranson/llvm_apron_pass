#!/bin/bash

set -e

pushd ApronPass
make
popd

pushd Examples
#make
make TARGET=getrandom UPDATE_COUNT_MAX=1000 WIDENING_THRESHOLD=100
#valgrind --tool=massif --num-callers=20 opt -load /home/oanson/opt/apron-install/lib/libap_ppl_debug.so -load /home/oanson/opt/apron-install/lib/libapron_debug.so -load /home/oanson/projects/llvm_apron_pass-master/llvm_apron_pass/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass/adaptors/libap_ppl_adaptor.so -load /home/oanson/projects/llvm_apron_pass-master/llvm_apron_pass/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass/libapronpass.so -apron -d -update-count-max=1000 -widening-threshold=100 getrandom-O3-mergereturn-named.bc
#valgrind --num-callers=20 opt -load /home/oanson/opt/apron-install/lib/libap_ppl_debug.so -load /home/oanson/opt/apron-install/lib/libapron_debug.so -load /home/oanson/projects/llvm_apron_pass-master/llvm_apron_pass/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass/adaptors/libap_ppl_adaptor.so -load /home/oanson/projects/llvm_apron_pass-master/llvm_apron_pass/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass/libapronpass.so -apron -d -update-count-max=1000 -widening-threshold=100 getrandom-O3-mergereturn-named.bc
popd

