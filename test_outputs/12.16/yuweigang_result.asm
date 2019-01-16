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

#------------37  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   sub $t2 $t0 $t1
   sw $t2 -36($sp)

#------------38  PUSH INT parareg[0] from reg[9]
   sw $ra -40($sp)
   lw $t0 -36($sp)
   sw $t0 -44($sp)

#------------39  CALL INT fib(1)
   addi $sp $sp -44
   jal .func_fib
   subi $sp $sp -44
   lw $ra -40($sp)

#------------40  FACTOR_FUNC INT fib save in reg[10]
   sw $v0 -40($sp)

#------------41  FACTOR_VAR INT n save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------42  FACTOR_CON INT 2 save in reg[12]
   li $t0 2
   sw $t0 -48($sp)

#------------43  reg[13] = reg[11] JIAN reg[12]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   sub $t2 $t0 $t1
   sw $t2 -52($sp)

#------------44  PUSH INT parareg[1] from reg[13]
   sw $ra -56($sp)
   lw $t0 -52($sp)
   sw $t0 -60($sp)

#------------45  CALL INT fib(1)
   addi $sp $sp -60
   jal .func_fib
   subi $sp $sp -60
   lw $ra -56($sp)

#------------46  FACTOR_FUNC INT fib save in reg[14]
   sw $v0 -56($sp)

