	.text
	.file	"/b/build/slave/linux/build/src/src/work/gcc/gcc/testsuite/gcc.c-torture/execute/20101011-1.c"
	.section	.text.sigfpe,"ax",@progbits
	.hidden	sigfpe
	.globl	sigfpe
	.type	sigfpe,@function
sigfpe:                                 # @sigfpe
	.param  	i32
# BB#0:                                 # %entry
	i32.const	$push0=, 0
	call    	exit, $pop0
	unreachable
.Lfunc_end0:
	.size	sigfpe, .Lfunc_end0-sigfpe

	.section	.text.main,"ax",@progbits
	.hidden	main
	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
# BB#0:                                 # %entry
	i32.const	$push1=, 8
	i32.const	$push0=, sigfpe
	i32.call	$discard=, signal, $pop1, $pop0
	call    	abort
	unreachable
.Lfunc_end1:
	.size	main, .Lfunc_end1-main

	.hidden	k                       # @k
	.type	k,@object
	.section	.bss.k,"aw",@nobits
	.globl	k
	.align	2
k:
	.int32	0                       # 0x0
	.size	k, 4


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits
