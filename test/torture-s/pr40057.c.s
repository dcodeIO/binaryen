	.text
	.file	"/b/build/slave/linux/build/src/src/work/gcc/gcc/testsuite/gcc.c-torture/execute/pr40057.c"
	.section	.text.foo,"ax",@progbits
	.hidden	foo
	.globl	foo
	.type	foo,@function
foo:                                    # @foo
	.param  	i64
	.result 	i32
# BB#0:                                 # %entry
	i32.wrap/i64	$push0=, $0
	i32.const	$push1=, 31
	i32.shr_s	$push2=, $pop0, $pop1
	return  	$pop2
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo

	.section	.text.bar,"ax",@progbits
	.hidden	bar
	.globl	bar
	.type	bar,@function
bar:                                    # @bar
	.param  	i64
	.result 	i32
# BB#0:                                 # %entry
	i32.wrap/i64	$push0=, $0
	i32.const	$push1=, 31
	i32.shr_s	$push2=, $pop0, $pop1
	return  	$pop2
.Lfunc_end1:
	.size	bar, .Lfunc_end1-bar

	.section	.text.main,"ax",@progbits
	.hidden	main
	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
	.local  	i64, i64
# BB#0:                                 # %entry
	i64.const	$0=, 6042589866
	block   	.LBB2_8
	i32.call	$push0=, foo, $0
	br_if   	$pop0, .LBB2_8
# BB#1:                                 # %if.end
	i64.const	$1=, 6579460778
	block   	.LBB2_7
	i32.call	$push1=, foo, $1
	i32.const	$push5=, 0
	i32.eq  	$push6=, $pop1, $pop5
	br_if   	$pop6, .LBB2_7
# BB#2:                                 # %if.end4
	block   	.LBB2_6
	i32.call	$push2=, bar, $0
	br_if   	$pop2, .LBB2_6
# BB#3:                                 # %if.end8
	block   	.LBB2_5
	i32.call	$push3=, bar, $1
	i32.const	$push7=, 0
	i32.eq  	$push8=, $pop3, $pop7
	br_if   	$pop8, .LBB2_5
# BB#4:                                 # %if.end12
	i32.const	$push4=, 0
	return  	$pop4
.LBB2_5:                                # %if.then11
	call    	abort
	unreachable
.LBB2_6:                                # %if.then7
	call    	abort
	unreachable
.LBB2_7:                                # %if.then3
	call    	abort
	unreachable
.LBB2_8:                                # %if.then
	call    	abort
	unreachable
.Lfunc_end2:
	.size	main, .Lfunc_end2-main


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits
