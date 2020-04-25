#include <stdio.h>


int  main()
{
      /* val1+val2=val3 */
      unsigned int val1 = 1;
      unsigned int val2 = 2;
      unsigned int val3 = 0;
      printf("val1:%d,val2:%d,val3:%d\n",val1,val2,val3);
      asm volatile(
      "movl $0,%%eax\n\t"     /* clear %eax to 0*/
      "addl %1,%%eax\n\t"     /* %eax += val1 */
      "addl %2,%%eax\n\t"     /* %eax += val2 */
      "movl %%eax,%0\n\t"     /* val2 = %eax*/
      : "=m" (val3)     /* output =m mean only write output memory variable*/
      : "c" (val1),"d" (val2)    /* input c or d mean %ecx/%edx*/
      );
      printf("val1:%d+val2:%d=val3:%d\n",val1,val2,val3);


      return 0;
}
