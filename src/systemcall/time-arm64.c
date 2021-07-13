#include <stdio.h>
#include <time.h>
#include<sys/time.h>

int main()
{
      time_t tt;
      struct timeval tv;
      struct tm *t;
#if 0
      gettimeofday(&tv,NULL);
#else
      asm volatile(
          "add	 x0, x29, 16\n\t"  //X0寄存器用于传递参数&tv
          "mov	 x1, #0x0\n\t"     //X1寄存器用于传递参数NULL
          "mov	 x8, #0xa9\n\t"    //使用X8传递系统调用号169
          "svc	 #0x0\n\t"         //触发系统调用
      );
#endif
      tt = tv.tv_sec;
      t = localtime(&tt);
      printf("time: %d/%d/%d %d:%d:%d\n",
             t->tm_year + 1900,
             t->tm_mon,
             t->tm_mday,
             t->tm_hour,
             t->tm_min,
             t->tm_sec);
      return 0;
}
