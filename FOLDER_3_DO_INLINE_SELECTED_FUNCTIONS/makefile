########
# CALC #
########
CC=gcc

###############
# DIRECTORIES #
###############
BASEDIR            = $(shell pwd)
LEXER_DIR          = $(BASEDIR)/FOLDER_0_Flex
LEXER_User_DIR     = $(BASEDIR)/FOLDER_1_LEXER
SOURCE_FILES_DIR   = $(BASEDIR)/FOLDER_2_SOURCE_FILES
HEADER_FILES_DIR   = $(BASEDIR)/FOLDER_3_HEADER_FILES
PASS_DIR           = $(BASEDIR)/FOLDER_4_Pass
INPUT_DIR          = $(BASEDIR)/FOLDER_5_INPUT
OUTPUT_DIR         = $(BASEDIR)/FOLDER_6_OUTPUT
LEXER_SOURCE_DIR   = $(LEXER_DIR)/SOURCE_FILES
LEXER_HEADER_DIR   = $(LEXER_DIR)/HEADER_FILES
LEXER_OBJECT_DIR   = $(LEXER_DIR)/OBJECT_FILES

###############
# LEXER FLAGS #
###############
LEXER_PROGRAM_FLAGS_User   = -o$(LEXER_User_DIR)/Lexer.c

#####################
# LEXER INPUT FILES #
#####################
LEXER_INPUT_User   = $(LEXER_User_DIR)/User.lex

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
Transformer_FLAGS         = -I$(HEADER_FILES_DIR) -w
Transformer_PROGRAM       = $(PASS_DIR)/Transformer
Transformer_SOURCE_FILES := $(wildcard  $(SOURCE_FILES_DIR)/*.c)
Transformer_HEADER_FILES := $(wildcard  $(HEADER_FILES_DIR)/*.h)

################
# INPUT/OUTPUT #
################
INPUT	=	$(INPUT_DIR)/Input.c
OUTPUT	=	$(OUTPUT_DIR)/Output.c

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
	rm -rf $(Transformer_PROGRAM) 
	rm -rf $(SOURCE_FILES_DIR)/Lexer.c
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
	$(LEXER_PROGRAM) $(LEXER_PROGRAM_FLAGS_User) $(LEXER_INPUT_User)
	@echo "\n"
	@echo "**************************************************"
	@echo "* Move Generated Lexer(s) to destined folder ... *"
	@echo "**************************************************"
	@echo "\n"	
	mv $(LEXER_User_DIR)/Lexer.c $(SOURCE_FILES_DIR)
	@echo "\n"
	@echo "*********************"
	@echo "* Build Inliner ... *"
	@echo "*********************"
	@echo "\n"	
	$(CC) $(Transformer_FLAGS) $(Transformer_SOURCE_FILES) -o $(Transformer_PROGRAM)
	@echo "\n"
	@echo "***************************"
	@echo "* Execute Transformer ... *"
	@echo "***************************"
	@echo "\n"	
	$(Transformer_PROGRAM) $(INPUT) $(OUTPUT)

