// x0 *arr
// w1 int left
// w2 int right
// w3 i
// w4 j
// w5 keyvalue

.globl myqsort
myqsort:
    sub sp, sp, #16
    stp x29, x30, [sp]

    b step1

step1:
    cmp x1, x2
    b.gt end   // left > right ==> over

    mov x3, x1
    mov x4, x2  // get i, j

    lsl x5, x1, #2
    ldr w5, [x0, x3]    // get tmp value

step4:
    // while(i<j)
    cmp w3, w4
    b.ge step66 // greater or equal break to step28

step8:
    lsl w8, w4, #2  // j ---> offset
    ldr w9, [x0, w8]    // w9 = str[j]

    cmp w9, w5  // str[j] 和 keyvalue 比大小
    b.lt step9

    cmp w3, w4  // 比较ij
    b.ge step12

    // 进入循环体，--后continue
    sub w4, w4, #1
    b step8

// j的处理完之后，开始处理本轮的i
step9:
    lsl w6, w3, #2
    ldr w7, [x0, x6]    // w7 = str[i]

    cmp w7, w5
    b.gt step12

    cmp w3, w4
    b.ge step12

    // 进入循环体，++后continue
    add w3, w3, #1
    b step9

step12:
    // w8 j最后的偏移量
    // w6 i最后的偏移量
    ldr w10, [x0, x6]
    ldr w11, [x0, x8]
    str w10, [x0, x8]
    str w11, [x0, x6]

    b step1

step66:
    stp w1, w2, [sp, #-48]!
    stp w3, w4, [sp, #8]
    stp x5, x29, [sp, #16]
    str LR, [sp, #32]
    
    // QkSort(arr, left, i - 1);
    sub x2, x3, #1
    mov fp, sp
    bl QuickSort

    // QkSort(arr, i + 1, right);
    ldr x1, [sp, #8]
    add x1, x1, #1
    ldr x2, [sp, #4]
    bl QuickSort

    // 恢复环境
    ldr LR, [sp, #32]
    ldr fp, [sp, #24]
    add sp, sp, #48
    
.end:
    ret
