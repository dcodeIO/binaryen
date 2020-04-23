;; Regression test for 'std::move'-related issues in ExpressionRunner during precompute-propagate
;; see: https://github.com/WebAssembly/binaryen/issues/2788
(module
 (func $test (param $0 anyref) (result v128 anyref i64)
  (local $1 v128)
  (local $2 anyref)
  (local $3 anyref)
  (local $4 anyref)
  (local $5 anyref)
  (local $6 (v128 anyref i64))
  (local $7 anyref)
  (local $8 v128)
  (tuple.make
   (block $label$1 (result v128)
    (drop
     (block $label$2 (result anyref)
      (local.set $1
       (block $label$3 (result v128)
        (drop
         (block $label$4 (result anyref)
          (drop
           (block $label$5 (result v128)
            (drop
             (block $label$6 (result anyref)
              (drop
               (block $label$7 (result v128)
                (drop
                 (block $label$8 (result anyref)
                  (drop
                   (block $label$9 (result v128)
                    (drop
                     (block $label$10 (result anyref)
                      (drop
                       (block $label$11 (result v128)
                        (drop
                         (block $label$12 (result anyref)
                          (drop
                           (block $label$13 (result anyref)
                            (drop
                             (block $label$14 (result v128)
                              (drop
                               (block $label$15 (result anyref)
                                (drop
                                 (block $label$16 (result v128)
                                  (drop
                                   (block $label$17 (result anyref)
                                    (drop
                                     (block $label$18 (result v128)
                                      (drop
                                       (block $label$19 (result anyref)
                                        (drop
                                         (block $label$20 (result anyref)
                                          (drop
                                           (block $label$21 (result v128)
                                            (drop
                                             (block $label$22 (result anyref)
                                              (drop
                                               (block $label$23 (result v128)
                                                (drop
                                                 (block $label$24 (result anyref)
                                                  (local.set $6
                                                   (block $label$25 (result v128 anyref i64)
                                                    (tuple.make
                                                     (v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000)
                                                     (ref.null)
                                                     (i64.const 0)
                                                    )
                                                   )
                                                  )
                                                  (drop
                                                   (block (result v128)
                                                    (local.set $8
                                                     (tuple.extract 0
                                                      (local.get $6)
                                                     )
                                                    )
                                                    (drop
                                                     (block (result anyref)
                                                      (local.set $7
                                                       (tuple.extract 1
                                                        (local.get $6)
                                                       )
                                                      )
                                                      (local.get $7)
                                                     )
                                                    )
                                                    (local.get $8)
                                                   )
                                                  )
                                                  (local.get $2)
                                                 )
                                                )
                                                (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                                               )
                                              )
                                              (local.get $3)
                                             )
                                            )
                                            (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                                           )
                                          )
                                          (local.get $4)
                                         )
                                        )
                                        (ref.null)
                                       )
                                      )
                                      (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                                     )
                                    )
                                    (local.get $0)
                                   )
                                  )
                                  (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                                 )
                                )
                                (local.get $5)
                               )
                              )
                              (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                             )
                            )
                            (local.get $0)
                           )
                          )
                          (ref.null)
                         )
                        )
                        (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                       )
                      )
                      (block $label$26 (result anyref)
                       (block $label$27 (result anyref)
                        (local.get $0)
                       )
                      )
                     )
                    )
                    (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
                   )
                  )
                  (local.get $0)
                 )
                )
                (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
               )
              )
              (local.get $0)
             )
            )
            (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
           )
          )
          (local.get $0)
         )
        )
        (block $label$28 (result v128)
         (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
        )
       )
      )
      (local.get $0)
     )
    )
    (v128.const i32x4 0x00000001 0x00000000 0x00000000 0x00000000)
   )
   (local.get $0)
   (i64.const 1)
  )
 )
)
