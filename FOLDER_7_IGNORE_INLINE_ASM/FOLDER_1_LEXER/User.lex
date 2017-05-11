%{
/*************************/
/* GENERAL INCLUDE FILES */
/*************************/
#include <math.h>
#include <string.h>
#include <stdlib.h>

/*************************/
/* PROJECT INCLUDE FILES */
/*************************/
#include "ErrorMsg.h"
#include "Tokens.h"
#include "util.h"

/**************************/
/* CONTROL ERROR MESSAGES */
/**************************/
static int charPos=1;

/******************/
/* PROVIDE aaWRAP */
/******************/
int aawrap(void)
{
	charPos=1;
	return 1;
}

/**************************/
/* CONTROL ERROR MESSAGES */
/**************************/
static void adjust(void)
{
	User_ErrorMsg_tokPos = charPos;
	charPos += aaleng;
}

/***********/
/* YYSTYPE */
/***********/
YYSTYPE aalval;

%}

/*****************/
/* UNIQUE PREFIX */
/*****************/
%option prefix="aa"
		
/*********/
/* RULES */
/*********/
%%
[^\n]*"call void asm sideeffect"[^\n]*	{continue;}
[^\n]*"call void asm"[^\n]*	{continue;}
[^\n]*		{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*	{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"		{User_ErrorMsg_Log("%s", aatext); continue;}

