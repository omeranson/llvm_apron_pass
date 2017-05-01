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
[^\n]*"get_user"[^\n(]*"("[^\n)]*")"[^\n]*	{												
												char *p=aatext;		
												char *q=strchr(p,'=');
												char *r=strchr(q+1,'(');
												char *s=strchr(r+1,')');
												char *t=strchr(s+1,',');
												char temp[1024];
												memset(temp,0,sizeof(temp));
												strncpy(temp,p,q-p);
												User_ErrorMsg_Log("%s= call i32 @get_user",temp);
												memset(temp,0,sizeof(temp));
												strncpy(temp,r,s-r+1);
												User_ErrorMsg_Log("%s",temp);
											}
[^\n]*"extractvalue"[^\n}]*"}"[^\n]*", 1"	{
												char *p=aatext;		
												char *q=strchr(p,'=');
												char *r=strchr(q+1,'}');
												char *s=strchr(r+1,'%');
												char *t=strchr(s+1,',');
												char temp[1024];
												memset(temp,0,sizeof(temp));
												strncpy(temp,p,q-p);
												User_ErrorMsg_Log("%s= ",temp);
												memset(temp,0,sizeof(temp));
												strncpy(temp,s,t-s);
												User_ErrorMsg_Log("add i1 0, 0",temp);													
											}

[^\n]*"extractvalue"[^\n}]*"}"[^\n]*", 0"	{
												char *p=aatext;		
												char *q=strchr(p,'=');
												char *r=strchr(q+1,'}');
												char *s=strchr(r+1,'%');
												char *t=strchr(s+1,',');
												char temp[1024];
												memset(temp,0,sizeof(temp));
												strncpy(temp,p,q-p);
												User_ErrorMsg_Log("%s= ",temp);
												memset(temp,0,sizeof(temp));
												strncpy(temp,s,t-s);
												User_ErrorMsg_Log("add i32 %s, 0",temp);													
											}
[^\n]*"llvm.uadd.with.overflow.i32("[^\n)]*")"[^\n]*	{
													char *p=aatext;		
													char *q=strchr(p,'(');
													char *r=strchr(q+1,',');
													char *s=strchr(r+1,'%');
													char *t=strchr(s+1,')');
													char *u=strchr(p,'=');
													char temp[1024];
													memset(temp,0,sizeof(temp));
													
													strncpy(temp,p,u-p);

													User_ErrorMsg_Log("%s= ",temp);
																								
													if (q && r)
													{
														memset(temp,0,sizeof(temp));
														strncpy(temp,q+1,r-q);
														User_ErrorMsg_Log("add %s",temp);
														memset(temp,0,sizeof(temp));
														strncpy(temp,s,t-s);
														User_ErrorMsg_Log(" %s",temp);
													}
													continue;
												}
"declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #5\n" {User_ErrorMsg_Log("%s", aatext); continue;}
[^\n]*				{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*			{User_ErrorMsg_Log("%s", aatext); continue;}
"\r"				{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"				{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"				{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"				{User_ErrorMsg_Log("%s", aatext); continue;}

