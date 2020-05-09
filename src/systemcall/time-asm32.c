#include <stdio.h>
#include <time.h>
int main()
{
  time_t tt;
  struct tm *t;
  asm volatile(
      "movl $0,%%ebx\n\t"   //系统调用传递第一个参数使用EBX寄存器为0
      "movl $0xd,%%eax\n\t" //使用%eax传递系统调用号13，用16进制为0xd
      "int $0x80\n\t"       //触发系统调用
      "movl %%eax,%0\n\t"   //通过EAX寄存器返回系统调用值
      : "=m"(tt));
  t = localtime(&tt);
  printf("time-asm32: %d/%d/%d  %d:%d:%d\n",
         t->tm_year + 1900,
         t->tm_mon,
         t->tm_mday,
         t->tm_hour,
         t->tm_min,
         t->tm_sec);
  return 0;
}