	.text
	.file	"/b/build/slave/linux/build/src/src/work/gcc/gcc/testsuite/gcc.c-torture/execute/pr35456.c"
	.section	.text.not_fabs,"ax",@progbits
	.hidden	not_fabs
	.globl	not_fabs
	.type	not_fabs,@function
not_fabs:                               # @not_fabs
	.param  	f64
	.result 	f64
# BB#0:                                 # %entry
	f64.const	$push0=, 0x0p0
	f64.ge  	$push1=, $0, $pop0
	f64.neg 	$push2=, $0
	f64.select	$push3=, $pop1, $0, $pop2
	return  	$pop3
.Lfunc_end0:
	.size	not_fabs, .Lfunc_end0-not_fabs

	.section	.text.main,"ax",@progbits
	.hidden	main
	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
# BB#0:                                 # %entry
	block   	.LBB1_2
	f64.const	$push0=, -0x0p0
	f64.call	$push1=, not_fabs, $pop0
	i64.reinterpret/f64	$push2=, $pop1
	i64.const	$push3=, 0
	i64.ge_s	$push4=, $pop2, $pop3
	br_if   	$pop4, .LBB1_2
# BB#1:                                 # %if.end
	i32.const	$push5=, 0
	return  	$pop5
.LBB1_2:                                # %if.then
	call    	abort
	unreachable
.Lfunc_end1:
	.size	main, .Lfunc_end1-main


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits
