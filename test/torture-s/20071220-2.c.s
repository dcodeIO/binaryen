	.text
	.file	"/b/build/slave/linux/build/src/src/work/gcc/gcc/testsuite/gcc.c-torture/execute/20071220-2.c"
	.section	.text.baz,"ax",@progbits
	.hidden	baz
	.globl	baz
	.type	baz,@function
baz:                                    # @baz
	.param  	i32
	.result 	i32
# BB#0:                                 # %entry
	#APP
	#NO_APP
	i32.load	$push0=, 0($0)
	return  	$pop0
.Lfunc_end0:
	.size	baz, .Lfunc_end0-baz

	.section	.text.f1,"ax",@progbits
	.hidden	f1
	.globl	f1
	.type	f1,@function
f1:                                     # @f1
	.result 	i32
# BB#0:                                 # %entry
	i32.call	$discard=, bar
	i32.const	$push0=, 17
	return  	$pop0
.Lfunc_end1:
	.size	f1, .Lfunc_end1-f1

	.section	.text.bar,"ax",@progbits
	.type	bar,@function
bar:                                    # @bar
	.result 	i32
	.local  	i32
# BB#0:                                 # %entry
	i32.const	$push0=, bar.b
	i32.call	$discard=, baz, $pop0
.Ltmp0:                                 # Block address taken
# BB#1:                                 # %addr
	return  	$0
.Lfunc_end2:
	.size	bar, .Lfunc_end2-bar

	.section	.text.f2,"ax",@progbits
	.hidden	f2
	.globl	f2
	.type	f2,@function
f2:                                     # @f2
	.result 	i32
# BB#0:                                 # %entry
	i32.call	$discard=, bar
	i32.const	$push0=, 17
	return  	$pop0
.Lfunc_end3:
	.size	f2, .Lfunc_end3-f2

	.section	.text.main,"ax",@progbits
	.hidden	main
	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
# BB#0:                                 # %entry
	i32.call	$discard=, f1
	i32.call	$discard=, f1
	i32.call	$discard=, f2
	i32.call	$discard=, f2
	i32.const	$push0=, 0
	return  	$pop0
.Lfunc_end4:
	.size	main, .Lfunc_end4-main

	.type	bar.b,@object           # @bar.b
	.section	.data.bar.b,"aw",@progbits
	.align	2
bar.b:
	.int32	.Ltmp0
	.size	bar.b, 4


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits
