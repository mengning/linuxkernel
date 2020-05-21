#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char * argv[])
{
    int pid;
    /* fork another process */
    pid = fork();
    if (pid < 0) 
    { 
        /* error occurred */
        fprintf(stderr, "Fork Failed!");
        exit(-1);
    } 
    else if (pid == 0) 
    {
        /*   child process   */
        execlp("/bin/ls", "ls", NULL);
    } 
    else 
    {  
        /*     parent process  */
        /* parent will wait for the child to complete*/
        wait(NULL);
        printf("Child Complete!");
        exit(0);
    }
}
