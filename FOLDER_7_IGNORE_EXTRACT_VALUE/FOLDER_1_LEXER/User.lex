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
[^\n]*"extractvalue"[^\n]*", "[0-9]	{
		char *p;
		char *q;
		char *r;
		char *s;
		char *t;
		char *u;
		char *v;
		char *w	;
		char temp1[128];
		char temp2[128];
		int d;
		int i;
	
		p = aatext;
		q = strchr(p,'%');
		if (q)
		{
			r = strchr(q,' ');
			if (r)
			{
				s = strchr(r,'{');
				if (s)
				{
					t = strchr(s,'}');
					if (t)
					{
						u = strchr(t,'%');
						if (u)
						{
							v = strchr(u,',');
							if (v)
							{
								d = atoi(v+1);
							}
						}
					}
				}
			}
		}

		/******************/
		/* temporary name */
		/******************/
		memset(temp1,0,sizeof(temp1));
		strncpy(temp1,q,r-q);

		/*****************/
		/* type of field */
		/*****************/
		for (i=0;i<d;i++)
		{
			s = strchr(s+1,',');
		}
		s+=2;
		w = strchr(s,' ');
		memset(temp2,0,sizeof(temp2));
		if (*(w-1) == ','){*(w-1)=0;}
		strncpy(temp2,s,w-s);
		
		if ((*(w-1) == '*') || (*(w-2) == '*'))
		{
			User_ErrorMsg_Log("  %s = inttoptr i32 0 to %s",temp1,temp2);			
		}
		else
		{
			User_ErrorMsg_Log("  %s = add %s 0, 0",temp1,temp2);
		}
	}
[^\n]*		{User_ErrorMsg_Log("%s", aatext); continue;}
[^\r\n]*	{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\r\n"		{User_ErrorMsg_Log("%s", aatext); continue;}
"\n\r"		{User_ErrorMsg_Log("%s", aatext); continue;}

