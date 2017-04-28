#ifndef __MAT_READER_ERRORMSG_H__
#define __MAT_READER_ERRORMSG_H__

/***********************************/
/* FILE NAME: User_ErrorMsg.h */
/***********************************/

/*************************/
/* PROJECT INCLUDE FILES */
/*************************/
#include "util.h"

/**********************/
/* EXTERNAL VARIABLES */
/**********************/
extern int User_ErrorMsg_tokPos;

/***********/
/* NEWLINE */
/***********/
void User_ErrorMsg_Newline(void);

/*********/
/* ERROR */
/*********/
void User_ErrorMsg_Error(int, string,...);

/****************/
/* LOG FILENAME */
/****************/
void User_ErrorMsg_Set_Log_Filename(string log_Filename);

/*********/
/* RESET */
/*********/
void User_ErrorMsg_Reset(string filename);

#endif
