.globl myqsort
myqsort:
    b step1

step1:
    cmp x1, x2
    b.gt .myjitend   // left > right ==> over

    stp x29, x30, [sp, #-48]!
    mov x29, sp

    str x0, [sp, #40]
    str w1, [sp, #36]
    str w2, [sp, #32]
    // x0.w1.w2...x30.x29

    mov x3, x1
    str w3, [sp, #28]
    mov x4, x2  // get i, j
    str w4, [sp, #24]

    lsl x5, x3, #2
    ldr w5, [x0, x5]    // get tmp value
    str w5, [sp, #20]
    // x0.w1.w2.i.j.tmp...x30.x29

    b _outer_while

_outer_while:
    // while(i<j)

    cmp w3, w4
    
    // _2_inner_while 可能不会进入，先拿到 w7 即str[i]的值 
    lsl w6, w3, #2
    ldr w7, [x0, x6]    // w7 = str[i]

    b.ge step6 // greater or equal break to step28
                // while over
    b _1_innner_while

_1_innner_while:
    mov x8, #0
    lsl w8, w4, #2  // j ---> offset
    ldr w9, [x0, x8]    // w9 = str[j]

    cmp w9, w5  // str[j] 和 keyvalue 比大小
    b.lt _2_inner_while    // 仅结束本while，跳转到另一个内层的while

    cmp w3, w4  // 比较ij
    b.ge _after_inner_while    // 直接结束两个内层while

    // 进入循环体，--后continue
    sub w4, w4, #1
    str w4, [sp, #24]   // 存j
    b _1_innner_while

// j的处理完之后，开始处理本轮的i
_2_inner_while:
    lsl w6, w3, #2
    ldr w7, [x0, x6]    // w7 = str[i]

    // while(a&&b) 任意条件不满足就结束整个内层
    cmp w7, w5
    b.gt _after_inner_while
    cmp w3, w4
    b.ge _after_inner_while

    // 满足while条件
    // 进入循环体，++后continue
    add w3, w3, #1
    str w3, [sp, #28]   // 存i
    b _2_inner_while

_after_inner_while:
    // 两个内层while结束之后
    
    // w8 j最后的偏移量
    // w6 i最后的偏移量
    // swap
    // w10 w11临时用作交换
    ldr w10, [x0, x6]
    ldr w11, [x0, x8]
    str w10, [x0, x8]
    str w11, [x0, x6]

    b _outer_while

step6: 
    // swap tmp, str[i]
    ldr w10, [x0, x6]
    str w5, [x0, x6]
//    mov x11, xzr
    lsl w11, w1, #2
    str w10, [x0, x11]
    

    // QkSort(arr, left, i - 1);
    ldr w3, [sp, #28]   // get i
    sub x2, x3, #1  // i-1
    ldr x0, [sp, #40]   // *str
    ldr w1, [sp, #36]   // left    
    bl step1
    // callee没有返回结果，不用处理

    // QkSort(arr, i + 1, right);
    ldr w3, [sp, #28]   // get i
    add x1, x3, #1  // i+1
    ldr x0, [sp, #40]
    ldr w2, [sp, #32]
    bl step1
    // callee没有返回结果，不用处理

    // 恢复环
    ldp x29, x30, [sp], #48
    ret
    
.myjitend:
    ret