#objdump: -dr
#name: Minimize relocs special case - reduce difference between minimize-relocs enabled/disabled
#as: -mminimize-relocs

# Check reloc minimization special cases

.*: +file format .*nanomips.*

Disassembly of section \.text:

00000000 <test>:
#...
   a:	a8a6 0000 	bnec	a2,a1,2c <\$L2>
			a: R_NANOMIPS_PC14_S1	\$L2
#pass
