pushq	%rbp
movq	%rsp, %rbp
movl	%edi, -20(%rbp)
movl	_ZL5index(%rip), %edx
movl	-20(%rbp), %eax
addl	%edx, %eax
movl	%eax, -8(%rbp)
# rotor.cpp:41:     if (rotated_index >= 26)
cmpl	$25, -8(%rbp)
jle	.L3
subl	$26, -8(%rbp)
.L3:
movl	-8(%rbp), %eax
cltq
leaq	0(,%rax,4), %rdx
leaq	_ZL5rotor(%rip), %rax
movl	(%rdx,%rax), %eax
movl	_ZL5index(%rip), %edx
subl	%edx, %eax
movl	%eax, -4(%rbp)
# rotor.cpp:45:     if (character < 0)
cmpl	$0, -4(%rbp)
jns	.L4
addl	$26, -4(%rbp)
.L4:
movl	-4(%rbp), %eax
popq	%rbp
ret

# 23 instruksjoner pluss ret
# Hvorav 0, 1 eller 2 hoppes over
