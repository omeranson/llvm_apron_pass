/***********************/
/* FILE NAME: driver.c */
/***********************/

/*************************/
/* GENERAL INCLUDE FILES */
/*************************/
#include <stdio.h>

/*************************/
/* PROJECT INCLUDE FILES */
/*************************/
#include "util.h"
#include "User_ErrorMsg.h"
#include "Inline_ErrorMsg.h"

int aalex(void);
int bblex(void);

/*****************/
/* START OF CODE */
/*****************/
void usage(int argc, char **argv)
{
	if (argc != 3)
	{
		fprintf(stderr,"usage: a.out filename\n");
		return 0;
	}
}

int main(int argc, char **argv)
{
	string User_Filename  =argv[1];
	string UserOutput     =argv[2];
	
	usage(argc,argv);
	
	User_ErrorMsg_Set_Log_Filename(UserOutput);		
	User_ErrorMsg_Reset(User_Filename);

	printf("\n\n");
	
	while (aalex());
	// while (bblex());
		
	return 0;
}

