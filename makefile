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
PASS_5_DIR                   =$(BASEDIR)/FOLDER_3_DONT_INLINE_SPECIAL_KERNEL_FUNCTIONS
PASS_5_DIR                   =$(BASEDIR)/FOLDER_4_DO_INLINE_SELECTED_FUNCTIONS
PASS_2_DIR                   =$(BASEDIR)/FOLDER_5_EXTRACT_GET_USER_AND_PUT_USER
PASS_5_DIR                   =$(BASEDIR)/FOLDER_6_IGNORE_INLINE_ASM
PASS_1_DIR                   =$(BASEDIR)/FOLDER_7_IGNORE_EXTRACT_VALUE
RUN_ANALYSIS_DIR             =$(BASEDIR)/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass
APRON_PASS_DIR               =$(BASEDIR)/FOLDER_9_RUN_STATIC_ANALYSIS/ApronPass
IGNORE_EXTRACT_VALUE_DIR     =$(BASEDIR)/FOLDER_4_IGNORE_EXTRACT_VALUE/INLINE_ME

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

###############
# DIRECTORIES #
###############
all:
	clear
	@echo "*********************************************"
	@echo "* Compile Combined Static Analysis Pass ... *"
	@echo "*********************************************"
	@echo "\n"
	cd $(RUN_ANALYSIS_DIR) && $(MAKE)
	@echo "\n"
	@echo "*******************"
	@echo "* Run O3 Pass ... *"
	@echo "*******************"
	@echo "\n"
	opt -O3 ${inputbc}.bc -o ${inputbc}.O3.bc
	@echo "\n"
	@echo "*****************************"
	@echo "* Run Merge Return Pass ... *"
	@echo "*****************************"
	@echo "\n"
	opt -mergereturn ${inputbc}.O3.bc -o ${inputbc}.O3.MergeReturn.bc
	@echo "\n"
	@echo "**************************"
	@echo "* Run Instnamer Pass ... *"
	@echo "**************************"
	@echo "\n"
	opt -instnamer ${inputbc}.O3.MergeReturn.bc -o ${inputbc}.O3.MergeReturn.InstNamer.bc
	@echo "\n"
	@echo "********************************************************"
	@echo "* llvm-dis to work with  human readable text files ... *"
	@echo "* 'cause I love human readable text files :]]      ... *"
	@echo "********************************************************"
	@echo "\n"
	#llvm-dis -o=$(PASS_1_DIR)/FOLDER_6_INPUT/Input.ll ${inputbc}.O3.MergeReturn.InstNamer.bc
	@echo "\n"
	@echo "*****************************************************"
	@echo "* Use the original c file to detect functions that  *"
	@echo "* have an input paramater with __user attribute     *"
	@echo "*****************************************************"
	@echo "\n"
	#cp ${inputc}.c $(PASS_1_DIR)/FOLDER_6_INPUT/Input.c
	@echo "\n"
	@echo "*******************************"
	@echo "* Run The Actual Pass Now ... *"
	@echo "*******************************"
	@echo "\n"	
		
	#####################################
	# GET INSIDE CURRENT PASS & MAKE IT #
	#####################################
	cd $(PASS_1_DIR) && ${MAKE}
		
	####################################
	# INPUT(pass i+1) = OUTPUT(pass i) #
	####################################
	cp \
	$(PASS_1_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(PASS_2_DIR)/FOLDER_5_INPUT/Input.ll
		
	#####################################
	# GET INSIDE CURRENT PASS & MAKE IT #
	#####################################
	cd $(PASS_2_DIR) && ${MAKE}
		
	####################################
	# INPUT(pass i+1) = OUTPUT(pass i) #
	####################################
	cp \
	$(PASS_2_DIR)/FOLDER_6_OUTPUT/Output.ll \
	$(PASS_3_DIR)/FOLDER_5_INPUT/Input.ll




	cp $(PASS_5_DIR)/FOLDER_7_OUTPUT/Output.ll $(inputbc).ll
	
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
	-load ${APRON_INSTALL}/lib/lib${APRON_MANAGER}MPQ_debug.so      \
	-load ${APRON_INSTALL}/lib/libapron_debug.so                    \
	-load ${APRON_PASS_DIR}/adaptors/lib${APRON_MANAGER}_adaptor.so \
	-load ${APRON_PASS_DIR}/libapronpass.so                         \
	-apron -d -update-count-max=11                                  \
	${inlinedbc}.bc
	@echo "\n"
	@echo "****************************************************************"
	@echo "* Extract Static Analysis Results and Synthesize Contracts ... *"
	@echo "****************************************************************"
	@echo "\n"

