	.linkrelax
	.text
	.align	1
	.globl	strncpy
	.ent	strncpy
	.type	strncpy, @function
strncpy:
	addu	$a2,$a0,$a2
	move	$a3,$a0
$L2:
	beqc	$a3,$a2,$L9
	lbu	$a4,0($a1)
	addiu	$a3,$a3,1
	addiu	$a1,$a1,1
	sb	$a4,-1($a3)
	bnezc	$a4,$L2
	bc	$L3
$L4:
	addiu	$a3,$a3,1
	sb	$zero,-1($a3)
$L3:
	bnec	$a3,$a2,$L4
	jrc	$ra
$L9:
	jrc	$ra
	.end	strncpy
$LFE0:
	.size	strncpy, .-strncpy
