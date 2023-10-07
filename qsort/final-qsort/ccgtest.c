#include <stdio.h>
#include <gtest/gtest.h>

void myqsort(int *arr, int left, int right)
{
  if(left > right){
    return;
  }
  int tmp = arr[left];
  int i = left;
  int j = right;
  while(i != j){
    while(arr[j] >= tmp && j > i) j--;
    while(arr[i] <= tmp && j > i) i++;
    int t = arr[i];
    arr[i] = arr[j];
    arr[j] = t;
  }
  arr[left] = arr[i];
  arr[i] = tmp;

  myqsort(arr, left, i-1);
  myqsort(arr, i+1, right);
}

int main(){
    int str[11] = {0, 5, 2, 7, 4, 3, 9, 0, 1, 6, 8};
    myqsort(str, 1, 10);
    int expected_array[11] = {0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    EXPECT_EQ(expected_array, str);
}
