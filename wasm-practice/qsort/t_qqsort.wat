(module
  (type $t0 (func (param i32 i32 i32)))
  (type $t1 (func))
  (type $t2 (func (param i32 i32 i32) (result i32)))
  (import "js" "memory" (memory 1))
  (func $myqsort (export "myqsort") (param i32) (param i32) (param i32)
    (local $a_right_8 i32) (local $a_left_9 i32)     ;; addr
    (local $j_right_3 i32) (local $i_left_4 i32)     ;; tmp value, j, i
    (local $tmp_g i32)(local $tt_1 i32)(local $i_index i32)(local $j_index i32)
    (local $baseAddr_0 i32)(local $left_1 i32)(local $right_2 i32)
    local.set $right_2
    local.set $left_1
    local.set $baseAddr_0
    (if
     (i32.gt_s
      (local.get $left_1)
      (local.get $right_2)
     )
     (return)
     () ;; else continue
    )
    
    local.get $baseAddr_0
    local.get $left_1
    i32.const 2
    i32.shl
    i32.add
    local.tee $a_left_9
    i32.load    ;; get arr[left]
    local.set $tmp_g    ;; get tmp

    local.get $left_1
    local.set $i_left_4
    local.get $right_2
    local.set $j_right_3  ;; get i, j
 
    (block $lable$0 ;; while(i, j)
     (if
      (i32.ne
       (local.get $i_left_4)
       (local.get $j_right_3)
      )
      (block $label$1
       (block $label$3  ;; while(j)
        (loop $label$4
         (if
          (i32.ge_s
           (
            local.get $baseAddr_0
            local.get $j_right_3
            i32.const 2
            i32.shl
            i32.add
            i32.load    ;; get arr[j]
           )
           (local.get $tmp_g)
          )
          (if
           (i32.gt_s
            (local.get $j_right_3)
            (local.get $i_left_4)            
           )
           (local.set $j_right_3
            (i32.add
             (local.get $j_right_3)
             (i32.const -1)
            )
           )
           (br $lable$0)   ;; j <= i, over
          )
          (br $lable$3)    ;; else over
         )
         (br $label$4)
        )
       )
       (block $label$5  ;; while(i)
        (loop $label$6
         (if
          (i32.le_s
           (
            local.get $baseAddr_0
            local.get $i_left_4
            i32.const 2
            i32.shl
            i32.add
            i32.load    ;; get arr[i]
           )
           (local.get $tmp_g)
          )
          (if
           (i32.gt_s
            (local.get $j_right_3)
            (local.get $i_left_4)            
           )
           (local.set $i_left_4
            (i32.add
             (local.get $i_left_4)
             (i32.const 1)
            )
           )
           (br $lable$0)   ;; j <= i, over
          )
          (br $lable$5)    ;; else over
         )
         (br $label$6)
        )
       )    ;; while(i) over
       
       ;; swap
        local.get $baseAddr_0
        local.get $i_left_4
        i32.const 2
        i32.shl
        i32.add
        local.tee $i_index
        i32.load    ;; get arr[i]
        local.set $tt_1    ;; get t

        ;; arr[i] = arr[j]
        local.get $baseAddr_0
        local.get $j_right_3
        i32.const  2
        i32.shl
        i32.add
        local.tee $j_index
        i32.load    ;; get arr[j]
        i32.store $i_index      ;; ---> arr[i]
        ;; arr[j] = t
        local.get $tt_1
        i32.store $j_index
      ) ;; top if block 1 
      ()    ;;top if block 2
     )  ;; end of __if__  while(i != j)
    ) ;; end of while(i != j)

    ;; swap
    ;; arr[left] = arr[i]
    local.get $baseAddr_0
    local.get $i_left_4
    i32.const 2
    i32.shl
    i32.add
    local.tee $i_index
    i32.load    ;; get arr[i]
    i32.store $left_1
    ;; arr[i] = tmp
    local.get $tmp_g
    i32.store $i_index
    ;;call
    local.get $baseAddr_0
    local.get $left_1
    local.get $i_left_4
    i32.const -1
    i32.add
    call  $myqsort
    local.get $baseAddr_0
    local.get $i_left_4
    i32.const 1
    i32.add
    local.get $right_2
    call  $myqsort
  )
  (memory 1)
  (export "memory" (memory 0))
  (export "myqsort" (func $myqsort))
)