#include <stdio.h>
#include "shlibexample.h" 
#include <dlfcn.h>


int main()
{
    printf("This is a Main program!\n");
    /* 装载时动态链接 */
    printf("Calling SharedLibApi() function of libshlibexample.so!\n");
    SharedLibApi();
    
    /* 运行时动态链接 */
    void * handle = dlopen("libdllibexample.so",RTLD_NOW);
    if(handle == NULL)
    {
        printf("Open Lib libdllibexample.so Error:%s\n",dlerror());
        return   FAILURE;
    }
    int (*func)(void);
    char * error;
    func = dlsym(handle,"DynamicalLoadingLibApi");
    if((error = dlerror()) != NULL)
    {
        printf("DynamicalLoadingLibApi not found:%s\n",error);
        return   FAILURE;
    }    
    printf("Calling DynamicalLoadingLibApi() function of libdllibexample.so!\n");
    func();  
    dlclose(handle);
    return SUCCESS;
}
