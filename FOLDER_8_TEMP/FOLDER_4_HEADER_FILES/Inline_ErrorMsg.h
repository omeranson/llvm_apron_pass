#ifndef __ROW_OPERATIONS_ERRORMSG_H__
#define __ROW_OPERATIONS_ERRORMSG_H__

/***************************************/
/* FILE NAME: Inline_ErrorMsg.h */
/***************************************/

/*************************/
/* PROJECT INCLUDE FILES */
/*************************/
#include "util.h"

/**********************/
/* EXTERNAL VARIABLES */
/**********************/
extern int Inline_ErrorMsg_tokPos;

/***********/
/* NEWLINE */
/***********/
void Inline_ErrorMsg_Newline(void);

/*********/
/* ERROR */
/*********/
void Inline_ErrorMsg_Error(int, string,...);

/****************/
/* LOG FILENAME */
/****************/
void Inline_ErrorMsg_Set_Log_Filename(string log_Filename);

/*********/
/* RESET */
/*********/
void Inline_ErrorMsg_Reset(string filename);

#endif
