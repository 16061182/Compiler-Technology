.data
   .var_x: .word 0
   .var_y: .word 0
   .var_z: .word 0
   .var_t: .word 0
   .var_data: .space 40
   .var_i: .word 0
   .var_m: .word 0
   .var_n: .word 0
   .var__abc: .word 0
   .var_c1: .word 0
   .var_c2: .word 0
   .str_0: .asciiz "\\n! ~}|{abcABC<=+-$%&*()/"
   .str_1: .asciiz "...fibo result is :"
   .str_2: .asciiz "...abs is: "
   .str_3: .asciiz "...for loop work well"
   .str_4: .asciiz "...for error"
.text
   jal .func_main
   j end
#------------14  FUNC INT add(6)
.func_add:

#------------15  PARA INT a

#------------16  PARA INT b

#------------17  PARA INT c

#------------18  PARA INT d

#------------19  PARA INT e

#------------20  PARA INT f

#------------21  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------22  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------23  reg[2] = reg[1] JIA reg[2]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------24  FACTOR_VAR INT c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------25  reg[3] = reg[2] JIA reg[3]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------26  FACTOR_VAR INT d save in reg[4]
   lw $t3 -12($sp)
   sw $t3 -36($sp)

#------------27  reg[4] = reg[3] JIA reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------28  FACTOR_VAR INT e save in reg[5]
   lw $t3 -16($sp)
   sw $t3 -40($sp)

#------------29  reg[5] = reg[4] JIA reg[5]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------30  FACTOR_VAR INT f save in reg[6]
   lw $t3 -20($sp)
   sw $t3 -44($sp)

#------------31  reg[6] = reg[5] JIA reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------32  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------33  FUNC CHAR fool(0)
   jr $ra

.func_fool:

#------------34  FACTOR_CON CHAR 84 save in reg[1]
   li $t0 84
   sw $t0 0($sp)

#------------35  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------36  FUNC INT getabs(1)
   jr $ra

.func_getabs:

#------------37  PARA INT x

#------------38  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------39  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------40  IF reg[1] BLEQ reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    ble $t0 $t1 label_0

#------------41  FACTOR_VAR INT x save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------42  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------43  JUMP to label_1
   j label_1

#------------44  label_0    ----------------Label----------------
label_0:

#------------45  label_1    ----------------Label----------------
label_1:

#------------46  FACTOR_VAR INT x save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------47  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -20($sp)

#------------48  IF reg[4] BNE reg[5] THEN GOTO label_2
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_2

#------------49  FACTOR_CON INT 0 save in reg[6]
   li $t0 0
   sw $t0 -24($sp)

#------------50  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------51  JUMP to label_5
   j label_5

#------------52  label_2    ----------------Label----------------
label_2:

#------------53  FACTOR_VAR INT x save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------54  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -32($sp)

#------------55  IF reg[7] BEQ reg[8] THEN GOTO label_3
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    beq $t0 $t1 label_3

#------------56  FACTOR_VAR INT x save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------57  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -40($sp)

#------------58  reg[10] = reg[10] JIAN reg[9]
   lw $t0 -40($sp)
   lw $t1 -36($sp)
   sub $t2 $t0 $t1
   sw $t2 -40($sp)

#------------59  RETURN reg[10] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------60  JUMP to label_4
   j label_4

#------------61  label_3    ----------------Label----------------
label_3:

#------------62  label_4    ----------------Label----------------
label_4:

#------------63  label_5    ----------------Label----------------
label_5:

#------------64  FUNC INT fibo(1)
   jr $ra

.func_fibo:

#------------65  PARA INT n

#------------66  FACTOR_VAR INT n save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------67  FACTOR_CON INT 3 save in reg[2]
   li $t0 3
   sw $t0 -8($sp)

#------------68  IF reg[1] BGEQ reg[2] THEN GOTO label_6
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_6

#------------69  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------70  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------71  JUMP to label_7
   j label_7

#------------72  label_6    ----------------Label----------------
label_6:

#------------73  FACTOR_VAR INT n save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------74  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------75  reg[5] = reg[4] JIAN reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------76  PUSH INT parareg[0] from reg[5]
   sw $ra -24($sp)
   lw $t0 -20($sp)
   sw $t0 -28($sp)

#------------77  CALL INT fibo(1)
   addi $sp $sp -28
   jal .func_fibo
   subi $sp $sp -28
   lw $ra -24($sp)

#------------78  FACTOR_FUNC INT fibo save in reg[6]
   sw $v0 -24($sp)

#------------79  FACTOR_VAR INT n save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------80  FACTOR_CON INT 2 save in reg[8]
   li $t0 2
   sw $t0 -32($sp)

#------------81  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------82  PUSH INT parareg[1] from reg[8]
   sw $ra -36($sp)
   lw $t0 -32($sp)
   sw $t0 -40($sp)

#------------83  CALL INT fibo(1)
   addi $sp $sp -40
   jal .func_fibo
   subi $sp $sp -40
   lw $ra -36($sp)

#------------84  FACTOR_FUNC INT fibo save in reg[9]
   sw $v0 -36($sp)

#------------85  reg[9] = reg[6] JIA reg[9]
   lw $t0 -24($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------86  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------87  label_7    ----------------Label----------------
label_7:

#------------88  FUNC VOID test_strelement(0)
   jr $ra

.func_test_strelement:

#------------89  WRITE \n! ~}|{abcABC<=+-$%&*()/
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------90  FUNC INT test_chartypetrans(1)
   jr $ra

.func_test_chartypetrans:

#------------91  PARA CHAR ch

#------------92  FACTOR_VAR CHAR ch save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------93  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------94  reg[2] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -8($sp)

#------------95  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------96  FUNC INT test_condition(1)
   jr $ra

.func_test_condition:

#------------97  PARA INT x

#------------98  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------99  FACTOR_CON INT 3 save in reg[2]
   li $t0 3
   sw $t0 -8($sp)

#------------100  FACTOR_CON INT 4 save in reg[3]
   li $t0 4
   sw $t0 -12($sp)

#------------101  reg[3] = reg[2] CHENG reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -12($sp)

#------------102  reg[3] = reg[1] JIAN reg[3]
   lw $t0 -4($sp)
   lw $t1 -12($sp)
   sub $t2 $t0 $t1
   sw $t2 -12($sp)

#------------103  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -16($sp)

#------------104  FACTOR_CON INT 6 save in reg[5]
   li $t0 6
   sw $t0 -20($sp)

#------------105  reg[5] = reg[4] CHENG reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -20($sp)

#------------106  reg[5] = reg[3] JIA reg[5]
   lw $t0 -12($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------107  IF reg[5] BEQ reg[0] THEN GOTO label_8
   lw $t0 -20($sp)
    beq $t0 $0 label_8

#------------108  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------109  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------110  JUMP to label_9
   j label_9

#------------111  label_8    ----------------Label----------------
label_8:

#------------112  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -28($sp)

#------------113  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------114  label_9    ----------------Label----------------
label_9:

#------------115  FUNC VOID call_fibo(0)
   jr $ra

.func_call_fibo:

#------------116  READ_EXTERN INT m
   li $v0 5
   syscall
   sw $v0 .var_m

#------------117  FACTOR_VAR_EXTERN INT m save in reg[1]
   lw $t3 .var_m
   sw $t3 0($sp)

#------------118  PUSH INT parareg[2] from reg[1]
   sw $ra -4($sp)
   lw $t0 0($sp)
   sw $t0 -8($sp)

#------------119  CALL INT fibo(1)
   addi $sp $sp -8
   jal .func_fibo
   subi $sp $sp -8
   lw $ra -4($sp)

#------------120  FACTOR_FUNC INT fibo save in reg[2]
   sw $v0 -4($sp)

#------------121  ASSIGN_EXTERN INT t = reg[2]
   lw $t3 -4($sp)
   sw $t3 .var_t

#------------122  WRITE ...fibo result is :
   li $v0 4
   la $a0 .str_1
   syscall

#------------123  FACTOR_VAR_EXTERN INT t save in reg[3]
   lw $t3 .var_t
   sw $t3 -8($sp)

#------------124  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------125  FUNC VOID test_arrayindex(0)
   jr $ra

.func_test_arrayindex:

#------------126  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------127  FACTOR_CON INT 100 save in reg[2]
   li $t0 100
   sw $t0 -4($sp)

#------------128  ASSIGN_ARR_EXTERN INT data[reg[1]] = reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   sll $t0 $t0 2
   sw $t1 .var_data($t0)

#------------129  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -8($sp)

#------------130  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -12($sp)

#------------131  reg[4] = reg[3] JIA reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------132  FACTOR_CON INT 200 save in reg[5]
   li $t0 200
   sw $t0 -16($sp)

#------------133  ASSIGN_ARR_EXTERN INT data[reg[4]] = reg[5]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   sll $t0 $t0 2
   sw $t1 .var_data($t0)

#------------134  FACTOR_CON INT 8 save in reg[6]
   li $t0 8
   sw $t0 -20($sp)

#------------135  FACTOR_EXPR reg[6] save in reg[7]
   lw $t0 -20($sp)
   sw $t0 -24($sp)

#------------136  FACTOR_CON INT 400 save in reg[8]
   li $t0 400
   sw $t0 -28($sp)

#------------137  ASSIGN_ARR_EXTERN INT data[reg[7]] = reg[8]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sw $t1 .var_data($t0)

#------------138  FUNC VOID test_arrayassign(0)
   jr $ra

.func_test_arrayassign:

#------------139  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------140  ASSIGN_EXTERN INT i = reg[1]
   lw $t3 0($sp)
   sw $t3 .var_i

#------------141  label_10    ----------------Label----------------
label_10:

#------------142  FACTOR_VAR_EXTERN INT i save in reg[2]
   lw $t3 .var_i
   sw $t3 -4($sp)

#------------143  FACTOR_CON INT 10 save in reg[3]
   li $t0 10
   sw $t0 -8($sp)

#------------144  IF reg[2] BGEQ reg[3] THEN GOTO label_11
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_11

#------------145  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -12($sp)

#------------146  FACTOR_VAR_EXTERN INT i save in reg[5]
   lw $t3 .var_i
   sw $t3 -16($sp)

#------------147  FACTOR_CON INT 2 save in reg[6]
   li $t0 2
   sw $t0 -20($sp)

#------------148  reg[6] = reg[5] JIAN reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------149  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -24($sp)

#------------150  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -28($sp)

#------------151  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -32($sp)

#------------152  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -36($sp)

#------------153  PUSH INT parareg[3] from reg[4]
   sw $ra -40($sp)
   lw $t0 -12($sp)
   sw $t0 -44($sp)

#------------154  PUSH INT parareg[4] from reg[6]
   lw $t0 -20($sp)
   sw $t0 -48($sp)

#------------155  PUSH INT parareg[5] from reg[7]
   lw $t0 -24($sp)
   sw $t0 -52($sp)

#------------156  PUSH INT parareg[6] from reg[8]
   lw $t0 -28($sp)
   sw $t0 -56($sp)

#------------157  PUSH INT parareg[7] from reg[9]
   lw $t0 -32($sp)
   sw $t0 -60($sp)

#------------158  PUSH INT parareg[8] from reg[10]
   lw $t0 -36($sp)
   sw $t0 -64($sp)

#------------159  CALL INT add(6)
   addi $sp $sp -44
   jal .func_add
   subi $sp $sp -44
   lw $ra -40($sp)

#------------160  FACTOR_FUNC INT add save in reg[11]
   sw $v0 -40($sp)

#------------161  FACTOR_VAR_EXTERN INT i save in reg[12]
   lw $t3 .var_i
   sw $t3 -44($sp)

#------------162  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -48($sp)

#------------163  reg[13] = reg[12] JIA reg[13]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------164  ASSIGN_ARR_EXTERN INT data[reg[11]] = reg[13]
   lw $t0 -40($sp)
   lw $t1 -48($sp)
   sll $t0 $t0 2
   sw $t1 .var_data($t0)

#------------165  FACTOR_VAR_EXTERN INT i save in reg[14]
   lw $t3 .var_i
   sw $t3 -52($sp)

#------------166  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -56($sp)

#------------167  reg[15] = reg[14] JIA reg[15]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------168  ASSIGN_EXTERN INT i = reg[15]
   lw $t3 -56($sp)
   sw $t3 .var_i

#------------169  JUMP to label_10
   j label_10

#------------170  label_11    ----------------Label----------------
label_11:

#------------171  FUNC INT test_for(0)
   jr $ra

.func_test_for:

#------------172  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------173  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -4($sp)

#------------174  reg[2] = reg[1] JIAN reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   sub $t2 $t0 $t1
   sw $t2 -4($sp)

#------------175  ASSIGN_EXTERN INT _abc = reg[2]
   lw $t3 -4($sp)
   sw $t3 .var__abc

#------------176  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -8($sp)

#------------177  ASSIGN_EXTERN INT i = reg[3]
   lw $t3 -8($sp)
   sw $t3 .var_i

#------------178  JUMP to label_13
   j label_13

#------------179  label_12    ----------------Label----------------
label_12:

#------------180  FACTOR_VAR_EXTERN INT i save in reg[4]
   lw $t3 .var_i
   sw $t3 -12($sp)

#------------181  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -16($sp)

#------------182  reg[5] = reg[4] JIA reg[5]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------183  ASSIGN_EXTERN INT i = reg[5]
   lw $t3 -16($sp)
   sw $t3 .var_i

#------------184  FACTOR_VAR_EXTERN INT i save in reg[6]
   lw $t3 .var_i
   sw $t3 -20($sp)

#------------185  FACTOR_VAR_EXTERN INT n save in reg[7]
   lw $t3 .var_n
   sw $t3 -24($sp)

#------------186  IF reg[6] BGEQ reg[7] THEN GOTO label_14
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bge $t0 $t1 label_14

#------------187  label_13    ----------------Label----------------
label_13:

#------------188  FACTOR_VAR_EXTERN INT _abc save in reg[8]
   lw $t3 .var__abc
   sw $t3 -28($sp)

#------------189  FACTOR_VAR_EXTERN INT i save in reg[9]
   lw $t3 .var_i
   sw $t3 -32($sp)

#------------190  FACTOR_ARRAY_EXTERN INT data [reg[9]] save in reg[10]
   lw $t3 -32($sp)
   sll $t3 $t3 2
   lw $t3 .var_data($t3)
   sw $t3 -36($sp)

#------------191  reg[10] = reg[8] JIA reg[10]
   lw $t0 -28($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------192  ASSIGN_EXTERN INT _abc = reg[10]
   lw $t3 -36($sp)
   sw $t3 .var__abc

#------------193  JUMP to label_12
   j label_12

#------------194  label_14    ----------------Label----------------
label_14:

#------------195  FACTOR_VAR_EXTERN INT _abc save in reg[11]
   lw $t3 .var__abc
   sw $t3 -40($sp)

#------------196  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------197  FUNC VOID test_bra_statement(0)
   jr $ra

.func_test_bra_statement:

#------------198  FUNC VOID call_abs(0)
   jr $ra

.func_call_abs:

#------------199  READ_EXTERN INT m
   li $v0 5
   syscall
   sw $v0 .var_m

#------------200  FACTOR_VAR_EXTERN INT m save in reg[1]
   lw $t3 .var_m
   sw $t3 0($sp)

#------------201  PUSH INT parareg[9] from reg[1]
   sw $ra -4($sp)
   lw $t0 0($sp)
   sw $t0 -8($sp)

#------------202  CALL INT getabs(1)
   addi $sp $sp -8
   jal .func_getabs
   subi $sp $sp -8
   lw $ra -4($sp)

#------------203  FACTOR_FUNC INT getabs save in reg[2]
   sw $v0 -4($sp)

#------------204  ASSIGN_EXTERN INT t = reg[2]
   lw $t3 -4($sp)
   sw $t3 .var_t

#------------205  WRITE ...abs is: 
   li $v0 4
   la $a0 .str_2
   syscall

#------------206  FACTOR_VAR_EXTERN INT t save in reg[3]
   lw $t3 .var_t
   sw $t3 -8($sp)

#------------207  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------208  FUNC VOID main(0)
   jr $ra

.func_main:

#------------209  VAR INT a

#------------210  FACTOR_CON INT 99 save in reg[4]
   li $t0 99
   sw $t0 -16($sp)

#------------211  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -20($sp)

#------------212  reg[5] = reg[5] JIAN reg[4]
   lw $t0 -20($sp)
   lw $t1 -16($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------213  ASSIGN INT a = reg[5]
   lw $t3 -20($sp)
   sw $t3 0($sp)

#------------214  FACTOR_CON INT 3 save in reg[6]
   li $t0 3
   sw $t0 -24($sp)

#------------215  ASSIGN_EXTERN INT x = reg[6]
   lw $t3 -24($sp)
   sw $t3 .var_x

#------------216  FACTOR_CON INT 4 save in reg[7]
   li $t0 4
   sw $t0 -28($sp)

#------------217  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -32($sp)

#------------218  reg[8] = reg[8] JIAN reg[7]
   lw $t0 -32($sp)
   lw $t1 -28($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------219  ASSIGN_EXTERN INT y = reg[8]
   lw $t3 -32($sp)
   sw $t3 .var_y

#------------220  FACTOR_CON CHAR 84 save in reg[9]
   li $t0 84
   sw $t0 -36($sp)

#------------221  ASSIGN_EXTERN CHAR c1 = reg[9]
   lw $t3 -36($sp)
   sw $t3 .var_c1

#------------222  FACTOR_VAR_EXTERN INT x save in reg[10]
   lw $t3 .var_x
   sw $t3 -40($sp)

#------------223  FACTOR_VAR_EXTERN INT y save in reg[11]
   lw $t3 .var_y
   sw $t3 -44($sp)

#------------224  reg[11] = reg[10] CHENG reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -44($sp)

#------------225  FACTOR_VAR INT a save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------226  FACTOR_VAR_EXTERN INT x save in reg[13]
   lw $t3 .var_x
   sw $t3 -52($sp)

#------------227  reg[13] = reg[12] CHU reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -52($sp)

#------------228  reg[13] = reg[11] JIA reg[13]
   lw $t0 -44($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------229  FACTOR_VAR_EXTERN INT x save in reg[14]
   lw $t3 .var_x
   sw $t3 -56($sp)

#------------230  FACTOR_VAR_EXTERN INT y save in reg[15]
   lw $t3 .var_y
   sw $t3 -60($sp)

#------------231  reg[15] = reg[14] JIA reg[15]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------232  FACTOR_EXPR reg[15] save in reg[16]
   lw $t0 -60($sp)
   sw $t0 -64($sp)

#------------233  FACTOR_VAR INT a save in reg[17]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------234  reg[17] = reg[16] CHENG reg[17]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -68($sp)

#------------235  reg[17] = reg[13] JIAN reg[17]
   lw $t0 -52($sp)
   lw $t1 -68($sp)
   sub $t2 $t0 $t1
   sw $t2 -68($sp)

#------------236  ASSIGN_EXTERN INT z = reg[17]
   lw $t3 -68($sp)
   sw $t3 .var_z

#------------237  FACTOR_CON CHAR 114 save in reg[18]
   li $t0 114
   sw $t0 -72($sp)

#------------238  PUSH INT parareg[10] from reg[18]
   sw $ra -76($sp)
   lw $t0 -72($sp)
   sw $t0 -80($sp)

#------------239  CALL INT test_chartypetrans(1)
   addi $sp $sp -80
   jal .func_test_chartypetrans
   subi $sp $sp -80
   lw $ra -76($sp)

#------------240  FACTOR_FUNC INT test_chartypetrans save in reg[19]
   sw $v0 -76($sp)

#------------241  ASSIGN_EXTERN INT i = reg[19]
   lw $t3 -76($sp)
   sw $t3 .var_i

#------------242  FACTOR_VAR_EXTERN INT x save in reg[20]
   lw $t3 .var_x
   sw $t3 -80($sp)

#------------243  FACTOR_VAR_EXTERN INT y save in reg[21]
   lw $t3 .var_y
   sw $t3 -84($sp)

#------------244  FACTOR_VAR_EXTERN INT z save in reg[22]
   lw $t3 .var_z
   sw $t3 -88($sp)

#------------245  FACTOR_VAR_EXTERN INT i save in reg[23]
   lw $t3 .var_i
   sw $t3 -92($sp)

#------------246  FACTOR_VAR_EXTERN INT x save in reg[24]
   lw $t3 .var_x
   sw $t3 -96($sp)

#------------247  FACTOR_CON INT 0 save in reg[25]
   li $t0 0
   sw $t0 -100($sp)

#------------248  FACTOR_CON INT 0 save in reg[26]
   li $t0 0
   sw $t0 -104($sp)

#------------249  FACTOR_VAR_EXTERN INT y save in reg[27]
   lw $t3 .var_y
   sw $t3 -108($sp)

#------------250  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -112($sp)

#------------251  FACTOR_CON INT 0 save in reg[29]
   li $t0 0
   sw $t0 -116($sp)

#------------252  PUSH INT parareg[11] from reg[24]
   sw $ra -120($sp)
   lw $t0 -96($sp)
   sw $t0 -124($sp)

#------------253  PUSH INT parareg[12] from reg[25]
   lw $t0 -100($sp)
   sw $t0 -128($sp)

#------------254  PUSH INT parareg[13] from reg[26]
   lw $t0 -104($sp)
   sw $t0 -132($sp)

#------------255  PUSH INT parareg[14] from reg[27]
   lw $t0 -108($sp)
   sw $t0 -136($sp)

#------------256  PUSH INT parareg[15] from reg[28]
   lw $t0 -112($sp)
   sw $t0 -140($sp)

#------------257  PUSH INT parareg[16] from reg[29]
   lw $t0 -116($sp)
   sw $t0 -144($sp)

#------------258  CALL INT add(6)
   addi $sp $sp -124
   jal .func_add
   subi $sp $sp -124
   lw $ra -120($sp)

#------------259  FACTOR_FUNC INT add save in reg[30]
   sw $v0 -120($sp)

#------------260  FACTOR_CON INT 0 save in reg[31]
   li $t0 0
   sw $t0 -124($sp)

#------------261  PUSH INT parareg[17] from reg[20]
   sw $ra -128($sp)
   lw $t0 -80($sp)
   sw $t0 -132($sp)

#------------262  PUSH INT parareg[18] from reg[21]
   lw $t0 -84($sp)
   sw $t0 -136($sp)

#------------263  PUSH INT parareg[19] from reg[22]
   lw $t0 -88($sp)
   sw $t0 -140($sp)

#------------264  PUSH INT parareg[20] from reg[23]
   lw $t0 -92($sp)
   sw $t0 -144($sp)

#------------265  PUSH INT parareg[21] from reg[30]
   lw $t0 -120($sp)
   sw $t0 -148($sp)

#------------266  PUSH INT parareg[22] from reg[31]
   lw $t0 -124($sp)
   sw $t0 -152($sp)

#------------267  CALL INT add(6)
   addi $sp $sp -132
   jal .func_add
   subi $sp $sp -132
   lw $ra -128($sp)

#------------268  FACTOR_FUNC INT add save in reg[32]
   sw $v0 -128($sp)

#------------269  ASSIGN_EXTERN INT t = reg[32]
   lw $t3 -128($sp)
   sw $t3 .var_t

#------------270  FACTOR_VAR_EXTERN INT t save in reg[33]
   lw $t3 .var_t
   sw $t3 -132($sp)

#------------271  WRITE INT reg[33]
   li $v0 1
   lw $a0 -132($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------272  CALL VOID test_bra_statement(0)
   sw $ra -136($sp)
   addi $sp $sp -140
   jal .func_test_bra_statement
   subi $sp $sp -140
   lw $ra -136($sp)

#------------273  READ_EXTERN INT n
   li $v0 5
   syscall
   sw $v0 .var_n

#------------274  CALL VOID test_arrayindex(0)
   sw $ra -136($sp)
   addi $sp $sp -140
   jal .func_test_arrayindex
   subi $sp $sp -140
   lw $ra -136($sp)

#------------275  CALL VOID test_arrayassign(0)
   sw $ra -136($sp)
   addi $sp $sp -140
   jal .func_test_arrayassign
   subi $sp $sp -140
   lw $ra -136($sp)

#------------276  FACTOR_VAR_EXTERN INT n save in reg[34]
   lw $t3 .var_n
   sw $t3 -136($sp)

#------------277  FACTOR_CON INT 0 save in reg[35]
   li $t0 0
   sw $t0 -140($sp)

#------------278  IF reg[34] BLEQ reg[35] THEN GOTO label_17
   lw $t0 -136($sp)
   lw $t1 -140($sp)
    ble $t0 $t1 label_17

#------------279  CALL INT test_for(0)
   sw $ra -144($sp)
   addi $sp $sp -148
   jal .func_test_for
   subi $sp $sp -148
   lw $ra -144($sp)

#------------280  FACTOR_FUNC INT test_for save in reg[36]
   sw $v0 -144($sp)

#------------281  FACTOR_VAR_EXTERN INT n save in reg[37]
   lw $t3 .var_n
   sw $t3 -148($sp)

#------------282  FACTOR_VAR_EXTERN INT n save in reg[38]
   lw $t3 .var_n
   sw $t3 -152($sp)

#------------283  FACTOR_CON INT 1 save in reg[39]
   li $t0 1
   sw $t0 -156($sp)

#------------284  reg[39] = reg[38] JIA reg[39]
   lw $t0 -152($sp)
   lw $t1 -156($sp)
   add $t2 $t0 $t1
   sw $t2 -156($sp)

#------------285  FACTOR_EXPR reg[39] save in reg[40]
   lw $t0 -156($sp)
   sw $t0 -160($sp)

#------------286  reg[40] = reg[37] CHENG reg[40]
   lw $t0 -148($sp)
   lw $t1 -160($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -160($sp)

#------------287  FACTOR_CON INT 2 save in reg[41]
   li $t0 2
   sw $t0 -164($sp)

#------------288  reg[41] = reg[40] CHU reg[41]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -164($sp)

#------------289  FACTOR_EXPR reg[41] save in reg[42]
   lw $t0 -164($sp)
   sw $t0 -168($sp)

#------------290  IF reg[36] BNE reg[42] THEN GOTO label_15
   lw $t0 -144($sp)
   lw $t1 -168($sp)
    bne $t0 $t1 label_15

#------------291  WRITE ...for loop work well
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------292  JUMP to label_16
   j label_16

#------------293  label_15    ----------------Label----------------
label_15:

#------------294  WRITE ...for error
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------295  label_16    ----------------Label----------------
label_16:

#------------296  JUMP to label_22
   j label_22

#------------297  label_17    ----------------Label----------------
label_17:

#------------298  FACTOR_VAR_EXTERN INT n save in reg[43]
   lw $t3 .var_n
   sw $t3 -172($sp)

#------------299  FACTOR_CON INT 0 save in reg[44]
   li $t0 0
   sw $t0 -176($sp)

#------------300  IF reg[43] BNE reg[44] THEN GOTO label_20
   lw $t0 -172($sp)
   lw $t1 -176($sp)
    bne $t0 $t1 label_20

#------------301  CALL INT test_for(0)
   sw $ra -180($sp)
   addi $sp $sp -184
   jal .func_test_for
   subi $sp $sp -184
   lw $ra -180($sp)

#------------302  FACTOR_FUNC INT test_for save in reg[45]
   sw $v0 -180($sp)

#------------303  FACTOR_CON INT 1 save in reg[46]
   li $t0 1
   sw $t0 -184($sp)

#------------304  IF reg[45] BNE reg[46] THEN GOTO label_18
   lw $t0 -180($sp)
   lw $t1 -184($sp)
    bne $t0 $t1 label_18

#------------305  WRITE ...for loop work well
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------306  JUMP to label_19
   j label_19

#------------307  label_18    ----------------Label----------------
label_18:

#------------308  WRITE ...for error
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------309  label_19    ----------------Label----------------
label_19:

#------------310  JUMP to label_21
   j label_21

#------------311  label_20    ----------------Label----------------
label_20:

#------------312  label_21    ----------------Label----------------
label_21:

#------------313  label_22    ----------------Label----------------
label_22:

#------------314  CALL VOID call_fibo(0)
   sw $ra -188($sp)
   addi $sp $sp -192
   jal .func_call_fibo
   subi $sp $sp -192
   lw $ra -188($sp)

#------------315  CALL VOID call_abs(0)
   sw $ra -188($sp)
   addi $sp $sp -192
   jal .func_call_abs
   subi $sp $sp -192
   lw $ra -188($sp)

#------------316  FACTOR_CON INT -100 save in reg[47]
   li $t0 -100
   sw $t0 -188($sp)

#------------317  FACTOR_CON INT 0 save in reg[48]
   li $t0 0
   sw $t0 -192($sp)

#------------318  reg[48] = reg[48] JIAN reg[47]
   lw $t0 -192($sp)
   lw $t1 -188($sp)
   sub $t2 $t0 $t1
   sw $t2 -192($sp)

#------------319  ASSIGN_EXTERN INT y = reg[48]
   lw $t3 -192($sp)
   sw $t3 .var_y

#------------320  FACTOR_VAR_EXTERN INT y save in reg[49]
   lw $t3 .var_y
   sw $t3 -196($sp)

#------------321  FACTOR_CON INT 100 save in reg[50]
   li $t0 100
   sw $t0 -200($sp)

#------------322  IF reg[49] BNE reg[50] THEN GOTO label_23
   lw $t0 -196($sp)
   lw $t1 -200($sp)
    bne $t0 $t1 label_23

#------------323  CALL CHAR fool(0)
   sw $ra -204($sp)
   addi $sp $sp -208
   jal .func_fool
   subi $sp $sp -208
   lw $ra -204($sp)

#------------324  FACTOR_FUNC CHAR fool save in reg[51]
   sw $v0 -204($sp)

#------------325  WRITE CHAR reg[51]
   li $v0 11
   lw $a0 -204($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------326  JUMP to label_24
   j label_24

#------------327  label_23    ----------------Label----------------
label_23:

#------------328  label_24    ----------------Label----------------
label_24:

#------------329  CALL VOID test_strelement(0)
   sw $ra -208($sp)
   addi $sp $sp -212
   jal .func_test_strelement
   subi $sp $sp -212
   lw $ra -208($sp)

#------------330  FACTOR_VAR_EXTERN INT n save in reg[52]
   lw $t3 .var_n
   sw $t3 -208($sp)

#------------331  PUSH INT parareg[23] from reg[52]
   sw $ra -212($sp)
   lw $t0 -208($sp)
   sw $t0 -216($sp)

#------------332  CALL INT test_condition(1)
   addi $sp $sp -216
   jal .func_test_condition
   subi $sp $sp -216
   lw $ra -212($sp)

#------------333  FACTOR_FUNC INT test_condition save in reg[53]
   sw $v0 -212($sp)

#------------334  WRITE INT reg[53]
   li $v0 1
   lw $a0 -212($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------335  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

   jr $ra

end:
