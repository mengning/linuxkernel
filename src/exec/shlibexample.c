/*  FILE NAME             :  shlibexample.c  */
#include <stdio.h>
#include "shlibexample.h"
/*
 * Shared Lib API Example
 * input    : none
 * output   : none
 * return   : SUCCESS(0)/FAILURE(-1)
 *
 */
int SharedLibApi()
{
    printf("This is a shared libary!\n");
    return SUCCESS;
}
