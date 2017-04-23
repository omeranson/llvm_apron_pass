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
#include "Inline_ErrorMsg.h"
#include "Inline_Tokens.h"
#include "util.h"

/**************************/
/* CONTROL ERROR MESSAGES */
/**************************/
static int charPos=1;

/******************/
/* PROVIDE aaWRAP */
/******************/
int bbwrap(void)
{
	charPos=1;
	return 1;
}

/**************************/
/* CONTROL ERROR MESSAGES */
/**************************/
static void adjust(void)
{
	Inline_ErrorMsg_tokPos = charPos;
	charPos += bbleng;
}

/***********/
/* YYSTYPE */
/***********/
YYSTYPE bblval;

%}

/*****************/
/* UNIQUE PREFIX */
/*****************/
%option prefix="bb"

/********************/
/* COMMON REGEXP(s) */
/********************/

/**********/
/* SPACES */
/**********/
WHITE_SPACE	" "

/*******************/
/* LINE TERMINATOR */
/*******************/
LINE_TERMINATOR	"\n"|"\r\n"|"\n\r"

/*************/
/* SEMICOLON */
/*************/
SEMICOLON	";"

/*************************/
/* FUNCTION DECLARATIONS */
/*************************/
FUNC_ATTRIBUTES	"; Function Attrs: "[^\n]*\n[\n\r" "]*

/*****************/
/* FUNCTION NAME */
/*****************/
FUNC_NAME	"define i64 @"[a-zA-Z_0-9]*"("	

/**************/
/* ATTRIBUTES */
/**************/
ATTRIBUTES	"attributes #0 = { "[^\n]*

/*********/
/* RULES */
/*********/
%%

"attributes #0 = { "[^\r\n]*"\n"	{
									char *p = bbtext+strlen("attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","alwaysinline ");
									Inline_ErrorMsg_Log("%s",p);
								}
"attributes #0 = { "[^\r\n]*"\n\r"	{
									char *p = bbtext+strlen("attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","alwaysinline ");
									Inline_ErrorMsg_Log("%s",p);
								}
"attributes #0 = { "[^\r\n]*"\r\n"	{
									char *p = bbtext+strlen("attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","alwaysinline ");
									Inline_ErrorMsg_Log("%s",p);
								}
"attributes #0 = { "[^\r\n]*"\r"	{
									char *p = bbtext+strlen("attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","attributes #0 = { ");
									Inline_ErrorMsg_Log("%s","alwaysinline ");
									Inline_ErrorMsg_Log("%s",p);
								}
{FUNC_ATTRIBUTES}{FUNC_NAME}	{
									FILE *fl;
									char *p = strchr(bbtext,'@');
									char *q = strchr(p,'(');
									char funcname[100];
									char filename[100];
									memset(funcname,0,sizeof(funcname));
									strncpy(funcname,p+1,q-p);
									funcname[q-p-1]=0;
									sprintf(filename,"/tmp/INLINE_ME/%s",funcname);
									fl=fopen(filename,"rt");
									if (fl == NULL)
									{
										Inline_ErrorMsg_Log("%s", bbtext);
									}
									else
									{
										char temp[100]={0};
										fscanf(fl,"%s",temp);
										assert(strncmp(temp,"INLINE",6)==0);
										{
											char *pp = bbtext+strlen("; Function Attrs: ");
											Inline_ErrorMsg_Log("; Function Attrs: alwaysinline %s",pp);
										}
										fclose(fl);
									}
									continue;
								}
[^\n]*							{Inline_ErrorMsg_Log("%s", bbtext); continue;}
[^\r\n]*						{Inline_ErrorMsg_Log("%s", bbtext); continue;}
"\r"							{Inline_ErrorMsg_Log("%s", bbtext); continue;}
"\n"							{Inline_ErrorMsg_Log("%s", bbtext); continue;}
"\r\n"							{Inline_ErrorMsg_Log("%s", bbtext); continue;}
"\n\r"							{Inline_ErrorMsg_Log("%s", bbtext); continue;}

