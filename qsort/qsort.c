#include <stdio.h>

extern void myqsort(int *arr, int left, int right);

void printStr(int *str, size_t len)
{
    for(int i = 0; i < len; ++i)
    {
        printf("%d ", str[i]);
    }
    printf("\n");
}

int main(){
    int str[11] = {5, 2, 7, 4, 3, 9, 0, 1, 6, 8};
    printf("before qsort\n");
    printStr(str, strlen(str));

    myqsort(str, 0, strlen(str)-1);

    printf("after qsort\n");
    printStr(str, strlen(str));
}