	.text
	.align	3
	.ent	test
	.globl	test
	.globl	test4a
	/* expand to 16-bit  */
test:
	beqc	$a0, $a1, test1 /* forward, expand to 32-bit  */
	.space	(1<<5)
test1:
	bc	test2	/* forward, expand to 32-bit  */
test1a:
	.space	(1<<10)
test2:
	bc	test1a	/* backward, expand to 32-bit  */
test2a:
	bnec	$a1, $a0, test3 /* forward, expand to 32-bit  */
	.space	(1<<5)
test3:
	beqc	$a0, $a1, test2 /* backward, expand to 32-bit  */
	.space	(1<<5)
test4:
	balc	test5 /* forward, expand to 32-bit  */
test4a:
	.space	(1<<10)
	.end	test
	.ent	test5
	.globl	test5
	.globl	test5a
test5:
	balc	test4a /* backward, expand to 32-bit  */
	beqzc	$a0, test6 /* forward, expand to 32-bit  */
test6a:
	.space	(1<<7)
test6:
	beqzc	$a0, test6a /* backward, expand to 32-bit  */
test7:
	bnezc	$a0, test8 /* forward, expand to 32-bit  */
test7a:
	.space	(1<<7)
test8:
	bnezc	$a0, test7a /* backward, expand to 32-bit  */

test9:
	beqc	$a0, $a1, test10 /* forward, relax to 16-bit  */
	.space	(1<<5)-2
test10:
	bc	test11	/* forward, relax to 16-bit  */
test10a:
	.space	(1<<10)-2
test11:
	bc	test10a	/* backward, relax to 16-bit  */
	.globl	test12a
	.globl	test13
test12:
	balc	test13		/* backward, relax to 16-bit  */
test12a:
	.space	(1<<10)-2
test13:
	balc	test12a	/* backward, relax to 16-bit  */

	beqzc	$a0, test15	/* forward, relax to 16-bit  */
test14:
	.space	(1<<7)-2
test15:
	beqzc	$a0, test14	/* backward, relax to 16-bit  */
	bnezc	$a0, test17	/* forward, relax to 16-bit  */
test16:
	.space	(1<<7)-2
test17:
	bnezc	$a0, test16	/* backward, relax to 16-bit  */

	beqc	$s1, $a3, $L1	/* unreachable forward, relax.  */
$L1:
	beqc	$s1, $a3, $L2	/* unreachable forward, relax.  */
$L2:
	nop
	beqc	$s1, $a3, $L3	/* reachable forward, no relax.  */
	restore.jrc	16, $ra
$L3:
	beqc	$s1, $a3, $L4	/* reachable forward, no relax.  */
	beqzc	$s1, $L3
$L4:
	.half 0x9008

	.end test5
