;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s -all --name-types -S -o - | filecheck %s

(module
 (type $obnoxious-super-long-type-name_____________________________1 (struct))
 ;; CHECK:      (func $foo (param $x (ref $type$1))
 ;; CHECK-NEXT:  (nop)
 ;; CHECK-NEXT: )
 (func $foo
  (param $x (ref $obnoxious-super-long-type-name_____________________________1))
 )
)
