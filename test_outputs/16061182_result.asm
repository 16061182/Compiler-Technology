.data
   .var_b: .word 0
   .var_add: .space 40
   .str_0: .asciiz "var2[1] is true"
   .str_1: .asciiz "print2 called"
   .str_2: .asciiz "result1 = "
   .str_3: .asciiz "the 10th Fibonacci number is(the first number is 0) "
.text
   jal .func_main
   j end
#------------3  FUNC INT getint(1)
.func_getint:

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

#------------31  reg[12] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   subu $t2 $t0 $t1
   sw $t2 -48($sp)

#------------32  PUSH INT parareg[0] from reg[12]
   sw $ra -52($sp)
   lw $t0 -48($sp)
   sw $t0 -56($sp)

#------------33  CALL INT getint(1)
   addiu $sp $sp -56
   jal .func_getint
   subiu $sp $sp -56
   lw $ra -52($sp)

#------------34  FACTOR_FUNC INT getint save in reg[13]
   sw $v0 -52($sp)

#------------35  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------36  FACTOR_CON INT 2 save in reg[15]
   li $t0 2
   sw $t0 -60($sp)

#------------37  reg[16] = reg[14] JIAN reg[15]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   subu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------38  PUSH INT parareg[1] from reg[16]
   sw $ra -68($sp)
   lw $t0 -64($sp)
   sw $t0 -72($sp)

#------------39  CALL INT getint(1)
   addiu $sp $sp -72
   jal .func_getint
   subiu $sp $sp -72
   lw $ra -68($sp)

#------------40  FACTOR_FUNC INT getint save in reg[17]
   sw $v0 -68($sp)

#------------41  reg[18] = reg[13] JIA reg[17]
   lw $t0 -52($sp)
   lw $t1 -68($sp)
   addu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------42  RETURN reg[18] TO $V0 AND THEN GOTO 0
   lw $v0 -72($sp)
   jr $ra

#------------43  FUNC CHAR getcha(0)
   jr $ra

.func_getcha:

#------------44  CONST CHAR c = 97

#------------45  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 0($sp)

#------------46  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------47  FUNC VOID print1(3)
   jr $ra

.func_print1:

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
   subu $t0 $sp $t0
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

#------------67  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   subu $t2 $t0 $t1
   sw $t2 -88($sp)

