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

#------------20  WRITE  
   li $v0 4
   la $a0 .str_0
   syscall

#------------21  FACTOR_VAR INT i save in reg[6]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------22  FACTOR_ARRAY_EXTERN INT stack [reg[6]] save in reg[7]
   lw $t3 -28($sp)
   sll $t3 $t3 2
   lw $t3 .var_stack($t3)
   sw $t3 -32($sp)

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

#------------26  reg[9] = reg[8] JIA reg[9]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------27  ASSIGN INT i = reg[9]
   lw $t3 -40($sp)
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

#------------35  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -44($sp)

#------------36  ASSIGN INT i = reg[10]
   lw $t3 -44($sp)
   sw $t3 -4($sp)

#------------37  JUMP to label_5
   j label_5

#------------38  label_4    ----------------Label----------------
label_4:

#------------39  FACTOR_VAR INT i save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------40  FACTOR_CON INT 1 save in reg[12]
   li $t0 1
   sw $t0 -52($sp)

#------------41  reg[12] = reg[11] JIA reg[12]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------42  ASSIGN INT i = reg[12]
   lw $t3 -52($sp)
   sw $t3 -4($sp)

#------------43  FACTOR_VAR INT i save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -56($sp)

#------------44  FACTOR_VAR_EXTERN INT n save in reg[14]
   lw $t3 .var_n
   sw $t3 -60($sp)

#------------45  IF reg[13] BGTR reg[14] THEN GOTO label_8
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    bgt $t0 $t1 label_8

#------------46  label_5    ----------------Label----------------
label_5:

#------------47  FACTOR_VAR INT i save in reg[15]
   lw $t3 -4($sp)
   sw $t3 -64($sp)

#------------48  FACTOR_ARRAY_EXTERN INT used [reg[15]] save in reg[16]
   lw $t3 -64($sp)
   sll $t3 $t3 2
   lw $t3 .var_used($t3)
   sw $t3 -68($sp)

#------------49  FACTOR_CON INT 0 save in reg[17]
   li $t0 0
   sw $t0 -72($sp)

#------------50  IF reg[16] BEQ reg[17] THEN GOTO label_6
   lw $t0 -68($sp)
   lw $t1 -72($sp)
    beq $t0 $t1 label_6

#------------51  JUMP to label_7
   j label_7

#------------52  label_6    ----------------Label----------------
label_6:

#------------53  FACTOR_VAR INT a save in reg[18]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------54  FACTOR_VAR INT i save in reg[19]
   lw $t3 -4($sp)
   sw $t3 -80($sp)

#------------55  ASSIGN_ARR_EXTERN INT stack[reg[18]] = reg[19]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   sll $t0 $t0 2
   sw $t1 .var_stack($t0)

#------------56  FACTOR_VAR INT i save in reg[20]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------57  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -88($sp)

#------------58  ASSIGN_ARR_EXTERN INT used[reg[20]] = reg[21]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   sll $t0 $t0 2
   sw $t1 .var_used($t0)

#------------59  FACTOR_VAR INT a save in reg[22]
   lw $t3 0($sp)
   sw $t3 -92($sp)

#------------60  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -96($sp)

#------------61  reg[23] = reg[22] JIA reg[23]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   add $t2 $t0 $t1
   sw $t2 -96($sp)

#------------62  PUSH INT parareg[0] from reg[23]
   sw $ra -100($sp)
   lw $t0 -96($sp)
   sw $t0 -104($sp)

#------------63  CALL VOID permutations(1)
   addi $sp $sp -104
   jal .func_permutations
   subi $sp $sp -104
   lw $ra -100($sp)

#------------64  FACTOR_VAR INT i save in reg[24]
   lw $t3 -4($sp)
   sw $t3 -100($sp)

#------------65  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -104($sp)

#------------66  ASSIGN_ARR_EXTERN INT used[reg[24]] = reg[25]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   sll $t0 $t0 2
   sw $t1 .var_used($t0)

#------------67  label_7    ----------------Label----------------
label_7:

#------------68  JUMP to label_4
   j label_4

#------------69  label_8    ----------------Label----------------
label_8:

#------------70  FUNC INT get_max_num_1(0)
   jr $ra

.func_get_max_num_1:

#------------71  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 0($sp)

#------------72  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------73  FUNC INT get_max_num_2(0)
   jr $ra

.func_get_max_num_2:

#------------74  VAR INT max_num

#------------75  FACTOR_CON INT 10 save in reg[1]
   li $t0 10
   sw $t0 -4($sp)

#------------76  ASSIGN INT max_num = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------77  FACTOR_VAR INT max_num save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------78  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------79  FUNC INT get_2(0)
   jr $ra

.func_get_2:

#------------80  CONST INT m = 2

#------------81  FACTOR_CON INT 2 save in reg[1]
   li $t0 2
   sw $t0 0($sp)

#------------82  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------83  FUNC INT compute(3)
   jr $ra

.func_compute:

#------------84  PARA INT a

#------------85  PARA INT b

#------------86  PARA CHAR op

#------------87  FACTOR_VAR CHAR op save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------88  FACTOR_EXPR reg[1] save in reg[2]
   lw $t0 -12($sp)
   sw $t0 -16($sp)

#------------89  FACTOR_CON CHAR 43 save in reg[3]
   li $t0 43
   sw $t0 -20($sp)

#------------90  FACTOR_EXPR reg[3] save in reg[4]
   lw $t0 -20($sp)
   sw $t0 -24($sp)

#------------91  IF reg[2] BNE reg[4] THEN GOTO label_9
   lw $t0 -16($sp)
   lw $t1 -24($sp)
    bne $t0 $t1 label_9

#------------92  FACTOR_VAR INT a save in reg[5]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------93  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -32($sp)

#------------94  FACTOR_VAR INT b save in reg[7]
   lw $t3 -4($sp)
   sw $t3 -36($sp)

#------------95  reg[7] = reg[6] CHENG reg[7]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------96  reg[7] = reg[5] JIA reg[7]
   lw $t0 -28($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------97  FACTOR_EXPR reg[7] save in reg[8]
   lw $t0 -36($sp)
   sw $t0 -40($sp)

#------------98  FACTOR_VAR INT b save in reg[9]
   lw $t3 -4($sp)
   sw $t3 -44($sp)

#------------99  reg[9] = reg[8] JIAN reg[9]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------100  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------101  JUMP to label_16
   j label_16

#------------102  label_9    ----------------Label----------------
label_9:

#------------103  FACTOR_VAR CHAR op save in reg[10]
   lw $t3 -8($sp)
   sw $t3 -48($sp)

#------------104  FACTOR_EXPR reg[10] save in reg[11]
   lw $t0 -48($sp)
   sw $t0 -52($sp)

#------------105  FACTOR_CON CHAR 45 save in reg[12]
   li $t0 45
   sw $t0 -56($sp)

#------------106  FACTOR_EXPR reg[12] save in reg[13]
   lw $t0 -56($sp)
   sw $t0 -60($sp)

#------------107  IF reg[11] BNE reg[13] THEN GOTO label_10
   lw $t0 -52($sp)
   lw $t1 -60($sp)
    bne $t0 $t1 label_10

#------------108  FACTOR_VAR INT a save in reg[14]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------109  FACTOR_VAR INT b save in reg[15]
   lw $t3 -4($sp)
   sw $t3 -68($sp)

#------------110  FACTOR_VAR INT b save in reg[16]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------111  reg[16] = reg[15] JIA reg[16]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------112  FACTOR_EXPR reg[16] save in reg[17]
   lw $t0 -72($sp)
   sw $t0 -76($sp)

#------------113  FACTOR_CON INT 2 save in reg[18]
   li $t0 2
   sw $t0 -80($sp)

#------------114  reg[18] = reg[17] CHU reg[18]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -80($sp)

#------------115  reg[18] = reg[14] JIAN reg[18]
   lw $t0 -64($sp)
   lw $t1 -80($sp)
   sub $t2 $t0 $t1
   sw $t2 -80($sp)

#------------116  RETURN reg[18] TO $V0 AND THEN GOTO 0
   lw $v0 -80($sp)
   jr $ra

#------------117  JUMP to label_15
   j label_15

#------------118  label_10    ----------------Label----------------
label_10:

#------------119  FACTOR_VAR CHAR op save in reg[19]
   lw $t3 -8($sp)
   sw $t3 -84($sp)

#------------120  FACTOR_EXPR reg[19] save in reg[20]
   lw $t0 -84($sp)
   sw $t0 -88($sp)

#------------121  FACTOR_CON CHAR 42 save in reg[21]
   li $t0 42
   sw $t0 -92($sp)

#------------122  FACTOR_EXPR reg[21] save in reg[22]
   lw $t0 -92($sp)
   sw $t0 -96($sp)

#------------123  IF reg[20] BNE reg[22] THEN GOTO label_11
   lw $t0 -88($sp)
   lw $t1 -96($sp)
    bne $t0 $t1 label_11

#------------124  FACTOR_VAR INT a save in reg[23]
   lw $t3 0($sp)
   sw $t3 -100($sp)

#------------125  FACTOR_VAR INT b save in reg[24]
   lw $t3 -4($sp)
   sw $t3 -104($sp)

#------------126  reg[24] = reg[23] CHENG reg[24]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -104($sp)

#------------127  RETURN reg[24] TO $V0 AND THEN GOTO 0
   lw $v0 -104($sp)
   jr $ra

#------------128  JUMP to label_14
   j label_14

#------------129  label_11    ----------------Label----------------
label_11:

#------------130  FACTOR_VAR INT b save in reg[25]
   lw $t3 -4($sp)
   sw $t3 -108($sp)

#------------131  IF reg[25] BEQ reg[0] THEN GOTO label_12
   lw $t0 -108($sp)
    beq $t0 $0 label_12

#------------132  FACTOR_VAR INT a save in reg[26]
   lw $t3 0($sp)
   sw $t3 -112($sp)

#------------133  FACTOR_VAR INT b save in reg[27]
   lw $t3 -4($sp)
   sw $t3 -116($sp)

#------------134  reg[27] = reg[26] CHU reg[27]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -116($sp)

#------------135  RETURN reg[27] TO $V0 AND THEN GOTO 0
   lw $v0 -116($sp)
   jr $ra

#------------136  JUMP to label_13
   j label_13

#------------137  label_12    ----------------Label----------------
label_12:

#------------138  FACTOR_CON INT 1 save in reg[28]
   li $t0 1
   sw $t0 -120($sp)

#------------139  FACTOR_CON INT 2 save in reg[29]
   li $t0 2
   sw $t0 -124($sp)

#------------140  reg[29] = reg[28] JIA reg[29]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   add $t2 $t0 $t1
   sw $t2 -124($sp)

#------------141  FACTOR_EXPR reg[29] save in reg[30]
   lw $t0 -124($sp)
   sw $t0 -128($sp)

#------------142  FACTOR_CON INT 3 save in reg[31]
   li $t0 3
   sw $t0 -132($sp)

#------------143  reg[31] = reg[30] CHENG reg[31]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -132($sp)

#------------144  FACTOR_CON INT 4 save in reg[32]
   li $t0 4
   sw $t0 -136($sp)

#------------145  reg[32] = reg[31] JIAN reg[32]
   lw $t0 -132($sp)
   lw $t1 -136($sp)
   sub $t2 $t0 $t1
   sw $t2 -136($sp)

#------------146  FACTOR_EXPR reg[32] save in reg[33]
   lw $t0 -136($sp)
   sw $t0 -140($sp)

#------------147  FACTOR_CON INT 5 save in reg[34]
   li $t0 5
   sw $t0 -144($sp)

#------------148  reg[34] = reg[33] CHU reg[34]
   lw $t0 -140($sp)
   lw $t1 -144($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -144($sp)

#------------149  FACTOR_CON INT 6 save in reg[35]
   li $t0 6
   sw $t0 -148($sp)

#------------150  reg[35] = reg[34] CHENG reg[35]
   lw $t0 -144($sp)
   lw $t1 -148($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -148($sp)

#------------151  FACTOR_CON INT -7 save in reg[36]
   li $t0 -7
   sw $t0 -152($sp)

#------------152  reg[36] = reg[35] JIA reg[36]
   lw $t0 -148($sp)
   lw $t1 -152($sp)
   add $t2 $t0 $t1
   sw $t2 -152($sp)

#------------153  FACTOR_CON INT 1 save in reg[37]
   li $t0 1
   sw $t0 -156($sp)

#------------154  reg[37] = reg[36] JIA reg[37]
   lw $t0 -152($sp)
   lw $t1 -156($sp)
   add $t2 $t0 $t1
   sw $t2 -156($sp)

#------------155  RETURN reg[37] TO $V0 AND THEN GOTO 0
   lw $v0 -156($sp)
   jr $ra

#------------156  label_13    ----------------Label----------------
label_13:

#------------157  label_14    ----------------Label----------------
label_14:

#------------158  label_15    ----------------Label----------------
label_15:

#------------159  label_16    ----------------Label----------------
label_16:

#------------160  FUNC CHAR get_permutations_sy(0)
   jr $ra

.func_get_permutations_sy:

#------------161  CONST CHAR permutations_sy = 84

#------------162  FACTOR_CON CHAR 84 save in reg[1]
   li $t0 84
   sw $t0 0($sp)

#------------163  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------164  FUNC CHAR judge(2)
   jr $ra

.func_judge:

#------------165  PARA INT n

#------------166  PARA INT m

#------------167  CONST CHAR divide = 45

#------------168  FACTOR_CON CHAR 45 save in reg[1]
   li $t0 45
   sw $t0 -8($sp)

#------------169  WRITE CHAR reg[1]
   li $v0 11
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------170  FACTOR_VAR INT n save in reg[2]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------171  CALL INT get_max_num_1(0)
   sw $ra -16($sp)
   addi $sp $sp -20
   jal .func_get_max_num_1
   subi $sp $sp -20
   lw $ra -16($sp)

#------------172  FACTOR_FUNC INT get_max_num_1 save in reg[3]
   sw $v0 -16($sp)

#------------173  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -20($sp)

#------------174  reg[4] = reg[3] JIA reg[4]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------175  IF reg[2] BLSS reg[4] THEN GOTO label_17
   lw $t0 -12($sp)
   lw $t1 -20($sp)
    blt $t0 $t1 label_17

#------------176  FACTOR_CON CHAR 70 save in reg[5]
   li $t0 70
   sw $t0 -24($sp)

#------------177  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------178  JUMP to label_18
   j label_18

#------------179  label_17    ----------------Label----------------
label_17:

#------------180  label_18    ----------------Label----------------
label_18:

#------------181  FACTOR_VAR INT m save in reg[6]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------182  FACTOR_VAR INT n save in reg[7]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------183  IF reg[6] BLEQ reg[7] THEN GOTO label_19
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    ble $t0 $t1 label_19

#------------184  FACTOR_CON CHAR 70 save in reg[8]
   li $t0 70
   sw $t0 -36($sp)

#------------185  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------186  JUMP to label_20
   j label_20

#------------187  label_19    ----------------Label----------------
label_19:

#------------188  label_20    ----------------Label----------------
label_20:

#------------189  FACTOR_VAR INT m save in reg[9]
   lw $t3 -4($sp)
   sw $t3 -40($sp)

#------------190  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -44($sp)

#------------191  IF reg[9] BGTR reg[10] THEN GOTO label_21
   lw $t0 -40($sp)
   lw $t1 -44($sp)
    bgt $t0 $t1 label_21

#------------192  FACTOR_CON CHAR 70 save in reg[11]
   li $t0 70
   sw $t0 -48($sp)

#------------193  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------194  JUMP to label_22
   j label_22

#------------195  label_21    ----------------Label----------------
label_21:

#------------196  label_22    ----------------Label----------------
label_22:

#------------197  FACTOR_CON CHAR 84 save in reg[12]
   li $t0 84
   sw $t0 -52($sp)

#------------198  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------199  FUNC VOID preparation(0)
   jr $ra

.func_preparation:

#------------200  CONST INT zero = 0

#------------201  VAR INT n

#------------202  ARRAY INT array[10]

#------------203  CALL INT get_max_num_1(0)
   sw $ra -44($sp)
   addi $sp $sp -48
   jal .func_get_max_num_1
   subi $sp $sp -48
   lw $ra -44($sp)

#------------204  FACTOR_FUNC INT get_max_num_1 save in reg[1]
   sw $v0 -44($sp)

#------------205  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -48($sp)

#------------206  FACTOR_CON CHAR 43 save in reg[3]
   li $t0 43
   sw $t0 -52($sp)

#------------207  PUSH INT parareg[1] from reg[1]
   sw $ra -56($sp)
   lw $t0 -44($sp)
   sw $t0 -60($sp)

#------------208  PUSH INT parareg[2] from reg[2]
   lw $t0 -48($sp)
   sw $t0 -64($sp)

#------------209  PUSH INT parareg[3] from reg[3]
   lw $t0 -52($sp)
   sw $t0 -68($sp)

#------------210  CALL INT compute(3)
   addi $sp $sp -60
   jal .func_compute
   subi $sp $sp -60
   lw $ra -56($sp)

#------------211  FACTOR_FUNC INT compute save in reg[4]
   sw $v0 -56($sp)

#------------212  ASSIGN INT n = reg[4]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------213  label_23    ----------------Label----------------
label_23:

#------------214  FACTOR_VAR INT n save in reg[5]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------215  IF reg[5] BEQ reg[0] THEN GOTO label_24
   lw $t0 -60($sp)
    beq $t0 $0 label_24

#------------216  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -64($sp)

#------------217  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -68($sp)

#------------218  reg[7] = reg[7] JIAN reg[6]
   lw $t0 -68($sp)
   lw $t1 -64($sp)
   sub $t2 $t0 $t1
   sw $t2 -68($sp)

#------------219  FACTOR_VAR INT n save in reg[8]
   lw $t3 0($sp)
   sw $t3 -72($sp)

#------------220  reg[8] = reg[7] JIA reg[8]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------221  ASSIGN INT n = reg[8]
   lw $t3 -72($sp)
   sw $t3 0($sp)

#------------222  FACTOR_VAR INT n save in reg[9]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------223  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -80($sp)

#------------224  ASSIGN_ARR_EXTERN INT used[reg[9]] = reg[10]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   sll $t0 $t0 2
   sw $t1 .var_used($t0)

#------------225  FACTOR_VAR INT n save in reg[11]
   lw $t3 0($sp)
   sw $t3 -84($sp)

#------------226  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -88($sp)

#------------227  ASSIGN_ARR INT array[reg[11]] = reg[12]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------228  JUMP to label_23
   j label_23

#------------229  label_24    ----------------Label----------------
label_24:

#------------230  FACTOR_CON INT 10 save in reg[13]
   li $t0 10
   sw $t0 -92($sp)

#------------231  CALL INT get_2(0)
   sw $ra -96($sp)
   addi $sp $sp -100
   jal .func_get_2
   subi $sp $sp -100
   lw $ra -96($sp)

#------------232  FACTOR_FUNC INT get_2 save in reg[14]
   sw $v0 -96($sp)

#------------233  FACTOR_CON CHAR 43 save in reg[15]
   li $t0 43
   sw $t0 -100($sp)

#------------234  PUSH INT parareg[4] from reg[13]
   sw $ra -104($sp)
   lw $t0 -92($sp)
   sw $t0 -108($sp)

#------------235  PUSH INT parareg[5] from reg[14]
   lw $t0 -96($sp)
   sw $t0 -112($sp)

#------------236  PUSH INT parareg[6] from reg[15]
   lw $t0 -100($sp)
   sw $t0 -116($sp)

#------------237  CALL INT compute(3)
   addi $sp $sp -108
   jal .func_compute
   subi $sp $sp -108
   lw $ra -104($sp)

#------------238  FACTOR_FUNC INT compute save in reg[16]
   sw $v0 -104($sp)

#------------239  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -108($sp)

#------------240  reg[17] = reg[16] JIAN reg[17]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   sub $t2 $t0 $t1
   sw $t2 -108($sp)

#------------241  ASSIGN INT n = reg[17]
   lw $t3 -108($sp)
   sw $t3 0($sp)

#------------242  JUMP to label_26
   j label_26

#------------243  label_25    ----------------Label----------------
label_25:

#------------244  FACTOR_VAR INT n save in reg[18]
   lw $t3 0($sp)
   sw $t3 -112($sp)

#------------245  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -116($sp)

#------------246  reg[19] = reg[18] JIAN reg[19]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   sub $t2 $t0 $t1
   sw $t2 -116($sp)

#------------247  ASSIGN INT n = reg[19]
   lw $t3 -116($sp)
   sw $t3 0($sp)

#------------248  FACTOR_VAR INT n save in reg[20]
   lw $t3 0($sp)
   sw $t3 -120($sp)

#------------249  IF reg[20] BEQ reg[0] THEN GOTO label_27
   lw $t0 -120($sp)
    beq $t0 $0 label_27

#------------250  label_26    ----------------Label----------------
label_26:

#------------251  FACTOR_VAR INT n save in reg[21]
   lw $t3 0($sp)
   sw $t3 -124($sp)

#------------252  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -128($sp)

#------------253  reg[22] = reg[21] JIAN reg[22]
   lw $t0 -124($sp)
   lw $t1 -128($sp)
   sub $t2 $t0 $t1
   sw $t2 -128($sp)

#------------254  FACTOR_VAR INT n save in reg[23]
   lw $t3 0($sp)
   sw $t3 -132($sp)

#------------255  FACTOR_ARRAY INT array [reg[23]] save in reg[24]
   lw $t3 -132($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -136($sp)

#------------256  ASSIGN_ARR_EXTERN INT stack[reg[22]] = reg[24]
   lw $t0 -128($sp)
   lw $t1 -136($sp)
   sll $t0 $t0 2
   sw $t1 .var_stack($t0)

#------------257  JUMP to label_25
   j label_25

#------------258  label_27    ----------------Label----------------
label_27:

#------------259  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------260  FUNC VOID test_for(0)
   jr $ra

.func_test_for:

#------------261  VAR INT i

#------------262  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -4($sp)

#------------263  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------264  JUMP to label_29
   j label_29

#------------265  label_28    ----------------Label----------------
label_28:

#------------266  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------267  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------268  reg[3] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------269  ASSIGN INT i = reg[3]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------270  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -16($sp)

#------------271  IF reg[4] BEQ reg[0] THEN GOTO label_30
   lw $t0 -16($sp)
    beq $t0 $0 label_30

#------------272  label_29    ----------------Label----------------
label_29:

#------------273  WRITE test for success
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------274  JUMP to label_28
   j label_28

#------------275  label_30    ----------------Label----------------
label_30:

#------------276  FUNC INT test_6_para(6)
   jr $ra

.func_test_6_para:

#------------277  PARA INT a1

#------------278  PARA INT a2

#------------279  PARA INT a3

#------------280  PARA INT a4

#------------281  PARA INT a5

#------------282  PARA INT a6

#------------283  FACTOR_VAR INT a1 save in reg[1]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------284  FACTOR_VAR INT a2 save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------285  reg[2] = reg[1] JIA reg[2]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------286  FACTOR_VAR INT a3 save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------287  reg[3] = reg[2] JIA reg[3]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------288  FACTOR_VAR INT a4 save in reg[4]
   lw $t3 -12($sp)
   sw $t3 -36($sp)

#------------289  reg[4] = reg[3] JIA reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------290  FACTOR_VAR INT a5 save in reg[5]
   lw $t3 -16($sp)
   sw $t3 -40($sp)

#------------291  reg[5] = reg[4] JIA reg[5]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------292  FACTOR_VAR INT a6 save in reg[6]
   lw $t3 -20($sp)
   sw $t3 -44($sp)

#------------293  reg[6] = reg[5] JIA reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------294  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------295  FUNC VOID main(0)
   jr $ra

.func_main:

#------------296  VAR INT a

#------------297  VAR INT b

#------------298  VAR CHAR op

#------------299  VAR CHAR sy

#------------300  VAR CHAR nor_sy

#------------301  CALL VOID test_for(0)
   sw $ra -20($sp)
   addi $sp $sp -24
   jal .func_test_for
   subi $sp $sp -24
   lw $ra -20($sp)

#------------302  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------303  READ INT b
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------304  READ CHAR op
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------305  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------306  FACTOR_VAR INT b save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------307  FACTOR_VAR CHAR op save in reg[9]
   lw $t3 -8($sp)
   sw $t3 -52($sp)

#------------308  PUSH INT parareg[7] from reg[7]
   sw $ra -56($sp)
   lw $t0 -44($sp)
   sw $t0 -60($sp)

#------------309  PUSH INT parareg[8] from reg[8]
   lw $t0 -48($sp)
   sw $t0 -64($sp)

#------------310  PUSH INT parareg[9] from reg[9]
   lw $t0 -52($sp)
   sw $t0 -68($sp)

#------------311  CALL INT compute(3)
   addi $sp $sp -60
   jal .func_compute
   subi $sp $sp -60
   lw $ra -56($sp)

#------------312  FACTOR_FUNC INT compute save in reg[10]
   sw $v0 -56($sp)

#------------313  ASSIGN_EXTERN INT n = reg[10]
   lw $t3 -56($sp)
   sw $t3 .var_n

#------------314  FACTOR_VAR_EXTERN INT n save in reg[11]
   lw $t3 .var_n
   sw $t3 -60($sp)

#------------315  WRITE INT reg[11]
   li $v0 1
   lw $a0 -60($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------316  FACTOR_CON CHAR 95 save in reg[12]
   li $t0 95
   sw $t0 -64($sp)

#------------317  WRITE CHAR reg[12]
   li $v0 11
   lw $a0 -64($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------318  READ_EXTERN INT m
   li $v0 5
   syscall
   sw $v0 .var_m

#------------319  FACTOR_VAR_EXTERN INT n save in reg[13]
   lw $t3 .var_n
   sw $t3 -68($sp)

#------------320  FACTOR_VAR_EXTERN INT m save in reg[14]
   lw $t3 .var_m
   sw $t3 -72($sp)

#------------321  PUSH INT parareg[10] from reg[13]
   sw $ra -76($sp)
   lw $t0 -68($sp)
   sw $t0 -80($sp)

#------------322  PUSH INT parareg[11] from reg[14]
   lw $t0 -72($sp)
   sw $t0 -84($sp)

#------------323  CALL CHAR judge(2)
   addi $sp $sp -80
   jal .func_judge
   subi $sp $sp -80
   lw $ra -76($sp)

#------------324  FACTOR_FUNC CHAR judge save in reg[15]
   sw $v0 -76($sp)

#------------325  ASSIGN CHAR sy = reg[15]
   lw $t3 -76($sp)
   sw $t3 -12($sp)

#------------326  FACTOR_VAR INT a save in reg[16]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------327  FACTOR_VAR INT b save in reg[17]
   lw $t3 -4($sp)
   sw $t3 -84($sp)

#------------328  FACTOR_VAR_EXTERN INT n save in reg[18]
   lw $t3 .var_n
   sw $t3 -88($sp)

#------------329  FACTOR_VAR_EXTERN INT m save in reg[19]
   lw $t3 .var_m
   sw $t3 -92($sp)

#------------330  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -96($sp)

#------------331  FACTOR_CON INT 2 save in reg[21]
   li $t0 2
   sw $t0 -100($sp)

#------------332  PUSH INT parareg[12] from reg[16]
   sw $ra -104($sp)
   lw $t0 -80($sp)
   sw $t0 -108($sp)

#------------333  PUSH INT parareg[13] from reg[17]
   lw $t0 -84($sp)
   sw $t0 -112($sp)

#------------334  PUSH INT parareg[14] from reg[18]
   lw $t0 -88($sp)
   sw $t0 -116($sp)

#------------335  PUSH INT parareg[15] from reg[19]
   lw $t0 -92($sp)
   sw $t0 -120($sp)

#------------336  PUSH INT parareg[16] from reg[20]
   lw $t0 -96($sp)
   sw $t0 -124($sp)

#------------337  PUSH INT parareg[17] from reg[21]
   lw $t0 -100($sp)
   sw $t0 -128($sp)

#------------338  CALL INT test_6_para(6)
   addi $sp $sp -108
   jal .func_test_6_para
   subi $sp $sp -108
   lw $ra -104($sp)

#------------339  FACTOR_FUNC INT test_6_para save in reg[22]
   sw $v0 -104($sp)

#------------340  ASSIGN_EXTERN INT sum = reg[22]
   lw $t3 -104($sp)
   sw $t3 .var_sum

#------------341  FACTOR_VAR_EXTERN INT sum save in reg[23]
   lw $t3 .var_sum
   sw $t3 -108($sp)

#------------342  WRITE INT reg[23]
   li $v0 1
   lw $a0 -108($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------343  WRITE You can choose m numbers permutations from n numbers ? 
   li $v0 4
   la $a0 .str_3
   syscall

#------------344  FACTOR_VAR CHAR sy save in reg[24]
   lw $t3 -12($sp)
   sw $t3 -112($sp)

#------------345  WRITE CHAR reg[24]
   li $v0 11
   lw $a0 -112($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------346  WRITE ___________
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------347  CALL CHAR get_permutations_sy(0)
   sw $ra -116($sp)
   addi $sp $sp -120
   jal .func_get_permutations_sy
   subi $sp $sp -120
   lw $ra -116($sp)

#------------348  FACTOR_FUNC CHAR get_permutations_sy save in reg[25]
   sw $v0 -116($sp)

#------------349  ASSIGN CHAR nor_sy = reg[25]
   lw $t3 -116($sp)
   sw $t3 -16($sp)

#------------350  FACTOR_VAR CHAR sy save in reg[26]
   lw $t3 -12($sp)
   sw $t3 -120($sp)

#------------351  FACTOR_EXPR reg[26] save in reg[27]
   lw $t0 -120($sp)
   sw $t0 -124($sp)

#------------352  FACTOR_VAR CHAR nor_sy save in reg[28]
   lw $t3 -16($sp)
   sw $t3 -128($sp)

#------------353  FACTOR_EXPR reg[28] save in reg[29]
   lw $t0 -128($sp)
   sw $t0 -132($sp)

#------------354  IF reg[27] BEQ reg[29] THEN GOTO label_31
   lw $t0 -124($sp)
   lw $t1 -132($sp)
    beq $t0 $t1 label_31

#------------355  WRITE error input: 0 < m <= n <= 10
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------356  JUMP to label_32
   j label_32

#------------357  label_31    ----------------Label----------------
label_31:

#------------358  CALL VOID preparation(0)
   sw $ra -136($sp)
   addi $sp $sp -140
   jal .func_preparation
   subi $sp $sp -140
   lw $ra -136($sp)

#------------359  FACTOR_CON INT 0 save in reg[30]
   li $t0 0
   sw $t0 -136($sp)

#------------360  PUSH INT parareg[18] from reg[30]
   sw $ra -140($sp)
   lw $t0 -136($sp)
   sw $t0 -144($sp)

#------------361  CALL VOID permutations(1)
   addi $sp $sp -144
   jal .func_permutations
   subi $sp $sp -144
   lw $ra -140($sp)

#------------362  label_32    ----------------Label----------------
label_32:

   jr $ra

end:
