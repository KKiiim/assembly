#include <stdio.h>
#include <string.h>

extern void *mymemset(void *str, int c, size_t n);

int main(){
    char str[30] = "this is memset test\n";
    printf("before    set:%s", str);
    printf("strlen of str=%lu\n", strlen(str));

    char *myset = mymemset(str, '#', 7);
    printf("after  mymemset:%s", myset);
    printf("strlen of str=%lu\n", strlen(myset));
    
    return 0;
}