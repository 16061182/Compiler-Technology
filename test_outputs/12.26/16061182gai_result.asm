.data
   .var_b: .word 0
   .var_add: .space 40
   .str_0: .asciiz "var2[1] is true"
   .str_1: .asciiz "print2 called"
   .str_2: .asciiz "result1 = "
   .str_3: .asciiz "the 10th Fibonacci number is "
.text
   jal .func_main
   j end
#------------3  FUNC INT getint(1)
.func_getint:

#------------4  PARA INT i

#------------5  FACTOR_VAR INT i save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------6  FACTOR_CON INT 100 save in reg[2]
   li $t0 100
   sw $t0 -8($sp)

#------------7  IF reg[1] BEQ reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    beq $t0 $t1 label_0

#------------8  JUMP to label_1
   j label_1

#------------9  label_0    ----------------Label----------------
label_0:

#------------10  label_1    ----------------Label----------------
label_1:

#------------11  FACTOR_VAR INT i save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------12  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -16($sp)

#------------13  IF reg[3] BGEQ reg[4] THEN GOTO label_2
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    bge $t0 $t1 label_2

#------------14  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -20($sp)

#------------15  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------16  JUMP to label_3
   j label_3

#------------17  label_2    ----------------Label----------------
label_2:

#------------18  label_3    ----------------Label----------------
label_3:

#------------19  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------20  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -28($sp)

#------------21  IF reg[6] BNE reg[7] THEN GOTO label_4
   lw $t0 -24($sp)
   lw $t1 -28($sp)
    bne $t0 $t1 label_4

#------------22  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -32($sp)

#------------23  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -32($sp)
   jr $ra

#------------24  JUMP to label_5
   j label_5

#------------25  label_4    ----------------Label----------------
label_4:

#------------26  label_5    ----------------Label----------------
label_5:

#------------27  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------28  FACTOR_CON INT 2 save in reg[10]
   li $t0 2
   sw $t0 -40($sp)

#------------29  IF reg[9] BNE reg[10] THEN GOTO label_6
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    bne $t0 $t1 label_6

#------------30  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -44($sp)

#------------31  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------32  JUMP to label_7
   j label_7

#------------33  label_6    ----------------Label----------------
label_6:

#------------34  label_7    ----------------Label----------------
label_7:

#------------35  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------36  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -52($sp)

#------------37  reg[14] = reg[12] JIAN reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------38  PUSH INT parareg[0] from reg[14]
   sw $ra -60($sp)
   lw $t0 -56($sp)
   sw $t0 -64($sp)

#------------39  CALL INT getint(1)
   addi $sp $sp -64
   jal .func_getint
   subi $sp $sp -64
   lw $ra -60($sp)

#------------40  FACTOR_FUNC INT getint save in reg[15]
   sw $v0 -60($sp)

#------------41  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------42  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -68($sp)

#------------43  reg[18] = reg[16] JIAN reg[17]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   sub $t2 $t0 $t1
   sw $t2 -72($sp)

#------------44  PUSH INT parareg[1] from reg[18]
   sw $ra -76($sp)
   lw $t0 -72($sp)
   sw $t0 -80($sp)

#------------45  CALL INT getint(1)
   addi $sp $sp -80
   jal .func_getint
   subi $sp $sp -80
   lw $ra -76($sp)

#------------46  FACTOR_FUNC INT getint save in reg[19]
   sw $v0 -76($sp)

#------------47  reg[20] = reg[15] JIA reg[19]
   lw $t0 -60($sp)
   lw $t1 -76($sp)
   add $t2 $t0 $t1
   sw $t2 -80($sp)

#------------48  RETURN reg[20] TO $V0 AND THEN GOTO 0
   lw $v0 -80($sp)
   jr $ra

#------------49  FUNC CHAR getcha(0)
   jr $ra

.func_getcha:

#------------50  CONST CHAR c = 97

#------------51  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 0($sp)

#------------52  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------53  FUNC VOID print1(3)
   jr $ra

.func_print1:

#------------54  PARA INT i

#------------55  PARA INT j

#------------56  PARA CHAR c

#------------57  VAR CHAR var1

#------------58  VAR INT num

#------------59  VAR INT count

#------------60  ARRAY INT var2[8]

#------------61  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 -56($sp)

#------------62  ASSIGN CHAR var1 = reg[1]
   lw $t3 -56($sp)
   sw $t3 -12($sp)

#------------63  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -60($sp)

#------------64  ASSIGN INT num = reg[2]
   lw $t3 -60($sp)
   sw $t3 -16($sp)

#------------65  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -64($sp)

#------------66  ASSIGN INT count = reg[3]
   lw $t3 -64($sp)
   sw $t3 -20($sp)

#------------67  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -68($sp)

#------------68  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -72($sp)

#------------69  ASSIGN_ARR INT var2[reg[4]] = reg[5]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------70  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -76($sp)

#------------71  FACTOR_VAR INT i save in reg[7]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------72  FACTOR_VAR INT j save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------73  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   sub $t2 $t0 $t1
   sw $t2 -88($sp)

#------------74  ASSIGN_ARR INT var2[reg[6]] = reg[9]
   lw $t0 -76($sp)
   lw $t1 -88($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------75  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -92($sp)

#------------76  FACTOR_ARRAY INT var2 [reg[10]] save in reg[11]
   lw $t3 -92($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -96($sp)

#------------77  IF reg[11] BEQ reg[0] THEN GOTO label_8
   lw $t0 -96($sp)
    beq $t0 $0 label_8

#------------78  WRITE var2[1] is true
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------79  JUMP to label_9
   j label_9

#------------80  label_8    ----------------Label----------------
label_8:

#------------81  label_9    ----------------Label----------------
label_9:

#------------82  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -100($sp)

#------------83  FACTOR_VAR INT j save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -104($sp)

#------------84  IF reg[12] BGEQ reg[13] THEN GOTO label_10
   lw $t0 -100($sp)
   lw $t1 -104($sp)
    bge $t0 $t1 label_10

#------------85  FACTOR_VAR INT num save in reg[14]
   lw $t3 -16($sp)
   sw $t3 -108($sp)

#------------86  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -112($sp)

#------------87  reg[16] = reg[14] JIA reg[15]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   add $t2 $t0 $t1
   sw $t2 -116($sp)

#------------88  ASSIGN INT num = reg[16]
   lw $t3 -116($sp)
   sw $t3 -16($sp)

#------------89  JUMP to label_11
   j label_11

#------------90  label_10    ----------------Label----------------
label_10:

#------------91  FACTOR_VAR INT num save in reg[17]
   lw $t3 -16($sp)
   sw $t3 -120($sp)

#------------92  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -124($sp)

#------------93  reg[19] = reg[17] JIAN reg[18]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   sub $t2 $t0 $t1
   sw $t2 -128($sp)

#------------94  ASSIGN INT num = reg[19]
   lw $t3 -128($sp)
   sw $t3 -16($sp)

#------------95  label_11    ----------------Label----------------
label_11:

#------------96  FACTOR_VAR INT i save in reg[20]
   lw $t3 0($sp)
   sw $t3 -132($sp)

#------------97  FACTOR_VAR INT j save in reg[21]
   lw $t3 -4($sp)
   sw $t3 -136($sp)

#------------98  IF reg[20] BLEQ reg[21] THEN GOTO label_12
   lw $t0 -132($sp)
   lw $t1 -136($sp)
    ble $t0 $t1 label_12

#------------99  FACTOR_CON INT 2 save in reg[22]
   li $t0 2
   sw $t0 -140($sp)

#------------100  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -144($sp)

#------------101  ASSIGN_ARR INT var2[reg[22]] = reg[23]
   lw $t0 -140($sp)
   lw $t1 -144($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------102  JUMP to label_13
   j label_13

#------------103  label_12    ----------------Label----------------
label_12:

#------------104  label_13    ----------------Label----------------
label_13:

#------------105  FACTOR_VAR INT i save in reg[24]
   lw $t3 0($sp)
   sw $t3 -148($sp)

#------------106  FACTOR_VAR INT j save in reg[25]
   lw $t3 -4($sp)
   sw $t3 -152($sp)

#------------107  IF reg[24] BEQ reg[25] THEN GOTO label_14
   lw $t0 -148($sp)
   lw $t1 -152($sp)
    beq $t0 $t1 label_14

#------------108  FACTOR_CON INT 3 save in reg[26]
   li $t0 3
   sw $t0 -156($sp)

#------------109  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -160($sp)

#------------110  ASSIGN_ARR INT var2[reg[26]] = reg[27]
   lw $t0 -156($sp)
   lw $t1 -160($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------111  JUMP to label_15
   j label_15

#------------112  label_14    ----------------Label----------------
label_14:

#------------113  label_15    ----------------Label----------------
label_15:

#------------114  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -164($sp)

#------------115  FACTOR_ARRAY INT var2 [reg[28]] save in reg[29]
   lw $t3 -164($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -168($sp)

#------------116  FACTOR_CON INT 1 save in reg[30]
   li $t0 1
   sw $t0 -172($sp)

#------------117  FACTOR_ARRAY INT var2 [reg[30]] save in reg[31]
   lw $t3 -172($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -176($sp)

#------------118  reg[32] = reg[29] CHENG reg[31]
   lw $t0 -168($sp)
   lw $t1 -176($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -180($sp)

#------------119  IF reg[32] BEQ reg[0] THEN GOTO label_16
   lw $t0 -180($sp)
    beq $t0 $0 label_16

#------------120  FACTOR_CON INT 4 save in reg[33]
   li $t0 4
   sw $t0 -184($sp)

#------------121  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -188($sp)

#------------122  ASSIGN_ARR INT var2[reg[33]] = reg[34]
   lw $t0 -184($sp)
   lw $t1 -188($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------123  JUMP to label_17
   j label_17

#------------124  label_16    ----------------Label----------------
label_16:

#------------125  label_17    ----------------Label----------------
label_17:



#------------128  FACTOR_CON INT 1 save in reg[37]
   li $t0 1
   sw $t0 -200($sp)

#------------129  FACTOR_VAR INT i save in reg[38]
   lw $t3 0($sp)
   sw $t3 -204($sp)

#------------130  reg[39] = reg[37] CHU reg[38]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -208($sp)

#------------131  IF reg[39] BEQ reg[0] THEN GOTO label_18
   lw $t0 -208($sp)
    beq $t0 $0 label_18

#------------132  FACTOR_CON INT 5 save in reg[40]
   li $t0 5
   sw $t0 -212($sp)

#------------133  FACTOR_CON INT 1 save in reg[41]
   li $t0 1
   sw $t0 -216($sp)

#------------134  ASSIGN_ARR INT var2[reg[40]] = reg[41]
   lw $t0 -212($sp)
   lw $t1 -216($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------135  JUMP to label_19
   j label_19

#------------136  label_18    ----------------Label----------------
label_18:

#------------137  label_19    ----------------Label----------------
label_19:

#------------138  FACTOR_VAR INT i save in reg[42]
   lw $t3 0($sp)
   sw $t3 -220($sp)

#------------139  FACTOR_CON CHAR 0 save in reg[43]
   li $t0 0
   sw $t0 -224($sp)

#------------140  reg[44] = reg[43] JIAN reg[42]
   lw $t0 -224($sp)
   lw $t1 -220($sp)
   sub $t2 $t0 $t1
   sw $t2 -228($sp)

#------------141  FACTOR_VAR INT j save in reg[45]
   lw $t3 -4($sp)
   sw $t3 -232($sp)

#------------142  reg[46] = reg[44] JIA reg[45]
   lw $t0 -228($sp)
   lw $t1 -232($sp)
   add $t2 $t0 $t1
   sw $t2 -236($sp)

#------------143  IF reg[46] BEQ reg[0] THEN GOTO label_20
   lw $t0 -236($sp)
    beq $t0 $0 label_20

#------------144  FACTOR_CON INT 6 save in reg[47]
   li $t0 6
   sw $t0 -240($sp)

#------------145  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -244($sp)

#------------146  ASSIGN_ARR INT var2[reg[47]] = reg[48]
   lw $t0 -240($sp)
   lw $t1 -244($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------147  JUMP to label_21
   j label_21

#------------148  label_20    ----------------Label----------------
label_20:

#------------149  label_21    ----------------Label----------------
label_21:

#------------150  FACTOR_VAR CHAR c save in reg[49]
   lw $t3 -8($sp)
   sw $t3 -248($sp)

#------------151  FACTOR_CON CHAR 65 save in reg[50]
   li $t0 65
   sw $t0 -252($sp)

#------------152  reg[51] = reg[49] JIAN reg[50]
   lw $t0 -248($sp)
   lw $t1 -252($sp)
   sub $t2 $t0 $t1
   sw $t2 -256($sp)

#------------153  IF reg[51] BEQ reg[0] THEN GOTO label_22
   lw $t0 -256($sp)
    beq $t0 $0 label_22

#------------154  FACTOR_CON INT 7 save in reg[52]
   li $t0 7
   sw $t0 -260($sp)

#------------155  FACTOR_CON INT 1 save in reg[53]
   li $t0 1
   sw $t0 -264($sp)

#------------156  ASSIGN_ARR INT var2[reg[52]] = reg[53]
   lw $t0 -260($sp)
   lw $t1 -264($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -24($t0)

#------------157  JUMP to label_23
   j label_23

#------------158  label_22    ----------------Label----------------
label_22:

#------------159  label_23    ----------------Label----------------
label_23:

#------------160  label_24    ----------------Label----------------
label_24:

#------------161  FACTOR_VAR INT i save in reg[54]
   lw $t3 0($sp)
   sw $t3 -268($sp)

#------------162  FACTOR_CON INT 0 save in reg[55]
   li $t0 0
   sw $t0 -272($sp)

#------------163  IF reg[54] BLEQ reg[55] THEN GOTO label_25
   lw $t0 -268($sp)
   lw $t1 -272($sp)
    ble $t0 $t1 label_25

#------------164  FACTOR_VAR INT i save in reg[56]
   lw $t3 0($sp)
   sw $t3 -276($sp)

#------------165  FACTOR_CON INT 1 save in reg[57]
   li $t0 1
   sw $t0 -280($sp)

#------------166  reg[58] = reg[56] JIAN reg[57]
   lw $t0 -276($sp)
   lw $t1 -280($sp)
   sub $t2 $t0 $t1
   sw $t2 -284($sp)

#------------167  ASSIGN INT i = reg[58]
   lw $t3 -284($sp)
   sw $t3 0($sp)

#------------168  JUMP to label_24
   j label_24

#------------169  label_25    ----------------Label----------------
label_25:

#------------170  FACTOR_CON INT 5 save in reg[59]
   li $t0 5
   sw $t0 -288($sp)

#------------171  ASSIGN INT i = reg[59]
   lw $t3 -288($sp)
   sw $t3 0($sp)

#------------172  label_26    ----------------Label----------------
label_26:

#------------173  FACTOR_VAR INT count save in reg[60]
   lw $t3 -20($sp)
   sw $t3 -292($sp)

#------------174  FACTOR_CON INT 1 save in reg[61]
   li $t0 1
   sw $t0 -296($sp)

#------------175  reg[62] = reg[60] JIA reg[61]
   lw $t0 -292($sp)
   lw $t1 -296($sp)
   add $t2 $t0 $t1
   sw $t2 -300($sp)

#------------176  ASSIGN INT count = reg[62]
   lw $t3 -300($sp)
   sw $t3 -20($sp)

#------------177  FACTOR_VAR INT i save in reg[63]
   lw $t3 0($sp)
   sw $t3 -304($sp)

#------------178  FACTOR_CON INT 1 save in reg[64]
   li $t0 1
   sw $t0 -308($sp)

#------------179  reg[65] = reg[63] JIAN reg[64]
   lw $t0 -304($sp)
   lw $t1 -308($sp)
   sub $t2 $t0 $t1
   sw $t2 -312($sp)

#------------180  ASSIGN INT i = reg[65]
   lw $t3 -312($sp)
   sw $t3 0($sp)

#------------181  FACTOR_VAR INT i save in reg[66]
   lw $t3 0($sp)
   sw $t3 -316($sp)

#------------182  FACTOR_CON INT 0 save in reg[67]
   li $t0 0
   sw $t0 -320($sp)

#------------183  IF reg[66] BGTR reg[67] THEN GOTO label_26
   lw $t0 -316($sp)
   lw $t1 -320($sp)
    bgt $t0 $t1 label_26

#------------184  FACTOR_CON INT 0 save in reg[68]
   li $t0 0
   sw $t0 -324($sp)

#------------185  ASSIGN INT i = reg[68]
   lw $t3 -324($sp)
   sw $t3 0($sp)

#------------186  label_27    ----------------Label----------------
label_27:

#------------187  FACTOR_VAR INT count save in reg[69]
   lw $t3 -20($sp)
   sw $t3 -328($sp)

#------------188  FACTOR_CON INT 1 save in reg[70]
   li $t0 1
   sw $t0 -332($sp)

#------------189  reg[71] = reg[69] JIA reg[70]
   lw $t0 -328($sp)
   lw $t1 -332($sp)
   add $t2 $t0 $t1
   sw $t2 -336($sp)

#------------190  ASSIGN INT count = reg[71]
   lw $t3 -336($sp)
   sw $t3 -20($sp)

#------------191  FACTOR_VAR INT i save in reg[72]
   lw $t3 0($sp)
   sw $t3 -340($sp)

#------------192  FACTOR_CON INT 1 save in reg[73]
   li $t0 1
   sw $t0 -344($sp)

#------------193  reg[74] = reg[72] JIA reg[73]
   lw $t0 -340($sp)
   lw $t1 -344($sp)
   add $t2 $t0 $t1
   sw $t2 -348($sp)

#------------194  ASSIGN INT i = reg[74]
   lw $t3 -348($sp)
   sw $t3 0($sp)

#------------195  FACTOR_VAR INT i save in reg[75]
   lw $t3 0($sp)
   sw $t3 -352($sp)

#------------196  FACTOR_CON INT 5 save in reg[76]
   li $t0 5
   sw $t0 -356($sp)

#------------197  IF reg[75] BLSS reg[76] THEN GOTO label_27
   lw $t0 -352($sp)
   lw $t1 -356($sp)
    blt $t0 $t1 label_27

#------------198  FACTOR_VAR INT count save in reg[77]
   lw $t3 -20($sp)
   sw $t3 -360($sp)

#------------199  WRITE INT reg[77]
   li $v0 1
   lw $a0 -360($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------200  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------201  FUNC VOID print2(0)
   jr $ra

.func_print2:

#------------202  CONST INT i = 1

#------------203  VAR INT int

#------------204  WRITE print2 called
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------205  FACTOR_CON INT 2 save in reg[1]
   li $t0 2
   sw $t0 -4($sp)

#------------206  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------207  FUNC VOID main(0)
   jr $ra

.func_main:

#------------208  CONST INT a = 1

#------------209  CONST INT a0b1c2d3e4 = -233

#------------210  CONST INT f5g6h7i8j9 = 3072

#------------211  CONST CHAR klmn = 36

#------------212  CONST CHAR opq = 45

#------------213  CONST CHAR rst = 42

#------------214  CONST CHAR uvw = 47

#------------215  CONST CHAR x = 97

#------------216  CONST CHAR y_z = 48

#------------217  VAR INT abcd

#------------218  VAR INT abcd

#------------219  VAR CHAR cha1

#------------220  VAR CHAR cha2

#------------221  ARRAY CHAR efg[10]

#------------222  VAR INT hijk

#------------223  ARRAY INT lmn[5]

#------------224  VAR INT o

#------------225  ARRAY INT p[20]

#------------226  VAR INT ans1

#------------227  VAR INT ans2

#------------228  VAR CHAR ans3

#------------229  VAR CHAR ans4

#------------230  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -184($sp)

#------------231  ASSIGN INT ans1 = reg[2]
   lw $t3 -184($sp)
   sw $t3 -164($sp)

#------------232  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -188($sp)

#------------233  ASSIGN INT ans2 = reg[3]
   lw $t3 -188($sp)
   sw $t3 -168($sp)

#------------234  FACTOR_CON CHAR 97 save in reg[4]
   li $t0 97
   sw $t0 -192($sp)

#------------235  ASSIGN CHAR ans3 = reg[4]
   lw $t3 -192($sp)
   sw $t3 -172($sp)

#------------236  FACTOR_CON CHAR 99 save in reg[5]
   li $t0 99
   sw $t0 -196($sp)

#------------237  ASSIGN CHAR ans4 = reg[5]
   lw $t3 -196($sp)
   sw $t3 -176($sp)

#------------238  FACTOR_VAR CHAR ans4 save in reg[6]
   lw $t3 -176($sp)
   sw $t3 -200($sp)

#------------239  ASSIGN INT ans1 = reg[6]
   lw $t3 -200($sp)
   sw $t3 -164($sp)

#------------240  FACTOR_VAR INT ans2 save in reg[7]
   lw $t3 -168($sp)
   sw $t3 -204($sp)

#------------241  ASSIGN CHAR ans3 = reg[7]
   lw $t3 -204($sp)
   sw $t3 -172($sp)

#------------242  FACTOR_VAR INT ans1 save in reg[8]
   lw $t3 -164($sp)
   sw $t3 -208($sp)

#------------243  FACTOR_VAR CHAR ans4 save in reg[9]
   lw $t3 -176($sp)
   sw $t3 -212($sp)

#------------244  IF reg[8] BGEQ reg[9] THEN GOTO label_30
   lw $t0 -208($sp)
   lw $t1 -212($sp)
    bge $t0 $t1 label_30

#------------245  FACTOR_VAR CHAR ans3 save in reg[10]
   lw $t3 -172($sp)
   sw $t3 -216($sp)

#------------246  FACTOR_VAR CHAR ans3 save in reg[11]
   lw $t3 -172($sp)
   sw $t3 -220($sp)

#------------247  FACTOR_VAR CHAR ans3 save in reg[12]
   lw $t3 -172($sp)
   sw $t3 -224($sp)

#------------248  PUSH INT parareg[2] from reg[10]
   sw $ra -228($sp)
   lw $t0 -216($sp)
   sw $t0 -232($sp)

#------------249  PUSH INT parareg[3] from reg[11]
   lw $t0 -220($sp)
   sw $t0 -236($sp)

#------------250  PUSH INT parareg[4] from reg[12]
   lw $t0 -224($sp)
   sw $t0 -240($sp)

#------------251  CALL VOID print1(3)
   addi $sp $sp -232
   jal .func_print1
   subi $sp $sp -232
   lw $ra -228($sp)

#------------252  FACTOR_VAR INT ans1 save in reg[13]
   lw $t3 -164($sp)
   sw $t3 -228($sp)

#------------253  FACTOR_VAR CHAR ans4 save in reg[14]
   lw $t3 -176($sp)
   sw $t3 -232($sp)

#------------254  FACTOR_VAR CHAR ans4 save in reg[15]
   lw $t3 -176($sp)
   sw $t3 -236($sp)

#------------255  PUSH INT parareg[5] from reg[13]
   sw $ra -240($sp)
   lw $t0 -228($sp)
   sw $t0 -244($sp)

#------------256  PUSH INT parareg[6] from reg[14]
   lw $t0 -232($sp)
   sw $t0 -248($sp)

#------------257  PUSH INT parareg[7] from reg[15]
   lw $t0 -236($sp)
   sw $t0 -252($sp)

#------------258  CALL VOID print1(3)
   addi $sp $sp -244
   jal .func_print1
   subi $sp $sp -244
   lw $ra -240($sp)

#------------259  FACTOR_VAR INT ans1 save in reg[16]
   lw $t3 -164($sp)
   sw $t3 -240($sp)

#------------260  FACTOR_VAR INT ans2 save in reg[17]
   lw $t3 -168($sp)
   sw $t3 -244($sp)

#------------261  FACTOR_VAR INT ans2 save in reg[18]
   lw $t3 -168($sp)
   sw $t3 -248($sp)

#------------262  PUSH INT parareg[8] from reg[16]
   sw $ra -252($sp)
   lw $t0 -240($sp)
   sw $t0 -256($sp)

#------------263  PUSH INT parareg[9] from reg[17]
   lw $t0 -244($sp)
   sw $t0 -260($sp)

#------------264  PUSH INT parareg[10] from reg[18]
   lw $t0 -248($sp)
   sw $t0 -264($sp)

#------------265  CALL VOID print1(3)
   addi $sp $sp -256
   jal .func_print1
   subi $sp $sp -256
   lw $ra -252($sp)

#------------266  FACTOR_CON CHAR 98 save in reg[19]
   li $t0 98
   sw $t0 -252($sp)

#------------267  ASSIGN INT ans1 = reg[19]
   lw $t3 -252($sp)
   sw $t3 -164($sp)

#------------268  label_28    ----------------Label----------------
label_28:

#------------269  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -256($sp)

#------------270  ASSIGN CHAR ans3 = reg[20]
   lw $t3 -256($sp)
   sw $t3 -172($sp)

#------------271  FACTOR_CON INT 2 save in reg[21]
   li $t0 2
   sw $t0 -260($sp)

#------------272  ASSIGN INT ans4 = reg[21]
   lw $t3 -260($sp)
   sw $t3 -176($sp)

#------------273  label_29    ----------------Label----------------
label_29:

#------------274  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -264($sp)

#------------275  ASSIGN CHAR ans3 = reg[22]
   lw $t3 -264($sp)
   sw $t3 -172($sp)

#------------276  FACTOR_VAR INT ans4 save in reg[23]
   lw $t3 -176($sp)
   sw $t3 -268($sp)

#------------277  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -272($sp)

#------------278  reg[25] = reg[23] JIA reg[24]
   lw $t0 -268($sp)
   lw $t1 -272($sp)
   add $t2 $t0 $t1
   sw $t2 -276($sp)

#------------279  ASSIGN INT ans4 = reg[25]
   lw $t3 -276($sp)
   sw $t3 -176($sp)

#------------280  FACTOR_VAR INT ans1 save in reg[26]
   lw $t3 -164($sp)
   sw $t3 -280($sp)

#------------281  FACTOR_CON INT 0 save in reg[27]
   li $t0 0
   sw $t0 -284($sp)

#------------282  IF reg[26] BLSS reg[27] THEN GOTO label_29
   lw $t0 -280($sp)
   lw $t1 -284($sp)
    blt $t0 $t1 label_29

#------------283  FACTOR_VAR INT ans1 save in reg[28]
   lw $t3 -164($sp)
   sw $t3 -288($sp)

#------------284  FACTOR_CON INT 1 save in reg[29]
   li $t0 1
   sw $t0 -292($sp)

#------------285  reg[30] = reg[28] JIA reg[29]
   lw $t0 -288($sp)
   lw $t1 -292($sp)
   add $t2 $t0 $t1
   sw $t2 -296($sp)

#------------286  ASSIGN INT ans1 = reg[30]
   lw $t3 -296($sp)
   sw $t3 -164($sp)

#------------287  FACTOR_VAR INT ans1 save in reg[31]
   lw $t3 -164($sp)
   sw $t3 -300($sp)

#------------288  FACTOR_CON CHAR 100 save in reg[32]
   li $t0 100
   sw $t0 -304($sp)

#------------289  IF reg[31] BLSS reg[32] THEN GOTO label_28
   lw $t0 -300($sp)
   lw $t1 -304($sp)
    blt $t0 $t1 label_28

#------------290  JUMP to label_31
   j label_31

#------------291  label_30    ----------------Label----------------
label_30:

#------------292  label_31    ----------------Label----------------
label_31:

#------------293  FACTOR_CON INT 1 save in reg[33]
   li $t0 1
   sw $t0 -308($sp)

#------------294  ASSIGN CHAR ans3 = reg[33]
   lw $t3 -308($sp)
   sw $t3 -172($sp)

#------------295  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -312($sp)

#------------296  ASSIGN CHAR ans4 = reg[34]
   lw $t3 -312($sp)
   sw $t3 -176($sp)

#------------297  FACTOR_CON INT 2 save in reg[35]
   li $t0 2
   sw $t0 -316($sp)

#------------298  ASSIGN INT ans2 = reg[35]
   lw $t3 -316($sp)
   sw $t3 -168($sp)

#------------299  FACTOR_CON INT 3 save in reg[36]
   li $t0 3
   sw $t0 -320($sp)

#------------300  ASSIGN INT ans1 = reg[36]
   lw $t3 -320($sp)
   sw $t3 -164($sp)



#------------303  FACTOR_CON INT 0 save in reg[39]
   li $t0 0
   sw $t0 -332($sp)

#------------304  FACTOR_CON INT 0 save in reg[40]
   li $t0 0
   sw $t0 -336($sp)

#------------305  ASSIGN_ARR INT lmn[reg[39]] = reg[40]
   lw $t0 -332($sp)
   lw $t1 -336($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)

#------------306  FACTOR_CON INT 1 save in reg[41]
   li $t0 1
   sw $t0 -340($sp)

#------------307  FACTOR_CON INT 1 save in reg[42]
   li $t0 1
   sw $t0 -344($sp)

#------------308  ASSIGN_ARR INT lmn[reg[41]] = reg[42]
   lw $t0 -340($sp)
   lw $t1 -344($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)

#------------309  FACTOR_CON INT 2 save in reg[43]
   li $t0 2
   sw $t0 -348($sp)

#------------310  FACTOR_CON INT 2 save in reg[44]
   li $t0 2
   sw $t0 -352($sp)

#------------311  ASSIGN_ARR INT lmn[reg[43]] = reg[44]
   lw $t0 -348($sp)
   lw $t1 -352($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)



#------------314  FACTOR_CON INT -1 save in reg[47]
   li $t0 -1
   sw $t0 -364($sp)



#------------317  FACTOR_CON INT -1 save in reg[50]
   li $t0 -1
   sw $t0 -376($sp)

#------------318  ASSIGN_ARR INT lmn[reg[47]] = reg[50]
   lw $t0 -364($sp)
   lw $t1 -376($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)

#------------319  FACTOR_CON INT 4 save in reg[51]
   li $t0 4
   sw $t0 -380($sp)

#------------320  FACTOR_CON INT 4 save in reg[52]
   li $t0 4
   sw $t0 -384($sp)

#------------321  ASSIGN_ARR INT lmn[reg[51]] = reg[52]
   lw $t0 -380($sp)
   lw $t1 -384($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)

#------------322  FACTOR_CON INT 5 save in reg[53]
   li $t0 5
   sw $t0 -388($sp)

#------------323  FACTOR_CON INT 5 save in reg[54]
   li $t0 5
   sw $t0 -392($sp)

#------------324  ASSIGN_ARR INT lmn[reg[53]] = reg[54]
   lw $t0 -388($sp)
   lw $t1 -392($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)

#------------325  FACTOR_VAR INT ans1 save in reg[55]
   lw $t3 -164($sp)
   sw $t3 -396($sp)

#------------326  FACTOR_VAR INT ans2 save in reg[56]
   lw $t3 -168($sp)
   sw $t3 -400($sp)

#------------327  reg[57] = reg[55] JIA reg[56]
   lw $t0 -396($sp)
   lw $t1 -400($sp)
   add $t2 $t0 $t1
   sw $t2 -404($sp)

#------------328  FACTOR_EXPR reg[57] save in reg[58]
   lw $t0 -404($sp)
   sw $t0 -408($sp)

#------------329  FACTOR_EXPR reg[58] save in reg[59]
   lw $t0 -408($sp)
   sw $t0 -412($sp)

#------------330  FACTOR_CON INT 5 save in reg[60]
   li $t0 5
   sw $t0 -416($sp)

#------------331  ASSIGN_ARR INT lmn[reg[59]] = reg[60]
   lw $t0 -412($sp)
   lw $t1 -416($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -60($t0)

#------------332  READ INT abcd
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------333  READ INT hijk
   li $v0 5
   syscall
   sw $v0 -56($sp)

#------------334  READ INT o
   li $v0 5
   syscall
   sw $v0 -80($sp)

#------------335  READ CHAR cha1
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------336  READ CHAR cha2
   li $v0 12
   syscall
   sw $v0 -12($sp)

#------------337  READ_EXTERN INT b
   li $v0 5
   syscall
   sw $v0 .var_b

#------------338  FACTOR_CON INT 7 save in reg[61]
   li $t0 7
   sw $t0 -420($sp)














#------------352  FACTOR_CON INT 9 save in reg[75]
   li $t0 9
   sw $t0 -476($sp)

#------------353  ASSIGN_ARR_EXTERN INT add[reg[61]] = reg[75]
   lw $t0 -420($sp)
   lw $t1 -476($sp)
   sll $t0 $t0 2
   sw $t1 .var_add($t0)

#------------354  FACTOR_CON INT 8 save in reg[76]
   li $t0 8
   sw $t0 -480($sp)

#------------355  FACTOR_VAR_EXTERN INT b save in reg[77]
   lw $t3 .var_b
   sw $t3 -484($sp)

#------------356  ASSIGN_ARR_EXTERN INT add[reg[76]] = reg[77]
   lw $t0 -480($sp)
   lw $t1 -484($sp)
   sll $t0 $t0 2
   sw $t1 .var_add($t0)

#------------357  FACTOR_CON INT 9 save in reg[78]
   li $t0 9
   sw $t0 -488($sp)

#------------358  FACTOR_CON INT 7 save in reg[79]
   li $t0 7
   sw $t0 -492($sp)

#------------359  FACTOR_ARRAY_EXTERN INT add [reg[79]] save in reg[80]
   lw $t3 -492($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -496($sp)

#------------360  ASSIGN_ARR_EXTERN INT add[reg[78]] = reg[80]
   lw $t0 -488($sp)
   lw $t1 -496($sp)
   sll $t0 $t0 2
   sw $t1 .var_add($t0)

#------------361  FACTOR_CON INT 233 save in reg[81]
   li $t0 233
   sw $t0 -500($sp)

#------------362  ASSIGN_EXTERN INT b = reg[81]
   lw $t3 -500($sp)
   sw $t3 .var_b

#------------363  FACTOR_CON INT 0 save in reg[82]
   li $t0 0
   sw $t0 -504($sp)

#------------364  FACTOR_ARRAY INT lmn [reg[82]] save in reg[83]
   lw $t3 -504($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -60($t3)
   sw $t3 -508($sp)

#------------365  PUSH INT parareg[11] from reg[83]
   sw $ra -512($sp)
   lw $t0 -508($sp)
   sw $t0 -516($sp)

#------------366  CALL INT getint(1)
   addi $sp $sp -516
   jal .func_getint
   subi $sp $sp -516
   lw $ra -512($sp)

#------------367  FACTOR_FUNC INT getint save in reg[84]
   sw $v0 -512($sp)

#------------368  FACTOR_CON INT 1 save in reg[85]
   li $t0 1
   sw $t0 -516($sp)

#------------369  FACTOR_ARRAY INT lmn [reg[85]] save in reg[86]
   lw $t3 -516($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -60($t3)
   sw $t3 -520($sp)

#------------370  PUSH INT parareg[12] from reg[86]
   sw $ra -524($sp)
   lw $t0 -520($sp)
   sw $t0 -528($sp)

#------------371  CALL INT getint(1)
   addi $sp $sp -528
   jal .func_getint
   subi $sp $sp -528
   lw $ra -524($sp)

#------------372  FACTOR_FUNC INT getint save in reg[87]
   sw $v0 -524($sp)

#------------373  reg[88] = reg[84] JIA reg[87]
   lw $t0 -512($sp)
   lw $t1 -524($sp)
   add $t2 $t0 $t1
   sw $t2 -528($sp)

#------------374  FACTOR_CON INT 2 save in reg[89]
   li $t0 2
   sw $t0 -532($sp)

#------------375  FACTOR_ARRAY INT lmn [reg[89]] save in reg[90]
   lw $t3 -532($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -60($t3)
   sw $t3 -536($sp)

#------------376  PUSH INT parareg[13] from reg[90]
   sw $ra -540($sp)
   lw $t0 -536($sp)
   sw $t0 -544($sp)

#------------377  CALL INT getint(1)
   addi $sp $sp -544
   jal .func_getint
   subi $sp $sp -544
   lw $ra -540($sp)

#------------378  FACTOR_FUNC INT getint save in reg[91]
   sw $v0 -540($sp)

#------------379  reg[92] = reg[88] JIA reg[91]
   lw $t0 -528($sp)
   lw $t1 -540($sp)
   add $t2 $t0 $t1
   sw $t2 -544($sp)

#------------380  WRITE result1 = 
   li $v0 4
   la $a0 .str_2
   syscall

#------------381  WRITE INT reg[92]
   li $v0 1
   lw $a0 -544($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------382  FACTOR_VAR INT abcd save in reg[93]
   lw $t3 0($sp)
   sw $t3 -548($sp)

#------------383  PUSH INT parareg[14] from reg[93]
   sw $ra -552($sp)
   lw $t0 -548($sp)
   sw $t0 -556($sp)

#------------384  CALL INT getint(1)
   addi $sp $sp -556
   jal .func_getint
   subi $sp $sp -556
   lw $ra -552($sp)

#------------385  FACTOR_FUNC INT getint save in reg[94]
   sw $v0 -552($sp)

#------------386  WRITE the 10th Fibonacci number is 
   li $v0 4
   la $a0 .str_3
   syscall

#------------387  WRITE INT reg[94]
   li $v0 1
   lw $a0 -552($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------388  PUSH INT parareg[15] from reg[94]
   sw $ra -556($sp)
   lw $t0 -552($sp)
   sw $t0 -560($sp)

#------------389  CALL CHAR getcha(0)
   sw $ra -564($sp)
   addi $sp $sp -568
   jal .func_getcha
   subi $sp $sp -568
   lw $ra -564($sp)

#------------390  FACTOR_VAR INT hijk save in reg[95]
   lw $t3 -56($sp)
   sw $t3 -556($sp)

#------------391  FACTOR_VAR INT o save in reg[96]
   lw $t3 -80($sp)
   sw $t3 -560($sp)

#------------392  FACTOR_VAR CHAR cha1 save in reg[97]
   lw $t3 -8($sp)
   sw $t3 -564($sp)

#------------393  PUSH INT parareg[16] from reg[95]
   lw $t0 -556($sp)
   sw $t0 -568($sp)

#------------394  PUSH INT parareg[17] from reg[96]
   lw $t0 -560($sp)
   sw $t0 -572($sp)

#------------395  PUSH INT parareg[18] from reg[97]
   lw $t0 -564($sp)
   sw $t0 -576($sp)

#------------396  CALL VOID print1(3)
   addi $sp $sp -560
   jal .func_print1
   subi $sp $sp -560
   lw $ra -556($sp)

#------------397  FACTOR_VAR INT o save in reg[98]
   lw $t3 -80($sp)
   sw $t3 -568($sp)

#------------398  FACTOR_VAR INT hijk save in reg[99]
   lw $t3 -56($sp)
   sw $t3 -572($sp)

#------------399  FACTOR_VAR CHAR cha1 save in reg[100]
   lw $t3 -8($sp)
   sw $t3 -576($sp)

#------------400  PUSH INT parareg[19] from reg[98]
   sw $ra -580($sp)
   lw $t0 -568($sp)
   sw $t0 -584($sp)

#------------401  PUSH INT parareg[20] from reg[99]
   lw $t0 -572($sp)
   sw $t0 -588($sp)

#------------402  PUSH INT parareg[21] from reg[100]
   lw $t0 -576($sp)
   sw $t0 -592($sp)

#------------403  CALL VOID print1(3)
   addi $sp $sp -584
   jal .func_print1
   subi $sp $sp -584
   lw $ra -580($sp)

#------------404  FACTOR_VAR INT hijk save in reg[101]
   lw $t3 -56($sp)
   sw $t3 -580($sp)

#------------405  FACTOR_VAR INT hijk save in reg[102]
   lw $t3 -56($sp)
   sw $t3 -584($sp)

#------------406  FACTOR_VAR CHAR cha2 save in reg[103]
   lw $t3 -12($sp)
   sw $t3 -588($sp)

#------------407  PUSH INT parareg[22] from reg[101]
   sw $ra -592($sp)
   lw $t0 -580($sp)
   sw $t0 -596($sp)

#------------408  PUSH INT parareg[23] from reg[102]
   lw $t0 -584($sp)
   sw $t0 -600($sp)

#------------409  PUSH INT parareg[24] from reg[103]
   lw $t0 -588($sp)
   sw $t0 -604($sp)

#------------410  CALL VOID print1(3)
   addi $sp $sp -596
   jal .func_print1
   subi $sp $sp -596
   lw $ra -592($sp)

#------------411  CALL VOID print2(0)
   sw $ra -592($sp)
   addi $sp $sp -596
   jal .func_print2
   subi $sp $sp -596
   lw $ra -592($sp)

#------------412  FACTOR_VAR_EXTERN INT b save in reg[104]
   lw $t3 .var_b
   sw $t3 -592($sp)

#------------413  WRITE INT reg[104]
   li $v0 1
   lw $a0 -592($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------414  FACTOR_CON INT 7 save in reg[105]
   li $t0 7
   sw $t0 -596($sp)

#------------415  FACTOR_ARRAY_EXTERN INT add [reg[105]] save in reg[106]
   lw $t3 -596($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -600($sp)

#------------416  FACTOR_CON INT 8 save in reg[107]
   li $t0 8
   sw $t0 -604($sp)

#------------417  FACTOR_ARRAY_EXTERN INT add [reg[107]] save in reg[108]
   lw $t3 -604($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -608($sp)

#------------418  reg[109] = reg[106] JIA reg[108]
   lw $t0 -600($sp)
   lw $t1 -608($sp)
   add $t2 $t0 $t1
   sw $t2 -612($sp)

#------------419  FACTOR_CON INT 9 save in reg[110]
   li $t0 9
   sw $t0 -616($sp)

#------------420  FACTOR_ARRAY_EXTERN INT add [reg[110]] save in reg[111]
   lw $t3 -616($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -620($sp)

#------------421  reg[112] = reg[109] JIA reg[111]
   lw $t0 -612($sp)
   lw $t1 -620($sp)
   add $t2 $t0 $t1
   sw $t2 -624($sp)

#------------422  WRITE INT reg[112]
   li $v0 1
   lw $a0 -624($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------423  FACTOR_CON CHAR 99 save in reg[113]
   li $t0 99
   sw $t0 -628($sp)

#------------424  WRITE CHAR reg[113]
   li $v0 11
   lw $a0 -628($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------425  FACTOR_VAR CHAR cha1 save in reg[114]
   lw $t3 -8($sp)
   sw $t3 -632($sp)

#------------426  WRITE CHAR reg[114]
   li $v0 11
   lw $a0 -632($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------427  FACTOR_VAR CHAR cha1 save in reg[115]
   lw $t3 -8($sp)
   sw $t3 -636($sp)

#------------428  FACTOR_VAR CHAR cha2 save in reg[116]
   lw $t3 -12($sp)
   sw $t3 -640($sp)

#------------429  reg[117] = reg[115] JIA reg[116]
   lw $t0 -636($sp)
   lw $t1 -640($sp)
   add $t2 $t0 $t1
   sw $t2 -644($sp)

#------------430  WRITE INT reg[117]
   li $v0 1
   lw $a0 -644($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------431  FACTOR_CON INT 0 save in reg[118]
   li $t0 0
   sw $t0 -648($sp)

#------------432  FACTOR_VAR CHAR cha1 save in reg[119]
   lw $t3 -8($sp)
   sw $t3 -652($sp)

#------------433  ASSIGN_ARR CHAR efg[reg[118]] = reg[119]
   lw $t0 -648($sp)
   lw $t1 -652($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -16($t0)

#------------434  FACTOR_CON INT 0 save in reg[120]
   li $t0 0
   sw $t0 -656($sp)

#------------435  FACTOR_ARRAY CHAR efg [reg[120]] save in reg[121]
   lw $t3 -656($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -16($t3)
   sw $t3 -660($sp)

#------------436  WRITE CHAR reg[121]
   li $v0 11
   lw $a0 -660($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------437  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -176($sp)
   jr $ra

   jr $ra

end:
