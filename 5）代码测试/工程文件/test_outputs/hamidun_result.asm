.data
   .var_n: .word 0
   .var_m: .word 0
   .var_ans: .word 0
   .var_vis: .space 40
   .var_edge: .space 400
   .str_0: .asciiz "1"
   .str_1: .asciiz "0"
.text
   jal .func_main
   j end
#------------5  FUNC INT getid(2)
.func_getid:

#------------6  PARA INT a

#------------7  PARA INT b

#------------8  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------9  FACTOR_VAR_EXTERN INT n save in reg[2]
   lw $t3 .var_n
   sw $t3 -12($sp)

#------------10  reg[2] = reg[1] CHENG reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -12($sp)

#------------11  ASSIGN INT a = reg[2]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------12  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------13  FACTOR_VAR INT b save in reg[4]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------14  reg[4] = reg[3] JIA reg[4]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------15  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------16  FUNC VOID dfs(2)
   jr $ra

.func_dfs:

#------------17  PARA INT u

#------------18  PARA INT step

#------------19  VAR INT i

#------------20  FACTOR_VAR INT step save in reg[1]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------21  FACTOR_VAR_EXTERN INT n save in reg[2]
   lw $t3 .var_n
   sw $t3 -16($sp)

#------------22  IF reg[1] BNE reg[2] THEN GOTO label_2
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    bne $t0 $t1 label_2

#------------23  FACTOR_VAR INT u save in reg[3]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------24  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -24($sp)

#------------25  PUSH INT parareg[0] from reg[3]
   sw $ra -28($sp)
   lw $t0 -20($sp)
   sw $t0 -32($sp)

#------------26  PUSH INT parareg[1] from reg[4]
   lw $t0 -24($sp)
   sw $t0 -36($sp)

#------------27  CALL INT getid(2)
   addi $sp $sp -32
   jal .func_getid
   subi $sp $sp -32
   lw $ra -28($sp)

#------------28  FACTOR_FUNC INT getid save in reg[5]
   sw $v0 -28($sp)

#------------29  FACTOR_ARRAY_EXTERN INT edge [reg[5]] save in reg[6]
   lw $t3 -28($sp)
   sll $t3 $t3 2
   lw $t3 .var_edge($t3)
   sw $t3 -32($sp)

#------------30  IF reg[6] BEQ reg[0] THEN GOTO label_0
   lw $t0 -32($sp)
    beq $t0 $0 label_0

#------------31  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -36($sp)

#------------32  ASSIGN_EXTERN INT ans = reg[7]
   lw $t3 -36($sp)
   sw $t3 .var_ans

#------------33  JUMP to label_1
   j label_1

#------------34  label_0    ----------------Label----------------
label_0:

#------------35  label_1    ----------------Label----------------
label_1:

#------------36  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------37  JUMP to label_3
   j label_3

#------------38  label_2    ----------------Label----------------
label_2:

#------------39  label_3    ----------------Label----------------
label_3:

#------------40  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -40($sp)

#------------41  ASSIGN INT i = reg[8]
   lw $t3 -40($sp)
   sw $t3 -8($sp)

#------------42  label_4    ----------------Label----------------
label_4:

#------------43  FACTOR_VAR INT i save in reg[9]
   lw $t3 -8($sp)
   sw $t3 -44($sp)

#------------44  FACTOR_VAR_EXTERN INT n save in reg[10]
   lw $t3 .var_n
   sw $t3 -48($sp)

#------------45  IF reg[9] BEQ reg[10] THEN GOTO label_11
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    beq $t0 $t1 label_11

#------------46  FACTOR_VAR INT i save in reg[11]
   lw $t3 -8($sp)
   sw $t3 -52($sp)

#------------47  FACTOR_ARRAY_EXTERN INT vis [reg[11]] save in reg[12]
   lw $t3 -52($sp)
   sll $t3 $t3 2
   lw $t3 .var_vis($t3)
   sw $t3 -56($sp)

#------------48  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -60($sp)

#------------49  IF reg[12] BNE reg[13] THEN GOTO label_9
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    bne $t0 $t1 label_9

#------------50  FACTOR_VAR INT u save in reg[14]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------51  FACTOR_VAR INT i save in reg[15]
   lw $t3 -8($sp)
   sw $t3 -68($sp)

#------------52  PUSH INT parareg[2] from reg[14]
   sw $ra -72($sp)
   lw $t0 -64($sp)
   sw $t0 -76($sp)

#------------53  PUSH INT parareg[3] from reg[15]
   lw $t0 -68($sp)
   sw $t0 -80($sp)

#------------54  CALL INT getid(2)
   addi $sp $sp -76
   jal .func_getid
   subi $sp $sp -76
   lw $ra -72($sp)

#------------55  FACTOR_FUNC INT getid save in reg[16]
   sw $v0 -72($sp)

#------------56  FACTOR_ARRAY_EXTERN INT edge [reg[16]] save in reg[17]
   lw $t3 -72($sp)
   sll $t3 $t3 2
   lw $t3 .var_edge($t3)
   sw $t3 -76($sp)

#------------57  IF reg[17] BEQ reg[0] THEN GOTO label_7
   lw $t0 -76($sp)
    beq $t0 $0 label_7

#------------58  FACTOR_VAR INT i save in reg[18]
   lw $t3 -8($sp)
   sw $t3 -80($sp)

#------------59  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -84($sp)

#------------60  ASSIGN_ARR_EXTERN INT vis[reg[18]] = reg[19]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   sll $t0 $t0 2
   sw $t1 .var_vis($t0)

#------------61  FACTOR_VAR INT i save in reg[20]
   lw $t3 -8($sp)
   sw $t3 -88($sp)

#------------62  FACTOR_VAR INT step save in reg[21]
   lw $t3 -4($sp)
   sw $t3 -92($sp)

#------------63  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -96($sp)

#------------64  reg[22] = reg[21] JIA reg[22]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   add $t2 $t0 $t1
   sw $t2 -96($sp)

#------------65  PUSH INT parareg[4] from reg[20]
   sw $ra -100($sp)
   lw $t0 -88($sp)
   sw $t0 -104($sp)

#------------66  PUSH INT parareg[5] from reg[22]
   lw $t0 -96($sp)
   sw $t0 -108($sp)

#------------67  CALL VOID dfs(2)
   addi $sp $sp -104
   jal .func_dfs
   subi $sp $sp -104
   lw $ra -100($sp)

#------------68  FACTOR_VAR_EXTERN INT ans save in reg[23]
   lw $t3 .var_ans
   sw $t3 -100($sp)

#------------69  IF reg[23] BEQ reg[0] THEN GOTO label_5
   lw $t0 -100($sp)
    beq $t0 $0 label_5

#------------70  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------71  JUMP to label_6
   j label_6

#------------72  label_5    ----------------Label----------------
label_5:

#------------73  label_6    ----------------Label----------------
label_6:

#------------74  FACTOR_VAR INT i save in reg[24]
   lw $t3 -8($sp)
   sw $t3 -104($sp)

#------------75  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -108($sp)

#------------76  ASSIGN_ARR_EXTERN INT vis[reg[24]] = reg[25]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   sll $t0 $t0 2
   sw $t1 .var_vis($t0)

#------------77  JUMP to label_8
   j label_8

#------------78  label_7    ----------------Label----------------
label_7:

#------------79  label_8    ----------------Label----------------
label_8:

#------------80  JUMP to label_10
   j label_10

#------------81  label_9    ----------------Label----------------
label_9:

#------------82  label_10    ----------------Label----------------
label_10:

#------------83  FACTOR_VAR INT i save in reg[26]
   lw $t3 -8($sp)
   sw $t3 -112($sp)

#------------84  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -116($sp)

#------------85  reg[27] = reg[26] JIA reg[27]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   add $t2 $t0 $t1
   sw $t2 -116($sp)

#------------86  ASSIGN INT i = reg[27]
   lw $t3 -116($sp)
   sw $t3 -8($sp)

#------------87  JUMP to label_4
   j label_4

#------------88  label_11    ----------------Label----------------
label_11:

#------------89  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------90  FUNC VOID main(0)
   jr $ra

.func_main:

#------------91  VAR INT i

#------------92  VAR INT a

#------------93  VAR INT b

#------------94  VAR INT c

#------------95  READ_EXTERN INT n
   li $v0 5
   syscall
   sw $v0 .var_n

#------------96  READ_EXTERN INT m
   li $v0 5
   syscall
   sw $v0 .var_m

#------------97  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -124($sp)

#------------98  ASSIGN INT i = reg[28]
   lw $t3 -124($sp)
   sw $t3 0($sp)

#------------99  label_12    ----------------Label----------------
label_12:

#------------100  FACTOR_VAR INT i save in reg[29]
   lw $t3 0($sp)
   sw $t3 -128($sp)

#------------101  FACTOR_VAR_EXTERN INT m save in reg[30]
   lw $t3 .var_m
   sw $t3 -132($sp)

#------------102  IF reg[29] BEQ reg[30] THEN GOTO label_13
   lw $t0 -128($sp)
   lw $t1 -132($sp)
    beq $t0 $t1 label_13

#------------103  READ INT a
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------104  READ INT b
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------105  FACTOR_VAR INT a save in reg[31]
   lw $t3 -4($sp)
   sw $t3 -136($sp)

#------------106  FACTOR_CON INT 1 save in reg[32]
   li $t0 1
   sw $t0 -140($sp)

#------------107  reg[32] = reg[31] JIAN reg[32]
   lw $t0 -136($sp)
   lw $t1 -140($sp)
   sub $t2 $t0 $t1
   sw $t2 -140($sp)

#------------108  ASSIGN INT a = reg[32]
   lw $t3 -140($sp)
   sw $t3 -4($sp)

#------------109  FACTOR_VAR INT b save in reg[33]
   lw $t3 -8($sp)
   sw $t3 -144($sp)

#------------110  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -148($sp)

#------------111  reg[34] = reg[33] JIAN reg[34]
   lw $t0 -144($sp)
   lw $t1 -148($sp)
   sub $t2 $t0 $t1
   sw $t2 -148($sp)

#------------112  ASSIGN INT b = reg[34]
   lw $t3 -148($sp)
   sw $t3 -8($sp)

#------------113  FACTOR_VAR INT a save in reg[35]
   lw $t3 -4($sp)
   sw $t3 -152($sp)

#------------114  FACTOR_VAR INT b save in reg[36]
   lw $t3 -8($sp)
   sw $t3 -156($sp)

#------------115  PUSH INT parareg[6] from reg[35]
   sw $ra -160($sp)
   lw $t0 -152($sp)
   sw $t0 -164($sp)

#------------116  PUSH INT parareg[7] from reg[36]
   lw $t0 -156($sp)
   sw $t0 -168($sp)

#------------117  CALL INT getid(2)
   addi $sp $sp -164
   jal .func_getid
   subi $sp $sp -164
   lw $ra -160($sp)

#------------118  FACTOR_FUNC INT getid save in reg[37]
   sw $v0 -160($sp)

#------------119  FACTOR_ARRAY_EXTERN INT edge [reg[37]] save in reg[38]
   lw $t3 -160($sp)
   sll $t3 $t3 2
   lw $t3 .var_edge($t3)
   sw $t3 -164($sp)

#------------120  ASSIGN INT c = reg[38]
   lw $t3 -164($sp)
   sw $t3 -12($sp)

#------------121  FACTOR_VAR INT a save in reg[39]
   lw $t3 -4($sp)
   sw $t3 -168($sp)

#------------122  FACTOR_VAR INT b save in reg[40]
   lw $t3 -8($sp)
   sw $t3 -172($sp)

#------------123  PUSH INT parareg[8] from reg[39]
   sw $ra -176($sp)
   lw $t0 -168($sp)
   sw $t0 -180($sp)

#------------124  PUSH INT parareg[9] from reg[40]
   lw $t0 -172($sp)
   sw $t0 -184($sp)

#------------125  CALL INT getid(2)
   addi $sp $sp -180
   jal .func_getid
   subi $sp $sp -180
   lw $ra -176($sp)

#------------126  FACTOR_FUNC INT getid save in reg[41]
   sw $v0 -176($sp)

#------------127  FACTOR_VAR INT c save in reg[42]
   lw $t3 -12($sp)
   sw $t3 -180($sp)

#------------128  FACTOR_CON INT 1 save in reg[43]
   li $t0 1
   sw $t0 -184($sp)

#------------129  reg[43] = reg[42] JIA reg[43]
   lw $t0 -180($sp)
   lw $t1 -184($sp)
   add $t2 $t0 $t1
   sw $t2 -184($sp)

#------------130  ASSIGN_ARR_EXTERN INT edge[reg[41]] = reg[43]
   lw $t0 -176($sp)
   lw $t1 -184($sp)
   sll $t0 $t0 2
   sw $t1 .var_edge($t0)

#------------131  FACTOR_VAR INT b save in reg[44]
   lw $t3 -8($sp)
   sw $t3 -188($sp)

#------------132  FACTOR_VAR INT a save in reg[45]
   lw $t3 -4($sp)
   sw $t3 -192($sp)

#------------133  PUSH INT parareg[10] from reg[44]
   sw $ra -196($sp)
   lw $t0 -188($sp)
   sw $t0 -200($sp)

#------------134  PUSH INT parareg[11] from reg[45]
   lw $t0 -192($sp)
   sw $t0 -204($sp)

#------------135  CALL INT getid(2)
   addi $sp $sp -200
   jal .func_getid
   subi $sp $sp -200
   lw $ra -196($sp)

#------------136  FACTOR_FUNC INT getid save in reg[46]
   sw $v0 -196($sp)

#------------137  FACTOR_VAR INT c save in reg[47]
   lw $t3 -12($sp)
   sw $t3 -200($sp)

#------------138  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -204($sp)

#------------139  reg[48] = reg[47] JIA reg[48]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   add $t2 $t0 $t1
   sw $t2 -204($sp)

#------------140  ASSIGN_ARR_EXTERN INT edge[reg[46]] = reg[48]
   lw $t0 -196($sp)
   lw $t1 -204($sp)
   sll $t0 $t0 2
   sw $t1 .var_edge($t0)

#------------141  FACTOR_VAR INT i save in reg[49]
   lw $t3 0($sp)
   sw $t3 -208($sp)

#------------142  FACTOR_CON INT 1 save in reg[50]
   li $t0 1
   sw $t0 -212($sp)

#------------143  reg[50] = reg[49] JIA reg[50]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   add $t2 $t0 $t1
   sw $t2 -212($sp)

#------------144  ASSIGN INT i = reg[50]
   lw $t3 -212($sp)
   sw $t3 0($sp)

#------------145  JUMP to label_12
   j label_12

#------------146  label_13    ----------------Label----------------
label_13:

#------------147  FACTOR_VAR_EXTERN INT n save in reg[51]
   lw $t3 .var_n
   sw $t3 -216($sp)

#------------148  FACTOR_CON INT 1 save in reg[52]
   li $t0 1
   sw $t0 -220($sp)

#------------149  IF reg[51] BNE reg[52] THEN GOTO label_14
   lw $t0 -216($sp)
   lw $t1 -220($sp)
    bne $t0 $t1 label_14

