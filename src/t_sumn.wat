(module
  (func $sum (export "n_sum") (param $n i32) (result i32)
    (local $i i32)(local $sumValue i32)

    i32.const 0
    local.set $sumValue     ;; 将常量 0 存储到第二个本地变量sumValue
    ;; stack empty
    local.get $n          ;; 将函数参数 $n 加载到栈
    local.set $i          ;; 本地变量i = n

    (loop $Loop
        local.get $sumValue  ;; sum入栈
        local.get $i
        i32.add
        local.set $sumValue
        ;; --i
        local.get $i
        i32.const 1
        i32.sub
        local.set $i

        local.get $i
        i32.const 0
        i32.ne
        br_if $Loop
        ;; loop over
    )
    local.get $sumValue
  )
)