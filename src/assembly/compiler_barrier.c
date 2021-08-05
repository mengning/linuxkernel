#define barrier() __asm__ __volatile__("": : :"memory")

int flag, data;

int function(void)
{
    data = data + 1;
    barrier();
    flag = 1;
}