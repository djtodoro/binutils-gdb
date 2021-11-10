	.linkrelax
	.module	pcrel
	.text
	.align	1
	.globl	test
	.ent	test
	.type	test, @function
test:
	lapc.h	$a3,g_var
	lw	$a2,132($a3)
	lhu	$a2,0($a2)
	bnec	$a2,$a1,$L2
	sw	$a0,136($a3)
$L3:
	lw	$a1,136($a3)
	li	$a2,-1			# 0xffffffffffffffff
	bnec	$a1,$a2,$L5
	li	$a2,1			# 0x1
	sb	$a2,148($a3)
	lbu	$a2,149($a3)
	addiu	$a2,$a2,1
	sb	$a2,149($a3)
$L5:
	jrc	$ra
$L2:
	li	$a2,-1			# 0xffffffffffffffff
	sw	$a2,136($a3)
	bc	$L3
	.set	macro
	.set	reorder
	.end	test
	.size	test, .-test
