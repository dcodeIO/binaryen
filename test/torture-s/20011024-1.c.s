	.text
	.file	"/b/build/slave/linux/build/src/src/work/gcc/gcc/testsuite/gcc.c-torture/execute/20011024-1.c"
	.section	.text.main,"ax",@progbits
	.hidden	main
	.globl	main
	.type	main,@function
main:                                   # @main
	.result 	i32
	.local  	i32, i32
# BB#0:                                 # %entry
	i32.const	$0=, 0
	i32.const	$1=, buf
	block   	.LBB0_2
	i32.const	$push0=, 6513249
	i32.store	$discard=, buf($0), $pop0
	i32.const	$push1=, .L.str
	i32.call	$push2=, strcmp, $1, $pop1
	br_if   	$pop2, .LBB0_2
# BB#1:                                 # %foo.exit
	i32.const	$push3=, .L.str.1
	i32.const	$push4=, 9
	call    	memcpy, $1, $pop3, $pop4
	return  	$0
.LBB0_2:                                # %if.then1.i
	call    	abort
	unreachable
.Lfunc_end0:
	.size	main, .Lfunc_end0-main

	.hidden	buf                     # @buf
	.type	buf,@object
	.section	.bss.buf,"aw",@nobits
	.globl	buf
	.align	4
buf:
	.skip	50
	.size	buf, 50

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"abc"
	.size	.L.str, 4

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"abcdefgh"
	.size	.L.str.1, 9


	.ident	"clang version 3.8.0 "
	.section	".note.GNU-stack","",@progbits
