#include<stdio.h>

extern int myabs(int);

int main(){
    int n = 1;
    while(scanf("%d",&n) != EOF)
    {
        printf("number %d's abs = %d\n", n, myabs(n));
    }

    return 0;
}