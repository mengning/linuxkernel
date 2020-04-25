#include <stdio.h>

int  main()
{
      void * val1 = 0;
      void * val2 = 0;
      void * val3 = 0;
      printf("val1:%p,val2:%p,val3:%p\n",val1,val2,val3);
      asm volatile(
      "movq $0,%%rax\n\t"     /* clear %rax to 0*/
      "movq %%rsp,%1\n\t"     /* val1 = %rsp */
      "pushq %%rsp\n\t"       /* pushq %rsp */
      "movq (%%rsp),%2\n\t"   /* val2 = (%rsp) */
      "popq %%rsp\n\t"        /* %rsp = (%rsp) */
      "movq %%rsp,%0\n\t"     /* val3 = %rsp */
      : "=g" (val3),     /* output =m mean only write output memory variable */
        "=g" (val1),
	"=g" (val2) 
      :
      );
      printf("val1:%p,val2:%p,val3:%p\n",val1,val2,val3);

      return 0;
}
