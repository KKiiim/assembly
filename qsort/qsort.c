#include <stdio.h>

//extern void myquicksort(int *arr, int left, int right);
extern void QkSort(int *arr, int left, int right);

void printStr(int str[], size_t len)
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
    printStr(str, 10);

//    myquicksort(str, 0, 9);
    QkSort(str, 0, 9);
    printf("after qsort\n");
    printStr(str, 10);
}
