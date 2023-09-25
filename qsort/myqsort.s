// x0 *arr
// w1 int left
// w2 int right
// w3 int tmp as partition
// x4 left*4
// w5 i
// w6 j
// w7 i*4
// w8 j*4
// x9 tmp


.globl myqsort
myqsort:
    cmp x1, x2
    b.gt end   // left > right ==> over

    lsl x3, x1, #2
    ldr x4, [x0, x3]    // get tmp value

    mov x5, x1
    mov x6, x2  // get i, j

    bl left_loop
    bl right_loop

    lsl x7, x5, #2
    ldr x9, [x0, x7]
    str x9, [x0, x3]    // arr[left] = arr[i]

    str x4, [x0, x7]    // arr[i] = tmp

    sub x8, x5, #1
    mov x2, x8
    bl myqsort

    add x5, x5, #1
    mov x1, x5
    bl myqsort

    b end

left_loop:
    ldr x7, [x0, x5, lsl #3]
    cmp x7, x4

    add x5, x5, #1
    blt left_loop

    ret

right_loop:
    lsl x7, x6, #2
    add x7, x7, x0
    ldr x7, [x7]
    cmp x7, x4

    sub x6, x6, #1
    bge right_loop

    ret

end:
    ret

//    QkSort(arr, left, i - 1);
//    QkSort(arr, i + 1, right);
