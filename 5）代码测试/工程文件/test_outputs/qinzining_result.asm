.data
   .var_x: .word 0
   .var_yy: .word 0
   .var_zz: .word 0
   .var_yyy: .space 28
   .str_0: .asciiz "!@#$%%abcd114514ABCD963287~;: "
   .str_1: .asciiz "1 hit "
   .str_2: .asciiz "2 hit "
   .str_3: .asciiz "3 hit "
   .str_4: .asciiz "4 hit "
   .str_5: .asciiz "5 hit "
   .str_6: .asciiz "6 hit "
.text
   jal .func_main
   j end
#------------10  FUNC INT fact(1)
.func_fact:

#------------11  PARA INT t

#------------12  FACTOR_VAR INT t save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------13  FACTOR_CON INT 3 save in reg[2]
   li $t0 3
   sw $t0 -8($sp)

#------------14  IF reg[1] BGEQ reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_0

#------------15  FACTOR_VAR INT t save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------16  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------17  JUMP to label_1
   j label_1

#------------18  label_0    ----------------Label----------------
label_0:

#------------19  FACTOR_VAR INT t save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------20  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------21  reg[5] = reg[4] JIAN reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------22  PUSH INT parareg[0] from reg[5]
   sw $ra -24($sp)
   lw $t0 -20($sp)
   sw $t0 -28($sp)

#------------23  CALL INT fact(1)
   addi $sp $sp -28
   jal .func_fact
   subi $sp $sp -28
   lw $ra -24($sp)

#------------24  FACTOR_FUNC INT fact save in reg[6]
   sw $v0 -24($sp)

#------------25  FACTOR_VAR INT t save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------26  reg[7] = reg[6] CHENG reg[7]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -28($sp)

#------------27  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------28  label_1    ----------------Label----------------
label_1:

#------------29  FUNC INT rt15(0)
   jr $ra

.func_rt15:

#------------30  CONST INT zero = 1

#------------31  FACTOR_CON INT 3 save in reg[1]
   li $t0 3
   sw $t0 0($sp)

#------------32  FACTOR_CON INT 5 save in reg[2]
   li $t0 5
   sw $t0 -4($sp)

#------------33  reg[2] = reg[1] CHENG reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -4($sp)

#------------34  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------35  reg[3] = reg[2] CHU reg[3]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -8($sp)

#------------36  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -12($sp)

#------------37  reg[4] = reg[3] JIA reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------38  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -16($sp)

#------------39  reg[5] = reg[4] JIAN reg[5]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   sub $t2 $t0 $t1
   sw $t2 -16($sp)

#------------40  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------41  FUNC CHAR fun2(6)
   jr $ra

.func_fun2:

#------------42  PARA INT a

#------------43  PARA INT b

#------------44  PARA INT c

#------------45  PARA INT d

#------------46  PARA INT e

#------------47  PARA INT f

#------------48  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------49  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------50  FACTOR_VAR INT c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------51  reg[3] = reg[2] CHENG reg[3]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -32($sp)

#------------52  FACTOR_VAR INT d save in reg[4]
   lw $t3 -12($sp)
   sw $t3 -36($sp)

#------------53  reg[4] = reg[3] CHENG reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------54  FACTOR_VAR INT e save in reg[5]
   lw $t3 -16($sp)
   sw $t3 -40($sp)

#------------55  reg[5] = reg[4] CHU reg[5]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -40($sp)

#------------56  reg[5] = reg[1] JIA reg[5]
   lw $t0 -24($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------57  FACTOR_VAR INT f save in reg[6]
   lw $t3 -20($sp)
   sw $t3 -44($sp)

#------------58  reg[6] = reg[5] JIAN reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------59  WRITE INT reg[6]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------60  FACTOR_CON CHAR 65 save in reg[7]
   li $t0 65
   sw $t0 -48($sp)

#------------61  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------62  FUNC VOID main(0)
   jr $ra

.func_main:

#------------63  CONST INT b = 1

#------------64  CONST INT c = 2

#------------65  CONST INT d = 3

#------------66  CONST INT e = 4

#------------67  ARRAY CHAR ar[2]

#------------68  VAR INT r

#------------69  ARRAY INT m1[8]

#------------70  VAR INT aa

#------------71  VAR INT a

#------------72  FACTOR_CON INT -1 save in reg[8]
   li $t0 -1
   sw $t0 -80($sp)

#------------73  ASSIGN_EXTERN INT x = reg[8]
   lw $t3 -80($sp)
   sw $t3 .var_x

#------------74  FACTOR_CON INT 4 save in reg[9]
   li $t0 4
   sw $t0 -84($sp)

#------------75  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -88($sp)

#------------76  reg[10] = reg[10] JIAN reg[9]
   lw $t0 -88($sp)
   lw $t1 -84($sp)
   sub $t2 $t0 $t1
   sw $t2 -88($sp)

#------------77  ASSIGN INT r = reg[10]
   lw $t3 -88($sp)
   sw $t3 -8($sp)

#------------78  FACTOR_CON INT 6 save in reg[11]
   li $t0 6
   sw $t0 -92($sp)

#------------79  ASSIGN INT aa = reg[11]
   lw $t3 -92($sp)
   sw $t3 -44($sp)

#------------80  WRITE !@#$%%abcd114514ABCD963287~;: 
   li $v0 4
   la $a0 .str_0
   syscall

#------------81  FACTOR_VAR INT aa save in reg[12]
   lw $t3 -44($sp)
   sw $t3 -96($sp)

#------------82  PUSH INT parareg[1] from reg[12]
   sw $ra -100($sp)
   lw $t0 -96($sp)
   sw $t0 -104($sp)

#------------83  CALL INT fact(1)
   addi $sp $sp -104
   jal .func_fact
   subi $sp $sp -104
   lw $ra -100($sp)

#------------84  FACTOR_FUNC INT fact save in reg[13]
   sw $v0 -100($sp)

#------------85  WRITE INT reg[13]
   li $v0 1
   lw $a0 -100($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------86  FACTOR_CON INT 3 save in reg[14]
   li $t0 3
   sw $t0 -104($sp)

#------------87  FACTOR_CON INT 4 save in reg[15]
   li $t0 4
   sw $t0 -108($sp)

#------------88  reg[15] = reg[14] CHENG reg[15]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -108($sp)

#------------89  FACTOR_CON INT 6 save in reg[16]
   li $t0 6
   sw $t0 -112($sp)

#------------90  FACTOR_CON INT -2 save in reg[17]
   li $t0 -2
   sw $t0 -116($sp)

#------------91  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -120($sp)

#------------92  reg[18] = reg[17] JIA reg[18]
   lw $t0 -116($sp)
   lw $t1 -120($sp)
   add $t2 $t0 $t1
   sw $t2 -120($sp)

#------------93  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -124($sp)

#------------94  reg[19] = reg[18] JIAN reg[19]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   sub $t2 $t0 $t1
   sw $t2 -124($sp)

#------------95  FACTOR_EXPR reg[19] save in reg[20]
   lw $t0 -124($sp)
   sw $t0 -128($sp)

#------------96  reg[20] = reg[16] CHENG reg[20]
   lw $t0 -112($sp)
   lw $t1 -128($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -128($sp)

#------------97  reg[20] = reg[15] JIA reg[20]
   lw $t0 -108($sp)
   lw $t1 -128($sp)
   add $t2 $t0 $t1
   sw $t2 -128($sp)

#------------98  FACTOR_VAR_EXTERN INT x save in reg[21]
   lw $t3 .var_x
   sw $t3 -132($sp)

#------------99  FACTOR_VAR INT r save in reg[22]
   lw $t3 -8($sp)
   sw $t3 -136($sp)

#------------100  reg[22] = reg[21] JIAN reg[22]
   lw $t0 -132($sp)
   lw $t1 -136($sp)
   sub $t2 $t0 $t1
   sw $t2 -136($sp)

#------------101  FACTOR_VAR INT aa save in reg[23]
   lw $t3 -44($sp)
   sw $t3 -140($sp)

#------------102  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -144($sp)

#------------103  FACTOR_CON INT 4 save in reg[25]
   li $t0 4
   sw $t0 -148($sp)

#------------104  FACTOR_CON INT 2 save in reg[26]
   li $t0 2
   sw $t0 -152($sp)

#------------105  FACTOR_CON INT -2 save in reg[27]
   li $t0 -2
   sw $t0 -156($sp)

#------------106  PUSH INT parareg[2] from reg[22]
   sw $ra -160($sp)
   lw $t0 -136($sp)
   sw $t0 -164($sp)

#------------107  PUSH INT parareg[3] from reg[23]
   lw $t0 -140($sp)
   sw $t0 -168($sp)

#------------108  PUSH INT parareg[4] from reg[24]
   lw $t0 -144($sp)
   sw $t0 -172($sp)

#------------109  PUSH INT parareg[5] from reg[25]
   lw $t0 -148($sp)
   sw $t0 -176($sp)

#------------110  PUSH INT parareg[6] from reg[26]
   lw $t0 -152($sp)
   sw $t0 -180($sp)

#------------111  PUSH INT parareg[7] from reg[27]
   lw $t0 -156($sp)
   sw $t0 -184($sp)

#------------112  CALL CHAR fun2(6)
   addi $sp $sp -164
   jal .func_fun2
   subi $sp $sp -164
   lw $ra -160($sp)

#------------113  FACTOR_FUNC CHAR fun2 save in reg[28]
   sw $v0 -160($sp)

#------------114  ASSIGN_ARR CHAR ar[reg[20]] = reg[28]
   lw $t0 -128($sp)
   lw $t1 -160($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 0($t0)

#------------115  FACTOR_CON INT 0 save in reg[29]
   li $t0 0
   sw $t0 -164($sp)

#------------116  FACTOR_CON INT 4 save in reg[30]
   li $t0 4
   sw $t0 -168($sp)

#------------117  PUSH INT parareg[8] from reg[30]
   sw $ra -172($sp)
   lw $t0 -168($sp)
   sw $t0 -176($sp)

#------------118  CALL INT fact(1)
   addi $sp $sp -176
   jal .func_fact
   subi $sp $sp -176
   lw $ra -172($sp)

#------------119  FACTOR_FUNC INT fact save in reg[31]
   sw $v0 -172($sp)

#------------120  reg[31] = reg[29] CHU reg[31]
   lw $t0 -164($sp)
   lw $t1 -172($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -172($sp)

#------------121  FACTOR_ARRAY CHAR ar [reg[31]] save in reg[32]
   lw $t3 -172($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -176($sp)

#------------122  FACTOR_EXPR reg[32] save in reg[33]
   lw $t0 -176($sp)
   sw $t0 -180($sp)

#------------123  WRITE INT reg[33]
   li $v0 1
   lw $a0 -180($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------124  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -184($sp)

#------------125  FACTOR_CON CHAR 48 save in reg[35]
   li $t0 48
   sw $t0 -188($sp)

#------------126  ASSIGN_ARR CHAR ar[reg[34]] = reg[35]
   lw $t0 -184($sp)
   lw $t1 -188($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 0($t0)

#------------127  FACTOR_CON INT 1 save in reg[36]
   li $t0 1
   sw $t0 -192($sp)

#------------128  FACTOR_CON INT 1 save in reg[37]
   li $t0 1
   sw $t0 -196($sp)

#------------129  FACTOR_ARRAY CHAR ar [reg[37]] save in reg[38]
   lw $t3 -196($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -200($sp)

#------------130  CALL INT rt15(0)
   sw $ra -204($sp)
   addi $sp $sp -208
   jal .func_rt15
   subi $sp $sp -208
   lw $ra -204($sp)

#------------131  FACTOR_FUNC INT rt15 save in reg[39]
   sw $v0 -204($sp)

#------------132  reg[39] = reg[38] JIA reg[39]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   add $t2 $t0 $t1
   sw $t2 -204($sp)

#------------133  FACTOR_EXPR reg[39] save in reg[40]
   lw $t0 -204($sp)
   sw $t0 -208($sp)

#------------134  reg[40] = reg[36] CHENG reg[40]
   lw $t0 -192($sp)
   lw $t1 -208($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -208($sp)

#------------135  FACTOR_CON INT 0 save in reg[41]
   li $t0 0
   sw $t0 -212($sp)

#------------136  reg[41] = reg[41] JIAN reg[40]
   lw $t0 -212($sp)
   lw $t1 -208($sp)
   sub $t2 $t0 $t1
   sw $t2 -212($sp)

#------------137  FACTOR_CON INT 2 save in reg[42]
   li $t0 2
   sw $t0 -216($sp)

#------------138  FACTOR_CON INT 4 save in reg[43]
   li $t0 4
   sw $t0 -220($sp)

#------------139  FACTOR_CON INT 9 save in reg[44]
   li $t0 9
   sw $t0 -224($sp)

#------------140  reg[44] = reg[43] CHENG reg[44]
   lw $t0 -220($sp)
   lw $t1 -224($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -224($sp)

#------------141  reg[44] = reg[42] JIAN reg[44]
   lw $t0 -216($sp)
   lw $t1 -224($sp)
   sub $t2 $t0 $t1
   sw $t2 -224($sp)

#------------142  FACTOR_EXPR reg[44] save in reg[45]
   lw $t0 -224($sp)
   sw $t0 -228($sp)

#------------143  reg[45] = reg[41] JIA reg[45]
   lw $t0 -212($sp)
   lw $t1 -228($sp)
   add $t2 $t0 $t1
   sw $t2 -228($sp)

#------------144  FACTOR_CON INT 2 save in reg[46]
   li $t0 2
   sw $t0 -232($sp)

#------------145  FACTOR_CON CHAR 109 save in reg[47]
   li $t0 109
   sw $t0 -236($sp)

#------------146  reg[47] = reg[46] CHENG reg[47]
   lw $t0 -232($sp)
   lw $t1 -236($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -236($sp)

#------------147  reg[47] = reg[45] JIA reg[47]
   lw $t0 -228($sp)
   lw $t1 -236($sp)
   add $t2 $t0 $t1
   sw $t2 -236($sp)

#------------148  ASSIGN INT aa = reg[47]
   lw $t3 -236($sp)
   sw $t3 -44($sp)

#------------149  FACTOR_VAR INT aa save in reg[48]
   lw $t3 -44($sp)
   sw $t3 -240($sp)

#------------150  WRITE INT reg[48]
   li $v0 1
   lw $a0 -240($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------151  FACTOR_VAR INT aa save in reg[49]
   lw $t3 -44($sp)
   sw $t3 -244($sp)

#------------152  ASSIGN INT a = reg[49]
   lw $t3 -244($sp)
   sw $t3 -48($sp)

#------------153  READ INT a
   li $v0 5
   syscall
   sw $v0 -48($sp)

#------------154  READ_EXTERN INT x
   li $v0 5
   syscall
   sw $v0 .var_x

#------------155  FACTOR_VAR INT a save in reg[50]
   lw $t3 -48($sp)
   sw $t3 -248($sp)

#------------156  FACTOR_CON INT 0 save in reg[51]
   li $t0 0
   sw $t0 -252($sp)

#------------157  IF reg[50] BLEQ reg[51] THEN GOTO label_4
   lw $t0 -248($sp)
   lw $t1 -252($sp)
    ble $t0 $t1 label_4

#------------158  WRITE 1 hit 
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------159  FACTOR_VAR_EXTERN INT x save in reg[52]
   lw $t3 .var_x
   sw $t3 -256($sp)

#------------160  FACTOR_CON INT 0 save in reg[53]
   li $t0 0
   sw $t0 -260($sp)

#------------161  IF reg[52] BGTR reg[53] THEN GOTO label_2
   lw $t0 -256($sp)
   lw $t1 -260($sp)
    bgt $t0 $t1 label_2

#------------162  FACTOR_VAR INT a save in reg[54]
   lw $t3 -48($sp)
   sw $t3 -264($sp)

#------------163  FACTOR_VAR_EXTERN INT x save in reg[55]
   lw $t3 .var_x
   sw $t3 -268($sp)

#------------164  reg[55] = reg[54] CHU reg[55]
   lw $t0 -264($sp)
   lw $t1 -268($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -268($sp)

#------------165  FACTOR_VAR INT a save in reg[56]
   lw $t3 -48($sp)
   sw $t3 -272($sp)

#------------166  reg[56] = reg[55] CHENG reg[56]
   lw $t0 -268($sp)
   lw $t1 -272($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -272($sp)

#------------167  ASSIGN INT r = reg[56]
   lw $t3 -272($sp)
   sw $t3 -8($sp)

#------------168  WRITE 2 hit 
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------169  JUMP to label_3
   j label_3

#------------170  label_2    ----------------Label----------------
label_2:

#------------171  label_3    ----------------Label----------------
label_3:

#------------172  FACTOR_VAR INT r save in reg[57]
   lw $t3 -8($sp)
   sw $t3 -276($sp)

#------------173  FACTOR_VAR INT aa save in reg[58]
   lw $t3 -44($sp)
   sw $t3 -280($sp)

#------------174  reg[58] = reg[57] JIA reg[58]
   lw $t0 -276($sp)
   lw $t1 -280($sp)
   add $t2 $t0 $t1
   sw $t2 -280($sp)

#------------175  ASSIGN INT r = reg[58]
   lw $t3 -280($sp)
   sw $t3 -8($sp)

#------------176  JUMP to label_5
   j label_5

#------------177  label_4    ----------------Label----------------
label_4:

#------------178  label_5    ----------------Label----------------
label_5:

#------------179  FACTOR_VAR_EXTERN INT x save in reg[59]
   lw $t3 .var_x
   sw $t3 -284($sp)

#------------180  FACTOR_CON INT 0 save in reg[60]
   li $t0 0
   sw $t0 -288($sp)

#------------181  IF reg[59] BEQ reg[60] THEN GOTO label_8
   lw $t0 -284($sp)
   lw $t1 -288($sp)
    beq $t0 $t1 label_8

#------------182  WRITE 3 hit 
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------183  FACTOR_VAR INT a save in reg[61]
   lw $t3 -48($sp)
   sw $t3 -292($sp)

#------------184  FACTOR_CON INT 4 save in reg[62]
   li $t0 4
   sw $t0 -296($sp)

#------------185  FACTOR_CON INT 0 save in reg[63]
   li $t0 0
   sw $t0 -300($sp)

#------------186  reg[63] = reg[63] JIAN reg[62]
   lw $t0 -300($sp)
   lw $t1 -296($sp)
   sub $t2 $t0 $t1
   sw $t2 -300($sp)

#------------187  IF reg[61] BNE reg[63] THEN GOTO label_6
   lw $t0 -292($sp)
   lw $t1 -300($sp)
    bne $t0 $t1 label_6

#------------188  FACTOR_VAR INT r save in reg[64]
   lw $t3 -8($sp)
   sw $t3 -304($sp)

#------------189  FACTOR_CON INT 1 save in reg[65]
   li $t0 1
   sw $t0 -308($sp)

#------------190  reg[65] = reg[64] JIA reg[65]
   lw $t0 -304($sp)
   lw $t1 -308($sp)
   add $t2 $t0 $t1
   sw $t2 -308($sp)

#------------191  ASSIGN INT r = reg[65]
   lw $t3 -308($sp)
   sw $t3 -8($sp)

#------------192  WRITE 4 hit 
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------193  JUMP to label_7
   j label_7

#------------194  label_6    ----------------Label----------------
label_6:

#------------195  label_7    ----------------Label----------------
label_7:

#------------196  JUMP to label_9
   j label_9

#------------197  label_8    ----------------Label----------------
label_8:

#------------198  label_9    ----------------Label----------------
label_9:

#------------199  FACTOR_VAR INT a save in reg[66]
   lw $t3 -48($sp)
   sw $t3 -312($sp)

#------------200  FACTOR_CON INT 0 save in reg[67]
   li $t0 0
   sw $t0 -316($sp)

#------------201  IF reg[66] BGEQ reg[67] THEN GOTO label_12
   lw $t0 -312($sp)
   lw $t1 -316($sp)
    bge $t0 $t1 label_12

#------------202  WRITE 5 hit 
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------203  FACTOR_VAR_EXTERN INT x save in reg[68]
   lw $t3 .var_x
   sw $t3 -320($sp)

#------------204  FACTOR_CON INT 0 save in reg[69]
   li $t0 0
   sw $t0 -324($sp)

#------------205  IF reg[68] BLSS reg[69] THEN GOTO label_10
   lw $t0 -320($sp)
   lw $t1 -324($sp)
    blt $t0 $t1 label_10

#------------206  FACTOR_VAR INT r save in reg[70]
   lw $t3 -8($sp)
   sw $t3 -328($sp)

#------------207  FACTOR_VAR INT a save in reg[71]
   lw $t3 -48($sp)
   sw $t3 -332($sp)

#------------208  reg[71] = reg[70] JIA reg[71]
   lw $t0 -328($sp)
   lw $t1 -332($sp)
   add $t2 $t0 $t1
   sw $t2 -332($sp)

#------------209  ASSIGN INT r = reg[71]
   lw $t3 -332($sp)
   sw $t3 -8($sp)

#------------210  WRITE 6 hit 
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------211  JUMP to label_11
   j label_11

#------------212  label_10    ----------------Label----------------
label_10:

#------------213  label_11    ----------------Label----------------
label_11:

#------------214  JUMP to label_13
   j label_13

#------------215  label_12    ----------------Label----------------
label_12:

#------------216  FACTOR_VAR INT r save in reg[72]
   lw $t3 -8($sp)
   sw $t3 -336($sp)

#------------217  FACTOR_CON INT -1 save in reg[73]
   li $t0 -1
   sw $t0 -340($sp)

#------------218  reg[73] = reg[72] CHENG reg[73]
   lw $t0 -336($sp)
   lw $t1 -340($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -340($sp)

#------------219  ASSIGN INT r = reg[73]
   lw $t3 -340($sp)
   sw $t3 -8($sp)

#------------220  FACTOR_VAR INT r save in reg[74]
   lw $t3 -8($sp)
   sw $t3 -344($sp)

#------------221  WRITE INT reg[74]
   li $v0 1
   lw $a0 -344($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------222  label_13    ----------------Label----------------
label_13:

#------------223  FACTOR_CON INT 2 save in reg[75]
   li $t0 2
   sw $t0 -348($sp)

#------------224  FACTOR_CON INT 0 save in reg[76]
   li $t0 0
   sw $t0 -352($sp)

#------------225  reg[76] = reg[76] JIAN reg[75]
   lw $t0 -352($sp)
   lw $t1 -348($sp)
   sub $t2 $t0 $t1
   sw $t2 -352($sp)

#------------226  ASSIGN INT a = reg[76]
   lw $t3 -352($sp)
   sw $t3 -48($sp)

#------------227  JUMP to label_15
   j label_15

#------------228  label_14    ----------------Label----------------
label_14:

#------------229  FACTOR_VAR INT a save in reg[77]
   lw $t3 -48($sp)
   sw $t3 -356($sp)

#------------230  FACTOR_CON INT 1 save in reg[78]
   li $t0 1
   sw $t0 -360($sp)

#------------231  reg[78] = reg[77] JIA reg[78]
   lw $t0 -356($sp)
   lw $t1 -360($sp)
   add $t2 $t0 $t1
   sw $t2 -360($sp)

#------------232  ASSIGN INT a = reg[78]
   lw $t3 -360($sp)
   sw $t3 -48($sp)

#------------233  FACTOR_VAR INT a save in reg[79]
   lw $t3 -48($sp)
   sw $t3 -364($sp)

#------------234  FACTOR_CON INT 3 save in reg[80]
   li $t0 3
   sw $t0 -368($sp)

#------------235  IF reg[79] BGEQ reg[80] THEN GOTO label_16
   lw $t0 -364($sp)
   lw $t1 -368($sp)
    bge $t0 $t1 label_16

#------------236  label_15    ----------------Label----------------
label_15:

#------------237  FACTOR_VAR_EXTERN INT x save in reg[81]
   lw $t3 .var_x
   sw $t3 -372($sp)

#------------238  FACTOR_CON INT 4 save in reg[82]
   li $t0 4
   sw $t0 -376($sp)

#------------239  reg[82] = reg[81] JIA reg[82]
   lw $t0 -372($sp)
   lw $t1 -376($sp)
   add $t2 $t0 $t1
   sw $t2 -376($sp)

#------------240  ASSIGN_EXTERN INT x = reg[82]
   lw $t3 -376($sp)
   sw $t3 .var_x

#------------241  JUMP to label_14
   j label_14

#------------242  label_16    ----------------Label----------------
label_16:

#------------243  label_17    ----------------Label----------------
label_17:

#------------244  FACTOR_VAR_EXTERN INT x save in reg[83]
   lw $t3 .var_x
   sw $t3 -380($sp)

#------------245  FACTOR_CON INT 0 save in reg[84]
   li $t0 0
   sw $t0 -384($sp)

#------------246  IF reg[83] BLEQ reg[84] THEN GOTO label_18
   lw $t0 -380($sp)
   lw $t1 -384($sp)
    ble $t0 $t1 label_18

#------------247  FACTOR_VAR_EXTERN INT x save in reg[85]
   lw $t3 .var_x
   sw $t3 -388($sp)

#------------248  FACTOR_CON INT 2 save in reg[86]
   li $t0 2
   sw $t0 -392($sp)

#------------249  reg[86] = reg[85] JIAN reg[86]
   lw $t0 -388($sp)
   lw $t1 -392($sp)
   sub $t2 $t0 $t1
   sw $t2 -392($sp)

#------------250  ASSIGN_EXTERN INT x = reg[86]
   lw $t3 -392($sp)
   sw $t3 .var_x

#------------251  JUMP to label_17
   j label_17

#------------252  label_18    ----------------Label----------------
label_18:

#------------253  FACTOR_VAR_EXTERN INT x save in reg[87]
   lw $t3 .var_x
   sw $t3 -396($sp)

#------------254  WRITE INT reg[87]
   li $v0 1
   lw $a0 -396($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

   jr $ra

end:
