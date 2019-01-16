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

#------------23  reg[3] = reg[1] JIA reg[2]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   addu $t2 $t0 $t1
   sw $t2 -32($sp)

#------------24  FACTOR_VAR INT c save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -36($sp)

#------------25  reg[5] = reg[3] JIA reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   addu $t2 $t0 $t1
   sw $t2 -40($sp)

#------------26  FACTOR_VAR INT d save in reg[6]
   lw $t3 -12($sp)
   sw $t3 -44($sp)

#------------27  reg[7] = reg[5] JIA reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   addu $t2 $t0 $t1
   sw $t2 -48($sp)

#------------28  FACTOR_VAR INT e save in reg[8]
   lw $t3 -16($sp)
   sw $t3 -52($sp)

#------------29  reg[9] = reg[7] JIA reg[8]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   addu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------30  FACTOR_VAR INT f save in reg[10]
   lw $t3 -20($sp)
   sw $t3 -60($sp)

#------------31  reg[11] = reg[9] JIA reg[10]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   addu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------32  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -64($sp)
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

#------------58  reg[11] = reg[10] JIAN reg[9]
   lw $t0 -40($sp)
   lw $t1 -36($sp)
   subu $t2 $t0 $t1
   sw $t2 -44($sp)

#------------59  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
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

#------------75  reg[6] = reg[4] JIAN reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   subu $t2 $t0 $t1
   sw $t2 -24($sp)

#------------76  PUSH INT parareg[0] from reg[6]
   sw $ra -28($sp)
   lw $t0 -24($sp)
   sw $t0 -32($sp)

#------------77  CALL INT fibo(1)
   addiu $sp $sp -32
   jal .func_fibo
   subiu $sp $sp -32
   lw $ra -28($sp)

#------------78  FACTOR_FUNC INT fibo save in reg[7]
   sw $v0 -28($sp)

#------------79  FACTOR_VAR INT n save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------80  FACTOR_CON INT 2 save in reg[9]
   li $t0 2
   sw $t0 -36($sp)

#------------81  reg[10] = reg[8] JIAN reg[9]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   subu $t2 $t0 $t1
   sw $t2 -40($sp)

#------------82  PUSH INT parareg[1] from reg[10]
   sw $ra -44($sp)
   lw $t0 -40($sp)
   sw $t0 -48($sp)

#------------83  CALL INT fibo(1)
   addiu $sp $sp -48
   jal .func_fibo
   subiu $sp $sp -48
   lw $ra -44($sp)

#------------84  FACTOR_FUNC INT fibo save in reg[11]
   sw $v0 -44($sp)

#------------85  reg[12] = reg[7] JIA reg[11]
   lw $t0 -28($sp)
   lw $t1 -44($sp)
   addu $t2 $t0 $t1
   sw $t2 -48($sp)

#------------86  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
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

#------------94  reg[3] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   addu $t2 $t0 $t1
   sw $t2 -12($sp)

#------------95  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------96  FUNC INT test_condition(1)
   jr $ra

.func_test_condition:

#------------97  PARA INT x

#------------98  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)



#------------101  FACTOR_CON INT 12 save in reg[4]
   li $t0 12
   sw $t0 -16($sp)

#------------102  reg[5] = reg[1] JIAN reg[4]
   lw $t0 -4($sp)
   lw $t1 -16($sp)
   subu $t2 $t0 $t1
   sw $t2 -20($sp)



#------------105  FACTOR_CON INT 12 save in reg[8]
   li $t0 12
   sw $t0 -32($sp)

#------------106  reg[9] = reg[5] JIA reg[8]
   lw $t0 -20($sp)
   lw $t1 -32($sp)
   addu $t2 $t0 $t1
   sw $t2 -36($sp)

#------------107  IF reg[9] BEQ reg[0] THEN GOTO label_8
   lw $t0 -36($sp)
    beq $t0 $0 label_8

#------------108  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -40($sp)

#------------109  RETURN reg[10] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------110  JUMP to label_9
   j label_9

#------------111  label_8    ----------------Label----------------
label_8:

#------------112  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -44($sp)

#------------113  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
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
   addiu $sp $sp -8
   jal .func_fibo
   subiu $sp $sp -8
   lw $ra -4($sp)

#------------120  FACTOR_FUNC INT fibo save in reg[2]
   sw $v0 -4($sp)

#------------121  ASSIGN_EXTERN INT t = reg[2]
   lw $t3 -4($sp)
   sw $t3 .var_t

#------------122  FACTOR_VAR_EXTERN INT t save in reg[3]
   lw $t3 .var_t
   sw $t3 -8($sp)

#------------123  WRITE ...fibo result is :
   li $v0 4
   la $a0 .str_1
   syscall

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



#------------131  FACTOR_CON INT 5 save in reg[5]
   li $t0 5
   sw $t0 -16($sp)

#------------132  FACTOR_CON INT 200 save in reg[6]
   li $t0 200
   sw $t0 -20($sp)

#------------133  ASSIGN_ARR_EXTERN INT data[reg[5]] = reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sw $t1 .var_data($t0)


#------------135  FACTOR_CON INT 8 save in reg[8]
   li $t0 8
   sw $t0 -28($sp)

#------------136  FACTOR_CON INT 400 save in reg[9]
   li $t0 400
   sw $t0 -32($sp)

#------------137  ASSIGN_ARR_EXTERN INT data[reg[8]] = reg[9]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
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

#------------148  reg[7] = reg[5] JIAN reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   subu $t2 $t0 $t1
   sw $t2 -24($sp)

#------------149  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -28($sp)

#------------150  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -32($sp)

#------------151  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -36($sp)

#------------152  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -40($sp)

#------------153  PUSH INT parareg[3] from reg[4]
   sw $ra -44($sp)
   lw $t0 -12($sp)
   sw $t0 -48($sp)

#------------154  PUSH INT parareg[4] from reg[7]
   lw $t0 -24($sp)
   sw $t0 -52($sp)

#------------155  PUSH INT parareg[5] from reg[8]
   lw $t0 -28($sp)
   sw $t0 -56($sp)

#------------156  PUSH INT parareg[6] from reg[9]
   lw $t0 -32($sp)
   sw $t0 -60($sp)

#------------157  PUSH INT parareg[7] from reg[10]
   lw $t0 -36($sp)
   sw $t0 -64($sp)

#------------158  PUSH INT parareg[8] from reg[11]
   lw $t0 -40($sp)
   sw $t0 -68($sp)

#------------159  CALL INT add(6)
   addiu $sp $sp -48
   jal .func_add
   subiu $sp $sp -48
   lw $ra -44($sp)

#------------160  FACTOR_FUNC INT add save in reg[12]
   sw $v0 -44($sp)

#------------161  FACTOR_VAR_EXTERN INT i save in reg[13]
   lw $t3 .var_i
   sw $t3 -48($sp)

#------------162  FACTOR_CON INT 1 save in reg[14]
   li $t0 1
   sw $t0 -52($sp)

#------------163  reg[15] = reg[13] JIA reg[14]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   addu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------164  ASSIGN_ARR_EXTERN INT data[reg[12]] = reg[15]
   lw $t0 -44($sp)
   lw $t1 -56($sp)
   sll $t0 $t0 2
   sw $t1 .var_data($t0)

#------------165  FACTOR_VAR_EXTERN INT i save in reg[16]
   lw $t3 .var_i
   sw $t3 -60($sp)

#------------166  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -64($sp)

#------------167  reg[18] = reg[16] JIA reg[17]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   addu $t2 $t0 $t1
   sw $t2 -68($sp)

#------------168  ASSIGN_EXTERN INT i = reg[18]
   lw $t3 -68($sp)
   sw $t3 .var_i

#------------169  JUMP to label_10
   j label_10

#------------170  label_11    ----------------Label----------------
label_11:

#------------171  FUNC INT test_for(0)
   jr $ra

.func_test_for:



#------------174  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -8($sp)

#------------175  ASSIGN_EXTERN INT _abc = reg[3]
   lw $t3 -8($sp)
   sw $t3 .var__abc

#------------176  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -12($sp)

#------------177  ASSIGN_EXTERN INT i = reg[4]
   lw $t3 -12($sp)
   sw $t3 .var_i

#------------178  label_12    ----------------Label----------------
label_12:

#------------179  FACTOR_VAR_EXTERN INT _abc save in reg[5]
   lw $t3 .var__abc
   sw $t3 -16($sp)

#------------180  FACTOR_VAR_EXTERN INT i save in reg[6]
   lw $t3 .var_i
   sw $t3 -20($sp)

#------------181  FACTOR_ARRAY_EXTERN INT data [reg[6]] save in reg[7]
   lw $t3 -20($sp)
   sll $t3 $t3 2
   lw $t3 .var_data($t3)
   sw $t3 -24($sp)

#------------182  reg[8] = reg[5] JIA reg[7]
   lw $t0 -16($sp)
   lw $t1 -24($sp)
   addu $t2 $t0 $t1
   sw $t2 -28($sp)

#------------183  ASSIGN_EXTERN INT _abc = reg[8]
   lw $t3 -28($sp)
   sw $t3 .var__abc

#------------184  FACTOR_VAR_EXTERN INT i save in reg[9]
   lw $t3 .var_i
   sw $t3 -32($sp)

#------------185  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -36($sp)

#------------186  reg[11] = reg[9] JIA reg[10]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   addu $t2 $t0 $t1
   sw $t2 -40($sp)

#------------187  ASSIGN_EXTERN INT i = reg[11]
   lw $t3 -40($sp)
   sw $t3 .var_i

#------------188  FACTOR_VAR_EXTERN INT i save in reg[12]
   lw $t3 .var_i
   sw $t3 -44($sp)

#------------189  FACTOR_VAR_EXTERN INT n save in reg[13]
   lw $t3 .var_n
   sw $t3 -48($sp)

#------------190  IF reg[12] BLSS reg[13] THEN GOTO label_12
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    blt $t0 $t1 label_12

#------------191  FACTOR_VAR_EXTERN INT _abc save in reg[14]
   lw $t3 .var__abc
   sw $t3 -52($sp)

#------------192  RETURN reg[14] TO $V0 AND THEN GOTO 0
   lw $v0 -52($sp)
   jr $ra

#------------193  FUNC VOID test_bra_statement(0)
   jr $ra

.func_test_bra_statement:

#------------194  FUNC VOID call_abs(0)
   jr $ra

.func_call_abs:

#------------195  READ_EXTERN INT m
   li $v0 5
   syscall
   sw $v0 .var_m

#------------196  FACTOR_VAR_EXTERN INT m save in reg[1]
   lw $t3 .var_m
   sw $t3 0($sp)

#------------197  PUSH INT parareg[9] from reg[1]
   sw $ra -4($sp)
   lw $t0 0($sp)
   sw $t0 -8($sp)

#------------198  CALL INT getabs(1)
   addiu $sp $sp -8
   jal .func_getabs
   subiu $sp $sp -8
   lw $ra -4($sp)

#------------199  FACTOR_FUNC INT getabs save in reg[2]
   sw $v0 -4($sp)

#------------200  ASSIGN_EXTERN INT t = reg[2]
   lw $t3 -4($sp)
   sw $t3 .var_t

#------------201  FACTOR_VAR_EXTERN INT t save in reg[3]
   lw $t3 .var_t
   sw $t3 -8($sp)

#------------202  WRITE ...abs is: 
   li $v0 4
   la $a0 .str_2
   syscall

#------------203  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------204  FUNC VOID main(0)
   jr $ra

.func_main:

#------------205  VAR INT a



#------------208  FACTOR_CON INT -99 save in reg[6]
   li $t0 -99
   sw $t0 -24($sp)

#------------209  ASSIGN INT a = reg[6]
   lw $t3 -24($sp)
   sw $t3 0($sp)

#------------210  FACTOR_CON INT 3 save in reg[7]
   li $t0 3
   sw $t0 -28($sp)

#------------211  ASSIGN_EXTERN INT x = reg[7]
   lw $t3 -28($sp)
   sw $t3 .var_x



#------------214  FACTOR_CON INT -4 save in reg[10]
   li $t0 -4
   sw $t0 -40($sp)

#------------215  ASSIGN_EXTERN INT y = reg[10]
   lw $t3 -40($sp)
   sw $t3 .var_y

#------------216  FACTOR_CON CHAR 84 save in reg[11]
   li $t0 84
   sw $t0 -44($sp)

#------------217  ASSIGN_EXTERN CHAR c1 = reg[11]
   lw $t3 -44($sp)
   sw $t3 .var_c1

#------------218  FACTOR_VAR_EXTERN INT x save in reg[12]
   lw $t3 .var_x
   sw $t3 -48($sp)

#------------219  FACTOR_VAR_EXTERN INT y save in reg[13]
   lw $t3 .var_y
   sw $t3 -52($sp)

#------------220  reg[14] = reg[12] CHENG reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -56($sp)

#------------221  FACTOR_VAR INT a save in reg[15]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------222  FACTOR_VAR_EXTERN INT x save in reg[16]
   lw $t3 .var_x
   sw $t3 -64($sp)

#------------223  reg[17] = reg[15] CHU reg[16]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -68($sp)

#------------224  reg[18] = reg[14] JIA reg[17]
   lw $t0 -56($sp)
   lw $t1 -68($sp)
   addu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------225  FACTOR_VAR_EXTERN INT x save in reg[19]
   lw $t3 .var_x
   sw $t3 -76($sp)

#------------226  FACTOR_VAR_EXTERN INT y save in reg[20]
   lw $t3 .var_y
   sw $t3 -80($sp)

#------------227  reg[21] = reg[19] JIA reg[20]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   addu $t2 $t0 $t1
   sw $t2 -84($sp)

#------------228  FACTOR_EXPR reg[21] save in reg[22]
   lw $t0 -84($sp)
   sw $t0 -88($sp)

#------------229  FACTOR_VAR INT a save in reg[23]
   lw $t3 0($sp)
   sw $t3 -92($sp)

#------------230  reg[24] = reg[22] CHENG reg[23]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -96($sp)

#------------231  reg[25] = reg[18] JIAN reg[24]
   lw $t0 -72($sp)
   lw $t1 -96($sp)
   subu $t2 $t0 $t1
   sw $t2 -100($sp)

#------------232  ASSIGN_EXTERN INT z = reg[25]
   lw $t3 -100($sp)
   sw $t3 .var_z

#------------233  FACTOR_CON CHAR 114 save in reg[26]
   li $t0 114
   sw $t0 -104($sp)

#------------234  PUSH INT parareg[10] from reg[26]
   sw $ra -108($sp)
   lw $t0 -104($sp)
   sw $t0 -112($sp)

#------------235  CALL INT test_chartypetrans(1)
   addiu $sp $sp -112
   jal .func_test_chartypetrans
   subiu $sp $sp -112
   lw $ra -108($sp)

#------------236  FACTOR_FUNC INT test_chartypetrans save in reg[27]
   sw $v0 -108($sp)

#------------237  ASSIGN_EXTERN INT i = reg[27]
   lw $t3 -108($sp)
   sw $t3 .var_i

#------------238  FACTOR_VAR_EXTERN INT x save in reg[28]
   lw $t3 .var_x
   sw $t3 -112($sp)

#------------239  FACTOR_VAR_EXTERN INT y save in reg[29]
   lw $t3 .var_y
   sw $t3 -116($sp)

#------------240  FACTOR_VAR_EXTERN INT z save in reg[30]
   lw $t3 .var_z
   sw $t3 -120($sp)

#------------241  FACTOR_VAR_EXTERN INT i save in reg[31]
   lw $t3 .var_i
   sw $t3 -124($sp)

#------------242  FACTOR_VAR_EXTERN INT x save in reg[32]
   lw $t3 .var_x
   sw $t3 -128($sp)

#------------243  FACTOR_CON INT 0 save in reg[33]
   li $t0 0
   sw $t0 -132($sp)

#------------244  FACTOR_CON INT 0 save in reg[34]
   li $t0 0
   sw $t0 -136($sp)

#------------245  FACTOR_VAR_EXTERN INT y save in reg[35]
   lw $t3 .var_y
   sw $t3 -140($sp)

#------------246  FACTOR_CON INT 0 save in reg[36]
   li $t0 0
   sw $t0 -144($sp)

#------------247  FACTOR_CON INT 0 save in reg[37]
   li $t0 0
   sw $t0 -148($sp)

#------------248  PUSH INT parareg[11] from reg[32]
   sw $ra -152($sp)
   lw $t0 -128($sp)
   sw $t0 -156($sp)

#------------249  PUSH INT parareg[12] from reg[33]
   lw $t0 -132($sp)
   sw $t0 -160($sp)

#------------250  PUSH INT parareg[13] from reg[34]
   lw $t0 -136($sp)
   sw $t0 -164($sp)

#------------251  PUSH INT parareg[14] from reg[35]
   lw $t0 -140($sp)
   sw $t0 -168($sp)

#------------252  PUSH INT parareg[15] from reg[36]
   lw $t0 -144($sp)
   sw $t0 -172($sp)

#------------253  PUSH INT parareg[16] from reg[37]
   lw $t0 -148($sp)
   sw $t0 -176($sp)

#------------254  CALL INT add(6)
   addiu $sp $sp -156
   jal .func_add
   subiu $sp $sp -156
   lw $ra -152($sp)

#------------255  FACTOR_FUNC INT add save in reg[38]
   sw $v0 -152($sp)

#------------256  FACTOR_CON INT 0 save in reg[39]
   li $t0 0
   sw $t0 -156($sp)

#------------257  PUSH INT parareg[17] from reg[28]
   sw $ra -160($sp)
   lw $t0 -112($sp)
   sw $t0 -164($sp)

#------------258  PUSH INT parareg[18] from reg[29]
   lw $t0 -116($sp)
   sw $t0 -168($sp)

#------------259  PUSH INT parareg[19] from reg[30]
   lw $t0 -120($sp)
   sw $t0 -172($sp)

#------------260  PUSH INT parareg[20] from reg[31]
   lw $t0 -124($sp)
   sw $t0 -176($sp)

#------------261  PUSH INT parareg[21] from reg[38]
   lw $t0 -152($sp)
   sw $t0 -180($sp)

#------------262  PUSH INT parareg[22] from reg[39]
   lw $t0 -156($sp)
   sw $t0 -184($sp)

#------------263  CALL INT add(6)
   addiu $sp $sp -164
   jal .func_add
   subiu $sp $sp -164
   lw $ra -160($sp)

#------------264  FACTOR_FUNC INT add save in reg[40]
   sw $v0 -160($sp)

#------------265  ASSIGN_EXTERN INT t = reg[40]
   lw $t3 -160($sp)
   sw $t3 .var_t

#------------266  FACTOR_VAR_EXTERN INT t save in reg[41]
   lw $t3 .var_t
   sw $t3 -164($sp)

#------------267  WRITE INT reg[41]
   li $v0 1
   lw $a0 -164($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------268  CALL VOID test_bra_statement(0)
   sw $ra -168($sp)
   addiu $sp $sp -172
   jal .func_test_bra_statement
   subiu $sp $sp -172
   lw $ra -168($sp)

#------------269  READ_EXTERN INT n
   li $v0 5
   syscall
   sw $v0 .var_n

#------------270  CALL VOID test_arrayindex(0)
   sw $ra -168($sp)
   addiu $sp $sp -172
   jal .func_test_arrayindex
   subiu $sp $sp -172
   lw $ra -168($sp)

#------------271  CALL VOID test_arrayassign(0)
   sw $ra -168($sp)
   addiu $sp $sp -172
   jal .func_test_arrayassign
   subiu $sp $sp -172
   lw $ra -168($sp)

#------------272  FACTOR_VAR_EXTERN INT n save in reg[42]
   lw $t3 .var_n
   sw $t3 -168($sp)

#------------273  FACTOR_CON INT 0 save in reg[43]
   li $t0 0
   sw $t0 -172($sp)

#------------274  IF reg[42] BLEQ reg[43] THEN GOTO label_15
   lw $t0 -168($sp)
   lw $t1 -172($sp)
    ble $t0 $t1 label_15

#------------275  CALL INT test_for(0)
   sw $ra -176($sp)
   addiu $sp $sp -180
   jal .func_test_for
   subiu $sp $sp -180
   lw $ra -176($sp)

#------------276  FACTOR_FUNC INT test_for save in reg[44]
   sw $v0 -176($sp)

#------------277  FACTOR_VAR_EXTERN INT n save in reg[45]
   lw $t3 .var_n
   sw $t3 -180($sp)

#------------278  FACTOR_VAR_EXTERN INT n save in reg[46]
   lw $t3 .var_n
   sw $t3 -184($sp)

#------------279  FACTOR_CON INT 1 save in reg[47]
   li $t0 1
   sw $t0 -188($sp)

#------------280  reg[48] = reg[46] JIA reg[47]
   lw $t0 -184($sp)
   lw $t1 -188($sp)
   addu $t2 $t0 $t1
   sw $t2 -192($sp)

#------------281  FACTOR_EXPR reg[48] save in reg[49]
   lw $t0 -192($sp)
   sw $t0 -196($sp)

#------------282  reg[50] = reg[45] CHENG reg[49]
   lw $t0 -180($sp)
   lw $t1 -196($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -200($sp)

#------------283  FACTOR_CON INT 2 save in reg[51]
   li $t0 2
   sw $t0 -204($sp)

#------------284  reg[52] = reg[50] CHU reg[51]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -208($sp)

#------------285  FACTOR_EXPR reg[52] save in reg[53]
   lw $t0 -208($sp)
   sw $t0 -212($sp)

#------------286  IF reg[44] BNE reg[53] THEN GOTO label_13
   lw $t0 -176($sp)
   lw $t1 -212($sp)
    bne $t0 $t1 label_13

#------------287  WRITE ...for loop work well
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------288  JUMP to label_14
   j label_14

#------------289  label_13    ----------------Label----------------
label_13:

#------------290  WRITE ...for error
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------291  label_14    ----------------Label----------------
label_14:

#------------292  JUMP to label_20
   j label_20

#------------293  label_15    ----------------Label----------------
label_15:

#------------294  FACTOR_VAR_EXTERN INT n save in reg[54]
   lw $t3 .var_n
   sw $t3 -216($sp)

#------------295  FACTOR_CON INT 0 save in reg[55]
   li $t0 0
   sw $t0 -220($sp)

#------------296  IF reg[54] BNE reg[55] THEN GOTO label_18
   lw $t0 -216($sp)
   lw $t1 -220($sp)
    bne $t0 $t1 label_18

#------------297  CALL INT test_for(0)
   sw $ra -224($sp)
   addiu $sp $sp -228
   jal .func_test_for
   subiu $sp $sp -228
   lw $ra -224($sp)

#------------298  FACTOR_FUNC INT test_for save in reg[56]
   sw $v0 -224($sp)

#------------299  FACTOR_CON INT 1 save in reg[57]
   li $t0 1
   sw $t0 -228($sp)

#------------300  IF reg[56] BNE reg[57] THEN GOTO label_16
   lw $t0 -224($sp)
   lw $t1 -228($sp)
    bne $t0 $t1 label_16

#------------301  WRITE ...for loop work well
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------302  JUMP to label_17
   j label_17

#------------303  label_16    ----------------Label----------------
label_16:

#------------304  WRITE ...for error
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------305  label_17    ----------------Label----------------
label_17:

#------------306  JUMP to label_19
   j label_19

#------------307  label_18    ----------------Label----------------
label_18:

#------------308  label_19    ----------------Label----------------
label_19:

#------------309  label_20    ----------------Label----------------
label_20:

#------------310  CALL VOID call_fibo(0)
   sw $ra -232($sp)
   addiu $sp $sp -236
   jal .func_call_fibo
   subiu $sp $sp -236
   lw $ra -232($sp)

#------------311  CALL VOID call_abs(0)
   sw $ra -232($sp)
   addiu $sp $sp -236
   jal .func_call_abs
   subiu $sp $sp -236
   lw $ra -232($sp)



#------------314  FACTOR_CON INT 100 save in reg[60]
   li $t0 100
   sw $t0 -240($sp)

#------------315  ASSIGN_EXTERN INT y = reg[60]
   lw $t3 -240($sp)
   sw $t3 .var_y

#------------316  FACTOR_VAR_EXTERN INT y save in reg[61]
   lw $t3 .var_y
   sw $t3 -244($sp)

#------------317  FACTOR_CON INT 100 save in reg[62]
   li $t0 100
   sw $t0 -248($sp)

#------------318  IF reg[61] BNE reg[62] THEN GOTO label_21
   lw $t0 -244($sp)
   lw $t1 -248($sp)
    bne $t0 $t1 label_21

#------------319  CALL CHAR fool(0)
   sw $ra -252($sp)
   addiu $sp $sp -256
   jal .func_fool
   subiu $sp $sp -256
   lw $ra -252($sp)

#------------320  FACTOR_FUNC CHAR fool save in reg[63]
   sw $v0 -252($sp)

#------------321  WRITE CHAR reg[63]
   li $v0 11
   lw $a0 -252($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------322  JUMP to label_22
   j label_22

#------------323  label_21    ----------------Label----------------
label_21:

#------------324  label_22    ----------------Label----------------
label_22:

#------------325  CALL VOID test_strelement(0)
   sw $ra -256($sp)
   addiu $sp $sp -260
   jal .func_test_strelement
   subiu $sp $sp -260
   lw $ra -256($sp)

#------------326  FACTOR_VAR_EXTERN INT n save in reg[64]
   lw $t3 .var_n
   sw $t3 -256($sp)

#------------327  PUSH INT parareg[23] from reg[64]
   sw $ra -260($sp)
   lw $t0 -256($sp)
   sw $t0 -264($sp)

#------------328  CALL INT test_condition(1)
   addiu $sp $sp -264
   jal .func_test_condition
   subiu $sp $sp -264
   lw $ra -260($sp)

#------------329  FACTOR_FUNC INT test_condition save in reg[65]
   sw $v0 -260($sp)

#------------330  WRITE INT reg[65]
   li $v0 1
   lw $a0 -260($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------331  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

   jr $ra

end:
