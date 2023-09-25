.globl myabs

myabs:
    // R0中
    mov w1, wzr
    sub w1, w1, w0
    cmp w0, #0
    csel w0, w0, w1, ge
    ret