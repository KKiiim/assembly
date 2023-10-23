var arr = new Array<i32>(6);
arr[0] = 5;
arr[1] = 3;
arr[2] = 1;
arr[3] = 2;
arr[4] = 4;
arr[5] = 0;

export function myqsort(left: i32, right: i32): void {
    if (left > right) {
      return;
    }
  
    const tmp: i32 = arr[left];
    let i: i32 = left;
    let j: i32 = right;
  
    while (i != j) {
      while (arr[j] >= tmp && j > i) {
        j--;
      }
      while (arr[i] <= tmp && j > i) {
        i++;
      }
      const t: i32 = arr[i];
      arr[i] = arr[j];
      arr[j] = t;
    }
  
    arr[left] = arr[i];
    arr[i] = tmp;
  
    myqsort(left, i - 1);
    myqsort(i + 1, right);
}


export function getter(index: i32): i32{
  return arr[index];
}