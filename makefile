###########
# BASEDIR #
###########
BASEDIR = $(shell pwd)

###########
# INCLUDE #
###########

###############
# DIRECTORIES #
###############
C_FILES_DIRECTORY            =$(BASEDIR)/FOLDER_1_INPUT_C_FILES
LLVM_BITCODE_FILES_DIRECTORY =$(BASEDIR)/FOLDER_2_LLVM_BITCODE_FILES
LLVM_BC_SYSCALLS_DIRECTORY   =$(BASEDIR)/FOLDER_2_LLVM_BITCODE_FILES/ALL_SYSCALLS
PASS_1_DIR                   =$(BASEDIR)/FOLDER_3_DO_INLINE_SELECTED_FUNCTIONS
PASS_2_DIR                   =$(BASEDIR)/FOLDER_4_DONT_INLINE_SPECIAL_KERNEL_FUNCTIONS
PASS_3_DIR                   =$(BASEDIR)/FOLDER_5_EXTRACT_GET_USER
PASS_4_DIR                   =$(BASEDIR)/FOLDER_6_EXTRACT_PUT_USER
PASS_5_DIR                   =$(BASEDIR)/FOLDER_7_IGNORE_INLINE_ASM
PASS_6_DIR                   =$(BASEDIR)/FOLDER_8_IGNORE_EXTRACT_VALUE
RUN_ANALYSIS_DIR             =$(BASEDIR)/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass
APRON_PASS_DIR               =$(BASEDIR)/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass

#######################
# APRON CONFIGURATION #
#######################
APRON_MANAGER1 = box
APRON_MANAGER2 = oct
APRON_MANAGER3 = ap_ppl

#################
# APRON AMANGER #
#################
APRON_MANAGER  = $(APRON_MANAGER1)

################
# SYSCALL NAME #
################
SYSCALL_NAME = "readv"

#########
# INPUT #
#########
SYSCALL?=read
inputc =$(C_FILES_DIRECTORY)/Input
inputbc=$(LLVM_BITCODE_FILES_DIRECTORY)/Input
inputTagbc=$(LLVM_BITCODE_FILES_DIRECTORY)/InputTag
inputreadybc=$(LLVM_BITCODE_FILES_DIRECTORY)/InputReady

