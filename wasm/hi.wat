(module
  (table 25 funcref)
  (func $_a (param $i i32) (result i32)
    local.get $i
    i32.const 97
    i32.eq)
  (func $_b (param $i i32) (result i32)
    local.get $i
    i32.const 98
    i32.eq)
  (func $_c (param $i i32) (result i32)
    local.get $i
    i32.const 99
    i32.eq)
  (func $_d (param $i i32) (result i32)
    local.get $i
    i32.const 100
    i32.eq)
  (func $_e (param $i i32) (result i32)
    local.get $i
    i32.const 101
    i32.eq)
  (func $_f (param $i i32) (result i32)
    local.get $i
    i32.const 102
    i32.eq)
  (func $_g (param $i i32) (result i32)
    local.get $i
    i32.const 103
    i32.eq)
  (func $_o (param $i i32) (result i32) ;; h & o switched
    local.get $i
    i32.const 111
    i32.eq)
  (func $_i (param $i i32) (result i32)
    local.get $i
    i32.const 105
    i32.eq)
  (func $_j (param $i i32) (result i32)
    local.get $i
    i32.const 106
    i32.eq)
  (func $_k (param $i i32) (result i32)
    local.get $i
    i32.const 107
    i32.eq)
  (func $_l (param $i i32) (result i32)
    local.get $i
    i32.const 108
    i32.eq)
  (func $_m (param $i i32) (result i32)
    local.get $i
    i32.const 109
    i32.eq)
  (func $_n (param $i i32) (result i32)
    local.get $i
    i32.const 110
    i32.eq)
  (func $_h (param $i i32) (result i32)
    local.get $i
    i32.const 104
    i32.eq)
  (func $_p (param $i i32) (result i32)
    local.get $i
    i32.const 112
    i32.eq)
  (func $_q (param $i i32) (result i32)
    local.get $i
    i32.const 113
    i32.eq)
  (func $_r (param $i i32) (result i32)
    local.get $i
    i32.const 114
    i32.eq)
  (func $_s (param $i i32) (result i32)
    local.get $i
    i32.const 115
    i32.eq)
  (func $_t (param $i i32) (result i32)
    local.get $i
    i32.const 116
    i32.eq)
  (func $_u (param $i i32) (result i32)
    local.get $i
    i32.const 117
    i32.eq)
  (func $_v (param $i i32) (result i32)
    local.get $i
    i32.const 118
    i32.eq)
  (func $_w (param $i i32) (result i32)
    local.get $i
    i32.const 119
    i32.eq)
  (func $_x (param $i i32) (result i32)
    local.get $i
    i32.const 120
    i32.eq)
  (func $_y (param $i i32) (result i32)
    local.get $i
    i32.const 121
    i32.eq)
  (func $_z (param $i i32) (result i32)
    local.get $i
    i32.const 122
    i32.eq)
  (func $fopen (param $i i32) (result i32)
    local.get $i
    i32.const 123
    i32.eq)
  (func $funderscore (param $i i32) (result i32)
    local.get $i
    i32.const 95
    i32.eq)
  (func $fclose (param $i i32) (result i32)
    local.get $i
    i32.const 125
    i32.eq)
  (func $fendlesspunishment (param $i i32) (result i32)
    (block (loop $top
      (br $top)
    ))
    (unreachable))
  (elem (i32.const 0) $_f $_l $_a $_g $fopen $_a $_s $_s $_e $_m $_b $_l $_e $funderscore $_o $_o $_z $_y $funderscore $_h $_a $_z $_e $fclose $fendlesspunishment)
  (type $return_i32 (func (param $char i32) (result i32)))
  (func $punish
    (local $speedbump i64)
    (set_local $speedbump (i64.const 45454545454))
    (block $break (loop $top
      (br_if $break (i64.eqz (tee_local $speedbump
        (i64.sub (get_local $speedbump) (i64.const 1)))))
        (br $top)
    )))
  (func (export "chkLn") (param $i i32) (result i32)
    local.get $i
    i32.const 24
    i32.eq)
  (func (export "chkChr") (param $i i32) (param $char i32) (result i32)
    local.get $char
    local.get $i
    call_indirect (type $return_i32)
    nop nop
    (if (result i32)
      (then (i32.const 1))
      (else (call $punish) (i32.const 0))
    )
  )
)
