.data
   .var_var2: .word 0
   .var_var3: .word 0
   .var_varray: .space 40
   .var_var5: .word 0
   .var_var6: .word 0
   .var_varraychar: .space 80
   .var_var1: .word 0
   .var_var4: .word 0
   .str_0: .asciiz "for test"
   .str_1: .asciiz "for test finished"
   .str_2: .asciiz "exptest begin,please input a int and a char"
   .str_3: .asciiz "while test"
   .str_4: .asciiz "while test finished"
   .str_5: .asciiz "this is calltest3"
   .str_6: .asciiz "this is calltest2"
   .str_7: .asciiz "this is calltest1"
   .str_8: .asciiz "test is starting"
   .str_9: .asciiz "add test:"
   .str_10: .asciiz "add result: 10+20="
   .str_11: .asciiz "exptest result:"
   .str_12: .asciiz "array test"
   .str_13: .asciiz "array test result:"
   .str_14: .asciiz "recursion test,please input a fib number"
   .str_15: .asciiz "fibnum is too big"
   .str_16: .asciiz "fibnum is too small"
   .str_17: .asciiz "fib result is:"
   .str_18: .asciiz "loop test beign"
   .str_19: .asciiz "loop test finished"
   .str_20: .asciiz "if test begin"
   .str_21: .asciiz "error"
   .str_22: .asciiz "correct"
   .str_23: .asciiz "please input: 'a'"
   .str_24: .asciiz "your input is correct!"
   .str_25: .asciiz "error!"
   .str_26: .asciiz "string test"
   .str_27: .asciiz "! #$%&'()*+,-./0123456789:;<=>?@ABCXYZabcxyz[\\]^_{|}~"
   .str_28: .asciiz "string test finished"
   .str_29: .asciiz "char test"
   .str_30: .asciiz "call test"
   .str_31: .asciiz "call test finished"
   .str_32: .asciiz "TEST IS OVER!"
.text
   jal .func_main
   j end
#------------16  FUNC INT add(2)
.func_add:

#------------17  PARA INT a

#------------18  PARA INT b

#------------19  CONST INT var1 = 1

#------------20  VAR INT c

#------------21  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------22  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -16($sp)

#------------23  reg[3] = reg[1] JIA reg[2]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   addu $t2 $t0 $t1
   sw $t2 -20($sp)

#------------24  ASSIGN INT c = reg[3]
   lw $t3 -20($sp)
   sw $t3 -8($sp)

#------------25  FACTOR_VAR INT c save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -24($sp)

#------------26  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -28($sp)

#------------27  reg[6] = reg[4] CHENG reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -32($sp)

#------------28  ASSIGN INT c = reg[6]
   lw $t3 -32($sp)
   sw $t3 -8($sp)

#------------29  FACTOR_VAR INT c save in reg[7]
   lw $t3 -8($sp)
   sw $t3 -36($sp)

#------------30  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------31  FUNC VOID fortest(0)
   jr $ra

.func_fortest:

#------------32  VAR INT i

#------------33  WRITE for test
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------34  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------35  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------36  label_0    ----------------Label----------------
label_0:

#------------37  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------38  WRITE INT reg[2]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------39  FACTOR_VAR INT i save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------40  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -16($sp)

#------------41  reg[5] = reg[3] JIA reg[4]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   addu $t2 $t0 $t1
   sw $t2 -20($sp)

#------------42  ASSIGN INT i = reg[5]
   lw $t3 -20($sp)
   sw $t3 0($sp)

#------------43  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------44  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -28($sp)

#------------45  IF reg[6] BLEQ reg[7] THEN GOTO label_0
   lw $t0 -24($sp)
   lw $t1 -28($sp)
    ble $t0 $t1 label_0

#------------46  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -32($sp)

#------------47  ASSIGN INT i = reg[8]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------48  label_1    ----------------Label----------------
label_1:

#------------49  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------50  WRITE INT reg[9]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------51  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------52  FACTOR_CON INT 5 save in reg[11]
   li $t0 5
   sw $t0 -44($sp)

#------------53  reg[12] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   subu $t2 $t0 $t1
   sw $t2 -48($sp)

#------------54  ASSIGN INT i = reg[12]
   lw $t3 -48($sp)
   sw $t3 0($sp)

#------------55  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -52($sp)

#------------56  IF reg[13] BNE reg[0] THEN GOTO label_1
   lw $t0 -52($sp)
    bne $t0 $0 label_1

#------------57  FACTOR_CON INT 10 save in reg[14]
   li $t0 10
   sw $t0 -56($sp)

#------------58  ASSIGN INT i = reg[14]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------59  label_2    ----------------Label----------------
label_2:

#------------60  FACTOR_VAR INT i save in reg[15]
   lw $t3 0($sp)
   sw $t3 -60($sp)

#------------61  WRITE INT reg[15]
   li $v0 1
   lw $a0 -60($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------62  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------63  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -68($sp)

#------------64  reg[18] = reg[16] JIAN reg[17]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   subu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------65  ASSIGN INT i = reg[18]
   lw $t3 -72($sp)
   sw $t3 0($sp)

#------------66  FACTOR_VAR INT i save in reg[19]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------67  FACTOR_CON INT 0 save in reg[20]
   li $t0 0
   sw $t0 -80($sp)

#------------68  IF reg[19] BGEQ reg[20] THEN GOTO label_2
   lw $t0 -76($sp)
   lw $t1 -80($sp)
    bge $t0 $t1 label_2

#------------69  WRITE for test finished
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------70  FUNC INT exptest(0)
   jr $ra

.func_exptest:

#------------71  VAR INT a

#------------72  VAR INT c

#------------73  VAR CHAR b

#------------74  WRITE exptest begin,please input a int and a char
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------75  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------76  READ CHAR b
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------77  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -12($sp)






#------------83  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -36($sp)

#------------84  reg[8] = reg[1] CHENG reg[7]
   lw $t0 -12($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -40($sp)

#------------85  FACTOR_CON INT 5 save in reg[9]
   li $t0 5
   sw $t0 -44($sp)

#------------86  reg[10] = reg[8] CHU reg[9]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -48($sp)

#------------87  ASSIGN INT a = reg[10]
   lw $t3 -48($sp)
   sw $t3 0($sp)



#------------90  FACTOR_CON INT -97 save in reg[13]
   li $t0 -97
   sw $t0 -60($sp)

#------------91  FACTOR_VAR CHAR b save in reg[14]
   lw $t3 -8($sp)
   sw $t3 -64($sp)

#------------92  reg[15] = reg[13] JIA reg[14]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   addu $t2 $t0 $t1
   sw $t2 -68($sp)

#------------93  ASSIGN INT c = reg[15]
   lw $t3 -68($sp)
   sw $t3 -4($sp)

#------------94  FACTOR_VAR INT a save in reg[16]
   lw $t3 0($sp)
   sw $t3 -72($sp)

#------------95  WRITE INT reg[16]
   li $v0 1
   lw $a0 -72($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------96  FACTOR_VAR INT c save in reg[17]
   lw $t3 -4($sp)
   sw $t3 -76($sp)

#------------97  WRITE INT reg[17]
   li $v0 1
   lw $a0 -76($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------98  FACTOR_VAR INT c save in reg[18]
   lw $t3 -4($sp)
   sw $t3 -80($sp)

#------------99  FACTOR_VAR CHAR b save in reg[19]
   lw $t3 -8($sp)
   sw $t3 -84($sp)

#------------100  reg[20] = reg[18] JIA reg[19]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   addu $t2 $t0 $t1
   sw $t2 -88($sp)

#------------101  RETURN reg[20] TO $V0 AND THEN GOTO 0
   lw $v0 -88($sp)
   jr $ra

#------------102  FUNC INT arraytest(0)
   jr $ra

.func_arraytest:

#------------103  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------104  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------105  ASSIGN_ARR_EXTERN INT varray[reg[1]] = reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------106  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------107  FACTOR_CON INT 2 save in reg[4]
   li $t0 2
   sw $t0 -12($sp)

#------------108  ASSIGN_ARR_EXTERN INT varray[reg[3]] = reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------109  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -16($sp)

#------------110  FACTOR_CON INT 3 save in reg[6]
   li $t0 3
   sw $t0 -20($sp)

#------------111  ASSIGN_ARR_EXTERN INT varray[reg[5]] = reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------112  FACTOR_CON INT 3 save in reg[7]
   li $t0 3
   sw $t0 -24($sp)

#------------113  FACTOR_CON INT 4 save in reg[8]
   li $t0 4
   sw $t0 -28($sp)

#------------114  ASSIGN_ARR_EXTERN INT varray[reg[7]] = reg[8]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------115  FACTOR_CON INT 4 save in reg[9]
   li $t0 4
   sw $t0 -32($sp)

#------------116  FACTOR_CON INT 5 save in reg[10]
   li $t0 5
   sw $t0 -36($sp)

#------------117  ASSIGN_ARR_EXTERN INT varray[reg[9]] = reg[10]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   sll $t0 $t0 2
   sw $t1 .var_varray($t0)

#------------118  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -40($sp)

#------------119  FACTOR_ARRAY_EXTERN INT varray [reg[11]] save in reg[12]
   lw $t3 -40($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -44($sp)

#------------120  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -48($sp)

#------------121  FACTOR_ARRAY_EXTERN INT varray [reg[13]] save in reg[14]
   lw $t3 -48($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -52($sp)

#------------122  FACTOR_ARRAY_EXTERN INT varray [reg[14]] save in reg[15]
   lw $t3 -52($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -56($sp)

#------------123  reg[16] = reg[12] JIA reg[15]
   lw $t0 -44($sp)
   lw $t1 -56($sp)
   addu $t2 $t0 $t1
   sw $t2 -60($sp)

#------------124  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -64($sp)

#------------125  FACTOR_ARRAY_EXTERN INT varray [reg[17]] save in reg[18]
   lw $t3 -64($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -68($sp)

#------------126  reg[19] = reg[16] JIA reg[18]
   lw $t0 -60($sp)
   lw $t1 -68($sp)
   addu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------127  FACTOR_CON INT 3 save in reg[20]
   li $t0 3
   sw $t0 -76($sp)

#------------128  FACTOR_ARRAY_EXTERN INT varray [reg[20]] save in reg[21]
   lw $t3 -76($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -80($sp)

#------------129  reg[22] = reg[19] JIA reg[21]
   lw $t0 -72($sp)
   lw $t1 -80($sp)
   addu $t2 $t0 $t1
   sw $t2 -84($sp)

#------------130  FACTOR_EXPR reg[22] save in reg[23]
   lw $t0 -84($sp)
   sw $t0 -88($sp)

#------------131  FACTOR_CON INT 4 save in reg[24]
   li $t0 4
   sw $t0 -92($sp)

#------------132  FACTOR_ARRAY_EXTERN INT varray [reg[24]] save in reg[25]
   lw $t3 -92($sp)
   sll $t3 $t3 2
   lw $t3 .var_varray($t3)
   sw $t3 -96($sp)

#------------133  reg[26] = reg[23] CHENG reg[25]
   lw $t0 -88($sp)
   lw $t1 -96($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -100($sp)

#------------134  RETURN reg[26] TO $V0 AND THEN GOTO 0
   lw $v0 -100($sp)
   jr $ra

#------------135  FUNC INT fib(1)
   jr $ra

.func_fib:

#------------136  PARA INT a

#------------137  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------138  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------139  IF reg[1] BNE reg[2] THEN GOTO label_3
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_3

#------------140  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------141  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------142  JUMP to label_4
   j label_4

#------------143  label_3    ----------------Label----------------
label_3:

#------------144  label_4    ----------------Label----------------
label_4:

#------------145  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------146  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -20($sp)

#------------147  IF reg[4] BNE reg[5] THEN GOTO label_5
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_5

#------------148  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------149  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------150  JUMP to label_6
   j label_6

#------------151  label_5    ----------------Label----------------
label_5:

#------------152  label_6    ----------------Label----------------
label_6:

#------------153  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------154  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -32($sp)

#------------155  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   subu $t2 $t0 $t1
   sw $t2 -36($sp)

#------------156  PUSH INT parareg[0] from reg[9]
   sw $ra -40($sp)
   lw $t0 -36($sp)
   sw $t0 -44($sp)

#------------157  CALL INT fib(1)
   addiu $sp $sp -44
   jal .func_fib
   subiu $sp $sp -44
   lw $ra -40($sp)

#------------158  FACTOR_FUNC INT fib save in reg[10]
   sw $v0 -40($sp)

#------------159  FACTOR_VAR INT a save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------160  FACTOR_CON INT 2 save in reg[12]
   li $t0 2
   sw $t0 -48($sp)

#------------161  reg[13] = reg[11] JIAN reg[12]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   subu $t2 $t0 $t1
   sw $t2 -52($sp)

#------------162  PUSH INT parareg[1] from reg[13]
   sw $ra -56($sp)
   lw $t0 -52($sp)
   sw $t0 -60($sp)

#------------163  CALL INT fib(1)
   addiu $sp $sp -60
   jal .func_fib
   subiu $sp $sp -60
   lw $ra -56($sp)

#------------164  FACTOR_FUNC INT fib save in reg[14]
   sw $v0 -56($sp)

#------------165  reg[15] = reg[10] JIA reg[14]
   lw $t0 -40($sp)
   lw $t1 -56($sp)
   addu $t2 $t0 $t1
   sw $t2 -60($sp)

#------------166  RETURN reg[15] TO $V0 AND THEN GOTO 0
   lw $v0 -60($sp)
   jr $ra

#------------167  FUNC VOID whiletest(1)
   jr $ra

.func_whiletest:

#------------168  PARA INT a

#------------169  WRITE while test
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------170  label_7    ----------------Label----------------
label_7:

#------------171  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------172  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------173  IF reg[1] BLEQ reg[2] THEN GOTO label_8
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    ble $t0 $t1 label_8

#------------174  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------175  WRITE INT reg[3]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------176  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------177  FACTOR_CON INT 3 save in reg[5]
   li $t0 3
   sw $t0 -20($sp)

#------------178  reg[6] = reg[4] JIAN reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   subu $t2 $t0 $t1
   sw $t2 -24($sp)

#------------179  ASSIGN INT a = reg[6]
   lw $t3 -24($sp)
   sw $t3 0($sp)

#------------180  JUMP to label_7
   j label_7

#------------181  label_8    ----------------Label----------------
label_8:

#------------182  label_9    ----------------Label----------------
label_9:

#------------183  FACTOR_CON INT 15 save in reg[7]
   li $t0 15
   sw $t0 -28($sp)

#------------184  FACTOR_VAR INT a save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------185  IF reg[7] BLEQ reg[8] THEN GOTO label_10
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    ble $t0 $t1 label_10

#------------186  FACTOR_VAR INT a save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------187  WRITE INT reg[9]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------188  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------189  FACTOR_CON INT 5 save in reg[11]
   li $t0 5
   sw $t0 -44($sp)

#------------190  reg[12] = reg[10] JIA reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   addu $t2 $t0 $t1
   sw $t2 -48($sp)

#------------191  ASSIGN INT a = reg[12]
   lw $t3 -48($sp)
   sw $t3 0($sp)

#------------192  JUMP to label_9
   j label_9

#------------193  label_10    ----------------Label----------------
label_10:

#------------194  WRITE while test finished
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------195  FUNC VOID calltest3(4)
   jr $ra

.func_calltest3:

#------------196  PARA CHAR a

#------------197  PARA CHAR b

#------------198  PARA CHAR c

#------------199  PARA CHAR d

#------------200  FACTOR_VAR CHAR a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------201  WRITE CHAR reg[1]
   li $v0 11
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------202  FACTOR_VAR CHAR b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------203  WRITE CHAR reg[2]
   li $v0 11
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------204  FACTOR_VAR CHAR c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -24($sp)

#------------205  WRITE CHAR reg[3]
   li $v0 11
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------206  FACTOR_VAR CHAR d save in reg[4]
   lw $t3 -12($sp)
   sw $t3 -28($sp)

#------------207  WRITE CHAR reg[4]
   li $v0 11
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------208  WRITE this is calltest3
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------209  FUNC VOID calltest2(0)
   jr $ra

.func_calltest2:

#------------210  FACTOR_CON CHAR 97 save in reg[1]
   li $t0 97
   sw $t0 0($sp)

#------------211  FACTOR_CON CHAR 42 save in reg[2]
   li $t0 42
   sw $t0 -4($sp)

#------------212  FACTOR_CON CHAR 43 save in reg[3]
   li $t0 43
   sw $t0 -8($sp)

#------------213  FACTOR_CON CHAR 56 save in reg[4]
   li $t0 56
   sw $t0 -12($sp)

#------------214  PUSH INT parareg[2] from reg[1]
   sw $ra -16($sp)
   lw $t0 0($sp)
   sw $t0 -20($sp)

#------------215  PUSH INT parareg[3] from reg[2]
   lw $t0 -4($sp)
   sw $t0 -24($sp)

#------------216  PUSH INT parareg[4] from reg[3]
   lw $t0 -8($sp)
   sw $t0 -28($sp)

#------------217  PUSH INT parareg[5] from reg[4]
   lw $t0 -12($sp)
   sw $t0 -32($sp)

#------------218  CALL VOID calltest3(4)
   addiu $sp $sp -20
   jal .func_calltest3
   subiu $sp $sp -20
   lw $ra -16($sp)

#------------219  WRITE this is calltest2
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------220  FUNC INT calltest1(0)
   jr $ra

.func_calltest1:

#------------221  WRITE this is calltest1
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------222  CALL VOID calltest2(0)
   sw $ra 0($sp)
   addiu $sp $sp -4
   jal .func_calltest2
   subiu $sp $sp -4
   lw $ra 0($sp)

#------------223  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------224  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------225  FUNC CHAR chartest(0)
   jr $ra

.func_chartest:

#------------226  FACTOR_CON CHAR 72 save in reg[1]
   li $t0 72
   sw $t0 0($sp)

#------------227  WRITE CHAR reg[1]
   li $v0 11
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------228  FACTOR_CON CHAR 69 save in reg[2]
   li $t0 69
   sw $t0 -4($sp)

#------------229  WRITE CHAR reg[2]
   li $v0 11
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------230  FACTOR_CON CHAR 76 save in reg[3]
   li $t0 76
   sw $t0 -8($sp)

#------------231  WRITE CHAR reg[3]
   li $v0 11
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------232  FACTOR_CON CHAR 76 save in reg[4]
   li $t0 76
   sw $t0 -12($sp)

#------------233  WRITE CHAR reg[4]
   li $v0 11
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------234  FACTOR_CON CHAR 79 save in reg[5]
   li $t0 79
   sw $t0 -16($sp)

#------------235  WRITE CHAR reg[5]
   li $v0 11
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------236  FACTOR_CON CHAR 87 save in reg[6]
   li $t0 87
   sw $t0 -20($sp)

#------------237  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------238  FUNC VOID main(0)
   jr $ra

.func_main:

#------------239  VAR INT result

#------------240  VAR INT fibnum

#------------241  VAR CHAR cc

#------------242  WRITE test is starting
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------243  WRITE add test:
   li $v0 4
   la $a0 .str_9
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------244  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -36($sp)

#------------245  FACTOR_CON INT 20 save in reg[8]
   li $t0 20
   sw $t0 -40($sp)

#------------246  PUSH INT parareg[6] from reg[7]
   sw $ra -44($sp)
   lw $t0 -36($sp)
   sw $t0 -48($sp)

#------------247  PUSH INT parareg[7] from reg[8]
   lw $t0 -40($sp)
   sw $t0 -52($sp)

#------------248  CALL INT add(2)
   addiu $sp $sp -48
   jal .func_add
   subiu $sp $sp -48
   lw $ra -44($sp)

#------------249  FACTOR_FUNC INT add save in reg[9]
   sw $v0 -44($sp)

#------------250  ASSIGN INT result = reg[9]
   lw $t3 -44($sp)
   sw $t3 0($sp)

#------------251  FACTOR_VAR INT result save in reg[10]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------252  WRITE add result: 10+20=
   li $v0 4
   la $a0 .str_10
   syscall

#------------253  WRITE INT reg[10]
   li $v0 1
   lw $a0 -48($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------254  CALL INT exptest(0)
   sw $ra -52($sp)
   addiu $sp $sp -56
   jal .func_exptest
   subiu $sp $sp -56
   lw $ra -52($sp)

#------------255  FACTOR_FUNC INT exptest save in reg[11]
   sw $v0 -52($sp)

#------------256  WRITE exptest result:
   li $v0 4
   la $a0 .str_11
   syscall

#------------257  WRITE INT reg[11]
   li $v0 1
   lw $a0 -52($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------258  WRITE array test
   li $v0 4
   la $a0 .str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------259  CALL INT arraytest(0)
   sw $ra -56($sp)
   addiu $sp $sp -60
   jal .func_arraytest
   subiu $sp $sp -60
   lw $ra -56($sp)

#------------260  FACTOR_FUNC INT arraytest save in reg[12]
   sw $v0 -56($sp)

#------------261  FACTOR_CON INT 5 save in reg[13]
   li $t0 5
   sw $t0 -60($sp)

#------------262  reg[14] = reg[12] JIA reg[13]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   addu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------263  ASSIGN INT result = reg[14]
   lw $t3 -64($sp)
   sw $t3 0($sp)

#------------264  FACTOR_VAR INT result save in reg[15]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------265  WRITE array test result:
   li $v0 4
   la $a0 .str_13
   syscall

#------------266  WRITE INT reg[15]
   li $v0 1
   lw $a0 -68($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------267  WRITE recursion test,please input a fib number
   li $v0 4
   la $a0 .str_14
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------268  READ INT fibnum
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------269  FACTOR_VAR INT fibnum save in reg[16]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------270  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -76($sp)

#------------271  IF reg[16] BLEQ reg[17] THEN GOTO label_11
   lw $t0 -72($sp)
   lw $t1 -76($sp)
    ble $t0 $t1 label_11

#------------272  WRITE fibnum is too big
   li $v0 4
   la $a0 .str_15
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------273  JUMP to label_14
   j label_14

#------------274  label_11    ----------------Label----------------
label_11:

#------------275  FACTOR_VAR INT fibnum save in reg[18]
   lw $t3 -4($sp)
   sw $t3 -80($sp)

#------------276  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -84($sp)

#------------277  IF reg[18] BGEQ reg[19] THEN GOTO label_12
   lw $t0 -80($sp)
   lw $t1 -84($sp)
    bge $t0 $t1 label_12

#------------278  WRITE fibnum is too small
   li $v0 4
   la $a0 .str_16
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------279  JUMP to label_13
   j label_13

#------------280  label_12    ----------------Label----------------
label_12:

#------------281  FACTOR_VAR INT fibnum save in reg[20]
   lw $t3 -4($sp)
   sw $t3 -88($sp)

#------------282  PUSH INT parareg[8] from reg[20]
   sw $ra -92($sp)
   lw $t0 -88($sp)
   sw $t0 -96($sp)

#------------283  CALL INT fib(1)
   addiu $sp $sp -96
   jal .func_fib
   subiu $sp $sp -96
   lw $ra -92($sp)

#------------284  FACTOR_FUNC INT fib save in reg[21]
   sw $v0 -92($sp)

#------------285  WRITE fib result is:
   li $v0 4
   la $a0 .str_17
   syscall

#------------286  WRITE INT reg[21]
   li $v0 1
   lw $a0 -92($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------287  label_13    ----------------Label----------------
label_13:

#------------288  label_14    ----------------Label----------------
label_14:

#------------289  WRITE loop test beign
   li $v0 4
   la $a0 .str_18
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------290  FACTOR_CON INT 10 save in reg[22]
   li $t0 10
   sw $t0 -96($sp)

#------------291  PUSH INT parareg[9] from reg[22]
   sw $ra -100($sp)
   lw $t0 -96($sp)
   sw $t0 -104($sp)

#------------292  CALL VOID whiletest(1)
   addiu $sp $sp -104
   jal .func_whiletest
   subiu $sp $sp -104
   lw $ra -100($sp)

#------------293  CALL VOID fortest(0)
   sw $ra -100($sp)
   addiu $sp $sp -104
   jal .func_fortest
   subiu $sp $sp -104
   lw $ra -100($sp)

#------------294  WRITE loop test finished
   li $v0 4
   la $a0 .str_19
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------295  WRITE if test begin
   li $v0 4
   la $a0 .str_20
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------296  FACTOR_CON INT 0 save in reg[23]
   li $t0 0
   sw $t0 -100($sp)

#------------297  IF reg[23] BEQ reg[0] THEN GOTO label_15
   lw $t0 -100($sp)
    beq $t0 $0 label_15

#------------298  WRITE error
   li $v0 4
   la $a0 .str_21
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------299  JUMP to label_16
   j label_16

#------------300  label_15    ----------------Label----------------
label_15:

#------------301  label_16    ----------------Label----------------
label_16:

#------------302  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -104($sp)

#------------303  IF reg[24] BEQ reg[0] THEN GOTO label_17
   lw $t0 -104($sp)
    beq $t0 $0 label_17

#------------304  WRITE correct
   li $v0 4
   la $a0 .str_22
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------305  JUMP to label_18
   j label_18

#------------306  label_17    ----------------Label----------------
label_17:

#------------307  label_18    ----------------Label----------------
label_18:

#------------308  WRITE please input: 'a'
   li $v0 4
   la $a0 .str_23
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------309  READ CHAR cc
   li $v0 12
   syscall
   sw $v0 -8($sp)

#------------310  FACTOR_VAR CHAR cc save in reg[25]
   lw $t3 -8($sp)
   sw $t3 -108($sp)

#------------311  FACTOR_CON CHAR 97 save in reg[26]
   li $t0 97
   sw $t0 -112($sp)

#------------312  IF reg[25] BNE reg[26] THEN GOTO label_19
   lw $t0 -108($sp)
   lw $t1 -112($sp)
    bne $t0 $t1 label_19

#------------313  WRITE your input is correct!
   li $v0 4
   la $a0 .str_24
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------314  JUMP to label_20
   j label_20

#------------315  label_19    ----------------Label----------------
label_19:

#------------316  WRITE error!
   li $v0 4
   la $a0 .str_25
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------317  label_20    ----------------Label----------------
label_20:

#------------318  WRITE string test
   li $v0 4
   la $a0 .str_26
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------319  WRITE ! #$%&'()*+,-./0123456789:;<=>?@ABCXYZabcxyz[\]^_{|}~
   li $v0 4
   la $a0 .str_27
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------320  WRITE string test finished
   li $v0 4
   la $a0 .str_28
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------321  WRITE char test
   li $v0 4
   la $a0 .str_29
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------322  CALL CHAR chartest(0)
   sw $ra -116($sp)
   addiu $sp $sp -120
   jal .func_chartest
   subiu $sp $sp -120
   lw $ra -116($sp)

#------------323  FACTOR_FUNC CHAR chartest save in reg[27]
   sw $v0 -116($sp)

#------------324  WRITE CHAR reg[27]
   li $v0 11
   lw $a0 -116($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------325  WRITE call test
   li $v0 4
   la $a0 .str_30
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------326  CALL INT calltest1(0)
   sw $ra -120($sp)
   addiu $sp $sp -124
   jal .func_calltest1
   subiu $sp $sp -124
   lw $ra -120($sp)

#------------327  WRITE call test finished
   li $v0 4
   la $a0 .str_31
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------328  WRITE TEST IS OVER!
   li $v0 4
   la $a0 .str_32
   syscall
   li $v0 11
   li $a0 10
   syscall

   jr $ra

end:
