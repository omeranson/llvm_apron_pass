%{
/*************************/
/* GENERAL INCLUDE FILES */
/*************************/
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

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
		
/********************/
/* COMMON REGEXP(s) */
/********************/

/***************/
/* PARENTHESES */
/***************/
LPAREN "("
RPAREN ")"
NON_PAREN [^)(]

/********/
/* USER */
/********/
USER	"__user"

/****************************/
/* FUNC WITH USER ATTRIBUTE */
/****************************/
FUNCUSR	{LPAREN}{NON_PAREN}*{USER}{NON_PAREN}*{RPAREN}

/******/
/* ID */
/******/
ID	[a-zA-Z_][a-zA-Z_0-9]*

/*********/
/* RULES */
/*********/
%%
[^\r\n]*"("[^)]*"__user"[^)]*")"[^\r\n]*	{
		FILE *fl;
		char *p = aatext;
		char *q = strchr(p,'(');
		char *r = q-1;
		char funcname[100];
		char filename[100];
		int i;
		while (
			 ((*r) == '_') ||
			(((*r) >= 'a') && ((*r) <= 'z')) ||
			(((*r) >= 'A') && ((*r) <= 'Z')) ||
			(((*r) >= '0') && ((*r) <= '9')))
		{
			r--;
		}
		r++;
		if (r<q)
		{
			memset(funcname,0,sizeof(funcname));
			strncpy(funcname,r,q-r);
			sprintf(filename,"/tmp/INLINE_ME/%s.txt",funcname);
			fl = fopen(filename,"w+t");
			if (!fl) {
				fprintf(stderr, "Failed to open output file %s: %s\n", filename, strerror(errno));
				exit(1);
			}
			fprintf(fl,"INLINE ME BABY!!!\n");
			fclose(fl);
		}
	}
[^\r\n]*	{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\r"		{User_ErrorMsg_Log("%s", aatext); continue;}

