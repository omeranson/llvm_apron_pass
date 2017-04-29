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
#include "User_ErrorMsg.h"
#include "User_Tokens.h"
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
/**********/
/* SPACES */
/**********/
WHITE_SPACE	" "

/*******************/
/* LINE TERMINATOR */
/*******************/
LINE_TERMINATOR	"\n"|"\r\n"|"\n\r"

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
"SYSCALL_DEFINE"[0-9]{FUNCUSR}		{
						FILE *fl;
						char *p = aatext+strlen("SYSCALL_DEFINE0(");
						char *q = strchr(p,',');
						char funcname[100];
						char filename[100];
						memset(funcname,0,sizeof(funcname));
						strncpy(funcname,p,q-p);
						if (strcmp(funcname,"copy_msghdr_from_user") == 0) continue;
						sprintf(filename,"/tmp/INLINE_ME/%s",funcname);
						fl = fopen(filename,"w+t");
						fprintf(fl,"INLINE ME BABY!!!\n");
						fclose(fl);
						continue;
					}
("ssize_t"{WHITE_SPACE}){ID}{FUNCUSR}	{
						FILE *fl;
						char *p = aatext+strlen("ssize_t ");
						char *q = strchr(p,'(');
						char funcname[100];
						char filename[100];
						memset(funcname,0,sizeof(funcname));
						strncpy(funcname,p,q-p);
						if (strcmp(funcname,"copy_msghdr_from_user") == 0) continue;
						sprintf(filename,"/tmp/INLINE_ME/%s",funcname);
						fl = fopen(filename,"w+t");
						fprintf(fl,"INLINE ME BABY!!!\n");
						fclose(fl);
						continue;
					}
("static"{WHITE_SPACE})("ssize_t"{WHITE_SPACE}){ID}{FUNCUSR}	{
						FILE *fl;
						char *p = aatext+strlen("static ssize_t ");
						char *q = strchr(p,'(');
						char funcname[100];
						char filename[100];
						memset(funcname,0,sizeof(funcname));
						strncpy(funcname,p,q-p);
						if (strcmp(funcname,"copy_msghdr_from_user") == 0) continue;
						sprintf(filename,"/tmp/INLINE_ME/%s",funcname);
						fl = fopen(filename,"w+t");
						fprintf(fl,"INLINE ME BABY!!!\n");
						fclose(fl);
						continue;
					}
[^\n]*				{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*			{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"				{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"				{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"				{User_ErrorMsg_Log("%s", aatext); continue;}

