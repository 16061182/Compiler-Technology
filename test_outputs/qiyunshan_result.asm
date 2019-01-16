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

#------------20  reg[3] = reg[1] JIA reg[2]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   addu $t2 $t0 $t1
   sw $t2 -20($sp)

#------------21  ASSIGN INT c = reg[3]
   lw $t3 -20($sp)
   sw $t3 -8($sp)

#------------22  FACTOR_VAR INT c save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -24($sp)

#------------23  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -28($sp)

#------------24  reg[6] = reg[4] CHENG reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -32($sp)

#------------25  ASSIGN INT c = reg[6]
   lw $t3 -32($sp)
   sw $t3 -8($sp)

#------------26  FACTOR_VAR INT c save in reg[7]
   lw $t3 -8($sp)
   sw $t3 -36($sp)

#------------27  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
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

#------------32  label_0    ----------------Label----------------
label_0:

#------------33  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------34  FACTOR_CON INT 7 save in reg[3]
   li $t0 7
   sw $t0 -12($sp)

#------------35  IF reg[2] BNE reg[3] THEN GOTO label_1
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    bne $t0 $t1 label_1

#------------36  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------37  WRITE INT reg[4]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------38  JUMP to label_4
   j label_4

#------------39  label_1    ----------------Label----------------
label_1:

#------------40  FACTOR_VAR INT i save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------41  FACTOR_CON INT 8 save in reg[6]
   li $t0 8
   sw $t0 -24($sp)

#------------42  IF reg[5] BNE reg[6] THEN GOTO label_2
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bne $t0 $t1 label_2

#------------43  FACTOR_VAR INT i save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------44  WRITE INT reg[7]
   li $v0 1
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------45  JUMP to label_3
   j label_3

#------------46  label_2    ----------------Label----------------
label_2:

#------------47  label_3    ----------------Label----------------
label_3:

#------------48  label_4    ----------------Label----------------
label_4:

#------------49  FACTOR_VAR INT i save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------50  FACTOR_CON INT 2 save in reg[9]
   li $t0 2
   sw $t0 -36($sp)

#------------51  reg[10] = reg[8] JIA reg[9]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   addu $t2 $t0 $t1
   sw $t2 -40($sp)

#------------52  ASSIGN INT i = reg[10]
   lw $t3 -40($sp)
   sw $t3 0($sp)

#------------53  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------54  FACTOR_CON INT 10 save in reg[12]
   li $t0 10
   sw $t0 -48($sp)

#------------55  IF reg[11] BLEQ reg[12] THEN GOTO label_0
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    ble $t0 $t1 label_0

#------------56  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -52($sp)

#------------57  ASSIGN INT i = reg[13]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------58  label_5    ----------------Label----------------
label_5:

#------------59  FACTOR_CON INT 10 save in reg[14]
   li $t0 10
   sw $t0 -56($sp)

#------------60  ASSIGN_EXTERN INT var1 = reg[14]
   lw $t3 -56($sp)
   sw $t3 .var_var1

#------------61  label_6    ----------------Label----------------
label_6:

#------------62  FACTOR_VAR_EXTERN INT var1 save in reg[15]
   lw $t3 .var_var1
   sw $t3 -60($sp)

#------------63  FACTOR_CON INT 8 save in reg[16]
   li $t0 8
   sw $t0 -64($sp)

#------------64  reg[17] = reg[15] JIAN reg[16]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   subu $t2 $t0 $t1
   sw $t2 -68($sp)

#------------65  ASSIGN_EXTERN INT var1 = reg[17]
   lw $t3 -68($sp)
   sw $t3 .var_var1

#------------66  FACTOR_VAR_EXTERN INT var1 save in reg[18]
   lw $t3 .var_var1
   sw $t3 -72($sp)

#------------67  FACTOR_CON INT 0 save in reg[19]
   li $t0 0
   sw $t0 -76($sp)

#------------68  IF reg[18] BGEQ reg[19] THEN GOTO label_6
   lw $t0 -72($sp)
   lw $t1 -76($sp)
    bge $t0 $t1 label_6

#------------69  FACTOR_VAR INT i save in reg[20]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------70  FACTOR_CON INT 5 save in reg[21]
   li $t0 5
   sw $t0 -84($sp)

#------------71  reg[22] = reg[20] JIAN reg[21]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   subu $t2 $t0 $t1
   sw $t2 -88($sp)

#------------72  ASSIGN INT i = reg[22]
   lw $t3 -88($sp)
   sw $t3 0($sp)










#------------82  FACTOR_CON INT 0 save in reg[32]
   li $t0 0
   sw $t0 -128($sp)

#------------83  IF reg[32] BNE reg[0] THEN GOTO label_5
   lw $t0 -128($sp)
    bne $t0 $0 label_5

#------------84  FACTOR_VAR_EXTERN INT var1 save in reg[33]
   lw $t3 .var_var1
   sw $t3 -132($sp)

#------------85  WRITE INT reg[33]
   li $v0 1
   lw $a0 -132($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------86  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------87  FUNC INT exptest(0)
   jr $ra

.func_exptest:

#------------88  VAR INT a

#------------89  VAR INT c

#------------90  VAR CHAR b

#------------91  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------92  READ CHAR b
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------93  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -12($sp)






#------------99  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -36($sp)

#------------100  reg[8] = reg[1] CHENG reg[7]
   lw $t0 -12($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -40($sp)

#------------101  FACTOR_CON INT 5 save in reg[9]
   li $t0 5
   sw $t0 -44($sp)

#------------102  reg[10] = reg[8] CHU reg[9]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -48($sp)

#------------103  ASSIGN INT a = reg[10]
   lw $t3 -48($sp)
   sw $t3 0($sp)



#------------106  FACTOR_CON INT -97 save in reg[13]
   li $t0 -97
   sw $t0 -60($sp)

#------------107  FACTOR_VAR CHAR b save in reg[14]
   lw $t3 -8($sp)
   sw $t3 -64($sp)

#------------108  reg[15] = reg[13] JIA reg[14]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   addu $t2 $t0 $t1
   sw $t2 -68($sp)

#------------109  ASSIGN INT c = reg[15]
   lw $t3 -68($sp)
   sw $t3 -4($sp)

#------------110  FACTOR_VAR INT c save in reg[16]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------111  FACTOR_VAR CHAR b save in reg[17]
   lw $t3 -8($sp)
   sw $t3 -76($sp)

#------------112  reg[18] = reg[16] JIA reg[17]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   addu $t2 $t0 $t1
   sw $t2 -80($sp)

#------------113  RETURN reg[18] TO $V0 AND THEN GOTO 0
   lw $v0 -80($sp)
   jr $ra

#------------114  FUNC INT arraytest(0)
   jr $ra

.func_arraytest:

#------------115  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------116  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------117  ASSIGN_ARR_EXTERN INT varray[reg[1]] = reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------118  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------119  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -12($sp)

#------------120  ASSIGN_ARR_EXTERN INT varray[reg[3]] = reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------121  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -16($sp)

#------------122  FACTOR_CON INT 3 save in reg[6]
   li $t0 3
   sw $t0 -20($sp)

#------------123  ASSIGN_ARR_EXTERN INT varray[reg[5]] = reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------124  FACTOR_CON INT 3 save in reg[7]
   li $t0 3
   sw $t0 -24($sp)

#------------125  FACTOR_CON INT 4 save in reg[8]
   li $t0 4
   sw $t0 -28($sp)

#------------126  ASSIGN_ARR_EXTERN INT varray[reg[7]] = reg[8]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------127  FACTOR_CON INT 4 save in reg[9]
   li $t0 4
   sw $t0 -32($sp)

#------------128  FACTOR_CON INT 5 save in reg[10]
   li $t0 5
   sw $t0 -36($sp)

#------------129  ASSIGN_ARR_EXTERN INT varray[reg[9]] = reg[10]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------130  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -40($sp)

#------------131  FACTOR_ARRAY_EXTERN INT varray [reg[11]] save in reg[12]
   lw $t3 -40($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -44($sp)

#------------132  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -48($sp)

#------------133  FACTOR_ARRAY_EXTERN INT varray [reg[13]] save in reg[14]
   lw $t3 -48($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -52($sp)

#------------134  FACTOR_ARRAY_EXTERN INT varray [reg[14]] save in reg[15]
   lw $t3 -52($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -56($sp)

#------------135  reg[16] = reg[12] JIA reg[15]
   lw $t0 -44($sp)
   lw $t1 -56($sp)
   addu $t2 $t0 $t1
   sw $t2 -60($sp)

#------------136  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -64($sp)

#------------137  FACTOR_ARRAY_EXTERN INT varray [reg[17]] save in reg[18]
   lw $t3 -64($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -68($sp)

#------------138  reg[19] = reg[16] JIA reg[18]
   lw $t0 -60($sp)
   lw $t1 -68($sp)
   addu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------139  FACTOR_CON INT 3 save in reg[20]
   li $t0 3
   sw $t0 -76($sp)

#------------140  FACTOR_ARRAY_EXTERN INT varray [reg[20]] save in reg[21]
   lw $t3 -76($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -80($sp)

#------------141  reg[22] = reg[19] JIA reg[21]
   lw $t0 -72($sp)
   lw $t1 -80($sp)
   addu $t2 $t0 $t1
   sw $t2 -84($sp)

#------------142  FACTOR_EXPR reg[22] save in reg[23]
   lw $t0 -84($sp)
   sw $t0 -88($sp)

#------------143  FACTOR_CON INT 4 save in reg[24]
   li $t0 4
   sw $t0 -92($sp)

#------------144  FACTOR_ARRAY_EXTERN INT varray [reg[24]] save in reg[25]
   lw $t3 -92($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -96($sp)

#------------145  reg[26] = reg[23] CHENG reg[25]
   lw $t0 -88($sp)
   lw $t1 -96($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -100($sp)

#------------146  RETURN reg[26] TO $V0 AND THEN GOTO 0
   lw $v0 -100($sp)
   jr $ra

#------------147  FUNC INT fib(1)
   jr $ra

.func_fib:

#------------148  PARA INT a

#------------149  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------150  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------151  IF reg[1] BNE reg[2] THEN GOTO label_7
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_7

#------------152  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------153  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------154  JUMP to label_8
   j label_8

#------------155  label_7    ----------------Label----------------
label_7:

#------------156  label_8    ----------------Label----------------
label_8:

#------------157  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------158  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -20($sp)

#------------159  IF reg[4] BNE reg[5] THEN GOTO label_9
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_9

#------------160  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------161  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------162  JUMP to label_10
   j label_10

#------------163  label_9    ----------------Label----------------
label_9:

#------------164  label_10    ----------------Label----------------
label_10:

#------------165  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------166  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -32($sp)

#------------167  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   subu $t2 $t0 $t1
   sw $t2 -36($sp)

#------------168  PUSH INT parareg[0] from reg[9]
   sw $ra -40($sp)
   lw $t0 -36($sp)
   sw $t0 -44($sp)

#------------169  CALL INT fib(1)
   addiu $sp $sp -44
   jal .func_fib
   subiu $sp $sp -44
   lw $ra -40($sp)

#------------170  FACTOR_FUNC INT fib save in reg[10]
   sw $v0 -40($sp)

#------------171  FACTOR_VAR INT a save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------172  FACTOR_CON INT 2 save in reg[12]
   li $t0 2
   sw $t0 -48($sp)

#------------173  reg[13] = reg[11] JIAN reg[12]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   subu $t2 $t0 $t1
   sw $t2 -52($sp)

#------------174  PUSH INT parareg[1] from reg[13]
   sw $ra -56($sp)
   lw $t0 -52($sp)
   sw $t0 -60($sp)

#------------175  CALL INT fib(1)
   addiu $sp $sp -60
   jal .func_fib
   subiu $sp $sp -60
   lw $ra -56($sp)

#------------176  FACTOR_FUNC INT fib save in reg[14]
   sw $v0 -56($sp)

#------------177  reg[15] = reg[10] JIA reg[14]
   lw $t0 -40($sp)
   lw $t1 -56($sp)
   addu $t2 $t0 $t1
   sw $t2 -60($sp)

#------------178  RETURN reg[15] TO $V0 AND THEN GOTO 0
   lw $v0 -60($sp)
   jr $ra

#------------179  FUNC VOID whiletest(1)
   jr $ra

.func_whiletest:

#------------180  PARA INT a

#------------181  label_11    ----------------Label----------------
label_11:

#------------182  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------183  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------184  IF reg[1] BLEQ reg[2] THEN GOTO label_12
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    ble $t0 $t1 label_12

#------------185  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------186  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -16($sp)

#------------187  reg[5] = reg[3] JIAN reg[4]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   subu $t2 $t0 $t1
   sw $t2 -20($sp)

#------------188  ASSIGN INT a = reg[5]
   lw $t3 -20($sp)
   sw $t3 0($sp)

#------------189  JUMP to label_11
   j label_11

#------------190  label_12    ----------------Label----------------
label_12:

#------------191  FACTOR_VAR INT a save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)



#------------194  FACTOR_CON INT -2 save in reg[9]
   li $t0 -2
   sw $t0 -36($sp)

#------------195  IF reg[6] BNE reg[9] THEN GOTO label_17
   lw $t0 -24($sp)
   lw $t1 -36($sp)
    bne $t0 $t1 label_17

#------------196  label_13    ----------------Label----------------
label_13:

#------------197  FACTOR_CON INT 15 save in reg[10]
   li $t0 15
   sw $t0 -40($sp)

#------------198  FACTOR_VAR INT a save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------199  IF reg[10] BLEQ reg[11] THEN GOTO label_16
   lw $t0 -40($sp)
   lw $t1 -44($sp)
    ble $t0 $t1 label_16

#------------200  FACTOR_VAR INT a save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------201  FACTOR_CON INT 5 save in reg[13]
   li $t0 5
   sw $t0 -52($sp)

#------------202  reg[14] = reg[12] JIA reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   addu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------203  ASSIGN INT a = reg[14]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------204  FACTOR_VAR INT a save in reg[15]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------205  FACTOR_CON INT 13 save in reg[16]
   li $t0 13
   sw $t0 -64($sp)

#------------206  IF reg[15] BNE reg[16] THEN GOTO label_14
   lw $t0 -60($sp)
   lw $t1 -64($sp)
    bne $t0 $t1 label_14

#------------207  FACTOR_VAR INT a save in reg[17]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------208  FACTOR_CON INT 2 save in reg[18]
   li $t0 2
   sw $t0 -72($sp)

#------------209  reg[19] = reg[17] JIA reg[18]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   addu $t2 $t0 $t1
   sw $t2 -76($sp)

#------------210  ASSIGN INT a = reg[19]
   lw $t3 -76($sp)
   sw $t3 0($sp)

#------------211  JUMP to label_15
   j label_15

#------------212  label_14    ----------------Label----------------
label_14:

#------------213  label_15    ----------------Label----------------
label_15:

#------------214  JUMP to label_13
   j label_13

#------------215  label_16    ----------------Label----------------
label_16:

#------------216  JUMP to label_18
   j label_18

#------------217  label_17    ----------------Label----------------
label_17:

#------------218  label_18    ----------------Label----------------
label_18:

#------------219  FACTOR_VAR INT a save in reg[20]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------220  WRITE INT reg[20]
   li $v0 1
   lw $a0 -80($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------221  FUNC VOID calltest3(4)
   jr $ra

.func_calltest3:

#------------222  PARA CHAR a

#------------223  PARA CHAR b

#------------224  PARA CHAR c

#------------225  PARA CHAR d

#------------226  FACTOR_VAR_EXTERN INT var2 save in reg[1]
   lw $t3 .var_var2
   sw $t3 -16($sp)

#------------227  FACTOR_CON INT 100 save in reg[2]
   li $t0 100
   sw $t0 -20($sp)

#------------228  reg[3] = reg[1] JIAN reg[2]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   subu $t2 $t0 $t1
   sw $t2 -24($sp)

#------------229  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -28($sp)

#------------230  FACTOR_ARRAY_EXTERN INT varray [reg[4]] save in reg[5]
   lw $t3 -28($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -32($sp)

#------------231  reg[6] = reg[3] JIA reg[5]
   lw $t0 -24($sp)
   lw $t1 -32($sp)
   addu $t2 $t0 $t1
   sw $t2 -36($sp)

#------------232  IF reg[6] BEQ reg[0] THEN GOTO label_21
   lw $t0 -36($sp)
    beq $t0 $0 label_21

#------------233  FACTOR_VAR CHAR a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------234  FACTOR_CON CHAR 97 save in reg[8]
   li $t0 97
   sw $t0 -44($sp)

#------------235  IF reg[7] BNE reg[8] THEN GOTO label_19
   lw $t0 -40($sp)
   lw $t1 -44($sp)
    bne $t0 $t1 label_19

#------------236  FACTOR_VAR CHAR a save in reg[9]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------237  FACTOR_VAR CHAR b save in reg[10]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------238  reg[11] = reg[9] JIA reg[10]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   addu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------239  FACTOR_VAR CHAR c save in reg[12]
   lw $t3 -8($sp)
   sw $t3 -60($sp)

#------------240  reg[13] = reg[11] JIA reg[12]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   addu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------241  FACTOR_VAR CHAR d save in reg[14]
   lw $t3 -12($sp)
   sw $t3 -68($sp)

#------------242  reg[15] = reg[13] JIA reg[14]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   addu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------243  FACTOR_CON INT 0 save in reg[16]
   li $t0 0
   sw $t0 -76($sp)

#------------244  reg[17] = reg[15] JIA reg[16]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   addu $t2 $t0 $t1
   sw $t2 -80($sp)

#------------245  WRITE INT reg[17]
   li $v0 1
   lw $a0 -80($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------246  JUMP to label_20
   j label_20

#------------247  label_19    ----------------Label----------------
label_19:

#------------248  label_20    ----------------Label----------------
label_20:

#------------249  JUMP to label_22
   j label_22

#------------250  label_21    ----------------Label----------------
label_21:

#------------251  label_22    ----------------Label----------------
label_22:

#------------252  FUNC VOID calltest2(0)
   jr $ra

.func_calltest2:

#------------253  FACTOR_CON INT 100 save in reg[1]
   li $t0 100
   sw $t0 0($sp)

#------------254  ASSIGN_EXTERN INT var2 = reg[1]
   lw $t3 0($sp)
   sw $t3 .var_var2

#------------255  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -4($sp)

#------------256  FACTOR_CON CHAR 42 save in reg[3]
   li $t0 42
   sw $t0 -8($sp)

#------------257  FACTOR_CON CHAR 43 save in reg[4]
   li $t0 43
   sw $t0 -12($sp)

#------------258  FACTOR_CON CHAR 56 save in reg[5]
   li $t0 56
   sw $t0 -16($sp)

#------------259  PUSH INT parareg[2] from reg[2]
   sw $ra -20($sp)
   lw $t0 -4($sp)
   sw $t0 -24($sp)

#------------260  PUSH INT parareg[3] from reg[3]
   lw $t0 -8($sp)
   sw $t0 -28($sp)

#------------261  PUSH INT parareg[4] from reg[4]
   lw $t0 -12($sp)
   sw $t0 -32($sp)

#------------262  PUSH INT parareg[5] from reg[5]
   lw $t0 -16($sp)
   sw $t0 -36($sp)

#------------263  CALL VOID calltest3(4)
   addiu $sp $sp -24
   jal .func_calltest3
   subiu $sp $sp -24
   lw $ra -20($sp)

#------------264  FACTOR_CON INT 30 save in reg[6]
   li $t0 30
   sw $t0 -20($sp)

#------------265  ASSIGN_EXTERN INT var2 = reg[6]
   lw $t3 -20($sp)
   sw $t3 .var_var2

#------------266  FUNC INT calltest1(0)
   jr $ra

.func_calltest1:

#------------267  CALL VOID calltest2(0)
   sw $ra 0($sp)
   addiu $sp $sp -4
   jal .func_calltest2
   subiu $sp $sp -4
   lw $ra 0($sp)

#------------268  FACTOR_CON INT 50 save in reg[1]
   li $t0 50
   sw $t0 0($sp)

#------------269  ASSIGN_EXTERN INT var2 = reg[1]
   lw $t3 0($sp)
   sw $t3 .var_var2

#------------270  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -4($sp)

#------------271  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------272  FUNC CHAR chartest(0)
   jr $ra

.func_chartest:

#------------273  FACTOR_CON CHAR 72 save in reg[1]
   li $t0 72
   sw $t0 0($sp)

#------------274  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------275  FUNC CHAR chara(1)
   jr $ra

.func_chara:

#------------276  PARA INT x

#------------277  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------278  FACTOR_CON INT 97 save in reg[2]
   li $t0 97
   sw $t0 -8($sp)

#------------279  IF reg[1] BNE reg[2] THEN GOTO label_23
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_23

#------------280  FACTOR_CON CHAR 97 save in reg[3]
   li $t0 97
   sw $t0 -12($sp)

#------------281  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------282  JUMP to label_24
   j label_24

#------------283  label_23    ----------------Label----------------
label_23:

#------------284  FACTOR_CON CHAR 122 save in reg[4]
   li $t0 122
   sw $t0 -16($sp)

#------------285  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------286  label_24    ----------------Label----------------
label_24:

#------------287  FUNC VOID main(0)
   jr $ra

.func_main:

#------------288  VAR INT result

#------------289  VAR INT fibnum

#------------290  FACTOR_CON INT 10 save in reg[5]
   li $t0 10
   sw $t0 -24($sp)

#------------291  FACTOR_CON INT 20 save in reg[6]
   li $t0 20
   sw $t0 -28($sp)

#------------292  PUSH INT parareg[6] from reg[5]
   sw $ra -32($sp)
   lw $t0 -24($sp)
   sw $t0 -36($sp)

#------------293  PUSH INT parareg[7] from reg[6]
   lw $t0 -28($sp)
   sw $t0 -40($sp)

#------------294  CALL INT add(2)
   addiu $sp $sp -36
   jal .func_add
   subiu $sp $sp -36
   lw $ra -32($sp)

#------------295  FACTOR_FUNC INT add save in reg[7]
   sw $v0 -32($sp)

#------------296  ASSIGN INT result = reg[7]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------297  CALL INT exptest(0)
   sw $ra -36($sp)
   addiu $sp $sp -40
   jal .func_exptest
   subiu $sp $sp -40
   lw $ra -36($sp)

#------------298  FACTOR_FUNC INT exptest save in reg[8]
   sw $v0 -36($sp)

#------------299  FACTOR_VAR INT result save in reg[9]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------300  reg[10] = reg[8] JIA reg[9]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   addu $t2 $t0 $t1
   sw $t2 -44($sp)

#------------301  CALL INT arraytest(0)
   sw $ra -48($sp)
   addiu $sp $sp -52
   jal .func_arraytest
   subiu $sp $sp -52
   lw $ra -48($sp)

#------------302  FACTOR_FUNC INT arraytest save in reg[11]
   sw $v0 -48($sp)

#------------303  reg[12] = reg[10] JIA reg[11]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   addu $t2 $t0 $t1
   sw $t2 -52($sp)

#------------304  WRITE INT reg[12]
   li $v0 1
   lw $a0 -52($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------305  READ INT fibnum
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------306  FACTOR_VAR INT fibnum save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -56($sp)

#------------307  FACTOR_CON INT 10 save in reg[14]
   li $t0 10
   sw $t0 -60($sp)

#------------308  IF reg[13] BLEQ reg[14] THEN GOTO label_25
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    ble $t0 $t1 label_25

#------------309  WRITE fibnum is too big
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------310  JUMP to label_28
   j label_28

#------------311  label_25    ----------------Label----------------
label_25:

#------------312  FACTOR_VAR INT fibnum save in reg[15]
   lw $t3 -4($sp)
   sw $t3 -64($sp)

#------------313  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -68($sp)

#------------314  IF reg[15] BGEQ reg[16] THEN GOTO label_26
   lw $t0 -64($sp)
   lw $t1 -68($sp)
    bge $t0 $t1 label_26

#------------315  WRITE fibnum is too small
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------316  JUMP to label_27
   j label_27

#------------317  label_26    ----------------Label----------------
label_26:

#------------318  FACTOR_VAR INT fibnum save in reg[17]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------319  PUSH INT parareg[8] from reg[17]
   sw $ra -76($sp)
   lw $t0 -72($sp)
   sw $t0 -80($sp)

#------------320  CALL INT fib(1)
   addiu $sp $sp -80
   jal .func_fib
   subiu $sp $sp -80
   lw $ra -76($sp)

#------------321  FACTOR_FUNC INT fib save in reg[18]
   sw $v0 -76($sp)

#------------322  WRITE fib number is:
   li $v0 4
   la $a0 .str_2
   syscall

#------------323  WRITE INT reg[18]
   li $v0 1
   lw $a0 -76($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------324  label_27    ----------------Label----------------
label_27:

#------------325  label_28    ----------------Label----------------
label_28:

#------------326  FACTOR_CON INT 10 save in reg[19]
   li $t0 10
   sw $t0 -80($sp)

#------------327  PUSH INT parareg[9] from reg[19]
   sw $ra -84($sp)
   lw $t0 -80($sp)
   sw $t0 -88($sp)

#------------328  CALL VOID whiletest(1)
   addiu $sp $sp -88
   jal .func_whiletest
   subiu $sp $sp -88
   lw $ra -84($sp)

#------------329  CALL VOID fortest(0)
   sw $ra -84($sp)
   addiu $sp $sp -88
   jal .func_fortest
   subiu $sp $sp -88
   lw $ra -84($sp)

#------------330  READ_EXTERN CHAR var4
   li $v0 12
   syscall
   sw $v0 .var_var4



#------------333  FACTOR_CON INT 0 save in reg[22]
   li $t0 0
   sw $t0 -92($sp)

#------------334  FACTOR_CON INT 0 save in reg[23]
   li $t0 0
   sw $t0 -96($sp)

#------------335  FACTOR_ARRAY_EXTERN INT varray [reg[23]] save in reg[24]
   lw $t3 -96($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -100($sp)

#------------336  reg[25] = reg[22] JIA reg[24]
   lw $t0 -92($sp)
   lw $t1 -100($sp)
   addu $t2 $t0 $t1
   sw $t2 -104($sp)

#------------337  FACTOR_CON INT 1 save in reg[26]
   li $t0 1
   sw $t0 -108($sp)

#------------338  reg[27] = reg[25] JIAN reg[26]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   subu $t2 $t0 $t1
   sw $t2 -112($sp)

#------------339  IF reg[27] BEQ reg[0] THEN GOTO label_29
   lw $t0 -112($sp)
    beq $t0 $0 label_29

#------------340  WRITE error
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------341  JUMP to label_30
   j label_30

#------------342  label_29    ----------------Label----------------
label_29:

#------------343  label_30    ----------------Label----------------
label_30:

#------------344  FACTOR_CON INT 1 save in reg[28]
   li $t0 1
   sw $t0 -116($sp)

#------------345  IF reg[28] BEQ reg[0] THEN GOTO label_33
   lw $t0 -116($sp)
    beq $t0 $0 label_33

#------------346  FACTOR_VAR_EXTERN CHAR var4 save in reg[29]
   lw $t3 .var_var4
   sw $t3 -120($sp)

#------------347  FACTOR_CON INT 0 save in reg[30]
   li $t0 0
   sw $t0 -124($sp)

#------------348  reg[31] = reg[29] JIA reg[30]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   addu $t2 $t0 $t1
   sw $t2 -128($sp)

#------------349  PUSH INT parareg[10] from reg[31]
   sw $ra -132($sp)
   lw $t0 -128($sp)
   sw $t0 -136($sp)

#------------350  CALL CHAR chara(1)
   addiu $sp $sp -136
   jal .func_chara
   subiu $sp $sp -136
   lw $ra -132($sp)

#------------351  FACTOR_FUNC CHAR chara save in reg[32]
   sw $v0 -132($sp)

#------------352  FACTOR_CON CHAR 97 save in reg[33]
   li $t0 97
   sw $t0 -136($sp)

#------------353  IF reg[32] BNE reg[33] THEN GOTO label_31
   lw $t0 -132($sp)
   lw $t1 -136($sp)
    bne $t0 $t1 label_31

#------------354  WRITE your input is correct!
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------355  JUMP to label_32
   j label_32

#------------356  label_31    ----------------Label----------------
label_31:

#------------357  WRITE error!
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------358  label_32    ----------------Label----------------
label_32:

#------------359  JUMP to label_34
   j label_34

#------------360  label_33    ----------------Label----------------
label_33:

#------------361  label_34    ----------------Label----------------
label_34:

#------------362  WRITE ! #$%&'()*+,-./0123456789:;<=>?@ABCXYZabcxyz[\]^_{|}~
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------363  CALL CHAR chartest(0)
   sw $ra -140($sp)
   addiu $sp $sp -144
   jal .func_chartest
   subiu $sp $sp -144
   lw $ra -140($sp)

#------------364  FACTOR_FUNC CHAR chartest save in reg[34]
   sw $v0 -140($sp)

#------------365  WRITE CHAR reg[34]
   li $v0 11
   lw $a0 -140($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------366  CALL INT calltest1(0)
   sw $ra -144($sp)
   addiu $sp $sp -148
   jal .func_calltest1
   subiu $sp $sp -148
   lw $ra -144($sp)

   jr $ra

end:
