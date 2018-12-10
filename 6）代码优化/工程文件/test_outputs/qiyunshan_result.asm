.data
   .var_var2: .word 0
   .var_varray: .space 40
   .var_var4: .word 0
   .var_varraychar: .space 80
   .var_var1: .word 0
   .str_0: .asciiz "fibnum is too big"
   .str_1: .asciiz "fibnum is too small"
   .str_2: .asciiz "fib number is:"
   .str_3: .asciiz "error"
   .str_4: .asciiz "your input is correct!"
   .str_5: .asciiz "error!"
   .str_6: .asciiz "! #$%&'()*+,-./0123456789:;<=>?@ABCXYZabcxyz[\\]^_{|}~"
.text
   jal .func_main
   j end
#------------13  FUNC INT add(2)
.func_add:

#------------14  PARA INT a

#------------15  PARA INT b

#------------16  CONST INT var1 = 1

#------------17  VAR INT c

#------------18  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------19  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -16($sp)

#------------20  reg[2] = reg[1] JIA reg[2]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------21  ASSIGN INT c = reg[2]
   lw $t3 -16($sp)
   sw $t3 -8($sp)

#------------22  FACTOR_VAR INT c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -20($sp)

#------------23  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -24($sp)

#------------24  reg[4] = reg[3] CHENG reg[4]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -24($sp)

#------------25  ASSIGN INT c = reg[4]
   lw $t3 -24($sp)
   sw $t3 -8($sp)

#------------26  FACTOR_VAR INT c save in reg[5]
   lw $t3 -8($sp)
   sw $t3 -28($sp)

#------------27  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------28  FUNC VOID fortest(0)
   jr $ra

.func_fortest:

#------------29  VAR INT i

#------------30  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------31  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------32  JUMP to label_1
   j label_1

#------------33  label_0    ----------------Label----------------
label_0:

#------------34  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------35  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -12($sp)

#------------36  reg[3] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------37  ASSIGN INT i = reg[3]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------38  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------39  FACTOR_CON INT 10 save in reg[5]
   li $t0 10
   sw $t0 -20($sp)

#------------40  IF reg[4] BGTR reg[5] THEN GOTO label_6
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bgt $t0 $t1 label_6

#------------41  label_1    ----------------Label----------------
label_1:

#------------42  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------43  FACTOR_CON INT 7 save in reg[7]
   li $t0 7
   sw $t0 -28($sp)

#------------44  IF reg[6] BNE reg[7] THEN GOTO label_2
   lw $t0 -24($sp)
   lw $t1 -28($sp)
    bne $t0 $t1 label_2

#------------45  FACTOR_VAR INT i save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------46  WRITE INT reg[8]
   li $v0 1
   lw $a0 -32($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------47  JUMP to label_5
   j label_5

#------------48  label_2    ----------------Label----------------
label_2:

#------------49  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------50  FACTOR_CON INT 8 save in reg[10]
   li $t0 8
   sw $t0 -40($sp)

#------------51  IF reg[9] BNE reg[10] THEN GOTO label_3
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    bne $t0 $t1 label_3

#------------52  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------53  WRITE INT reg[11]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------54  JUMP to label_4
   j label_4

#------------55  label_3    ----------------Label----------------
label_3:

#------------56  label_4    ----------------Label----------------
label_4:

#------------57  label_5    ----------------Label----------------
label_5:

#------------58  JUMP to label_0
   j label_0

#------------59  label_6    ----------------Label----------------
label_6:

#------------60  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -48($sp)

#------------61  ASSIGN INT i = reg[12]
   lw $t3 -48($sp)
   sw $t3 0($sp)

#------------62  JUMP to label_8
   j label_8

#------------63  label_7    ----------------Label----------------
label_7:

#------------64  FACTOR_VAR INT i save in reg[13]
   lw $t3 0($sp)
   sw $t3 -52($sp)

#------------65  FACTOR_CON INT 5 save in reg[14]
   li $t0 5
   sw $t0 -56($sp)

#------------66  reg[14] = reg[13] JIAN reg[14]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------67  ASSIGN INT i = reg[14]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------68  FACTOR_CON INT 6 save in reg[15]
   li $t0 6
   sw $t0 -60($sp)

#------------69  FACTOR_CON INT 5 save in reg[16]
   li $t0 5
   sw $t0 -64($sp)

#------------70  reg[16] = reg[15] JIAN reg[16]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   sub $t2 $t0 $t1
   sw $t2 -64($sp)

#------------71  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -68($sp)

#------------72  reg[17] = reg[16] JIA reg[17]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   add $t2 $t0 $t1
   sw $t2 -68($sp)

#------------73  FACTOR_EXPR reg[17] save in reg[18]
   lw $t0 -68($sp)
   sw $t0 -72($sp)

#------------74  FACTOR_CON INT 2 save in reg[19]
   li $t0 2
   sw $t0 -76($sp)

#------------75  reg[19] = reg[18] CHENG reg[19]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -76($sp)

#------------76  FACTOR_CON INT 6 save in reg[20]
   li $t0 6
   sw $t0 -80($sp)

#------------77  reg[20] = reg[19] JIAN reg[20]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   sub $t2 $t0 $t1
   sw $t2 -80($sp)

#------------78  IF reg[20] BEQ reg[0] THEN GOTO label_12
   lw $t0 -80($sp)
    beq $t0 $0 label_12

#------------79  label_8    ----------------Label----------------
label_8:

#------------80  FACTOR_CON INT 10 save in reg[21]
   li $t0 10
   sw $t0 -84($sp)

#------------81  ASSIGN_EXTERN INT var1 = reg[21]
   lw $t3 -84($sp)
   sw $t3 .var_var1

#------------82  JUMP to label_10
   j label_10

#------------83  label_9    ----------------Label----------------
label_9:

#------------84  FACTOR_VAR_EXTERN INT var1 save in reg[22]
   lw $t3 .var_var1
   sw $t3 -88($sp)

#------------85  FACTOR_CON INT 8 save in reg[23]
   li $t0 8
   sw $t0 -92($sp)

#------------86  reg[23] = reg[22] JIAN reg[23]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   sub $t2 $t0 $t1
   sw $t2 -92($sp)

#------------87  ASSIGN_EXTERN INT var1 = reg[23]
   lw $t3 -92($sp)
   sw $t3 .var_var1

#------------88  FACTOR_VAR_EXTERN INT var1 save in reg[24]
   lw $t3 .var_var1
   sw $t3 -96($sp)

#------------89  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -100($sp)

#------------90  IF reg[24] BLSS reg[25] THEN GOTO label_11
   lw $t0 -96($sp)
   lw $t1 -100($sp)
    blt $t0 $t1 label_11

#------------91  label_10    ----------------Label----------------
label_10:

#------------92  JUMP to label_9
   j label_9

#------------93  label_11    ----------------Label----------------
label_11:

#------------94  JUMP to label_7
   j label_7

#------------95  label_12    ----------------Label----------------
label_12:

#------------96  FACTOR_VAR_EXTERN INT var1 save in reg[26]
   lw $t3 .var_var1
   sw $t3 -104($sp)

#------------97  WRITE INT reg[26]
   li $v0 1
   lw $a0 -104($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------98  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------99  FUNC INT exptest(0)
   jr $ra

.func_exptest:

#------------100  VAR INT a

#------------101  VAR INT c

#------------102  VAR CHAR b

#------------103  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------104  READ CHAR b
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------105  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------106  FACTOR_CON INT 10 save in reg[2]
   li $t0 10
   sw $t0 -16($sp)

#------------107  FACTOR_CON CHAR 0 save in reg[3]
   li $t0 0
   sw $t0 -20($sp)

#------------108  reg[3] = reg[3] JIAN reg[2]
   lw $t0 -20($sp)
   lw $t1 -16($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------109  FACTOR_CON INT 20 save in reg[4]
   li $t0 20
   sw $t0 -24($sp)

#------------110  reg[4] = reg[3] JIA reg[4]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------111  FACTOR_EXPR reg[4] save in reg[5]
   lw $t0 -24($sp)
   sw $t0 -28($sp)

#------------112  reg[5] = reg[1] CHENG reg[5]
   lw $t0 -12($sp)
   lw $t1 -28($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -28($sp)

#------------113  FACTOR_CON INT 5 save in reg[6]
   li $t0 5
   sw $t0 -32($sp)

#------------114  reg[6] = reg[5] CHU reg[6]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -32($sp)

#------------115  ASSIGN INT a = reg[6]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------116  FACTOR_CON CHAR 97 save in reg[7]
   li $t0 97
   sw $t0 -36($sp)

#------------117  FACTOR_CON CHAR 0 save in reg[8]
   li $t0 0
   sw $t0 -40($sp)

#------------118  reg[8] = reg[8] JIAN reg[7]
   lw $t0 -40($sp)
   lw $t1 -36($sp)
   sub $t2 $t0 $t1
   sw $t2 -40($sp)

#------------119  FACTOR_VAR CHAR b save in reg[9]
   lw $t3 -8($sp)
   sw $t3 -44($sp)

#------------120  reg[9] = reg[8] JIA reg[9]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------121  ASSIGN INT c = reg[9]
   lw $t3 -44($sp)
   sw $t3 -4($sp)

#------------122  FACTOR_VAR INT c save in reg[10]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------123  FACTOR_VAR CHAR b save in reg[11]
   lw $t3 -8($sp)
   sw $t3 -52($sp)

#------------124  reg[11] = reg[10] JIA reg[11]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------125  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------126  FUNC INT arraytest(0)
   jr $ra

.func_arraytest:

#------------127  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------128  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------129  ASSIGN_ARR_EXTERN INT varray[reg[1]] = reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------130  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------131  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -12($sp)

#------------132  ASSIGN_ARR_EXTERN INT varray[reg[3]] = reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------133  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -16($sp)

#------------134  FACTOR_CON INT 3 save in reg[6]
   li $t0 3
   sw $t0 -20($sp)

#------------135  ASSIGN_ARR_EXTERN INT varray[reg[5]] = reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------136  FACTOR_CON INT 3 save in reg[7]
   li $t0 3
   sw $t0 -24($sp)

#------------137  FACTOR_CON INT 4 save in reg[8]
   li $t0 4
   sw $t0 -28($sp)

#------------138  ASSIGN_ARR_EXTERN INT varray[reg[7]] = reg[8]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------139  FACTOR_CON INT 4 save in reg[9]
   li $t0 4
   sw $t0 -32($sp)

#------------140  FACTOR_CON INT 5 save in reg[10]
   li $t0 5
   sw $t0 -36($sp)

#------------141  ASSIGN_ARR_EXTERN INT varray[reg[9]] = reg[10]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------142  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -40($sp)

#------------143  FACTOR_ARRAY_EXTERN INT varray [reg[11]] save in reg[12]
   lw $t3 -40($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -44($sp)

#------------144  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -48($sp)

#------------145  FACTOR_ARRAY_EXTERN INT varray [reg[13]] save in reg[14]
   lw $t3 -48($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -52($sp)

#------------146  FACTOR_ARRAY_EXTERN INT varray [reg[14]] save in reg[15]
   lw $t3 -52($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -56($sp)

#------------147  reg[15] = reg[12] JIA reg[15]
   lw $t0 -44($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------148  FACTOR_CON INT 2 save in reg[16]
   li $t0 2
   sw $t0 -60($sp)

#------------149  FACTOR_ARRAY_EXTERN INT varray [reg[16]] save in reg[17]
   lw $t3 -60($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -64($sp)

#------------150  reg[17] = reg[15] JIA reg[17]
   lw $t0 -56($sp)
   lw $t1 -64($sp)
   add $t2 $t0 $t1
   sw $t2 -64($sp)

#------------151  FACTOR_CON INT 3 save in reg[18]
   li $t0 3
   sw $t0 -68($sp)

#------------152  FACTOR_ARRAY_EXTERN INT varray [reg[18]] save in reg[19]
   lw $t3 -68($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -72($sp)

#------------153  reg[19] = reg[17] JIA reg[19]
   lw $t0 -64($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------154  FACTOR_EXPR reg[19] save in reg[20]
   lw $t0 -72($sp)
   sw $t0 -76($sp)

#------------155  FACTOR_CON INT 4 save in reg[21]
   li $t0 4
   sw $t0 -80($sp)

#------------156  FACTOR_ARRAY_EXTERN INT varray [reg[21]] save in reg[22]
   lw $t3 -80($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -84($sp)

#------------157  reg[22] = reg[20] CHENG reg[22]
   lw $t0 -76($sp)
   lw $t1 -84($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -84($sp)

#------------158  RETURN reg[22] TO $V0 AND THEN GOTO 0
   lw $v0 -84($sp)
   jr $ra

#------------159  FUNC INT fib(1)
   jr $ra

.func_fib:

#------------160  PARA INT a

#------------161  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------162  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------163  IF reg[1] BNE reg[2] THEN GOTO label_13
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_13

#------------164  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------165  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------166  JUMP to label_14
   j label_14

#------------167  label_13    ----------------Label----------------
label_13:

#------------168  label_14    ----------------Label----------------
label_14:

#------------169  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------170  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -20($sp)

#------------171  IF reg[4] BNE reg[5] THEN GOTO label_15
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_15

#------------172  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------173  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------174  JUMP to label_16
   j label_16

#------------175  label_15    ----------------Label----------------
label_15:

#------------176  label_16    ----------------Label----------------
label_16:

#------------177  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------178  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -32($sp)

#------------179  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------180  PUSH INT parareg[0] from reg[8]
   sw $ra -36($sp)
   lw $t0 -32($sp)
   sw $t0 -40($sp)

#------------181  CALL INT fib(1)
   addi $sp $sp -40
   jal .func_fib
   subi $sp $sp -40
   lw $ra -36($sp)

#------------182  FACTOR_FUNC INT fib save in reg[9]
   sw $v0 -36($sp)

#------------183  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------184  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -44($sp)

#------------185  reg[11] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------186  PUSH INT parareg[1] from reg[11]
   sw $ra -48($sp)
   lw $t0 -44($sp)
   sw $t0 -52($sp)

#------------187  CALL INT fib(1)
   addi $sp $sp -52
   jal .func_fib
   subi $sp $sp -52
   lw $ra -48($sp)

#------------188  FACTOR_FUNC INT fib save in reg[12]
   sw $v0 -48($sp)

#------------189  reg[12] = reg[9] JIA reg[12]
   lw $t0 -36($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------190  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------191  FUNC VOID whiletest(1)
   jr $ra

.func_whiletest:

#------------192  PARA INT a

#------------193  label_17    ----------------Label----------------
label_17:

#------------194  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------195  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------196  IF reg[1] BLEQ reg[2] THEN GOTO label_18
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    ble $t0 $t1 label_18

#------------197  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------198  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -16($sp)

#------------199  reg[4] = reg[3] JIAN reg[4]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   sub $t2 $t0 $t1
   sw $t2 -16($sp)

#------------200  ASSIGN INT a = reg[4]
   lw $t3 -16($sp)
   sw $t3 0($sp)

#------------201  JUMP to label_17
   j label_17

#------------202  label_18    ----------------Label----------------
label_18:

#------------203  FACTOR_VAR INT a save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------204  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -24($sp)

#------------205  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -28($sp)

#------------206  reg[7] = reg[7] JIAN reg[6]
   lw $t0 -28($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -28($sp)

#------------207  IF reg[5] BNE reg[7] THEN GOTO label_23
   lw $t0 -20($sp)
   lw $t1 -28($sp)
    bne $t0 $t1 label_23

#------------208  label_19    ----------------Label----------------
label_19:

#------------209  FACTOR_CON INT 15 save in reg[8]
   li $t0 15
   sw $t0 -32($sp)

#------------210  FACTOR_VAR INT a save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------211  IF reg[8] BLEQ reg[9] THEN GOTO label_22
   lw $t0 -32($sp)
   lw $t1 -36($sp)
    ble $t0 $t1 label_22

#------------212  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------213  FACTOR_CON INT 5 save in reg[11]
   li $t0 5
   sw $t0 -44($sp)

#------------214  reg[11] = reg[10] JIA reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------215  ASSIGN INT a = reg[11]
   lw $t3 -44($sp)
   sw $t3 0($sp)

#------------216  FACTOR_VAR INT a save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------217  FACTOR_CON INT 13 save in reg[13]
   li $t0 13
   sw $t0 -52($sp)

#------------218  IF reg[12] BNE reg[13] THEN GOTO label_20
   lw $t0 -48($sp)
   lw $t1 -52($sp)
    bne $t0 $t1 label_20

#------------219  FACTOR_VAR INT a save in reg[14]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------220  FACTOR_CON INT 2 save in reg[15]
   li $t0 2
   sw $t0 -60($sp)

#------------221  reg[15] = reg[14] JIA reg[15]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------222  ASSIGN INT a = reg[15]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------223  JUMP to label_21
   j label_21

#------------224  label_20    ----------------Label----------------
label_20:

#------------225  label_21    ----------------Label----------------
label_21:

#------------226  JUMP to label_19
   j label_19

#------------227  label_22    ----------------Label----------------
label_22:

#------------228  JUMP to label_24
   j label_24

#------------229  label_23    ----------------Label----------------
label_23:

#------------230  label_24    ----------------Label----------------
label_24:

#------------231  FACTOR_VAR INT a save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------232  WRITE INT reg[16]
   li $v0 1
   lw $a0 -64($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------233  FUNC VOID calltest3(4)
   jr $ra

.func_calltest3:

#------------234  PARA CHAR a

#------------235  PARA CHAR b

#------------236  PARA CHAR c

#------------237  PARA CHAR d

#------------238  FACTOR_VAR_EXTERN INT var2 save in reg[1]
   lw $t3 .var_var2
   sw $t3 -16($sp)

#------------239  FACTOR_CON INT 100 save in reg[2]
   li $t0 100
   sw $t0 -20($sp)

#------------240  reg[2] = reg[1] JIAN reg[2]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------241  FACTOR_CON INT 3 save in reg[3]
   li $t0 3
   sw $t0 -24($sp)

#------------242  FACTOR_ARRAY_EXTERN INT varray [reg[3]] save in reg[4]
   lw $t3 -24($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -28($sp)

#------------243  reg[4] = reg[2] JIA reg[4]
   lw $t0 -20($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------244  IF reg[4] BEQ reg[0] THEN GOTO label_27
   lw $t0 -28($sp)
    beq $t0 $0 label_27

#------------245  FACTOR_VAR CHAR a save in reg[5]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------246  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -36($sp)

#------------247  IF reg[5] BNE reg[6] THEN GOTO label_25
   lw $t0 -32($sp)
   lw $t1 -36($sp)
    bne $t0 $t1 label_25

#------------248  FACTOR_VAR CHAR a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------249  FACTOR_VAR CHAR b save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -44($sp)

#------------250  reg[8] = reg[7] JIA reg[8]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------251  FACTOR_VAR CHAR c save in reg[9]
   lw $t3 -8($sp)
   sw $t3 -48($sp)

#------------252  reg[9] = reg[8] JIA reg[9]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------253  FACTOR_VAR CHAR d save in reg[10]
   lw $t3 -12($sp)
   sw $t3 -52($sp)

#------------254  reg[10] = reg[9] JIA reg[10]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------255  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -56($sp)

#------------256  reg[11] = reg[10] JIA reg[11]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------257  WRITE INT reg[11]
   li $v0 1
   lw $a0 -56($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------258  JUMP to label_26
   j label_26

#------------259  label_25    ----------------Label----------------
label_25:

#------------260  label_26    ----------------Label----------------
label_26:

#------------261  JUMP to label_28
   j label_28

#------------262  label_27    ----------------Label----------------
label_27:

#------------263  label_28    ----------------Label----------------
label_28:

#------------264  FUNC VOID calltest2(0)
   jr $ra

.func_calltest2:

#------------265  FACTOR_CON INT 100 save in reg[1]
   li $t0 100
   sw $t0 0($sp)

#------------266  ASSIGN_EXTERN INT var2 = reg[1]
   lw $t3 0($sp)
   sw $t3 .var_var2

#------------267  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -4($sp)

#------------268  FACTOR_CON CHAR 42 save in reg[3]
   li $t0 42
   sw $t0 -8($sp)

#------------269  FACTOR_CON CHAR 43 save in reg[4]
   li $t0 43
   sw $t0 -12($sp)

#------------270  FACTOR_CON CHAR 56 save in reg[5]
   li $t0 56
   sw $t0 -16($sp)

#------------271  PUSH INT parareg[2] from reg[2]
   sw $ra -20($sp)
   lw $t0 -4($sp)
   sw $t0 -24($sp)

#------------272  PUSH INT parareg[3] from reg[3]
   lw $t0 -8($sp)
   sw $t0 -28($sp)

#------------273  PUSH INT parareg[4] from reg[4]
   lw $t0 -12($sp)
   sw $t0 -32($sp)

#------------274  PUSH INT parareg[5] from reg[5]
   lw $t0 -16($sp)
   sw $t0 -36($sp)

#------------275  CALL VOID calltest3(4)
   addi $sp $sp -24
   jal .func_calltest3
   subi $sp $sp -24
   lw $ra -20($sp)

#------------276  FACTOR_CON INT 30 save in reg[6]
   li $t0 30
   sw $t0 -20($sp)

#------------277  ASSIGN_EXTERN INT var2 = reg[6]
   lw $t3 -20($sp)
   sw $t3 .var_var2

#------------278  FUNC INT calltest1(0)
   jr $ra

.func_calltest1:

#------------279  CALL VOID calltest2(0)
   sw $ra 0($sp)
   addi $sp $sp -4
   jal .func_calltest2
   subi $sp $sp -4
   lw $ra 0($sp)

#------------280  FACTOR_CON INT 50 save in reg[1]
   li $t0 50
   sw $t0 0($sp)

#------------281  ASSIGN_EXTERN INT var2 = reg[1]
   lw $t3 0($sp)
   sw $t3 .var_var2

#------------282  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -4($sp)

#------------283  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------284  FUNC CHAR chartest(0)
   jr $ra

.func_chartest:

#------------285  FACTOR_CON CHAR 72 save in reg[1]
   li $t0 72
   sw $t0 0($sp)

#------------286  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------287  FUNC CHAR chara(1)
   jr $ra

.func_chara:

#------------288  PARA INT x

#------------289  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------290  FACTOR_CON INT 97 save in reg[2]
   li $t0 97
   sw $t0 -8($sp)

#------------291  IF reg[1] BNE reg[2] THEN GOTO label_29
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_29

#------------292  FACTOR_CON CHAR 97 save in reg[3]
   li $t0 97
   sw $t0 -12($sp)

#------------293  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------294  JUMP to label_30
   j label_30

#------------295  label_29    ----------------Label----------------
label_29:

#------------296  FACTOR_CON CHAR 122 save in reg[4]
   li $t0 122
   sw $t0 -16($sp)

#------------297  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------298  label_30    ----------------Label----------------
label_30:

#------------299  FUNC VOID main(0)
   jr $ra

.func_main:

#------------300  VAR INT result

#------------301  VAR INT fibnum

#------------302  FACTOR_CON INT 10 save in reg[5]
   li $t0 10
   sw $t0 -24($sp)

#------------303  FACTOR_CON INT 20 save in reg[6]
   li $t0 20
   sw $t0 -28($sp)

#------------304  PUSH INT parareg[6] from reg[5]
   sw $ra -32($sp)
   lw $t0 -24($sp)
   sw $t0 -36($sp)

#------------305  PUSH INT parareg[7] from reg[6]
   lw $t0 -28($sp)
   sw $t0 -40($sp)

#------------306  CALL INT add(2)
   addi $sp $sp -36
   jal .func_add
   subi $sp $sp -36
   lw $ra -32($sp)

#------------307  FACTOR_FUNC INT add save in reg[7]
   sw $v0 -32($sp)

#------------308  ASSIGN INT result = reg[7]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------309  CALL INT exptest(0)
   sw $ra -36($sp)
   addi $sp $sp -40
   jal .func_exptest
   subi $sp $sp -40
   lw $ra -36($sp)

#------------310  FACTOR_FUNC INT exptest save in reg[8]
   sw $v0 -36($sp)

#------------311  FACTOR_VAR INT result save in reg[9]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------312  reg[9] = reg[8] JIA reg[9]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------313  CALL INT arraytest(0)
   sw $ra -44($sp)
   addi $sp $sp -48
   jal .func_arraytest
   subi $sp $sp -48
   lw $ra -44($sp)

#------------314  FACTOR_FUNC INT arraytest save in reg[10]
   sw $v0 -44($sp)

#------------315  reg[10] = reg[9] JIA reg[10]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------316  WRITE INT reg[10]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------317  READ INT fibnum
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------318  FACTOR_VAR INT fibnum save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------319  FACTOR_CON INT 10 save in reg[12]
   li $t0 10
   sw $t0 -52($sp)

#------------320  IF reg[11] BLEQ reg[12] THEN GOTO label_31
   lw $t0 -48($sp)
   lw $t1 -52($sp)
    ble $t0 $t1 label_31

#------------321  WRITE fibnum is too big
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------322  JUMP to label_34
   j label_34

#------------323  label_31    ----------------Label----------------
label_31:

#------------324  FACTOR_VAR INT fibnum save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -56($sp)

#------------325  FACTOR_CON INT 1 save in reg[14]
   li $t0 1
   sw $t0 -60($sp)

#------------326  IF reg[13] BGEQ reg[14] THEN GOTO label_32
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    bge $t0 $t1 label_32

#------------327  WRITE fibnum is too small
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------328  JUMP to label_33
   j label_33

#------------329  label_32    ----------------Label----------------
label_32:

#------------330  WRITE fib number is:
   li $v0 4
   la $a0 .str_2
   syscall

#------------331  FACTOR_VAR INT fibnum save in reg[15]
   lw $t3 -4($sp)
   sw $t3 -64($sp)

#------------332  PUSH INT parareg[8] from reg[15]
   sw $ra -68($sp)
   lw $t0 -64($sp)
   sw $t0 -72($sp)

#------------333  CALL INT fib(1)
   addi $sp $sp -72
   jal .func_fib
   subi $sp $sp -72
   lw $ra -68($sp)

#------------334  FACTOR_FUNC INT fib save in reg[16]
   sw $v0 -68($sp)

#------------335  WRITE INT reg[16]
   li $v0 1
   lw $a0 -68($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------336  label_33    ----------------Label----------------
label_33:

#------------337  label_34    ----------------Label----------------
label_34:

#------------338  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -72($sp)

#------------339  PUSH INT parareg[9] from reg[17]
   sw $ra -76($sp)
   lw $t0 -72($sp)
   sw $t0 -80($sp)

#------------340  CALL VOID whiletest(1)
   addi $sp $sp -80
   jal .func_whiletest
   subi $sp $sp -80
   lw $ra -76($sp)

#------------341  CALL VOID fortest(0)
   sw $ra -76($sp)
   addi $sp $sp -80
   jal .func_fortest
   subi $sp $sp -80
   lw $ra -76($sp)

#------------342  READ_EXTERN CHAR var4
   li $v0 12
   syscall
   sw $v0 .var_var4

#------------343  FACTOR_CON INT 314 save in reg[18]
   li $t0 314
   sw $t0 -76($sp)

#------------344  FACTOR_CON INT 314 save in reg[19]
   li $t0 314
   sw $t0 -80($sp)

#------------345  reg[19] = reg[18] JIAN reg[19]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   sub $t2 $t0 $t1
   sw $t2 -80($sp)

#------------346  FACTOR_CON INT 0 save in reg[20]
   li $t0 0
   sw $t0 -84($sp)

#------------347  FACTOR_ARRAY_EXTERN INT varray [reg[20]] save in reg[21]
   lw $t3 -84($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -88($sp)

#------------348  reg[21] = reg[19] JIA reg[21]
   lw $t0 -80($sp)
   lw $t1 -88($sp)
   add $t2 $t0 $t1
   sw $t2 -88($sp)

#------------349  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -92($sp)

#------------350  reg[22] = reg[21] JIAN reg[22]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   sub $t2 $t0 $t1
   sw $t2 -92($sp)

#------------351  IF reg[22] BEQ reg[0] THEN GOTO label_35
   lw $t0 -92($sp)
    beq $t0 $0 label_35

#------------352  WRITE error
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------353  JUMP to label_36
   j label_36

#------------354  label_35    ----------------Label----------------
label_35:

#------------355  label_36    ----------------Label----------------
label_36:

#------------356  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -96($sp)

#------------357  IF reg[23] BEQ reg[0] THEN GOTO label_39
   lw $t0 -96($sp)
    beq $t0 $0 label_39

#------------358  FACTOR_VAR_EXTERN CHAR var4 save in reg[24]
   lw $t3 .var_var4
   sw $t3 -100($sp)

#------------359  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -104($sp)

#------------360  reg[25] = reg[24] JIA reg[25]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   add $t2 $t0 $t1
   sw $t2 -104($sp)

#------------361  PUSH INT parareg[10] from reg[25]
   sw $ra -108($sp)
   lw $t0 -104($sp)
   sw $t0 -112($sp)

#------------362  CALL CHAR chara(1)
   addi $sp $sp -112
   jal .func_chara
   subi $sp $sp -112
   lw $ra -108($sp)

#------------363  FACTOR_FUNC CHAR chara save in reg[26]
   sw $v0 -108($sp)

#------------364  FACTOR_CON CHAR 97 save in reg[27]
   li $t0 97
   sw $t0 -112($sp)

#------------365  IF reg[26] BNE reg[27] THEN GOTO label_37
   lw $t0 -108($sp)
   lw $t1 -112($sp)
    bne $t0 $t1 label_37

#------------366  WRITE your input is correct!
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------367  JUMP to label_38
   j label_38

#------------368  label_37    ----------------Label----------------
label_37:

#------------369  WRITE error!
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------370  label_38    ----------------Label----------------
label_38:

#------------371  JUMP to label_40
   j label_40

#------------372  label_39    ----------------Label----------------
label_39:

#------------373  label_40    ----------------Label----------------
label_40:

#------------374  WRITE ! #$%&'()*+,-./0123456789:;<=>?@ABCXYZabcxyz[\]^_{|}~
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------375  CALL CHAR chartest(0)
   sw $ra -116($sp)
   addi $sp $sp -120
   jal .func_chartest
   subi $sp $sp -120
   lw $ra -116($sp)

#------------376  FACTOR_FUNC CHAR chartest save in reg[28]
   sw $v0 -116($sp)

#------------377  WRITE CHAR reg[28]
   li $v0 11
   lw $a0 -116($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------378  CALL INT calltest1(0)
   sw $ra -120($sp)
   addi $sp $sp -124
   jal .func_calltest1
   subi $sp $sp -124
   lw $ra -120($sp)

   jr $ra

end:
