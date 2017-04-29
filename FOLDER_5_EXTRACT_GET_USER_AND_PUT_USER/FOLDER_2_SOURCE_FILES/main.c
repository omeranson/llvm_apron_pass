/*********************/
/* FILE NAME: main.c */
/*********************/

/*************************/
/* GENERAL INCLUDE FILES */
/*************************/
#include <stdio.h>

/*************************/
/* PROJECT INCLUDE FILES */
/*************************/
#include "util.h"
#include "ErrorMsg.h"

/****************************/
/* EXTERNAL lexing function */
/****************************/
int aalex(void);

/*****************/
/* START OF CODE */
/*****************/
void usage(int argc, char **argv)
{
	if (argc != 3)
	{
		fprintf(stderr,"usage: a.out filename\n");
	}
}

int main(int argc, char **argv)
{
	/************************************/
	/* Extract input & output filenames */
	/************************************/
	string User_Filename =argv[1];
	string UserOutput    =argv[2];
	
	/************************/
	/* Assert correct usage */
	/************************/
	usage(argc,argv);
	
	/***********************************/
	/* Transform input.ll to output.ll */
	/***********************************/
	User_ErrorMsg_Set_Log_Filename(UserOutput);		
	User_ErrorMsg_Reset(User_Filename);
	
	/*************/
	/* Transform */
	/*************/
	while (aalex());
		
	/**********/
	/* return */
	/**********/
	return 0;
}

