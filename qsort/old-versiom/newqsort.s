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
    b step2

step2:
    // while(i<j)
    cmp w3, w4
    b.ge step6 // greater or equal break to step28
                // while over
    b step3

step3:
    lsl w8, w4, #2  // j ---> offset
    ldr w9, [x0, w8]    // w9 = str[j]

    cmp w9, w5  // str[j] 和 keyvalue 比大小
    b.lt step4    // 仅结束本while，跳转到另一个内层的while

    cmp w3, w4  // 比较ij
    b.ge step5    // 直接结束两个内层while

    // 进入循环体，--后continue
    sub w4, w4, #1
    b step3

// j的处理完之后，开始处理本轮的i
step4:
    lsl w6, w3, #2
    ldr w7, [x0, x6]    // w7 = str[i]

    // while(a&&b) 任意条件不满足就结束整个内层
    cmp w7, w5
    b.gt step5
    cmp w3, w4
    b.ge step5

    // 满足while条件
    // 进入循环体，++后continue
    add w3, w3, #1
    b step4

step5:
    // 两个内层while结束之后
    
    // w8 j最后的偏移量
    // w6 i最后的偏移量
    // swap
    ldr w10, [x0, x6]
    ldr w11, [x0, x8]
    str w10, [x0, x8]
    str w11, [x0, x6]

    b step2

step6:
    // 把环境保存在栈中，再进行递归
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
