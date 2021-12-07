pushq	%rbp
movq	%rsp, %rbp
movl	%edi, -4(%rbp)
movl	-4(%rbp), %eax
cltq
leaq	0(,%rax,4), %rdx
leaq	reflector(%rip), %rax
movl	(%rdx,%rax), %eax
popq	%rbp
ret

# 9 instructions plus ret
