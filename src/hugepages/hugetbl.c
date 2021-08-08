#include<stdio.h>
#include<stdlib.h>

int main()
{
    int i, len;
    int *mem;
    len = 2 * 1024 * 1024;
    mem = (int *)malloc(sizeof(int) * len);
    
    for (i = 0; i < len; i++)
    {
        mem[i] = i;
    }

    getchar();
    free(mem);
    return 0;
}
