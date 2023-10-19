int jsArray[] = {5, 1, 3, 2, 4, 0};

void myqsort(int left, int right)
{
  if(left > right){
    return;
  }
  int tmp = jsArray[left];
  int i = left;
  int j = right;
  while(i != j){
    while(jsArray[j] >= tmp && j > i) j--;
    while(jsArray[i] <= tmp && j > i) i++;
    int t = jsArray[i];
    jsArray[i] = jsArray[j];
    jsArray[j] = t;
  }
  jsArray[left] = jsArray[i];
  jsArray[i] = tmp;

  myqsort(left, i-1);
  myqsort(i+1, right);
}

int getter(int index){
  return jsArray[index];
}
