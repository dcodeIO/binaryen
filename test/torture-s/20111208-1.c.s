	.text
	.file	"/b/build/slave/linux/build/src/src/work/gcc/gcc/testsuite/gcc.c-torture/execute/20111208-1.c"
	.section	.text.pack_unpack,"ax",@progbits
	.hidden	pack_unpack
	.globl	pack_unpack
	.type	pack_unpack,@function
pack_unpack:                            # @pack_unpack
	.param  	i32, i32
	.result 	i32
	.local  	i32, i32, i32, i32, i32, i32, i32, i32, i32
# BB#0:                                 # %entry
	i32.const	$5=, __stack_pointer
	i32.load	$5=, 0($5)
	i32.const	$6=, 16
	i32.sub 	$8=, $5, $6
	i32.const	$6=, __stack_pointer
	i32.store	$8=, 0($6), $8
	i32.call	$push0=, strlen, $1
	i32.add 	$2=, $1, $pop0
.LBB0_1:                                # %while.cond.outer
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_2 Depth 2
	loop    	.LBB0_7
	copy_local	$4=, $1
.LBB0_2:                                # %while.cond
                                        #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	block   	.LBB0_6
	loop    	.LBB0_5
	i32.ge_u	$push1=, $4, $2
	br_if   	$pop1, .LBB0_7
# BB#3:                                 # %while.body
                                        #   in Loop: Header=BB0_2 Depth=2
	i32.load8_s	$3=, 0($4)
	i32.const	$push3=, 1
	i32.add 	$1=, $4, $pop3
	i32.const	$push4=, 108
	i32.eq  	$push5=, $3, $pop4
	br_if   	$pop5, .LBB0_6
# BB#4:                                 # %while.body
                                        #   in Loop: Header=BB0_2 Depth=2
	copy_local	$4=, $1
	i32.const	$push6=, 115
	i32.ne  	$push7=, $3, $pop6
	br_if   	$pop7, .LBB0_2
.LBB0_5:                                # %sw.bb4
                                        #   in Loop: Header=BB0_1 Depth=1
	i32.const	$4=, 2
	i32.const	$9=, 8
	i32.add 	$9=, $8, $9
	i32.call	$discard=, memcpy, $9, $0, $4
	i32.add 	$0=, $0, $4
	i32.load16_s	$push9=, 8($8)
	call    	do_something, $pop9
	br      	.LBB0_1
.LBB0_6:                                # %sw.bb8
                                        #   in Loop: Header=BB0_1 Depth=1
	i32.const	$4=, 4
	i32.const	$8=, 0
	i32.add 	$8=, $8, $8
	i32.call	$discard=, memcpy, $8, $0, $4
	i32.add 	$0=, $0, $4
	i32.load	$push8=, 0($8)
	call    	do_something, $pop8
	br      	.LBB0_1
.LBB0_7:                                # %while.end
	i32.load8_s	$push2=, 0($0)
	i32.const	$7=, 16
	i32.add 	$8=, $8, $7
	i32.const	$7=, __stack_pointer
	i32.store	$8=, 0($7), $8
	return  	$pop2
.Lfunc_end0:
	.size	pack_unpack, .Lfunc_end0-pack_unpack

	.section	.text.do_something,"ax",@progbits
	.type	do_something,@function
do_something:                           # @do_something
	.param  	i32
# BB#0:                                 # %entry
	i32.const	$push0=, 0
	i32.store	$discard=, a($pop0), $0
	return
.Lfunc_end1:
	.size	do_something, .Lfunc_end1-do_something

	.section	.text.main,"ax",@progbits
	.hidden	main
	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
# BB#0:                                 # %entry
	block   	.LBB2_2
	i32.const	$push1=, .L.str
	i32.const	$push0=, .L.str.1
	i32.call	$push2=, pack_unpack, $pop1, $pop0
	br_if   	$pop2, .LBB2_2
# BB#1:                                 # %if.end
	i32.const	$push3=, 0
	return  	$pop3
.LBB2_2:                                # %if.then
	call    	abort
	unreachable
.Lfunc_end2:
	.size	main, .Lfunc_end2-main

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\200\001\377\376\035\300"
	.size	.L.str, 7

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"sl"
	.size	.L.str.1, 3

	.hidden	a                       # @a
	.type	a,@object
	.section	.bss.a,"aw",@nobits
	.globl	a
	.align	2
a:
	.int32	0                       # 0x0
	.size	a, 4


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits
