/*  FILE NAME             :  shlibexample.h     */
#ifndef _SH_LIB_EXAMPLE_H_
#define _SH_LIB_EXAMPLE_H_

#define SUCCESS 0
#define FAILURE (-1)

#ifdef __cplusplus
extern "C" {
#endif
/*
 * Shared Lib API Example
 * input    : none
 * output   : none
 * return   : SUCCESS(0)/FAILURE(-1)
 *
 */
int SharedLibApi();
#ifdef __cplusplus
}
#endif
#endif /* _SH_LIB_EXAMPLE_H_ */ 
