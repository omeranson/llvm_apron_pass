# Inttroduction

An LLVM compiler pass, which uses apron to infer numeric properties about
functions.

#Installation

Install apron [1].
Install llvm [2]. Tested with llvm version 3.4.2.

Verify the paths in the Makefiles are correct. Specifically, verify that
APRON\_INSTALL and LLVM\_INSTALL are point to the installation folders of apron
and llvm respectively, in all Makefiles.

# Usage

The Makefile in the Examples folder provides utilities to compile LLVM bitconde,
textual output, and apron outputs.

* To create llvm bitcode: *make <filename>.bc*
* To create textual representation of llvm bitcode: *make <filename>.ll*
* To create apron output: *make <filename>.apron APRON_MANAGER=<manager>*

Note that *<filename>.c* is the source c file. <manager> is the APRON manager
to use. Currently, the following are supported:
* box
* ap\_ppl
* oct
* polka

Others can be added in the *adaptors* folder.

You may need to source environment.sh for things to work: *source environment.sh*

The output format hasn't been decided upon. It changes on the whim of what we're
looking for at a given moment.

# Folder Structure 

The folder structure is as follows:
* ApronPass - The actual code for the LLVM apron pas
* Examples - Some example c programmes, and code to analyse them.


* [1] http://apron.cri.ensmp.fr/library/
* [2] http://llvm.org/