#------------68  ASSIGN_ARR INT var2[reg[6]] = reg[9]
   lw $t0 -76($sp)
   lw $t1 -88($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------69  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -92($sp)

#------------70  FACTOR_ARRAY INT var2 [reg[10]] save in reg[11]
   lw $t3 -92($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -96($sp)

#------------71  IF reg[11] BEQ reg[0] THEN GOTO label_6
   lw $t0 -96($sp)
    beq $t0 $0 label_6

#------------72  WRITE var2[1] is true
   li $v0 4
   la $a0 .str_0
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

#------------76  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -100($sp)

#------------77  FACTOR_VAR INT j save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -104($sp)

#------------78  IF reg[12] BGEQ reg[13] THEN GOTO label_8
   lw $t0 -100($sp)
   lw $t1 -104($sp)
    bge $t0 $t1 label_8

#------------79  FACTOR_VAR INT num save in reg[14]
   lw $t3 -16($sp)
   sw $t3 -108($sp)

#------------80  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -112($sp)

#------------81  reg[16] = reg[14] JIA reg[15]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   addu $t2 $t0 $t1
   sw $t2 -116($sp)

#------------82  ASSIGN INT num = reg[16]
   lw $t3 -116($sp)
   sw $t3 -16($sp)

#------------83  JUMP to label_9
   j label_9

#------------84  label_8    ----------------Label----------------
label_8:

#------------85  FACTOR_VAR INT num save in reg[17]
   lw $t3 -16($sp)
   sw $t3 -120($sp)

#------------86  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -124($sp)

#------------87  reg[19] = reg[17] JIAN reg[18]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   subu $t2 $t0 $t1
   sw $t2 -128($sp)

#------------88  ASSIGN INT num = reg[19]
   lw $t3 -128($sp)
   sw $t3 -16($sp)

#------------89  label_9    ----------------Label----------------
label_9:

#------------90  FACTOR_VAR INT i save in reg[20]
   lw $t3 0($sp)
   sw $t3 -132($sp)

#------------91  FACTOR_VAR INT j save in reg[21]
   lw $t3 -4($sp)
   sw $t3 -136($sp)

#------------92  IF reg[20] BLEQ reg[21] THEN GOTO label_10
   lw $t0 -132($sp)
   lw $t1 -136($sp)
    ble $t0 $t1 label_10

#------------93  FACTOR_CON INT 2 save in reg[22]
   li $t0 2
   sw $t0 -140($sp)

#------------94  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -144($sp)

#------------95  ASSIGN_ARR INT var2[reg[22]] = reg[23]
   lw $t0 -140($sp)
   lw $t1 -144($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------96  JUMP to label_11
   j label_11

#------------97  label_10    ----------------Label----------------
label_10:

#------------98  label_11    ----------------Label----------------
label_11:

#------------99  FACTOR_VAR INT i save in reg[24]
   lw $t3 0($sp)
   sw $t3 -148($sp)

#------------100  FACTOR_VAR INT j save in reg[25]
   lw $t3 -4($sp)
   sw $t3 -152($sp)

#------------101  IF reg[24] BEQ reg[25] THEN GOTO label_12
   lw $t0 -148($sp)
   lw $t1 -152($sp)
    beq $t0 $t1 label_12

#------------102  FACTOR_CON INT 3 save in reg[26]
   li $t0 3
   sw $t0 -156($sp)

#------------103  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -160($sp)

#------------104  ASSIGN_ARR INT var2[reg[26]] = reg[27]
   lw $t0 -156($sp)
   lw $t1 -160($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------105  JUMP to label_13
   j label_13

#------------106  label_12    ----------------Label----------------
label_12:

#------------107  label_13    ----------------Label----------------
label_13:

#------------108  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -164($sp)

#------------109  FACTOR_ARRAY INT var2 [reg[28]] save in reg[29]
   lw $t3 -164($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -168($sp)

#------------110  FACTOR_CON INT 1 save in reg[30]
   li $t0 1
   sw $t0 -172($sp)

#------------111  FACTOR_ARRAY INT var2 [reg[30]] save in reg[31]
   lw $t3 -172($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -24($t3)
   sw $t3 -176($sp)

#------------112  reg[32] = reg[29] CHENG reg[31]
   lw $t0 -168($sp)
   lw $t1 -176($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -180($sp)

#------------113  IF reg[32] BEQ reg[0] THEN GOTO label_14
   lw $t0 -180($sp)
    beq $t0 $0 label_14

#------------114  FACTOR_CON INT 4 save in reg[33]
   li $t0 4
   sw $t0 -184($sp)

#------------115  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -188($sp)

#------------116  ASSIGN_ARR INT var2[reg[33]] = reg[34]
   lw $t0 -184($sp)
   lw $t1 -188($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------117  JUMP to label_15
   j label_15

#------------118  label_14    ----------------Label----------------
label_14:

#------------119  label_15    ----------------Label----------------
label_15:



#------------122  FACTOR_CON INT 1 save in reg[37]
   li $t0 1
   sw $t0 -200($sp)

#------------123  FACTOR_VAR INT i save in reg[38]
   lw $t3 0($sp)
   sw $t3 -204($sp)

#------------124  reg[39] = reg[37] CHU reg[38]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -208($sp)

#------------125  IF reg[39] BEQ reg[0] THEN GOTO label_16
   lw $t0 -208($sp)
    beq $t0 $0 label_16

#------------126  FACTOR_CON INT 5 save in reg[40]
   li $t0 5
   sw $t0 -212($sp)

#------------127  FACTOR_CON INT 1 save in reg[41]
   li $t0 1
   sw $t0 -216($sp)

#------------128  ASSIGN_ARR INT var2[reg[40]] = reg[41]
   lw $t0 -212($sp)
   lw $t1 -216($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------129  JUMP to label_17
   j label_17

#------------130  label_16    ----------------Label----------------
label_16:

#------------131  label_17    ----------------Label----------------
label_17:

#------------132  FACTOR_VAR INT i save in reg[42]
   lw $t3 0($sp)
   sw $t3 -220($sp)

#------------133  FACTOR_CON CHAR 0 save in reg[43]
   li $t0 0
   sw $t0 -224($sp)

#------------134  reg[44] = reg[43] JIAN reg[42]
   lw $t0 -224($sp)
   lw $t1 -220($sp)
   subu $t2 $t0 $t1
   sw $t2 -228($sp)

#------------135  FACTOR_VAR INT j save in reg[45]
   lw $t3 -4($sp)
   sw $t3 -232($sp)

#------------136  reg[46] = reg[44] JIA reg[45]
   lw $t0 -228($sp)
   lw $t1 -232($sp)
   addu $t2 $t0 $t1
   sw $t2 -236($sp)

#------------137  IF reg[46] BEQ reg[0] THEN GOTO label_18
   lw $t0 -236($sp)
    beq $t0 $0 label_18

#------------138  FACTOR_CON INT 6 save in reg[47]
   li $t0 6
   sw $t0 -240($sp)

#------------139  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -244($sp)

#------------140  ASSIGN_ARR INT var2[reg[47]] = reg[48]
   lw $t0 -240($sp)
   lw $t1 -244($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------141  JUMP to label_19
   j label_19

#------------142  label_18    ----------------Label----------------
label_18:

#------------143  label_19    ----------------Label----------------
label_19:

#------------144  FACTOR_VAR CHAR c save in reg[49]
   lw $t3 -8($sp)
   sw $t3 -248($sp)

#------------145  FACTOR_CON CHAR 65 save in reg[50]
   li $t0 65
   sw $t0 -252($sp)

#------------146  reg[51] = reg[49] JIAN reg[50]
   lw $t0 -248($sp)
   lw $t1 -252($sp)
   subu $t2 $t0 $t1
   sw $t2 -256($sp)

#------------147  IF reg[51] BEQ reg[0] THEN GOTO label_20
   lw $t0 -256($sp)
    beq $t0 $0 label_20

#------------148  FACTOR_CON INT 7 save in reg[52]
   li $t0 7
   sw $t0 -260($sp)

#------------149  FACTOR_CON INT 1 save in reg[53]
   li $t0 1
   sw $t0 -264($sp)

#------------150  ASSIGN_ARR INT var2[reg[52]] = reg[53]
   lw $t0 -260($sp)
   lw $t1 -264($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -24($t0)

#------------151  JUMP to label_21
   j label_21

#------------152  label_20    ----------------Label----------------
label_20:

#------------153  label_21    ----------------Label----------------
label_21:

#------------154  label_22    ----------------Label----------------
label_22:

#------------155  FACTOR_VAR INT i save in reg[54]
   lw $t3 0($sp)
   sw $t3 -268($sp)

#------------156  FACTOR_CON INT 0 save in reg[55]
   li $t0 0
   sw $t0 -272($sp)

#------------157  IF reg[54] BLEQ reg[55] THEN GOTO label_23
   lw $t0 -268($sp)
   lw $t1 -272($sp)
    ble $t0 $t1 label_23

#------------158  FACTOR_VAR INT i save in reg[56]
   lw $t3 0($sp)
   sw $t3 -276($sp)

#------------159  FACTOR_CON INT 1 save in reg[57]
   li $t0 1
   sw $t0 -280($sp)

#------------160  reg[58] = reg[56] JIAN reg[57]
   lw $t0 -276($sp)
   lw $t1 -280($sp)
   subu $t2 $t0 $t1
   sw $t2 -284($sp)

#------------161  ASSIGN INT i = reg[58]
   lw $t3 -284($sp)
   sw $t3 0($sp)

#------------162  JUMP to label_22
   j label_22

#------------163  label_23    ----------------Label----------------
label_23:

#------------164  FACTOR_CON INT 5 save in reg[59]
   li $t0 5
   sw $t0 -288($sp)

#------------165  ASSIGN INT i = reg[59]
   lw $t3 -288($sp)
   sw $t3 0($sp)

#------------166  label_24    ----------------Label----------------
label_24:

#------------167  FACTOR_VAR INT count save in reg[60]
   lw $t3 -20($sp)
   sw $t3 -292($sp)

#------------168  FACTOR_CON INT 1 save in reg[61]
   li $t0 1
   sw $t0 -296($sp)

#------------169  reg[62] = reg[60] JIA reg[61]
   lw $t0 -292($sp)
   lw $t1 -296($sp)
   addu $t2 $t0 $t1
   sw $t2 -300($sp)

#------------170  ASSIGN INT count = reg[62]
   lw $t3 -300($sp)
   sw $t3 -20($sp)

#------------171  FACTOR_VAR INT i save in reg[63]
   lw $t3 0($sp)
   sw $t3 -304($sp)

#------------172  FACTOR_CON INT 1 save in reg[64]
   li $t0 1
   sw $t0 -308($sp)

#------------173  reg[65] = reg[63] JIAN reg[64]
   lw $t0 -304($sp)
   lw $t1 -308($sp)
   subu $t2 $t0 $t1
   sw $t2 -312($sp)

#------------174  ASSIGN INT i = reg[65]
   lw $t3 -312($sp)
   sw $t3 0($sp)

#------------175  FACTOR_VAR INT i save in reg[66]
   lw $t3 0($sp)
   sw $t3 -316($sp)

#------------176  FACTOR_CON INT 0 save in reg[67]
   li $t0 0
   sw $t0 -320($sp)

#------------177  IF reg[66] BGTR reg[67] THEN GOTO label_24
   lw $t0 -316($sp)
   lw $t1 -320($sp)
    bgt $t0 $t1 label_24

#------------178  FACTOR_CON INT 0 save in reg[68]
   li $t0 0
   sw $t0 -324($sp)

#------------179  ASSIGN INT i = reg[68]
   lw $t3 -324($sp)
   sw $t3 0($sp)

#------------180  label_25    ----------------Label----------------
label_25:

#------------181  FACTOR_VAR INT count save in reg[69]
   lw $t3 -20($sp)
   sw $t3 -328($sp)

#------------182  FACTOR_CON INT 1 save in reg[70]
   li $t0 1
   sw $t0 -332($sp)

#------------183  reg[71] = reg[69] JIA reg[70]
   lw $t0 -328($sp)
   lw $t1 -332($sp)
   addu $t2 $t0 $t1
   sw $t2 -336($sp)

#------------184  ASSIGN INT count = reg[71]
   lw $t3 -336($sp)
   sw $t3 -20($sp)

#------------185  FACTOR_VAR INT i save in reg[72]
   lw $t3 0($sp)
   sw $t3 -340($sp)

#------------186  FACTOR_CON INT 1 save in reg[73]
   li $t0 1
   sw $t0 -344($sp)

#------------187  reg[74] = reg[72] JIA reg[73]
   lw $t0 -340($sp)
   lw $t1 -344($sp)
   addu $t2 $t0 $t1
   sw $t2 -348($sp)

#------------188  ASSIGN INT i = reg[74]
   lw $t3 -348($sp)
   sw $t3 0($sp)

#------------189  FACTOR_VAR INT i save in reg[75]
   lw $t3 0($sp)
   sw $t3 -352($sp)

#------------190  FACTOR_CON INT 5 save in reg[76]
   li $t0 5
   sw $t0 -356($sp)

#------------191  IF reg[75] BLSS reg[76] THEN GOTO label_25
   lw $t0 -352($sp)
   lw $t1 -356($sp)
    blt $t0 $t1 label_25

#------------192  FACTOR_VAR INT count save in reg[77]
   lw $t3 -20($sp)
   sw $t3 -360($sp)

#------------193  WRITE INT reg[77]
   li $v0 1
   lw $a0 -360($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------194  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------195  FUNC VOID print2(0)
   jr $ra

.func_print2:

#------------196  CONST INT i = 1

#------------197  VAR INT j

#------------198  WRITE print2 called
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------199  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------200  FUNC VOID main(0)
   jr $ra

.func_main:

#------------201  CONST INT a = 1

#------------202  CONST INT a0b1c2d3e4 = -233

#------------203  CONST INT f5g6h7i8j9 = 3072

#------------204  CONST CHAR klmn = 43

#------------205  CONST CHAR opq = 45

#------------206  CONST CHAR rst = 42

#------------207  CONST CHAR uvw = 47

#------------208  CONST CHAR x = 97

#------------209  CONST CHAR y_z = 48

#------------210  VAR INT abcd

#------------211  VAR CHAR cha1

#------------212  VAR CHAR cha2

#------------213  ARRAY CHAR efg[10]

#------------214  VAR INT hijk

#------------215  ARRAY INT lmn[5]

#------------216  VAR INT o

#------------217  ARRAY INT p[20]

#------------218  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -160($sp)

#------------219  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -164($sp)

#------------220  ASSIGN_ARR INT lmn[reg[1]] = reg[2]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -56($t0)

#------------221  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -168($sp)

#------------222  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -172($sp)

#------------223  ASSIGN_ARR INT lmn[reg[3]] = reg[4]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -56($t0)

#------------224  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -176($sp)

#------------225  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -180($sp)

#------------226  ASSIGN_ARR INT lmn[reg[5]] = reg[6]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -56($t0)

#------------227  READ INT abcd
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------228  READ INT hijk
   li $v0 5
   syscall
   sw $v0 -52($sp)

#------------229  READ INT o
   li $v0 5
   syscall
   sw $v0 -76($sp)

#------------230  READ CHAR cha1
   li $v0 12
   syscall
   sw $v0 -4($sp)

#------------231  READ CHAR cha2
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------232  READ_EXTERN INT b
   li $v0 5
   syscall
   sw $v0 .var_b

#------------233  FACTOR_CON INT 7 save in reg[7]
   li $t0 7
   sw $t0 -184($sp)














#------------247  FACTOR_CON INT 9 save in reg[21]
   li $t0 9
   sw $t0 -240($sp)

#------------248  ASSIGN_ARR_EXTERN INT add[reg[7]] = reg[21]
   lw $t0 -184($sp)
   lw $t1 -240($sp)
   sll $t0 $t0 2
   sw $t1 .var_add($t0)

#------------249  FACTOR_CON INT 8 save in reg[22]
   li $t0 8
   sw $t0 -244($sp)

#------------250  FACTOR_VAR_EXTERN INT b save in reg[23]
   lw $t3 .var_b
   sw $t3 -248($sp)

#------------251  ASSIGN_ARR_EXTERN INT add[reg[22]] = reg[23]
   lw $t0 -244($sp)
   lw $t1 -248($sp)
   sll $t0 $t0 2
   sw $t1 .var_add($t0)

#------------252  FACTOR_CON INT 9 save in reg[24]
   li $t0 9
   sw $t0 -252($sp)

#------------253  FACTOR_CON INT 7 save in reg[25]
   li $t0 7
   sw $t0 -256($sp)

#------------254  FACTOR_ARRAY_EXTERN INT add [reg[25]] save in reg[26]
   lw $t3 -256($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -260($sp)

#------------255  ASSIGN_ARR_EXTERN INT add[reg[24]] = reg[26]
   lw $t0 -252($sp)
   lw $t1 -260($sp)
   sll $t0 $t0 2
   sw $t1 .var_add($t0)

#------------256  FACTOR_CON INT 233 save in reg[27]
   li $t0 233
   sw $t0 -264($sp)

#------------257  ASSIGN_EXTERN INT b = reg[27]
   lw $t3 -264($sp)
   sw $t3 .var_b

#------------258  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -268($sp)

#------------259  FACTOR_ARRAY INT lmn [reg[28]] save in reg[29]
   lw $t3 -268($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -272($sp)

#------------260  PUSH INT parareg[2] from reg[29]
   sw $ra -276($sp)
   lw $t0 -272($sp)
   sw $t0 -280($sp)

#------------261  CALL INT getint(1)
   addiu $sp $sp -280
   jal .func_getint
   subiu $sp $sp -280
   lw $ra -276($sp)

#------------262  FACTOR_FUNC INT getint save in reg[30]
   sw $v0 -276($sp)

#------------263  FACTOR_CON INT 1 save in reg[31]
   li $t0 1
   sw $t0 -280($sp)

#------------264  FACTOR_ARRAY INT lmn [reg[31]] save in reg[32]
   lw $t3 -280($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -284($sp)

#------------265  PUSH INT parareg[3] from reg[32]
   sw $ra -288($sp)
   lw $t0 -284($sp)
   sw $t0 -292($sp)

#------------266  CALL INT getint(1)
   addiu $sp $sp -292
   jal .func_getint
   subiu $sp $sp -292
   lw $ra -288($sp)

#------------267  FACTOR_FUNC INT getint save in reg[33]
   sw $v0 -288($sp)

#------------268  reg[34] = reg[30] JIA reg[33]
   lw $t0 -276($sp)
   lw $t1 -288($sp)
   addu $t2 $t0 $t1
   sw $t2 -292($sp)

#------------269  FACTOR_CON INT 2 save in reg[35]
   li $t0 2
   sw $t0 -296($sp)

#------------270  FACTOR_ARRAY INT lmn [reg[35]] save in reg[36]
   lw $t3 -296($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -56($t3)
   sw $t3 -300($sp)

#------------271  PUSH INT parareg[4] from reg[36]
   sw $ra -304($sp)
   lw $t0 -300($sp)
   sw $t0 -308($sp)

#------------272  CALL INT getint(1)
   addiu $sp $sp -308
   jal .func_getint
   subiu $sp $sp -308
   lw $ra -304($sp)

#------------273  FACTOR_FUNC INT getint save in reg[37]
   sw $v0 -304($sp)

#------------274  reg[38] = reg[34] JIA reg[37]
   lw $t0 -292($sp)
   lw $t1 -304($sp)
   addu $t2 $t0 $t1
   sw $t2 -308($sp)

#------------275  WRITE result1 = 
   li $v0 4
   la $a0 .str_2
   syscall

#------------276  WRITE INT reg[38]
   li $v0 1
   lw $a0 -308($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------277  FACTOR_VAR INT abcd save in reg[39]
   lw $t3 0($sp)
   sw $t3 -312($sp)

#------------278  PUSH INT parareg[5] from reg[39]
   sw $ra -316($sp)
   lw $t0 -312($sp)
   sw $t0 -320($sp)

#------------279  CALL INT getint(1)
   addiu $sp $sp -320
   jal .func_getint
   subiu $sp $sp -320
   lw $ra -316($sp)

#------------280  FACTOR_FUNC INT getint save in reg[40]
   sw $v0 -316($sp)

#------------281  WRITE the 10th Fibonacci number is(the first number is 0) 
   li $v0 4
   la $a0 .str_3
   syscall

#------------282  WRITE INT reg[40]
   li $v0 1
   lw $a0 -316($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------283  CALL CHAR getcha(0)
   sw $ra -320($sp)
   addiu $sp $sp -324
   jal .func_getcha
   subiu $sp $sp -324
   lw $ra -320($sp)

#------------284  FACTOR_VAR INT hijk save in reg[41]
   lw $t3 -52($sp)
   sw $t3 -320($sp)

#------------285  FACTOR_VAR INT o save in reg[42]
   lw $t3 -76($sp)
   sw $t3 -324($sp)

#------------286  FACTOR_VAR CHAR cha1 save in reg[43]
   lw $t3 -4($sp)
   sw $t3 -328($sp)

#------------287  PUSH INT parareg[6] from reg[41]
   sw $ra -332($sp)
   lw $t0 -320($sp)
   sw $t0 -336($sp)

#------------288  PUSH INT parareg[7] from reg[42]
   lw $t0 -324($sp)
   sw $t0 -340($sp)

#------------289  PUSH INT parareg[8] from reg[43]
   lw $t0 -328($sp)
   sw $t0 -344($sp)

#------------290  CALL VOID print1(3)
   addiu $sp $sp -336
   jal .func_print1
   subiu $sp $sp -336
   lw $ra -332($sp)

#------------291  FACTOR_VAR INT o save in reg[44]
   lw $t3 -76($sp)
   sw $t3 -332($sp)

#------------292  FACTOR_VAR INT hijk save in reg[45]
   lw $t3 -52($sp)
   sw $t3 -336($sp)

#------------293  FACTOR_VAR CHAR cha1 save in reg[46]
   lw $t3 -4($sp)
   sw $t3 -340($sp)

#------------294  PUSH INT parareg[9] from reg[44]
   sw $ra -344($sp)
   lw $t0 -332($sp)
   sw $t0 -348($sp)

#------------295  PUSH INT parareg[10] from reg[45]
   lw $t0 -336($sp)
   sw $t0 -352($sp)

#------------296  PUSH INT parareg[11] from reg[46]
   lw $t0 -340($sp)
   sw $t0 -356($sp)

#------------297  CALL VOID print1(3)
   addiu $sp $sp -348
   jal .func_print1
   subiu $sp $sp -348
   lw $ra -344($sp)

#------------298  FACTOR_VAR INT hijk save in reg[47]
   lw $t3 -52($sp)
   sw $t3 -344($sp)

#------------299  FACTOR_VAR INT hijk save in reg[48]
   lw $t3 -52($sp)
   sw $t3 -348($sp)

#------------300  FACTOR_VAR CHAR cha2 save in reg[49]
   lw $t3 -8($sp)
   sw $t3 -352($sp)

#------------301  PUSH INT parareg[12] from reg[47]
   sw $ra -356($sp)
   lw $t0 -344($sp)
   sw $t0 -360($sp)

#------------302  PUSH INT parareg[13] from reg[48]
   lw $t0 -348($sp)
   sw $t0 -364($sp)

#------------303  PUSH INT parareg[14] from reg[49]
   lw $t0 -352($sp)
   sw $t0 -368($sp)

#------------304  CALL VOID print1(3)
   addiu $sp $sp -360
   jal .func_print1
   subiu $sp $sp -360
   lw $ra -356($sp)

#------------305  CALL VOID print2(0)
   sw $ra -356($sp)
   addiu $sp $sp -360
   jal .func_print2
   subiu $sp $sp -360
   lw $ra -356($sp)

#------------306  FACTOR_VAR_EXTERN INT b save in reg[50]
   lw $t3 .var_b
   sw $t3 -356($sp)

#------------307  WRITE INT reg[50]
   li $v0 1
   lw $a0 -356($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------308  FACTOR_CON INT 7 save in reg[51]
   li $t0 7
   sw $t0 -360($sp)

#------------309  FACTOR_ARRAY_EXTERN INT add [reg[51]] save in reg[52]
   lw $t3 -360($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -364($sp)

#------------310  FACTOR_CON INT 8 save in reg[53]
   li $t0 8
   sw $t0 -368($sp)

#------------311  FACTOR_ARRAY_EXTERN INT add [reg[53]] save in reg[54]
   lw $t3 -368($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -372($sp)

#------------312  reg[55] = reg[52] JIA reg[54]
   lw $t0 -364($sp)
   lw $t1 -372($sp)
   addu $t2 $t0 $t1
   sw $t2 -376($sp)

#------------313  FACTOR_CON INT 9 save in reg[56]
   li $t0 9
   sw $t0 -380($sp)

#------------314  FACTOR_ARRAY_EXTERN INT add [reg[56]] save in reg[57]
   lw $t3 -380($sp)
   sll $t3 $t3 2
   lw $t3 .var_add($t3)
   sw $t3 -384($sp)

#------------315  reg[58] = reg[55] JIA reg[57]
   lw $t0 -376($sp)
   lw $t1 -384($sp)
   addu $t2 $t0 $t1
   sw $t2 -388($sp)

#------------316  WRITE INT reg[58]
   li $v0 1
   lw $a0 -388($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------317  FACTOR_CON CHAR 99 save in reg[59]
   li $t0 99
   sw $t0 -392($sp)

#------------318  WRITE CHAR reg[59]
   li $v0 11
   lw $a0 -392($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------319  FACTOR_VAR CHAR cha1 save in reg[60]
   lw $t3 -4($sp)
   sw $t3 -396($sp)

#------------320  WRITE CHAR reg[60]
   li $v0 11
   lw $a0 -396($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------321  FACTOR_VAR CHAR cha1 save in reg[61]
   lw $t3 -4($sp)
   sw $t3 -400($sp)

#------------322  FACTOR_VAR CHAR cha2 save in reg[62]
   lw $t3 -8($sp)
   sw $t3 -404($sp)

#------------323  reg[63] = reg[61] JIA reg[62]
   lw $t0 -400($sp)
   lw $t1 -404($sp)
   addu $t2 $t0 $t1
   sw $t2 -408($sp)

#------------324  WRITE INT reg[63]
   li $v0 1
   lw $a0 -408($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------325  FACTOR_CON INT 0 save in reg[64]
   li $t0 0
   sw $t0 -412($sp)

#------------326  FACTOR_VAR CHAR cha1 save in reg[65]
   lw $t3 -4($sp)
   sw $t3 -416($sp)

#------------327  ASSIGN_ARR CHAR efg[reg[64]] = reg[65]
   lw $t0 -412($sp)
   lw $t1 -416($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -12($t0)

#------------328  FACTOR_CON INT 0 save in reg[66]
   li $t0 0
   sw $t0 -420($sp)

#------------329  FACTOR_ARRAY CHAR efg [reg[66]] save in reg[67]
   lw $t3 -420($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -12($t3)
   sw $t3 -424($sp)

#------------330  WRITE CHAR reg[67]
   li $v0 11
   lw $a0 -424($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------331  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -156($sp)
   jr $ra

   jr $ra

end:
