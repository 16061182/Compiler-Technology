.data
   .var_num5: .word 0
   .var_num6: .word 0
   .var_array1: .space 36
   .var_char3: .word 0
   .var_char4: .word 0
   .var_array2: .space 40
   .var_testresult: .space 40
   .str_0: .asciiz "this is a string, !#$%&'()*+,-./0123456789:;<=>?@[\\]^_`{|}~|"
   .str_1: .asciiz "this is a string "
.text
   jal .func_main
   j end
#------------13  FUNC INT return1(0)
.func_return1:

#------------14  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------15  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------16  FUNC INT factorial(1)
   jr $ra

.func_factorial:

#------------17  PARA INT n

#------------18  FACTOR_VAR INT n save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------19  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------20  IF reg[1] BNE reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_0

#------------21  FACTOR_VAR INT n save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------22  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------23  JUMP to label_1
   j label_1

#------------24  label_0    ----------------Label----------------
label_0:

#------------25  FACTOR_VAR INT n save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------26  FACTOR_VAR INT n save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------27  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------28  reg[6] = reg[5] JIAN reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -24($sp)

#------------29  PUSH INT parareg[0] from reg[6]
   sw $ra -28($sp)
   lw $t0 -24($sp)
   sw $t0 -32($sp)

#------------30  CALL INT factorial(1)
   addi $sp $sp -32
   jal .func_factorial
   subi $sp $sp -32
   lw $ra -28($sp)

#------------31  FACTOR_FUNC INT factorial save in reg[7]
   sw $v0 -28($sp)

#------------32  reg[7] = reg[4] CHENG reg[7]
   lw $t0 -16($sp)
   lw $t1 -28($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -28($sp)

#------------33  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------34  label_1    ----------------Label----------------
label_1:

#------------35  FUNC VOID testvar(0)
   jr $ra

.func_testvar:

#------------36  CONST INT char2 = -109

#------------37  VAR CHAR num1

#------------38  VAR INT array2

#------------39  ARRAY INT char1[10]

#------------40  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 -48($sp)

#------------41  ASSIGN INT array2 = reg[1]
   lw $t3 -48($sp)
   sw $t3 -4($sp)

#------------42  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -52($sp)

#------------43  ASSIGN CHAR num1 = reg[2]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------44  FUNC INT testfor(6)
   jr $ra

.func_testfor:

#------------45  PARA INT a

#------------46  PARA CHAR b

#------------47  PARA INT c

#------------48  PARA CHAR d

#------------49  PARA INT f

#------------50  PARA CHAR e

#------------51  VAR INT i

#------------52  FACTOR_CON INT 9 save in reg[1]
   li $t0 9
   sw $t0 -28($sp)

#------------53  ASSIGN INT a = reg[1]
   lw $t3 -28($sp)
   sw $t3 0($sp)

#------------54  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -32($sp)

#------------55  ASSIGN INT c = reg[2]
   lw $t3 -32($sp)
   sw $t3 -8($sp)

#------------56  FACTOR_CON INT 100 save in reg[3]
   li $t0 100
   sw $t0 -36($sp)

#------------57  ASSIGN INT i = reg[3]
   lw $t3 -36($sp)
   sw $t3 -24($sp)

#------------58  JUMP to label_3
   j label_3

#------------59  label_2    ----------------Label----------------
label_2:

#------------60  FACTOR_VAR INT i save in reg[4]
   lw $t3 -24($sp)
   sw $t3 -40($sp)

#------------61  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -44($sp)

#------------62  reg[5] = reg[4] JIAN reg[5]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------63  ASSIGN INT i = reg[5]
   lw $t3 -44($sp)
   sw $t3 -24($sp)

#------------64  FACTOR_VAR INT i save in reg[6]
   lw $t3 -24($sp)
   sw $t3 -48($sp)

#------------65  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -52($sp)

#------------66  IF reg[6] BGEQ reg[7] THEN GOTO label_4
   lw $t0 -48($sp)
   lw $t1 -52($sp)
    bge $t0 $t1 label_4

#------------67  label_3    ----------------Label----------------
label_3:

#------------68  FACTOR_VAR INT a save in reg[8]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------69  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -60($sp)

#------------70  reg[9] = reg[8] JIA reg[9]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------71  ASSIGN INT a = reg[9]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------72  JUMP to label_2
   j label_2

#------------73  label_4    ----------------Label----------------
label_4:

#------------74  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -64($sp)

#------------75  ASSIGN INT i = reg[10]
   lw $t3 -64($sp)
   sw $t3 -24($sp)

#------------76  JUMP to label_6
   j label_6

#------------77  label_5    ----------------Label----------------
label_5:

#------------78  FACTOR_VAR INT i save in reg[11]
   lw $t3 -24($sp)
   sw $t3 -68($sp)

#------------79  FACTOR_CON INT 1 save in reg[12]
   li $t0 1
   sw $t0 -72($sp)

#------------80  reg[12] = reg[11] JIA reg[12]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------81  ASSIGN INT i = reg[12]
   lw $t3 -72($sp)
   sw $t3 -24($sp)

#------------82  FACTOR_VAR INT i save in reg[13]
   lw $t3 -24($sp)
   sw $t3 -76($sp)

#------------83  FACTOR_CON INT 10 save in reg[14]
   li $t0 10
   sw $t0 -80($sp)

#------------84  IF reg[13] BGEQ reg[14] THEN GOTO label_7
   lw $t0 -76($sp)
   lw $t1 -80($sp)
    bge $t0 $t1 label_7

#------------85  label_6    ----------------Label----------------
label_6:

#------------86  FACTOR_VAR INT c save in reg[15]
   lw $t3 -8($sp)
   sw $t3 -84($sp)

#------------87  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -88($sp)

#------------88  reg[16] = reg[15] JIA reg[16]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   add $t2 $t0 $t1
   sw $t2 -88($sp)

#------------89  ASSIGN INT c = reg[16]
   lw $t3 -88($sp)
   sw $t3 -8($sp)

#------------90  JUMP to label_5
   j label_5

#------------91  label_7    ----------------Label----------------
label_7:

#------------92  FACTOR_VAR INT a save in reg[17]
   lw $t3 0($sp)
   sw $t3 -92($sp)

#------------93  FACTOR_CON INT 10 save in reg[18]
   li $t0 10
   sw $t0 -96($sp)

#------------94  IF reg[17] BNE reg[18] THEN GOTO label_10
   lw $t0 -92($sp)
   lw $t1 -96($sp)
    bne $t0 $t1 label_10

#------------95  FACTOR_VAR INT c save in reg[19]
   lw $t3 -8($sp)
   sw $t3 -100($sp)

#------------96  FACTOR_CON INT 10 save in reg[20]
   li $t0 10
   sw $t0 -104($sp)

#------------97  IF reg[19] BNE reg[20] THEN GOTO label_8
   lw $t0 -100($sp)
   lw $t1 -104($sp)
    bne $t0 $t1 label_8

#------------98  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -108($sp)

#------------99  RETURN reg[21] TO $V0 AND THEN GOTO 0
   lw $v0 -108($sp)
   jr $ra

#------------100  JUMP to label_9
   j label_9

#------------101  label_8    ----------------Label----------------
label_8:

#------------102  label_9    ----------------Label----------------
label_9:

#------------103  JUMP to label_11
   j label_11

#------------104  label_10    ----------------Label----------------
label_10:

#------------105  label_11    ----------------Label----------------
label_11:

#------------106  FACTOR_CON INT 0 save in reg[22]
   li $t0 0
   sw $t0 -112($sp)

#------------107  RETURN reg[22] TO $V0 AND THEN GOTO 0
   lw $v0 -112($sp)
   jr $ra

#------------108  FUNC INT testwhile(0)
   jr $ra

.func_testwhile:

#------------109  VAR INT num1

#------------110  VAR INT num2

#------------111  VAR INT num3

#------------112  VAR INT num4

#------------113  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -16($sp)

#------------114  ASSIGN INT num1 = reg[1]
   lw $t3 -16($sp)
   sw $t3 0($sp)

#------------115  FACTOR_CON INT 10 save in reg[2]
   li $t0 10
   sw $t0 -20($sp)

#------------116  ASSIGN INT num2 = reg[2]
   lw $t3 -20($sp)
   sw $t3 -4($sp)

#------------117  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -24($sp)

#------------118  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -28($sp)

#------------119  reg[4] = reg[4] JIAN reg[3]
   lw $t0 -28($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -28($sp)

#------------120  ASSIGN INT num3 = reg[4]
   lw $t3 -28($sp)
   sw $t3 -8($sp)

#------------121  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -32($sp)

#------------122  ASSIGN INT num4 = reg[5]
   lw $t3 -32($sp)
   sw $t3 -12($sp)

#------------123  label_12    ----------------Label----------------
label_12:

#------------124  FACTOR_VAR INT num1 save in reg[6]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------125  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -40($sp)

#------------126  IF reg[6] BEQ reg[7] THEN GOTO label_13
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    beq $t0 $t1 label_13

#------------127  FACTOR_VAR INT num2 save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -44($sp)

#------------128  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -48($sp)

#------------129  reg[9] = reg[8] JIAN reg[9]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   sub $t2 $t0 $t1
   sw $t2 -48($sp)

#------------130  ASSIGN INT num2 = reg[9]
   lw $t3 -48($sp)
   sw $t3 -4($sp)

#------------131  FACTOR_VAR INT num1 save in reg[10]
   lw $t3 0($sp)
   sw $t3 -52($sp)

#------------132  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -56($sp)

#------------133  reg[11] = reg[10] JIA reg[11]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------134  ASSIGN INT num1 = reg[11]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------135  JUMP to label_12
   j label_12

#------------136  label_13    ----------------Label----------------
label_13:

#------------137  label_14    ----------------Label----------------
label_14:

#------------138  FACTOR_VAR INT num3 save in reg[12]
   lw $t3 -8($sp)
   sw $t3 -60($sp)

#------------139  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -64($sp)

#------------140  IF reg[12] BLEQ reg[13] THEN GOTO label_15
   lw $t0 -60($sp)
   lw $t1 -64($sp)
    ble $t0 $t1 label_15

#------------141  FACTOR_VAR INT num4 save in reg[14]
   lw $t3 -12($sp)
   sw $t3 -68($sp)

#------------142  FACTOR_CON INT 10 save in reg[15]
   li $t0 10
   sw $t0 -72($sp)

#------------143  reg[15] = reg[14] JIA reg[15]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------144  ASSIGN INT num4 = reg[15]
   lw $t3 -72($sp)
   sw $t3 -12($sp)

#------------145  FACTOR_VAR INT num3 save in reg[16]
   lw $t3 -8($sp)
   sw $t3 -76($sp)

#------------146  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -80($sp)

#------------147  reg[17] = reg[16] JIAN reg[17]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   sub $t2 $t0 $t1
   sw $t2 -80($sp)

#------------148  ASSIGN INT num3 = reg[17]
   lw $t3 -80($sp)
   sw $t3 -8($sp)

#------------149  JUMP to label_14
   j label_14

#------------150  label_15    ----------------Label----------------
label_15:

#------------151  FACTOR_VAR INT num2 save in reg[18]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------152  FACTOR_CON INT 0 save in reg[19]
   li $t0 0
   sw $t0 -88($sp)

#------------153  IF reg[18] BNE reg[19] THEN GOTO label_18
   lw $t0 -84($sp)
   lw $t1 -88($sp)
    bne $t0 $t1 label_18

#------------154  FACTOR_VAR INT num4 save in reg[20]
   lw $t3 -12($sp)
   sw $t3 -92($sp)

#------------155  FACTOR_CON INT 0 save in reg[21]
   li $t0 0
   sw $t0 -96($sp)

#------------156  IF reg[20] BNE reg[21] THEN GOTO label_16
   lw $t0 -92($sp)
   lw $t1 -96($sp)
    bne $t0 $t1 label_16

#------------157  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -100($sp)

#------------158  RETURN reg[22] TO $V0 AND THEN GOTO 0
   lw $v0 -100($sp)
   jr $ra

#------------159  JUMP to label_17
   j label_17

#------------160  label_16    ----------------Label----------------
label_16:

#------------161  label_17    ----------------Label----------------
label_17:

#------------162  JUMP to label_19
   j label_19

#------------163  label_18    ----------------Label----------------
label_18:

#------------164  FACTOR_CON INT 0 save in reg[23]
   li $t0 0
   sw $t0 -104($sp)

#------------165  RETURN reg[23] TO $V0 AND THEN GOTO 0
   lw $v0 -104($sp)
   jr $ra

#------------166  label_19    ----------------Label----------------
label_19:

#------------167  FUNC INT testexpression(0)
   jr $ra

.func_testexpression:

#------------168  VAR INT a

#------------169  VAR INT c

#------------170  VAR CHAR b

#------------171  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 -12($sp)

#------------172  ASSIGN INT a = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------173  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -16($sp)

#------------174  ASSIGN CHAR b = reg[2]
   lw $t3 -16($sp)
   sw $t3 -8($sp)

#------------175  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -20($sp)

#------------176  FACTOR_CON INT 100 save in reg[4]
   li $t0 100
   sw $t0 -24($sp)

#------------177  ASSIGN_ARR_EXTERN INT array1[reg[3]] = reg[4]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------178  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -28($sp)

#------------179  FACTOR_CON INT 99 save in reg[6]
   li $t0 99
   sw $t0 -32($sp)

#------------180  ASSIGN_ARR_EXTERN INT array1[reg[5]] = reg[6]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------181  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------182  FACTOR_VAR CHAR b save in reg[8]
   lw $t3 -8($sp)
   sw $t3 -40($sp)

#------------183  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   sub $t2 $t0 $t1
   sw $t2 -40($sp)

#------------184  FACTOR_CON CHAR 97 save in reg[9]
   li $t0 97
   sw $t0 -44($sp)

#------------185  reg[9] = reg[8] JIA reg[9]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------186  FACTOR_EXPR reg[9] save in reg[10]
   lw $t0 -44($sp)
   sw $t0 -48($sp)

#------------187  CALL INT return1(0)
   sw $ra -52($sp)
   addi $sp $sp -56
   jal .func_return1
   subi $sp $sp -56
   lw $ra -52($sp)

#------------188  FACTOR_FUNC INT return1 save in reg[11]
   sw $v0 -52($sp)

#------------189  reg[11] = reg[10] CHENG reg[11]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -52($sp)

#------------190  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -56($sp)

#------------191  FACTOR_ARRAY_EXTERN INT array1 [reg[12]] save in reg[13]
   lw $t3 -56($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -60($sp)

#------------192  FACTOR_CON INT 10 save in reg[14]
   li $t0 10
   sw $t0 -64($sp)

#------------193  reg[14] = reg[13] CHU reg[14]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -64($sp)

#------------194  reg[14] = reg[11] JIAN reg[14]
   lw $t0 -52($sp)
   lw $t1 -64($sp)
   sub $t2 $t0 $t1
   sw $t2 -64($sp)

#------------195  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -68($sp)

#------------196  reg[15] = reg[14] JIA reg[15]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   add $t2 $t0 $t1
   sw $t2 -68($sp)

#------------197  ASSIGN INT c = reg[15]
   lw $t3 -68($sp)
   sw $t3 -4($sp)

#------------198  FACTOR_VAR INT c save in reg[16]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------199  FACTOR_ARRAY_EXTERN INT array1 [reg[16]] save in reg[17]
   lw $t3 -72($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -76($sp)

#------------200  FACTOR_CON INT 99 save in reg[18]
   li $t0 99
   sw $t0 -80($sp)

#------------201  IF reg[17] BNE reg[18] THEN GOTO label_20
   lw $t0 -76($sp)
   lw $t1 -80($sp)
    bne $t0 $t1 label_20

#------------202  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -84($sp)

#------------203  RETURN reg[19] TO $V0 AND THEN GOTO 0
   lw $v0 -84($sp)
   jr $ra

#------------204  JUMP to label_21
   j label_21

#------------205  label_20    ----------------Label----------------
label_20:

#------------206  label_21    ----------------Label----------------
label_21:

#------------207  FACTOR_CON INT 0 save in reg[20]
   li $t0 0
   sw $t0 -88($sp)

#------------208  RETURN reg[20] TO $V0 AND THEN GOTO 0
   lw $v0 -88($sp)
   jr $ra

#------------209  FUNC INT testarray(0)
   jr $ra

.func_testarray:

#------------210  VAR INT a

#------------211  VAR INT b

#------------212  VAR INT c

#------------213  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------214  ASSIGN INT a = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------215  FACTOR_CON INT 2 save in reg[2]
   li $t0 2
   sw $t0 -16($sp)

#------------216  ASSIGN INT b = reg[2]
   lw $t3 -16($sp)
   sw $t3 -4($sp)

#------------217  FACTOR_CON INT 3 save in reg[3]
   li $t0 3
   sw $t0 -20($sp)

#------------218  ASSIGN INT c = reg[3]
   lw $t3 -20($sp)
   sw $t3 -8($sp)

#------------219  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -24($sp)

#------------220  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -28($sp)

#------------221  ASSIGN_ARR_EXTERN INT array1[reg[4]] = reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------222  FACTOR_CON INT 4 save in reg[6]
   li $t0 4
   sw $t0 -32($sp)

#------------223  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -36($sp)

#------------224  FACTOR_ARRAY_EXTERN INT array1 [reg[7]] save in reg[8]
   lw $t3 -36($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -40($sp)

#------------225  ASSIGN_ARR_EXTERN INT array1[reg[6]] = reg[8]
   lw $t0 -32($sp)
   lw $t1 -40($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------226  FACTOR_VAR INT c save in reg[9]
   lw $t3 -8($sp)
   sw $t3 -44($sp)

#------------227  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------228  FACTOR_VAR INT b save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------229  CALL INT return1(0)
   sw $ra -56($sp)
   addi $sp $sp -60
   jal .func_return1
   subi $sp $sp -60
   lw $ra -56($sp)

#------------230  FACTOR_FUNC INT return1 save in reg[12]
   sw $v0 -56($sp)

#------------231  reg[12] = reg[11] JIA reg[12]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------232  FACTOR_EXPR reg[12] save in reg[13]
   lw $t0 -56($sp)
   sw $t0 -60($sp)

#------------233  reg[13] = reg[10] CHENG reg[13]
   lw $t0 -48($sp)
   lw $t1 -60($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -60($sp)

#------------234  reg[13] = reg[9] JIA reg[13]
   lw $t0 -44($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------235  FACTOR_CON INT 0 save in reg[14]
   li $t0 0
   sw $t0 -64($sp)

#------------236  FACTOR_ARRAY_EXTERN INT array1 [reg[14]] save in reg[15]
   lw $t3 -64($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -68($sp)

#------------237  FACTOR_CON INT 2 save in reg[16]
   li $t0 2
   sw $t0 -72($sp)

#------------238  reg[16] = reg[15] CHENG reg[16]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -72($sp)

#------------239  reg[16] = reg[13] JIAN reg[16]
   lw $t0 -60($sp)
   lw $t1 -72($sp)
   sub $t2 $t0 $t1
   sw $t2 -72($sp)

#------------240  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -76($sp)

#------------241  ASSIGN_ARR_EXTERN INT array1[reg[16]] = reg[17]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------242  FACTOR_CON INT 4 save in reg[18]
   li $t0 4
   sw $t0 -80($sp)

#------------243  FACTOR_ARRAY_EXTERN INT array1 [reg[18]] save in reg[19]
   lw $t3 -80($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -84($sp)

#------------244  FACTOR_CON INT 10 save in reg[20]
   li $t0 10
   sw $t0 -88($sp)

#------------245  IF reg[19] BNE reg[20] THEN GOTO label_22
   lw $t0 -84($sp)
   lw $t1 -88($sp)
    bne $t0 $t1 label_22

#------------246  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -92($sp)

#------------247  RETURN reg[21] TO $V0 AND THEN GOTO 0
   lw $v0 -92($sp)
   jr $ra

#------------248  JUMP to label_23
   j label_23

#------------249  label_22    ----------------Label----------------
label_22:

#------------250  label_23    ----------------Label----------------
label_23:

#------------251  FACTOR_CON INT 0 save in reg[22]
   li $t0 0
   sw $t0 -96($sp)

#------------252  RETURN reg[22] TO $V0 AND THEN GOTO 0
   lw $v0 -96($sp)
   jr $ra

#------------253  FUNC VOID testprintf(1)
   jr $ra

.func_testprintf:

#------------254  PARA INT flag

#------------255  FACTOR_VAR INT flag save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------256  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------257  IF reg[1] BGTR reg[2] THEN GOTO label_24
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bgt $t0 $t1 label_24

#------------258  WRITE this is a string, !#$%&'()*+,-./0123456789:;<=>?@[\]^_`{|}~|
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------259  JUMP to label_27
   j label_27

#------------260  label_24    ----------------Label----------------
label_24:

#------------261  FACTOR_VAR INT flag save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------262  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -16($sp)

#------------263  IF reg[3] BLSS reg[4] THEN GOTO label_25
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    blt $t0 $t1 label_25

#------------264  FACTOR_CON CHAR 97 save in reg[5]
   li $t0 97
   sw $t0 -20($sp)

#------------265  WRITE CHAR reg[5]
   li $v0 11
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------266  FACTOR_CON CHAR 50 save in reg[6]
   li $t0 50
   sw $t0 -24($sp)

#------------267  WRITE CHAR reg[6]
   li $v0 11
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------268  FACTOR_CON CHAR 42 save in reg[7]
   li $t0 42
   sw $t0 -28($sp)

#------------269  WRITE CHAR reg[7]
   li $v0 11
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------270  JUMP to label_26
   j label_26

#------------271  label_25    ----------------Label----------------
label_25:

#------------272  WRITE this is a string 
   li $v0 4
   la $a0 .str_1
   syscall

#------------273  FACTOR_CON INT 10 save in reg[8]
   li $t0 10
   sw $t0 -32($sp)

#------------274  FACTOR_CON INT 5 save in reg[9]
   li $t0 5
   sw $t0 -36($sp)

#------------275  reg[9] = reg[8] JIAN reg[9]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   sub $t2 $t0 $t1
   sw $t2 -36($sp)

#------------276  WRITE INT reg[9]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------277  label_26    ----------------Label----------------
label_26:

#------------278  label_27    ----------------Label----------------
label_27:

#------------279  FUNC CHAR testfactorial(0)
   jr $ra

.func_testfactorial:

#------------280  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------281  PUSH INT parareg[1] from reg[1]
   sw $ra -4($sp)
   lw $t0 0($sp)
   sw $t0 -8($sp)

#------------282  CALL INT factorial(1)
   addi $sp $sp -8
   jal .func_factorial
   subi $sp $sp -8
   lw $ra -4($sp)

#------------283  FACTOR_FUNC INT factorial save in reg[2]
   sw $v0 -4($sp)

#------------284  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------285  IF reg[2] BNE reg[3] THEN GOTO label_30
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_30

#------------286  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -12($sp)

#------------287  PUSH INT parareg[2] from reg[4]
   sw $ra -16($sp)
   lw $t0 -12($sp)
   sw $t0 -20($sp)

#------------288  CALL INT factorial(1)
   addi $sp $sp -20
   jal .func_factorial
   subi $sp $sp -20
   lw $ra -16($sp)

#------------289  FACTOR_FUNC INT factorial save in reg[5]
   sw $v0 -16($sp)

#------------290  FACTOR_CON INT 6 save in reg[6]
   li $t0 6
   sw $t0 -20($sp)

#------------291  IF reg[5] BNE reg[6] THEN GOTO label_28
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_28

#------------292  FACTOR_CON CHAR 84 save in reg[7]
   li $t0 84
   sw $t0 -24($sp)

#------------293  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------294  JUMP to label_29
   j label_29

#------------295  label_28    ----------------Label----------------
label_28:

#------------296  label_29    ----------------Label----------------
label_29:

#------------297  JUMP to label_31
   j label_31

#------------298  label_30    ----------------Label----------------
label_30:

#------------299  label_31    ----------------Label----------------
label_31:

#------------300  FACTOR_CON CHAR 70 save in reg[8]
   li $t0 70
   sw $t0 -28($sp)

#------------301  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------302  FUNC VOID main(0)
   jr $ra

.func_main:

#------------303  VAR INT i

#------------304  VAR INT flag

#------------305  FACTOR_CON INT 9 save in reg[9]
   li $t0 9
   sw $t0 -40($sp)

#------------306  ASSIGN_EXTERN INT num5 = reg[9]
   lw $t3 -40($sp)
   sw $t3 .var_num5

#------------307  FACTOR_CON INT 8 save in reg[10]
   li $t0 8
   sw $t0 -44($sp)

#------------308  ASSIGN_EXTERN INT num6 = reg[10]
   lw $t3 -44($sp)
   sw $t3 .var_num6

#------------309  FACTOR_CON CHAR 97 save in reg[11]
   li $t0 97
   sw $t0 -48($sp)

#------------310  ASSIGN_EXTERN CHAR char3 = reg[11]
   lw $t3 -48($sp)
   sw $t3 .var_char3

#------------311  FACTOR_CON CHAR 98 save in reg[12]
   li $t0 98
   sw $t0 -52($sp)

#------------312  ASSIGN_EXTERN CHAR char4 = reg[12]
   lw $t3 -52($sp)
   sw $t3 .var_char4

#------------313  READ INT flag
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------314  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -56($sp)

#------------315  ASSIGN INT i = reg[13]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------316  JUMP to label_33
   j label_33

#------------317  label_32    ----------------Label----------------
label_32:

#------------318  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------319  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -64($sp)

#------------320  reg[15] = reg[14] JIA reg[15]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   add $t2 $t0 $t1
   sw $t2 -64($sp)

#------------321  ASSIGN INT i = reg[15]
   lw $t3 -64($sp)
   sw $t3 0($sp)

#------------322  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------323  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -72($sp)

#------------324  IF reg[16] BGEQ reg[17] THEN GOTO label_34
   lw $t0 -68($sp)
   lw $t1 -72($sp)
    bge $t0 $t1 label_34

#------------325  label_33    ----------------Label----------------
label_33:

#------------326  FACTOR_VAR INT i save in reg[18]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------327  FACTOR_CON CHAR 84 save in reg[19]
   li $t0 84
   sw $t0 -80($sp)

#------------328  ASSIGN_ARR_EXTERN CHAR testresult[reg[18]] = reg[19]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------329  JUMP to label_32
   j label_32

#------------330  label_34    ----------------Label----------------
label_34:

#------------331  FACTOR_CON INT 9 save in reg[20]
   li $t0 9
   sw $t0 -84($sp)

#------------332  ASSIGN_EXTERN INT num5 = reg[20]
   lw $t3 -84($sp)
   sw $t3 .var_num5

#------------333  JUMP to label_36
   j label_36

#------------334  label_35    ----------------Label----------------
label_35:

#------------335  FACTOR_VAR_EXTERN INT num5 save in reg[21]
   lw $t3 .var_num5
   sw $t3 -88($sp)

#------------336  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -92($sp)

#------------337  reg[22] = reg[21] JIAN reg[22]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   sub $t2 $t0 $t1
   sw $t2 -92($sp)

#------------338  ASSIGN_EXTERN INT num5 = reg[22]
   lw $t3 -92($sp)
   sw $t3 .var_num5

#------------339  FACTOR_VAR_EXTERN INT num5 save in reg[23]
   lw $t3 .var_num5
   sw $t3 -96($sp)

#------------340  FACTOR_CON INT 0 save in reg[24]
   li $t0 0
   sw $t0 -100($sp)

#------------341  IF reg[23] BLSS reg[24] THEN GOTO label_37
   lw $t0 -96($sp)
   lw $t1 -100($sp)
    blt $t0 $t1 label_37

#------------342  label_36    ----------------Label----------------
label_36:

#------------343  FACTOR_VAR_EXTERN INT num5 save in reg[25]
   lw $t3 .var_num5
   sw $t3 -104($sp)

#------------344  FACTOR_VAR_EXTERN INT num5 save in reg[26]
   lw $t3 .var_num5
   sw $t3 -108($sp)

#------------345  FACTOR_ARRAY_EXTERN CHAR testresult [reg[26]] save in reg[27]
   lw $t3 -108($sp)
   sll $t3 $t3 2
   lw $t3 .var_testresult($t3)
   sw $t3 -112($sp)

#------------346  ASSIGN_ARR_EXTERN CHAR array2[reg[25]] = reg[27]
   lw $t0 -104($sp)
   lw $t1 -112($sp)
   sll $t0 $t0 2
   sw $t1 .var_array2($t0)

#------------347  JUMP to label_35
   j label_35

#------------348  label_37    ----------------Label----------------
label_37:

#------------349  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -116($sp)

#------------350  ASSIGN_EXTERN INT num6 = reg[28]
   lw $t3 -116($sp)
   sw $t3 .var_num6

#------------351  JUMP to label_39
   j label_39

#------------352  label_38    ----------------Label----------------
label_38:

#------------353  FACTOR_VAR_EXTERN INT num6 save in reg[29]
   lw $t3 .var_num6
   sw $t3 -120($sp)

#------------354  FACTOR_CON INT 1 save in reg[30]
   li $t0 1
   sw $t0 -124($sp)

#------------355  reg[30] = reg[29] JIA reg[30]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   add $t2 $t0 $t1
   sw $t2 -124($sp)

#------------356  ASSIGN_EXTERN INT num6 = reg[30]
   lw $t3 -124($sp)
   sw $t3 .var_num6

#------------357  FACTOR_VAR_EXTERN INT num6 save in reg[31]
   lw $t3 .var_num6
   sw $t3 -128($sp)

#------------358  FACTOR_CON INT 8 save in reg[32]
   li $t0 8
   sw $t0 -132($sp)

#------------359  IF reg[31] BEQ reg[32] THEN GOTO label_40
   lw $t0 -128($sp)
   lw $t1 -132($sp)
    beq $t0 $t1 label_40

#------------360  label_39    ----------------Label----------------
label_39:

#------------361  FACTOR_VAR_EXTERN INT num6 save in reg[33]
   lw $t3 .var_num6
   sw $t3 -136($sp)

#------------362  FACTOR_CON INT 0 save in reg[34]
   li $t0 0
   sw $t0 -140($sp)

#------------363  ASSIGN_ARR_EXTERN INT array1[reg[33]] = reg[34]
   lw $t0 -136($sp)
   lw $t1 -140($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------364  JUMP to label_38
   j label_38

#------------365  label_40    ----------------Label----------------
label_40:

#------------366  CALL VOID testvar(0)
   sw $ra -144($sp)
   addi $sp $sp -148
   jal .func_testvar
   subi $sp $sp -148
   lw $ra -144($sp)

#------------367  FACTOR_VAR_EXTERN INT num5 save in reg[35]
   lw $t3 .var_num5
   sw $t3 -144($sp)

#------------368  FACTOR_CON CHAR 97 save in reg[36]
   li $t0 97
   sw $t0 -148($sp)

#------------369  FACTOR_VAR_EXTERN INT num6 save in reg[37]
   lw $t3 .var_num6
   sw $t3 -152($sp)

#------------370  FACTOR_CON CHAR 98 save in reg[38]
   li $t0 98
   sw $t0 -156($sp)

#------------371  FACTOR_CON INT 10 save in reg[39]
   li $t0 10
   sw $t0 -160($sp)

#------------372  FACTOR_VAR_EXTERN CHAR char4 save in reg[40]
   lw $t3 .var_char4
   sw $t3 -164($sp)

#------------373  PUSH INT parareg[3] from reg[35]
   sw $ra -168($sp)
   lw $t0 -144($sp)
   sw $t0 -172($sp)

#------------374  PUSH INT parareg[4] from reg[36]
   lw $t0 -148($sp)
   sw $t0 -176($sp)

#------------375  PUSH INT parareg[5] from reg[37]
   lw $t0 -152($sp)
   sw $t0 -180($sp)

#------------376  PUSH INT parareg[6] from reg[38]
   lw $t0 -156($sp)
   sw $t0 -184($sp)

#------------377  PUSH INT parareg[7] from reg[39]
   lw $t0 -160($sp)
   sw $t0 -188($sp)

#------------378  PUSH INT parareg[8] from reg[40]
   lw $t0 -164($sp)
   sw $t0 -192($sp)

#------------379  CALL INT testfor(6)
   addi $sp $sp -172
   jal .func_testfor
   subi $sp $sp -172
   lw $ra -168($sp)

#------------380  FACTOR_FUNC INT testfor save in reg[41]
   sw $v0 -168($sp)

#------------381  FACTOR_CON INT 1 save in reg[42]
   li $t0 1
   sw $t0 -172($sp)

#------------382  IF reg[41] BNE reg[42] THEN GOTO label_41
   lw $t0 -168($sp)
   lw $t1 -172($sp)
    bne $t0 $t1 label_41

#------------383  FACTOR_CON INT 0 save in reg[43]
   li $t0 0
   sw $t0 -176($sp)

#------------384  FACTOR_CON CHAR 84 save in reg[44]
   li $t0 84
   sw $t0 -180($sp)

#------------385  ASSIGN_ARR_EXTERN CHAR testresult[reg[43]] = reg[44]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------386  JUMP to label_42
   j label_42

#------------387  label_41    ----------------Label----------------
label_41:

#------------388  FACTOR_CON INT 0 save in reg[45]
   li $t0 0
   sw $t0 -184($sp)

#------------389  FACTOR_CON CHAR 70 save in reg[46]
   li $t0 70
   sw $t0 -188($sp)

#------------390  ASSIGN_ARR_EXTERN CHAR testresult[reg[45]] = reg[46]
   lw $t0 -184($sp)
   lw $t1 -188($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------391  label_42    ----------------Label----------------
label_42:

#------------392  CALL INT testwhile(0)
   sw $ra -192($sp)
   addi $sp $sp -196
   jal .func_testwhile
   subi $sp $sp -196
   lw $ra -192($sp)

#------------393  FACTOR_FUNC INT testwhile save in reg[47]
   sw $v0 -192($sp)

#------------394  IF reg[47] BEQ reg[0] THEN GOTO label_43
   lw $t0 -192($sp)
    beq $t0 $0 label_43

#------------395  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -196($sp)

#------------396  FACTOR_CON CHAR 84 save in reg[49]
   li $t0 84
   sw $t0 -200($sp)

#------------397  ASSIGN_ARR_EXTERN CHAR testresult[reg[48]] = reg[49]
   lw $t0 -196($sp)
   lw $t1 -200($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------398  JUMP to label_44
   j label_44

#------------399  label_43    ----------------Label----------------
label_43:

#------------400  FACTOR_CON INT 1 save in reg[50]
   li $t0 1
   sw $t0 -204($sp)

#------------401  FACTOR_CON CHAR 70 save in reg[51]
   li $t0 70
   sw $t0 -208($sp)

#------------402  ASSIGN_ARR_EXTERN CHAR testresult[reg[50]] = reg[51]
   lw $t0 -204($sp)
   lw $t1 -208($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------403  label_44    ----------------Label----------------
label_44:

#------------404  CALL CHAR testfactorial(0)
   sw $ra -212($sp)
   addi $sp $sp -216
   jal .func_testfactorial
   subi $sp $sp -216
   lw $ra -212($sp)

#------------405  FACTOR_FUNC CHAR testfactorial save in reg[52]
   sw $v0 -212($sp)

#------------406  FACTOR_CON CHAR 84 save in reg[53]
   li $t0 84
   sw $t0 -216($sp)

#------------407  IF reg[52] BNE reg[53] THEN GOTO label_45
   lw $t0 -212($sp)
   lw $t1 -216($sp)
    bne $t0 $t1 label_45

#------------408  FACTOR_CON INT 2 save in reg[54]
   li $t0 2
   sw $t0 -220($sp)

#------------409  FACTOR_CON CHAR 84 save in reg[55]
   li $t0 84
   sw $t0 -224($sp)

#------------410  ASSIGN_ARR_EXTERN CHAR testresult[reg[54]] = reg[55]
   lw $t0 -220($sp)
   lw $t1 -224($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------411  JUMP to label_46
   j label_46

#------------412  label_45    ----------------Label----------------
label_45:

#------------413  FACTOR_CON INT 2 save in reg[56]
   li $t0 2
   sw $t0 -228($sp)

#------------414  FACTOR_CON CHAR 70 save in reg[57]
   li $t0 70
   sw $t0 -232($sp)

#------------415  ASSIGN_ARR_EXTERN CHAR testresult[reg[56]] = reg[57]
   lw $t0 -228($sp)
   lw $t1 -232($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------416  label_46    ----------------Label----------------
label_46:

#------------417  CALL INT testexpression(0)
   sw $ra -236($sp)
   addi $sp $sp -240
   jal .func_testexpression
   subi $sp $sp -240
   lw $ra -236($sp)

#------------418  FACTOR_FUNC INT testexpression save in reg[58]
   sw $v0 -236($sp)

#------------419  IF reg[58] BEQ reg[0] THEN GOTO label_47
   lw $t0 -236($sp)
    beq $t0 $0 label_47

#------------420  FACTOR_CON INT 3 save in reg[59]
   li $t0 3
   sw $t0 -240($sp)

#------------421  FACTOR_CON CHAR 84 save in reg[60]
   li $t0 84
   sw $t0 -244($sp)

#------------422  ASSIGN_ARR_EXTERN CHAR testresult[reg[59]] = reg[60]
   lw $t0 -240($sp)
   lw $t1 -244($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------423  JUMP to label_48
   j label_48

#------------424  label_47    ----------------Label----------------
label_47:

#------------425  FACTOR_CON INT 3 save in reg[61]
   li $t0 3
   sw $t0 -248($sp)

#------------426  FACTOR_CON CHAR 70 save in reg[62]
   li $t0 70
   sw $t0 -252($sp)

#------------427  ASSIGN_ARR_EXTERN CHAR testresult[reg[61]] = reg[62]
   lw $t0 -248($sp)
   lw $t1 -252($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------428  label_48    ----------------Label----------------
label_48:

#------------429  CALL INT testarray(0)
   sw $ra -256($sp)
   addi $sp $sp -260
   jal .func_testarray
   subi $sp $sp -260
   lw $ra -256($sp)

#------------430  FACTOR_FUNC INT testarray save in reg[63]
   sw $v0 -256($sp)

#------------431  IF reg[63] BEQ reg[0] THEN GOTO label_49
   lw $t0 -256($sp)
    beq $t0 $0 label_49

#------------432  FACTOR_CON INT 4 save in reg[64]
   li $t0 4
   sw $t0 -260($sp)

#------------433  FACTOR_CON CHAR 84 save in reg[65]
   li $t0 84
   sw $t0 -264($sp)

#------------434  ASSIGN_ARR_EXTERN CHAR testresult[reg[64]] = reg[65]
   lw $t0 -260($sp)
   lw $t1 -264($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------435  JUMP to label_50
   j label_50

#------------436  label_49    ----------------Label----------------
label_49:

#------------437  FACTOR_CON INT 4 save in reg[66]
   li $t0 4
   sw $t0 -268($sp)

#------------438  FACTOR_CON CHAR 70 save in reg[67]
   li $t0 70
   sw $t0 -272($sp)

#------------439  ASSIGN_ARR_EXTERN CHAR testresult[reg[66]] = reg[67]
   lw $t0 -268($sp)
   lw $t1 -272($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------440  label_50    ----------------Label----------------
label_50:

#------------441  FACTOR_VAR INT flag save in reg[68]
   lw $t3 -4($sp)
   sw $t3 -276($sp)

#------------442  PUSH INT parareg[9] from reg[68]
   sw $ra -280($sp)
   lw $t0 -276($sp)
   sw $t0 -284($sp)

#------------443  CALL VOID testprintf(1)
   addi $sp $sp -284
   jal .func_testprintf
   subi $sp $sp -284
   lw $ra -280($sp)

#------------444  FACTOR_CON INT 0 save in reg[69]
   li $t0 0
   sw $t0 -280($sp)

#------------445  ASSIGN INT i = reg[69]
   lw $t3 -280($sp)
   sw $t3 0($sp)

#------------446  JUMP to label_52
   j label_52

#------------447  label_51    ----------------Label----------------
label_51:

#------------448  FACTOR_VAR INT i save in reg[70]
   lw $t3 0($sp)
   sw $t3 -284($sp)

#------------449  FACTOR_CON INT 1 save in reg[71]
   li $t0 1
   sw $t0 -288($sp)

#------------450  reg[71] = reg[70] JIA reg[71]
   lw $t0 -284($sp)
   lw $t1 -288($sp)
   add $t2 $t0 $t1
   sw $t2 -288($sp)

#------------451  ASSIGN INT i = reg[71]
   lw $t3 -288($sp)
   sw $t3 0($sp)

#------------452  FACTOR_VAR INT i save in reg[72]
   lw $t3 0($sp)
   sw $t3 -292($sp)

#------------453  FACTOR_CON INT 5 save in reg[73]
   li $t0 5
   sw $t0 -296($sp)

#------------454  IF reg[72] BGEQ reg[73] THEN GOTO label_53
   lw $t0 -292($sp)
   lw $t1 -296($sp)
    bge $t0 $t1 label_53

#------------455  label_52    ----------------Label----------------
label_52:

#------------456  FACTOR_VAR INT i save in reg[74]
   lw $t3 0($sp)
   sw $t3 -300($sp)

#------------457  FACTOR_ARRAY_EXTERN CHAR testresult [reg[74]] save in reg[75]
   lw $t3 -300($sp)
   sll $t3 $t3 2
   lw $t3 .var_testresult($t3)
   sw $t3 -304($sp)

#------------458  WRITE CHAR reg[75]
   li $v0 11
   lw $a0 -304($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------459  JUMP to label_51
   j label_51

#------------460  label_53    ----------------Label----------------
label_53:

   jr $ra

end:
