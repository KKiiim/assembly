(module
    (type (func (param i32)(result i32)))
    (func (type 0)(param i32)(result i32)
        local.get 0
        i32.const 0
        i32.ge_s
        if (result i32)
        local.get 0
        else
        i32.const 0
        local.get 0
        i32.sub
        end)
    (export "abs" (func 0))
)