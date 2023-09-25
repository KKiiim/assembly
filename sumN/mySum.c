#include <stdio.h>

extern int mysum(int);

int main()
{
    int n=0;
    while(scanf("%d",&n) != EOF)
    {
        printf("sum from 1 To %d = %d\n", n,mysum(n));
    }
}