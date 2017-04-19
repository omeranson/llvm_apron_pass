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
INLINE_SELECTED_FUNCTIONS_DIR=$(BASEDIR)/FOLDER_3_INLINE_SELECTED_FUNCTIONS/INLINE_ME
RUN_ANALYSIS_DIR             =$(BASEDIR)/FOLDER_4_RUN_STATIC_ANALYSIS/ApronPass
APRON_PASS_DIR               =$(BASEDIR)/FOLDER_4_RUN_STATIC_ANALYSIS/ApronPass

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
inputc =$(C_FILES_DIRECTORY)/Input
inputbc=$(LLVM_BITCODE_FILES_DIRECTORY)/Input

###############
# DIRECTORIES #
###############
all:
	clear
	@echo "\n"
	@echo "*****************"
	@echo "* Clean All ... *"
	@echo "*****************"
	@echo "\n"
	@echo "\n"
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
	@echo "***************************************"
	@echo "* Prepare to Run the Inliner Pass ... *"
	@echo "**************************************"
	@echo "\n"
	cd $(INLINE_SELECTED_FUNCTIONS_DIR)
	@echo "\n"	
	@echo "********************************************************"
	@echo "* llvm-dis to work with  human readable text files ... *"
	@echo "* 'cause I love human readable text files          ... *"
	@echo "********************************************************"
	@echo "\n"
	llvm-dis -o=./FOLDER_6_Input/Input.ll ${inputbc}.O3.MergeReturn.InstNamer.bc
	@echo "\n"
	@echo "*****************************************************"
	@echo "* Use the original c file to detect functions that  *"
	@echo "* have an input paramater with __user attribute     *"
	@echo "*****************************************************"
	@echo "\n"
	cp ${inputc} ./FOLDER_6_Input/Input.c
	@echo "\n"
	@echo "***************************************"
	@echo "* Run The Actual Inliner Pass Now ... *"
	@echo "***************************************"
	@echo "\n"
	${MAKE}
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
	${input}.O3.MergeReturn.InstNamer.bc                            \
	1>/dev/null                                                
	@echo "\n"
	@echo "****************************************************************"
	@echo "* Extract Static Analysis Results and Synthesize Contracts ... *"
	@echo "****************************************************************"
	@echo "\n"

