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
[^\n]*"asm sideeffect"[^\n]*	{
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
				/******************/
				/* temporary name */
				/******************/
				memset(temp,0,sizeof(temp));
				strncpy(temp,q,r-q);
				User_ErrorMsg_Log("  %s = add ",temp);
				for (p=aatext;(*p) && (strncmp(p,"call",4)!=0);p++);
				p += strlen("call ");
				if (*p == '{')
				{
					q = strchr(p,'}');
					memset(temp,0,sizeof(temp));
					strncpy(temp,p,q-p+1);
					User_ErrorMsg_Log("%s 0, 0",temp);
				}
				else
				{
					q = strchr(p,' ');
					memset(temp,0,sizeof(temp));
					strncpy(temp,p,q-p);
					User_ErrorMsg_Log("%s 0, 0",temp);
				}
			}
		}
	}
[^\n]*		{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*	{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"		{User_ErrorMsg_Log("%s", aatext); continue;}

