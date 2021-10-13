GAS LISTING .*/branch-relax\.s 			page 1

   1              		\.text
   2              		\.align	3
   3              		\.ent	test
   4              		\.globl	test
   5              		\.globl	test4a
   6              		/\* expand to 16-bit  \*/
   7              	test:
   8 0000 A4880000 		beqc	\$a0, \$a1, test1 /\* forward, expand to 32-bit  \*/
   9 0004 00000000 		\.space	\(1<<5\)
   9      00000000.
   9      00000000.
   9      00000000.
   9      00000000.
  10              	test1:
  11 0024 00280000 		bc	test2	/\* forward, expand to 32-bit  \*/
  12              	test1a:
  13 0028 00000000 		\.space	\(1<<10\)
  13      00000000.
  13      00000000.
  13      00000000.
  13      00000000.
  14              	test2:
  15 0428 00280000 		bc	test1a	/\* backward, expand to 32-bit  \*/
  16              	test2a:
  17 042c 85A80000 		bnec	\$a1, \$a0, test3 /\* forward, expand to 32-bit  \*/
  18 0430 00000000 		\.space	\(1<<5\)
  18      00000000.
  18      00000000.
  18      00000000.
  18      00000000.
  19              	test3:
  20 0450 A4880000 		beqc	\$a0, \$a1, test2 /\* backward, expand to 32-bit  \*/
  21 0454 00000000 		\.space	\(1<<5\)
  21      00000000.
  21      00000000.
  21      00000000.
  21      00000000.
  22              	test4:
  23 0474 002A0000 		balc	test5 /\* forward, expand to 32-bit  \*/
  24              	test4a:
  25 0478 00000000 		\.space	\(1<<10\)
  25      00000000.
  25      00000000.
  25      00000000.
  25      00000000.
  26              		\.end	test
  27              		\.ent	test5
  28              		\.globl	test5
  29              		\.globl	test5a
  30              	test5:
  31 0878 002A0000 		balc	test4a /\* backward, expand to 32-bit  \*/
  32 087c 80880000 		beqzc	\$a0, test6 /\* forward, expand to 32-bit  \*/
  33              	test6a:
  34 0880 00000000 		\.space	\(1<<7\)
  34      00000000.
  34      00000000.
  34      00000000.
GAS LISTING .*/branch-relax\.s 			page 2


  34      00000000.
  35              	test6:
  36 0900 80880000 		beqzc	\$a0, test6a /\* backward, expand to 32-bit  \*/
  37              	test7:
  38 0904 80A80000 		bnezc	\$a0, test8 /\* forward, expand to 32-bit  \*/
  39              	test7a:
  40 0908 00000000 		\.space	\(1<<7\)
  40      00000000.
  40      00000000.
  40      00000000.
  40      00000000.
  41              	test8:
  42 0988 80A80000 		bnezc	\$a0, test7a /\* backward, expand to 32-bit  \*/
  43              \t
  44              	test9:
  45 098c CFDA     		beqc	\$a0, \$a1, test10 /\* forward, relax to 16-bit  \*/
  46 098e 00000000 		\.space	\(1<<5\)-2
  46      00000000.
  46      00000000.
  46      00000000.
  46      00000000.
  47              	test10:
  48 09ac 0018     		bc	test11	/\* forward, relax to 16-bit  \*/
  49              	test10a:
  50 09ae 00000000 		\.space	\(1<<10\)-2
  50      00000000.
  50      00000000.
  50      00000000.
  50      00000000.
  51              	test11:
  52 0dac 0018     		bc	test10a	/\* backward, relax to 16-bit  \*/
  53              		\.globl	test12a
  54              		\.globl	test13
  55              	test12:
  56 0dae 0038     		balc	test13		/\* backward, relax to 16-bit  \*/
  57              	test12a:
  58 0db0 00000000 		\.space	\(1<<10\)-2
  58      00000000.
  58      00000000.
  58      00000000.
  58      00000000.
  59              	test13:
  60 11ae 0038     		balc	test12a	/\* backward, relax to 16-bit  \*/
  61              \t
  62 11b0 009A     		beqzc	\$a0, test15	/\* forward, relax to 16-bit  \*/
  63              	test14:
  64 11b2 00000000 		\.space	\(1<<7\)-2
  64      00000000.
  64      00000000.
  64      00000000.
  64      00000000.
  65              	test15:
  66 1230 009A     		beqzc	\$a0, test14	/\* backward, relax to 16-bit  \*/
  67 1232 00BA     		bnezc	\$a0, test17	/\* forward, relax to 16-bit  \*/
  68              	test16:
  69 1234 00000000 		\.space	\(1<<7\)-2
  69      00000000.
GAS LISTING .*/branch-relax\.s 			page 3


  69      00000000.
  69      00000000.
  69      00000000.
  70              	test17:
  71 12b2 00BA     		bnezc	\$a0, test16	/\* backward, relax to 16-bit  \*/
  72              \t
  73 12b4 F1880000 		beqc	\$s1, \$a3, \$L1	/\* unreachable forward, relax\.  \*/
  74              	\$L1:
  75 12b8 F1880000 		beqc	\$s1, \$a3, \$L2	/\* unreachable forward, relax\.  \*/
  76              	\$L2:
  77 12bc 0890     		nop
  78 12be 9FDB     		beqc	\$s1, \$a3, \$L3	/\* reachable forward, no relax\.  \*/
  79 12c0 111F     		restore\.jrc	16, \$ra
  80              	\$L3:
  81 12c2 9FDB     		beqc	\$s1, \$a3, \$L4	/\* reachable forward, no relax\.  \*/
  82 12c4 8098     		beqzc	\$s1, \$L3
  83              	\$L4:
  84 12c6 0890     		\.half 0x9008
  85              \t
  86              		\.end test5
