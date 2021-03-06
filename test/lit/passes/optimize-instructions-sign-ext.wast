;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s --optimize-instructions --enable-sign-ext -S -o - | filecheck %s

(module
  ;; CHECK:      (func $duplicate-elimination (param $x i32) (param $y i32) (param $z i32) (param $w f64)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.extend8_s
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.extend16_s
  ;; CHECK-NEXT:    (local.get $x)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $duplicate-elimination (param $x i32) (param $y i32) (param $z i32) (param $w f64)
    (drop (i32.extend8_s (i32.extend8_s (local.get $x))))
    (drop (i32.extend16_s (i32.extend16_s (local.get $x))))
  )
)
