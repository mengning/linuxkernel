#include <stdio.h>
#include <time.h>
int main()
{
      time_t tt;
      struct tm *t;
      asm volatile(
          "movl $0xc9,%%eax\n\t"//使用%eax传递系统调用号
	  "movl $0, %%edi\n\t"
          "syscall\n\t" //触发系统调用
          "movq %%rax,%0\n\t"//通过 EAX 寄存器返回系统调用值      
          :"=m"(tt)
      );
      t = localtime(&tt);
      printf("time: %d/%d/%d %d:%d:%d\n",
            t->tm_year+1900,
            t->tm_mon,
            t->tm_mday,
            t->tm_hour,
            t->tm_min,
            t->tm_sec);
      return 0;
}
