.globl mysum

mysum:
    sub sp, sp, #16
    str w0, [sp, #12]
    // w0内容（n）存入内存

    mov w1, #1
    str w1, [sp, #4]        // 初始化i=1
    str wzr, [sp, #8]   // 初始化sum=0

    b .forLoop

.forLoop:
    ldr w1, [sp, #4]        // 加载i到寄存器w1
    ldr w3, [sp, #12]    // 加载n到寄存器w3
    subs w3, w1, w3     // w1-w3的值放到w3，并修改标志位
                        // 内存中[sp, #12] n的值始终没有变
    
    b.gt .over
    b .count

.count:
    ldr w2, [sp, #8]    // 加载sum到寄存器w2
    ldr w1, [sp, #4]        // 加载i到寄存器w1
    add w2, w2, w1
    str w2, [sp, #8]    // sum存回内存
    add w1, w1, #1      // ++i
    str w1, [sp, #4]        // i存回内存
    b .forLoop


.over:
    ldr w0, [sp, #8]    // 加载sum到寄存器w0
    add sp, sp, #16     // 回收内存
    ret