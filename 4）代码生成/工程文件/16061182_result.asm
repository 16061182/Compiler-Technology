.data
   str_0: .asciiz "var2[1] is true"
   str_1: .asciiz "print2 called"
   str_2: .asciiz "result1 = "
   str_3: .asciiz "the 10th Fibonacci number is "
.text
   jal main
   j end
#------------2  FUNC INT getint(1)
getint:

#------------3  PARA INT i

#------------4  FACTOR_VAR INT i save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------5  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------6  IF reg[1] BGEQ reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_0

#------------7  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -12($sp)

#------------8  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------9  JUMP to label_1
   j label_1

#------------10  label_0    ----------------Label----------------
label_0:

#------------11  label_1    ----------------Label----------------
label_1:

#------------12  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------13  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------14  IF reg[4] BNE reg[5] THEN GOTO label_2
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_2

#------------15  FACTOR_CON INT 0 save in reg[6]
   li $t0 0
   sw $t0 -24($sp)

#------------16  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------17  JUMP to label_3
   j label_3

#------------18  label_2    ----------------Label----------------
label_2:

#------------19  label_3    ----------------Label----------------
label_3:

#------------20  FACTOR_VAR INT i save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------21  FACTOR_CON INT 2 save in reg[8]
   li $t0 2
   sw $t0 -32($sp)

#------------22  IF reg[7] BNE reg[8] THEN GOTO label_4
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    bne $t0 $t1 label_4

#------------23  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -36($sp)

#------------24  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------25  JUMP to label_5
   j label_5

#------------26  label_4    ----------------Label----------------
label_4:

#------------27  label_5    ----------------Label----------------
label_5:

#------------28  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------29  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -44($sp)

#------------30  reg[11] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------31  PUSH INT parareg[0] from reg[11]
   sw $ra -48($sp)
   lw $t0 -44($sp)
   sw $t0 -52($sp)

#------------32  CALL INT getint(1)
   addi $sp $sp -52
   jal getint
   subi $sp $sp -52
   lw $ra -48($sp)

#------------33  FACTOR_FUNC INT getint save in reg[11]
   sw $v0 -44($sp)

#------------34  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------35  FACTOR_CON INT 2 save in reg[13]
   li $t0 2
   sw $t0 -52($sp)

#------------36  reg[13] = reg[12] JIAN reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -52($sp)

#------------37  PUSH INT parareg[1] from reg[13]
   sw $ra -56($sp)
   lw $t0 -52($sp)
   sw $t0 -60($sp)

#------------38  CALL INT getint(1)
   addi $sp $sp -60
   jal getint
   subi $sp $sp -60
   lw $ra -56($sp)

#------------39  FACTOR_FUNC INT getint save in reg[13]
   sw $v0 -52($sp)

#------------40  reg[13] = reg[11] JIA reg[13]
   lw $t0 -44($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------41  RETURN reg[13] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------42  FUNC CHAR getcha(0)
getcha:

#------------43  CONST CHAR c = 97

#------------44  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 0($sp)

#------------45  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------46  FUNC VOID print1(3)
print1:

#------------47  PARA INT i

#------------48  PARA INT j

#------------49  PARA CHAR c

#------------50  VAR CHAR var1

#------------51  VAR INT num

#------------52  VAR INT count

#------------53  ARRAY INT var2[8]

#------------54  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 -56($sp)

#------------55  ASSIGN CHAR var1 = reg[1]
   lw $t3 -56($sp)
   sw $t3 -12($sp)

#------------56  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -60($sp)

#------------57  ASSIGN INT num = reg[2]
   lw $t3 -60($sp)
   sw $t3 -16($sp)

#------------58  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -64($sp)

#------------59  ASSIGN INT count = reg[3]
   lw $t3 -64($sp)
   sw $t3 -20($sp)

#------------60  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -68($sp)

#------------61  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -72($sp)

#------------62  ASSIGN_ARR INT var2[reg[4]] = reg[5]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------63  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -76($sp)

#------------64  FACTOR_VAR INT i save in reg[7]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------65  FACTOR_VAR INT j save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------66  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   sub $t2 $t0 $t1
   sw $t2 -84($sp)

#------------67  ASSIGN_ARR INT var2[reg[6]] = reg[8]
   lw $t0 -76($sp)
   lw $t1 -84($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------68  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -88($sp)

#------------69  FACTOR_ARRAY INT var2 [reg[9]] save in reg[10]
   lw $t3 -88($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -92($sp)

#------------70  IF reg[10] BEQ reg[0] THEN GOTO label_6
   lw $t0 -92($sp)
    beq $t0 $0 label_6

#------------71  WRITE var2[1] is true
   li $v0 4
   la $a0 str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------72  JUMP to label_7
   j label_7

#------------73  label_6    ----------------Label----------------
label_6:

#------------74  label_7    ----------------Label----------------
label_7:

#------------75  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -96($sp)

#------------76  FACTOR_VAR INT j save in reg[12]
   lw $t3 -4($sp)
   sw $t3 -100($sp)

#------------77  IF reg[11] BGEQ reg[12] THEN GOTO label_8
   lw $t0 -96($sp)
   lw $t1 -100($sp)
    bge $t0 $t1 label_8

#------------78  FACTOR_VAR INT num save in reg[13]
   lw $t3 -16($sp)
   sw $t3 -104($sp)

#------------79  FACTOR_CON INT 1 save in reg[14]
   li $t0 1
   sw $t0 -108($sp)

#------------80  reg[14] = reg[13] JIA reg[14]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   add $t2 $t0 $t1
   sw $t2 -108($sp)

#------------81  ASSIGN INT num = reg[14]
   lw $t3 -108($sp)
   sw $t3 -16($sp)

#------------82  JUMP to label_9
   j label_9

#------------83  label_8    ----------------Label----------------
label_8:

#------------84  FACTOR_VAR INT num save in reg[15]
   lw $t3 -16($sp)
   sw $t3 -112($sp)

#------------85  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -116($sp)

#------------86  reg[16] = reg[15] JIAN reg[16]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   sub $t2 $t0 $t1
   sw $t2 -116($sp)

#------------87  ASSIGN INT num = reg[16]
   lw $t3 -116($sp)
   sw $t3 -16($sp)

#------------88  label_9    ----------------Label----------------
label_9:

#------------89  FACTOR_VAR INT i save in reg[17]
   lw $t3 0($sp)
   sw $t3 -120($sp)

#------------90  FACTOR_VAR INT j save in reg[18]
   lw $t3 -4($sp)
   sw $t3 -124($sp)

#------------91  IF reg[17] BLEQ reg[18] THEN GOTO label_10
   lw $t0 -120($sp)
   lw $t1 -124($sp)
    ble $t0 $t1 label_10

#------------92  FACTOR_CON INT 2 save in reg[19]
   li $t0 2
   sw $t0 -128($sp)

#------------93  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -132($sp)

#------------94  ASSIGN_ARR INT var2[reg[19]] = reg[20]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------95  JUMP to label_11
   j label_11

#------------96  label_10    ----------------Label----------------
label_10:

#------------97  label_11    ----------------Label----------------
label_11:

#------------98  FACTOR_VAR INT i save in reg[21]
   lw $t3 0($sp)
   sw $t3 -136($sp)

#------------99  FACTOR_VAR INT j save in reg[22]
   lw $t3 -4($sp)
   sw $t3 -140($sp)

#------------100  IF reg[21] BEQ reg[22] THEN GOTO label_12
   lw $t0 -136($sp)
   lw $t1 -140($sp)
    beq $t0 $t1 label_12

#------------101  FACTOR_CON INT 3 save in reg[23]
   li $t0 3
   sw $t0 -144($sp)

#------------102  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -148($sp)

#------------103  ASSIGN_ARR INT var2[reg[23]] = reg[24]
   lw $t0 -144($sp)
   lw $t1 -148($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------104  JUMP to label_13
   j label_13

#------------105  label_12    ----------------Label----------------
label_12:

#------------106  label_13    ----------------Label----------------
label_13:

#------------107  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -152($sp)

#------------108  FACTOR_ARRAY INT var2 [reg[25]] save in reg[26]
   lw $t3 -152($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -156($sp)

#------------109  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -160($sp)

#------------110  FACTOR_ARRAY INT var2 [reg[27]] save in reg[28]
   lw $t3 -160($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -164($sp)

#------------111  reg[28] = reg[26] CHENG reg[28]
   lw $t0 -156($sp)
   lw $t1 -164($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -164($sp)

#------------112  IF reg[28] BEQ reg[0] THEN GOTO label_14
   lw $t0 -164($sp)
    beq $t0 $0 label_14

#------------113  FACTOR_CON INT 4 save in reg[29]
   li $t0 4
   sw $t0 -168($sp)

#------------114  FACTOR_CON INT 1 save in reg[30]
   li $t0 1
   sw $t0 -172($sp)

#------------115  ASSIGN_ARR INT var2[reg[29]] = reg[30]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------116  JUMP to label_15
   j label_15

#------------117  label_14    ----------------Label----------------
label_14:

#------------118  label_15    ----------------Label----------------
label_15:

#------------119  FACTOR_CON INT 100 save in reg[31]
   li $t0 100
   sw $t0 -176($sp)

#------------120  FACTOR_CON CHAR 97 save in reg[32]
   li $t0 97
   sw $t0 -180($sp)

#------------121  reg[32] = reg[31] CHU reg[32]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -180($sp)

#------------122  FACTOR_VAR INT i save in reg[33]
   lw $t3 0($sp)
   sw $t3 -184($sp)

#------------123  reg[33] = reg[32] CHU reg[33]
   lw $t0 -180($sp)
   lw $t1 -184($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -184($sp)

#------------124  IF reg[33] BEQ reg[0] THEN GOTO label_16
   lw $t0 -184($sp)
    beq $t0 $0 label_16

#------------125  FACTOR_CON INT 5 save in reg[34]
   li $t0 5
   sw $t0 -188($sp)

#------------126  FACTOR_CON INT 1 save in reg[35]
   li $t0 1
   sw $t0 -192($sp)

#------------127  ASSIGN_ARR INT var2[reg[34]] = reg[35]
   lw $t0 -188($sp)
   lw $t1 -192($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------128  JUMP to label_17
   j label_17

#------------129  label_16    ----------------Label----------------
label_16:

#------------130  label_17    ----------------Label----------------
label_17:

#------------131  FACTOR_VAR INT i save in reg[36]
   lw $t3 0($sp)
   sw $t3 -196($sp)

#------------132  FACTOR_CON INT 0 save in reg[37]
   li $t0 0
   sw $t0 -200($sp)

#------------133  reg[37] = reg[37] JIAN reg[36]
   lw $t0 -200($sp)
   lw $t1 -196($sp)
   sub $t2 $t0 $t1
   sw $t2 -200($sp)

#------------134  FACTOR_VAR INT j save in reg[38]
   lw $t3 -4($sp)
   sw $t3 -204($sp)

#------------135  reg[38] = reg[37] JIA reg[38]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   add $t2 $t0 $t1
   sw $t2 -204($sp)

#------------136  IF reg[38] BEQ reg[0] THEN GOTO label_18
   lw $t0 -204($sp)
    beq $t0 $0 label_18

#------------137  FACTOR_CON INT 6 save in reg[39]
   li $t0 6
   sw $t0 -208($sp)

#------------138  FACTOR_CON INT 1 save in reg[40]
   li $t0 1
   sw $t0 -212($sp)

#------------139  ASSIGN_ARR INT var2[reg[39]] = reg[40]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------140  JUMP to label_19
   j label_19

#------------141  label_18    ----------------Label----------------
label_18:

#------------142  label_19    ----------------Label----------------
label_19:

#------------143  FACTOR_VAR CHAR c save in reg[41]
   lw $t3 -8($sp)
   sw $t3 -216($sp)

#------------144  FACTOR_CON CHAR 65 save in reg[42]
   li $t0 65
   sw $t0 -220($sp)

#------------145  reg[42] = reg[41] JIAN reg[42]
   lw $t0 -216($sp)
   lw $t1 -220($sp)
   sub $t2 $t0 $t1
   sw $t2 -220($sp)

#------------146  IF reg[42] BEQ reg[0] THEN GOTO label_20
   lw $t0 -220($sp)
    beq $t0 $0 label_20

#------------147  FACTOR_CON INT 7 save in reg[43]
   li $t0 7
   sw $t0 -224($sp)

#------------148  FACTOR_CON INT 1 save in reg[44]
   li $t0 1
   sw $t0 -228($sp)

#------------149  ASSIGN_ARR INT var2[reg[43]] = reg[44]
   lw $t0 -224($sp)
   lw $t1 -228($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------150  JUMP to label_21
   j label_21

#------------151  label_20    ----------------Label----------------
label_20:

#------------152  label_21    ----------------Label----------------
label_21:

#------------153  label_22    ----------------Label----------------
label_22:

#------------154  FACTOR_VAR INT i save in reg[45]
   lw $t3 0($sp)
   sw $t3 -232($sp)

#------------155  FACTOR_CON INT 0 save in reg[46]
   li $t0 0
   sw $t0 -236($sp)

#------------156  IF reg[45] BLEQ reg[46] THEN GOTO label_23
   lw $t0 -232($sp)
   lw $t1 -236($sp)
    ble $t0 $t1 label_23

#------------157  FACTOR_VAR INT i save in reg[47]
   lw $t3 0($sp)
   sw $t3 -240($sp)

#------------158  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -244($sp)

#------------159  reg[48] = reg[47] JIAN reg[48]
   lw $t0 -240($sp)
   lw $t1 -244($sp)
   sub $t2 $t0 $t1
   sw $t2 -244($sp)

#------------160  ASSIGN INT i = reg[48]
   lw $t3 -244($sp)
   sw $t3 0($sp)

#------------161  JUMP to label_22
   j label_22

#------------162  label_23    ----------------Label----------------
label_23:

#------------163  FACTOR_CON INT 5 save in reg[49]
   li $t0 5
   sw $t0 -248($sp)

#------------164  ASSIGN INT i = reg[49]
   lw $t3 -248($sp)
   sw $t3 0($sp)

#------------165  JUMP to label_25
   j label_25

#------------166  label_24    ----------------Label----------------
label_24:

#------------167  FACTOR_VAR INT i save in reg[50]
   lw $t3 0($sp)
   sw $t3 -252($sp)

#------------168  FACTOR_CON INT 1 save in reg[51]
   li $t0 1
   sw $t0 -256($sp)

#------------169  reg[51] = reg[50] JIAN reg[51]
   lw $t0 -252($sp)
   lw $t1 -256($sp)
   sub $t2 $t0 $t1
   sw $t2 -256($sp)

#------------170  ASSIGN INT i = reg[51]
   lw $t3 -256($sp)
   sw $t3 0($sp)

#------------171  FACTOR_VAR INT i save in reg[52]
   lw $t3 0($sp)
   sw $t3 -260($sp)

#------------172  FACTOR_CON INT 0 save in reg[53]
   li $t0 0
   sw $t0 -264($sp)

#------------173  IF reg[52] BLEQ reg[53] THEN GOTO label_26
   lw $t0 -260($sp)
   lw $t1 -264($sp)
    ble $t0 $t1 label_26

#------------174  label_25    ----------------Label----------------
label_25:

#------------175  FACTOR_VAR INT count save in reg[54]
   lw $t3 -20($sp)
   sw $t3 -268($sp)

#------------176  FACTOR_CON INT 1 save in reg[55]
   li $t0 1
   sw $t0 -272($sp)

#------------177  reg[55] = reg[54] JIA reg[55]
   lw $t0 -268($sp)
   lw $t1 -272($sp)
   add $t2 $t0 $t1
   sw $t2 -272($sp)

#------------178  ASSIGN INT count = reg[55]
   lw $t3 -272($sp)
   sw $t3 -20($sp)

#------------179  JUMP to label_24
   j label_24

#------------180  label_26    ----------------Label----------------
label_26:

#------------181  FACTOR_CON INT 0 save in reg[56]
   li $t0 0
   sw $t0 -276($sp)

#------------182  ASSIGN INT i = reg[56]
   lw $t3 -276($sp)
   sw $t3 0($sp)

#------------183  JUMP to label_28
   j label_28

#------------184  label_27    ----------------Label----------------
label_27:

#------------185  FACTOR_VAR INT i save in reg[57]
   lw $t3 0($sp)
   sw $t3 -280($sp)

#------------186  FACTOR_CON INT 1 save in reg[58]
   li $t0 1
   sw $t0 -284($sp)

#------------187  reg[58] = reg[57] JIA reg[58]
   lw $t0 -280($sp)
   lw $t1 -284($sp)
   add $t2 $t0 $t1
   sw $t2 -284($sp)

#------------188  ASSIGN INT i = reg[58]
   lw $t3 -284($sp)
   sw $t3 0($sp)

#------------189  FACTOR_VAR INT i save in reg[59]
   lw $t3 0($sp)
   sw $t3 -288($sp)

#------------190  FACTOR_CON INT 5 save in reg[60]
   li $t0 5
   sw $t0 -292($sp)

#------------191  IF reg[59] BGEQ reg[60] THEN GOTO label_29
   lw $t0 -288($sp)
   lw $t1 -292($sp)
    bge $t0 $t1 label_29

#------------192  label_28    ----------------Label----------------
label_28:

#------------193  FACTOR_VAR INT count save in reg[61]
   lw $t3 -20($sp)
   sw $t3 -296($sp)

#------------194  FACTOR_CON INT 1 save in reg[62]
   li $t0 1
   sw $t0 -300($sp)

#------------195  reg[62] = reg[61] JIA reg[62]
   lw $t0 -296($sp)
   lw $t1 -300($sp)
   add $t2 $t0 $t1
   sw $t2 -300($sp)

#------------196  ASSIGN INT count = reg[62]
   lw $t3 -300($sp)
   sw $t3 -20($sp)

#------------197  JUMP to label_27
   j label_27

#------------198  label_29    ----------------Label----------------
label_29:

#------------199  FACTOR_VAR INT count save in reg[63]
   lw $t3 -20($sp)
   sw $t3 -304($sp)

#------------200  WRITE INT reg[63]
   li $v0 1
   lw $a0 -304($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------201  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------202  FUNC VOID print2(0)
print2:

#------------203  CONST INT i = 1

#------------204  VAR INT j

#------------205  WRITE print2 called
   li $v0 4
   la $a0 str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------206  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------207  FUNC VOID main(0)
main:

#------------208  CONST INT a = 1

#------------209  CONST INT a0b1c2d3e4 = -233

#------------210  CONST INT f5g6h7i8j9 = 3072

#------------211  CONST CHAR klmn = 43

#------------212  CONST CHAR opq = 45

#------------213  CONST CHAR rst = 42

#------------214  CONST CHAR uvw = 47

#------------215  CONST CHAR x = 97

#------------216  CONST CHAR y_z = 48

#------------217  VAR INT abcd

#------------218  VAR CHAR cha1

#------------219  VAR CHAR cha2

#------------220  ARRAY CHAR efg[10]

#------------221  VAR INT hijk

#------------222  ARRAY INT lmn[5]

#------------223  VAR INT o

#------------224  ARRAY INT p[20]

#------------225  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -160($sp)

#------------226  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -164($sp)

#------------227  ASSIGN_ARR INT lmn[reg[1]] = reg[2]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -56($t0)

#------------228  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -168($sp)

#------------229  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -172($sp)

#------------230  ASSIGN_ARR INT lmn[reg[3]] = reg[4]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -56($t0)

#------------231  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -176($sp)

#------------232  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -180($sp)

#------------233  ASSIGN_ARR INT lmn[reg[5]] = reg[6]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -56($t0)

#------------234  READ INT abcd
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------235  READ INT hijk
   li $v0 5
   syscall
   sw $v0 -52($sp)

#------------236  READ INT o
   li $v0 5
   syscall
   sw $v0 -76($sp)

#------------237  READ CHAR cha1
   li $v0 12
   syscall
   sw $v0 -4($sp)

#------------238  READ CHAR cha2
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------239  WRITE result1 = 
   li $v0 4
   la $a0 str_2
   syscall

#------------240  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -184($sp)

#------------241  FACTOR_ARRAY INT lmn [reg[7]] save in reg[8]
   lw $t3 -184($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -188($sp)

#------------242  PUSH INT parareg[2] from reg[8]
   sw $ra -192($sp)
   lw $t0 -188($sp)
   sw $t0 -196($sp)

#------------243  CALL INT getint(1)
   addi $sp $sp -196
   jal getint
   subi $sp $sp -196
   lw $ra -192($sp)

#------------244  FACTOR_FUNC INT getint save in reg[8]
   sw $v0 -188($sp)

#------------245  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -192($sp)

#------------246  FACTOR_ARRAY INT lmn [reg[9]] save in reg[10]
   lw $t3 -192($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -196($sp)

#------------247  PUSH INT parareg[3] from reg[10]
   sw $ra -200($sp)
   lw $t0 -196($sp)
   sw $t0 -204($sp)

#------------248  CALL INT getint(1)
   addi $sp $sp -204
   jal getint
   subi $sp $sp -204
   lw $ra -200($sp)

#------------249  FACTOR_FUNC INT getint save in reg[10]
   sw $v0 -196($sp)

#------------250  reg[10] = reg[8] JIA reg[10]
   lw $t0 -188($sp)
   lw $t1 -196($sp)
   add $t2 $t0 $t1
   sw $t2 -196($sp)

#------------251  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -200($sp)

#------------252  FACTOR_ARRAY INT lmn [reg[11]] save in reg[12]
   lw $t3 -200($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -204($sp)

#------------253  PUSH INT parareg[4] from reg[12]
   sw $ra -208($sp)
   lw $t0 -204($sp)
   sw $t0 -212($sp)

#------------254  CALL INT getint(1)
   addi $sp $sp -212
   jal getint
   subi $sp $sp -212
   lw $ra -208($sp)

#------------255  FACTOR_FUNC INT getint save in reg[12]
   sw $v0 -204($sp)

#------------256  reg[12] = reg[10] JIA reg[12]
   lw $t0 -196($sp)
   lw $t1 -204($sp)
   add $t2 $t0 $t1
   sw $t2 -204($sp)

#------------257  WRITE INT reg[12]
   li $v0 1
   lw $a0 -204($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------258  WRITE the 10th Fibonacci number is 
   li $v0 4
   la $a0 str_3
   syscall

#------------259  FACTOR_VAR INT abcd save in reg[13]
   lw $t3 0($sp)
   sw $t3 -208($sp)

#------------260  PUSH INT parareg[5] from reg[13]
   sw $ra -212($sp)
   lw $t0 -208($sp)
   sw $t0 -216($sp)

#------------261  CALL INT getint(1)
   addi $sp $sp -216
   jal getint
   subi $sp $sp -216
   lw $ra -212($sp)

#------------262  FACTOR_FUNC INT getint save in reg[13]
   sw $v0 -208($sp)

#------------263  WRITE INT reg[13]
   li $v0 1
   lw $a0 -208($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------264  CALL CHAR getcha(0)
   sw $ra -212($sp)
   addi $sp $sp -216
   jal getcha
   subi $sp $sp -216
   lw $ra -212($sp)

#------------265  FACTOR_VAR INT hijk save in reg[14]
   lw $t3 -52($sp)
   sw $t3 -212($sp)

#------------266  FACTOR_VAR INT o save in reg[15]
   lw $t3 -76($sp)
   sw $t3 -216($sp)

#------------267  FACTOR_VAR CHAR cha1 save in reg[16]
   lw $t3 -4($sp)
   sw $t3 -220($sp)

#------------268  PUSH INT parareg[6] from reg[14]
   sw $ra -224($sp)
   lw $t0 -212($sp)
   sw $t0 -228($sp)

#------------269  PUSH INT parareg[7] from reg[15]
   lw $t0 -216($sp)
   sw $t0 -232($sp)

#------------270  PUSH INT parareg[8] from reg[16]
   lw $t0 -220($sp)
   sw $t0 -236($sp)

#------------271  CALL VOID print1(3)
   addi $sp $sp -228
   jal print1
   subi $sp $sp -228
   lw $ra -224($sp)

#------------272  FACTOR_VAR INT o save in reg[17]
   lw $t3 -76($sp)
   sw $t3 -224($sp)

#------------273  FACTOR_VAR INT hijk save in reg[18]
   lw $t3 -52($sp)
   sw $t3 -228($sp)

#------------274  FACTOR_VAR CHAR cha1 save in reg[19]
   lw $t3 -4($sp)
   sw $t3 -232($sp)

#------------275  PUSH INT parareg[9] from reg[17]
   sw $ra -236($sp)
   lw $t0 -224($sp)
   sw $t0 -240($sp)

#------------276  PUSH INT parareg[10] from reg[18]
   lw $t0 -228($sp)
   sw $t0 -244($sp)

#------------277  PUSH INT parareg[11] from reg[19]
   lw $t0 -232($sp)
   sw $t0 -248($sp)

#------------278  CALL VOID print1(3)
   addi $sp $sp -240
   jal print1
   subi $sp $sp -240
   lw $ra -236($sp)

#------------279  FACTOR_VAR INT hijk save in reg[20]
   lw $t3 -52($sp)
   sw $t3 -236($sp)

#------------280  FACTOR_VAR INT hijk save in reg[21]
   lw $t3 -52($sp)
   sw $t3 -240($sp)

#------------281  FACTOR_VAR CHAR cha2 save in reg[22]
   lw $t3 -8($sp)
   sw $t3 -244($sp)

#------------282  PUSH INT parareg[12] from reg[20]
   sw $ra -248($sp)
   lw $t0 -236($sp)
   sw $t0 -252($sp)

#------------283  PUSH INT parareg[13] from reg[21]
   lw $t0 -240($sp)
   sw $t0 -256($sp)

#------------284  PUSH INT parareg[14] from reg[22]
   lw $t0 -244($sp)
   sw $t0 -260($sp)

#------------285  CALL VOID print1(3)
   addi $sp $sp -252
   jal print1
   subi $sp $sp -252
   lw $ra -248($sp)

#------------286  CALL VOID print2(0)
   sw $ra -248($sp)
   addi $sp $sp -252
   jal print2
   subi $sp $sp -252
   lw $ra -248($sp)

#------------287  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -156($sp)
   jr $ra

end:
