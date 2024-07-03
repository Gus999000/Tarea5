	.file	"ackermann.c"
	.text
	.globl	ackermann
	.type	ackermann, @function
ackermann:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	jmp	.L3
.L2:
	cmpl	$0, -8(%rbp)
	jne	.L4
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	ackermann
	jmp	.L3
.L4:
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	ackermann
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	ackermann
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	ackermann, .-ackermann
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
