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
INLINE_SELECTED_FUNCTIONS_DIR=$(BASEDIR)/FOLDER_3_INLINE_SELECTED_FUNCTIONS
RUN_ANALYSIS_DIR             =$(BASEDIR)/FOLDER_4_RUN_STATIC_ANALYSIS/ApronPass

################
# SYSCALL NAME #
################
SYSCALL_NAME = "readv"

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
	@echo "*****************************************"
	@echo "* Run Combined Static Analysis Pass ... *"
	@echo "*****************************************"
	@echo "\n"
	@echo "\n"
	@echo "****************************************************************"
	@echo "* Extract Static Analysis Results and Synthesize Contracts ... *"
	@echo "****************************************************************"
	@echo "\n"

