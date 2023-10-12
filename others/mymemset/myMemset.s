.globl mymemset

// x0 *str
// x1 填充的字符c
// x2 待替换的字节数
// x3 存当前要操作的首地址

mymemset:
    mov x3, x0

    // 提前准备好，放在x4中, 只进行一次
    mov x4, x1      // #
    lsl x5, x1, #8
    add x4, x4, x5  // ##
    lsl x5, x1, #16
    add x4, x4, x5  // ###
    lsl x5, x1, #24 
    add x4, x4, x5  // ####
                    // w4


    b .loop

.loop:
    cmp w2, #0             // 检查是否已经填充完所有字
    b.eq .end

// 一次取四个字节
    subs x2, x2, #4
    b.mi .laststore
    b .common

// 正常处理四个字节
.common:
    str w4, [x0, x2]
    b .loop

// 异常情况
.laststore:
    add x2, x2, #4  // x2 is last transfer
    // todo
    cmp x2, #1
    b.eq .one_last

    cmp x2, #2
    b.eq .two_last

    cmp x2, #3
    b.eq .three_last

.one_last:
    strb w4, [x3]
    ret

.two_last:
    strh w4, [x3]
    ret

.three_last:
    strh w4, [x3]
    strb w4, [x3, #2]
    ret

.end:

    ret