void inc()
{
    if (index >= 25)
        index = 0;
    else
        index++;
}

pushq	%rbp
movq	%rsp, %rbp
movl	_ZL5index(%rip), %eax
# if (index <= 25)
cmpl	$24, %eax
jle	.L2
movl	$0, _ZL5index(%rip)
jmp	.L4
.L2:
movl	_ZL5index(%rip), %eax
addl	$1, %eax
movl	%eax, _ZL5index(%rip)
.L4:
nop
popq	%rbp
ret

#12 instructions + ret
#Where either 3 or 2 are skipped based on if-statement
