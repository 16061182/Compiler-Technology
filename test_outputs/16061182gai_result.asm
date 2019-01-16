.data
   .var_b: .word 0
   .var_add: .space 40
   .str_0: .asciiz "var2[1] is true"
   .str_1: .asciiz "print2 called"
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
   subu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------38  PUSH INT parareg[0] from reg[14]
   sw $ra -60($sp)
   lw $t0 -56($sp)
   sw $t0 -64($sp)

#------------39  CALL INT getint(1)
   addiu $sp $sp -64
   jal .func_getint
   subiu $sp $sp -64
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
   subu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------44  PUSH INT parareg[1] from reg[18]
   sw $ra -76($sp)
   lw $t0 -72($sp)
   sw $t0 -80($sp)

#------------45  CALL INT getint(1)
   addiu $sp $sp -80
   jal .func_getint
   subiu $sp $sp -80
   lw $ra -76($sp)

#------------46  FACTOR_FUNC INT getint save in reg[19]
   sw $v0 -76($sp)

#------------47  reg[20] = reg[15] JIA reg[19]
   lw $t0 -60($sp)
   lw $t1 -76($sp)
   addu $t2 $t0 $t1
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
   subu $t0 $sp $t0
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
   subu $t2 $t0 $t1
   sw $t2 -88($sp)

#------------74  ASSIGN_ARR INT var2[reg[6]] = reg[9]
   lw $t0 -76($sp)
   lw $t1 -88($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------75  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -92($sp)

#------------76  FACTOR_ARRAY INT var2 [reg[10]] save in reg[11]
   lw $t3 -92($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
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
   addu $t2 $t0 $t1
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
   subu $t2 $t0 $t1
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
   subu $t0 $sp $t0
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
   subu $t0 $sp $t0
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
   subu $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -168($sp)

#------------116  FACTOR_CON INT 1 save in reg[30]
   li $t0 1
   sw $t0 -172($sp)

#------------117  FACTOR_ARRAY INT var2 [reg[30]] save in reg[31]
   lw $t3 -172($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
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
   subu $t0 $sp $t0
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
   subu $t0 $sp $t0
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
   subu $t2 $t0 $t1
   sw $t2 -228($sp)

#------------141  FACTOR_VAR INT j save in reg[45]
   lw $t3 -4($sp)
   sw $t3 -232($sp)

#------------142  reg[46] = reg[44] JIA reg[45]
   lw $t0 -228($sp)
   lw $t1 -232($sp)
   addu $t2 $t0 $t1
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
   subu $t0 $sp $t0
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
   subu $t2 $t0 $t1
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
   subu $t0 $sp $t0
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
   subu $t2 $t0 $t1
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
   addu $t2 $t0 $t1
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
   subu $t2 $t0 $t1
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
   addu $t2 $t0 $t1
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
   addu $t2 $t0 $t1
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

#------------221  ARRAY CHAR efg[48]

   jr $ra

end:
