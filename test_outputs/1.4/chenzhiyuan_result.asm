.data
   .var_stack: .space 48
   .var_used: .space 48
   .var_n: .word 0
   .var_m: .word 0
   .var_sum: .word 0
   .str_0: .asciiz " "
   .str_1: .asciiz "___________"
   .str_2: .asciiz "test for success"
   .str_3: .asciiz "You can choose m numbers permutations from n numbers ? "
   .str_4: .asciiz "error input: 0 < m <= n <= 10"
.text
   jal .func_main
   j end
#------------8  FUNC VOID permutations(1)
.func_permutations:

#------------9  PARA INT a

#------------10  VAR INT i

#------------11  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -8($sp)

#------------12  ASSIGN INT i = reg[1]
   lw $t3 -8($sp)
   sw $t3 -4($sp)

#------------13  FACTOR_VAR INT a save in reg[2]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------14  FACTOR_VAR_EXTERN INT m save in reg[3]
   lw $t3 .var_m
   sw $t3 -16($sp)

#------------15  IF reg[2] BNE reg[3] THEN GOTO label_2
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    bne $t0 $t1 label_2

#------------16  label_0    ----------------Label----------------
label_0:

#------------17  FACTOR_VAR INT i save in reg[4]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------18  FACTOR_VAR_EXTERN INT m save in reg[5]
   lw $t3 .var_m
   sw $t3 -24($sp)

#------------19  IF reg[4] BGEQ reg[5] THEN GOTO label_1
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bge $t0 $t1 label_1

#------------20  FACTOR_VAR INT i save in reg[6]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------21  FACTOR_ARRAY_EXTERN INT stack [reg[6]] save in reg[7]
   lw $t3 -28($sp)
   sll $t3 $t3 2
   lw $t3 .var_stack($t3)
   sw $t3 -32($sp)

#------------22  WRITE  
   li $v0 4
   la $a0 .str_0
   syscall

#------------23  WRITE INT reg[7]
   li $v0 1
   lw $a0 -32($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------24  FACTOR_VAR INT i save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -36($sp)

#------------25  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -40($sp)

#------------26  reg[10] = reg[8] JIA reg[9]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------27  ASSIGN INT i = reg[10]
   lw $t3 -44($sp)
   sw $t3 -4($sp)

#------------28  JUMP to label_0
   j label_0

#------------29  label_1    ----------------Label----------------
label_1:

#------------30  WRITE ___________
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------31  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------32  JUMP to label_3
   j label_3

#------------33  label_2    ----------------Label----------------
label_2:

#------------34  label_3    ----------------Label----------------
label_3:

#------------35  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -48($sp)

#------------36  ASSIGN INT i = reg[11]
   lw $t3 -48($sp)
   sw $t3 -4($sp)

#------------37  label_4    ----------------Label----------------
label_4:

#------------38  FACTOR_VAR INT i save in reg[12]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------39  FACTOR_ARRAY_EXTERN INT used [reg[12]] save in reg[13]
   lw $t3 -52($sp)
   sll $t3 $t3 2
   lw $t3 .var_used($t3)
   sw $t3 -56($sp)

#------------40  FACTOR_CON INT 0 save in reg[14]
   li $t0 0
   sw $t0 -60($sp)

#------------41  IF reg[13] BEQ reg[14] THEN GOTO label_5
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    beq $t0 $t1 label_5

#------------42  JUMP to label_6
   j label_6

#------------43  label_5    ----------------Label----------------
label_5:

#------------44  FACTOR_VAR INT a save in reg[15]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------45  FACTOR_VAR INT i save in reg[16]
   lw $t3 -4($sp)
   sw $t3 -68($sp)

#------------46  ASSIGN_ARR_EXTERN INT stack[reg[15]] = reg[16]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   sll $t0 $t0 2
   sw $t1 .var_stack($t0)

#------------47  FACTOR_VAR INT i save in reg[17]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------48  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -76($sp)

#------------49  ASSIGN_ARR_EXTERN INT used[reg[17]] = reg[18]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   sll $t0 $t0 2
   sw $t1 .var_used($t0)

#------------50  FACTOR_VAR INT a save in reg[19]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------51  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -84($sp)

#------------52  reg[21] = reg[19] JIA reg[20]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   add $t2 $t0 $t1
   sw $t2 -88($sp)

#------------53  PUSH INT parareg[0] from reg[21]
   sw $ra -92($sp)
   lw $t0 -88($sp)
   sw $t0 -96($sp)

#------------54  CALL VOID permutations(1)
   addi $sp $sp -96
   jal .func_permutations
   subi $sp $sp -96
   lw $ra -92($sp)

#------------55  FACTOR_VAR INT i save in reg[22]
   lw $t3 -4($sp)
   sw $t3 -92($sp)

#------------56  FACTOR_CON INT 0 save in reg[23]
   li $t0 0
   sw $t0 -96($sp)

#------------57  ASSIGN_ARR_EXTERN INT used[reg[22]] = reg[23]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   sll $t0 $t0 2
   sw $t1 .var_used($t0)

#------------58  label_6    ----------------Label----------------
label_6:

#------------59  FACTOR_VAR INT i save in reg[24]
   lw $t3 -4($sp)
   sw $t3 -100($sp)

#------------60  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -104($sp)

#------------61  reg[26] = reg[24] JIA reg[25]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   add $t2 $t0 $t1
   sw $t2 -108($sp)

#------------62  ASSIGN INT i = reg[26]
   lw $t3 -108($sp)
   sw $t3 -4($sp)

#------------63  FACTOR_VAR INT i save in reg[27]
   lw $t3 -4($sp)
   sw $t3 -112($sp)

#------------64  FACTOR_VAR_EXTERN INT n save in reg[28]
   lw $t3 .var_n
   sw $t3 -116($sp)

#------------65  IF reg[27] BLEQ reg[28] THEN GOTO label_4
   lw $t0 -112($sp)
   lw $t1 -116($sp)
    ble $t0 $t1 label_4

#------------66  FUNC INT get_max_num_1(0)
   jr $ra

.func_get_max_num_1:

#------------67  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 0($sp)

#------------68  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------69  FUNC INT get_max_num_2(0)
   jr $ra

.func_get_max_num_2:

#------------70  VAR INT max_num

#------------71  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 -4($sp)

#------------72  ASSIGN INT max_num = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------73  FACTOR_VAR INT max_num save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------74  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------75  FUNC INT get_2(0)
   jr $ra

.func_get_2:

#------------76  CONST INT m = 2

#------------77  FACTOR_CON INT 2 save in reg[1]
   li $t0 2
   sw $t0 0($sp)

#------------78  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------79  FUNC INT compute(3)
   jr $ra

.func_compute:

#------------80  PARA INT a

#------------81  PARA INT b

#------------82  PARA CHAR op

#------------83  FACTOR_VAR CHAR op save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------84  FACTOR_EXPR reg[1] save in reg[2]
   lw $t0 -12($sp)
   sw $t0 -16($sp)


#------------86  FACTOR_CON INT 43 save in reg[4]
   li $t0 43
   sw $t0 -24($sp)

#------------87  IF reg[2] BNE reg[4] THEN GOTO label_7
   lw $t0 -16($sp)
   lw $t1 -24($sp)
    bne $t0 $t1 label_7

#------------88  FACTOR_VAR INT a save in reg[5]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------89  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -32($sp)

#------------90  FACTOR_VAR INT b save in reg[7]
   lw $t3 -4($sp)
   sw $t3 -36($sp)

#------------91  reg[8] = reg[6] CHENG reg[7]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -40($sp)

#------------92  reg[9] = reg[5] JIA reg[8]
   lw $t0 -28($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------93  FACTOR_EXPR reg[9] save in reg[10]
   lw $t0 -44($sp)
   sw $t0 -48($sp)

#------------94  FACTOR_VAR INT b save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------95  reg[12] = reg[10] JIAN reg[11]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------96  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -56($sp)
   jr $ra

#------------97  JUMP to label_14
   j label_14

#------------98  label_7    ----------------Label----------------
label_7:

#------------99  FACTOR_VAR CHAR op save in reg[13]
   lw $t3 -8($sp)
   sw $t3 -60($sp)

#------------100  FACTOR_EXPR reg[13] save in reg[14]
   lw $t0 -60($sp)
   sw $t0 -64($sp)


#------------102  FACTOR_CON INT 45 save in reg[16]
   li $t0 45
   sw $t0 -72($sp)

#------------103  IF reg[14] BNE reg[16] THEN GOTO label_8
   lw $t0 -64($sp)
   lw $t1 -72($sp)
    bne $t0 $t1 label_8

#------------104  FACTOR_VAR INT a save in reg[17]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------105  FACTOR_VAR INT b save in reg[18]
   lw $t3 -4($sp)
   sw $t3 -80($sp)

#------------106  FACTOR_VAR INT b save in reg[19]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------107  reg[20] = reg[18] JIA reg[19]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   add $t2 $t0 $t1
   sw $t2 -88($sp)

#------------108  FACTOR_EXPR reg[20] save in reg[21]
   lw $t0 -88($sp)
   sw $t0 -92($sp)

#------------109  FACTOR_CON INT 2 save in reg[22]
   li $t0 2
   sw $t0 -96($sp)

#------------110  reg[23] = reg[21] CHU reg[22]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -100($sp)

#------------111  reg[24] = reg[17] JIAN reg[23]
   lw $t0 -76($sp)
   lw $t1 -100($sp)
   sub $t2 $t0 $t1
   sw $t2 -104($sp)

#------------112  RETURN reg[24] TO $V0 AND THEN GOTO 0
   lw $v0 -104($sp)
   jr $ra

#------------113  JUMP to label_13
   j label_13

#------------114  label_8    ----------------Label----------------
label_8:

#------------115  FACTOR_VAR CHAR op save in reg[25]
   lw $t3 -8($sp)
   sw $t3 -108($sp)

#------------116  FACTOR_EXPR reg[25] save in reg[26]
   lw $t0 -108($sp)
   sw $t0 -112($sp)


#------------118  FACTOR_CON INT 42 save in reg[28]
   li $t0 42
   sw $t0 -120($sp)

#------------119  IF reg[26] BNE reg[28] THEN GOTO label_9
   lw $t0 -112($sp)
   lw $t1 -120($sp)
    bne $t0 $t1 label_9

#------------120  FACTOR_VAR INT a save in reg[29]
   lw $t3 0($sp)
   sw $t3 -124($sp)

#------------121  FACTOR_VAR INT b save in reg[30]
   lw $t3 -4($sp)
   sw $t3 -128($sp)

#------------122  reg[31] = reg[29] CHENG reg[30]
   lw $t0 -124($sp)
   lw $t1 -128($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -132($sp)

#------------123  RETURN reg[31] TO $V0 AND THEN GOTO 0
   lw $v0 -132($sp)
   jr $ra

#------------124  JUMP to label_12
   j label_12

#------------125  label_9    ----------------Label----------------
label_9:

#------------126  FACTOR_VAR INT b save in reg[32]
   lw $t3 -4($sp)
   sw $t3 -136($sp)

#------------127  IF reg[32] BEQ reg[0] THEN GOTO label_10
   lw $t0 -136($sp)
    beq $t0 $0 label_10

#------------128  FACTOR_VAR INT a save in reg[33]
   lw $t3 0($sp)
   sw $t3 -140($sp)

#------------129  FACTOR_VAR INT b save in reg[34]
   lw $t3 -4($sp)
   sw $t3 -144($sp)

#------------130  reg[35] = reg[33] CHU reg[34]
   lw $t0 -140($sp)
   lw $t1 -144($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -148($sp)

#------------131  RETURN reg[35] TO $V0 AND THEN GOTO 0
   lw $v0 -148($sp)
   jr $ra

#------------132  JUMP to label_11
   j label_11

#------------133  label_10    ----------------Label----------------
label_10:

















#------------150  FACTOR_CON INT 0 save in reg[52]
   li $t0 0
   sw $t0 -216($sp)

#------------151  RETURN reg[52] TO $V0 AND THEN GOTO 0
   lw $v0 -216($sp)
   jr $ra

#------------152  label_11    ----------------Label----------------
label_11:

#------------153  label_12    ----------------Label----------------
label_12:

#------------154  label_13    ----------------Label----------------
label_13:

#------------155  label_14    ----------------Label----------------
label_14:

#------------156  FUNC CHAR get_permutations_sy(0)
   jr $ra

.func_get_permutations_sy:

#------------157  CONST CHAR permutations_sy = 84

#------------158  FACTOR_CON CHAR 84 save in reg[1]
   li $t0 84
   sw $t0 0($sp)

#------------159  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------160  FUNC CHAR judge(2)
   jr $ra

.func_judge:

#------------161  PARA INT n

#------------162  PARA INT m

#------------163  CONST CHAR divide = 42

#------------164  FACTOR_CON CHAR 42 save in reg[1]
   li $t0 42
   sw $t0 -8($sp)

#------------165  WRITE CHAR reg[1]
   li $v0 11
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------166  FACTOR_VAR INT n save in reg[2]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------167  CALL INT get_max_num_1(0)
   sw $ra -16($sp)
   addi $sp $sp -20
   jal .func_get_max_num_1
   subi $sp $sp -20
   lw $ra -16($sp)

#------------168  FACTOR_FUNC INT get_max_num_1 save in reg[3]
   sw $v0 -16($sp)

#------------169  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -20($sp)

#------------170  reg[5] = reg[3] JIA reg[4]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------171  IF reg[2] BLSS reg[5] THEN GOTO label_15
   lw $t0 -12($sp)
   lw $t1 -24($sp)
    blt $t0 $t1 label_15

#------------172  FACTOR_CON CHAR 70 save in reg[6]
   li $t0 70
   sw $t0 -28($sp)

#------------173  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------174  JUMP to label_16
   j label_16

#------------175  label_15    ----------------Label----------------
label_15:

#------------176  label_16    ----------------Label----------------
label_16:

#------------177  FACTOR_VAR INT m save in reg[7]
   lw $t3 -4($sp)
   sw $t3 -32($sp)

#------------178  FACTOR_VAR INT n save in reg[8]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------179  IF reg[7] BLEQ reg[8] THEN GOTO label_17
   lw $t0 -32($sp)
   lw $t1 -36($sp)
    ble $t0 $t1 label_17

#------------180  FACTOR_CON CHAR 70 save in reg[9]
   li $t0 70
   sw $t0 -40($sp)

#------------181  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------182  JUMP to label_18
   j label_18

#------------183  label_17    ----------------Label----------------
label_17:

#------------184  label_18    ----------------Label----------------
label_18:

#------------185  FACTOR_VAR INT m save in reg[10]
   lw $t3 -4($sp)
   sw $t3 -44($sp)

#------------186  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -48($sp)

#------------187  IF reg[10] BGTR reg[11] THEN GOTO label_19
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    bgt $t0 $t1 label_19

#------------188  FACTOR_CON CHAR 70 save in reg[12]
   li $t0 70
   sw $t0 -52($sp)

#------------189  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------190  JUMP to label_20
   j label_20

#------------191  label_19    ----------------Label----------------
label_19:

#------------192  label_20    ----------------Label----------------
label_20:

#------------193  FACTOR_CON CHAR 84 save in reg[13]
   li $t0 84
   sw $t0 -56($sp)

#------------194  RETURN reg[13] TO $V0 AND THEN GOTO 0
   lw $v0 -56($sp)
   jr $ra

#------------195  FUNC VOID preparation(0)
   jr $ra

.func_preparation:

#------------196  CONST INT zero = 0

#------------197  VAR INT n

#------------198  VAR INT i

#------------199  ARRAY INT array[12]

#------------200  CALL INT get_max_num_1(0)
   sw $ra -56($sp)
   addi $sp $sp -60
   jal .func_get_max_num_1
   subi $sp $sp -60
   lw $ra -56($sp)

#------------201  FACTOR_FUNC INT get_max_num_1 save in reg[1]
   sw $v0 -56($sp)

#------------202  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -60($sp)

#------------203  FACTOR_CON CHAR 43 save in reg[3]
   li $t0 43
   sw $t0 -64($sp)

#------------204  PUSH INT parareg[1] from reg[1]
   sw $ra -68($sp)
   lw $t0 -56($sp)
   sw $t0 -72($sp)

#------------205  PUSH INT parareg[2] from reg[2]
   lw $t0 -60($sp)
   sw $t0 -76($sp)

#------------206  PUSH INT parareg[3] from reg[3]
   lw $t0 -64($sp)
   sw $t0 -80($sp)

#------------207  CALL INT compute(3)
   addi $sp $sp -72
   jal .func_compute
   subi $sp $sp -72
   lw $ra -68($sp)

#------------208  FACTOR_FUNC INT compute save in reg[4]
   sw $v0 -68($sp)

#------------209  ASSIGN INT n = reg[4]
   lw $t3 -68($sp)
   sw $t3 0($sp)

#------------210  label_21    ----------------Label----------------
label_21:

#------------211  FACTOR_VAR INT n save in reg[5]
   lw $t3 0($sp)
   sw $t3 -72($sp)

#------------212  IF reg[5] BEQ reg[0] THEN GOTO label_22
   lw $t0 -72($sp)
    beq $t0 $0 label_22



#------------215  FACTOR_CON INT -1 save in reg[8]
   li $t0 -1
   sw $t0 -84($sp)

#------------216  FACTOR_VAR INT n save in reg[9]
   lw $t3 0($sp)
   sw $t3 -88($sp)

#------------217  reg[10] = reg[8] JIA reg[9]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   add $t2 $t0 $t1
   sw $t2 -92($sp)

#------------218  ASSIGN INT n = reg[10]
   lw $t3 -92($sp)
   sw $t3 0($sp)

#------------219  FACTOR_VAR INT n save in reg[11]
   lw $t3 0($sp)
   sw $t3 -96($sp)

#------------220  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -100($sp)

#------------221  ASSIGN_ARR_EXTERN INT used[reg[11]] = reg[12]
   lw $t0 -96($sp)
   lw $t1 -100($sp)
   sll $t0 $t0 2
   sw $t1 .var_used($t0)

#------------222  FACTOR_VAR INT n save in reg[13]
   lw $t3 0($sp)
   sw $t3 -104($sp)

#------------223  FACTOR_CON INT 10086 save in reg[14]
   li $t0 10086
   sw $t0 -108($sp)

#------------224  ASSIGN_ARR INT array[reg[13]] = reg[14]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -8($t0)

#------------225  JUMP to label_21
   j label_21

#------------226  label_22    ----------------Label----------------
label_22:

#------------227  FACTOR_CON INT 10 save in reg[15]
   li $t0 10
   sw $t0 -112($sp)

#------------228  CALL INT get_2(0)
   sw $ra -116($sp)
   addi $sp $sp -120
   jal .func_get_2
   subi $sp $sp -120
   lw $ra -116($sp)

#------------229  FACTOR_FUNC INT get_2 save in reg[16]
   sw $v0 -116($sp)

#------------230  FACTOR_CON CHAR 43 save in reg[17]
   li $t0 43
   sw $t0 -120($sp)

#------------231  PUSH INT parareg[4] from reg[15]
   sw $ra -124($sp)
   lw $t0 -112($sp)
   sw $t0 -128($sp)

#------------232  PUSH INT parareg[5] from reg[16]
   lw $t0 -116($sp)
   sw $t0 -132($sp)

#------------233  PUSH INT parareg[6] from reg[17]
   lw $t0 -120($sp)
   sw $t0 -136($sp)

#------------234  CALL INT compute(3)
   addi $sp $sp -128
   jal .func_compute
   subi $sp $sp -128
   lw $ra -124($sp)

#------------235  FACTOR_FUNC INT compute save in reg[18]
   sw $v0 -124($sp)

#------------236  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -128($sp)

#------------237  reg[20] = reg[18] JIAN reg[19]
   lw $t0 -124($sp)
   lw $t1 -128($sp)
   sub $t2 $t0 $t1
   sw $t2 -132($sp)

#------------238  ASSIGN INT n = reg[20]
   lw $t3 -132($sp)
   sw $t3 0($sp)

#------------239  label_23    ----------------Label----------------
label_23:

#------------240  FACTOR_VAR INT n save in reg[21]
   lw $t3 0($sp)
   sw $t3 -136($sp)

#------------241  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -140($sp)

#------------242  reg[23] = reg[21] JIAN reg[22]
   lw $t0 -136($sp)
   lw $t1 -140($sp)
   sub $t2 $t0 $t1
   sw $t2 -144($sp)

#------------243  FACTOR_VAR INT n save in reg[24]
   lw $t3 0($sp)
   sw $t3 -148($sp)












#------------255  FACTOR_CON INT 20 save in reg[36]
   li $t0 20
   sw $t0 -196($sp)

#------------256  reg[37] = reg[24] JIA reg[36]
   lw $t0 -148($sp)
   lw $t1 -196($sp)
   add $t2 $t0 $t1
   sw $t2 -200($sp)

#------------257  FACTOR_CON INT 21 save in reg[38]
   li $t0 21
   sw $t0 -204($sp)

#------------258  reg[39] = reg[37] JIAN reg[38]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   sub $t2 $t0 $t1
   sw $t2 -208($sp)

#------------259  FACTOR_ARRAY INT array [reg[39]] save in reg[40]
   lw $t3 -208($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -8($t3)
   sw $t3 -212($sp)

#------------260  FACTOR_CON INT 10086 save in reg[41]
   li $t0 10086
   sw $t0 -216($sp)

#------------261  reg[42] = reg[40] JIAN reg[41]
   lw $t0 -212($sp)
   lw $t1 -216($sp)
   sub $t2 $t0 $t1
   sw $t2 -220($sp)

#------------262  ASSIGN_ARR_EXTERN INT stack[reg[23]] = reg[42]
   lw $t0 -144($sp)
   lw $t1 -220($sp)
   sll $t0 $t0 2
   sw $t1 .var_stack($t0)

#------------263  FACTOR_VAR INT n save in reg[43]
   lw $t3 0($sp)
   sw $t3 -224($sp)

#------------264  FACTOR_CON INT 1 save in reg[44]
   li $t0 1
   sw $t0 -228($sp)

#------------265  reg[45] = reg[43] JIAN reg[44]
   lw $t0 -224($sp)
   lw $t1 -228($sp)
   sub $t2 $t0 $t1
   sw $t2 -232($sp)

#------------266  ASSIGN INT n = reg[45]
   lw $t3 -232($sp)
   sw $t3 0($sp)

#------------267  FACTOR_VAR INT n save in reg[46]
   lw $t3 0($sp)
   sw $t3 -236($sp)

#------------268  IF reg[46] BNE reg[0] THEN GOTO label_23
   lw $t0 -236($sp)
    bne $t0 $0 label_23

#------------269  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------270  FUNC VOID test_for(0)
   jr $ra

.func_test_for:

#------------271  VAR INT i

#------------272  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -4($sp)

#------------273  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------274  label_24    ----------------Label----------------
label_24:

#------------275  WRITE test for success
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------276  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------277  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------278  reg[4] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------279  ASSIGN INT i = reg[4]
   lw $t3 -16($sp)
   sw $t3 0($sp)

#------------280  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -20($sp)

#------------281  IF reg[5] BNE reg[0] THEN GOTO label_24
   lw $t0 -20($sp)
    bne $t0 $0 label_24

#------------282  FUNC INT test_6_para(6)
   jr $ra

.func_test_6_para:

#------------283  PARA INT a1

#------------284  PARA INT a2

#------------285  PARA INT a3

#------------286  PARA INT a4

#------------287  PARA INT a5

#------------288  PARA INT a6

#------------289  FACTOR_VAR INT a1 save in reg[1]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------290  FACTOR_VAR INT a2 save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------291  reg[3] = reg[1] JIA reg[2]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------292  FACTOR_VAR INT a3 save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -36($sp)

#------------293  reg[5] = reg[3] JIA reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------294  FACTOR_VAR INT a4 save in reg[6]
   lw $t3 -12($sp)
   sw $t3 -44($sp)

#------------295  reg[7] = reg[5] JIA reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------296  FACTOR_VAR INT a5 save in reg[8]
   lw $t3 -16($sp)
   sw $t3 -52($sp)

#------------297  reg[9] = reg[7] JIA reg[8]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------298  FACTOR_VAR INT a6 save in reg[10]
   lw $t3 -20($sp)
   sw $t3 -60($sp)

#------------299  reg[11] = reg[9] JIA reg[10]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -64($sp)

#------------300  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -64($sp)
   jr $ra

#------------301  FUNC VOID main(0)
   jr $ra

.func_main:

#------------302  VAR INT a

#------------303  VAR INT b

#------------304  VAR CHAR op

#------------305  VAR CHAR sy

#------------306  VAR CHAR nor_sy

#------------307  CALL VOID test_for(0)
   sw $ra -20($sp)
   addi $sp $sp -24
   jal .func_test_for
   subi $sp $sp -24
   lw $ra -20($sp)

#------------308  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------309  READ INT b
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------310  READ CHAR op
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------311  FACTOR_VAR INT a save in reg[12]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------312  FACTOR_VAR INT b save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -68($sp)

#------------313  FACTOR_VAR CHAR op save in reg[14]
   lw $t3 -8($sp)
   sw $t3 -72($sp)

#------------314  PUSH INT parareg[7] from reg[12]
   sw $ra -76($sp)
   lw $t0 -64($sp)
   sw $t0 -80($sp)

#------------315  PUSH INT parareg[8] from reg[13]
   lw $t0 -68($sp)
   sw $t0 -84($sp)

#------------316  PUSH INT parareg[9] from reg[14]
   lw $t0 -72($sp)
   sw $t0 -88($sp)

#------------317  CALL INT compute(3)
   addi $sp $sp -80
   jal .func_compute
   subi $sp $sp -80
   lw $ra -76($sp)

#------------318  FACTOR_FUNC INT compute save in reg[15]
   sw $v0 -76($sp)

#------------319  ASSIGN_EXTERN INT n = reg[15]
   lw $t3 -76($sp)
   sw $t3 .var_n

#------------320  FACTOR_CON CHAR 95 save in reg[16]
   li $t0 95
   sw $t0 -80($sp)

#------------321  WRITE CHAR reg[16]
   li $v0 11
   lw $a0 -80($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------322  FACTOR_VAR_EXTERN INT n save in reg[17]
   lw $t3 .var_n
   sw $t3 -84($sp)

#------------323  WRITE INT reg[17]
   li $v0 1
   lw $a0 -84($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------324  READ_EXTERN INT m
   li $v0 5
   syscall
   sw $v0 .var_m

#------------325  FACTOR_VAR_EXTERN INT n save in reg[18]
   lw $t3 .var_n
   sw $t3 -88($sp)

#------------326  FACTOR_VAR_EXTERN INT m save in reg[19]
   lw $t3 .var_m
   sw $t3 -92($sp)

#------------327  PUSH INT parareg[10] from reg[18]
   sw $ra -96($sp)
   lw $t0 -88($sp)
   sw $t0 -100($sp)

#------------328  PUSH INT parareg[11] from reg[19]
   lw $t0 -92($sp)
   sw $t0 -104($sp)

#------------329  CALL CHAR judge(2)
   addi $sp $sp -100
   jal .func_judge
   subi $sp $sp -100
   lw $ra -96($sp)

#------------330  FACTOR_FUNC CHAR judge save in reg[20]
   sw $v0 -96($sp)

#------------331  ASSIGN CHAR sy = reg[20]
   lw $t3 -96($sp)
   sw $t3 -12($sp)

#------------332  FACTOR_VAR INT a save in reg[21]
   lw $t3 0($sp)
   sw $t3 -100($sp)

#------------333  FACTOR_VAR INT b save in reg[22]
   lw $t3 -4($sp)
   sw $t3 -104($sp)

#------------334  FACTOR_VAR_EXTERN INT n save in reg[23]
   lw $t3 .var_n
   sw $t3 -108($sp)

#------------335  FACTOR_VAR_EXTERN INT m save in reg[24]
   lw $t3 .var_m
   sw $t3 -112($sp)

#------------336  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -116($sp)

#------------337  FACTOR_CON INT 2 save in reg[26]
   li $t0 2
   sw $t0 -120($sp)

#------------338  PUSH INT parareg[12] from reg[21]
   sw $ra -124($sp)
   lw $t0 -100($sp)
   sw $t0 -128($sp)

#------------339  PUSH INT parareg[13] from reg[22]
   lw $t0 -104($sp)
   sw $t0 -132($sp)

#------------340  PUSH INT parareg[14] from reg[23]
   lw $t0 -108($sp)
   sw $t0 -136($sp)

#------------341  PUSH INT parareg[15] from reg[24]
   lw $t0 -112($sp)
   sw $t0 -140($sp)

#------------342  PUSH INT parareg[16] from reg[25]
   lw $t0 -116($sp)
   sw $t0 -144($sp)

#------------343  PUSH INT parareg[17] from reg[26]
   lw $t0 -120($sp)
   sw $t0 -148($sp)

#------------344  CALL INT test_6_para(6)
   addi $sp $sp -128
   jal .func_test_6_para
   subi $sp $sp -128
   lw $ra -124($sp)

#------------345  FACTOR_FUNC INT test_6_para save in reg[27]
   sw $v0 -124($sp)

#------------346  ASSIGN_EXTERN INT sum = reg[27]
   lw $t3 -124($sp)
   sw $t3 .var_sum

#------------347  FACTOR_VAR_EXTERN INT sum save in reg[28]
   lw $t3 .var_sum
   sw $t3 -128($sp)

#------------348  WRITE INT reg[28]
   li $v0 1
   lw $a0 -128($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------349  FACTOR_VAR CHAR sy save in reg[29]
   lw $t3 -12($sp)
   sw $t3 -132($sp)

#------------350  WRITE You can choose m numbers permutations from n numbers ? 
   li $v0 4
   la $a0 .str_3
   syscall

#------------351  WRITE CHAR reg[29]
   li $v0 11
   lw $a0 -132($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------352  WRITE ___________
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------353  CALL CHAR get_permutations_sy(0)
   sw $ra -136($sp)
   addi $sp $sp -140
   jal .func_get_permutations_sy
   subi $sp $sp -140
   lw $ra -136($sp)

#------------354  FACTOR_FUNC CHAR get_permutations_sy save in reg[30]
   sw $v0 -136($sp)

#------------355  ASSIGN CHAR nor_sy = reg[30]
   lw $t3 -136($sp)
   sw $t3 -16($sp)

#------------356  FACTOR_VAR CHAR sy save in reg[31]
   lw $t3 -12($sp)
   sw $t3 -140($sp)

#------------357  FACTOR_EXPR reg[31] save in reg[32]
   lw $t0 -140($sp)
   sw $t0 -144($sp)

#------------358  FACTOR_VAR CHAR nor_sy save in reg[33]
   lw $t3 -16($sp)
   sw $t3 -148($sp)

#------------359  FACTOR_EXPR reg[33] save in reg[34]
   lw $t0 -148($sp)
   sw $t0 -152($sp)

#------------360  IF reg[32] BEQ reg[34] THEN GOTO label_25
   lw $t0 -144($sp)
   lw $t1 -152($sp)
    beq $t0 $t1 label_25

#------------361  WRITE error input: 0 < m <= n <= 10
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------362  JUMP to label_26
   j label_26

#------------363  label_25    ----------------Label----------------
label_25:

#------------364  CALL VOID preparation(0)
   sw $ra -156($sp)
   addi $sp $sp -160
   jal .func_preparation
   subi $sp $sp -160
   lw $ra -156($sp)

#------------365  FACTOR_CON INT 0 save in reg[35]
   li $t0 0
   sw $t0 -156($sp)

#------------366  PUSH INT parareg[18] from reg[35]
   sw $ra -160($sp)
   lw $t0 -156($sp)
   sw $t0 -164($sp)

#------------367  CALL VOID permutations(1)
   addi $sp $sp -164
   jal .func_permutations
   subi $sp $sp -164
   lw $ra -160($sp)

#------------368  label_26    ----------------Label----------------
label_26:

   jr $ra

end:
