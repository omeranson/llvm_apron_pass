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
FUNC_NAME2	"define i32 @rw_copy_check_uvector("[^#]*"#"

/*********/
/* RULES */
/*********/
%%
"attributes #0 = { "[^\r\n]*		{
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
[^\n]*{FUNC_NAME2}[^\n]*			{
										char *pp = strchr(aatext,'#');
										char temp[1024];
										memset(temp,0,sizeof(temp));
										strncpy(temp,aatext,pp-aatext);
										User_ErrorMsg_Log("%s",temp);
										User_ErrorMsg_Log("%s","#324");
										User_ErrorMsg_Log("%s",pp+2);
									}
"define"[^#\r\n]*"("[^)]*")"[^#\r\n]*"#"[^\r\n]*	{
										FILE *fl;
										char *p = strchr(aatext,'#');
										char *q = strchr(aatext,'(');
										char *r = q-1;
										char temp[1024];
										char funcname[256];
										char filename[256];
										char filename2[256];
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
											sprintf(filename2,"/tmp/INLINE_ME/SyS_%s.txt",funcname);
											fl = fopen(filename,"rt");
											if (fl == NULL)
											{
												fl = fopen(filename2,"rt");
												if (fl == NULL)
												{
													*(p+1)='1';
													User_ErrorMsg_Log("%s",aatext);
												}
												else
												{
													*(p+1)='0';
													User_ErrorMsg_Log("%s",aatext);
													fclose(fl);													
												}
											}
											else
											{
												*(p+1)='0';
												User_ErrorMsg_Log("%s",aatext);
												fclose(fl);
											}
										}
									}
[^\r\n]*							{User_ErrorMsg_Log("%s", aatext); continue;}
"\r"								{User_ErrorMsg_Log("%s", aatext); continue;}
"\n"								{User_ErrorMsg_Log("%s", aatext); continue;}

