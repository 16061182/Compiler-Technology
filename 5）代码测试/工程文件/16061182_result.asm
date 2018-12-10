.data
   var_b: .word 0
   var_add: .space 40
   str_0: .asciiz "var2[1] is true"
   str_1: .asciiz "print2 called"
   str_2: .asciiz "result1 = "
   str_3: .asciiz "the 10th Fibonacci number is "
.text
   jal main
   j end
#------------3  FUNC INT getint(1)
getint:

#------------4  PARA INT i

#------------5  FACTOR_VAR INT i save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------6  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------7  IF reg[1] BGEQ reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_0

#------------8  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -12($sp)

#------------9  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------10  JUMP to label_1
   j label_1

#------------11  label_0    ----------------Label----------------
label_0:

#------------12  label_1    ----------------Label----------------
label_1:

#------------13  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------14  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------15  IF reg[4] BNE reg[5] THEN GOTO label_2
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_2

#------------16  FACTOR_CON INT 0 save in reg[6]
   li $t0 0
   sw $t0 -24($sp)

#------------17  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------18  JUMP to label_3
   j label_3

#------------19  label_2    ----------------Label----------------
label_2:

#------------20  label_3    ----------------Label----------------
label_3:

#------------21  FACTOR_VAR INT i save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------22  FACTOR_CON INT 2 save in reg[8]
   li $t0 2
   sw $t0 -32($sp)

#------------23  IF reg[7] BNE reg[8] THEN GOTO label_4
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    bne $t0 $t1 label_4

#------------24  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -36($sp)

#------------25  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------26  JUMP to label_5
   j label_5

#------------27  label_4    ----------------Label----------------
label_4:

#------------28  label_5    ----------------Label----------------
label_5:

#------------29  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------30  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -44($sp)

#------------31  reg[11] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------32  PUSH INT parareg[0] from reg[11]
   sw $ra -48($sp)
   lw $t0 -44($sp)
   sw $t0 -52($sp)

#------------33  CALL INT getint(1)
   addi $sp $sp -52
   jal getint
   subi $sp $sp -52
   lw $ra -48($sp)

#------------34  FACTOR_FUNC INT getint save in reg[11]
   sw $v0 -44($sp)

#------------35  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------36  FACTOR_CON INT 2 save in reg[13]
   li $t0 2
   sw $t0 -52($sp)

#------------37  reg[13] = reg[12] JIAN reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -52($sp)

#------------38  PUSH INT parareg[1] from reg[13]
   sw $ra -56($sp)
   lw $t0 -52($sp)
   sw $t0 -60($sp)

#------------39  CALL INT getint(1)
   addi $sp $sp -60
   jal getint
   subi $sp $sp -60
   lw $ra -56($sp)

#------------40  FACTOR_FUNC INT getint save in reg[13]
   sw $v0 -52($sp)

#------------41  reg[13] = reg[11] JIA reg[13]
   lw $t0 -44($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------42  RETURN reg[13] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------43  FUNC CHAR getcha(0)
   jr $ra

getcha:

#------------44  CONST CHAR c = 97

#------------45  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 0($sp)

#------------46  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------47  FUNC VOID print1(3)
   jr $ra

print1:

#------------48  PARA INT i

#------------49  PARA INT j

#------------50  PARA CHAR c

#------------51  VAR CHAR var1

#------------52  VAR INT num

#------------53  VAR INT count

#------------54  ARRAY INT var2[8]

#------------55  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 -56($sp)

#------------56  ASSIGN CHAR var1 = reg[1]
   lw $t3 -56($sp)
   sw $t3 -12($sp)

#------------57  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -60($sp)

#------------58  ASSIGN INT num = reg[2]
   lw $t3 -60($sp)
   sw $t3 -16($sp)

#------------59  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -64($sp)

#------------60  ASSIGN INT count = reg[3]
   lw $t3 -64($sp)
   sw $t3 -20($sp)

#------------61  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -68($sp)

#------------62  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -72($sp)

#------------63  ASSIGN_ARR INT var2[reg[4]] = reg[5]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------64  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -76($sp)

#------------65  FACTOR_VAR INT i save in reg[7]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------66  FACTOR_VAR INT j save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------67  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   sub $t2 $t0 $t1
   sw $t2 -84($sp)

#------------68  ASSIGN_ARR INT var2[reg[6]] = reg[8]
   lw $t0 -76($sp)
   lw $t1 -84($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------69  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -88($sp)

#------------70  FACTOR_ARRAY INT var2 [reg[9]] save in reg[10]
   lw $t3 -88($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -92($sp)

#------------71  IF reg[10] BEQ reg[0] THEN GOTO label_6
   lw $t0 -92($sp)
    beq $t0 $0 label_6

#------------72  WRITE var2[1] is true
   li $v0 4
   la $a0 str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------73  JUMP to label_7
   j label_7

#------------74  label_6    ----------------Label----------------
label_6:

#------------75  label_7    ----------------Label----------------
label_7:

#------------76  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -96($sp)

#------------77  FACTOR_VAR INT j save in reg[12]
   lw $t3 -4($sp)
   sw $t3 -100($sp)

#------------78  IF reg[11] BGEQ reg[12] THEN GOTO label_8
   lw $t0 -96($sp)
   lw $t1 -100($sp)
    bge $t0 $t1 label_8

#------------79  FACTOR_VAR INT num save in reg[13]
   lw $t3 -16($sp)
   sw $t3 -104($sp)

#------------80  FACTOR_CON INT 1 save in reg[14]
   li $t0 1
   sw $t0 -108($sp)

#------------81  reg[14] = reg[13] JIA reg[14]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   add $t2 $t0 $t1
   sw $t2 -108($sp)

#------------82  ASSIGN INT num = reg[14]
   lw $t3 -108($sp)
   sw $t3 -16($sp)

#------------83  JUMP to label_9
   j label_9

#------------84  label_8    ----------------Label----------------
label_8:

#------------85  FACTOR_VAR INT num save in reg[15]
   lw $t3 -16($sp)
   sw $t3 -112($sp)

#------------86  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -116($sp)

#------------87  reg[16] = reg[15] JIAN reg[16]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   sub $t2 $t0 $t1
   sw $t2 -116($sp)

#------------88  ASSIGN INT num = reg[16]
   lw $t3 -116($sp)
   sw $t3 -16($sp)

#------------89  label_9    ----------------Label----------------
label_9:

#------------90  FACTOR_VAR INT i save in reg[17]
   lw $t3 0($sp)
   sw $t3 -120($sp)

#------------91  FACTOR_VAR INT j save in reg[18]
   lw $t3 -4($sp)
   sw $t3 -124($sp)

#------------92  IF reg[17] BLEQ reg[18] THEN GOTO label_10
   lw $t0 -120($sp)
   lw $t1 -124($sp)
    ble $t0 $t1 label_10

#------------93  FACTOR_CON INT 2 save in reg[19]
   li $t0 2
   sw $t0 -128($sp)

#------------94  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -132($sp)

#------------95  ASSIGN_ARR INT var2[reg[19]] = reg[20]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------96  JUMP to label_11
   j label_11

#------------97  label_10    ----------------Label----------------
label_10:

#------------98  label_11    ----------------Label----------------
label_11:

#------------99  FACTOR_VAR INT i save in reg[21]
   lw $t3 0($sp)
   sw $t3 -136($sp)

#------------100  FACTOR_VAR INT j save in reg[22]
   lw $t3 -4($sp)
   sw $t3 -140($sp)

#------------101  IF reg[21] BEQ reg[22] THEN GOTO label_12
   lw $t0 -136($sp)
   lw $t1 -140($sp)
    beq $t0 $t1 label_12

#------------102  FACTOR_CON INT 3 save in reg[23]
   li $t0 3
   sw $t0 -144($sp)

#------------103  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -148($sp)

#------------104  ASSIGN_ARR INT var2[reg[23]] = reg[24]
   lw $t0 -144($sp)
   lw $t1 -148($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------105  JUMP to label_13
   j label_13

#------------106  label_12    ----------------Label----------------
label_12:

#------------107  label_13    ----------------Label----------------
label_13:

#------------108  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -152($sp)

#------------109  FACTOR_ARRAY INT var2 [reg[25]] save in reg[26]
   lw $t3 -152($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -156($sp)

#------------110  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -160($sp)

#------------111  FACTOR_ARRAY INT var2 [reg[27]] save in reg[28]
   lw $t3 -160($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -164($sp)

#------------112  reg[28] = reg[26] CHENG reg[28]
   lw $t0 -156($sp)
   lw $t1 -164($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -164($sp)

#------------113  IF reg[28] BEQ reg[0] THEN GOTO label_14
   lw $t0 -164($sp)
    beq $t0 $0 label_14

#------------114  FACTOR_CON INT 4 save in reg[29]
   li $t0 4
   sw $t0 -168($sp)

#------------115  FACTOR_CON INT 1 save in reg[30]
   li $t0 1
   sw $t0 -172($sp)

#------------116  ASSIGN_ARR INT var2[reg[29]] = reg[30]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------117  JUMP to label_15
   j label_15

#------------118  label_14    ----------------Label----------------
label_14:

#------------119  label_15    ----------------Label----------------
label_15:

#------------120  FACTOR_CON INT 100 save in reg[31]
   li $t0 100
   sw $t0 -176($sp)

#------------121  FACTOR_CON CHAR 97 save in reg[32]
   li $t0 97
   sw $t0 -180($sp)

#------------122  reg[32] = reg[31] CHU reg[32]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -180($sp)

#------------123  FACTOR_VAR INT i save in reg[33]
   lw $t3 0($sp)
   sw $t3 -184($sp)

#------------124  reg[33] = reg[32] CHU reg[33]
   lw $t0 -180($sp)
   lw $t1 -184($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -184($sp)

#------------125  IF reg[33] BEQ reg[0] THEN GOTO label_16
   lw $t0 -184($sp)
    beq $t0 $0 label_16

#------------126  FACTOR_CON INT 5 save in reg[34]
   li $t0 5
   sw $t0 -188($sp)

#------------127  FACTOR_CON INT 1 save in reg[35]
   li $t0 1
   sw $t0 -192($sp)

#------------128  ASSIGN_ARR INT var2[reg[34]] = reg[35]
   lw $t0 -188($sp)
   lw $t1 -192($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------129  JUMP to label_17
   j label_17

#------------130  label_16    ----------------Label----------------
label_16:

#------------131  label_17    ----------------Label----------------
label_17:

#------------132  FACTOR_VAR INT i save in reg[36]
   lw $t3 0($sp)
   sw $t3 -196($sp)

#------------133  FACTOR_CON INT 0 save in reg[37]
   li $t0 0
   sw $t0 -200($sp)

#------------134  reg[37] = reg[37] JIAN reg[36]
   lw $t0 -200($sp)
   lw $t1 -196($sp)
   sub $t2 $t0 $t1
   sw $t2 -200($sp)

#------------135  FACTOR_VAR INT j save in reg[38]
   lw $t3 -4($sp)
   sw $t3 -204($sp)

#------------136  reg[38] = reg[37] JIA reg[38]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   add $t2 $t0 $t1
   sw $t2 -204($sp)

#------------137  IF reg[38] BEQ reg[0] THEN GOTO label_18
   lw $t0 -204($sp)
    beq $t0 $0 label_18

#------------138  FACTOR_CON INT 6 save in reg[39]
   li $t0 6
   sw $t0 -208($sp)

#------------139  FACTOR_CON INT 1 save in reg[40]
   li $t0 1
   sw $t0 -212($sp)

#------------140  ASSIGN_ARR INT var2[reg[39]] = reg[40]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------141  JUMP to label_19
   j label_19

#------------142  label_18    ----------------Label----------------
label_18:

#------------143  label_19    ----------------Label----------------
label_19:

#------------144  FACTOR_VAR CHAR c save in reg[41]
   lw $t3 -8($sp)
   sw $t3 -216($sp)

#------------145  FACTOR_CON CHAR 65 save in reg[42]
   li $t0 65
   sw $t0 -220($sp)

#------------146  reg[42] = reg[41] JIAN reg[42]
   lw $t0 -216($sp)
   lw $t1 -220($sp)
   sub $t2 $t0 $t1
   sw $t2 -220($sp)

#------------147  IF reg[42] BEQ reg[0] THEN GOTO label_20
   lw $t0 -220($sp)
    beq $t0 $0 label_20

#------------148  FACTOR_CON INT 7 save in reg[43]
   li $t0 7
   sw $t0 -224($sp)

#------------149  FACTOR_CON INT 1 save in reg[44]
   li $t0 1
   sw $t0 -228($sp)

#------------150  ASSIGN_ARR INT var2[reg[43]] = reg[44]
   lw $t0 -224($sp)
   lw $t1 -228($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------151  JUMP to label_21
   j label_21

#------------152  label_20    ----------------Label----------------
label_20:

#------------153  label_21    ----------------Label----------------
label_21:

#------------154  label_22    ----------------Label----------------
label_22:

#------------155  FACTOR_VAR INT i save in reg[45]
   lw $t3 0($sp)
   sw $t3 -232($sp)

#------------156  FACTOR_CON INT 0 save in reg[46]
   li $t0 0
   sw $t0 -236($sp)

#------------157  IF reg[45] BLEQ reg[46] THEN GOTO label_23
   lw $t0 -232($sp)
   lw $t1 -236($sp)
    ble $t0 $t1 label_23

#------------158  FACTOR_VAR INT i save in reg[47]
   lw $t3 0($sp)
   sw $t3 -240($sp)

#------------159  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -244($sp)

#------------160  reg[48] = reg[47] JIAN reg[48]
   lw $t0 -240($sp)
   lw $t1 -244($sp)
   sub $t2 $t0 $t1
   sw $t2 -244($sp)

#------------161  ASSIGN INT i = reg[48]
   lw $t3 -244($sp)
   sw $t3 0($sp)

#------------162  JUMP to label_22
   j label_22

#------------163  label_23    ----------------Label----------------
label_23:

#------------164  FACTOR_CON INT 5 save in reg[49]
   li $t0 5
   sw $t0 -248($sp)

#------------165  ASSIGN INT i = reg[49]
   lw $t3 -248($sp)
   sw $t3 0($sp)

#------------166  JUMP to label_25
   j label_25

#------------167  label_24    ----------------Label----------------
label_24:

#------------168  FACTOR_VAR INT i save in reg[50]
   lw $t3 0($sp)
   sw $t3 -252($sp)

#------------169  FACTOR_CON INT 1 save in reg[51]
   li $t0 1
   sw $t0 -256($sp)

#------------170  reg[51] = reg[50] JIAN reg[51]
   lw $t0 -252($sp)
   lw $t1 -256($sp)
   sub $t2 $t0 $t1
   sw $t2 -256($sp)

#------------171  ASSIGN INT i = reg[51]
   lw $t3 -256($sp)
   sw $t3 0($sp)

#------------172  FACTOR_VAR INT i save in reg[52]
   lw $t3 0($sp)
   sw $t3 -260($sp)

#------------173  FACTOR_CON INT 0 save in reg[53]
   li $t0 0
   sw $t0 -264($sp)

#------------174  IF reg[52] BLEQ reg[53] THEN GOTO label_26
   lw $t0 -260($sp)
   lw $t1 -264($sp)
    ble $t0 $t1 label_26

#------------175  label_25    ----------------Label----------------
label_25:

#------------176  FACTOR_VAR INT count save in reg[54]
   lw $t3 -20($sp)
   sw $t3 -268($sp)

#------------177  FACTOR_CON INT 1 save in reg[55]
   li $t0 1
   sw $t0 -272($sp)

#------------178  reg[55] = reg[54] JIA reg[55]
   lw $t0 -268($sp)
   lw $t1 -272($sp)
   add $t2 $t0 $t1
   sw $t2 -272($sp)

#------------179  ASSIGN INT count = reg[55]
   lw $t3 -272($sp)
   sw $t3 -20($sp)

#------------180  JUMP to label_24
   j label_24

#------------181  label_26    ----------------Label----------------
label_26:

#------------182  FACTOR_CON INT 0 save in reg[56]
   li $t0 0
   sw $t0 -276($sp)

#------------183  ASSIGN INT i = reg[56]
   lw $t3 -276($sp)
   sw $t3 0($sp)

#------------184  JUMP to label_28
   j label_28

#------------185  label_27    ----------------Label----------------
label_27:

#------------186  FACTOR_VAR INT i save in reg[57]
   lw $t3 0($sp)
   sw $t3 -280($sp)

#------------187  FACTOR_CON INT 1 save in reg[58]
   li $t0 1
   sw $t0 -284($sp)

#------------188  reg[58] = reg[57] JIA reg[58]
   lw $t0 -280($sp)
   lw $t1 -284($sp)
   add $t2 $t0 $t1
   sw $t2 -284($sp)

#------------189  ASSIGN INT i = reg[58]
   lw $t3 -284($sp)
   sw $t3 0($sp)

#------------190  FACTOR_VAR INT i save in reg[59]
   lw $t3 0($sp)
   sw $t3 -288($sp)

#------------191  FACTOR_CON INT 5 save in reg[60]
   li $t0 5
   sw $t0 -292($sp)

#------------192  IF reg[59] BGEQ reg[60] THEN GOTO label_29
   lw $t0 -288($sp)
   lw $t1 -292($sp)
    bge $t0 $t1 label_29

#------------193  label_28    ----------------Label----------------
label_28:

#------------194  FACTOR_VAR INT count save in reg[61]
   lw $t3 -20($sp)
   sw $t3 -296($sp)

#------------195  FACTOR_CON INT 1 save in reg[62]
   li $t0 1
   sw $t0 -300($sp)

#------------196  reg[62] = reg[61] JIA reg[62]
   lw $t0 -296($sp)
   lw $t1 -300($sp)
   add $t2 $t0 $t1
   sw $t2 -300($sp)

#------------197  ASSIGN INT count = reg[62]
   lw $t3 -300($sp)
   sw $t3 -20($sp)

#------------198  JUMP to label_27
   j label_27

#------------199  label_29    ----------------Label----------------
label_29:

#------------200  FACTOR_VAR INT count save in reg[63]
   lw $t3 -20($sp)
   sw $t3 -304($sp)

#------------201  WRITE INT reg[63]
   li $v0 1
   lw $a0 -304($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------202  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------203  FUNC VOID print2(0)
   jr $ra

print2:

#------------204  CONST INT i = 1

#------------205  VAR INT j

#------------206  WRITE print2 called
   li $v0 4
   la $a0 str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------207  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------208  FUNC VOID main(0)
   jr $ra

main:

#------------209  CONST INT a = 1

#------------210  CONST INT a0b1c2d3e4 = -233

#------------211  CONST INT f5g6h7i8j9 = 3072

#------------212  CONST CHAR klmn = 43

#------------213  CONST CHAR opq = 45

#------------214  CONST CHAR rst = 42

#------------215  CONST CHAR uvw = 47

#------------216  CONST CHAR x = 97

#------------217  CONST CHAR y_z = 48

#------------218  VAR INT abcd

#------------219  VAR CHAR cha1

#------------220  VAR CHAR cha2

#------------221  ARRAY CHAR efg[10]

#------------222  VAR INT hijk

#------------223  ARRAY INT lmn[5]

#------------224  VAR INT o

#------------225  ARRAY INT p[20]

#------------226  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -160($sp)

#------------227  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -164($sp)

#------------228  ASSIGN_ARR INT lmn[reg[1]] = reg[2]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -56($t0)

#------------229  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -168($sp)

#------------230  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -172($sp)

#------------231  ASSIGN_ARR INT lmn[reg[3]] = reg[4]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -56($t0)

#------------232  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -176($sp)

#------------233  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -180($sp)

#------------234  ASSIGN_ARR INT lmn[reg[5]] = reg[6]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -56($t0)

#------------235  READ INT abcd
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------236  READ INT hijk
   li $v0 5
   syscall
   sw $v0 -52($sp)

#------------237  READ INT o
   li $v0 5
   syscall
   sw $v0 -76($sp)

#------------238  READ CHAR cha1
   li $v0 12
   syscall
   sw $v0 -4($sp)

#------------239  READ CHAR cha2
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------240  READ_EXTERN INT b
   li $v0 5
   syscall
   sw $v0 var_b

#------------241  FACTOR_CON INT 7 save in reg[7]
   li $t0 7
   sw $t0 -184($sp)

#------------242  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -188($sp)

#------------243  FACTOR_CON INT 0 save in reg[9]
   li $t0 0
   sw $t0 -192($sp)

#------------244  reg[9] = reg[9] JIAN reg[8]
   lw $t0 -192($sp)
   lw $t1 -188($sp)
   sub $t2 $t0 $t1
   sw $t2 -192($sp)

#------------245  FACTOR_CON INT 2 save in reg[10]
   li $t0 2
   sw $t0 -196($sp)

#------------246  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -200($sp)

#------------247  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -204($sp)

#------------248  reg[12] = reg[12] JIAN reg[11]
   lw $t0 -204($sp)
   lw $t1 -200($sp)
   sub $t2 $t0 $t1
   sw $t2 -204($sp)

#------------249  FACTOR_CON INT 2 save in reg[13]
   li $t0 2
   sw $t0 -208($sp)

#------------250  FACTOR_CON INT 3 save in reg[14]
   li $t0 3
   sw $t0 -212($sp)

#------------251  reg[14] = reg[13] CHENG reg[14]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -212($sp)

#------------252  reg[14] = reg[12] JIA reg[14]
   lw $t0 -204($sp)
   lw $t1 -212($sp)
   add $t2 $t0 $t1
   sw $t2 -212($sp)

#------------253  FACTOR_EXPR reg[14] save in reg[15]
   lw $t0 -212($sp)
   sw $t0 -216($sp)

#------------254  reg[15] = reg[10] CHENG reg[15]
   lw $t0 -196($sp)
   lw $t1 -216($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -216($sp)

#------------255  reg[15] = reg[9] JIA reg[15]
   lw $t0 -192($sp)
   lw $t1 -216($sp)
   add $t2 $t0 $t1
   sw $t2 -216($sp)

#------------256  ASSIGN_ARR_EXTERN INT add[reg[7]] = reg[15]
   lw $t0 -184($sp)
   lw $t1 -216($sp)
   sll $t0 $t0 2
   sw $t1 var_add($t0)

#------------257  FACTOR_CON INT 8 save in reg[16]
   li $t0 8
   sw $t0 -220($sp)

#------------258  FACTOR_VAR_EXTERN INT b save in reg[17]
   lw $t3 var_b
   sw $t3 -224($sp)

#------------259  ASSIGN_ARR_EXTERN INT add[reg[16]] = reg[17]
   lw $t0 -220($sp)
   lw $t1 -224($sp)
   sll $t0 $t0 2
   sw $t1 var_add($t0)

#------------260  FACTOR_CON INT 9 save in reg[18]
   li $t0 9
   sw $t0 -228($sp)

#------------261  FACTOR_CON INT 7 save in reg[19]
   li $t0 7
   sw $t0 -232($sp)

#------------262  FACTOR_ARRAY_EXTERN INT add [reg[19]] save in reg[20]
   lw $t3 -232($sp)
   sll $t3 $t3 2
   lw $t3 var_add($t3)
   sw $t3 -236($sp)

#------------263  ASSIGN_ARR_EXTERN INT add[reg[18]] = reg[20]
   lw $t0 -228($sp)
   lw $t1 -236($sp)
   sll $t0 $t0 2
   sw $t1 var_add($t0)

#------------264  FACTOR_CON INT 233 save in reg[21]
   li $t0 233
   sw $t0 -240($sp)

#------------265  ASSIGN_EXTERN INT b = reg[21]
   lw $t3 -240($sp)
   sw $t3 var_b

#------------266  WRITE result1 = 
   li $v0 4
   la $a0 str_2
   syscall

#------------267  FACTOR_CON INT 0 save in reg[22]
   li $t0 0
   sw $t0 -244($sp)

#------------268  FACTOR_ARRAY INT lmn [reg[22]] save in reg[23]
   lw $t3 -244($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -248($sp)

#------------269  PUSH INT parareg[2] from reg[23]
   sw $ra -252($sp)
   lw $t0 -248($sp)
   sw $t0 -256($sp)

#------------270  CALL INT getint(1)
   addi $sp $sp -256
   jal getint
   subi $sp $sp -256
   lw $ra -252($sp)

#------------271  FACTOR_FUNC INT getint save in reg[23]
   sw $v0 -248($sp)

#------------272  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -252($sp)

#------------273  FACTOR_ARRAY INT lmn [reg[24]] save in reg[25]
   lw $t3 -252($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -256($sp)

#------------274  PUSH INT parareg[3] from reg[25]
   sw $ra -260($sp)
   lw $t0 -256($sp)
   sw $t0 -264($sp)

#------------275  CALL INT getint(1)
   addi $sp $sp -264
   jal getint
   subi $sp $sp -264
   lw $ra -260($sp)

#------------276  FACTOR_FUNC INT getint save in reg[25]
   sw $v0 -256($sp)

#------------277  reg[25] = reg[23] JIA reg[25]
   lw $t0 -248($sp)
   lw $t1 -256($sp)
   add $t2 $t0 $t1
   sw $t2 -256($sp)

#------------278  FACTOR_CON INT 2 save in reg[26]
   li $t0 2
   sw $t0 -260($sp)

#------------279  FACTOR_ARRAY INT lmn [reg[26]] save in reg[27]
   lw $t3 -260($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -264($sp)

#------------280  PUSH INT parareg[4] from reg[27]
   sw $ra -268($sp)
   lw $t0 -264($sp)
   sw $t0 -272($sp)

#------------281  CALL INT getint(1)
   addi $sp $sp -272
   jal getint
   subi $sp $sp -272
   lw $ra -268($sp)

#------------282  FACTOR_FUNC INT getint save in reg[27]
   sw $v0 -264($sp)

#------------283  reg[27] = reg[25] JIA reg[27]
   lw $t0 -256($sp)
   lw $t1 -264($sp)
   add $t2 $t0 $t1
   sw $t2 -264($sp)

#------------284  WRITE INT reg[27]
   li $v0 1
   lw $a0 -264($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------285  WRITE the 10th Fibonacci number is 
   li $v0 4
   la $a0 str_3
   syscall

#------------286  FACTOR_VAR INT abcd save in reg[28]
   lw $t3 0($sp)
   sw $t3 -268($sp)

#------------287  PUSH INT parareg[5] from reg[28]
   sw $ra -272($sp)
   lw $t0 -268($sp)
   sw $t0 -276($sp)

#------------288  CALL INT getint(1)
   addi $sp $sp -276
   jal getint
   subi $sp $sp -276
   lw $ra -272($sp)

#------------289  FACTOR_FUNC INT getint save in reg[28]
   sw $v0 -268($sp)

#------------290  WRITE INT reg[28]
   li $v0 1
   lw $a0 -268($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------291  CALL CHAR getcha(0)
   sw $ra -272($sp)
   addi $sp $sp -276
   jal getcha
   subi $sp $sp -276
   lw $ra -272($sp)

#------------292  FACTOR_VAR INT hijk save in reg[29]
   lw $t3 -52($sp)
   sw $t3 -272($sp)

#------------293  FACTOR_VAR INT o save in reg[30]
   lw $t3 -76($sp)
   sw $t3 -276($sp)

#------------294  FACTOR_VAR CHAR cha1 save in reg[31]
   lw $t3 -4($sp)
   sw $t3 -280($sp)

#------------295  PUSH INT parareg[6] from reg[29]
   sw $ra -284($sp)
   lw $t0 -272($sp)
   sw $t0 -288($sp)

#------------296  PUSH INT parareg[7] from reg[30]
   lw $t0 -276($sp)
   sw $t0 -292($sp)

#------------297  PUSH INT parareg[8] from reg[31]
   lw $t0 -280($sp)
   sw $t0 -296($sp)

#------------298  CALL VOID print1(3)
   addi $sp $sp -288
   jal print1
   subi $sp $sp -288
   lw $ra -284($sp)

#------------299  FACTOR_VAR INT o save in reg[32]
   lw $t3 -76($sp)
   sw $t3 -284($sp)

#------------300  FACTOR_VAR INT hijk save in reg[33]
   lw $t3 -52($sp)
   sw $t3 -288($sp)

#------------301  FACTOR_VAR CHAR cha1 save in reg[34]
   lw $t3 -4($sp)
   sw $t3 -292($sp)

#------------302  PUSH INT parareg[9] from reg[32]
   sw $ra -296($sp)
   lw $t0 -284($sp)
   sw $t0 -300($sp)

#------------303  PUSH INT parareg[10] from reg[33]
   lw $t0 -288($sp)
   sw $t0 -304($sp)

#------------304  PUSH INT parareg[11] from reg[34]
   lw $t0 -292($sp)
   sw $t0 -308($sp)

#------------305  CALL VOID print1(3)
   addi $sp $sp -300
   jal print1
   subi $sp $sp -300
   lw $ra -296($sp)

#------------306  FACTOR_VAR INT hijk save in reg[35]
   lw $t3 -52($sp)
   sw $t3 -296($sp)

#------------307  FACTOR_VAR INT hijk save in reg[36]
   lw $t3 -52($sp)
   sw $t3 -300($sp)

#------------308  FACTOR_VAR CHAR cha2 save in reg[37]
   lw $t3 -8($sp)
   sw $t3 -304($sp)

#------------309  PUSH INT parareg[12] from reg[35]
   sw $ra -308($sp)
   lw $t0 -296($sp)
   sw $t0 -312($sp)

#------------310  PUSH INT parareg[13] from reg[36]
   lw $t0 -300($sp)
   sw $t0 -316($sp)

#------------311  PUSH INT parareg[14] from reg[37]
   lw $t0 -304($sp)
   sw $t0 -320($sp)

#------------312  CALL VOID print1(3)
   addi $sp $sp -312
   jal print1
   subi $sp $sp -312
   lw $ra -308($sp)

#------------313  CALL VOID print2(0)
   sw $ra -308($sp)
   addi $sp $sp -312
   jal print2
   subi $sp $sp -312
   lw $ra -308($sp)

#------------314  FACTOR_VAR_EXTERN INT b save in reg[38]
   lw $t3 var_b
   sw $t3 -308($sp)

#------------315  WRITE INT reg[38]
   li $v0 1
   lw $a0 -308($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------316  FACTOR_CON INT 7 save in reg[39]
   li $t0 7
   sw $t0 -312($sp)

#------------317  FACTOR_ARRAY_EXTERN INT add [reg[39]] save in reg[40]
   lw $t3 -312($sp)
   sll $t3 $t3 2
   lw $t3 var_add($t3)
   sw $t3 -316($sp)

#------------318  FACTOR_CON INT 8 save in reg[41]
   li $t0 8
   sw $t0 -320($sp)

#------------319  FACTOR_ARRAY_EXTERN INT add [reg[41]] save in reg[42]
   lw $t3 -320($sp)
   sll $t3 $t3 2
   lw $t3 var_add($t3)
   sw $t3 -324($sp)

#------------320  reg[42] = reg[40] JIA reg[42]
   lw $t0 -316($sp)
   lw $t1 -324($sp)
   add $t2 $t0 $t1
   sw $t2 -324($sp)

#------------321  FACTOR_CON INT 9 save in reg[43]
   li $t0 9
   sw $t0 -328($sp)

#------------322  FACTOR_ARRAY_EXTERN INT add [reg[43]] save in reg[44]
   lw $t3 -328($sp)
   sll $t3 $t3 2
   lw $t3 var_add($t3)
   sw $t3 -332($sp)

#------------323  reg[44] = reg[42] JIA reg[44]
   lw $t0 -324($sp)
   lw $t1 -332($sp)
   add $t2 $t0 $t1
   sw $t2 -332($sp)

#------------324  WRITE INT reg[44]
   li $v0 1
   lw $a0 -332($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------325  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -156($sp)
   jr $ra

   jr $ra

end:
