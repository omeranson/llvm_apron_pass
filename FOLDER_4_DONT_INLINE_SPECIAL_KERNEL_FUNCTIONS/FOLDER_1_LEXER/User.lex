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
/* PROVIDE aawrap */
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

/*****************/
/* FUNCTION NAME */
/*****************/
FUNC_NAME1	"define internal fastcc i64 @copy_msghdr_from_user("[^#]*"#"

/*********/
/* RULES */
/*********/
%%
"attributes #0 = { "[^\r\n]*[\n\r]*	{
										char *p = aatext+strlen("attributes #0 = { ");
										User_ErrorMsg_Log("%s","attributes #0 = { ");
										User_ErrorMsg_Log("%s","alwaysinline ");
										User_ErrorMsg_Log("%s",p);
									}
[^\n]*{FUNC_NAME1}[^\n]*			{
										char *pp = strchr(aatext,'#');
										char temp[1024];
										memset(temp,0,sizeof(temp));
										strncpy(temp,aatext,pp-aatext);
										User_ErrorMsg_Log("%s",temp);
										User_ErrorMsg_Log("%s","#324");
										User_ErrorMsg_Log("%s",pp+2);
									}
[^\n]*								{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*							{User_ErrorMsg_Log("%s", aatext); continue;}
"\r"								{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"								{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"								{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"								{User_ErrorMsg_Log("%s", aatext); continue;}

