#objdump: -dr --show-raw-insn
#name: nanoMIPS 16-bit branch relaxation
#as: -mno-minimize-relocs

# Check nanoMIPS 16-bit branch relaxations

.*: +file format .*nanomips.*

Disassembly of section \.text:
00000000 <test>:
       0:	88a4 0000 	beqc	a0,a1,24 <test1>
			0: R_NANOMIPS_PC14_S1	test1
	\.\.\.

00000024 <test1>:
      24:	2800 0000 	bc	428 <test2>
			24: R_NANOMIPS_PC25_S1	test2

00000028 <test1a>:
	\.\.\.

00000428 <test2>:
     428:	2800 0000 	bc	28 <test1a>
			428: R_NANOMIPS_PC25_S1	test1a

0000042c <test2a>:
     42c:	a885 0000 	bnec	a1,a0,450 <test3>
			42c: R_NANOMIPS_PC14_S1	test3
	\.\.\.

00000450 <test3>:
     450:	88a4 0000 	beqc	a0,a1,428 <test2>
			450: R_NANOMIPS_PC14_S1	test2
	\.\.\.

00000474 <test4>:
     474:	2a00 0000 	balc	878 <test5>
			474: R_NANOMIPS_PC25_S1	test5

00000478 <test4a>:
	\.\.\.

00000878 <test5>:
     878:	2a00 0000 	balc	478 <test4a>
			878: R_NANOMIPS_PC25_S1	test4a
     87c:	8880 0000 	beqzc	a0,900 <test6>
			87c: R_NANOMIPS_PC14_S1	test6

00000880 <test6a>:
	\.\.\.

00000900 <test6>:
     900:	8880 0000 	beqzc	a0,880 <test6a>
			900: R_NANOMIPS_PC14_S1	test6a

00000904 <test7>:
     904:	a880 0000 	bnezc	a0,988 <test8>
			904: R_NANOMIPS_PC14_S1	test8

00000908 <test7a>:
	\.\.\.

00000988 <test8>:
     988:	a880 0000 	bnezc	a0,908 <test7a>
			988: R_NANOMIPS_PC14_S1	test7a

0000098c <test9>:
     98c:	dacf      	beqc	a0,a1,9ac <test10>
			98c: R_NANOMIPS_PC4_S1	test10
	\.\.\.

000009ac <test10>:
     9ac:	1800      	bc	dac <test11>
			9ac: R_NANOMIPS_PC10_S1	test11

000009ae <test10a>:
	\.\.\.

00000dac <test11>:
     dac:	1800      	bc	9ae <test10a>
			dac: R_NANOMIPS_PC10_S1	test10a

00000dae <test12>:
     dae:	3800      	balc	11ae <test13>
			dae: R_NANOMIPS_PC10_S1	test13

00000db0 <test12a>:
	\.\.\.

000011ae <test13>:
    11ae:	3800      	balc	db0 <test12a>
			11ae: R_NANOMIPS_PC10_S1	test12a
    11b0:	9a00      	beqzc	a0,1230 <test15>
			11b0: R_NANOMIPS_PC7_S1	test15

000011b2 <test14>:
	\.\.\.

00001230 <test15>:
    1230:	9a00      	beqzc	a0,11b2 <test14>
			1230: R_NANOMIPS_PC7_S1	test14
    1232:	ba00      	bnezc	a0,12b2 <test17>
			1232: R_NANOMIPS_PC7_S1	test17

00001234 <test16>:
	\.\.\.

000012b2 <test17>:
    12b2:	ba00      	bnezc	a0,1234 <test16>
			12b2: R_NANOMIPS_PC7_S1	test16
    12b4:	88f1 0000 	beqc	s1,a3,12b8 <\$L1>
			12b4: R_NANOMIPS_PC14_S1	\$L1

000012b8 <\$L1>:
    12b8:	88f1 0000 	beqc	s1,a3,12bc <\$L2>
			12b8: R_NANOMIPS_PC14_S1	\$L2

000012bc <\$L2>:
    12bc:	9008      	nop
    12be:	db9f      	beqc	s1,a3,12c2 <\$L3>
			12be: R_NANOMIPS_PC4_S1	\$L3
    12c0:	1f11      	restore.jrc	16,ra

000012c2 <\$L3>:
    12c2:	db9f      	beqc	s1,a3,12c6 <\$L4>
			12c2: R_NANOMIPS_PC4_S1	\$L4
    12c4:	9880      	beqzc	s1,12c2 <\$L3>
			12c4: R_NANOMIPS_PC7_S1	\$L3

000012c6 <\$L4>:
    12c6:	9008      	nop
#pass