###############
# DIRECTORIES #
###############
all:
	clear
	@echo "*********************************************************"
	@echo "* Clean temporary files & folders from previous run ... *"
	@echo "*********************************************************"
	@echo "\n"
	rm -rf /tmp/INLINE_ME/*
	rm -rf /tmp/llvm_apron_pass/*
	@echo "\n"
	@echo "*************************************************************"
	@echo "* Before you start, make a human readable copy of the input *"
	@echo "*************************************************************"
	@echo "\n"
	llvm-dis -o=${inputbc}.ll ${inputbc}.bc
	@echo "\n"
	@echo "*********************************************"
	@echo "* Compile Combined Static Analysis Pass ... *"
	@echo "*********************************************"
	@echo "\n"
	cd $(RUN_ANALYSIS_DIR) && $(MAKE)
	@echo "\n"
	@echo "****************************************************"
	@echo "* Every syscall has its own c file with that name. *"
	@echo "* For example, read.c and write.c are actually two *"
	@echo "* copies of the same original c file read_write.c  *"
	@echo "****************************************************"
	@echo "\n"
	cp ${C_FILES_DIRECTORY}/${SYSCALL}.c ${inputc}.c
	cp ${LLVM_BC_SYSCALLS_DIRECTORY}/${SYSCALL}.bc ${inputbc}.bc
	@echo "\n"
	@echo "*****************************************************"
	@echo "* Use the original c file to detect functions that  *"
	@echo "* have an input paramater with __user attribute     *"
	@echo "*****************************************************"
	@echo "\n"
	cp ${inputc}.c $(PASS_1_DIR)/FOLDER_5_INPUT/Input.c
	@echo "\n"
	@echo "*******************************"
	@echo "* Run Passes in order now ... *"
	@echo "* Running Pass(1)         ... *"
	@echo "*******************************"
	@echo "\n"	
	cd $(PASS_1_DIR) && ${MAKE}	
	@echo "\n"
	@echo "*******************************************************"
	@echo "* llvm-dis to work with human readable text files ... *"
	@echo "* 'cause I love human readable text files :]]     ... *"
	@echo "*******************************************************"
	@echo "\n"
	llvm-dis -o=$(PASS_2_DIR)/FOLDER_5_INPUT/Input.ll ${inputbc}.bc
	@echo "\n"
	@echo "***********************"
	@echo "* Running Pass(2) ... *"
	@echo "***********************"
	@echo "\n"
	cd $(PASS_2_DIR) && ${MAKE}
	@echo "\n"
	@echo "************************************************************"
	@echo "* Copy the output of PASS(i) to the input of PASS(i+1) ... *"
	@echo "************************************************************"
	@echo "\n"			
	cp \
	$(PASS_2_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(PASS_3_DIR)/FOLDER_5_INPUT/Input.ll
	@echo "\n"
	@echo "***********************"
	@echo "* Running Pass(3) ... *"
	@echo "***********************"
	@echo "\n"		
	cd $(PASS_3_DIR) && ${MAKE}
	@echo "\n"
	@echo "**********************************************************"
	@echo "* Copy the output of PASS(3) to the input of PASS(4) ... *"
	@echo "**********************************************************"
	@echo "\n"			
	cp \
	$(PASS_3_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(PASS_4_DIR)/FOLDER_5_INPUT/Input.ll
	@echo "\n"
	@echo "***********************"
	@echo "* Running Pass(4) ... *"
	@echo "***********************"
	@echo "\n"		
	cd $(PASS_4_DIR) && ${MAKE}
	@echo "\n"
	@echo "**********************************************************"
	@echo "* Copy the output of PASS(4) to the input of PASS(5) ... *"
	@echo "**********************************************************"
	@echo "\n"			
	cp \
	$(PASS_4_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(PASS_5_DIR)/FOLDER_5_INPUT/Input.ll
	@echo "\n"
	@echo "***********************"
	@echo "* Running Pass(5) ... *"
	@echo "***********************"
	@echo "\n"		
	cd $(PASS_5_DIR) && ${MAKE}
	@echo "\n"
	@echo "**********************************************************"
	@echo "* Copy the output of PASS(4) to the input of PASS(5) ... *"
	@echo "**********************************************************"
	@echo "\n"			
	cp \
	$(PASS_5_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(PASS_6_DIR)/FOLDER_5_INPUT/Input.ll
	@echo "\n"
	@echo "***********************"
	@echo "* Running Pass(6) ... *"
	@echo "***********************"
	@echo "\n"		
	cd $(PASS_6_DIR) && ${MAKE}
	@echo "\n"
	@echo "***********************************************************"
	@echo "* Copy the output of PASS(6) to the input of the analysis *"
	@echo "***********************************************************"
	@echo "\n"			
	cp \
	$(PASS_6_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputTag.ll
	@echo "\n"
	@echo "************************************"
	@echo "* llvm-as the processed input file *"
	@echo "************************************"
	@echo "\n"
	llvm-as -o=\
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputTag.bc \
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputTag.ll
	@echo "\n"
	@echo "********************************"
	@echo "* opt inline the nasty buggers *"
	@echo "********************************"
	@echo "\n"
	opt -always-inline \
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputTag.bc -o \
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputReady.bc
	@echo "\n"
	@echo "*************************************************"
	@echo "* Make a humen readable edition for input ready *"
	@echo "*************************************************"
	@echo "\n"
	llvm-dis -o=\
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputBefore_O3_MergeReturn_Instnamer.ll \
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputReady.bc	
	@echo "\n"
	@echo "*******************"
	@echo "* Run O3 Pass ... *"
	@echo "*******************"
	@echo "\n"
	opt -O3 ${inputreadybc}.bc -o ${inputreadybc}.O3.bc
	@echo "\n"
	@echo "*****************************"
	@echo "* Run Merge Return Pass ... *"
	@echo "*****************************"
	@echo "\n"
	opt -mergereturn ${inputreadybc}.O3.bc -o ${inputreadybc}.O3.MergeReturn.bc
	@echo "\n"
	@echo "**************************"
	@echo "* Run Instnamer Pass ... *"
	@echo "**************************"
	@echo "\n"
	opt -instnamer ${inputreadybc}.O3.MergeReturn.bc -o ${inputreadybc}.O3.MergeReturn.InstNamer.bc
	@echo "\n"
	@echo "*************************************************"
	@echo "* Make a humen readable edition for input ready *"
	@echo "*************************************************"
	@echo "\n"
	llvm-dis -o=\
	$(LLVM_BITCODE_FILES_DIRECTORY)/InputReady.ll \
	${inputreadybc}.O3.MergeReturn.InstNamer.bc	
	@echo "\n"
	@echo "*************************************************************"
	@echo "* Syscall function to Analyze and create a contract for ... *"
	@echo "*************************************************************"
	@echo ${SYSCALL} > /tmp/llvm_apron_pass/SyscallName.txt
	@echo "\n"
	@echo "**********************"
	@echo "* Run Apron Pass ... *"
	@echo "**********************"
	@echo "\n"
	@env LD_LIBRARY_PATH=${LD_LIBRARY_PATH} opt                     \
	-load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}_debug.so         \
	-load ${APRON_INSTALL}/lib/libapron_debug.so                    \
	-load ${APRON_PASS_DIR}/adaptors/lib${APRON_MANAGER}_adaptor.so \
	-load ${APRON_PASS_DIR}/libapronpass.so                         \
	-apron -d -update-count-max=1000 -widening-threshold=5          \
	-run-on-single-function=sys_${SYSCALL}                          \
	${inputreadybc}.O3.MergeReturn.InstNamer.bc
	@echo "\n"
	@echo "****************************************************************"
	@echo "* Extract Static Analysis Results and Synthesize Contracts ... *"
	@echo "****************************************************************"
	@echo "\n"

