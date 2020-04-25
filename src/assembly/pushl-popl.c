#include <stdio.h>

int  main()
{
      void * val1 = 0;
      void * val2 = 0;
      void * val3 = 0;
      printf("val1:%p,val2:%p,val3:%p\n",val1,val2,val3);
      asm volatile(
      "movl $0,%%eax\n\t"     /* clear %eax to 0 */
      "movl %%esp,%1\n\t"     /* val1 = %esp */
      "pushl %%esp\n\t"       /* pushl %esp */
      "movl (%%esp),%2\n\t"   /* val2 = (%esp) */
      "popl %%esp\n\t"        /* esp = (%esp) */
      "movl %%esp,%0\n\t"     /* val3 = %esp */
      : "=m" (val3),     /* output =m mean only write output memory variable */
       "=c" (val1),"=d" (val2)    /* input c or d mean %ecx/%edx */
      :
      );
      printf("val1:%p,val2:%p,val3:%p\n",val1,val2,val3);

      return 0;
}
