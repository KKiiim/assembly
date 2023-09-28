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
    lsl x5, x5, #8
    add x4, x4, x5  // ###
    lsl x5, x5, #8 
    add x4, x4, x5  // ####
                    // w4
    lsl x5, x5, #8
    add x4, x4, x5  // #####
    lsl x5, x5, #8
    add x4, x4, x5  // ######
    lsl x5, x5, #8
    add x4, x4, x5  // #######
    lsl x5, x5, #8
    add x4, x4, x5  // ########
                    // x4

    b .loop

.loop:
// 检查是否已经填充完所有字
// 一次取十六个字节
    subs x2, x2, #16
    b.mi .laststore

// 正常处理十六个字节
.common:
    mov x7, x0
    add x7, x7, x2

    stp x4, x4, [x7]
    b .loop

// 异常情况
.laststore:
    add x2, x2, #16  // x2 is last transfer
    mov x6, #0

.oneByone_loop:
    strh w4, [x3, x2]
    mov x7, #1
    add x6, x6, x7
    cmp x2, x6
    b.eq .myend 
    b oneByone_loop
    
.myend:
    ret
