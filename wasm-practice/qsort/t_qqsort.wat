(module
  (memory 1)
  (func $myqsort (export "myqsort") (param $l_left i32) (param $r_right i32)
    (local $a_right_8 i32) (local $a_left_9 i32)     ;; addr
    (local $j_right_3 i32) (local $i_left_4 i32)     ;; tmp value, j, i
    (local $tmp_g i32)(local $tt_1 i32)(local $i_index i32)(local $j_index i32)
    (local $left_1 i32)(local $right_2 i32)
    (local.get $l_left)
    (local.get $r_right)
    (local.set $right_2)
    (local.set $left_1)

    (if
     (i32.gt_s
      (local.get $left_1)
      (local.get $right_2)
     )
     (return)
      ;; else continue
    )
    
    (local.get $left_1)
    (i32.const 2)
    (i32.shl)
    (local.tee $a_left_9)
    (i32.load)    ;; get arr[left]
    (local.set $tmp_g )   ;; get tmp

    (local.get $left_1)
    (local.set $i_left_4)
    (local.get $right_2)
    (local.set $j_right_3)  ;; get i, j
 
    (block $label$0 ;; while(i, j)
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
           (i32.load    ;; get arr[j]
            (local.get $j_right_3)
            (i32.const 2)
            (i32.shl)
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
           (br $label$0)   ;; j <= i, over
          )
          (br $label$3)    ;; else over
         )
         (br $label$4)
        )
       )
       (block $label$5  ;; while(i)
        (loop $label$6
         (if
          (i32.le_s
           (i32.load    ;; get arr[i]
            (local.get $i_left_4)
            (i32.const 2)
            (i32.shl)  
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
           (br $label$0)   ;; j <= i, over
          )
          (br $label$5)    ;; else over
         )
         (br $label$6)
        )
       )    ;; while(i) over
       
       ;; swap
        (local.get $i_left_4)
        (i32.const 2)
        (i32.shl)
        (local.tee $i_index)
        (i32.load)    ;; get arr[i]
        (local.set $tt_1)  ;; get t

        ;; arr[i] = arr[j]
        (i32.store  ;; ---> arr[i]
         (local.get $i_index) ;;addr
         (i32.load  ;; get arr[j] value
          (local.get $j_right_3)
          (i32.const  2)
          (i32.shl)
          (local.tee $j_index)   
         )
        )
   
        ;; arr[j] = t
        (i32.store
         (local.get $j_index) ;;addr
         (local.get $tt_1) ;;value
        )
      ) ;; top if block 1 
      (br $label$0)    ;;top if block 2
     )  ;; end of __if__  while(i != j)
    ) ;; end of while(i != j)

    ;; swap
    ;; arr[left] = arr[i]
    (i32.store
     (local.get $i_index) ;;addr
     (i32.load  ;; m to stack
      (local.get $i_left_4)
      (i32.const 2)
      (i32.shl)   ;;addr
     ) ;;value
    )

    ;; arr[i] = tmp
    (i32.store
     (local.get $i_index)     ;;addr
     (local.get $tmp_g)     ;;value
    )    
    
    ;;call
    (local.get $left_1)
    (local.get $i_left_4)
    (i32.const -1)
    (call  $myqsort)
    (local.get $i_left_4)
    (i32.const 1)
    (local.get $right_2)
    drop
    drop
    (call  $myqsort)
  )
  ;; 导出 getter 和 setter 函数接口
  (func (export "wasm2js") (param $index i32)(result i32)
    (local.get $index)
    (i32.const 2)
    (i32.shl) ;; stack: addr
    (i32.load)
    ;; return mem[addr]
  )
  
  (func (export "js2wasm") (param $value i32)(param $index i32)
    (local.get $index)
    (i32.const 2)
    (i32.shl) 
    (local.get $value)    ;; stack: addr, value
    (i32.store)
  )
)