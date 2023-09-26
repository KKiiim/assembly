#include <stdio.h>

extern void myqsort(int *arr, int left, int right);
//extern void QkSort(int *arr, int left, int right);

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
//    int str[11] = {0,1,2,3,4,5,6,7,8,9};
    //int str[4] = {1,1,3,2};
    printf("before qsort\n");
    printStr(str, 11);

    myqsort(str, 1, 10);
//   QkSort(str, 0, 9);
    printf("after qsort\n");
    printStr(str, 11);
}