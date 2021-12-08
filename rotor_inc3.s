	.file	"rotor_inc.cpp"
 # GNU C++14 (MinGW.org GCC Build-20200227-1) version 9.2.0 (mingw32)
 #	compiled by GNU C version 9.2.0, GMP version 6.1.2, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.21-GMP

 # warning: GMP header version 6.1.2 differs from library version 6.2.1.
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed:  -iprefix c:\mingw\bin\../lib/gcc/mingw32/9.2.0/
 # rotor_inc.cpp -mtune=generic -march=i586 -fverbose-asm
 # options enabled:  -faggressive-loop-optimizations -fassume-phsa
 # -fasynchronous-unwind-tables -fauto-inc-dec -fcommon
 # -fdelete-null-pointer-checks -fdwarf2-cfi-asm -fearly-inlining
 # -feliminate-unused-debug-types -fexceptions -ffp-int-builtin-inexact
 # -ffunction-cse -fgcse-lm -fgnu-runtime -fgnu-unique -fident
 # -finline-atomics -fipa-stack-alignment -fira-hoist-pressure
 # -fira-share-save-slots -fira-share-spill-slots -fivopts
 # -fkeep-inline-dllexport -fkeep-static-consts -fleading-underscore
 # -flifetime-dse -flto-odr-type-merging -fmath-errno -fmerge-debug-strings
 # -fpeephole -fplt -fprefetch-loop-arrays -freg-struct-return
 # -fsched-critical-path-heuristic -fsched-dep-count-heuristic
 # -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
 # -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
 # -fsched-stalled-insns-dep -fschedule-fusion -fsemantic-interposition
 # -fset-stack-executable -fshow-column -fshrink-wrap-separate
 # -fsigned-zeros -fsplit-ivs-in-unroller -fssa-backprop -fstdarg-opt
 # -fstrict-volatile-bitfields -fsync-libcalls -ftrapping-math
 # -ftree-cselim -ftree-forwprop -ftree-loop-if-convert -ftree-loop-im
 # -ftree-loop-ivcanon -ftree-loop-optimize -ftree-parallelize-loops=
 # -ftree-phiprop -ftree-reassoc -ftree-scev-cprop -funit-at-a-time
 # -funwind-tables -fverbose-asm -fzero-initialized-in-bss -m32 -m80387
 # -m96bit-long-double -maccumulate-outgoing-args -malign-double
 # -malign-stringops -mavx256-split-unaligned-load
 # -mavx256-split-unaligned-store -mfancy-math-387 -mfp-ret-in-387
 # -mieee-fp -mlong-double-80 -mms-bitfields -mno-red-zone -mno-sse4
 # -mpush-args -msahf -mstack-arg-probe -mstv -mvzeroupper

	.text
	.globl	__Z6rotatePi
	.def	__Z6rotatePi;	.scl	2;	.type	32;	.endef
__Z6rotatePi:
LFB0:
	.cfi_startproc
	pushl	%ebp	 #
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp	 #,
	.cfi_def_cfa_register 5
	subl	$16, %esp	 #,
 # rotor_inc.cpp:4:     int first = arr[LETTERS - 1];
	movl	8(%ebp), %eax	 # arr, tmp98
	movl	100(%eax), %eax	 # MEM[(int *)arr_22(D) + 100B], tmp99
	movl	%eax, -8(%ebp)	 # tmp99, first
 # rotor_inc.cpp:6:     for(int i = 0; i < LETTERS - 1; i++)
	movl	$0, -4(%ebp)	 #, i
L5:
 # rotor_inc.cpp:6:     for(int i = 0; i < LETTERS - 1; i++)
	cmpl	$24, -4(%ebp)	 #, i
	jg	L2	 #,
 # rotor_inc.cpp:8:         int next = arr[i + 1];
	movl	-4(%ebp), %eax	 # i, i.0_1
	addl	$1, %eax	 #, _2
	leal	0(,%eax,4), %edx	 #, _3
	movl	8(%ebp), %eax	 # arr, tmp100
	addl	%edx, %eax	 # _3, _4
 # rotor_inc.cpp:8:         int next = arr[i + 1];
	movl	(%eax), %eax	 # *_4, tmp101
	movl	%eax, -12(%ebp)	 # tmp101, next
 # rotor_inc.cpp:10:         if(next > 0)
	cmpl	$0, -12(%ebp)	 #, next
	jle	L3	 #,
 # rotor_inc.cpp:12:             arr[i] = next - 1;
	movl	-4(%ebp), %eax	 # i, i.1_5
 # rotor_inc.cpp:12:             arr[i] = next - 1;
	leal	0(,%eax,4), %edx	 #, _6
	movl	8(%ebp), %eax	 # arr, tmp102
	addl	%edx, %eax	 # _6, _7
 # rotor_inc.cpp:12:             arr[i] = next - 1;
	movl	-12(%ebp), %edx	 # next, tmp103
	subl	$1, %edx	 #, _8
 # rotor_inc.cpp:12:             arr[i] = next - 1;
	movl	%edx, (%eax)	 # _8, *_7
	jmp	L4	 #
L3:
 # rotor_inc.cpp:16:             arr[i] = LETTERS - 1;
	movl	-4(%ebp), %eax	 # i, i.2_9
 # rotor_inc.cpp:16:             arr[i] = LETTERS - 1;
	leal	0(,%eax,4), %edx	 #, _10
	movl	8(%ebp), %eax	 # arr, tmp104
	addl	%edx, %eax	 # _10, _11
 # rotor_inc.cpp:16:             arr[i] = LETTERS - 1;
	movl	$25, (%eax)	 #, *_11
L4:
 # rotor_inc.cpp:6:     for(int i = 0; i < LETTERS - 1; i++)
	addl	$1, -4(%ebp)	 #, i
	jmp	L5	 #
L2:
 # rotor_inc.cpp:20:     if(first > 0)
	cmpl	$0, -8(%ebp)	 #, first
	jle	L6	 #,
 # rotor_inc.cpp:22:         arr[LETTERS - 1] = arr[LETTERS - 1] - 1;
	movl	8(%ebp), %eax	 # arr, tmp105
	addl	$100, %eax	 #, _12
	movl	(%eax), %edx	 # *_12, _13
 # rotor_inc.cpp:22:         arr[LETTERS - 1] = arr[LETTERS - 1] - 1;
	movl	8(%ebp), %eax	 # arr, tmp106
	addl	$100, %eax	 #, _14
 # rotor_inc.cpp:22:         arr[LETTERS - 1] = arr[LETTERS - 1] - 1;
	subl	$1, %edx	 #, _15
 # rotor_inc.cpp:22:         arr[LETTERS - 1] = arr[LETTERS - 1] - 1;
	movl	%edx, (%eax)	 # _15, *_14
 # rotor_inc.cpp:28: }
	jmp	L8	 #
L6:
 # rotor_inc.cpp:26:         arr[LETTERS - 1] = LETTERS - 1;
	movl	8(%ebp), %eax	 # arr, tmp107
	addl	$100, %eax	 #, _16
 # rotor_inc.cpp:26:         arr[LETTERS - 1] = LETTERS - 1;
	movl	$25, (%eax)	 #, *_16
L8:
 # rotor_inc.cpp:28: }
	nop	
	leave	
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret	
	.cfi_endproc
LFE0:
	.ident	"GCC: (MinGW.org GCC Build-20200227-1) 9.2.0"
