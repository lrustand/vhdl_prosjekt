int lookup(int x)
{
    return (rotor[(x + index)%26] + 26 - index)%26;
}

pushq	%rbp
movq	%rsp, %rbp
movl	%edi, -4(%rbp)
movl	_ZL5index(%rip), %edx
movl	-4(%rbp), %eax
addl	%eax, %edx
movslq	%edx, %rax
imulq	$1321528399, %rax, %rax
shrq	$32, %rax
sarl	$3, %eax
movl	%edx, %ecx
sarl	$31, %ecx
subl	%ecx, %eax
imull	$26, %eax, %ecx
movl	%edx, %eax
subl	%ecx, %eax
cltq
leaq	0(,%rax,4), %rdx
leaq	_ZL5rotor(%rip), %rax
movl	(%rdx,%rax), %eax
addl	$26, %eax
movl	_ZL5index(%rip), %ecx
subl	%ecx, %eax
movl	%eax, %edx
movslq	%edx, %rax
imulq	$1321528399, %rax, %rax
shrq	$32, %rax
sarl	$3, %eax
movl	%edx, %ecx
sarl	$31, %ecx
subl	%ecx, %eax
imull	$26, %eax, %ecx
movl	%edx, %eax
subl	%ecx, %eax
popq	%rbp
ret

# 35 instruksjoner pluss ret
