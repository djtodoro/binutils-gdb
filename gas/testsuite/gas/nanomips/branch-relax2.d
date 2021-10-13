#objdump: -dr --show-raw-insn
#name: nanoMIPS branch relaxation - conditional branch at limit
#as: -mno-minimize-relocs

# Check nanoMIPS 16-bit branch relaxations

.*: +file format .*nanomips.*

Disassembly of section .text:

00000000 <strncpy>:
   0:	b34c      	addu	a2,a0,a2
   2:	10e4      	move	a3,a0

00000004 <\$L2>:
   4:	dbef      	beqc	a2,a3,24 <\$L9>
			4: R_NANOMIPS_PC4_S1	\$L9
   6:	8505 2000 	lbu	a4,0\(a1\)
   a:	90e9      	addiu	a3,a3,1
   c:	90a9      	addiu	a1,a1,1
   e:	a507 88ff 	sb	a4,-1\(a3\)
  12:	a900 0000 	bnezc	a4,4 <\$L2>
			12: R_NANOMIPS_PC14_S1	\$L2
  16:	1800      	bc	1e <\$L3>
			16: R_NANOMIPS_PC10_S1	\$L3

00000018 <\$L4>:
  18:	90e9      	addiu	a3,a3,1
  1a:	a407 88ff 	sb	zero,-1\(a3\)

0000001e <\$L3>:
  1e:	a8c7 0000 	bnec	a3,a2,18 <\$L4>
			1e: R_NANOMIPS_PC14_S1	\$L4
  22:	dbe0      	jrc	ra

00000024 <\$L9>:
  24:	dbe0      	jrc	ra
