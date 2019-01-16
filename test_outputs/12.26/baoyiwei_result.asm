.data
   .var__sfd: .word 0
   .var_ary11: .space 80
   .var_jfi321: .word 0
   .var_s123: .word 0
   .var_char23: .space 92
   .var_jf320: .word 0
   .var_sxmri31: .space 40
   .str_0: .asciiz "char c = "
   .str_1: .asciiz ",count down "
   .str_2: .asciiz "c times pai is "
   .str_3: .asciiz "var_1 = "
   .str_4: .asciiz "var_2 = "
   .str_5: .asciiz "char_1 = "
   .str_6: .asciiz "char_2 = "
   .str_7: .asciiz "Hello world!"
   .str_8: .asciiz "var_1 is bigger than 0"
   .str_9: .asciiz "var_1 beq 0"
   .str_10: .asciiz "var_1 is smaller than 0"
   .str_11: .asciiz "var_1 leq than 0"
   .str_12: .asciiz "var_1 equals 0"
   .str_13: .asciiz "var_1 neq 0"
   .str_14: .asciiz "sum of ary is "
   .str_15: .asciiz "factorial of 3 is "
   .str_16: .asciiz "char_1 is "
   .str_17: .asciiz ",char_2 is "
   .str_18: .asciiz ",sum of char_1 and char_2 is "
   .str_19: .asciiz "ascii no."
   .str_20: .asciiz " is "
.text
   jal .func_main
   j end
#------------12  FUNC INT factorial(1)
.func_factorial:

#------------13  PARA INT n

#------------14  FACTOR_VAR INT n save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------15  FACTOR_CON INT 2 save in reg[2]
   li $t0 2
   sw $t0 -8($sp)

#------------16  IF reg[1] BNE reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_0

#------------17  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -12($sp)

#------------18  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------19  JUMP to label_1
   j label_1

#------------20  label_0    ----------------Label----------------
label_0:

#------------21  FACTOR_VAR INT n save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------22  FACTOR_VAR INT n save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------23  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------24  reg[7] = reg[5] JIAN reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -28($sp)

#------------25  PUSH INT parareg[0] from reg[7]
   sw $ra -32($sp)
   lw $t0 -28($sp)
   sw $t0 -36($sp)

#------------26  CALL INT factorial(1)
   addi $sp $sp -36
   jal .func_factorial
   subi $sp $sp -36
   lw $ra -32($sp)

#------------27  FACTOR_FUNC INT factorial save in reg[8]
   sw $v0 -32($sp)

#------------28  reg[9] = reg[4] CHENG reg[8]
   lw $t0 -16($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------29  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------30  label_1    ----------------Label----------------
label_1:

#------------31  FUNC VOID output(0)
   jr $ra

.func_output:

#------------32  VAR INT counter

#------------33  VAR INT sum

#------------34  FACTOR_CON INT 3 save in reg[1]
   li $t0 3
   sw $t0 -8($sp)

#------------35  ASSIGN INT counter = reg[1]
   lw $t3 -8($sp)
   sw $t3 0($sp)

#------------36  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -12($sp)

#------------37  ASSIGN INT sum = reg[2]
   lw $t3 -12($sp)
   sw $t3 -4($sp)

#------------38  label_2    ----------------Label----------------
label_2:

#------------39  FACTOR_VAR INT counter save in reg[3]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------40  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -20($sp)

#------------41  IF reg[3] BLEQ reg[4] THEN GOTO label_3
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    ble $t0 $t1 label_3

#------------42  FACTOR_CON CHAR 99 save in reg[5]
   li $t0 99
   sw $t0 -24($sp)

#------------43  WRITE char c = 
   li $v0 4
   la $a0 .str_0
   syscall

#------------44  WRITE CHAR reg[5]
   li $v0 11
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------45  FACTOR_VAR INT counter save in reg[6]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------46  WRITE ,count down 
   li $v0 4
   la $a0 .str_1
   syscall

#------------47  WRITE INT reg[6]
   li $v0 1
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------48  FACTOR_VAR INT counter save in reg[7]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------49  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -36($sp)

#------------50  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   sub $t2 $t0 $t1
   sw $t2 -40($sp)

#------------51  ASSIGN INT counter = reg[9]
   lw $t3 -40($sp)
   sw $t3 0($sp)

#------------52  FACTOR_VAR INT sum save in reg[10]
   lw $t3 -4($sp)
   sw $t3 -44($sp)

#------------53  FACTOR_CON CHAR 99 save in reg[11]
   li $t0 99
   sw $t0 -48($sp)

#------------54  reg[12] = reg[10] JIA reg[11]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------55  ASSIGN INT sum = reg[12]
   lw $t3 -52($sp)
   sw $t3 -4($sp)

#------------56  JUMP to label_2
   j label_2

#------------57  label_3    ----------------Label----------------
label_3:

#------------58  FACTOR_VAR INT sum save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -56($sp)

#------------59  WRITE c times pai is 
   li $v0 4
   la $a0 .str_2
   syscall

#------------60  WRITE INT reg[13]
   li $v0 1
   lw $a0 -56($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------61  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------62  FUNC CHAR printchar(1)
   jr $ra

.func_printchar:

#------------63  PARA INT n

#------------64  VAR CHAR ca

#------------65  FACTOR_VAR INT n save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------66  ASSIGN CHAR ca = reg[1]
   lw $t3 -8($sp)
   sw $t3 -4($sp)

#------------67  FACTOR_VAR CHAR ca save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------68  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------69  FUNC VOID main(0)
   jr $ra

.func_main:

#------------70  ARRAY INT ary[5]

#------------71  VAR INT var_1

#------------72  VAR INT var_2

#------------73  VAR INT i

#------------74  VAR INT suma

#------------75  VAR CHAR char_1

#------------76  VAR CHAR char_2

#------------77  WRITE var_1 = 
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------78  READ INT var_1
   li $v0 5
   syscall
   sw $v0 -20($sp)

#------------79  WRITE var_2 = 
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------80  READ INT var_2
   li $v0 5
   syscall
   sw $v0 -24($sp)

#------------81  WRITE char_1 = 
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------82  READ CHAR char_1
   li $v0 12
   syscall
   sw $v0 -36($sp)

#------------83  WRITE char_2 = 
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------84  READ CHAR char_2
   li $v0 12
   syscall
   sw $v0 -40($sp)

#------------85  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -52($sp)

#------------86  ASSIGN INT suma = reg[3]
   lw $t3 -52($sp)
   sw $t3 -32($sp)

#------------87  label_4    ----------------Label----------------
label_4:

#------------88  FACTOR_VAR INT var_2 save in reg[4]
   lw $t3 -24($sp)
   sw $t3 -56($sp)

#------------89  FACTOR_CON INT 5 save in reg[5]
   li $t0 5
   sw $t0 -60($sp)

#------------90  IF reg[4] BEQ reg[5] THEN GOTO label_7
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    beq $t0 $t1 label_7

#------------91  FACTOR_VAR INT var_2 save in reg[6]
   lw $t3 -24($sp)
   sw $t3 -64($sp)

#------------92  FACTOR_CON INT 5 save in reg[7]
   li $t0 5
   sw $t0 -68($sp)

#------------93  IF reg[6] BGEQ reg[7] THEN GOTO label_5
   lw $t0 -64($sp)
   lw $t1 -68($sp)
    bge $t0 $t1 label_5

#------------94  FACTOR_VAR INT var_2 save in reg[8]
   lw $t3 -24($sp)
   sw $t3 -72($sp)

#------------95  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -76($sp)

#------------96  reg[10] = reg[8] JIA reg[9]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   add $t2 $t0 $t1
   sw $t2 -80($sp)

#------------97  ASSIGN INT var_2 = reg[10]
   lw $t3 -80($sp)
   sw $t3 -24($sp)

#------------98  JUMP to label_6
   j label_6

#------------99  label_5    ----------------Label----------------
label_5:

#------------100  FACTOR_VAR INT var_2 save in reg[11]
   lw $t3 -24($sp)
   sw $t3 -84($sp)

#------------101  FACTOR_CON INT 1 save in reg[12]
   li $t0 1
   sw $t0 -88($sp)

#------------102  reg[13] = reg[11] JIAN reg[12]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   sub $t2 $t0 $t1
   sw $t2 -92($sp)

#------------103  ASSIGN INT var_2 = reg[13]
   lw $t3 -92($sp)
   sw $t3 -24($sp)

#------------104  label_6    ----------------Label----------------
label_6:

#------------105  JUMP to label_4
   j label_4

#------------106  label_7    ----------------Label----------------
label_7:

#------------107  FACTOR_CON INT 10 save in reg[14]
   li $t0 10
   sw $t0 -96($sp)

#------------108  ASSIGN INT i = reg[14]
   lw $t3 -96($sp)
   sw $t3 -28($sp)

#------------109  label_8    ----------------Label----------------
label_8:

#------------110  FACTOR_VAR INT i save in reg[15]
   lw $t3 -28($sp)
   sw $t3 -100($sp)

#------------111  FACTOR_CON INT 10 save in reg[16]
   li $t0 10
   sw $t0 -104($sp)

#------------112  reg[17] = reg[15] JIAN reg[16]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   sub $t2 $t0 $t1
   sw $t2 -108($sp)

#------------113  FACTOR_VAR INT var_2 save in reg[18]
   lw $t3 -24($sp)
   sw $t3 -112($sp)

#------------114  FACTOR_VAR INT i save in reg[19]
   lw $t3 -28($sp)
   sw $t3 -116($sp)

#------------115  reg[20] = reg[18] JIA reg[19]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   add $t2 $t0 $t1
   sw $t2 -120($sp)

#------------116  ASSIGN_ARR INT ary[reg[17]] = reg[20]
   lw $t0 -108($sp)
   lw $t1 -120($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 0($t0)

#------------117  FACTOR_VAR INT suma save in reg[21]
   lw $t3 -32($sp)
   sw $t3 -124($sp)

#------------118  FACTOR_VAR INT i save in reg[22]
   lw $t3 -28($sp)
   sw $t3 -128($sp)

#------------119  FACTOR_CON INT 10 save in reg[23]
   li $t0 10
   sw $t0 -132($sp)

#------------120  reg[24] = reg[22] JIAN reg[23]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   sub $t2 $t0 $t1
   sw $t2 -136($sp)

#------------121  FACTOR_ARRAY INT ary [reg[24]] save in reg[25]
   lw $t3 -136($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -140($sp)

#------------122  reg[26] = reg[21] JIA reg[25]
   lw $t0 -124($sp)
   lw $t1 -140($sp)
   add $t2 $t0 $t1
   sw $t2 -144($sp)

#------------123  ASSIGN INT suma = reg[26]
   lw $t3 -144($sp)
   sw $t3 -32($sp)

#------------124  FACTOR_VAR INT i save in reg[27]
   lw $t3 -28($sp)
   sw $t3 -148($sp)

#------------125  FACTOR_CON INT 1 save in reg[28]
   li $t0 1
   sw $t0 -152($sp)

#------------126  reg[29] = reg[27] JIA reg[28]
   lw $t0 -148($sp)
   lw $t1 -152($sp)
   add $t2 $t0 $t1
   sw $t2 -156($sp)

#------------127  ASSIGN INT i = reg[29]
   lw $t3 -156($sp)
   sw $t3 -28($sp)

#------------128  FACTOR_VAR INT i save in reg[30]
   lw $t3 -28($sp)
   sw $t3 -160($sp)

#------------129  FACTOR_CON INT 15 save in reg[31]
   li $t0 15
   sw $t0 -164($sp)

#------------130  IF reg[30] BLSS reg[31] THEN GOTO label_8
   lw $t0 -160($sp)
   lw $t1 -164($sp)
    blt $t0 $t1 label_8

#------------131  WRITE Hello world!
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------132  FACTOR_VAR INT var_2 save in reg[32]
   lw $t3 -24($sp)
   sw $t3 -168($sp)




#------------136  FACTOR_CON INT 4 save in reg[36]
   li $t0 4
   sw $t0 -184($sp)

#------------137  reg[37] = reg[32] CHENG reg[36]
   lw $t0 -168($sp)
   lw $t1 -184($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -188($sp)



#------------140  FACTOR_CON INT 2 save in reg[40]
   li $t0 2
   sw $t0 -200($sp)

#------------141  reg[41] = reg[37] JIAN reg[40]
   lw $t0 -188($sp)
   lw $t1 -200($sp)
   sub $t2 $t0 $t1
   sw $t2 -204($sp)

#------------142  FACTOR_EXPR reg[41] save in reg[42]
   lw $t0 -204($sp)
   sw $t0 -208($sp)

#------------143  FACTOR_CON INT 6 save in reg[43]
   li $t0 6
   sw $t0 -212($sp)

#------------144  reg[44] = reg[42] CHU reg[43]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -216($sp)

#------------145  ASSIGN INT var_2 = reg[44]
   lw $t3 -216($sp)
   sw $t3 -24($sp)

#------------146  FACTOR_VAR INT var_1 save in reg[45]
   lw $t3 -20($sp)
   sw $t3 -220($sp)

#------------147  FACTOR_CON INT 0 save in reg[46]
   li $t0 0
   sw $t0 -224($sp)

#------------148  IF reg[45] BLEQ reg[46] THEN GOTO label_9
   lw $t0 -220($sp)
   lw $t1 -224($sp)
    ble $t0 $t1 label_9

#------------149  WRITE var_1 is bigger than 0
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------150  JUMP to label_10
   j label_10

#------------151  label_9    ----------------Label----------------
label_9:

#------------152  label_10    ----------------Label----------------
label_10:

#------------153  FACTOR_VAR INT var_1 save in reg[47]
   lw $t3 -20($sp)
   sw $t3 -228($sp)

#------------154  FACTOR_CON INT 0 save in reg[48]
   li $t0 0
   sw $t0 -232($sp)

#------------155  IF reg[47] BLSS reg[48] THEN GOTO label_11
   lw $t0 -228($sp)
   lw $t1 -232($sp)
    blt $t0 $t1 label_11

#------------156  WRITE var_1 beq 0
   li $v0 4
   la $a0 .str_9
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------157  JUMP to label_12
   j label_12

#------------158  label_11    ----------------Label----------------
label_11:

#------------159  label_12    ----------------Label----------------
label_12:

#------------160  FACTOR_VAR INT var_1 save in reg[49]
   lw $t3 -20($sp)
   sw $t3 -236($sp)

#------------161  FACTOR_CON INT 0 save in reg[50]
   li $t0 0
   sw $t0 -240($sp)

#------------162  IF reg[49] BGEQ reg[50] THEN GOTO label_13
   lw $t0 -236($sp)
   lw $t1 -240($sp)
    bge $t0 $t1 label_13

#------------163  WRITE var_1 is smaller than 0
   li $v0 4
   la $a0 .str_10
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------164  JUMP to label_14
   j label_14

#------------165  label_13    ----------------Label----------------
label_13:

#------------166  label_14    ----------------Label----------------
label_14:

#------------167  FACTOR_VAR INT var_1 save in reg[51]
   lw $t3 -20($sp)
   sw $t3 -244($sp)

#------------168  FACTOR_CON INT 0 save in reg[52]
   li $t0 0
   sw $t0 -248($sp)

#------------169  IF reg[51] BGTR reg[52] THEN GOTO label_15
   lw $t0 -244($sp)
   lw $t1 -248($sp)
    bgt $t0 $t1 label_15

#------------170  WRITE var_1 leq than 0
   li $v0 4
   la $a0 .str_11
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------171  JUMP to label_16
   j label_16

#------------172  label_15    ----------------Label----------------
label_15:

#------------173  label_16    ----------------Label----------------
label_16:

#------------174  FACTOR_VAR INT var_1 save in reg[53]
   lw $t3 -20($sp)
   sw $t3 -252($sp)

#------------175  FACTOR_CON INT 0 save in reg[54]
   li $t0 0
   sw $t0 -256($sp)

#------------176  IF reg[53] BNE reg[54] THEN GOTO label_17
   lw $t0 -252($sp)
   lw $t1 -256($sp)
    bne $t0 $t1 label_17

#------------177  WRITE var_1 equals 0
   li $v0 4
   la $a0 .str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------178  JUMP to label_18
   j label_18

#------------179  label_17    ----------------Label----------------
label_17:

#------------180  label_18    ----------------Label----------------
label_18:

#------------181  FACTOR_VAR INT var_1 save in reg[55]
   lw $t3 -20($sp)
   sw $t3 -260($sp)

#------------182  FACTOR_CON INT 0 save in reg[56]
   li $t0 0
   sw $t0 -264($sp)

#------------183  IF reg[55] BEQ reg[56] THEN GOTO label_19
   lw $t0 -260($sp)
   lw $t1 -264($sp)
    beq $t0 $t1 label_19

#------------184  WRITE var_1 neq 0
   li $v0 4
   la $a0 .str_13
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------185  JUMP to label_20
   j label_20

#------------186  label_19    ----------------Label----------------
label_19:

#------------187  label_20    ----------------Label----------------
label_20:

#------------188  FACTOR_VAR INT var_2 save in reg[57]
   lw $t3 -24($sp)
   sw $t3 -268($sp)

#------------189  WRITE INT reg[57]
   li $v0 1
   lw $a0 -268($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------190  FACTOR_VAR INT suma save in reg[58]
   lw $t3 -32($sp)
   sw $t3 -272($sp)

#------------191  WRITE sum of ary is 
   li $v0 4
   la $a0 .str_14
   syscall

#------------192  WRITE INT reg[58]
   li $v0 1
   lw $a0 -272($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------193  FACTOR_VAR INT var_2 save in reg[59]
   lw $t3 -24($sp)
   sw $t3 -276($sp)

#------------194  PUSH INT parareg[1] from reg[59]
   sw $ra -280($sp)
   lw $t0 -276($sp)
   sw $t0 -284($sp)

#------------195  CALL INT factorial(1)
   addi $sp $sp -284
   jal .func_factorial
   subi $sp $sp -284
   lw $ra -280($sp)

#------------196  FACTOR_FUNC INT factorial save in reg[60]
   sw $v0 -280($sp)

#------------197  WRITE factorial of 3 is 
   li $v0 4
   la $a0 .str_15
   syscall

#------------198  WRITE INT reg[60]
   li $v0 1
   lw $a0 -280($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------199  FACTOR_VAR CHAR char_1 save in reg[61]
   lw $t3 -36($sp)
   sw $t3 -284($sp)

#------------200  WRITE char_1 is 
   li $v0 4
   la $a0 .str_16
   syscall

#------------201  WRITE CHAR reg[61]
   li $v0 11
   lw $a0 -284($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------202  FACTOR_VAR CHAR char_2 save in reg[62]
   lw $t3 -40($sp)
   sw $t3 -288($sp)

#------------203  WRITE ,char_2 is 
   li $v0 4
   la $a0 .str_17
   syscall

#------------204  WRITE CHAR reg[62]
   li $v0 11
   lw $a0 -288($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------205  FACTOR_VAR CHAR char_1 save in reg[63]
   lw $t3 -36($sp)
   sw $t3 -292($sp)

#------------206  FACTOR_VAR CHAR char_2 save in reg[64]
   lw $t3 -40($sp)
   sw $t3 -296($sp)

#------------207  reg[65] = reg[63] JIA reg[64]
   lw $t0 -292($sp)
   lw $t1 -296($sp)
   add $t2 $t0 $t1
   sw $t2 -300($sp)

#------------208  WRITE ,sum of char_1 and char_2 is 
   li $v0 4
   la $a0 .str_18
   syscall

#------------209  WRITE INT reg[65]
   li $v0 1
   lw $a0 -300($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------210  CALL VOID output(0)
   sw $ra -304($sp)
   addi $sp $sp -308
   jal .func_output
   subi $sp $sp -308
   lw $ra -304($sp)

#------------211  FACTOR_CON INT 70 save in reg[66]
   li $t0 70
   sw $t0 -304($sp)

#------------212  WRITE ascii no.
   li $v0 4
   la $a0 .str_19
   syscall

#------------213  WRITE INT reg[66]
   li $v0 1
   lw $a0 -304($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------214  FACTOR_CON INT 70 save in reg[67]
   li $t0 70
   sw $t0 -308($sp)

#------------215  PUSH INT parareg[2] from reg[67]
   sw $ra -312($sp)
   lw $t0 -308($sp)
   sw $t0 -316($sp)

#------------216  CALL CHAR printchar(1)
   addi $sp $sp -316
   jal .func_printchar
   subi $sp $sp -316
   lw $ra -312($sp)

#------------217  FACTOR_FUNC CHAR printchar save in reg[68]
   sw $v0 -312($sp)

#------------218  WRITE  is 
   li $v0 4
   la $a0 .str_20
   syscall

#------------219  WRITE CHAR reg[68]
   li $v0 11
   lw $a0 -312($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

   jr $ra

end:
