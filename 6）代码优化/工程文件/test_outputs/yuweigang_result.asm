.data
   .var_x: .word 0
   .var_int_c: .space 40
   .var_y: .word 0
   .var_gwent: .word 0
   .var_ciri: .word 0
   .var_char_t: .space 32
   .var_char_u: .space 8
   .str_0: .asciiz "q1="
   .str_1: .asciiz "q2="
   .str_2: .asciiz "q3="
   .str_3: .asciiz "before q2:"
   .str_4: .asciiz "later q2:"
   .str_5: .asciiz "! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
   .str_6: .asciiz "[]^_`abcdefghijklmnopqrstuvwxyz{|}~"
   .str_7: .asciiz "test9"
   .str_8: .asciiz "c1="
.text
   jal .func_main
   j end
#------------18  FUNC INT fib(1)
.func_fib:

#------------19  PARA INT n

#------------20  FACTOR_VAR INT n save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------21  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------22  IF reg[1] BNE reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bne $t0 $t1 label_0

#------------23  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -12($sp)

#------------24  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------25  JUMP to label_1
   j label_1

#------------26  label_0    ----------------Label----------------
label_0:

#------------27  label_1    ----------------Label----------------
label_1:

#------------28  FACTOR_VAR INT n save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------29  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------30  IF reg[4] BNE reg[5] THEN GOTO label_2
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bne $t0 $t1 label_2

#------------31  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------32  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------33  JUMP to label_3
   j label_3

#------------34  label_2    ----------------Label----------------
label_2:

#------------35  FACTOR_VAR INT n save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------36  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -32($sp)

#------------37  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------38  PUSH INT parareg[0] from reg[8]
   sw $ra -36($sp)
   lw $t0 -32($sp)
   sw $t0 -40($sp)

#------------39  CALL INT fib(1)
   addi $sp $sp -40
   jal .func_fib
   subi $sp $sp -40
   lw $ra -36($sp)

#------------40  FACTOR_FUNC INT fib save in reg[9]
   sw $v0 -36($sp)

#------------41  FACTOR_VAR INT n save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------42  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -44($sp)

#------------43  reg[11] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------44  PUSH INT parareg[1] from reg[11]
   sw $ra -48($sp)
   lw $t0 -44($sp)
   sw $t0 -52($sp)

#------------45  CALL INT fib(1)
   addi $sp $sp -52
   jal .func_fib
   subi $sp $sp -52
   lw $ra -48($sp)

#------------46  FACTOR_FUNC INT fib save in reg[12]
   sw $v0 -48($sp)

