void inc()
{
    index++;
    index %= 26;
}

pushq	%rbp
movq	%rsp, %rbp
movl	_ZL5index(%rip), %eax
addl	$1, %eax
movl	%eax, _ZL5index(%rip)
movl	_ZL5index(%rip), %edx
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
movl	%eax, _ZL5index(%rip)
nop
popq	%rbp
ret


#19 instruksjoner + ret
