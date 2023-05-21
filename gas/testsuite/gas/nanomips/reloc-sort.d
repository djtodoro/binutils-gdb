#readelf: -Wr
#name: Relocations sort order

# Check correct relocations of relaxed compressed jumptables.

Relocation section '\.rela\.custom' at offset 0x[0-9a-f]+ contains 8 entries:
 Offset     Info    Type                Sym. Value  Symbol's Name \+ Addend
00000008  00000a0d R_NANOMIPS_PC25_S1     00000000   baz \+ 0
00000014  00000a11 R_NANOMIPS_PC10_S1     00000000   baz \+ 0
00000014  00000640 R_NANOMIPS_ALIGN       00000002   __reloc_align_\^B_1 \+ 0
00000014  00000044 R_NANOMIPS_FIXED                  0
0000001e  00000740 R_NANOMIPS_ALIGN       00000002   __reloc_align_\^B_2 \+ 0
00000026  00000a0d R_NANOMIPS_PC25_S1     00000000   baz \+ 0
00000026  00000044 R_NANOMIPS_FIXED                  0
00000026  00000c49 R_NANOMIPS_JALR32      00000020   frob \+ 0
