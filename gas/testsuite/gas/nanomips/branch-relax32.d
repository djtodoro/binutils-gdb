#objdump: -dr --show-raw-insn
#name: nanoMIPS 16-bit branch relaxation inhibited by insn32
#as: -minsn32 --defsym insn32= -mno-minimize-relocs
#source: branch-relax.s

# Check nanoMIPS 16-bit branch relaxations inhibited by insn32

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
     98c:	88a4 0000 	beqc	a0,a1,9ae <test10>
			98c: R_NANOMIPS_PC14_S1	test10
	\.\.\.

000009ae <test10>:
     9ae:	2800 0000 	bc	db0 <test11>
			9ae: R_NANOMIPS_PC25_S1	test11

000009b2 <test10a>:
	\.\.\.

00000db0 <test11>:
     db0:	2800 0000 	bc	9b2 <test10a>
			db0: R_NANOMIPS_PC25_S1	test10a

00000db4 <test12>:
     db4:	2a00 0000 	balc	11b6 <test13>
			db4: R_NANOMIPS_PC25_S1	test13

00000db8 <test12a>:
	\.\.\.

000011b6 <test13>:
    11b6:	2a00 0000 	balc	db8 <test12a>
			11b6: R_NANOMIPS_PC25_S1	test12a
    11ba:	8880 0000 	beqzc	a0,123c <test15>
			11ba: R_NANOMIPS_PC14_S1	test15

000011be <test14>:
	\.\.\.

0000123c <test15>:
    123c:	8880 0000 	beqzc	a0,11be <test14>
			123c: R_NANOMIPS_PC14_S1	test14
    1240:	a880 0000 	bnezc	a0,12c2 <test17>
			1240: R_NANOMIPS_PC14_S1	test17

00001244 <test16>:
	\.\.\.

000012c2 <test17>:
    12c2:	a880 0000 	bnezc	a0,1244 <test16>
			12c2: R_NANOMIPS_PC14_S1	test16
    12c6:	88f1 0000 	beqc	s1,a3,12ca <\$L1>
			12c6: R_NANOMIPS_PC14_S1	\$L1

000012ca <\$L1>:
    12ca:	88f1 0000 	beqc	s1,a3,12ce <\$L2>
			12ca: R_NANOMIPS_PC14_S1	\$L2

000012ce <\$L2>:
    12ce:	8000 c000 	nop
    12d2:	88f1 0000 	beqc	s1,a3,12da <\$L3>
			12d2: R_NANOMIPS_PC14_S1	\$L3
    12d6:	83e1 3013 	restore.jrc	16,ra

000012da <\$L3>:
    12da:	88f1 0000 	beqc	s1,a3,12e2 <\$L4>
			12da: R_NANOMIPS_PC14_S1	\$L4
    12de:	8a20 0000 	beqzc	s1,12da <\$L3>
			12de: R_NANOMIPS_PC14_S1	\$L3

000012e2 <\$L4>:
    12e2:	9008      	nop
#pass
