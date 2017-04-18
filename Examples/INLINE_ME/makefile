########
# CALC #
########
CC=gcc

###############
# DIRECTORIES #
###############
BASEDIR            = .
LEXER_DIR          = $(BASEDIR)/FOLDER_0_Flex
LEXER_User_DIR     = $(BASEDIR)/FOLDER_1_LEXER_User
LEXER_Inline_DIR   = $(BASEDIR)/FOLDER_2_LEXER_Inline
SOURCE_FILES_DIR   = $(BASEDIR)/FOLDER_3_SOURCE_FILES
HEADER_FILES_DIR   = $(BASEDIR)/FOLDER_4_HEADER_FILES
PROG_DIR           = $(BASEDIR)/FOLDER_5_Inliner
INPUT_DIR          = $(BASEDIR)/FOLDER_6_INPUT
OUTPUT_DIR         = $(BASEDIR)/FOLDER_7_OUTPUT
LEXER_SOURCE_DIR   = $(LEXER_DIR)/SOURCE_FILES
LEXER_HEADER_DIR   = $(LEXER_DIR)/HEADER_FILES
LEXER_OBJECT_DIR   = $(LEXER_DIR)/OBJECT_FILES

###############
# LEXER FLAGS #
###############
LEXER_PROGRAM_FLAGS_User   = -o$(LEXER_User_DIR)/User_Lexer.c
LEXER_PROGRAM_FLAGS_Inline = -o$(LEXER_Inline_DIR)/Inline_Lexer.c

#####################
# LEXER INPUT FILES #
#####################
LEXER_INPUT_User   = $(LEXER_User_DIR)/User.lex
LEXER_INPUT_Inline = $(LEXER_Inline_DIR)/Inline.lex

#########
# LEXER #
#########
LEXER_FLAGS           = -I$(LEXER_HEADER_DIR) -w
LEXER_PROGRAM         = $(LEXER_DIR)/MyFlex 
LEXER_SOURCE_FILES   := $(wildcard  $(LEXER_SOURCE_DIR)/*.c)
LEXER_HEADER_FILES   := $(wildcard  $(LEXER_HEADER_DIR)/*.h)
LEXER_OBJECT_FILES   := $(addprefix $(LEXER_OBJECT_DIR)/,$(LEXER_SOURCE_FILES,.c=.o))

###########
# Inliner #
###########
Inline_FLAGS         = -I$(HEADER_FILES_DIR) -w
Inline_PROGRAM       = $(PROG_DIR)/Inliner
Inline_SOURCE_FILES := $(wildcard  $(SOURCE_FILES_DIR)/*.c)
Inline_HEADER_FILES := $(wildcard  $(HEADER_FILES_DIR)/*.h)

################
# INPUT/OUTPUT #
################
INPUT	=	$(INPUT_DIR)/Input.c \
			$(INPUT_DIR)/Input.ll
OUTPUT	=	$(OUTPUT_DIR)/Output.c \
			$(OUTPUT_DIR)/Output.ll

##########################
# ALL LEXER(S) PARSER(S) #
##########################
all:
	@echo "\n"
	@echo "*****************"
	@echo "* Clean All ... *"
	@echo "*****************"
	@echo "\n"
	rm -rf $(LEXER_PROGRAM) 
	rm -rf $(Inline_PROGRAM) 
	rm -rf $(SOURCE_FILES_DIR)/Inline_Lexer.c
	rm -rf $(SOURCE_FILES_DIR)/User_Lexer.c
	@echo "\n"
	@echo "******************"
	@echo "* Build Flex ... *"
	@echo "******************"
	@echo "\n"	
	$(CC) $(LEXER_FLAGS) $(LEXER_SOURCE_FILES) -o $(LEXER_PROGRAM)
	@echo "\n"
	@echo "************************"
	@echo "* Run All Lexer(s) ... *"
	@echo "************************"
	@echo "\n"
	$(LEXER_PROGRAM) $(LEXER_PROGRAM_FLAGS_Inline) $(LEXER_INPUT_Inline)
	$(LEXER_PROGRAM) $(LEXER_PROGRAM_FLAGS_User)   $(LEXER_INPUT_User)
	@echo "\n"
	@echo "**************************************************"
	@echo "* Move Generated Lexer(s) to destined folder ... *"
	@echo "**************************************************"
	@echo "\n"	
	mv $(LEXER_Inline_DIR)/Inline_Lexer.c $(SOURCE_FILES_DIR)
	mv $(LEXER_User_DIR)/User_Lexer.c $(SOURCE_FILES_DIR)
	@echo "\n"
	@echo "*********************"
	@echo "* Build Inliner ... *"
	@echo "*********************"
	@echo "\n"	
	$(CC) $(Inline_FLAGS) $(Inline_SOURCE_FILES) -o $(Inline_PROGRAM)
	@echo "\n"
	@echo "**********************"
	@echo "* Execute Inline ... *"
	@echo "**********************"
	@echo "\n"	
	$(Inline_PROGRAM) $(INPUT) $(OUTPUT)
	@echo "\n"
	@echo "***************"
	@echo "* llvm-as ... *"
	@echo "***************"
	@echo "\n"
	llvm-as -o=$(OUTPUT_DIR)/Output.bc $(OUTPUT_DIR)/Output.ll	
	@echo "\n"
	@echo "**************************"
	@echo "* opt -always-inline ... *"
	@echo "**************************"
	@echo "\n"
	opt -always-inline $(OUTPUT_DIR)/Output.bc -o $(OUTPUT_DIR)/OutputInlined.bc
	@echo "\n"
	@echo "****************"
	@echo "* llvm-dis ... *"
	@echo "****************"
	@echo "\n"
	llvm-dis -o=$(OUTPUT_DIR)/OutputInlined.ll $(OUTPUT_DIR)/OutputInlined.bc

