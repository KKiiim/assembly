#include <stdio.h>

extern void myqsort(int *arr, int left, int right);

void printStr(int str[], size_t len)
{
    for(int i = 0; i < len; ++i)
    {
        printf("%d ", str[i]);
    }
    printf("\n");
}

int main(){
    int str[11] = {0, 5, 2, 7, 4, 3, 9, 0, 1, 6, 8};
    printStr(str, 11);
    myqsort(str, 1, 10);
    printStr(str, 11);
}