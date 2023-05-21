	.text
	.linkrelax
	.module	softfloat
	.module	pcrel
	.file	"bug65.c"
	.section	.custom,"ax",@progbits
	.globl	foo
	.p2align	1
	.type	foo,@function
	.ent	foo
foo:
	.frame	$sp,16,$ra
	addiu	$sp, $sp, -16
	addiu	$sp, $sp, 16
	balc baz
	jrc	$ra
	.end	foo
.Lfunc_end0:
	.size	foo, .Lfunc_end0-foo

	.globl	bar
	.p2align	1
	.type	bar,@function
	.ent	bar
bar:
	.frame	$sp,16,$ra
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	.align 2
1:
	balc[16]	baz
	lw	$ra, 12($sp)
	addiu	$sp, $sp, 16
	jrc	$ra
	.end	bar
.Lfunc_end1:
	.size	bar, .Lfunc_end1-bar

	.globl	frob
	.p2align	2
	.type	frob,@function
	.ent	frob
frob:
	.frame	$sp,16,$ra
	addiu	$sp, $sp, -16
	sw	$ra, 12($sp)
	.reloc 1f,R_NANOMIPS_JALR32,frob
1:
	balc[32]	baz
	lw	$ra, 12($sp)
	addiu	$sp, $sp, 16
	jrc	$ra
	.end	frob
.Lfunc_end2:
