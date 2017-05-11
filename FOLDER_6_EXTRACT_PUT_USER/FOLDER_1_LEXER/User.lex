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
"; Function Attrs:"[^\n]*	{
		static int put_user_declared=0;
		if (put_user_declared == 0)
		{
			put_user_declared=1;
			User_ErrorMsg_Log("%s","declare i32 @put_user_4(i32, i32*)\n");
			User_ErrorMsg_Log("%s","declare i8* @put_user_8(i8*, i8**)\n");
		}
		User_ErrorMsg_Log("%s",aatext);
	}
[^\n]*"put_user_4"[^\n]*	{
		char *p;
		char *q;
		char *r;
		char *s;
		char *t;
		char *u;
		char *v;
		char *w	;
		char temp[128];
	
		p = aatext;
		q = strchr(p,'%');
		if (q)
		{
			r = strchr(q,' ');
			if (r)
			{
				s = strchr(r,'(');
				if (s)
				{
					t = strchr(s,')');
					if (t)
					{
						/******************/
						/* temporary name */
						/******************/
						memset(temp,0,sizeof(temp));
						strncpy(temp,q,r-q);
						User_ErrorMsg_Log("  %s = call i32 @put_user_4",temp);
						memset(temp,0,sizeof(temp));
						strncpy(temp,s,t-s+1);
						User_ErrorMsg_Log("%s",temp);
					}
				}
			}
		}
	}
[^\n]*		{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*	{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"		{User_ErrorMsg_Log("%s", aatext); continue;}