#------------150  WRITE 1
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------151  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------152  JUMP to label_15
   j label_15

#------------153  label_14    ----------------Label----------------
label_14:

#------------154  label_15    ----------------Label----------------
label_15:

#------------155  FACTOR_VAR_EXTERN INT n save in reg[53]
   lw $t3 .var_n
   sw $t3 -224($sp)

#------------156  FACTOR_CON INT 2 save in reg[54]
   li $t0 2
   sw $t0 -228($sp)

#------------157  IF reg[53] BNE reg[54] THEN GOTO label_18
   lw $t0 -224($sp)
   lw $t1 -228($sp)
    bne $t0 $t1 label_18

#------------158  FACTOR_CON INT 0 save in reg[55]
   li $t0 0
   sw $t0 -232($sp)

#------------159  FACTOR_CON INT 1 save in reg[56]
   li $t0 1
   sw $t0 -236($sp)

#------------160  PUSH INT parareg[12] from reg[55]
   sw $ra -240($sp)
   lw $t0 -232($sp)
   sw $t0 -244($sp)

#------------161  PUSH INT parareg[13] from reg[56]
   lw $t0 -236($sp)
   sw $t0 -248($sp)

#------------162  CALL INT getid(2)
   addi $sp $sp -244
   jal .func_getid
   subi $sp $sp -244
   lw $ra -240($sp)

#------------163  FACTOR_FUNC INT getid save in reg[57]
   sw $v0 -240($sp)

#------------164  FACTOR_ARRAY_EXTERN INT edge [reg[57]] save in reg[58]
   lw $t3 -240($sp)
   sll $t3 $t3 2
   lw $t3 .var_edge($t3)
   sw $t3 -244($sp)

#------------165  FACTOR_CON INT 2 save in reg[59]
   li $t0 2
   sw $t0 -248($sp)

#------------166  IF reg[58] BLSS reg[59] THEN GOTO label_16
   lw $t0 -244($sp)
   lw $t1 -248($sp)
    blt $t0 $t1 label_16

#------------167  WRITE 1
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------168  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------169  JUMP to label_17
   j label_17

#------------170  label_16    ----------------Label----------------
label_16:

#------------171  label_17    ----------------Label----------------
label_17:

#------------172  WRITE 0
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------173  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------174  JUMP to label_19
   j label_19

#------------175  label_18    ----------------Label----------------
label_18:

#------------176  label_19    ----------------Label----------------
label_19:

#------------177  FACTOR_CON INT 0 save in reg[60]
   li $t0 0
   sw $t0 -252($sp)

#------------178  FACTOR_CON INT 1 save in reg[61]
   li $t0 1
   sw $t0 -256($sp)

#------------179  ASSIGN_ARR_EXTERN INT vis[reg[60]] = reg[61]
   lw $t0 -252($sp)
   lw $t1 -256($sp)
   sll $t0 $t0 2
   sw $t1 .var_vis($t0)

#------------180  FACTOR_CON INT 0 save in reg[62]
   li $t0 0
   sw $t0 -260($sp)

#------------181  FACTOR_CON INT 1 save in reg[63]
   li $t0 1
   sw $t0 -264($sp)

#------------182  PUSH INT parareg[14] from reg[62]
   sw $ra -268($sp)
   lw $t0 -260($sp)
   sw $t0 -272($sp)

#------------183  PUSH INT parareg[15] from reg[63]
   lw $t0 -264($sp)
   sw $t0 -276($sp)

#------------184  CALL VOID dfs(2)
   addi $sp $sp -272
   jal .func_dfs
   subi $sp $sp -272
   lw $ra -268($sp)

#------------185  FACTOR_VAR_EXTERN INT ans save in reg[64]
   lw $t3 .var_ans
   sw $t3 -268($sp)

#------------186  WRITE INT reg[64]
   li $v0 1
   lw $a0 -268($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

   jr $ra

end:
