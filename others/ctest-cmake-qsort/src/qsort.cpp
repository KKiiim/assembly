#include <stdio.h>
#include <gtest/gtest.h>

extern "C" void myqsort(int *arr, int left, int right);

void printStr(int str[], size_t len)
{
    for(int i = 0; i < len; ++i)
    {
        printf("%d ", str[i]);
    }
    printf("\n");
}

TEST(MockFileStorageTest, testClearJob) {
    int str[11] = {0, 5, 2, 7, 4, 3, 9, 0, 1, 6, 8};
    printStr(str, 11);
    myqsort(str, 1, 10);
    printStr(str, 11);
    int expected_array[11] = {0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    for(int i = 0; i < 11; ++i){
      EXPECT_EQ(expected_array[i], str[i]);
    }
}

//int main(){
    // int str[11] = {0, 5, 2, 7, 4, 3, 9, 0, 1, 6, 8};
    // printStr(str, 11);
    // myqsort(str, 1, 10);
    // printStr(str, 11);
    // int expected_array[11] = {0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    // for(int i = 0; i < 11; ++i){
    //   EXPECT_EQ(expected_array[i], str[i]);
    // }
//}