#------------47  reg[12] = reg[9] JIA reg[12]
   lw $t0 -36($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------48  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------49  label_3    ----------------Label----------------
label_3:

#------------50  FUNC INT int_add1(1)
   jr $ra

.func_int_add1:

#------------51  PARA INT x

#------------52  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------53  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------54  reg[2] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -8($sp)

#------------55  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------56  FUNC INT sum(2)
   jr $ra

.func_sum:

#------------57  PARA INT x

#------------58  PARA INT y

#------------59  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------60  FACTOR_VAR INT y save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------61  reg[2] = reg[1] JIA reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------62  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------63  FUNC INT return_1(0)
   jr $ra

.func_return_1:

#------------64  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------65  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------66  FUNC CHAR char_ret(1)
   jr $ra

.func_char_ret:

#------------67  PARA CHAR x

#------------68  FACTOR_VAR CHAR x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------69  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------70  FUNC INT ch_add_int(2)
   jr $ra

.func_ch_add_int:

#------------71  PARA CHAR x

#------------72  PARA INT y

#------------73  FACTOR_VAR CHAR x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------74  FACTOR_VAR INT y save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------75  reg[2] = reg[1] JIA reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------76  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------77  FUNC INT ch_sum(2)
   jr $ra

.func_ch_sum:

#------------78  PARA CHAR x

#------------79  PARA CHAR y

#------------80  FACTOR_VAR CHAR x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------81  FACTOR_VAR CHAR y save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------82  reg[2] = reg[1] JIA reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------83  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------84  FUNC CHAR return_c(0)
   jr $ra

.func_return_c:

#------------85  FACTOR_CON CHAR 99 save in reg[1]
   li $t0 99
   sw $t0 0($sp)

#------------86  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------87  FUNC VOID printf_charadd1(1)
   jr $ra

.func_printf_charadd1:

#------------88  PARA CHAR a

#------------89  FACTOR_VAR CHAR a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------90  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------91  reg[2] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -8($sp)

#------------92  WRITE INT reg[2]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------93  FUNC VOID nothing(0)
   jr $ra

.func_nothing:

#------------94  FUNC VOID test12(0)
   jr $ra

.func_test12:

#------------95  CONST INT _abcdefghijklmnopqrstuvwxyz = 1

#------------96  CONST CHAR _abcdefghijklmnopqrstuvwxy = 99

#------------97  VAR INT a

#------------98  VAR INT c

#------------99  VAR INT _d

#------------100  FACTOR_CON CHAR 95 save in reg[1]
   li $t0 95
   sw $t0 -12($sp)

#------------101  ASSIGN INT _d = reg[1]
   lw $t3 -12($sp)
   sw $t3 -8($sp)

#------------102  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -16($sp)

#------------103  FACTOR_CON CHAR 98 save in reg[3]
   li $t0 98
   sw $t0 -20($sp)

#------------104  reg[3] = reg[2] JIA reg[3]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------105  FACTOR_CON CHAR 99 save in reg[4]
   li $t0 99
   sw $t0 -24($sp)

#------------106  reg[4] = reg[3] JIA reg[4]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------107  FACTOR_CON CHAR 100 save in reg[5]
   li $t0 100
   sw $t0 -28($sp)

#------------108  reg[5] = reg[4] JIA reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------109  FACTOR_CON CHAR 101 save in reg[6]
   li $t0 101
   sw $t0 -32($sp)

#------------110  reg[6] = reg[5] JIA reg[6]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------111  FACTOR_CON CHAR 102 save in reg[7]
   li $t0 102
   sw $t0 -36($sp)

#------------112  reg[7] = reg[6] JIA reg[7]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------113  FACTOR_CON CHAR 103 save in reg[8]
   li $t0 103
   sw $t0 -40($sp)

#------------114  reg[8] = reg[7] JIA reg[8]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------115  FACTOR_CON CHAR 104 save in reg[9]
   li $t0 104
   sw $t0 -44($sp)

#------------116  reg[9] = reg[8] JIA reg[9]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------117  FACTOR_CON CHAR 105 save in reg[10]
   li $t0 105
   sw $t0 -48($sp)

#------------118  reg[10] = reg[9] JIA reg[10]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -48($sp)

#------------119  FACTOR_CON CHAR 106 save in reg[11]
   li $t0 106
   sw $t0 -52($sp)

#------------120  reg[11] = reg[10] JIA reg[11]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------121  FACTOR_CON CHAR 107 save in reg[12]
   li $t0 107
   sw $t0 -56($sp)

#------------122  reg[12] = reg[11] JIA reg[12]
   lw $t0 -52($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -56($sp)

#------------123  FACTOR_CON CHAR 108 save in reg[13]
   li $t0 108
   sw $t0 -60($sp)

#------------124  reg[13] = reg[12] JIA reg[13]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------125  FACTOR_CON CHAR 109 save in reg[14]
   li $t0 109
   sw $t0 -64($sp)

#------------126  reg[14] = reg[13] JIA reg[14]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   add $t2 $t0 $t1
   sw $t2 -64($sp)

#------------127  FACTOR_CON CHAR 110 save in reg[15]
   li $t0 110
   sw $t0 -68($sp)

#------------128  reg[15] = reg[14] JIA reg[15]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   add $t2 $t0 $t1
   sw $t2 -68($sp)

#------------129  FACTOR_CON CHAR 111 save in reg[16]
   li $t0 111
   sw $t0 -72($sp)

#------------130  reg[16] = reg[15] JIA reg[16]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------131  FACTOR_CON CHAR 112 save in reg[17]
   li $t0 112
   sw $t0 -76($sp)

#------------132  reg[17] = reg[16] JIA reg[17]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   add $t2 $t0 $t1
   sw $t2 -76($sp)

#------------133  FACTOR_CON CHAR 113 save in reg[18]
   li $t0 113
   sw $t0 -80($sp)

#------------134  reg[18] = reg[17] JIA reg[18]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   add $t2 $t0 $t1
   sw $t2 -80($sp)

#------------135  FACTOR_CON CHAR 114 save in reg[19]
   li $t0 114
   sw $t0 -84($sp)

#------------136  reg[19] = reg[18] JIA reg[19]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   add $t2 $t0 $t1
   sw $t2 -84($sp)

#------------137  FACTOR_CON CHAR 115 save in reg[20]
   li $t0 115
   sw $t0 -88($sp)

#------------138  reg[20] = reg[19] JIA reg[20]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   add $t2 $t0 $t1
   sw $t2 -88($sp)

#------------139  FACTOR_CON CHAR 116 save in reg[21]
   li $t0 116
   sw $t0 -92($sp)

#------------140  reg[21] = reg[20] JIA reg[21]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   add $t2 $t0 $t1
   sw $t2 -92($sp)

#------------141  FACTOR_CON CHAR 117 save in reg[22]
   li $t0 117
   sw $t0 -96($sp)

#------------142  reg[22] = reg[21] JIA reg[22]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   add $t2 $t0 $t1
   sw $t2 -96($sp)

#------------143  FACTOR_CON CHAR 118 save in reg[23]
   li $t0 118
   sw $t0 -100($sp)

#------------144  reg[23] = reg[22] JIA reg[23]
   lw $t0 -96($sp)
   lw $t1 -100($sp)
   add $t2 $t0 $t1
   sw $t2 -100($sp)

#------------145  FACTOR_CON CHAR 119 save in reg[24]
   li $t0 119
   sw $t0 -104($sp)

#------------146  reg[24] = reg[23] JIA reg[24]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   add $t2 $t0 $t1
   sw $t2 -104($sp)

#------------147  FACTOR_CON CHAR 120 save in reg[25]
   li $t0 120
   sw $t0 -108($sp)

#------------148  reg[25] = reg[24] JIA reg[25]
   lw $t0 -104($sp)
   lw $t1 -108($sp)
   add $t2 $t0 $t1
   sw $t2 -108($sp)

#------------149  FACTOR_CON CHAR 121 save in reg[26]
   li $t0 121
   sw $t0 -112($sp)

#------------150  reg[26] = reg[25] JIA reg[26]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   add $t2 $t0 $t1
   sw $t2 -112($sp)

#------------151  FACTOR_CON CHAR 122 save in reg[27]
   li $t0 122
   sw $t0 -116($sp)

#------------152  reg[27] = reg[26] JIA reg[27]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   add $t2 $t0 $t1
   sw $t2 -116($sp)

#------------153  ASSIGN INT a = reg[27]
   lw $t3 -116($sp)
   sw $t3 0($sp)

#------------154  FACTOR_CON CHAR 65 save in reg[28]
   li $t0 65
   sw $t0 -120($sp)

#------------155  FACTOR_CON CHAR 66 save in reg[29]
   li $t0 66
   sw $t0 -124($sp)

#------------156  reg[29] = reg[28] JIA reg[29]
   lw $t0 -120($sp)
   lw $t1 -124($sp)
   add $t2 $t0 $t1
   sw $t2 -124($sp)

#------------157  FACTOR_CON CHAR 67 save in reg[30]
   li $t0 67
   sw $t0 -128($sp)

#------------158  reg[30] = reg[29] JIA reg[30]
   lw $t0 -124($sp)
   lw $t1 -128($sp)
   add $t2 $t0 $t1
   sw $t2 -128($sp)

#------------159  FACTOR_CON CHAR 68 save in reg[31]
   li $t0 68
   sw $t0 -132($sp)

#------------160  reg[31] = reg[30] JIA reg[31]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   add $t2 $t0 $t1
   sw $t2 -132($sp)

#------------161  FACTOR_CON CHAR 69 save in reg[32]
   li $t0 69
   sw $t0 -136($sp)

#------------162  reg[32] = reg[31] JIA reg[32]
   lw $t0 -132($sp)
   lw $t1 -136($sp)
   add $t2 $t0 $t1
   sw $t2 -136($sp)

#------------163  FACTOR_CON CHAR 70 save in reg[33]
   li $t0 70
   sw $t0 -140($sp)

#------------164  reg[33] = reg[32] JIA reg[33]
   lw $t0 -136($sp)
   lw $t1 -140($sp)
   add $t2 $t0 $t1
   sw $t2 -140($sp)

#------------165  FACTOR_CON CHAR 71 save in reg[34]
   li $t0 71
   sw $t0 -144($sp)

#------------166  reg[34] = reg[33] JIA reg[34]
   lw $t0 -140($sp)
   lw $t1 -144($sp)
   add $t2 $t0 $t1
   sw $t2 -144($sp)

#------------167  FACTOR_CON CHAR 72 save in reg[35]
   li $t0 72
   sw $t0 -148($sp)

#------------168  reg[35] = reg[34] JIA reg[35]
   lw $t0 -144($sp)
   lw $t1 -148($sp)
   add $t2 $t0 $t1
   sw $t2 -148($sp)

#------------169  FACTOR_CON CHAR 73 save in reg[36]
   li $t0 73
   sw $t0 -152($sp)

#------------170  reg[36] = reg[35] JIA reg[36]
   lw $t0 -148($sp)
   lw $t1 -152($sp)
   add $t2 $t0 $t1
   sw $t2 -152($sp)

#------------171  FACTOR_CON CHAR 74 save in reg[37]
   li $t0 74
   sw $t0 -156($sp)

#------------172  reg[37] = reg[36] JIA reg[37]
   lw $t0 -152($sp)
   lw $t1 -156($sp)
   add $t2 $t0 $t1
   sw $t2 -156($sp)

#------------173  FACTOR_CON CHAR 75 save in reg[38]
   li $t0 75
   sw $t0 -160($sp)

#------------174  reg[38] = reg[37] JIA reg[38]
   lw $t0 -156($sp)
   lw $t1 -160($sp)
   add $t2 $t0 $t1
   sw $t2 -160($sp)

#------------175  FACTOR_CON CHAR 76 save in reg[39]
   li $t0 76
   sw $t0 -164($sp)

#------------176  reg[39] = reg[38] JIA reg[39]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   add $t2 $t0 $t1
   sw $t2 -164($sp)

#------------177  FACTOR_CON CHAR 77 save in reg[40]
   li $t0 77
   sw $t0 -168($sp)

#------------178  reg[40] = reg[39] JIA reg[40]
   lw $t0 -164($sp)
   lw $t1 -168($sp)
   add $t2 $t0 $t1
   sw $t2 -168($sp)

#------------179  FACTOR_CON CHAR 78 save in reg[41]
   li $t0 78
   sw $t0 -172($sp)

#------------180  reg[41] = reg[40] JIA reg[41]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   add $t2 $t0 $t1
   sw $t2 -172($sp)

#------------181  FACTOR_CON CHAR 79 save in reg[42]
   li $t0 79
   sw $t0 -176($sp)

#------------182  reg[42] = reg[41] JIA reg[42]
   lw $t0 -172($sp)
   lw $t1 -176($sp)
   add $t2 $t0 $t1
   sw $t2 -176($sp)

#------------183  FACTOR_CON CHAR 80 save in reg[43]
   li $t0 80
   sw $t0 -180($sp)

#------------184  reg[43] = reg[42] JIA reg[43]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   add $t2 $t0 $t1
   sw $t2 -180($sp)

#------------185  FACTOR_CON CHAR 81 save in reg[44]
   li $t0 81
   sw $t0 -184($sp)

#------------186  reg[44] = reg[43] JIA reg[44]
   lw $t0 -180($sp)
   lw $t1 -184($sp)
   add $t2 $t0 $t1
   sw $t2 -184($sp)

#------------187  FACTOR_CON CHAR 82 save in reg[45]
   li $t0 82
   sw $t0 -188($sp)

#------------188  reg[45] = reg[44] JIA reg[45]
   lw $t0 -184($sp)
   lw $t1 -188($sp)
   add $t2 $t0 $t1
   sw $t2 -188($sp)

#------------189  FACTOR_CON CHAR 83 save in reg[46]
   li $t0 83
   sw $t0 -192($sp)

#------------190  reg[46] = reg[45] JIA reg[46]
   lw $t0 -188($sp)
   lw $t1 -192($sp)
   add $t2 $t0 $t1
   sw $t2 -192($sp)

#------------191  FACTOR_CON CHAR 84 save in reg[47]
   li $t0 84
   sw $t0 -196($sp)

#------------192  reg[47] = reg[46] JIA reg[47]
   lw $t0 -192($sp)
   lw $t1 -196($sp)
   add $t2 $t0 $t1
   sw $t2 -196($sp)

#------------193  FACTOR_CON CHAR 85 save in reg[48]
   li $t0 85
   sw $t0 -200($sp)

#------------194  reg[48] = reg[47] JIA reg[48]
   lw $t0 -196($sp)
   lw $t1 -200($sp)
   add $t2 $t0 $t1
   sw $t2 -200($sp)

#------------195  FACTOR_CON CHAR 86 save in reg[49]
   li $t0 86
   sw $t0 -204($sp)

#------------196  reg[49] = reg[48] JIA reg[49]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   add $t2 $t0 $t1
   sw $t2 -204($sp)

#------------197  FACTOR_CON CHAR 87 save in reg[50]
   li $t0 87
   sw $t0 -208($sp)

#------------198  reg[50] = reg[49] JIA reg[50]
   lw $t0 -204($sp)
   lw $t1 -208($sp)
   add $t2 $t0 $t1
   sw $t2 -208($sp)

#------------199  FACTOR_CON CHAR 88 save in reg[51]
   li $t0 88
   sw $t0 -212($sp)

#------------200  reg[51] = reg[50] JIA reg[51]
   lw $t0 -208($sp)
   lw $t1 -212($sp)
   add $t2 $t0 $t1
   sw $t2 -212($sp)

#------------201  FACTOR_CON CHAR 89 save in reg[52]
   li $t0 89
   sw $t0 -216($sp)

#------------202  reg[52] = reg[51] JIA reg[52]
   lw $t0 -212($sp)
   lw $t1 -216($sp)
   add $t2 $t0 $t1
   sw $t2 -216($sp)

#------------203  FACTOR_CON CHAR 90 save in reg[53]
   li $t0 90
   sw $t0 -220($sp)

#------------204  reg[53] = reg[52] JIA reg[53]
   lw $t0 -216($sp)
   lw $t1 -220($sp)
   add $t2 $t0 $t1
   sw $t2 -220($sp)

#------------205  ASSIGN INT c = reg[53]
   lw $t3 -220($sp)
   sw $t3 -4($sp)

#------------206  FACTOR_VAR INT _d save in reg[54]
   lw $t3 -8($sp)
   sw $t3 -224($sp)

#------------207  WRITE INT reg[54]
   li $v0 1
   lw $a0 -224($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------208  FACTOR_VAR INT a save in reg[55]
   lw $t3 0($sp)
   sw $t3 -228($sp)

#------------209  WRITE INT reg[55]
   li $v0 1
   lw $a0 -228($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------210  FACTOR_VAR INT c save in reg[56]
   lw $t3 -4($sp)
   sw $t3 -232($sp)

#------------211  WRITE INT reg[56]
   li $v0 1
   lw $a0 -232($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------212  FUNC VOID test13(0)
   jr $ra

.func_test13:

#------------213  VAR INT a

#------------214  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------215  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------216  reg[2] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -8($sp)

#------------217  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -12($sp)

#------------218  reg[3] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------219  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -16($sp)

#------------220  reg[4] = reg[3] JIA reg[4]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------221  FACTOR_CON INT 4 save in reg[5]
   li $t0 4
   sw $t0 -20($sp)

#------------222  reg[5] = reg[4] JIA reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------223  FACTOR_CON INT 5 save in reg[6]
   li $t0 5
   sw $t0 -24($sp)

#------------224  reg[6] = reg[5] JIA reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------225  FACTOR_CON INT 6 save in reg[7]
   li $t0 6
   sw $t0 -28($sp)

#------------226  reg[7] = reg[6] JIA reg[7]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------227  FACTOR_CON INT 7 save in reg[8]
   li $t0 7
   sw $t0 -32($sp)

#------------228  reg[8] = reg[7] JIA reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------229  FACTOR_CON INT 8 save in reg[9]
   li $t0 8
   sw $t0 -36($sp)

#------------230  reg[9] = reg[8] JIA reg[9]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------231  FACTOR_CON INT 9 save in reg[10]
   li $t0 9
   sw $t0 -40($sp)

#------------232  reg[10] = reg[9] JIA reg[10]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------233  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -44($sp)

#------------234  reg[11] = reg[10] JIA reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------235  ASSIGN INT a = reg[11]
   lw $t3 -44($sp)
   sw $t3 0($sp)

#------------236  FACTOR_VAR INT a save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------237  WRITE INT reg[12]
   li $v0 1
   lw $a0 -48($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------238  FUNC VOID test14(5)
   jr $ra

.func_test14:

#------------239  PARA INT a

#------------240  PARA INT b

#------------241  PARA INT c

#------------242  PARA INT d

#------------243  PARA INT e

#------------244  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------245  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -24($sp)

#------------246  reg[2] = reg[1] JIA reg[2]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------247  FACTOR_VAR INT c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -28($sp)

#------------248  reg[3] = reg[2] JIA reg[3]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------249  FACTOR_VAR INT d save in reg[4]
   lw $t3 -12($sp)
   sw $t3 -32($sp)

#------------250  reg[4] = reg[3] JIA reg[4]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------251  FACTOR_VAR INT e save in reg[5]
   lw $t3 -16($sp)
   sw $t3 -36($sp)

#------------252  reg[5] = reg[4] JIA reg[5]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------253  WRITE INT reg[5]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------254  FUNC VOID printf_2(0)
   jr $ra

.func_printf_2:

#------------255  FACTOR_CON INT 2 save in reg[1]
   li $t0 2
   sw $t0 0($sp)

#------------256  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------257  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 4($sp)
   jr $ra

#------------258  FUNC VOID main(0)
   jr $ra

.func_main:

#------------259  CONST INT a = 1

#------------260  CONST INT b = 2

#------------261  VAR CHAR c1

#------------262  VAR CHAR c2

#------------263  VAR CHAR c3

#------------264  ARRAY CHAR s1[20]

#------------265  VAR INT ord

#------------266  VAR INT q1

#------------267  VAR INT q2

#------------268  VAR INT q3

#------------269  VAR INT q4

#------------270  ARRAY INT t1[10]

#------------271  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -156($sp)

#------------272  ASSIGN INT q1 = reg[2]
   lw $t3 -156($sp)
   sw $t3 -96($sp)

#------------273  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -160($sp)

#------------274  ASSIGN INT q2 = reg[3]
   lw $t3 -160($sp)
   sw $t3 -100($sp)

#------------275  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -164($sp)

#------------276  ASSIGN INT q3 = reg[4]
   lw $t3 -164($sp)
   sw $t3 -104($sp)

#------------277  READ INT ord
   li $v0 5
   syscall
   sw $v0 -92($sp)

#------------278  FACTOR_VAR INT ord save in reg[5]
   lw $t3 -92($sp)
   sw $t3 -168($sp)

#------------279  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -172($sp)

#------------280  IF reg[5] BNE reg[6] THEN GOTO label_4
   lw $t0 -168($sp)
   lw $t1 -172($sp)
    bne $t0 $t1 label_4

#------------281  READ INT q4
   li $v0 5
   syscall
   sw $v0 -108($sp)

#------------282  FACTOR_VAR INT q4 save in reg[7]
   lw $t3 -108($sp)
   sw $t3 -176($sp)

#------------283  PUSH INT parareg[2] from reg[7]
   sw $ra -180($sp)
   lw $t0 -176($sp)
   sw $t0 -184($sp)

#------------284  CALL INT fib(1)
   addi $sp $sp -184
   jal .func_fib
   subi $sp $sp -184
   lw $ra -180($sp)

#------------285  FACTOR_FUNC INT fib save in reg[8]
   sw $v0 -180($sp)

#------------286  ASSIGN INT q4 = reg[8]
   lw $t3 -180($sp)
   sw $t3 -108($sp)

#------------287  FACTOR_VAR INT q4 save in reg[9]
   lw $t3 -108($sp)
   sw $t3 -184($sp)

#------------288  WRITE INT reg[9]
   li $v0 1
   lw $a0 -184($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------289  JUMP to label_5
   j label_5

#------------290  label_4    ----------------Label----------------
label_4:

#------------291  label_5    ----------------Label----------------
label_5:

#------------292  FACTOR_VAR INT ord save in reg[10]
   lw $t3 -92($sp)
   sw $t3 -188($sp)

#------------293  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -192($sp)

#------------294  IF reg[10] BNE reg[11] THEN GOTO label_12
   lw $t0 -188($sp)
   lw $t1 -192($sp)
    bne $t0 $t1 label_12

#------------295  FACTOR_CON INT 2 save in reg[12]
   li $t0 2
   sw $t0 -196($sp)

#------------296  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -200($sp)

#------------297  IF reg[12] BLEQ reg[13] THEN GOTO label_6
   lw $t0 -196($sp)
   lw $t1 -200($sp)
    ble $t0 $t1 label_6

#------------298  FACTOR_CON CHAR 98 save in reg[14]
   li $t0 98
   sw $t0 -204($sp)

#------------299  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -208($sp)

#------------300  reg[15] = reg[14] JIA reg[15]
   lw $t0 -204($sp)
   lw $t1 -208($sp)
   add $t2 $t0 $t1
   sw $t2 -208($sp)

#------------301  ASSIGN INT q1 = reg[15]
   lw $t3 -208($sp)
   sw $t3 -96($sp)

#------------302  JUMP to label_7
   j label_7

#------------303  label_6    ----------------Label----------------
label_6:

#------------304  label_7    ----------------Label----------------
label_7:

#------------305  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -212($sp)

#------------306  FACTOR_CON INT 0 save in reg[17]
   li $t0 0
   sw $t0 -216($sp)

#------------307  IF reg[16] BGEQ reg[17] THEN GOTO label_8
   lw $t0 -212($sp)
   lw $t1 -216($sp)
    bge $t0 $t1 label_8

#------------308  FACTOR_CON CHAR 97 save in reg[18]
   li $t0 97
   sw $t0 -220($sp)

#------------309  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -224($sp)

#------------310  reg[19] = reg[18] JIA reg[19]
   lw $t0 -220($sp)
   lw $t1 -224($sp)
   add $t2 $t0 $t1
   sw $t2 -224($sp)

#------------311  ASSIGN INT q2 = reg[19]
   lw $t3 -224($sp)
   sw $t3 -100($sp)

#------------312  JUMP to label_11
   j label_11

#------------313  label_8    ----------------Label----------------
label_8:

#------------314  FACTOR_CON INT 2 save in reg[20]
   li $t0 2
   sw $t0 -228($sp)

#------------315  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -232($sp)

#------------316  IF reg[20] BGEQ reg[21] THEN GOTO label_9
   lw $t0 -228($sp)
   lw $t1 -232($sp)
    bge $t0 $t1 label_9

#------------317  FACTOR_CON CHAR 98 save in reg[22]
   li $t0 98
   sw $t0 -236($sp)

#------------318  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -240($sp)

#------------319  reg[23] = reg[22] JIA reg[23]
   lw $t0 -236($sp)
   lw $t1 -240($sp)
   add $t2 $t0 $t1
   sw $t2 -240($sp)

#------------320  ASSIGN INT q3 = reg[23]
   lw $t3 -240($sp)
   sw $t3 -104($sp)

#------------321  JUMP to label_10
   j label_10

#------------322  label_9    ----------------Label----------------
label_9:

#------------323  FACTOR_CON CHAR 98 save in reg[24]
   li $t0 98
   sw $t0 -244($sp)

#------------324  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -248($sp)

#------------325  reg[25] = reg[24] JIAN reg[25]
   lw $t0 -244($sp)
   lw $t1 -248($sp)
   sub $t2 $t0 $t1
   sw $t2 -248($sp)

#------------326  ASSIGN INT q3 = reg[25]
   lw $t3 -248($sp)
   sw $t3 -104($sp)

#------------327  label_10    ----------------Label----------------
label_10:

#------------328  label_11    ----------------Label----------------
label_11:

#------------329  WRITE q1=
   li $v0 4
   la $a0 .str_0
   syscall

#------------330  FACTOR_VAR INT q1 save in reg[26]
   lw $t3 -96($sp)
   sw $t3 -252($sp)

#------------331  WRITE INT reg[26]
   li $v0 1
   lw $a0 -252($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------332  WRITE q2=
   li $v0 4
   la $a0 .str_1
   syscall

#------------333  FACTOR_VAR INT q2 save in reg[27]
   lw $t3 -100($sp)
   sw $t3 -256($sp)

#------------334  WRITE INT reg[27]
   li $v0 1
   lw $a0 -256($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------335  WRITE q3=
   li $v0 4
   la $a0 .str_2
   syscall

#------------336  FACTOR_VAR INT q3 save in reg[28]
   lw $t3 -104($sp)
   sw $t3 -260($sp)

#------------337  WRITE INT reg[28]
   li $v0 1
   lw $a0 -260($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------338  JUMP to label_13
   j label_13

#------------339  label_12    ----------------Label----------------
label_12:

#------------340  label_13    ----------------Label----------------
label_13:

#------------341  FACTOR_VAR INT ord save in reg[29]
   lw $t3 -92($sp)
   sw $t3 -264($sp)

#------------342  FACTOR_CON INT 3 save in reg[30]
   li $t0 3
   sw $t0 -268($sp)

#------------343  IF reg[29] BNE reg[30] THEN GOTO label_18
   lw $t0 -264($sp)
   lw $t1 -268($sp)
    bne $t0 $t1 label_18

#------------344  label_14    ----------------Label----------------
label_14:

#------------345  FACTOR_VAR INT q2 save in reg[31]
   lw $t3 -100($sp)
   sw $t3 -272($sp)

#------------346  FACTOR_CON INT 3 save in reg[32]
   li $t0 3
   sw $t0 -276($sp)

#------------347  IF reg[31] BGEQ reg[32] THEN GOTO label_15
   lw $t0 -272($sp)
   lw $t1 -276($sp)
    bge $t0 $t1 label_15

#------------348  FACTOR_VAR INT q2 save in reg[33]
   lw $t3 -100($sp)
   sw $t3 -280($sp)

#------------349  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -284($sp)

#------------350  reg[34] = reg[33] JIA reg[34]
   lw $t0 -280($sp)
   lw $t1 -284($sp)
   add $t2 $t0 $t1
   sw $t2 -284($sp)

#------------351  ASSIGN INT q2 = reg[34]
   lw $t3 -284($sp)
   sw $t3 -100($sp)

#------------352  JUMP to label_14
   j label_14

#------------353  label_15    ----------------Label----------------
label_15:

#------------354  WRITE before q2:
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------355  FACTOR_VAR INT q2 save in reg[35]
   lw $t3 -100($sp)
   sw $t3 -288($sp)

#------------356  WRITE INT reg[35]
   li $v0 1
   lw $a0 -288($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------357  label_16    ----------------Label----------------
label_16:

#------------358  FACTOR_VAR INT q2 save in reg[36]
   lw $t3 -100($sp)
   sw $t3 -292($sp)

#------------359  IF reg[36] BEQ reg[0] THEN GOTO label_17
   lw $t0 -292($sp)
    beq $t0 $0 label_17

#------------360  FACTOR_VAR INT q2 save in reg[37]
   lw $t3 -100($sp)
   sw $t3 -296($sp)

#------------361  FACTOR_CON INT 1 save in reg[38]
   li $t0 1
   sw $t0 -300($sp)

#------------362  reg[38] = reg[37] JIAN reg[38]
   lw $t0 -296($sp)
   lw $t1 -300($sp)
   sub $t2 $t0 $t1
   sw $t2 -300($sp)

#------------363  ASSIGN INT q2 = reg[38]
   lw $t3 -300($sp)
   sw $t3 -100($sp)

#------------364  JUMP to label_16
   j label_16

#------------365  label_17    ----------------Label----------------
label_17:

#------------366  WRITE later q2:
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------367  FACTOR_VAR INT q2 save in reg[39]
   lw $t3 -100($sp)
   sw $t3 -304($sp)

#------------368  WRITE INT reg[39]
   li $v0 1
   lw $a0 -304($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------369  JUMP to label_19
   j label_19

#------------370  label_18    ----------------Label----------------
label_18:

#------------371  label_19    ----------------Label----------------
label_19:

#------------372  FACTOR_VAR INT ord save in reg[40]
   lw $t3 -92($sp)
   sw $t3 -308($sp)

#------------373  FACTOR_CON INT 4 save in reg[41]
   li $t0 4
   sw $t0 -312($sp)

#------------374  IF reg[40] BNE reg[41] THEN GOTO label_26
   lw $t0 -308($sp)
   lw $t1 -312($sp)
    bne $t0 $t1 label_26

#------------375  FACTOR_CON INT 1 save in reg[42]
   li $t0 1
   sw $t0 -316($sp)

#------------376  ASSIGN INT q4 = reg[42]
   lw $t3 -316($sp)
   sw $t3 -108($sp)

#------------377  JUMP to label_21
   j label_21

#------------378  label_20    ----------------Label----------------
label_20:

#------------379  FACTOR_VAR INT q4 save in reg[43]
   lw $t3 -108($sp)
   sw $t3 -320($sp)

#------------380  FACTOR_CON INT 1 save in reg[44]
   li $t0 1
   sw $t0 -324($sp)

#------------381  reg[44] = reg[43] JIA reg[44]
   lw $t0 -320($sp)
   lw $t1 -324($sp)
   add $t2 $t0 $t1
   sw $t2 -324($sp)

#------------382  ASSIGN INT q4 = reg[44]
   lw $t3 -324($sp)
   sw $t3 -108($sp)

#------------383  FACTOR_VAR INT q4 save in reg[45]
   lw $t3 -108($sp)
   sw $t3 -328($sp)

#------------384  FACTOR_CON INT 4 save in reg[46]
   li $t0 4
   sw $t0 -332($sp)

#------------385  IF reg[45] BGEQ reg[46] THEN GOTO label_22
   lw $t0 -328($sp)
   lw $t1 -332($sp)
    bge $t0 $t1 label_22

#------------386  label_21    ----------------Label----------------
label_21:

#------------387  FACTOR_VAR INT q2 save in reg[47]
   lw $t3 -100($sp)
   sw $t3 -336($sp)

#------------388  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -340($sp)

#------------389  reg[48] = reg[47] JIA reg[48]
   lw $t0 -336($sp)
   lw $t1 -340($sp)
   add $t2 $t0 $t1
   sw $t2 -340($sp)

#------------390  ASSIGN INT q2 = reg[48]
   lw $t3 -340($sp)
   sw $t3 -100($sp)

#------------391  JUMP to label_20
   j label_20

#------------392  label_22    ----------------Label----------------
label_22:

#------------393  WRITE before q2:
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------394  FACTOR_VAR INT q2 save in reg[49]
   lw $t3 -100($sp)
   sw $t3 -344($sp)

#------------395  WRITE INT reg[49]
   li $v0 1
   lw $a0 -344($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------396  FACTOR_CON INT 1 save in reg[50]
   li $t0 1
   sw $t0 -348($sp)

#------------397  ASSIGN INT q4 = reg[50]
   lw $t3 -348($sp)
   sw $t3 -108($sp)

#------------398  JUMP to label_24
   j label_24

#------------399  label_23    ----------------Label----------------
label_23:

#------------400  FACTOR_VAR INT q4 save in reg[51]
   lw $t3 -108($sp)
   sw $t3 -352($sp)

#------------401  FACTOR_CON INT 1 save in reg[52]
   li $t0 1
   sw $t0 -356($sp)

#------------402  reg[52] = reg[51] JIA reg[52]
   lw $t0 -352($sp)
   lw $t1 -356($sp)
   add $t2 $t0 $t1
   sw $t2 -356($sp)

#------------403  ASSIGN INT q4 = reg[52]
   lw $t3 -356($sp)
   sw $t3 -108($sp)

#------------404  FACTOR_VAR INT q4 save in reg[53]
   lw $t3 -108($sp)
   sw $t3 -360($sp)

#------------405  FACTOR_CON INT 1 save in reg[54]
   li $t0 1
   sw $t0 -364($sp)

#------------406  IF reg[53] BGEQ reg[54] THEN GOTO label_25
   lw $t0 -360($sp)
   lw $t1 -364($sp)
    bge $t0 $t1 label_25

#------------407  label_24    ----------------Label----------------
label_24:

#------------408  FACTOR_VAR INT q2 save in reg[55]
   lw $t3 -100($sp)
   sw $t3 -368($sp)

#------------409  FACTOR_CON INT 1 save in reg[56]
   li $t0 1
   sw $t0 -372($sp)

#------------410  reg[56] = reg[55] JIA reg[56]
   lw $t0 -368($sp)
   lw $t1 -372($sp)
   add $t2 $t0 $t1
   sw $t2 -372($sp)

#------------411  ASSIGN INT q2 = reg[56]
   lw $t3 -372($sp)
   sw $t3 -100($sp)

#------------412  JUMP to label_23
   j label_23

#------------413  label_25    ----------------Label----------------
label_25:

#------------414  WRITE later q2:
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------415  FACTOR_VAR INT q2 save in reg[57]
   lw $t3 -100($sp)
   sw $t3 -376($sp)

#------------416  WRITE INT reg[57]
   li $v0 1
   lw $a0 -376($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------417  JUMP to label_27
   j label_27

#------------418  label_26    ----------------Label----------------
label_26:

#------------419  label_27    ----------------Label----------------
label_27:

#------------420  FACTOR_VAR INT ord save in reg[58]
   lw $t3 -92($sp)
   sw $t3 -380($sp)

#------------421  FACTOR_CON INT 5 save in reg[59]
   li $t0 5
   sw $t0 -384($sp)

#------------422  IF reg[58] BNE reg[59] THEN GOTO label_28
   lw $t0 -380($sp)
   lw $t1 -384($sp)
    bne $t0 $t1 label_28

#------------423  WRITE ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------424  WRITE []^_`abcdefghijklmnopqrstuvwxyz{|}~
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------425  JUMP to label_29
   j label_29

#------------426  label_28    ----------------Label----------------
label_28:

#------------427  label_29    ----------------Label----------------
label_29:

#------------428  FACTOR_VAR INT ord save in reg[60]
   lw $t3 -92($sp)
   sw $t3 -388($sp)

#------------429  FACTOR_CON INT 6 save in reg[61]
   li $t0 6
   sw $t0 -392($sp)

#------------430  IF reg[60] BNE reg[61] THEN GOTO label_30
   lw $t0 -388($sp)
   lw $t1 -392($sp)
    bne $t0 $t1 label_30

#------------431  FACTOR_CON INT 1 save in reg[62]
   li $t0 1
   sw $t0 -396($sp)

#------------432  PUSH INT parareg[3] from reg[62]
   sw $ra -400($sp)
   lw $t0 -396($sp)
   sw $t0 -404($sp)

#------------433  CALL INT int_add1(1)
   addi $sp $sp -404
   jal .func_int_add1
   subi $sp $sp -404
   lw $ra -400($sp)

#------------434  FACTOR_FUNC INT int_add1 save in reg[63]
   sw $v0 -400($sp)

#------------435  ASSIGN INT q1 = reg[63]
   lw $t3 -400($sp)
   sw $t3 -96($sp)

#------------436  FACTOR_VAR INT q1 save in reg[64]
   lw $t3 -96($sp)
   sw $t3 -404($sp)

#------------437  WRITE INT reg[64]
   li $v0 1
   lw $a0 -404($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------438  CALL CHAR return_c(0)
   sw $ra -408($sp)
   addi $sp $sp -412
   jal .func_return_c
   subi $sp $sp -412
   lw $ra -408($sp)

#------------439  FACTOR_FUNC CHAR return_c save in reg[65]
   sw $v0 -408($sp)

#------------440  ASSIGN CHAR c1 = reg[65]
   lw $t3 -408($sp)
   sw $t3 0($sp)

#------------441  FACTOR_VAR CHAR c1 save in reg[66]
   lw $t3 0($sp)
   sw $t3 -412($sp)

#------------442  WRITE CHAR reg[66]
   li $v0 11
   lw $a0 -412($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------443  JUMP to label_31
   j label_31

#------------444  label_30    ----------------Label----------------
label_30:

#------------445  label_31    ----------------Label----------------
label_31:

#------------446  FACTOR_VAR INT ord save in reg[67]
   lw $t3 -92($sp)
   sw $t3 -416($sp)

#------------447  FACTOR_CON INT 7 save in reg[68]
   li $t0 7
   sw $t0 -420($sp)

#------------448  IF reg[67] BNE reg[68] THEN GOTO label_32
   lw $t0 -416($sp)
   lw $t1 -420($sp)
    bne $t0 $t1 label_32

#------------449  CALL VOID printf_2(0)
   sw $ra -424($sp)
   addi $sp $sp -428
   jal .func_printf_2
   subi $sp $sp -428
   lw $ra -424($sp)

#------------450  FACTOR_CON CHAR 99 save in reg[69]
   li $t0 99
   sw $t0 -424($sp)

#------------451  PUSH INT parareg[4] from reg[69]
   sw $ra -428($sp)
   lw $t0 -424($sp)
   sw $t0 -432($sp)

#------------452  CALL VOID printf_charadd1(1)
   addi $sp $sp -432
   jal .func_printf_charadd1
   subi $sp $sp -432
   lw $ra -428($sp)

#------------453  JUMP to label_33
   j label_33

#------------454  label_32    ----------------Label----------------
label_32:

#------------455  label_33    ----------------Label----------------
label_33:

#------------456  FACTOR_VAR INT ord save in reg[70]
   lw $t3 -92($sp)
   sw $t3 -428($sp)

#------------457  FACTOR_CON INT 8 save in reg[71]
   li $t0 8
   sw $t0 -432($sp)

#------------458  IF reg[70] BNE reg[71] THEN GOTO label_34
   lw $t0 -428($sp)
   lw $t1 -432($sp)
    bne $t0 $t1 label_34

#------------459  FACTOR_CON INT 10 save in reg[72]
   li $t0 10
   sw $t0 -436($sp)

#------------460  ASSIGN INT q1 = reg[72]
   lw $t3 -436($sp)
   sw $t3 -96($sp)

#------------461  FACTOR_VAR INT q1 save in reg[73]
   lw $t3 -96($sp)
   sw $t3 -440($sp)

#------------462  WRITE INT reg[73]
   li $v0 1
   lw $a0 -440($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------463  FACTOR_CON INT 2 save in reg[74]
   li $t0 2
   sw $t0 -444($sp)

#------------464  FACTOR_CON INT 1 save in reg[75]
   li $t0 1
   sw $t0 -448($sp)

#------------465  reg[75] = reg[74] CHENG reg[75]
   lw $t0 -444($sp)
   lw $t1 -448($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -448($sp)

#------------466  FACTOR_CON CHAR 97 save in reg[76]
   li $t0 97
   sw $t0 -452($sp)

#------------467  ASSIGN_ARR CHAR s1[reg[75]] = reg[76]
   lw $t0 -448($sp)
   lw $t1 -452($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -12($t0)

#------------468  FACTOR_CON INT 2 save in reg[77]
   li $t0 2
   sw $t0 -456($sp)

#------------469  FACTOR_ARRAY CHAR s1 [reg[77]] save in reg[78]
   lw $t3 -456($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -12($t3)
   sw $t3 -460($sp)

#------------470  WRITE CHAR reg[78]
   li $v0 11
   lw $a0 -460($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------471  JUMP to label_35
   j label_35

#------------472  label_34    ----------------Label----------------
label_34:

#------------473  label_35    ----------------Label----------------
label_35:

#------------474  FACTOR_VAR INT ord save in reg[79]
   lw $t3 -92($sp)
   sw $t3 -464($sp)

#------------475  FACTOR_CON INT 9 save in reg[80]
   li $t0 9
   sw $t0 -468($sp)

#------------476  IF reg[79] BNE reg[80] THEN GOTO label_36
   lw $t0 -464($sp)
   lw $t1 -468($sp)
    bne $t0 $t1 label_36

#------------477  READ INT q1
   li $v0 5
   syscall
   sw $v0 -96($sp)

#------------478  READ CHAR c1
   li $v0 12
   syscall
   sw $v0 0($sp)

#------------479  WRITE test9
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------480  WRITE q1=
   li $v0 4
   la $a0 .str_0
   syscall

#------------481  FACTOR_VAR INT q1 save in reg[81]
   lw $t3 -96($sp)
   sw $t3 -472($sp)

#------------482  WRITE INT reg[81]
   li $v0 1
   lw $a0 -472($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------483  WRITE c1=
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------484  FACTOR_VAR CHAR c1 save in reg[82]
   lw $t3 0($sp)
   sw $t3 -476($sp)

#------------485  WRITE CHAR reg[82]
   li $v0 11
   lw $a0 -476($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------486  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -148($sp)
   jr $ra

#------------487  JUMP to label_37
   j label_37

#------------488  label_36    ----------------Label----------------
label_36:

#------------489  label_37    ----------------Label----------------
label_37:

#------------490  FACTOR_VAR INT ord save in reg[83]
   lw $t3 -92($sp)
   sw $t3 -480($sp)

#------------491  FACTOR_CON INT 10 save in reg[84]
   li $t0 10
   sw $t0 -484($sp)

#------------492  IF reg[83] BNE reg[84] THEN GOTO label_38
   lw $t0 -480($sp)
   lw $t1 -484($sp)
    bne $t0 $t1 label_38

#------------493  FACTOR_CON INT 1 save in reg[85]
   li $t0 1
   sw $t0 -488($sp)

#------------494  ASSIGN INT q1 = reg[85]
   lw $t3 -488($sp)
   sw $t3 -96($sp)

#------------495  FACTOR_CON INT 2 save in reg[86]
   li $t0 2
   sw $t0 -492($sp)

#------------496  ASSIGN INT q2 = reg[86]
   lw $t3 -492($sp)
   sw $t3 -100($sp)

#------------497  FACTOR_VAR INT q1 save in reg[87]
   lw $t3 -96($sp)
   sw $t3 -496($sp)

#------------498  ASSIGN INT q3 = reg[87]
   lw $t3 -496($sp)
   sw $t3 -104($sp)

#------------499  FACTOR_CON INT 3 save in reg[88]
   li $t0 3
   sw $t0 -500($sp)

#------------500  FACTOR_CON INT 2 save in reg[89]
   li $t0 2
   sw $t0 -504($sp)

#------------501  reg[89] = reg[88] CHENG reg[89]
   lw $t0 -500($sp)
   lw $t1 -504($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -504($sp)

#------------502  FACTOR_CON INT 1 save in reg[90]
   li $t0 1
   sw $t0 -508($sp)

#------------503  reg[90] = reg[89] JIA reg[90]
   lw $t0 -504($sp)
   lw $t1 -508($sp)
   add $t2 $t0 $t1
   sw $t2 -508($sp)

#------------504  FACTOR_CON INT 2 save in reg[91]
   li $t0 2
   sw $t0 -512($sp)

#------------505  ASSIGN_ARR CHAR s1[reg[90]] = reg[91]
   lw $t0 -508($sp)
   lw $t1 -512($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -12($t0)

#------------506  FACTOR_VAR INT q3 save in reg[92]
   lw $t3 -104($sp)
   sw $t3 -516($sp)

#------------507  WRITE INT reg[92]
   li $v0 1
   lw $a0 -516($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------508  FACTOR_CON CHAR 100 save in reg[93]
   li $t0 100
   sw $t0 -520($sp)

#------------509  FACTOR_CON INT 0 save in reg[94]
   li $t0 0
   sw $t0 -524($sp)

#------------510  reg[94] = reg[94] JIAN reg[93]
   lw $t0 -524($sp)
   lw $t1 -520($sp)
   sub $t2 $t0 $t1
   sw $t2 -524($sp)

#------------511  ASSIGN INT q3 = reg[94]
   lw $t3 -524($sp)
   sw $t3 -104($sp)

#------------512  FACTOR_VAR INT q3 save in reg[95]
   lw $t3 -104($sp)
   sw $t3 -528($sp)

#------------513  WRITE INT reg[95]
   li $v0 1
   lw $a0 -528($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------514  FACTOR_VAR INT q1 save in reg[96]
   lw $t3 -96($sp)
   sw $t3 -532($sp)

#------------515  FACTOR_VAR INT q3 save in reg[97]
   lw $t3 -104($sp)
   sw $t3 -536($sp)

#------------516  reg[97] = reg[96] CHENG reg[97]
   lw $t0 -532($sp)
   lw $t1 -536($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -536($sp)

#------------517  FACTOR_VAR INT q2 save in reg[98]
   lw $t3 -100($sp)
   sw $t3 -540($sp)

#------------518  reg[98] = reg[97] CHU reg[98]
   lw $t0 -536($sp)
   lw $t1 -540($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -540($sp)

#------------519  FACTOR_CON INT 3 save in reg[99]
   li $t0 3
   sw $t0 -544($sp)

#------------520  FACTOR_CON INT 4 save in reg[100]
   li $t0 4
   sw $t0 -548($sp)

#------------521  reg[100] = reg[99] CHENG reg[100]
   lw $t0 -544($sp)
   lw $t1 -548($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -548($sp)

#------------522  FACTOR_CON INT 2 save in reg[101]
   li $t0 2
   sw $t0 -552($sp)

#------------523  reg[101] = reg[100] JIAN reg[101]
   lw $t0 -548($sp)
   lw $t1 -552($sp)
   sub $t2 $t0 $t1
   sw $t2 -552($sp)

#------------524  FACTOR_EXPR reg[101] save in reg[102]
   lw $t0 -552($sp)
   sw $t0 -556($sp)

#------------525  reg[102] = reg[98] JIAN reg[102]
   lw $t0 -540($sp)
   lw $t1 -556($sp)
   sub $t2 $t0 $t1
   sw $t2 -556($sp)

#------------526  FACTOR_CON CHAR 99 save in reg[103]
   li $t0 99
   sw $t0 -560($sp)

#------------527  FACTOR_CON INT 2 save in reg[104]
   li $t0 2
   sw $t0 -564($sp)

#------------528  reg[104] = reg[103] JIA reg[104]
   lw $t0 -560($sp)
   lw $t1 -564($sp)
   add $t2 $t0 $t1
   sw $t2 -564($sp)

#------------529  FACTOR_EXPR reg[104] save in reg[105]
   lw $t0 -564($sp)
   sw $t0 -568($sp)

#------------530  reg[105] = reg[102] JIA reg[105]
   lw $t0 -556($sp)
   lw $t1 -568($sp)
   add $t2 $t0 $t1
   sw $t2 -568($sp)

#------------531  CALL CHAR return_c(0)
   sw $ra -572($sp)
   addi $sp $sp -576
   jal .func_return_c
   subi $sp $sp -576
   lw $ra -572($sp)

#------------532  FACTOR_FUNC CHAR return_c save in reg[106]
   sw $v0 -572($sp)

#------------533  FACTOR_EXPR reg[106] save in reg[107]
   lw $t0 -572($sp)
   sw $t0 -576($sp)

#------------534  reg[107] = reg[105] JIAN reg[107]
   lw $t0 -568($sp)
   lw $t1 -576($sp)
   sub $t2 $t0 $t1
   sw $t2 -576($sp)

#------------535  FACTOR_CON CHAR 98 save in reg[108]
   li $t0 98
   sw $t0 -580($sp)

#------------536  FACTOR_CON INT 1 save in reg[109]
   li $t0 1
   sw $t0 -584($sp)

#------------537  PUSH INT parareg[5] from reg[108]
   sw $ra -588($sp)
   lw $t0 -580($sp)
   sw $t0 -592($sp)

#------------538  PUSH INT parareg[6] from reg[109]
   lw $t0 -584($sp)
   sw $t0 -596($sp)

#------------539  CALL INT ch_add_int(2)
   addi $sp $sp -592
   jal .func_ch_add_int
   subi $sp $sp -592
   lw $ra -588($sp)

#------------540  FACTOR_FUNC INT ch_add_int save in reg[110]
   sw $v0 -588($sp)

#------------541  FACTOR_EXPR reg[110] save in reg[111]
   lw $t0 -588($sp)
   sw $t0 -592($sp)

#------------542  reg[111] = reg[107] JIA reg[111]
   lw $t0 -576($sp)
   lw $t1 -592($sp)
   add $t2 $t0 $t1
   sw $t2 -592($sp)

#------------543  FACTOR_CON INT 7 save in reg[112]
   li $t0 7
   sw $t0 -596($sp)

#------------544  FACTOR_ARRAY CHAR s1 [reg[112]] save in reg[113]
   lw $t3 -596($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -12($t3)
   sw $t3 -600($sp)

#------------545  FACTOR_CON INT 2 save in reg[114]
   li $t0 2
   sw $t0 -604($sp)

#------------546  reg[114] = reg[113] CHENG reg[114]
   lw $t0 -600($sp)
   lw $t1 -604($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -604($sp)

#------------547  reg[114] = reg[111] JIAN reg[114]
   lw $t0 -592($sp)
   lw $t1 -604($sp)
   sub $t2 $t0 $t1
   sw $t2 -604($sp)

#------------548  ASSIGN INT q4 = reg[114]
   lw $t3 -604($sp)
   sw $t3 -108($sp)

#------------549  FACTOR_VAR INT q4 save in reg[115]
   lw $t3 -108($sp)
   sw $t3 -608($sp)

#------------550  WRITE INT reg[115]
   li $v0 1
   lw $a0 -608($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------551  FACTOR_CON INT 0 save in reg[116]
   li $t0 0
   sw $t0 -612($sp)

#------------552  FACTOR_CON CHAR 100 save in reg[117]
   li $t0 100
   sw $t0 -616($sp)

#------------553  FACTOR_CON INT 20 save in reg[118]
   li $t0 20
   sw $t0 -620($sp)

#------------554  reg[118] = reg[117] JIA reg[118]
   lw $t0 -616($sp)
   lw $t1 -620($sp)
   add $t2 $t0 $t1
   sw $t2 -620($sp)

#------------555  ASSIGN_ARR INT t1[reg[116]] = reg[118]
   lw $t0 -612($sp)
   lw $t1 -620($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -112($t0)

#------------556  FACTOR_CON INT 1 save in reg[119]
   li $t0 1
   sw $t0 -624($sp)

#------------557  FACTOR_CON INT 7 save in reg[120]
   li $t0 7
   sw $t0 -628($sp)

#------------558  FACTOR_ARRAY CHAR s1 [reg[120]] save in reg[121]
   lw $t3 -628($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -12($t3)
   sw $t3 -632($sp)

#------------559  FACTOR_CON INT 0 save in reg[122]
   li $t0 0
   sw $t0 -636($sp)

#------------560  reg[122] = reg[122] JIAN reg[121]
   lw $t0 -636($sp)
   lw $t1 -632($sp)
   sub $t2 $t0 $t1
   sw $t2 -636($sp)

#------------561  FACTOR_CON INT 2 save in reg[123]
   li $t0 2
   sw $t0 -640($sp)

#------------562  FACTOR_CON INT 3 save in reg[124]
   li $t0 3
   sw $t0 -644($sp)

#------------563  reg[124] = reg[123] CHENG reg[124]
   lw $t0 -640($sp)
   lw $t1 -644($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -644($sp)

#------------564  reg[124] = reg[122] JIA reg[124]
   lw $t0 -636($sp)
   lw $t1 -644($sp)
   add $t2 $t0 $t1
   sw $t2 -644($sp)

#------------565  ASSIGN_ARR INT t1[reg[119]] = reg[124]
   lw $t0 -624($sp)
   lw $t1 -644($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -112($t0)

#------------566  FACTOR_CON INT 2 save in reg[125]
   li $t0 2
   sw $t0 -648($sp)

#------------567  FACTOR_CON INT 3 save in reg[126]
   li $t0 3
   sw $t0 -652($sp)

#------------568  reg[126] = reg[125] CHENG reg[126]
   lw $t0 -648($sp)
   lw $t1 -652($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -652($sp)

#------------569  FACTOR_CON INT 3 save in reg[127]
   li $t0 3
   sw $t0 -656($sp)

#------------570  reg[127] = reg[126] CHU reg[127]
   lw $t0 -652($sp)
   lw $t1 -656($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -656($sp)

#------------571  FACTOR_CON INT 2 save in reg[128]
   li $t0 2
   sw $t0 -660($sp)

#------------572  FACTOR_CON INT 1 save in reg[129]
   li $t0 1
   sw $t0 -664($sp)

#------------573  FACTOR_CON INT 0 save in reg[130]
   li $t0 0
   sw $t0 -668($sp)

#------------574  reg[130] = reg[130] JIAN reg[129]
   lw $t0 -668($sp)
   lw $t1 -664($sp)
   sub $t2 $t0 $t1
   sw $t2 -668($sp)

#------------575  PUSH INT parareg[7] from reg[128]
   sw $ra -672($sp)
   lw $t0 -660($sp)
   sw $t0 -676($sp)

#------------576  PUSH INT parareg[8] from reg[130]
   lw $t0 -668($sp)
   sw $t0 -680($sp)

#------------577  CALL INT sum(2)
   addi $sp $sp -676
   jal .func_sum
   subi $sp $sp -676
   lw $ra -672($sp)

#------------578  FACTOR_FUNC INT sum save in reg[131]
   sw $v0 -672($sp)

#------------579  ASSIGN_ARR INT t1[reg[127]] = reg[131]
   lw $t0 -656($sp)
   lw $t1 -672($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -112($t0)

#------------580  FACTOR_CON INT 1 save in reg[132]
   li $t0 1
   sw $t0 -676($sp)

#------------581  FACTOR_ARRAY INT t1 [reg[132]] save in reg[133]
   lw $t3 -676($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -112($t3)
   sw $t3 -680($sp)

#------------582  FACTOR_CON INT 140 save in reg[134]
   li $t0 140
   sw $t0 -684($sp)

#------------583  reg[134] = reg[133] JIA reg[134]
   lw $t0 -680($sp)
   lw $t1 -684($sp)
   add $t2 $t0 $t1
   sw $t2 -684($sp)

#------------584  FACTOR_EXPR reg[134] save in reg[135]
   lw $t0 -684($sp)
   sw $t0 -688($sp)

#------------585  FACTOR_CON INT 2 save in reg[136]
   li $t0 2
   sw $t0 -692($sp)

#------------586  FACTOR_ARRAY INT t1 [reg[136]] save in reg[137]
   lw $t3 -692($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -112($t3)
   sw $t3 -696($sp)

#------------587  reg[137] = reg[135] CHENG reg[137]
   lw $t0 -688($sp)
   lw $t1 -696($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -696($sp)

#------------588  FACTOR_CON INT 0 save in reg[138]
   li $t0 0
   sw $t0 -700($sp)

#------------589  FACTOR_ARRAY INT t1 [reg[138]] save in reg[139]
   lw $t3 -700($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -112($t3)
   sw $t3 -704($sp)

#------------590  reg[139] = reg[137] JIAN reg[139]
   lw $t0 -696($sp)
   lw $t1 -704($sp)
   sub $t2 $t0 $t1
   sw $t2 -704($sp)

#------------591  FACTOR_CON INT 40 save in reg[140]
   li $t0 40
   sw $t0 -708($sp)

#------------592  reg[140] = reg[139] JIA reg[140]
   lw $t0 -704($sp)
   lw $t1 -708($sp)
   add $t2 $t0 $t1
   sw $t2 -708($sp)

#------------593  ASSIGN INT q1 = reg[140]
   lw $t3 -708($sp)
   sw $t3 -96($sp)

#------------594  FACTOR_VAR INT q1 save in reg[141]
   lw $t3 -96($sp)
   sw $t3 -712($sp)

#------------595  WRITE INT reg[141]
   li $v0 1
   lw $a0 -712($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------596  JUMP to label_39
   j label_39

#------------597  label_38    ----------------Label----------------
label_38:

#------------598  label_39    ----------------Label----------------
label_39:

#------------599  FACTOR_VAR INT ord save in reg[142]
   lw $t3 -92($sp)
   sw $t3 -716($sp)

#------------600  FACTOR_CON INT 11 save in reg[143]
   li $t0 11
   sw $t0 -720($sp)

#------------601  IF reg[142] BNE reg[143] THEN GOTO label_52
   lw $t0 -716($sp)
   lw $t1 -720($sp)
    bne $t0 $t1 label_52

#------------602  FACTOR_CON INT 1 save in reg[144]
   li $t0 1
   sw $t0 -724($sp)

#------------603  ASSIGN INT q1 = reg[144]
   lw $t3 -724($sp)
   sw $t3 -96($sp)

#------------604  FACTOR_CON INT 2 save in reg[145]
   li $t0 2
   sw $t0 -728($sp)

#------------605  ASSIGN INT q2 = reg[145]
   lw $t3 -728($sp)
   sw $t3 -100($sp)

#------------606  FACTOR_CON INT 2 save in reg[146]
   li $t0 2
   sw $t0 -732($sp)

#------------607  ASSIGN INT q3 = reg[146]
   lw $t3 -732($sp)
   sw $t3 -104($sp)

#------------608  FACTOR_CON INT 0 save in reg[147]
   li $t0 0
   sw $t0 -736($sp)

#------------609  ASSIGN INT q4 = reg[147]
   lw $t3 -736($sp)
   sw $t3 -108($sp)

#------------610  FACTOR_VAR INT q1 save in reg[148]
   lw $t3 -96($sp)
   sw $t3 -740($sp)

#------------611  FACTOR_VAR INT q2 save in reg[149]
   lw $t3 -100($sp)
   sw $t3 -744($sp)

#------------612  IF reg[148] BGEQ reg[149] THEN GOTO label_40
   lw $t0 -740($sp)
   lw $t1 -744($sp)
    bge $t0 $t1 label_40

#------------613  FACTOR_VAR INT q4 save in reg[150]
   lw $t3 -108($sp)
   sw $t3 -748($sp)

#------------614  FACTOR_CON INT 1 save in reg[151]
   li $t0 1
   sw $t0 -752($sp)

#------------615  reg[151] = reg[150] JIA reg[151]
   lw $t0 -748($sp)
   lw $t1 -752($sp)
   add $t2 $t0 $t1
   sw $t2 -752($sp)

#------------616  ASSIGN INT q4 = reg[151]
   lw $t3 -752($sp)
   sw $t3 -108($sp)

#------------617  JUMP to label_41
   j label_41

#------------618  label_40    ----------------Label----------------
label_40:

#------------619  label_41    ----------------Label----------------
label_41:

#------------620  FACTOR_VAR INT q4 save in reg[152]
   lw $t3 -108($sp)
   sw $t3 -756($sp)

#------------621  WRITE INT reg[152]
   li $v0 1
   lw $a0 -756($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------622  FACTOR_VAR INT q1 save in reg[153]
   lw $t3 -96($sp)
   sw $t3 -760($sp)

#------------623  FACTOR_VAR INT q3 save in reg[154]
   lw $t3 -104($sp)
   sw $t3 -764($sp)

#------------624  FACTOR_VAR INT q2 save in reg[155]
   lw $t3 -100($sp)
   sw $t3 -768($sp)

#------------625  reg[155] = reg[154] CHU reg[155]
   lw $t0 -764($sp)
   lw $t1 -768($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -768($sp)

#------------626  IF reg[153] BGTR reg[155] THEN GOTO label_42
   lw $t0 -760($sp)
   lw $t1 -768($sp)
    bgt $t0 $t1 label_42

#------------627  FACTOR_VAR INT q4 save in reg[156]
   lw $t3 -108($sp)
   sw $t3 -772($sp)

#------------628  FACTOR_CON INT 1 save in reg[157]
   li $t0 1
   sw $t0 -776($sp)

#------------629  reg[157] = reg[156] JIA reg[157]
   lw $t0 -772($sp)
   lw $t1 -776($sp)
   add $t2 $t0 $t1
   sw $t2 -776($sp)

#------------630  ASSIGN INT q4 = reg[157]
   lw $t3 -776($sp)
   sw $t3 -108($sp)

#------------631  JUMP to label_43
   j label_43

#------------632  label_42    ----------------Label----------------
label_42:

#------------633  label_43    ----------------Label----------------
label_43:

#------------634  FACTOR_VAR INT q4 save in reg[158]
   lw $t3 -108($sp)
   sw $t3 -780($sp)

#------------635  WRITE INT reg[158]
   li $v0 1
   lw $a0 -780($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------636  FACTOR_VAR INT q2 save in reg[159]
   lw $t3 -100($sp)
   sw $t3 -784($sp)

#------------637  FACTOR_VAR INT q3 save in reg[160]
   lw $t3 -104($sp)
   sw $t3 -788($sp)

#------------638  IF reg[159] BLEQ reg[160] THEN GOTO label_44
   lw $t0 -784($sp)
   lw $t1 -788($sp)
    ble $t0 $t1 label_44

#------------639  FACTOR_VAR INT q4 save in reg[161]
   lw $t3 -108($sp)
   sw $t3 -792($sp)

#------------640  FACTOR_CON INT 1 save in reg[162]
   li $t0 1
   sw $t0 -796($sp)

#------------641  reg[162] = reg[161] JIA reg[162]
   lw $t0 -792($sp)
   lw $t1 -796($sp)
   add $t2 $t0 $t1
   sw $t2 -796($sp)

#------------642  ASSIGN INT q4 = reg[162]
   lw $t3 -796($sp)
   sw $t3 -108($sp)

#------------643  JUMP to label_45
   j label_45

#------------644  label_44    ----------------Label----------------
label_44:

#------------645  label_45    ----------------Label----------------
label_45:

#------------646  FACTOR_VAR INT q4 save in reg[163]
   lw $t3 -108($sp)
   sw $t3 -800($sp)

#------------647  WRITE INT reg[163]
   li $v0 1
   lw $a0 -800($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------648  FACTOR_VAR INT q2 save in reg[164]
   lw $t3 -100($sp)
   sw $t3 -804($sp)

#------------649  FACTOR_VAR INT q3 save in reg[165]
   lw $t3 -104($sp)
   sw $t3 -808($sp)

#------------650  IF reg[164] BLSS reg[165] THEN GOTO label_46
   lw $t0 -804($sp)
   lw $t1 -808($sp)
    blt $t0 $t1 label_46

#------------651  FACTOR_VAR INT q4 save in reg[166]
   lw $t3 -108($sp)
   sw $t3 -812($sp)

#------------652  FACTOR_CON INT 1 save in reg[167]
   li $t0 1
   sw $t0 -816($sp)

#------------653  reg[167] = reg[166] JIA reg[167]
   lw $t0 -812($sp)
   lw $t1 -816($sp)
   add $t2 $t0 $t1
   sw $t2 -816($sp)

#------------654  ASSIGN INT q4 = reg[167]
   lw $t3 -816($sp)
   sw $t3 -108($sp)

#------------655  JUMP to label_47
   j label_47

#------------656  label_46    ----------------Label----------------
label_46:

#------------657  label_47    ----------------Label----------------
label_47:

#------------658  FACTOR_VAR INT q4 save in reg[168]
   lw $t3 -108($sp)
   sw $t3 -820($sp)

#------------659  WRITE INT reg[168]
   li $v0 1
   lw $a0 -820($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------660  FACTOR_VAR INT q2 save in reg[169]
   lw $t3 -100($sp)
   sw $t3 -824($sp)

#------------661  FACTOR_VAR INT q3 save in reg[170]
   lw $t3 -104($sp)
   sw $t3 -828($sp)

#------------662  IF reg[169] BEQ reg[170] THEN GOTO label_48
   lw $t0 -824($sp)
   lw $t1 -828($sp)
    beq $t0 $t1 label_48

#------------663  FACTOR_VAR INT q4 save in reg[171]
   lw $t3 -108($sp)
   sw $t3 -832($sp)

#------------664  FACTOR_CON INT 1 save in reg[172]
   li $t0 1
   sw $t0 -836($sp)

#------------665  reg[172] = reg[171] JIA reg[172]
   lw $t0 -832($sp)
   lw $t1 -836($sp)
   add $t2 $t0 $t1
   sw $t2 -836($sp)

#------------666  ASSIGN INT q4 = reg[172]
   lw $t3 -836($sp)
   sw $t3 -108($sp)

#------------667  JUMP to label_49
   j label_49

#------------668  label_48    ----------------Label----------------
label_48:

#------------669  label_49    ----------------Label----------------
label_49:

#------------670  FACTOR_VAR INT q4 save in reg[173]
   lw $t3 -108($sp)
   sw $t3 -840($sp)

#------------671  WRITE INT reg[173]
   li $v0 1
   lw $a0 -840($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------672  FACTOR_VAR INT q2 save in reg[174]
   lw $t3 -100($sp)
   sw $t3 -844($sp)

#------------673  FACTOR_VAR INT q3 save in reg[175]
   lw $t3 -104($sp)
   sw $t3 -848($sp)

#------------674  FACTOR_VAR INT q1 save in reg[176]
   lw $t3 -96($sp)
   sw $t3 -852($sp)

#------------675  reg[176] = reg[175] CHENG reg[176]
   lw $t0 -848($sp)
   lw $t1 -852($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -852($sp)

#------------676  IF reg[174] BNE reg[176] THEN GOTO label_50
   lw $t0 -844($sp)
   lw $t1 -852($sp)
    bne $t0 $t1 label_50

#------------677  FACTOR_VAR INT q4 save in reg[177]
   lw $t3 -108($sp)
   sw $t3 -856($sp)

#------------678  FACTOR_CON INT 1 save in reg[178]
   li $t0 1
   sw $t0 -860($sp)

#------------679  reg[178] = reg[177] JIA reg[178]
   lw $t0 -856($sp)
   lw $t1 -860($sp)
   add $t2 $t0 $t1
   sw $t2 -860($sp)

#------------680  ASSIGN INT q4 = reg[178]
   lw $t3 -860($sp)
   sw $t3 -108($sp)

#------------681  JUMP to label_51
   j label_51

#------------682  label_50    ----------------Label----------------
label_50:

#------------683  label_51    ----------------Label----------------
label_51:

#------------684  FACTOR_VAR INT q4 save in reg[179]
   lw $t3 -108($sp)
   sw $t3 -864($sp)

#------------685  WRITE INT reg[179]
   li $v0 1
   lw $a0 -864($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------686  JUMP to label_53
   j label_53

#------------687  label_52    ----------------Label----------------
label_52:

#------------688  label_53    ----------------Label----------------
label_53:

#------------689  FACTOR_VAR INT ord save in reg[180]
   lw $t3 -92($sp)
   sw $t3 -868($sp)

#------------690  FACTOR_CON INT 12 save in reg[181]
   li $t0 12
   sw $t0 -872($sp)

#------------691  IF reg[180] BNE reg[181] THEN GOTO label_54
   lw $t0 -868($sp)
   lw $t1 -872($sp)
    bne $t0 $t1 label_54

#------------692  CALL VOID test12(0)
   sw $ra -876($sp)
   addi $sp $sp -880
   jal .func_test12
   subi $sp $sp -880
   lw $ra -876($sp)

#------------693  JUMP to label_55
   j label_55

#------------694  label_54    ----------------Label----------------
label_54:

#------------695  label_55    ----------------Label----------------
label_55:

#------------696  FACTOR_VAR INT ord save in reg[182]
   lw $t3 -92($sp)
   sw $t3 -876($sp)

#------------697  FACTOR_CON INT 13 save in reg[183]
   li $t0 13
   sw $t0 -880($sp)

#------------698  IF reg[182] BNE reg[183] THEN GOTO label_56
   lw $t0 -876($sp)
   lw $t1 -880($sp)
    bne $t0 $t1 label_56

#------------699  CALL VOID test13(0)
   sw $ra -884($sp)
   addi $sp $sp -888
   jal .func_test13
   subi $sp $sp -888
   lw $ra -884($sp)

#------------700  JUMP to label_57
   j label_57

#------------701  label_56    ----------------Label----------------
label_56:

#------------702  label_57    ----------------Label----------------
label_57:

#------------703  FACTOR_VAR INT ord save in reg[184]
   lw $t3 -92($sp)
   sw $t3 -884($sp)

#------------704  FACTOR_CON INT 14 save in reg[185]
   li $t0 14
   sw $t0 -888($sp)

#------------705  IF reg[184] BNE reg[185] THEN GOTO label_58
   lw $t0 -884($sp)
   lw $t1 -888($sp)
    bne $t0 $t1 label_58

#------------706  FACTOR_CON INT 1 save in reg[186]
   li $t0 1
   sw $t0 -892($sp)

#------------707  FACTOR_CON INT 2 save in reg[187]
   li $t0 2
   sw $t0 -896($sp)

#------------708  FACTOR_CON INT 3 save in reg[188]
   li $t0 3
   sw $t0 -900($sp)

#------------709  FACTOR_CON INT 4 save in reg[189]
   li $t0 4
   sw $t0 -904($sp)

#------------710  FACTOR_CON INT 5 save in reg[190]
   li $t0 5
   sw $t0 -908($sp)

#------------711  PUSH INT parareg[9] from reg[186]
   sw $ra -912($sp)
   lw $t0 -892($sp)
   sw $t0 -916($sp)

#------------712  PUSH INT parareg[10] from reg[187]
   lw $t0 -896($sp)
   sw $t0 -920($sp)

#------------713  PUSH INT parareg[11] from reg[188]
   lw $t0 -900($sp)
   sw $t0 -924($sp)

#------------714  PUSH INT parareg[12] from reg[189]
   lw $t0 -904($sp)
   sw $t0 -928($sp)

#------------715  PUSH INT parareg[13] from reg[190]
   lw $t0 -908($sp)
   sw $t0 -932($sp)

#------------716  CALL VOID test14(5)
   addi $sp $sp -916
   jal .func_test14
   subi $sp $sp -916
   lw $ra -912($sp)

#------------717  JUMP to label_59
   j label_59

#------------718  label_58    ----------------Label----------------
label_58:

#------------719  label_59    ----------------Label----------------
label_59:

   jr $ra

end:
