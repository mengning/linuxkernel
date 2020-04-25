#include <stdio.h>


int  main()
{
      /* val1+val2=val3 */
      unsigned long val1 = 1;
      unsigned long val2 = 2;
      unsigned long val3 = 0;
      printf("val1:%ld,val2:%ld,val3:%ld\n",val1,val2,val3);
      asm volatile(
      "movq $0,%%rax\n\t"     /* clear %rax to 0*/
      "addq %1,%%rax\n\t"     /* %rax += val1 */
      "addq %2,%%rax\n\t"     /* %rax += val2 */
      "movq %%rax,%0\n\t"     /* val2 = %rax*/
      : "=m" (val3)     /* output =m mean only write output memory variable*/
      : "g" (val1),"g" (val2)    /* input g mean Choose any one Register */
      );
      printf("val1:%ld+val2:%ld=val3:%ld\n",val1,val2,val3);


      return 0;
}
