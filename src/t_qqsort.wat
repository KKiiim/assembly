(module
  (memory 1)  ;; store left-->right-->i
  (func $myqsort (export "myqsort") (param $l_left i32) (param $r_right i32)
     ;; init mem
    (i32.store
      (i32.const 512);; sp begin at 512B
      (local.get $l_left)
    )
    (i32.store
      (i32.const 516)
      (local.get $r_right)
    )
    (call $myqsort_helper
      (i32.const 524)   ;; 4B for i
    )
    (drop)
  )
  (func $myqsort_helper (export "myqsort_helper") (param $sp_register i32)(result i32)
    (local $a_right_8 i32) (local $a_left_9 i32)     ;; addr
    (local $j_right_3 i32) (local $i_left_4 i32)     ;; tmp value, j, i
    (local $tmp_g i32)(local $tt_1 i32)(local $i_index i32)(local $j_index i32)
    (local $left_1 i32)(local $right_2 i32)(local $para_i i32)
    (local $sp_r i32)
    (local.set $sp_r
      (local.get $sp_register)
    )
(;
    (i32.load
      (i32.sub  ;;addr
        (local.get $sp_r)
        (i32.const 4)
      )  
    ) ;; stack: i  
;)  ;; location of i is empty
    (i32.load
      (i32.sub  ;;addr
        (local.get $sp_r)
        (i32.const 8)
      )  
    ) ;; stack: i right
    (i32.load
      (i32.sub
        (local.get $sp_r)
        (i32.const 12)
      )
    ) ;; stack: i right, left
    (local.set $left_1)
    (local.set $right_2)
 ;;   (local.set $para_i)
    ;; stack: non
    
    (if
     (i32.gt_s
      (local.get $left_1)
      (local.get $right_2)
     )
     (return
      (i32.sub
        (local.get $sp_r)
        (i32.const 12)
      )
     )
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
            (i32.sub
             (local.get $j_right_3)
             (i32.const 1)
            )
           )
           (br $label$3)   ;; j <= i, over
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
           (br $label$5)   ;; j <= i, over
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
        (local.tee $i_index)  ;; i_index is addr i
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
        (br $label$0)
      ) ;; top if block 1 
      (br $label$0)    ;;top if block 2
     )  ;; end of __if__  while(i != j)
    ) ;; end of while(i != j)

    ;; swap
    ;; arr[left] = arr[i]
    (i32.store
      (local.get $a_left_9
        (local.get $left_1)
        (i32.const 2)
        (i32.shl)
        (local.set $a_left_9)
      )
     (i32.load
      (local.get $i_left_4)
      (i32.const 2)
      (i32.shl)   ;;addr
     ) ;;value
    )

    ;; arr[i] = tmp
    (i32.store
     (local.get $i_index
      (local.get $i_left_4)
      (i32.const 2)
      (i32.shl)
      (local.set $i_index)
     )     ;;addr
     (local.get $tmp_g)     ;;value
    )

    (local.set $para_i
      (local.get $i_left_4)
    )
    ;; put i in the empty space below sp_r
    ;; until now, 12B below sp_r become full
    ;; para i is calculated in current func
    (i32.store
      (i32.sub
        (local.get $sp_r)
        (i32.const 4)
      )
      (local.get $para_i)
    )
    ;; caller can not determinate callee's i
    ;; empty space wait callee itself to calculate and fill the i space


    ;; prepare left, right for next callee, but i space if empty
    ;; call 1
    (i32.store
      (local.get $sp_r)
      (local.get $left_1)
    )
    (i32.store
      (i32.add
        (local.get $sp_r)
        (i32.const 4)
      )
      (i32.sub
        (local.get $para_i)
        (i32.const 1)
      )
    )
    (call $myqsort_helper
      (i32.add
        (local.get $sp_r)
        (i32.const 12)  
      )
    )
    ;; after call, get sp_r from return value on stack
    (local.set $sp_r)
    ;; reload left and right and i to local
    (i32.load
      (i32.sub  ;;addr
        (local.get $sp_r)
        (i32.const 4)
      )  
    ) ;; stack: i  
    (i32.load
      (i32.sub  ;;addr
        (local.get $sp_r)
        (i32.const 8)
      )  
    ) ;; stack: i right
    (i32.load
      (i32.sub
        (local.get $sp_r)
        (i32.const 12)
      )
    ) ;; stack: i right, left
    (local.set $left_1)
    (local.set $right_2)
    (local.set $para_i)
    ;; stack: non

    ;; after prepare
    ;; call 2
    ;; put ee-left aka i+1
    (i32.store
      (local.get $sp_r)
      (i32.add
        (local.get $para_i)
        (i32.const 1)
      )
    )
    ;; put ee-right aka right
    (i32.store
      (i32.add
        (local.get $sp_r)
        (i32.const 4)
      )
      (local.get $right_2)
    )
    (call $myqsort_helper
      (i32.add
        (local.get $sp_r)
        (i32.const 12)  
      )
    )
    ;; after call, get sp_r from return value on stack
    (local.set $sp_r)
    (return
      (i32.sub
        (local.get $sp_r)
        (i32.const 12)
      )
    )
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