#------------47  reg[15] = reg[10] JIA reg[14]
   lw $t0 -40($sp)
   lw $t1 -56($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------48  RETURN reg[15] TO $V0 AND THEN GOTO 0
   lw $v0 -60($sp)
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

#------------54  reg[3] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------55  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
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

#------------61  reg[3] = reg[1] JIA reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------62  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
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

#------------75  reg[3] = reg[1] JIA reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------76  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
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

#------------82  reg[3] = reg[1] JIA reg[2]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------83  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
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

#------------91  reg[3] = reg[1] JIA reg[2]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------92  WRITE INT reg[3]
   li $v0 1
   lw $a0 -12($sp)
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


#------------101  FACTOR_CON INT 95 save in reg[2]
   li $t0 95
   sw $t0 -16($sp)

#------------102  ASSIGN INT _d = reg[2]
   lw $t3 -16($sp)
   sw $t3 -8($sp)



















































#------------153  FACTOR_CON INT 2847 save in reg[53]
   li $t0 2847
   sw $t0 -220($sp)

#------------154  ASSIGN INT a = reg[53]
   lw $t3 -220($sp)
   sw $t3 0($sp)



















































#------------205  FACTOR_CON INT 2015 save in reg[104]
   li $t0 2015
   sw $t0 -424($sp)

#------------206  ASSIGN INT c = reg[104]
   lw $t3 -424($sp)
   sw $t3 -4($sp)

#------------207  FACTOR_VAR INT _d save in reg[105]
   lw $t3 -8($sp)
   sw $t3 -428($sp)

#------------208  WRITE INT reg[105]
   li $v0 1
   lw $a0 -428($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------209  FACTOR_VAR INT a save in reg[106]
   lw $t3 0($sp)
   sw $t3 -432($sp)

#------------210  WRITE INT reg[106]
   li $v0 1
   lw $a0 -432($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------211  FACTOR_VAR INT c save in reg[107]
   lw $t3 -4($sp)
   sw $t3 -436($sp)

#------------212  WRITE INT reg[107]
   li $v0 1
   lw $a0 -436($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------213  FUNC VOID test13(0)
   jr $ra

.func_test13:

#------------214  VAR INT a





















#------------235  FACTOR_CON INT 45 save in reg[21]
   li $t0 45
   sw $t0 -84($sp)

#------------236  ASSIGN INT a = reg[21]
   lw $t3 -84($sp)
   sw $t3 0($sp)

#------------237  FACTOR_VAR INT a save in reg[22]
   lw $t3 0($sp)
   sw $t3 -88($sp)

#------------238  WRITE INT reg[22]
   li $v0 1
   lw $a0 -88($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------239  FUNC VOID test14(5)
   jr $ra

.func_test14:

#------------240  PARA INT a

#------------241  PARA INT b

#------------242  PARA INT c

#------------243  PARA INT d

#------------244  PARA INT e

#------------245  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------246  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -24($sp)

#------------247  reg[3] = reg[1] JIA reg[2]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------248  FACTOR_VAR INT c save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------249  reg[5] = reg[3] JIA reg[4]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------250  FACTOR_VAR INT d save in reg[6]
   lw $t3 -12($sp)
   sw $t3 -40($sp)

#------------251  reg[7] = reg[5] JIA reg[6]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------252  FACTOR_VAR INT e save in reg[8]
   lw $t3 -16($sp)
   sw $t3 -48($sp)

#------------253  reg[9] = reg[7] JIA reg[8]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------254  WRITE INT reg[9]
   li $v0 1
   lw $a0 -52($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------255  FUNC VOID printf_2(0)
   jr $ra

.func_printf_2:

#------------256  FACTOR_CON INT 2 save in reg[1]
   li $t0 2
   sw $t0 0($sp)

#------------257  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------258  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 4($sp)
   jr $ra

#------------259  FUNC VOID main(0)
   jr $ra

.func_main:

#------------260  CONST INT a = 1

#------------261  CONST INT b = 2

#------------262  VAR CHAR c1

#------------263  VAR CHAR c2

#------------264  VAR CHAR c3

#------------265  VAR INT ord

#------------266  VAR INT q1

#------------267  VAR INT q2

#------------268  VAR INT q3

#------------269  VAR INT q4

#------------270  ARRAY INT s1[20]

#------------271  ARRAY INT t1[10]

#------------272  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -156($sp)

#------------273  ASSIGN INT q1 = reg[2]
   lw $t3 -156($sp)
   sw $t3 -16($sp)

#------------274  FACTOR_CON INT 0 save in reg[3]
   li $t0 0
   sw $t0 -160($sp)

#------------275  ASSIGN INT q2 = reg[3]
   lw $t3 -160($sp)
   sw $t3 -20($sp)

#------------276  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -164($sp)

#------------277  ASSIGN INT q3 = reg[4]
   lw $t3 -164($sp)
   sw $t3 -24($sp)

#------------278  READ INT ord
   li $v0 5
   syscall
   sw $v0 -12($sp)

#------------279  FACTOR_VAR INT ord save in reg[5]
   lw $t3 -12($sp)
   sw $t3 -168($sp)

#------------280  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -172($sp)

#------------281  IF reg[5] BNE reg[6] THEN GOTO label_4
   lw $t0 -168($sp)
   lw $t1 -172($sp)
    bne $t0 $t1 label_4

#------------282  READ INT q4
   li $v0 5
   syscall
   sw $v0 -28($sp)

#------------283  FACTOR_VAR INT q4 save in reg[7]
   lw $t3 -28($sp)
   sw $t3 -176($sp)

#------------284  PUSH INT parareg[2] from reg[7]
   sw $ra -180($sp)
   lw $t0 -176($sp)
   sw $t0 -184($sp)

#------------285  CALL INT fib(1)
   addi $sp $sp -184
   jal .func_fib
   subi $sp $sp -184
   lw $ra -180($sp)

#------------286  FACTOR_FUNC INT fib save in reg[8]
   sw $v0 -180($sp)

#------------287  ASSIGN INT q4 = reg[8]
   lw $t3 -180($sp)
   sw $t3 -28($sp)

#------------288  FACTOR_VAR INT q4 save in reg[9]
   lw $t3 -28($sp)
   sw $t3 -184($sp)

#------------289  WRITE INT reg[9]
   li $v0 1
   lw $a0 -184($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------290  JUMP to label_5
   j label_5

#------------291  label_4    ----------------Label----------------
label_4:

#------------292  label_5    ----------------Label----------------
label_5:

#------------293  FACTOR_VAR INT ord save in reg[10]
   lw $t3 -12($sp)
   sw $t3 -188($sp)

#------------294  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -192($sp)

#------------295  IF reg[10] BNE reg[11] THEN GOTO label_12
   lw $t0 -188($sp)
   lw $t1 -192($sp)
    bne $t0 $t1 label_12

#------------296  FACTOR_CON INT 2 save in reg[12]
   li $t0 2
   sw $t0 -196($sp)

#------------297  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -200($sp)

#------------298  IF reg[12] BLEQ reg[13] THEN GOTO label_6
   lw $t0 -196($sp)
   lw $t1 -200($sp)
    ble $t0 $t1 label_6



#------------301  FACTOR_CON INT 99 save in reg[16]
   li $t0 99
   sw $t0 -212($sp)

#------------302  ASSIGN INT q1 = reg[16]
   lw $t3 -212($sp)
   sw $t3 -16($sp)

#------------303  JUMP to label_7
   j label_7

#------------304  label_6    ----------------Label----------------
label_6:

#------------305  label_7    ----------------Label----------------
label_7:

#------------306  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -216($sp)

#------------307  FACTOR_CON INT 0 save in reg[18]
   li $t0 0
   sw $t0 -220($sp)

#------------308  IF reg[17] BGEQ reg[18] THEN GOTO label_8
   lw $t0 -216($sp)
   lw $t1 -220($sp)
    bge $t0 $t1 label_8



#------------311  FACTOR_CON INT 98 save in reg[21]
   li $t0 98
   sw $t0 -232($sp)

#------------312  ASSIGN INT q2 = reg[21]
   lw $t3 -232($sp)
   sw $t3 -20($sp)

#------------313  JUMP to label_11
   j label_11

#------------314  label_8    ----------------Label----------------
label_8:

#------------315  FACTOR_CON INT 2 save in reg[22]
   li $t0 2
   sw $t0 -236($sp)

#------------316  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -240($sp)

#------------317  IF reg[22] BGEQ reg[23] THEN GOTO label_9
   lw $t0 -236($sp)
   lw $t1 -240($sp)
    bge $t0 $t1 label_9



#------------320  FACTOR_CON INT 99 save in reg[26]
   li $t0 99
   sw $t0 -252($sp)

#------------321  ASSIGN INT q3 = reg[26]
   lw $t3 -252($sp)
   sw $t3 -24($sp)

#------------322  JUMP to label_10
   j label_10

#------------323  label_9    ----------------Label----------------
label_9:



#------------326  FACTOR_CON INT 97 save in reg[29]
   li $t0 97
   sw $t0 -264($sp)

#------------327  ASSIGN INT q3 = reg[29]
   lw $t3 -264($sp)
   sw $t3 -24($sp)

#------------328  label_10    ----------------Label----------------
label_10:

#------------329  label_11    ----------------Label----------------
label_11:

#------------330  FACTOR_VAR INT q1 save in reg[30]
   lw $t3 -16($sp)
   sw $t3 -268($sp)

#------------331  WRITE q1=
   li $v0 4
   la $a0 .str_0
   syscall

#------------332  WRITE INT reg[30]
   li $v0 1
   lw $a0 -268($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------333  FACTOR_VAR INT q2 save in reg[31]
   lw $t3 -20($sp)
   sw $t3 -272($sp)

#------------334  WRITE q2=
   li $v0 4
   la $a0 .str_1
   syscall

#------------335  WRITE INT reg[31]
   li $v0 1
   lw $a0 -272($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------336  FACTOR_VAR INT q3 save in reg[32]
   lw $t3 -24($sp)
   sw $t3 -276($sp)

#------------337  WRITE q3=
   li $v0 4
   la $a0 .str_2
   syscall

#------------338  WRITE INT reg[32]
   li $v0 1
   lw $a0 -276($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------339  JUMP to label_13
   j label_13

#------------340  label_12    ----------------Label----------------
label_12:

#------------341  label_13    ----------------Label----------------
label_13:

#------------342  FACTOR_VAR INT ord save in reg[33]
   lw $t3 -12($sp)
   sw $t3 -280($sp)

#------------343  FACTOR_CON INT 3 save in reg[34]
   li $t0 3
   sw $t0 -284($sp)

#------------344  IF reg[33] BNE reg[34] THEN GOTO label_18
   lw $t0 -280($sp)
   lw $t1 -284($sp)
    bne $t0 $t1 label_18

#------------345  label_14    ----------------Label----------------
label_14:

#------------346  FACTOR_VAR INT q2 save in reg[35]
   lw $t3 -20($sp)
   sw $t3 -288($sp)

#------------347  FACTOR_CON INT 3 save in reg[36]
   li $t0 3
   sw $t0 -292($sp)

#------------348  IF reg[35] BGEQ reg[36] THEN GOTO label_15
   lw $t0 -288($sp)
   lw $t1 -292($sp)
    bge $t0 $t1 label_15

#------------349  FACTOR_VAR INT q2 save in reg[37]
   lw $t3 -20($sp)
   sw $t3 -296($sp)

#------------350  FACTOR_CON INT 1 save in reg[38]
   li $t0 1
   sw $t0 -300($sp)

#------------351  reg[39] = reg[37] JIA reg[38]
   lw $t0 -296($sp)
   lw $t1 -300($sp)
   add $t2 $t0 $t1
   sw $t2 -304($sp)

#------------352  ASSIGN INT q2 = reg[39]
   lw $t3 -304($sp)
   sw $t3 -20($sp)

#------------353  JUMP to label_14
   j label_14

#------------354  label_15    ----------------Label----------------
label_15:

#------------355  WRITE before q2:
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------356  FACTOR_VAR INT q2 save in reg[40]
   lw $t3 -20($sp)
   sw $t3 -308($sp)

#------------357  WRITE INT reg[40]
   li $v0 1
   lw $a0 -308($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------358  label_16    ----------------Label----------------
label_16:

#------------359  FACTOR_VAR INT q2 save in reg[41]
   lw $t3 -20($sp)
   sw $t3 -312($sp)

#------------360  IF reg[41] BEQ reg[0] THEN GOTO label_17
   lw $t0 -312($sp)
    beq $t0 $0 label_17

#------------361  FACTOR_VAR INT q2 save in reg[42]
   lw $t3 -20($sp)
   sw $t3 -316($sp)

#------------362  FACTOR_CON INT 1 save in reg[43]
   li $t0 1
   sw $t0 -320($sp)

#------------363  reg[44] = reg[42] JIAN reg[43]
   lw $t0 -316($sp)
   lw $t1 -320($sp)
   sub $t2 $t0 $t1
   sw $t2 -324($sp)

#------------364  ASSIGN INT q2 = reg[44]
   lw $t3 -324($sp)
   sw $t3 -20($sp)

#------------365  JUMP to label_16
   j label_16

#------------366  label_17    ----------------Label----------------
label_17:

#------------367  WRITE later q2:
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------368  FACTOR_VAR INT q2 save in reg[45]
   lw $t3 -20($sp)
   sw $t3 -328($sp)

#------------369  WRITE INT reg[45]
   li $v0 1
   lw $a0 -328($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------370  JUMP to label_19
   j label_19

#------------371  label_18    ----------------Label----------------
label_18:

#------------372  label_19    ----------------Label----------------
label_19:

#------------373  FACTOR_VAR INT ord save in reg[46]
   lw $t3 -12($sp)
   sw $t3 -332($sp)

#------------374  FACTOR_CON INT 4 save in reg[47]
   li $t0 4
   sw $t0 -336($sp)

#------------375  IF reg[46] BNE reg[47] THEN GOTO label_22
   lw $t0 -332($sp)
   lw $t1 -336($sp)
    bne $t0 $t1 label_22

#------------376  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -340($sp)

#------------377  ASSIGN INT q4 = reg[48]
   lw $t3 -340($sp)
   sw $t3 -28($sp)

#------------378  label_20    ----------------Label----------------
label_20:

#------------379  FACTOR_VAR INT q2 save in reg[49]
   lw $t3 -20($sp)
   sw $t3 -344($sp)

#------------380  FACTOR_CON INT 1 save in reg[50]
   li $t0 1
   sw $t0 -348($sp)

#------------381  reg[51] = reg[49] JIA reg[50]
   lw $t0 -344($sp)
   lw $t1 -348($sp)
   add $t2 $t0 $t1
   sw $t2 -352($sp)

#------------382  ASSIGN INT q2 = reg[51]
   lw $t3 -352($sp)
   sw $t3 -20($sp)

#------------383  FACTOR_VAR INT q4 save in reg[52]
   lw $t3 -28($sp)
   sw $t3 -356($sp)

#------------384  FACTOR_CON INT 1 save in reg[53]
   li $t0 1
   sw $t0 -360($sp)

#------------385  reg[54] = reg[52] JIA reg[53]
   lw $t0 -356($sp)
   lw $t1 -360($sp)
   add $t2 $t0 $t1
   sw $t2 -364($sp)

#------------386  ASSIGN INT q4 = reg[54]
   lw $t3 -364($sp)
   sw $t3 -28($sp)

#------------387  FACTOR_VAR INT q4 save in reg[55]
   lw $t3 -28($sp)
   sw $t3 -368($sp)

#------------388  FACTOR_CON INT 4 save in reg[56]
   li $t0 4
   sw $t0 -372($sp)

#------------389  IF reg[55] BLSS reg[56] THEN GOTO label_20
   lw $t0 -368($sp)
   lw $t1 -372($sp)
    blt $t0 $t1 label_20

#------------390  WRITE before q2:
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------391  FACTOR_VAR INT q2 save in reg[57]
   lw $t3 -20($sp)
   sw $t3 -376($sp)

#------------392  WRITE INT reg[57]
   li $v0 1
   lw $a0 -376($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------393  FACTOR_CON INT 1 save in reg[58]
   li $t0 1
   sw $t0 -380($sp)

#------------394  ASSIGN INT q4 = reg[58]
   lw $t3 -380($sp)
   sw $t3 -28($sp)

#------------395  label_21    ----------------Label----------------
label_21:

#------------396  FACTOR_VAR INT q2 save in reg[59]
   lw $t3 -20($sp)
   sw $t3 -384($sp)

#------------397  FACTOR_CON INT 1 save in reg[60]
   li $t0 1
   sw $t0 -388($sp)

#------------398  reg[61] = reg[59] JIA reg[60]
   lw $t0 -384($sp)
   lw $t1 -388($sp)
   add $t2 $t0 $t1
   sw $t2 -392($sp)

#------------399  ASSIGN INT q2 = reg[61]
   lw $t3 -392($sp)
   sw $t3 -20($sp)

#------------400  FACTOR_VAR INT q4 save in reg[62]
   lw $t3 -28($sp)
   sw $t3 -396($sp)

#------------401  FACTOR_CON INT 1 save in reg[63]
   li $t0 1
   sw $t0 -400($sp)

#------------402  reg[64] = reg[62] JIA reg[63]
   lw $t0 -396($sp)
   lw $t1 -400($sp)
   add $t2 $t0 $t1
   sw $t2 -404($sp)

#------------403  ASSIGN INT q4 = reg[64]
   lw $t3 -404($sp)
   sw $t3 -28($sp)

#------------404  FACTOR_VAR INT q4 save in reg[65]
   lw $t3 -28($sp)
   sw $t3 -408($sp)

#------------405  FACTOR_CON INT 1 save in reg[66]
   li $t0 1
   sw $t0 -412($sp)

#------------406  IF reg[65] BLSS reg[66] THEN GOTO label_21
   lw $t0 -408($sp)
   lw $t1 -412($sp)
    blt $t0 $t1 label_21

#------------407  WRITE later q2:
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------408  FACTOR_VAR INT q2 save in reg[67]
   lw $t3 -20($sp)
   sw $t3 -416($sp)

#------------409  WRITE INT reg[67]
   li $v0 1
   lw $a0 -416($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------410  JUMP to label_23
   j label_23

#------------411  label_22    ----------------Label----------------
label_22:

#------------412  label_23    ----------------Label----------------
label_23:

#------------413  FACTOR_VAR INT ord save in reg[68]
   lw $t3 -12($sp)
   sw $t3 -420($sp)

#------------414  FACTOR_CON INT 5 save in reg[69]
   li $t0 5
   sw $t0 -424($sp)

#------------415  IF reg[68] BNE reg[69] THEN GOTO label_24
   lw $t0 -420($sp)
   lw $t1 -424($sp)
    bne $t0 $t1 label_24

#------------416  WRITE ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------417  WRITE []^_`abcdefghijklmnopqrstuvwxyz{|}~
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------418  JUMP to label_25
   j label_25

#------------419  label_24    ----------------Label----------------
label_24:

#------------420  label_25    ----------------Label----------------
label_25:

#------------421  FACTOR_VAR INT ord save in reg[70]
   lw $t3 -12($sp)
   sw $t3 -428($sp)

#------------422  FACTOR_CON INT 6 save in reg[71]
   li $t0 6
   sw $t0 -432($sp)

#------------423  IF reg[70] BNE reg[71] THEN GOTO label_26
   lw $t0 -428($sp)
   lw $t1 -432($sp)
    bne $t0 $t1 label_26

#------------424  FACTOR_CON INT 1 save in reg[72]
   li $t0 1
   sw $t0 -436($sp)

#------------425  PUSH INT parareg[3] from reg[72]
   sw $ra -440($sp)
   lw $t0 -436($sp)
   sw $t0 -444($sp)

#------------426  CALL INT int_add1(1)
   addi $sp $sp -444
   jal .func_int_add1
   subi $sp $sp -444
   lw $ra -440($sp)

#------------427  FACTOR_FUNC INT int_add1 save in reg[73]
   sw $v0 -440($sp)

#------------428  ASSIGN INT q1 = reg[73]
   lw $t3 -440($sp)
   sw $t3 -16($sp)

#------------429  FACTOR_VAR INT q1 save in reg[74]
   lw $t3 -16($sp)
   sw $t3 -444($sp)

#------------430  WRITE INT reg[74]
   li $v0 1
   lw $a0 -444($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------431  CALL CHAR return_c(0)
   sw $ra -448($sp)
   addi $sp $sp -452
   jal .func_return_c
   subi $sp $sp -452
   lw $ra -448($sp)

#------------432  FACTOR_FUNC CHAR return_c save in reg[75]
   sw $v0 -448($sp)

#------------433  ASSIGN CHAR c1 = reg[75]
   lw $t3 -448($sp)
   sw $t3 0($sp)

#------------434  FACTOR_VAR CHAR c1 save in reg[76]
   lw $t3 0($sp)
   sw $t3 -452($sp)

#------------435  WRITE CHAR reg[76]
   li $v0 11
   lw $a0 -452($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------436  JUMP to label_27
   j label_27

#------------437  label_26    ----------------Label----------------
label_26:

#------------438  label_27    ----------------Label----------------
label_27:

#------------439  FACTOR_VAR INT ord save in reg[77]
   lw $t3 -12($sp)
   sw $t3 -456($sp)

#------------440  FACTOR_CON INT 7 save in reg[78]
   li $t0 7
   sw $t0 -460($sp)

#------------441  IF reg[77] BNE reg[78] THEN GOTO label_28
   lw $t0 -456($sp)
   lw $t1 -460($sp)
    bne $t0 $t1 label_28

#------------442  CALL VOID printf_2(0)
   sw $ra -464($sp)
   addi $sp $sp -468
   jal .func_printf_2
   subi $sp $sp -468
   lw $ra -464($sp)

#------------443  FACTOR_CON CHAR 99 save in reg[79]
   li $t0 99
   sw $t0 -464($sp)

#------------444  PUSH INT parareg[4] from reg[79]
   sw $ra -468($sp)
   lw $t0 -464($sp)
   sw $t0 -472($sp)

#------------445  CALL VOID printf_charadd1(1)
   addi $sp $sp -472
   jal .func_printf_charadd1
   subi $sp $sp -472
   lw $ra -468($sp)

#------------446  JUMP to label_29
   j label_29

#------------447  label_28    ----------------Label----------------
label_28:

#------------448  label_29    ----------------Label----------------
label_29:

#------------449  FACTOR_VAR INT ord save in reg[80]
   lw $t3 -12($sp)
   sw $t3 -468($sp)

#------------450  FACTOR_CON INT 8 save in reg[81]
   li $t0 8
   sw $t0 -472($sp)

#------------451  IF reg[80] BNE reg[81] THEN GOTO label_30
   lw $t0 -468($sp)
   lw $t1 -472($sp)
    bne $t0 $t1 label_30

#------------452  FACTOR_CON INT 10 save in reg[82]
   li $t0 10
   sw $t0 -476($sp)

#------------453  ASSIGN INT q1 = reg[82]
   lw $t3 -476($sp)
   sw $t3 -16($sp)

#------------454  FACTOR_VAR INT q1 save in reg[83]
   lw $t3 -16($sp)
   sw $t3 -480($sp)

#------------455  WRITE INT reg[83]
   li $v0 1
   lw $a0 -480($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------458  FACTOR_CON INT 2 save in reg[86]
   li $t0 2
   sw $t0 -492($sp)

#------------459  FACTOR_CON INT 97 save in reg[87]
   li $t0 97
   sw $t0 -496($sp)

#------------460  ASSIGN_ARR INT s1[reg[86]] = reg[87]
   lw $t0 -492($sp)
   lw $t1 -496($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -32($t0)

#------------461  FACTOR_CON INT 2 save in reg[88]
   li $t0 2
   sw $t0 -500($sp)

#------------462  FACTOR_ARRAY INT s1 [reg[88]] save in reg[89]
   lw $t3 -500($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -32($t3)
   sw $t3 -504($sp)

#------------463  WRITE INT reg[89]
   li $v0 1
   lw $a0 -504($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------464  JUMP to label_31
   j label_31

#------------465  label_30    ----------------Label----------------
label_30:

#------------466  label_31    ----------------Label----------------
label_31:

#------------467  FACTOR_VAR INT ord save in reg[90]
   lw $t3 -12($sp)
   sw $t3 -508($sp)

#------------468  FACTOR_CON INT 9 save in reg[91]
   li $t0 9
   sw $t0 -512($sp)

#------------469  IF reg[90] BNE reg[91] THEN GOTO label_32
   lw $t0 -508($sp)
   lw $t1 -512($sp)
    bne $t0 $t1 label_32

#------------470  READ INT q1
   li $v0 5
   syscall
   sw $v0 -16($sp)

#------------471  READ CHAR c1
   li $v0 12
   syscall
   sw $v0 0($sp)

#------------472  WRITE test9
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------473  FACTOR_VAR INT q1 save in reg[92]
   lw $t3 -16($sp)
   sw $t3 -516($sp)

#------------474  WRITE q1=
   li $v0 4
   la $a0 .str_0
   syscall

#------------475  WRITE INT reg[92]
   li $v0 1
   lw $a0 -516($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------476  WRITE c1=
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------477  FACTOR_VAR CHAR c1 save in reg[93]
   lw $t3 0($sp)
   sw $t3 -520($sp)

#------------478  WRITE CHAR reg[93]
   li $v0 11
   lw $a0 -520($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------479  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -148($sp)
   jr $ra

#------------480  JUMP to label_33
   j label_33

#------------481  label_32    ----------------Label----------------
label_32:

#------------482  label_33    ----------------Label----------------
label_33:

#------------483  FACTOR_VAR INT ord save in reg[94]
   lw $t3 -12($sp)
   sw $t3 -524($sp)

#------------484  FACTOR_CON INT 10 save in reg[95]
   li $t0 10
   sw $t0 -528($sp)

#------------485  IF reg[94] BNE reg[95] THEN GOTO label_34
   lw $t0 -524($sp)
   lw $t1 -528($sp)
    bne $t0 $t1 label_34

#------------486  FACTOR_CON INT 1 save in reg[96]
   li $t0 1
   sw $t0 -532($sp)

#------------487  ASSIGN INT q1 = reg[96]
   lw $t3 -532($sp)
   sw $t3 -16($sp)

#------------488  FACTOR_CON INT 2 save in reg[97]
   li $t0 2
   sw $t0 -536($sp)

#------------489  ASSIGN INT q2 = reg[97]
   lw $t3 -536($sp)
   sw $t3 -20($sp)

#------------490  FACTOR_VAR INT q1 save in reg[98]
   lw $t3 -16($sp)
   sw $t3 -540($sp)

#------------491  ASSIGN INT q3 = reg[98]
   lw $t3 -540($sp)
   sw $t3 -24($sp)





#------------496  FACTOR_CON INT 7 save in reg[103]
   li $t0 7
   sw $t0 -560($sp)

#------------497  FACTOR_CON INT 2 save in reg[104]
   li $t0 2
   sw $t0 -564($sp)

#------------498  ASSIGN_ARR INT s1[reg[103]] = reg[104]
   lw $t0 -560($sp)
   lw $t1 -564($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -32($t0)

#------------499  FACTOR_VAR INT q3 save in reg[105]
   lw $t3 -24($sp)
   sw $t3 -568($sp)

#------------500  WRITE INT reg[105]
   li $v0 1
   lw $a0 -568($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------503  FACTOR_CON INT -100 save in reg[108]
   li $t0 -100
   sw $t0 -580($sp)

#------------504  ASSIGN INT q3 = reg[108]
   lw $t3 -580($sp)
   sw $t3 -24($sp)

#------------505  FACTOR_VAR INT q3 save in reg[109]
   lw $t3 -24($sp)
   sw $t3 -584($sp)

#------------506  WRITE INT reg[109]
   li $v0 1
   lw $a0 -584($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------507  FACTOR_VAR INT q1 save in reg[110]
   lw $t3 -16($sp)
   sw $t3 -588($sp)

#------------508  FACTOR_VAR INT q3 save in reg[111]
   lw $t3 -24($sp)
   sw $t3 -592($sp)

#------------509  reg[112] = reg[110] CHENG reg[111]
   lw $t0 -588($sp)
   lw $t1 -592($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -596($sp)

#------------510  FACTOR_VAR INT q2 save in reg[113]
   lw $t3 -20($sp)
   sw $t3 -600($sp)

#------------511  reg[114] = reg[112] CHU reg[113]
   lw $t0 -596($sp)
   lw $t1 -600($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -604($sp)






#------------517  FACTOR_CON INT 10 save in reg[120]
   li $t0 10
   sw $t0 -628($sp)

#------------518  reg[121] = reg[114] JIAN reg[120]
   lw $t0 -604($sp)
   lw $t1 -628($sp)
   sub $t2 $t0 $t1
   sw $t2 -632($sp)




#------------522  FACTOR_CON INT 101 save in reg[125]
   li $t0 101
   sw $t0 -648($sp)

#------------523  reg[126] = reg[121] JIA reg[125]
   lw $t0 -632($sp)
   lw $t1 -648($sp)
   add $t2 $t0 $t1
   sw $t2 -652($sp)

#------------524  CALL CHAR return_c(0)
   sw $ra -656($sp)
   addi $sp $sp -660
   jal .func_return_c
   subi $sp $sp -660
   lw $ra -656($sp)

#------------525  FACTOR_FUNC CHAR return_c save in reg[127]
   sw $v0 -656($sp)

#------------526  FACTOR_EXPR reg[127] save in reg[128]
   lw $t0 -656($sp)
   sw $t0 -660($sp)

#------------527  reg[129] = reg[126] JIAN reg[128]
   lw $t0 -652($sp)
   lw $t1 -660($sp)
   sub $t2 $t0 $t1
   sw $t2 -664($sp)

#------------528  FACTOR_CON CHAR 98 save in reg[130]
   li $t0 98
   sw $t0 -668($sp)

#------------529  FACTOR_CON INT 1 save in reg[131]
   li $t0 1
   sw $t0 -672($sp)

#------------530  PUSH INT parareg[5] from reg[130]
   sw $ra -676($sp)
   lw $t0 -668($sp)
   sw $t0 -680($sp)

#------------531  PUSH INT parareg[6] from reg[131]
   lw $t0 -672($sp)
   sw $t0 -684($sp)

#------------532  CALL INT ch_add_int(2)
   addi $sp $sp -680
   jal .func_ch_add_int
   subi $sp $sp -680
   lw $ra -676($sp)

#------------533  FACTOR_FUNC INT ch_add_int save in reg[132]
   sw $v0 -676($sp)

#------------534  FACTOR_EXPR reg[132] save in reg[133]
   lw $t0 -676($sp)
   sw $t0 -680($sp)

#------------535  reg[134] = reg[129] JIA reg[133]
   lw $t0 -664($sp)
   lw $t1 -680($sp)
   add $t2 $t0 $t1
   sw $t2 -684($sp)

#------------536  FACTOR_CON INT 7 save in reg[135]
   li $t0 7
   sw $t0 -688($sp)

#------------537  FACTOR_ARRAY INT s1 [reg[135]] save in reg[136]
   lw $t3 -688($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -32($t3)
   sw $t3 -692($sp)

#------------538  FACTOR_CON INT 2 save in reg[137]
   li $t0 2
   sw $t0 -696($sp)

#------------539  reg[138] = reg[136] CHENG reg[137]
   lw $t0 -692($sp)
   lw $t1 -696($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -700($sp)

#------------540  reg[139] = reg[134] JIAN reg[138]
   lw $t0 -684($sp)
   lw $t1 -700($sp)
   sub $t2 $t0 $t1
   sw $t2 -704($sp)

#------------541  ASSIGN INT q4 = reg[139]
   lw $t3 -704($sp)
   sw $t3 -28($sp)

#------------542  FACTOR_VAR INT q4 save in reg[140]
   lw $t3 -28($sp)
   sw $t3 -708($sp)

#------------543  WRITE INT reg[140]
   li $v0 1
   lw $a0 -708($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------544  FACTOR_CON INT 0 save in reg[141]
   li $t0 0
   sw $t0 -712($sp)



#------------547  FACTOR_CON INT 120 save in reg[144]
   li $t0 120
   sw $t0 -724($sp)

#------------548  ASSIGN_ARR INT t1[reg[141]] = reg[144]
   lw $t0 -712($sp)
   lw $t1 -724($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -112($t0)

#------------549  FACTOR_CON INT 1 save in reg[145]
   li $t0 1
   sw $t0 -728($sp)

#------------550  FACTOR_CON INT 7 save in reg[146]
   li $t0 7
   sw $t0 -732($sp)

#------------551  FACTOR_ARRAY INT s1 [reg[146]] save in reg[147]
   lw $t3 -732($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -32($t3)
   sw $t3 -736($sp)

#------------552  FACTOR_CON CHAR 0 save in reg[148]
   li $t0 0
   sw $t0 -740($sp)

#------------553  reg[149] = reg[148] JIAN reg[147]
   lw $t0 -740($sp)
   lw $t1 -736($sp)
   sub $t2 $t0 $t1
   sw $t2 -744($sp)



#------------556  FACTOR_CON INT 6 save in reg[152]
   li $t0 6
   sw $t0 -756($sp)

#------------557  reg[153] = reg[149] JIA reg[152]
   lw $t0 -744($sp)
   lw $t1 -756($sp)
   add $t2 $t0 $t1
   sw $t2 -760($sp)

#------------558  ASSIGN_ARR INT t1[reg[145]] = reg[153]
   lw $t0 -728($sp)
   lw $t1 -760($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -112($t0)





#------------563  FACTOR_CON INT 2 save in reg[158]
   li $t0 2
   sw $t0 -780($sp)

#------------564  FACTOR_CON INT 2 save in reg[159]
   li $t0 2
   sw $t0 -784($sp)



#------------567  FACTOR_CON INT -1 save in reg[162]
   li $t0 -1
   sw $t0 -796($sp)

#------------568  PUSH INT parareg[7] from reg[159]
   sw $ra -800($sp)
   lw $t0 -784($sp)
   sw $t0 -804($sp)

#------------569  PUSH INT parareg[8] from reg[162]
   lw $t0 -796($sp)
   sw $t0 -808($sp)

#------------570  CALL INT sum(2)
   addi $sp $sp -804
   jal .func_sum
   subi $sp $sp -804
   lw $ra -800($sp)

#------------571  FACTOR_FUNC INT sum save in reg[163]
   sw $v0 -800($sp)

#------------572  ASSIGN_ARR INT t1[reg[158]] = reg[163]
   lw $t0 -780($sp)
   lw $t1 -800($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -112($t0)

#------------573  FACTOR_CON INT 1 save in reg[164]
   li $t0 1
   sw $t0 -804($sp)

#------------574  FACTOR_ARRAY INT t1 [reg[164]] save in reg[165]
   lw $t3 -804($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -112($t3)
   sw $t3 -808($sp)

#------------575  FACTOR_CON INT 140 save in reg[166]
   li $t0 140
   sw $t0 -812($sp)

#------------576  reg[167] = reg[165] JIA reg[166]
   lw $t0 -808($sp)
   lw $t1 -812($sp)
   add $t2 $t0 $t1
   sw $t2 -816($sp)

#------------577  FACTOR_EXPR reg[167] save in reg[168]
   lw $t0 -816($sp)
   sw $t0 -820($sp)

#------------578  FACTOR_CON INT 2 save in reg[169]
   li $t0 2
   sw $t0 -824($sp)

#------------579  FACTOR_ARRAY INT t1 [reg[169]] save in reg[170]
   lw $t3 -824($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -112($t3)
   sw $t3 -828($sp)

#------------580  reg[171] = reg[168] CHENG reg[170]
   lw $t0 -820($sp)
   lw $t1 -828($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -832($sp)

#------------581  FACTOR_CON INT 0 save in reg[172]
   li $t0 0
   sw $t0 -836($sp)

#------------582  FACTOR_ARRAY INT t1 [reg[172]] save in reg[173]
   lw $t3 -836($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -112($t3)
   sw $t3 -840($sp)

#------------583  reg[174] = reg[171] JIAN reg[173]
   lw $t0 -832($sp)
   lw $t1 -840($sp)
   sub $t2 $t0 $t1
   sw $t2 -844($sp)

#------------584  FACTOR_CON INT 40 save in reg[175]
   li $t0 40
   sw $t0 -848($sp)

#------------585  reg[176] = reg[174] JIA reg[175]
   lw $t0 -844($sp)
   lw $t1 -848($sp)
   add $t2 $t0 $t1
   sw $t2 -852($sp)

#------------586  ASSIGN INT q1 = reg[176]
   lw $t3 -852($sp)
   sw $t3 -16($sp)

#------------587  FACTOR_VAR INT q1 save in reg[177]
   lw $t3 -16($sp)
   sw $t3 -856($sp)

#------------588  WRITE INT reg[177]
   li $v0 1
   lw $a0 -856($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------589  JUMP to label_35
   j label_35

#------------590  label_34    ----------------Label----------------
label_34:

#------------591  label_35    ----------------Label----------------
label_35:

#------------592  FACTOR_VAR INT ord save in reg[178]
   lw $t3 -12($sp)
   sw $t3 -860($sp)

#------------593  FACTOR_CON INT 11 save in reg[179]
   li $t0 11
   sw $t0 -864($sp)

#------------594  IF reg[178] BNE reg[179] THEN GOTO label_48
   lw $t0 -860($sp)
   lw $t1 -864($sp)
    bne $t0 $t1 label_48

#------------595  FACTOR_CON INT 1 save in reg[180]
   li $t0 1
   sw $t0 -868($sp)

#------------596  ASSIGN INT q1 = reg[180]
   lw $t3 -868($sp)
   sw $t3 -16($sp)

#------------597  FACTOR_CON INT 2 save in reg[181]
   li $t0 2
   sw $t0 -872($sp)

#------------598  ASSIGN INT q2 = reg[181]
   lw $t3 -872($sp)
   sw $t3 -20($sp)

#------------599  FACTOR_CON INT 2 save in reg[182]
   li $t0 2
   sw $t0 -876($sp)

#------------600  ASSIGN INT q3 = reg[182]
   lw $t3 -876($sp)
   sw $t3 -24($sp)

#------------601  FACTOR_CON INT 0 save in reg[183]
   li $t0 0
   sw $t0 -880($sp)

#------------602  ASSIGN INT q4 = reg[183]
   lw $t3 -880($sp)
   sw $t3 -28($sp)

#------------603  FACTOR_VAR INT q1 save in reg[184]
   lw $t3 -16($sp)
   sw $t3 -884($sp)

#------------604  FACTOR_VAR INT q2 save in reg[185]
   lw $t3 -20($sp)
   sw $t3 -888($sp)

#------------605  IF reg[184] BGEQ reg[185] THEN GOTO label_36
   lw $t0 -884($sp)
   lw $t1 -888($sp)
    bge $t0 $t1 label_36

#------------606  FACTOR_VAR INT q4 save in reg[186]
   lw $t3 -28($sp)
   sw $t3 -892($sp)

#------------607  FACTOR_CON INT 1 save in reg[187]
   li $t0 1
   sw $t0 -896($sp)

#------------608  reg[188] = reg[186] JIA reg[187]
   lw $t0 -892($sp)
   lw $t1 -896($sp)
   add $t2 $t0 $t1
   sw $t2 -900($sp)

#------------609  ASSIGN INT q4 = reg[188]
   lw $t3 -900($sp)
   sw $t3 -28($sp)

#------------610  JUMP to label_37
   j label_37

#------------611  label_36    ----------------Label----------------
label_36:

#------------612  label_37    ----------------Label----------------
label_37:

#------------613  FACTOR_VAR INT q4 save in reg[189]
   lw $t3 -28($sp)
   sw $t3 -904($sp)

#------------614  WRITE INT reg[189]
   li $v0 1
   lw $a0 -904($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------615  FACTOR_VAR INT q1 save in reg[190]
   lw $t3 -16($sp)
   sw $t3 -908($sp)

#------------616  FACTOR_VAR INT q3 save in reg[191]
   lw $t3 -24($sp)
   sw $t3 -912($sp)

#------------617  FACTOR_VAR INT q2 save in reg[192]
   lw $t3 -20($sp)
   sw $t3 -916($sp)

#------------618  reg[193] = reg[191] CHU reg[192]
   lw $t0 -912($sp)
   lw $t1 -916($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -920($sp)

#------------619  IF reg[190] BGTR reg[193] THEN GOTO label_38
   lw $t0 -908($sp)
   lw $t1 -920($sp)
    bgt $t0 $t1 label_38

#------------620  FACTOR_VAR INT q4 save in reg[194]
   lw $t3 -28($sp)
   sw $t3 -924($sp)

#------------621  FACTOR_CON INT 1 save in reg[195]
   li $t0 1
   sw $t0 -928($sp)

#------------622  reg[196] = reg[194] JIA reg[195]
   lw $t0 -924($sp)
   lw $t1 -928($sp)
   add $t2 $t0 $t1
   sw $t2 -932($sp)

#------------623  ASSIGN INT q4 = reg[196]
   lw $t3 -932($sp)
   sw $t3 -28($sp)

#------------624  JUMP to label_39
   j label_39

#------------625  label_38    ----------------Label----------------
label_38:

#------------626  label_39    ----------------Label----------------
label_39:

#------------627  FACTOR_VAR INT q4 save in reg[197]
   lw $t3 -28($sp)
   sw $t3 -936($sp)

#------------628  WRITE INT reg[197]
   li $v0 1
   lw $a0 -936($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------629  FACTOR_VAR INT q2 save in reg[198]
   lw $t3 -20($sp)
   sw $t3 -940($sp)

#------------630  FACTOR_VAR INT q3 save in reg[199]
   lw $t3 -24($sp)
   sw $t3 -944($sp)

#------------631  IF reg[198] BLEQ reg[199] THEN GOTO label_40
   lw $t0 -940($sp)
   lw $t1 -944($sp)
    ble $t0 $t1 label_40

#------------632  FACTOR_VAR INT q4 save in reg[200]
   lw $t3 -28($sp)
   sw $t3 -948($sp)

#------------633  FACTOR_CON INT 1 save in reg[201]
   li $t0 1
   sw $t0 -952($sp)

#------------634  reg[202] = reg[200] JIA reg[201]
   lw $t0 -948($sp)
   lw $t1 -952($sp)
   add $t2 $t0 $t1
   sw $t2 -956($sp)

#------------635  ASSIGN INT q4 = reg[202]
   lw $t3 -956($sp)
   sw $t3 -28($sp)

#------------636  JUMP to label_41
   j label_41

#------------637  label_40    ----------------Label----------------
label_40:

#------------638  label_41    ----------------Label----------------
label_41:

#------------639  FACTOR_VAR INT q4 save in reg[203]
   lw $t3 -28($sp)
   sw $t3 -960($sp)

#------------640  WRITE INT reg[203]
   li $v0 1
   lw $a0 -960($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------641  FACTOR_VAR INT q2 save in reg[204]
   lw $t3 -20($sp)
   sw $t3 -964($sp)

#------------642  FACTOR_VAR INT q3 save in reg[205]
   lw $t3 -24($sp)
   sw $t3 -968($sp)

#------------643  IF reg[204] BLSS reg[205] THEN GOTO label_42
   lw $t0 -964($sp)
   lw $t1 -968($sp)
    blt $t0 $t1 label_42

#------------644  FACTOR_VAR INT q4 save in reg[206]
   lw $t3 -28($sp)
   sw $t3 -972($sp)

#------------645  FACTOR_CON INT 1 save in reg[207]
   li $t0 1
   sw $t0 -976($sp)

#------------646  reg[208] = reg[206] JIA reg[207]
   lw $t0 -972($sp)
   lw $t1 -976($sp)
   add $t2 $t0 $t1
   sw $t2 -980($sp)

#------------647  ASSIGN INT q4 = reg[208]
   lw $t3 -980($sp)
   sw $t3 -28($sp)

#------------648  JUMP to label_43
   j label_43

#------------649  label_42    ----------------Label----------------
label_42:

#------------650  label_43    ----------------Label----------------
label_43:

#------------651  FACTOR_VAR INT q4 save in reg[209]
   lw $t3 -28($sp)
   sw $t3 -984($sp)

#------------652  WRITE INT reg[209]
   li $v0 1
   lw $a0 -984($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------653  FACTOR_VAR INT q2 save in reg[210]
   lw $t3 -20($sp)
   sw $t3 -988($sp)

#------------654  FACTOR_VAR INT q3 save in reg[211]
   lw $t3 -24($sp)
   sw $t3 -992($sp)

#------------655  IF reg[210] BEQ reg[211] THEN GOTO label_44
   lw $t0 -988($sp)
   lw $t1 -992($sp)
    beq $t0 $t1 label_44

#------------656  FACTOR_VAR INT q4 save in reg[212]
   lw $t3 -28($sp)
   sw $t3 -996($sp)

#------------657  FACTOR_CON INT 1 save in reg[213]
   li $t0 1
   sw $t0 -1000($sp)

#------------658  reg[214] = reg[212] JIA reg[213]
   lw $t0 -996($sp)
   lw $t1 -1000($sp)
   add $t2 $t0 $t1
   sw $t2 -1004($sp)

#------------659  ASSIGN INT q4 = reg[214]
   lw $t3 -1004($sp)
   sw $t3 -28($sp)

#------------660  JUMP to label_45
   j label_45

#------------661  label_44    ----------------Label----------------
label_44:

#------------662  label_45    ----------------Label----------------
label_45:

#------------663  FACTOR_VAR INT q4 save in reg[215]
   lw $t3 -28($sp)
   sw $t3 -1008($sp)

#------------664  WRITE INT reg[215]
   li $v0 1
   lw $a0 -1008($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------665  FACTOR_VAR INT q2 save in reg[216]
   lw $t3 -20($sp)
   sw $t3 -1012($sp)

#------------666  FACTOR_VAR INT q3 save in reg[217]
   lw $t3 -24($sp)
   sw $t3 -1016($sp)

#------------667  FACTOR_VAR INT q1 save in reg[218]
   lw $t3 -16($sp)
   sw $t3 -1020($sp)

#------------668  reg[219] = reg[217] CHENG reg[218]
   lw $t0 -1016($sp)
   lw $t1 -1020($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -1024($sp)

#------------669  IF reg[216] BNE reg[219] THEN GOTO label_46
   lw $t0 -1012($sp)
   lw $t1 -1024($sp)
    bne $t0 $t1 label_46

#------------670  FACTOR_VAR INT q4 save in reg[220]
   lw $t3 -28($sp)
   sw $t3 -1028($sp)

#------------671  FACTOR_CON INT 1 save in reg[221]
   li $t0 1
   sw $t0 -1032($sp)

#------------672  reg[222] = reg[220] JIA reg[221]
   lw $t0 -1028($sp)
   lw $t1 -1032($sp)
   add $t2 $t0 $t1
   sw $t2 -1036($sp)

#------------673  ASSIGN INT q4 = reg[222]
   lw $t3 -1036($sp)
   sw $t3 -28($sp)

#------------674  JUMP to label_47
   j label_47

#------------675  label_46    ----------------Label----------------
label_46:

#------------676  label_47    ----------------Label----------------
label_47:

#------------677  FACTOR_VAR INT q4 save in reg[223]
   lw $t3 -28($sp)
   sw $t3 -1040($sp)

#------------678  WRITE INT reg[223]
   li $v0 1
   lw $a0 -1040($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------679  JUMP to label_49
   j label_49

#------------680  label_48    ----------------Label----------------
label_48:

#------------681  label_49    ----------------Label----------------
label_49:

#------------682  FACTOR_VAR INT ord save in reg[224]
   lw $t3 -12($sp)
   sw $t3 -1044($sp)

#------------683  FACTOR_CON INT 12 save in reg[225]
   li $t0 12
   sw $t0 -1048($sp)

#------------684  IF reg[224] BNE reg[225] THEN GOTO label_50
   lw $t0 -1044($sp)
   lw $t1 -1048($sp)
    bne $t0 $t1 label_50

#------------685  CALL VOID test12(0)
   sw $ra -1052($sp)
   addi $sp $sp -1056
   jal .func_test12
   subi $sp $sp -1056
   lw $ra -1052($sp)

#------------686  JUMP to label_51
   j label_51

#------------687  label_50    ----------------Label----------------
label_50:

#------------688  label_51    ----------------Label----------------
label_51:

#------------689  FACTOR_VAR INT ord save in reg[226]
   lw $t3 -12($sp)
   sw $t3 -1052($sp)

#------------690  FACTOR_CON INT 13 save in reg[227]
   li $t0 13
   sw $t0 -1056($sp)

#------------691  IF reg[226] BNE reg[227] THEN GOTO label_52
   lw $t0 -1052($sp)
   lw $t1 -1056($sp)
    bne $t0 $t1 label_52

#------------692  CALL VOID test13(0)
   sw $ra -1060($sp)
   addi $sp $sp -1064
   jal .func_test13
   subi $sp $sp -1064
   lw $ra -1060($sp)

#------------693  JUMP to label_53
   j label_53

#------------694  label_52    ----------------Label----------------
label_52:

#------------695  label_53    ----------------Label----------------
label_53:

#------------696  FACTOR_VAR INT ord save in reg[228]
   lw $t3 -12($sp)
   sw $t3 -1060($sp)

#------------697  FACTOR_CON INT 14 save in reg[229]
   li $t0 14
   sw $t0 -1064($sp)

#------------698  IF reg[228] BNE reg[229] THEN GOTO label_54
   lw $t0 -1060($sp)
   lw $t1 -1064($sp)
    bne $t0 $t1 label_54

#------------699  FACTOR_CON INT 1 save in reg[230]
   li $t0 1
   sw $t0 -1068($sp)

#------------700  FACTOR_CON INT 2 save in reg[231]
   li $t0 2
   sw $t0 -1072($sp)

#------------701  FACTOR_CON INT 3 save in reg[232]
   li $t0 3
   sw $t0 -1076($sp)

#------------702  FACTOR_CON INT 4 save in reg[233]
   li $t0 4
   sw $t0 -1080($sp)

#------------703  FACTOR_CON INT 5 save in reg[234]
   li $t0 5
   sw $t0 -1084($sp)

#------------704  PUSH INT parareg[9] from reg[230]
   sw $ra -1088($sp)
   lw $t0 -1068($sp)
   sw $t0 -1092($sp)

#------------705  PUSH INT parareg[10] from reg[231]
   lw $t0 -1072($sp)
   sw $t0 -1096($sp)

#------------706  PUSH INT parareg[11] from reg[232]
   lw $t0 -1076($sp)
   sw $t0 -1100($sp)

#------------707  PUSH INT parareg[12] from reg[233]
   lw $t0 -1080($sp)
   sw $t0 -1104($sp)

#------------708  PUSH INT parareg[13] from reg[234]
   lw $t0 -1084($sp)
   sw $t0 -1108($sp)

#------------709  CALL VOID test14(5)
   addi $sp $sp -1092
   jal .func_test14
   subi $sp $sp -1092
   lw $ra -1088($sp)

#------------710  JUMP to label_55
   j label_55

#------------711  label_54    ----------------Label----------------
label_54:

#------------712  label_55    ----------------Label----------------
label_55:

   jr $ra

end:
