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

#------------28  reg[7] = reg[5] JIAN reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -28($sp)

#------------29  PUSH INT parareg[0] from reg[7]
   sw $ra -32($sp)
   lw $t0 -28($sp)
   sw $t0 -36($sp)

#------------30  CALL INT factorial(1)
   addi $sp $sp -36
   jal .func_factorial
   subi $sp $sp -36
   lw $ra -32($sp)

#------------31  FACTOR_FUNC INT factorial save in reg[8]
   sw $v0 -32($sp)

#------------32  reg[9] = reg[4] CHENG reg[8]
   lw $t0 -16($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------33  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
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

#------------58  label_2    ----------------Label----------------
label_2:

#------------59  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------60  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -44($sp)

#------------61  reg[6] = reg[4] JIA reg[5]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------62  ASSIGN INT a = reg[6]
   lw $t3 -48($sp)
   sw $t3 0($sp)

#------------63  FACTOR_VAR INT i save in reg[7]
   lw $t3 -24($sp)
   sw $t3 -52($sp)

#------------64  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -56($sp)

#------------65  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   sub $t2 $t0 $t1
   sw $t2 -60($sp)

#------------66  ASSIGN INT i = reg[9]
   lw $t3 -60($sp)
   sw $t3 -24($sp)

#------------67  FACTOR_VAR INT i save in reg[10]
   lw $t3 -24($sp)
   sw $t3 -64($sp)

#------------68  FACTOR_CON INT 10 save in reg[11]
   li $t0 10
   sw $t0 -68($sp)

#------------69  IF reg[10] BLSS reg[11] THEN GOTO label_2
   lw $t0 -64($sp)
   lw $t1 -68($sp)
    blt $t0 $t1 label_2

#------------70  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -72($sp)

#------------71  ASSIGN INT i = reg[12]
   lw $t3 -72($sp)
   sw $t3 -24($sp)

#------------72  label_3    ----------------Label----------------
label_3:

#------------73  FACTOR_VAR INT c save in reg[13]
   lw $t3 -8($sp)
   sw $t3 -76($sp)

#------------74  FACTOR_CON INT 1 save in reg[14]
   li $t0 1
   sw $t0 -80($sp)

#------------75  reg[15] = reg[13] JIA reg[14]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   add $t2 $t0 $t1
   sw $t2 -84($sp)

#------------76  ASSIGN INT c = reg[15]
   lw $t3 -84($sp)
   sw $t3 -8($sp)

#------------77  FACTOR_VAR INT i save in reg[16]
   lw $t3 -24($sp)
   sw $t3 -88($sp)

#------------78  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -92($sp)

#------------79  reg[18] = reg[16] JIA reg[17]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   add $t2 $t0 $t1
   sw $t2 -96($sp)

#------------80  ASSIGN INT i = reg[18]
   lw $t3 -96($sp)
   sw $t3 -24($sp)

#------------81  FACTOR_VAR INT i save in reg[19]
   lw $t3 -24($sp)
   sw $t3 -100($sp)

#------------82  FACTOR_CON INT 10 save in reg[20]
   li $t0 10
   sw $t0 -104($sp)

#------------83  IF reg[19] BLSS reg[20] THEN GOTO label_3
   lw $t0 -100($sp)
   lw $t1 -104($sp)
    blt $t0 $t1 label_3

#------------84  FACTOR_VAR INT a save in reg[21]
   lw $t3 0($sp)
   sw $t3 -108($sp)

#------------85  FACTOR_CON INT 10 save in reg[22]
   li $t0 10
   sw $t0 -112($sp)

#------------86  IF reg[21] BNE reg[22] THEN GOTO label_6
   lw $t0 -108($sp)
   lw $t1 -112($sp)
    bne $t0 $t1 label_6

#------------87  FACTOR_VAR INT c save in reg[23]
   lw $t3 -8($sp)
   sw $t3 -116($sp)

#------------88  FACTOR_CON INT 10 save in reg[24]
   li $t0 10
   sw $t0 -120($sp)

#------------89  IF reg[23] BNE reg[24] THEN GOTO label_4
   lw $t0 -116($sp)
   lw $t1 -120($sp)
    bne $t0 $t1 label_4

#------------90  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -124($sp)

#------------91  RETURN reg[25] TO $V0 AND THEN GOTO 0
   lw $v0 -124($sp)
   jr $ra

#------------92  JUMP to label_5
   j label_5

#------------93  label_4    ----------------Label----------------
label_4:

#------------94  label_5    ----------------Label----------------
label_5:

#------------95  JUMP to label_7
   j label_7

#------------96  label_6    ----------------Label----------------
label_6:

#------------97  label_7    ----------------Label----------------
label_7:

#------------98  FACTOR_CON INT 0 save in reg[26]
   li $t0 0
   sw $t0 -128($sp)

#------------99  RETURN reg[26] TO $V0 AND THEN GOTO 0
   lw $v0 -128($sp)
   jr $ra

#------------100  FUNC INT testwhile(0)
   jr $ra

.func_testwhile:

#------------101  VAR INT num1

#------------102  VAR INT num2

#------------103  VAR INT num3

#------------104  VAR INT num4

#------------105  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -16($sp)

#------------106  ASSIGN INT num1 = reg[1]
   lw $t3 -16($sp)
   sw $t3 0($sp)

#------------107  FACTOR_CON INT 10 save in reg[2]
   li $t0 10
   sw $t0 -20($sp)

#------------108  ASSIGN INT num2 = reg[2]
   lw $t3 -20($sp)
   sw $t3 -4($sp)



#------------111  FACTOR_CON INT -1 save in reg[5]
   li $t0 -1
   sw $t0 -32($sp)

#------------112  ASSIGN INT num3 = reg[5]
   lw $t3 -32($sp)
   sw $t3 -8($sp)

#------------113  FACTOR_CON INT 0 save in reg[6]
   li $t0 0
   sw $t0 -36($sp)

#------------114  ASSIGN INT num4 = reg[6]
   lw $t3 -36($sp)
   sw $t3 -12($sp)

#------------115  label_8    ----------------Label----------------
label_8:

#------------116  FACTOR_VAR INT num1 save in reg[7]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------117  FACTOR_CON INT 10 save in reg[8]
   li $t0 10
   sw $t0 -44($sp)

#------------118  IF reg[7] BEQ reg[8] THEN GOTO label_9
   lw $t0 -40($sp)
   lw $t1 -44($sp)
    beq $t0 $t1 label_9

#------------119  FACTOR_VAR INT num2 save in reg[9]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------120  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -52($sp)

#------------121  reg[11] = reg[9] JIAN reg[10]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------122  ASSIGN INT num2 = reg[11]
   lw $t3 -56($sp)
   sw $t3 -4($sp)

#------------123  FACTOR_VAR INT num1 save in reg[12]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------124  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -64($sp)

#------------125  reg[14] = reg[12] JIA reg[13]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   add $t2 $t0 $t1
   sw $t2 -68($sp)

#------------126  ASSIGN INT num1 = reg[14]
   lw $t3 -68($sp)
   sw $t3 0($sp)

#------------127  JUMP to label_8
   j label_8

#------------128  label_9    ----------------Label----------------
label_9:

#------------129  label_10    ----------------Label----------------
label_10:

#------------130  FACTOR_VAR INT num3 save in reg[15]
   lw $t3 -8($sp)
   sw $t3 -72($sp)

#------------131  FACTOR_CON INT 0 save in reg[16]
   li $t0 0
   sw $t0 -76($sp)

#------------132  IF reg[15] BLEQ reg[16] THEN GOTO label_11
   lw $t0 -72($sp)
   lw $t1 -76($sp)
    ble $t0 $t1 label_11

#------------133  FACTOR_VAR INT num4 save in reg[17]
   lw $t3 -12($sp)
   sw $t3 -80($sp)

#------------134  FACTOR_CON INT 10 save in reg[18]
   li $t0 10
   sw $t0 -84($sp)

#------------135  reg[19] = reg[17] JIA reg[18]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   add $t2 $t0 $t1
   sw $t2 -88($sp)

#------------136  ASSIGN INT num4 = reg[19]
   lw $t3 -88($sp)
   sw $t3 -12($sp)

#------------137  FACTOR_VAR INT num3 save in reg[20]
   lw $t3 -8($sp)
   sw $t3 -92($sp)

#------------138  FACTOR_CON INT 10 save in reg[21]
   li $t0 10
   sw $t0 -96($sp)

#------------139  reg[22] = reg[20] JIAN reg[21]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   sub $t2 $t0 $t1
   sw $t2 -100($sp)

#------------140  ASSIGN INT num3 = reg[22]
   lw $t3 -100($sp)
   sw $t3 -8($sp)

#------------141  JUMP to label_10
   j label_10

#------------142  label_11    ----------------Label----------------
label_11:

#------------143  FACTOR_VAR INT num2 save in reg[23]
   lw $t3 -4($sp)
   sw $t3 -104($sp)

#------------144  FACTOR_CON INT 0 save in reg[24]
   li $t0 0
   sw $t0 -108($sp)

#------------145  IF reg[23] BNE reg[24] THEN GOTO label_14
   lw $t0 -104($sp)
   lw $t1 -108($sp)
    bne $t0 $t1 label_14

#------------146  FACTOR_VAR INT num4 save in reg[25]
   lw $t3 -12($sp)
   sw $t3 -112($sp)

#------------147  FACTOR_CON INT 0 save in reg[26]
   li $t0 0
   sw $t0 -116($sp)

#------------148  IF reg[25] BNE reg[26] THEN GOTO label_12
   lw $t0 -112($sp)
   lw $t1 -116($sp)
    bne $t0 $t1 label_12

#------------149  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -120($sp)

#------------150  RETURN reg[27] TO $V0 AND THEN GOTO 0
   lw $v0 -120($sp)
   jr $ra

#------------151  JUMP to label_13
   j label_13

#------------152  label_12    ----------------Label----------------
label_12:

#------------153  label_13    ----------------Label----------------
label_13:

#------------154  JUMP to label_15
   j label_15

#------------155  label_14    ----------------Label----------------
label_14:

#------------156  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -124($sp)

#------------157  RETURN reg[28] TO $V0 AND THEN GOTO 0
   lw $v0 -124($sp)
   jr $ra

#------------158  label_15    ----------------Label----------------
label_15:

#------------159  FUNC INT testexpression(0)
   jr $ra

.func_testexpression:

#------------160  VAR INT a

#------------161  VAR INT c

#------------162  VAR CHAR b

#------------163  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 -12($sp)

#------------164  ASSIGN INT a = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------165  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -16($sp)

#------------166  ASSIGN CHAR b = reg[2]
   lw $t3 -16($sp)
   sw $t3 -8($sp)

#------------167  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -20($sp)

#------------168  FACTOR_CON INT 100 save in reg[4]
   li $t0 100
   sw $t0 -24($sp)

#------------169  ASSIGN_ARR_EXTERN INT array1[reg[3]] = reg[4]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------170  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -28($sp)

#------------171  FACTOR_CON INT 99 save in reg[6]
   li $t0 99
   sw $t0 -32($sp)

#------------172  ASSIGN_ARR_EXTERN INT array1[reg[5]] = reg[6]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------173  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------174  FACTOR_VAR CHAR b save in reg[8]
   lw $t3 -8($sp)
   sw $t3 -40($sp)

#------------175  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------176  FACTOR_CON CHAR 97 save in reg[10]
   li $t0 97
   sw $t0 -48($sp)

#------------177  reg[11] = reg[9] JIA reg[10]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------178  FACTOR_EXPR reg[11] save in reg[12]
   lw $t0 -52($sp)
   sw $t0 -56($sp)

#------------179  CALL INT return1(0)
   sw $ra -60($sp)
   addi $sp $sp -64
   jal .func_return1
   subi $sp $sp -64
   lw $ra -60($sp)

#------------180  FACTOR_FUNC INT return1 save in reg[13]
   sw $v0 -60($sp)

#------------181  reg[14] = reg[12] CHENG reg[13]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -64($sp)

#------------182  FACTOR_CON INT 0 save in reg[15]
   li $t0 0
   sw $t0 -68($sp)

#------------183  FACTOR_ARRAY_EXTERN INT array1 [reg[15]] save in reg[16]
   lw $t3 -68($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -72($sp)

#------------184  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -76($sp)

#------------185  reg[18] = reg[16] CHU reg[17]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -80($sp)

#------------186  reg[19] = reg[14] JIAN reg[18]
   lw $t0 -64($sp)
   lw $t1 -80($sp)
   sub $t2 $t0 $t1
   sw $t2 -84($sp)

#------------187  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -88($sp)

#------------188  reg[21] = reg[19] JIA reg[20]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   add $t2 $t0 $t1
   sw $t2 -92($sp)

#------------189  ASSIGN INT c = reg[21]
   lw $t3 -92($sp)
   sw $t3 -4($sp)

#------------190  FACTOR_VAR INT c save in reg[22]
   lw $t3 -4($sp)
   sw $t3 -96($sp)

#------------191  FACTOR_ARRAY_EXTERN INT array1 [reg[22]] save in reg[23]
   lw $t3 -96($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -100($sp)

#------------192  FACTOR_CON INT 99 save in reg[24]
   li $t0 99
   sw $t0 -104($sp)

#------------193  IF reg[23] BNE reg[24] THEN GOTO label_16
   lw $t0 -100($sp)
   lw $t1 -104($sp)
    bne $t0 $t1 label_16

#------------194  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -108($sp)

#------------195  RETURN reg[25] TO $V0 AND THEN GOTO 0
   lw $v0 -108($sp)
   jr $ra

#------------196  JUMP to label_17
   j label_17

#------------197  label_16    ----------------Label----------------
label_16:

#------------198  label_17    ----------------Label----------------
label_17:

#------------199  FACTOR_CON INT 0 save in reg[26]
   li $t0 0
   sw $t0 -112($sp)

#------------200  RETURN reg[26] TO $V0 AND THEN GOTO 0
   lw $v0 -112($sp)
   jr $ra

#------------201  FUNC INT testarray(0)
   jr $ra

.func_testarray:

#------------202  VAR INT a

#------------203  VAR INT b

#------------204  VAR INT c

#------------205  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------206  ASSIGN INT a = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------207  FACTOR_CON INT 2 save in reg[2]
   li $t0 2
   sw $t0 -16($sp)

#------------208  ASSIGN INT b = reg[2]
   lw $t3 -16($sp)
   sw $t3 -4($sp)

#------------209  FACTOR_CON INT 3 save in reg[3]
   li $t0 3
   sw $t0 -20($sp)

#------------210  ASSIGN INT c = reg[3]
   lw $t3 -20($sp)
   sw $t3 -8($sp)

#------------211  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -24($sp)

#------------212  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -28($sp)

#------------213  ASSIGN_ARR_EXTERN INT array1[reg[4]] = reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------214  FACTOR_CON INT 4 save in reg[6]
   li $t0 4
   sw $t0 -32($sp)

#------------215  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -36($sp)

#------------216  FACTOR_ARRAY_EXTERN INT array1 [reg[7]] save in reg[8]
   lw $t3 -36($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -40($sp)

#------------217  ASSIGN_ARR_EXTERN INT array1[reg[6]] = reg[8]
   lw $t0 -32($sp)
   lw $t1 -40($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------218  FACTOR_VAR INT c save in reg[9]
   lw $t3 -8($sp)
   sw $t3 -44($sp)

#------------219  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------220  FACTOR_VAR INT b save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------221  CALL INT return1(0)
   sw $ra -56($sp)
   addi $sp $sp -60
   jal .func_return1
   subi $sp $sp -60
   lw $ra -56($sp)

#------------222  FACTOR_FUNC INT return1 save in reg[12]
   sw $v0 -56($sp)

#------------223  reg[13] = reg[11] JIA reg[12]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------224  FACTOR_EXPR reg[13] save in reg[14]
   lw $t0 -60($sp)
   sw $t0 -64($sp)

#------------225  reg[15] = reg[10] CHENG reg[14]
   lw $t0 -48($sp)
   lw $t1 -64($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -68($sp)

#------------226  reg[16] = reg[9] JIA reg[15]
   lw $t0 -44($sp)
   lw $t1 -68($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------227  FACTOR_CON INT 0 save in reg[17]
   li $t0 0
   sw $t0 -76($sp)

#------------228  FACTOR_ARRAY_EXTERN INT array1 [reg[17]] save in reg[18]
   lw $t3 -76($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -80($sp)

#------------229  FACTOR_CON INT 2 save in reg[19]
   li $t0 2
   sw $t0 -84($sp)

#------------230  reg[20] = reg[18] CHENG reg[19]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -88($sp)

#------------231  reg[21] = reg[16] JIAN reg[20]
   lw $t0 -72($sp)
   lw $t1 -88($sp)
   sub $t2 $t0 $t1
   sw $t2 -92($sp)

#------------232  FACTOR_CON INT 10 save in reg[22]
   li $t0 10
   sw $t0 -96($sp)

#------------233  ASSIGN_ARR_EXTERN INT array1[reg[21]] = reg[22]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------234  FACTOR_CON INT 4 save in reg[23]
   li $t0 4
   sw $t0 -100($sp)

#------------235  FACTOR_ARRAY_EXTERN INT array1 [reg[23]] save in reg[24]
   lw $t3 -100($sp)
   sll $t3 $t3 2
   lw $t3 .var_array1($t3)
   sw $t3 -104($sp)

#------------236  FACTOR_CON INT 10 save in reg[25]
   li $t0 10
   sw $t0 -108($sp)

#------------237  IF reg[24] BNE reg[25] THEN GOTO label_18
   lw $t0 -104($sp)
   lw $t1 -108($sp)
    bne $t0 $t1 label_18

#------------238  FACTOR_CON INT 1 save in reg[26]
   li $t0 1
   sw $t0 -112($sp)

#------------239  RETURN reg[26] TO $V0 AND THEN GOTO 0
   lw $v0 -112($sp)
   jr $ra

#------------240  JUMP to label_19
   j label_19

#------------241  label_18    ----------------Label----------------
label_18:

#------------242  label_19    ----------------Label----------------
label_19:

#------------243  FACTOR_CON INT 0 save in reg[27]
   li $t0 0
   sw $t0 -116($sp)

#------------244  RETURN reg[27] TO $V0 AND THEN GOTO 0
   lw $v0 -116($sp)
   jr $ra

#------------245  FUNC VOID testprintf(1)
   jr $ra

.func_testprintf:

#------------246  PARA INT flag

#------------247  FACTOR_VAR INT flag save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------248  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------249  IF reg[1] BGTR reg[2] THEN GOTO label_20
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bgt $t0 $t1 label_20

#------------250  WRITE this is a string, !#$%&'()*+,-./0123456789:;<=>?@[\]^_`{|}~|
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------251  JUMP to label_23
   j label_23

#------------252  label_20    ----------------Label----------------
label_20:

#------------253  FACTOR_VAR INT flag save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------254  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -16($sp)

#------------255  IF reg[3] BLSS reg[4] THEN GOTO label_21
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    blt $t0 $t1 label_21

#------------256  FACTOR_CON CHAR 97 save in reg[5]
   li $t0 97
   sw $t0 -20($sp)

#------------257  WRITE CHAR reg[5]
   li $v0 11
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------258  FACTOR_CON CHAR 50 save in reg[6]
   li $t0 50
   sw $t0 -24($sp)

#------------259  WRITE CHAR reg[6]
   li $v0 11
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------260  FACTOR_CON CHAR 42 save in reg[7]
   li $t0 42
   sw $t0 -28($sp)

#------------261  WRITE CHAR reg[7]
   li $v0 11
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------262  JUMP to label_22
   j label_22

#------------263  label_21    ----------------Label----------------
label_21:



#------------266  FACTOR_CON INT 5 save in reg[10]
   li $t0 5
   sw $t0 -40($sp)

#------------267  WRITE this is a string 
   li $v0 4
   la $a0 .str_1
   syscall

#------------268  WRITE INT reg[10]
   li $v0 1
   lw $a0 -40($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------269  label_22    ----------------Label----------------
label_22:

#------------270  label_23    ----------------Label----------------
label_23:

#------------271  FUNC CHAR testfactorial(0)
   jr $ra

.func_testfactorial:

#------------272  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------273  PUSH INT parareg[1] from reg[1]
   sw $ra -4($sp)
   lw $t0 0($sp)
   sw $t0 -8($sp)

#------------274  CALL INT factorial(1)
   addi $sp $sp -8
   jal .func_factorial
   subi $sp $sp -8
   lw $ra -4($sp)

#------------275  FACTOR_FUNC INT factorial save in reg[2]
   sw $v0 -4($sp)

#------------276  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------277  IF reg[2] BNE reg[3] THEN GOTO label_26
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_26

#------------278  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -12($sp)

#------------279  PUSH INT parareg[2] from reg[4]
   sw $ra -16($sp)
   lw $t0 -12($sp)
   sw $t0 -20($sp)

#------------280  CALL INT factorial(1)
   addi $sp $sp -20
   jal .func_factorial
   subi $sp $sp -20
   lw $ra -16($sp)

#------------281  FACTOR_FUNC INT factorial save in reg[5]
   sw $v0 -16($sp)

#------------282  FACTOR_CON INT 6 save in reg[6]
   li $t0 6
   sw $t0 -20($sp)

#------------283  IF reg[5] BNE reg[6] THEN GOTO label_24
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_24

#------------284  FACTOR_CON CHAR 84 save in reg[7]
   li $t0 84
   sw $t0 -24($sp)

#------------285  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------286  JUMP to label_25
   j label_25

#------------287  label_24    ----------------Label----------------
label_24:

#------------288  label_25    ----------------Label----------------
label_25:

#------------289  JUMP to label_27
   j label_27

#------------290  label_26    ----------------Label----------------
label_26:

#------------291  label_27    ----------------Label----------------
label_27:

#------------292  FACTOR_CON CHAR 70 save in reg[8]
   li $t0 70
   sw $t0 -28($sp)

#------------293  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------294  FUNC VOID main(0)
   jr $ra

.func_main:

#------------295  VAR INT i

#------------296  VAR INT flag

#------------297  FACTOR_CON INT 9 save in reg[9]
   li $t0 9
   sw $t0 -40($sp)

#------------298  ASSIGN_EXTERN INT num5 = reg[9]
   lw $t3 -40($sp)
   sw $t3 .var_num5

#------------299  FACTOR_CON INT 8 save in reg[10]
   li $t0 8
   sw $t0 -44($sp)

#------------300  ASSIGN_EXTERN INT num6 = reg[10]
   lw $t3 -44($sp)
   sw $t3 .var_num6

#------------301  FACTOR_CON CHAR 97 save in reg[11]
   li $t0 97
   sw $t0 -48($sp)

#------------302  ASSIGN_EXTERN CHAR char3 = reg[11]
   lw $t3 -48($sp)
   sw $t3 .var_char3

#------------303  FACTOR_CON CHAR 98 save in reg[12]
   li $t0 98
   sw $t0 -52($sp)

#------------304  ASSIGN_EXTERN CHAR char4 = reg[12]
   lw $t3 -52($sp)
   sw $t3 .var_char4

#------------305  READ INT flag
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------306  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -56($sp)

#------------307  ASSIGN INT i = reg[13]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------308  label_28    ----------------Label----------------
label_28:

#------------309  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------310  FACTOR_CON CHAR 84 save in reg[15]
   li $t0 84
   sw $t0 -64($sp)

#------------311  ASSIGN_ARR_EXTERN CHAR testresult[reg[14]] = reg[15]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------312  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------313  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -72($sp)

#------------314  reg[18] = reg[16] JIA reg[17]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -76($sp)

#------------315  ASSIGN INT i = reg[18]
   lw $t3 -76($sp)
   sw $t3 0($sp)

#------------316  FACTOR_VAR INT i save in reg[19]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------317  FACTOR_CON INT 10 save in reg[20]
   li $t0 10
   sw $t0 -84($sp)

#------------318  IF reg[19] BLSS reg[20] THEN GOTO label_28
   lw $t0 -80($sp)
   lw $t1 -84($sp)
    blt $t0 $t1 label_28

#------------319  FACTOR_CON INT 9 save in reg[21]
   li $t0 9
   sw $t0 -88($sp)

#------------320  ASSIGN_EXTERN INT num5 = reg[21]
   lw $t3 -88($sp)
   sw $t3 .var_num5

#------------321  label_29    ----------------Label----------------
label_29:

#------------322  FACTOR_VAR_EXTERN INT num5 save in reg[22]
   lw $t3 .var_num5
   sw $t3 -92($sp)

#------------323  FACTOR_VAR_EXTERN INT num5 save in reg[23]
   lw $t3 .var_num5
   sw $t3 -96($sp)

#------------324  FACTOR_ARRAY_EXTERN CHAR testresult [reg[23]] save in reg[24]
   lw $t3 -96($sp)
   sll $t3 $t3 2
   lw $t3 .var_testresult($t3)
   sw $t3 -100($sp)

#------------325  ASSIGN_ARR_EXTERN CHAR array2[reg[22]] = reg[24]
   lw $t0 -92($sp)
   lw $t1 -100($sp)
   sll $t0 $t0 2
   sw $t1 .var_array2($t0)

#------------326  FACTOR_VAR_EXTERN INT num5 save in reg[25]
   lw $t3 .var_num5
   sw $t3 -104($sp)

#------------327  FACTOR_CON INT 1 save in reg[26]
   li $t0 1
   sw $t0 -108($sp)

#------------328  reg[27] = reg[25] JIAN reg[26]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   sub $t2 $t0 $t1
   sw $t2 -112($sp)

#------------329  ASSIGN_EXTERN INT num5 = reg[27]
   lw $t3 -112($sp)
   sw $t3 .var_num5

#------------330  FACTOR_VAR_EXTERN INT num5 save in reg[28]
   lw $t3 .var_num5
   sw $t3 -116($sp)

#------------331  FACTOR_CON INT 0 save in reg[29]
   li $t0 0
   sw $t0 -120($sp)

#------------332  IF reg[28] BGEQ reg[29] THEN GOTO label_29
   lw $t0 -116($sp)
   lw $t1 -120($sp)
    bge $t0 $t1 label_29

#------------333  FACTOR_CON INT 0 save in reg[30]
   li $t0 0
   sw $t0 -124($sp)

#------------334  ASSIGN_EXTERN INT num6 = reg[30]
   lw $t3 -124($sp)
   sw $t3 .var_num6

#------------335  label_30    ----------------Label----------------
label_30:

#------------336  FACTOR_VAR_EXTERN INT num6 save in reg[31]
   lw $t3 .var_num6
   sw $t3 -128($sp)

#------------337  FACTOR_CON INT 0 save in reg[32]
   li $t0 0
   sw $t0 -132($sp)

#------------338  ASSIGN_ARR_EXTERN INT array1[reg[31]] = reg[32]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   sll $t0 $t0 2
   sw $t1 .var_array1($t0)

#------------339  FACTOR_VAR_EXTERN INT num6 save in reg[33]
   lw $t3 .var_num6
   sw $t3 -136($sp)

#------------340  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -140($sp)

#------------341  reg[35] = reg[33] JIA reg[34]
   lw $t0 -136($sp)
   lw $t1 -140($sp)
   add $t2 $t0 $t1
   sw $t2 -144($sp)

#------------342  ASSIGN_EXTERN INT num6 = reg[35]
   lw $t3 -144($sp)
   sw $t3 .var_num6

#------------343  FACTOR_VAR_EXTERN INT num6 save in reg[36]
   lw $t3 .var_num6
   sw $t3 -148($sp)

#------------344  FACTOR_CON INT 8 save in reg[37]
   li $t0 8
   sw $t0 -152($sp)

#------------345  IF reg[36] BNE reg[37] THEN GOTO label_30
   lw $t0 -148($sp)
   lw $t1 -152($sp)
    bne $t0 $t1 label_30

#------------346  CALL VOID testvar(0)
   sw $ra -156($sp)
   addi $sp $sp -160
   jal .func_testvar
   subi $sp $sp -160
   lw $ra -156($sp)

#------------347  FACTOR_VAR_EXTERN INT num5 save in reg[38]
   lw $t3 .var_num5
   sw $t3 -156($sp)

#------------348  FACTOR_CON CHAR 97 save in reg[39]
   li $t0 97
   sw $t0 -160($sp)

#------------349  FACTOR_VAR_EXTERN INT num6 save in reg[40]
   lw $t3 .var_num6
   sw $t3 -164($sp)

#------------350  FACTOR_CON CHAR 98 save in reg[41]
   li $t0 98
   sw $t0 -168($sp)

#------------351  FACTOR_CON INT 10 save in reg[42]
   li $t0 10
   sw $t0 -172($sp)

#------------352  FACTOR_VAR_EXTERN CHAR char4 save in reg[43]
   lw $t3 .var_char4
   sw $t3 -176($sp)

#------------353  PUSH INT parareg[3] from reg[38]
   sw $ra -180($sp)
   lw $t0 -156($sp)
   sw $t0 -184($sp)

#------------354  PUSH INT parareg[4] from reg[39]
   lw $t0 -160($sp)
   sw $t0 -188($sp)

#------------355  PUSH INT parareg[5] from reg[40]
   lw $t0 -164($sp)
   sw $t0 -192($sp)

#------------356  PUSH INT parareg[6] from reg[41]
   lw $t0 -168($sp)
   sw $t0 -196($sp)

#------------357  PUSH INT parareg[7] from reg[42]
   lw $t0 -172($sp)
   sw $t0 -200($sp)

#------------358  PUSH INT parareg[8] from reg[43]
   lw $t0 -176($sp)
   sw $t0 -204($sp)

#------------359  CALL INT testfor(6)
   addi $sp $sp -184
   jal .func_testfor
   subi $sp $sp -184
   lw $ra -180($sp)

#------------360  FACTOR_FUNC INT testfor save in reg[44]
   sw $v0 -180($sp)

#------------361  FACTOR_CON INT 1 save in reg[45]
   li $t0 1
   sw $t0 -184($sp)

#------------362  IF reg[44] BNE reg[45] THEN GOTO label_31
   lw $t0 -180($sp)
   lw $t1 -184($sp)
    bne $t0 $t1 label_31

#------------363  FACTOR_CON INT 0 save in reg[46]
   li $t0 0
   sw $t0 -188($sp)

#------------364  FACTOR_CON CHAR 84 save in reg[47]
   li $t0 84
   sw $t0 -192($sp)

#------------365  ASSIGN_ARR_EXTERN CHAR testresult[reg[46]] = reg[47]
   lw $t0 -188($sp)
   lw $t1 -192($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------366  JUMP to label_32
   j label_32

#------------367  label_31    ----------------Label----------------
label_31:

#------------368  FACTOR_CON INT 0 save in reg[48]
   li $t0 0
   sw $t0 -196($sp)

#------------369  FACTOR_CON CHAR 70 save in reg[49]
   li $t0 70
   sw $t0 -200($sp)

#------------370  ASSIGN_ARR_EXTERN CHAR testresult[reg[48]] = reg[49]
   lw $t0 -196($sp)
   lw $t1 -200($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------371  label_32    ----------------Label----------------
label_32:

#------------372  CALL INT testwhile(0)
   sw $ra -204($sp)
   addi $sp $sp -208
   jal .func_testwhile
   subi $sp $sp -208
   lw $ra -204($sp)

#------------373  FACTOR_FUNC INT testwhile save in reg[50]
   sw $v0 -204($sp)

#------------374  IF reg[50] BEQ reg[0] THEN GOTO label_33
   lw $t0 -204($sp)
    beq $t0 $0 label_33

#------------375  FACTOR_CON INT 1 save in reg[51]
   li $t0 1
   sw $t0 -208($sp)

#------------376  FACTOR_CON CHAR 84 save in reg[52]
   li $t0 84
   sw $t0 -212($sp)

#------------377  ASSIGN_ARR_EXTERN CHAR testresult[reg[51]] = reg[52]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------378  JUMP to label_34
   j label_34

#------------379  label_33    ----------------Label----------------
label_33:

#------------380  FACTOR_CON INT 1 save in reg[53]
   li $t0 1
   sw $t0 -216($sp)

#------------381  FACTOR_CON CHAR 70 save in reg[54]
   li $t0 70
   sw $t0 -220($sp)

#------------382  ASSIGN_ARR_EXTERN CHAR testresult[reg[53]] = reg[54]
   lw $t0 -216($sp)
   lw $t1 -220($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------383  label_34    ----------------Label----------------
label_34:

#------------384  CALL CHAR testfactorial(0)
   sw $ra -224($sp)
   addi $sp $sp -228
   jal .func_testfactorial
   subi $sp $sp -228
   lw $ra -224($sp)

#------------385  FACTOR_FUNC CHAR testfactorial save in reg[55]
   sw $v0 -224($sp)

#------------386  FACTOR_CON CHAR 84 save in reg[56]
   li $t0 84
   sw $t0 -228($sp)

#------------387  IF reg[55] BNE reg[56] THEN GOTO label_35
   lw $t0 -224($sp)
   lw $t1 -228($sp)
    bne $t0 $t1 label_35

#------------388  FACTOR_CON INT 2 save in reg[57]
   li $t0 2
   sw $t0 -232($sp)

#------------389  FACTOR_CON CHAR 84 save in reg[58]
   li $t0 84
   sw $t0 -236($sp)

#------------390  ASSIGN_ARR_EXTERN CHAR testresult[reg[57]] = reg[58]
   lw $t0 -232($sp)
   lw $t1 -236($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------391  JUMP to label_36
   j label_36

#------------392  label_35    ----------------Label----------------
label_35:

#------------393  FACTOR_CON INT 2 save in reg[59]
   li $t0 2
   sw $t0 -240($sp)

#------------394  FACTOR_CON CHAR 70 save in reg[60]
   li $t0 70
   sw $t0 -244($sp)

#------------395  ASSIGN_ARR_EXTERN CHAR testresult[reg[59]] = reg[60]
   lw $t0 -240($sp)
   lw $t1 -244($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------396  label_36    ----------------Label----------------
label_36:

#------------397  CALL INT testexpression(0)
   sw $ra -248($sp)
   addi $sp $sp -252
   jal .func_testexpression
   subi $sp $sp -252
   lw $ra -248($sp)

#------------398  FACTOR_FUNC INT testexpression save in reg[61]
   sw $v0 -248($sp)

#------------399  IF reg[61] BEQ reg[0] THEN GOTO label_37
   lw $t0 -248($sp)
    beq $t0 $0 label_37

#------------400  FACTOR_CON INT 3 save in reg[62]
   li $t0 3
   sw $t0 -252($sp)

#------------401  FACTOR_CON CHAR 84 save in reg[63]
   li $t0 84
   sw $t0 -256($sp)

#------------402  ASSIGN_ARR_EXTERN CHAR testresult[reg[62]] = reg[63]
   lw $t0 -252($sp)
   lw $t1 -256($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------403  JUMP to label_38
   j label_38

#------------404  label_37    ----------------Label----------------
label_37:

#------------405  FACTOR_CON INT 3 save in reg[64]
   li $t0 3
   sw $t0 -260($sp)

#------------406  FACTOR_CON CHAR 70 save in reg[65]
   li $t0 70
   sw $t0 -264($sp)

#------------407  ASSIGN_ARR_EXTERN CHAR testresult[reg[64]] = reg[65]
   lw $t0 -260($sp)
   lw $t1 -264($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------408  label_38    ----------------Label----------------
label_38:

#------------409  CALL INT testarray(0)
   sw $ra -268($sp)
   addi $sp $sp -272
   jal .func_testarray
   subi $sp $sp -272
   lw $ra -268($sp)

#------------410  FACTOR_FUNC INT testarray save in reg[66]
   sw $v0 -268($sp)

#------------411  IF reg[66] BEQ reg[0] THEN GOTO label_39
   lw $t0 -268($sp)
    beq $t0 $0 label_39

#------------412  FACTOR_CON INT 4 save in reg[67]
   li $t0 4
   sw $t0 -272($sp)

#------------413  FACTOR_CON CHAR 84 save in reg[68]
   li $t0 84
   sw $t0 -276($sp)

#------------414  ASSIGN_ARR_EXTERN CHAR testresult[reg[67]] = reg[68]
   lw $t0 -272($sp)
   lw $t1 -276($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------415  JUMP to label_40
   j label_40

#------------416  label_39    ----------------Label----------------
label_39:

#------------417  FACTOR_CON INT 4 save in reg[69]
   li $t0 4
   sw $t0 -280($sp)

#------------418  FACTOR_CON CHAR 70 save in reg[70]
   li $t0 70
   sw $t0 -284($sp)

#------------419  ASSIGN_ARR_EXTERN CHAR testresult[reg[69]] = reg[70]
   lw $t0 -280($sp)
   lw $t1 -284($sp)
   sll $t0 $t0 2
   sw $t1 .var_testresult($t0)

#------------420  label_40    ----------------Label----------------
label_40:

#------------421  FACTOR_VAR INT flag save in reg[71]
   lw $t3 -4($sp)
   sw $t3 -288($sp)

#------------422  PUSH INT parareg[9] from reg[71]
   sw $ra -292($sp)
   lw $t0 -288($sp)
   sw $t0 -296($sp)

#------------423  CALL VOID testprintf(1)
   addi $sp $sp -296
   jal .func_testprintf
   subi $sp $sp -296
   lw $ra -292($sp)

#------------424  FACTOR_CON INT 0 save in reg[72]
   li $t0 0
   sw $t0 -292($sp)

#------------425  ASSIGN INT i = reg[72]
   lw $t3 -292($sp)
   sw $t3 0($sp)

#------------426  label_41    ----------------Label----------------
label_41:

#------------427  FACTOR_VAR INT i save in reg[73]
   lw $t3 0($sp)
   sw $t3 -296($sp)

#------------428  FACTOR_ARRAY_EXTERN CHAR testresult [reg[73]] save in reg[74]
   lw $t3 -296($sp)
   sll $t3 $t3 2
   lw $t3 .var_testresult($t3)
   sw $t3 -300($sp)

#------------429  WRITE CHAR reg[74]
   li $v0 11
   lw $a0 -300($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------430  FACTOR_VAR INT i save in reg[75]
   lw $t3 0($sp)
   sw $t3 -304($sp)

#------------431  FACTOR_CON INT 1 save in reg[76]
   li $t0 1
   sw $t0 -308($sp)

#------------432  reg[77] = reg[75] JIA reg[76]
   lw $t0 -304($sp)
   lw $t1 -308($sp)
   add $t2 $t0 $t1
   sw $t2 -312($sp)

#------------433  ASSIGN INT i = reg[77]
   lw $t3 -312($sp)
   sw $t3 0($sp)

#------------434  FACTOR_VAR INT i save in reg[78]
   lw $t3 0($sp)
   sw $t3 -316($sp)

#------------435  FACTOR_CON INT 5 save in reg[79]
   li $t0 5
   sw $t0 -320($sp)

#------------436  IF reg[78] BLSS reg[79] THEN GOTO label_41
   lw $t0 -316($sp)
   lw $t1 -320($sp)
    blt $t0 $t1 label_41

   jr $ra

end:
