.data
   .var__c1: .word 0
   .var__c2: .word 0
   .var__c3: .word 0
   .var__c4: .word 0
   .str_0: .asciiz "_ff4_"
   .str_1: .asciiz "___ !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~___\\n\\t\\\\\\'___"
   .str_2: .asciiz ""
   .str_3: .asciiz "@@@@@"
   .str_4: .asciiz "error1"
   .str_5: .asciiz "error2"
   .str_6: .asciiz "error3"
   .str_7: .asciiz "error4"
   .str_8: .asciiz "error5"
   .str_9: .asciiz "error6"
   .str_10: .asciiz "error7"
   .str_11: .asciiz "error8"
   .str_12: .asciiz "error9"
   .str_13: .asciiz " "
   .str_14: .asciiz "error10"
   .str_15: .asciiz "error11"
   .str_16: .asciiz "error12"
   .str_17: .asciiz " ojbk"
   .str_18: .asciiz "error13"
   .str_19: .asciiz "error14"
.text
   jal .func_main
   j end
#------------7  FUNC CHAR ff1(1)
.func_ff1:

#------------8  PARA CHAR c

#------------9  CONST CHAR temp_c = 98

#------------10  FACTOR_CON CHAR 98 save in reg[1]
   li $t0 98
   sw $t0 -4($sp)

#------------11  ASSIGN_EXTERN CHAR _c1 = reg[1]
   lw $t3 -4($sp)
   sw $t3 .var__c1

#------------12  FACTOR_VAR CHAR c save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------13  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------14  FUNC INT ff2(0)
   jr $ra

.func_ff2:

#------------15  FACTOR_CON CHAR 45 save in reg[1]
   li $t0 45
   sw $t0 0($sp)

#------------16  ASSIGN_EXTERN CHAR _c2 = reg[1]
   lw $t3 0($sp)
   sw $t3 .var__c2





#------------21  FACTOR_CON INT 6 save in reg[6]
   li $t0 6
   sw $t0 -20($sp)

#------------22  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------23  FUNC VOID ff3(6)
   jr $ra

.func_ff3:

#------------24  PARA INT a

#------------25  PARA INT b

#------------26  PARA CHAR c

#------------27  PARA INT d

#------------28  PARA CHAR e

#------------29  PARA CHAR f

#------------30  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------31  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------32  reg[3] = reg[1] JIA reg[2]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   addu $t2 $t0 $t1
   sw $t2 -32($sp)

#------------33  FACTOR_VAR CHAR c save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -36($sp)

#------------34  reg[5] = reg[3] JIA reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   addu $t2 $t0 $t1
   sw $t2 -40($sp)

#------------35  FACTOR_VAR INT d save in reg[6]
   lw $t3 -12($sp)
   sw $t3 -44($sp)

#------------36  reg[7] = reg[5] JIA reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   addu $t2 $t0 $t1
   sw $t2 -48($sp)

#------------37  FACTOR_VAR CHAR e save in reg[8]
   lw $t3 -16($sp)
   sw $t3 -52($sp)

#------------38  reg[9] = reg[7] JIA reg[8]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   addu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------39  FACTOR_VAR CHAR f save in reg[10]
   lw $t3 -20($sp)
   sw $t3 -60($sp)

#------------40  reg[11] = reg[9] JIA reg[10]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   addu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------41  WRITE INT reg[11]
   li $v0 1
   lw $a0 -64($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------42  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------43  FUNC VOID ff4(0)
   jr $ra

.func_ff4:

#------------44  WRITE _ff4_
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------45  FUNC INT factorial(1)
   jr $ra

.func_factorial:

#------------46  PARA INT a

#------------47  VAR INT b

#------------48  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------49  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -12($sp)

#------------50  IF reg[1] BNE reg[2] THEN GOTO label_0
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    bne $t0 $t1 label_0

#------------51  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -16($sp)

#------------52  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------53  JUMP to label_1
   j label_1

#------------54  label_0    ----------------Label----------------
label_0:

#------------55  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------56  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -24($sp)

#------------57  reg[6] = reg[4] JIAN reg[5]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   subu $t2 $t0 $t1
   sw $t2 -28($sp)

#------------58  PUSH INT parareg[0] from reg[6]
   sw $ra -32($sp)
   lw $t0 -28($sp)
   sw $t0 -36($sp)

#------------59  CALL INT factorial(1)
   addiu $sp $sp -36
   jal .func_factorial
   subiu $sp $sp -36
   lw $ra -32($sp)

#------------60  FACTOR_FUNC INT factorial save in reg[7]
   sw $v0 -32($sp)

#------------61  FACTOR_VAR INT a save in reg[8]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------62  reg[9] = reg[7] CHENG reg[8]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -40($sp)

#------------63  FACTOR_EXPR reg[9] save in reg[10]
   lw $t0 -40($sp)
   sw $t0 -44($sp)

#------------64  ASSIGN INT b = reg[10]
   lw $t3 -44($sp)
   sw $t3 -4($sp)

#------------65  FACTOR_VAR INT b save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------66  RETURN reg[11] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------67  label_1    ----------------Label----------------
label_1:

#------------68  FUNC VOID ff5(0)
   jr $ra

.func_ff5:

#------------69  CONST CHAR _c2 = 122

#------------70  VAR INT _t1

#------------71  FACTOR_CON INT 4 save in reg[1]
   li $t0 4
   sw $t0 -4($sp)

#------------72  ASSIGN INT _t1 = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------73  FACTOR_VAR INT _t1 save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------74  FACTOR_CON CHAR 122 save in reg[3]
   li $t0 122
   sw $t0 -12($sp)

#------------75  reg[4] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   addu $t2 $t0 $t1
   sw $t2 -16($sp)

#------------76  FACTOR_VAR_EXTERN CHAR _c1 save in reg[5]
   lw $t3 .var__c1
   sw $t3 -20($sp)

#------------77  reg[6] = reg[4] JIA reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   addu $t2 $t0 $t1
   sw $t2 -24($sp)

#------------78  WRITE INT reg[6]
   li $v0 1
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------79  FUNC VOID main(0)
   jr $ra

.func_main:

#------------80  CONST INT int_100 = 100

#------------81  CONST CHAR char_z = 122

#------------82  VAR INT in_1

#------------83  VAR INT t1

#------------84  VAR INT t2

#------------85  VAR CHAR c1

#------------86  VAR CHAR c2

#------------87  ARRAY CHAR single_chars[10]

#------------88  VAR INT t3

#------------89  VAR INT t4

#------------90  VAR INT t5

#------------91  VAR INT t6

#------------92  VAR INT t7

#------------93  VAR INT t8

#------------94  VAR INT t9

#------------95  VAR CHAR c3

#------------96  VAR CHAR c4

#------------97  VAR INT t10

#------------98  VAR INT t11

#------------99  VAR INT t12

#------------100  VAR INT t13

#------------101  VAR INT t14

#------------102  VAR INT t15

#------------103  VAR INT t16

#------------104  VAR INT t17

#------------105  VAR INT t18

#------------106  VAR INT t19

#------------107  VAR INT t20

#------------108  VAR INT t21

#------------109  VAR INT t22

#------------110  VAR INT t23

#------------111  VAR CHAR c5

#------------112  VAR CHAR c6

#------------113  VAR CHAR c7

#------------114  VAR CHAR c8

#------------115  ARRAY INT t_array1[100]

#------------116  ARRAY CHAR c_array1[100]

#------------117  VAR INT _c4

#------------118  VAR INT i

#------------119  VAR CHAR _t1

#------------120  ARRAY INT t_array2[100]

#------------121  ARRAY CHAR c_array2[100]

#------------122  READ INT in_1
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------123  FACTOR_VAR INT in_1 save in reg[7]
   lw $t3 0($sp)
   sw $t3 -1804($sp)

#------------124  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -1808($sp)

#------------125  IF reg[7] BNE reg[8] THEN GOTO label_20
   lw $t0 -1804($sp)
   lw $t1 -1808($sp)
    bne $t0 $t1 label_20

#------------126  READ INT t1
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------127  READ CHAR c2
   li $v0 12
   syscall
   sw $v0 -16($sp)

#------------128  READ CHAR c1
   li $v0 12
   syscall
   sw $v0 -12($sp)

#------------129  READ INT t2
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------130  FACTOR_VAR CHAR c2 save in reg[9]
   lw $t3 -16($sp)
   sw $t3 -1812($sp)

#------------131  FACTOR_VAR INT t1 save in reg[10]
   lw $t3 -4($sp)
   sw $t3 -1816($sp)

#------------132  FACTOR_VAR CHAR c2 save in reg[11]
   lw $t3 -16($sp)
   sw $t3 -1820($sp)

#------------133  reg[12] = reg[10] CHENG reg[11]
   lw $t0 -1816($sp)
   lw $t1 -1820($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -1824($sp)

#------------134  reg[13] = reg[9] JIA reg[12]
   lw $t0 -1812($sp)
   lw $t1 -1824($sp)
   addu $t2 $t0 $t1
   sw $t2 -1828($sp)

#------------135  FACTOR_VAR INT t1 save in reg[14]
   lw $t3 -4($sp)
   sw $t3 -1832($sp)

#------------136  FACTOR_VAR CHAR c1 save in reg[15]
   lw $t3 -12($sp)
   sw $t3 -1836($sp)

#------------137  reg[16] = reg[14] CHU reg[15]
   lw $t0 -1832($sp)
   lw $t1 -1836($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -1840($sp)

#------------138  reg[17] = reg[13] JIAN reg[16]
   lw $t0 -1828($sp)
   lw $t1 -1840($sp)
   subu $t2 $t0 $t1
   sw $t2 -1844($sp)

#------------139  WRITE INT reg[17]
   li $v0 1
   lw $a0 -1844($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------140  WRITE ___ !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~___\n\t\\\'___
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------141  WRITE 
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------142  FACTOR_VAR CHAR c2 save in reg[18]
   lw $t3 -16($sp)
   sw $t3 -1848($sp)

#------------143  WRITE @@@@@
   li $v0 4
   la $a0 .str_3
   syscall

#------------144  WRITE CHAR reg[18]
   li $v0 11
   lw $a0 -1848($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------145  FACTOR_CON INT 0 save in reg[19]
   li $t0 0
   sw $t0 -1852($sp)

#------------146  FACTOR_CON CHAR 43 save in reg[20]
   li $t0 43
   sw $t0 -1856($sp)

#------------147  ASSIGN_ARR CHAR single_chars[reg[19]] = reg[20]
   lw $t0 -1852($sp)
   lw $t1 -1856($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------148  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -1860($sp)

#------------149  FACTOR_CON CHAR 45 save in reg[22]
   li $t0 45
   sw $t0 -1864($sp)

#------------150  ASSIGN_ARR CHAR single_chars[reg[21]] = reg[22]
   lw $t0 -1860($sp)
   lw $t1 -1864($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------151  FACTOR_CON INT 2 save in reg[23]
   li $t0 2
   sw $t0 -1868($sp)

#------------152  FACTOR_CON CHAR 42 save in reg[24]
   li $t0 42
   sw $t0 -1872($sp)

#------------153  ASSIGN_ARR CHAR single_chars[reg[23]] = reg[24]
   lw $t0 -1868($sp)
   lw $t1 -1872($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------154  FACTOR_CON INT 3 save in reg[25]
   li $t0 3
   sw $t0 -1876($sp)

#------------155  FACTOR_CON CHAR 47 save in reg[26]
   li $t0 47
   sw $t0 -1880($sp)

#------------156  ASSIGN_ARR CHAR single_chars[reg[25]] = reg[26]
   lw $t0 -1876($sp)
   lw $t1 -1880($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------157  FACTOR_CON INT 4 save in reg[27]
   li $t0 4
   sw $t0 -1884($sp)

#------------158  FACTOR_CON CHAR 48 save in reg[28]
   li $t0 48
   sw $t0 -1888($sp)

#------------159  ASSIGN_ARR CHAR single_chars[reg[27]] = reg[28]
   lw $t0 -1884($sp)
   lw $t1 -1888($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------160  FACTOR_CON INT 5 save in reg[29]
   li $t0 5
   sw $t0 -1892($sp)

#------------161  FACTOR_CON CHAR 57 save in reg[30]
   li $t0 57
   sw $t0 -1896($sp)

#------------162  ASSIGN_ARR CHAR single_chars[reg[29]] = reg[30]
   lw $t0 -1892($sp)
   lw $t1 -1896($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------163  FACTOR_CON INT 6 save in reg[31]
   li $t0 6
   sw $t0 -1900($sp)

#------------164  FACTOR_CON CHAR 97 save in reg[32]
   li $t0 97
   sw $t0 -1904($sp)

#------------165  ASSIGN_ARR CHAR single_chars[reg[31]] = reg[32]
   lw $t0 -1900($sp)
   lw $t1 -1904($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------166  FACTOR_CON INT 7 save in reg[33]
   li $t0 7
   sw $t0 -1908($sp)

#------------167  FACTOR_CON CHAR 122 save in reg[34]
   li $t0 122
   sw $t0 -1912($sp)

#------------168  ASSIGN_ARR CHAR single_chars[reg[33]] = reg[34]
   lw $t0 -1908($sp)
   lw $t1 -1912($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------169  FACTOR_CON INT 8 save in reg[35]
   li $t0 8
   sw $t0 -1916($sp)

#------------170  FACTOR_CON CHAR 65 save in reg[36]
   li $t0 65
   sw $t0 -1920($sp)

#------------171  ASSIGN_ARR CHAR single_chars[reg[35]] = reg[36]
   lw $t0 -1916($sp)
   lw $t1 -1920($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------172  FACTOR_CON INT 9 save in reg[37]
   li $t0 9
   sw $t0 -1924($sp)

#------------173  FACTOR_CON CHAR 90 save in reg[38]
   li $t0 90
   sw $t0 -1928($sp)

#------------174  ASSIGN_ARR CHAR single_chars[reg[37]] = reg[38]
   lw $t0 -1924($sp)
   lw $t1 -1928($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -20($t0)

#------------175  FACTOR_CON CHAR 43 save in reg[39]
   li $t0 43
   sw $t0 -1932($sp)

#------------176  ASSIGN_EXTERN CHAR _c1 = reg[39]
   lw $t3 -1932($sp)
   sw $t3 .var__c1

#------------177  FACTOR_CON CHAR 97 save in reg[40]
   li $t0 97
   sw $t0 -1936($sp)

#------------178  ASSIGN_EXTERN CHAR _c3 = reg[40]
   lw $t3 -1936($sp)
   sw $t3 .var__c3

#------------179  FACTOR_VAR_EXTERN CHAR _c1 save in reg[41]
   lw $t3 .var__c1
   sw $t3 -1940($sp)

#------------180  FACTOR_CON INT 2 save in reg[42]
   li $t0 2
   sw $t0 -1944($sp)

#------------181  reg[43] = reg[41] JIA reg[42]
   lw $t0 -1940($sp)
   lw $t1 -1944($sp)
   addu $t2 $t0 $t1
   sw $t2 -1948($sp)

#------------182  ASSIGN INT t3 = reg[43]
   lw $t3 -1948($sp)
   sw $t3 -60($sp)

#------------183  FACTOR_VAR_EXTERN CHAR _c3 save in reg[44]
   lw $t3 .var__c3
   sw $t3 -1952($sp)

#------------184  FACTOR_CON INT 0 save in reg[45]
   li $t0 0
   sw $t0 -1956($sp)

#------------185  reg[46] = reg[45] JIAN reg[44]
   lw $t0 -1956($sp)
   lw $t1 -1952($sp)
   subu $t2 $t0 $t1
   sw $t2 -1960($sp)

#------------186  FACTOR_CON INT 77 save in reg[47]
   li $t0 77
   sw $t0 -1964($sp)

#------------187  reg[48] = reg[46] JIA reg[47]
   lw $t0 -1960($sp)
   lw $t1 -1964($sp)
   addu $t2 $t0 $t1
   sw $t2 -1968($sp)

#------------188  ASSIGN INT t4 = reg[48]
   lw $t3 -1968($sp)
   sw $t3 -64($sp)







#------------195  FACTOR_CON INT 45 save in reg[55]
   li $t0 45
   sw $t0 -1996($sp)

#------------196  ASSIGN INT t5 = reg[55]
   lw $t3 -1996($sp)
   sw $t3 -68($sp)

#------------197  FACTOR_VAR INT t3 save in reg[56]
   lw $t3 -60($sp)
   sw $t3 -2000($sp)

#------------198  FACTOR_VAR INT t5 save in reg[57]
   lw $t3 -68($sp)
   sw $t3 -2004($sp)

#------------199  IF reg[56] BEQ reg[57] THEN GOTO label_2
   lw $t0 -2000($sp)
   lw $t1 -2004($sp)
    beq $t0 $t1 label_2

#------------200  WRITE error1
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------201  JUMP to label_3
   j label_3

#------------202  label_2    ----------------Label----------------
label_2:

#------------203  label_3    ----------------Label----------------
label_3:

#------------204  FACTOR_VAR INT t3 save in reg[58]
   lw $t3 -60($sp)
   sw $t3 -2008($sp)

#------------205  FACTOR_VAR INT t4 save in reg[59]
   lw $t3 -64($sp)
   sw $t3 -2012($sp)

#------------206  IF reg[58] BNE reg[59] THEN GOTO label_4
   lw $t0 -2008($sp)
   lw $t1 -2012($sp)
    bne $t0 $t1 label_4

#------------207  WRITE error2
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------208  JUMP to label_5
   j label_5

#------------209  label_4    ----------------Label----------------
label_4:

#------------210  label_5    ----------------Label----------------
label_5:

#------------211  FACTOR_VAR INT t3 save in reg[60]
   lw $t3 -60($sp)
   sw $t3 -2016($sp)

#------------212  FACTOR_VAR INT t4 save in reg[61]
   lw $t3 -64($sp)
   sw $t3 -2020($sp)

#------------213  IF reg[60] BGTR reg[61] THEN GOTO label_6
   lw $t0 -2016($sp)
   lw $t1 -2020($sp)
    bgt $t0 $t1 label_6

#------------214  WRITE error3
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------215  JUMP to label_7
   j label_7

#------------216  label_6    ----------------Label----------------
label_6:

#------------217  label_7    ----------------Label----------------
label_7:

#------------218  FACTOR_VAR INT t3 save in reg[62]
   lw $t3 -60($sp)
   sw $t3 -2024($sp)

#------------219  FACTOR_VAR INT t5 save in reg[63]
   lw $t3 -68($sp)
   sw $t3 -2028($sp)

#------------220  IF reg[62] BGEQ reg[63] THEN GOTO label_8
   lw $t0 -2024($sp)
   lw $t1 -2028($sp)
    bge $t0 $t1 label_8

#------------221  WRITE error4
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------222  JUMP to label_9
   j label_9

#------------223  label_8    ----------------Label----------------
label_8:

#------------224  label_9    ----------------Label----------------
label_9:

#------------225  FACTOR_VAR INT t4 save in reg[64]
   lw $t3 -64($sp)
   sw $t3 -2032($sp)

#------------226  FACTOR_VAR INT t5 save in reg[65]
   lw $t3 -68($sp)
   sw $t3 -2036($sp)

#------------227  IF reg[64] BLSS reg[65] THEN GOTO label_10
   lw $t0 -2032($sp)
   lw $t1 -2036($sp)
    blt $t0 $t1 label_10

#------------228  WRITE error5
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------229  JUMP to label_11
   j label_11

#------------230  label_10    ----------------Label----------------
label_10:

#------------231  label_11    ----------------Label----------------
label_11:

#------------232  FACTOR_VAR INT t5 save in reg[66]
   lw $t3 -68($sp)
   sw $t3 -2040($sp)

#------------233  FACTOR_VAR INT t3 save in reg[67]
   lw $t3 -60($sp)
   sw $t3 -2044($sp)

#------------234  IF reg[66] BLEQ reg[67] THEN GOTO label_12
   lw $t0 -2040($sp)
   lw $t1 -2044($sp)
    ble $t0 $t1 label_12

#------------235  WRITE error6
   li $v0 4
   la $a0 .str_9
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------236  JUMP to label_13
   j label_13

#------------237  label_12    ----------------Label----------------
label_12:

#------------238  label_13    ----------------Label----------------
label_13:

#------------239  FACTOR_CON INT 12 save in reg[68]
   li $t0 12
   sw $t0 -2048($sp)

#------------240  ASSIGN INT t6 = reg[68]
   lw $t3 -2048($sp)
   sw $t3 -72($sp)

#------------241  FACTOR_CON INT 23 save in reg[69]
   li $t0 23
   sw $t0 -2052($sp)

#------------242  ASSIGN INT t7 = reg[69]
   lw $t3 -2052($sp)
   sw $t3 -76($sp)



#------------245  FACTOR_CON INT -23 save in reg[72]
   li $t0 -23
   sw $t0 -2064($sp)

#------------246  ASSIGN INT t8 = reg[72]
   lw $t3 -2064($sp)
   sw $t3 -80($sp)

#------------247  FACTOR_VAR INT t8 save in reg[73]
   lw $t3 -80($sp)
   sw $t3 -2068($sp)

#------------248  FACTOR_VAR INT t6 save in reg[74]
   lw $t3 -72($sp)
   sw $t3 -2072($sp)

#------------249  reg[75] = reg[73] JIA reg[74]
   lw $t0 -2068($sp)
   lw $t1 -2072($sp)
   addu $t2 $t0 $t1
   sw $t2 -2076($sp)

#------------250  FACTOR_VAR INT t7 save in reg[76]
   lw $t3 -76($sp)
   sw $t3 -2080($sp)

#------------251  reg[77] = reg[75] JIA reg[76]
   lw $t0 -2076($sp)
   lw $t1 -2080($sp)
   addu $t2 $t0 $t1
   sw $t2 -2084($sp)

#------------252  FACTOR_CON INT 12 save in reg[78]
   li $t0 12
   sw $t0 -2088($sp)

#------------253  IF reg[77] BEQ reg[78] THEN GOTO label_14
   lw $t0 -2084($sp)
   lw $t1 -2088($sp)
    beq $t0 $t1 label_14

#------------254  WRITE error7
   li $v0 4
   la $a0 .str_10
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------255  JUMP to label_15
   j label_15

#------------256  label_14    ----------------Label----------------
label_14:

#------------257  label_15    ----------------Label----------------
label_15:

#------------258  FACTOR_CON INT 3 save in reg[79]
   li $t0 3
   sw $t0 -2092($sp)

#------------259  FACTOR_CON INT 5 save in reg[80]
   li $t0 5
   sw $t0 -2096($sp)

#------------260  IF reg[79] BLEQ reg[80] THEN GOTO label_16
   lw $t0 -2092($sp)
   lw $t1 -2096($sp)
    ble $t0 $t1 label_16

#------------261  WRITE error8
   li $v0 4
   la $a0 .str_11
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------262  JUMP to label_17
   j label_17

#------------263  label_16    ----------------Label----------------
label_16:

#------------264  label_17    ----------------Label----------------
label_17:

#------------265  FACTOR_CON INT 9 save in reg[81]
   li $t0 9
   sw $t0 -2100($sp)

#------------266  ASSIGN INT t9 = reg[81]
   lw $t3 -2100($sp)
   sw $t3 -84($sp)

#------------267  FACTOR_CON CHAR 51 save in reg[82]
   li $t0 51
   sw $t0 -2104($sp)

#------------268  ASSIGN CHAR c3 = reg[82]
   lw $t3 -2104($sp)
   sw $t3 -88($sp)

#------------269  FACTOR_CON CHAR 52 save in reg[83]
   li $t0 52
   sw $t0 -2108($sp)

#------------270  ASSIGN CHAR c4 = reg[83]
   lw $t3 -2108($sp)
   sw $t3 -92($sp)

#------------271  FACTOR_VAR CHAR c4 save in reg[84]
   lw $t3 -92($sp)
   sw $t3 -2112($sp)

#------------272  FACTOR_VAR CHAR c3 save in reg[85]
   lw $t3 -88($sp)
   sw $t3 -2116($sp)

#------------273  reg[86] = reg[84] JIAN reg[85]
   lw $t0 -2112($sp)
   lw $t1 -2116($sp)
   subu $t2 $t0 $t1
   sw $t2 -2120($sp)

#------------274  FACTOR_VAR INT t9 save in reg[87]
   lw $t3 -84($sp)
   sw $t3 -2124($sp)

#------------275  reg[88] = reg[86] JIA reg[87]
   lw $t0 -2120($sp)
   lw $t1 -2124($sp)
   addu $t2 $t0 $t1
   sw $t2 -2128($sp)

#------------276  FACTOR_CON INT 10 save in reg[89]
   li $t0 10
   sw $t0 -2132($sp)

#------------277  IF reg[88] BEQ reg[89] THEN GOTO label_18
   lw $t0 -2128($sp)
   lw $t1 -2132($sp)
    beq $t0 $t1 label_18

#------------278  WRITE error9
   li $v0 4
   la $a0 .str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------279  JUMP to label_19
   j label_19

#------------280  label_18    ----------------Label----------------
label_18:

#------------281  label_19    ----------------Label----------------
label_19:

#------------282  JUMP to label_21
   j label_21

#------------283  label_20    ----------------Label----------------
label_20:

#------------284  label_21    ----------------Label----------------
label_21:

#------------285  FACTOR_VAR INT in_1 save in reg[90]
   lw $t3 0($sp)
   sw $t3 -2136($sp)

#------------286  FACTOR_CON INT 2 save in reg[91]
   li $t0 2
   sw $t0 -2140($sp)

#------------287  IF reg[90] BNE reg[91] THEN GOTO label_49
   lw $t0 -2136($sp)
   lw $t1 -2140($sp)
    bne $t0 $t1 label_49

#------------288  FACTOR_CON INT 0 save in reg[92]
   li $t0 0
   sw $t0 -2144($sp)

#------------289  FACTOR_CON INT 2333 save in reg[93]
   li $t0 2333
   sw $t0 -2148($sp)

#------------290  ASSIGN_ARR INT t_array1[reg[92]] = reg[93]
   lw $t0 -2144($sp)
   lw $t1 -2148($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -168($t0)

#------------291  FACTOR_CON INT 0 save in reg[94]
   li $t0 0
   sw $t0 -2152($sp)

#------------292  FACTOR_CON CHAR 47 save in reg[95]
   li $t0 47
   sw $t0 -2156($sp)

#------------293  ASSIGN_ARR CHAR c_array1[reg[94]] = reg[95]
   lw $t0 -2152($sp)
   lw $t1 -2156($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -568($t0)






#------------299  FACTOR_CON INT 2 save in reg[101]
   li $t0 2
   sw $t0 -2180($sp)

#------------300  ASSIGN INT t10 = reg[101]
   lw $t3 -2180($sp)
   sw $t3 -96($sp)

#------------301  FACTOR_CON CHAR 43 save in reg[102]
   li $t0 43
   sw $t0 -2184($sp)

#------------302  ASSIGN CHAR c5 = reg[102]
   lw $t3 -2184($sp)
   sw $t3 -152($sp)

#------------303  FACTOR_VAR CHAR c5 save in reg[103]
   lw $t3 -152($sp)
   sw $t3 -2188($sp)

#------------304  ASSIGN CHAR c6 = reg[103]
   lw $t3 -2188($sp)
   sw $t3 -156($sp)

#------------305  FACTOR_CON INT 0 save in reg[104]
   li $t0 0
   sw $t0 -2192($sp)

#------------306  FACTOR_ARRAY CHAR c_array1 [reg[104]] save in reg[105]
   lw $t3 -2192($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -568($t3)
   sw $t3 -2196($sp)

#------------307  ASSIGN CHAR c7 = reg[105]
   lw $t3 -2196($sp)
   sw $t3 -160($sp)



#------------310  FACTOR_CON INT -7 save in reg[108]
   li $t0 -7
   sw $t0 -2208($sp)

#------------311  ASSIGN INT t11 = reg[108]
   lw $t3 -2208($sp)
   sw $t3 -100($sp)

#------------312  FACTOR_VAR INT t11 save in reg[109]
   lw $t3 -100($sp)
   sw $t3 -2212($sp)

#------------313  ASSIGN INT t12 = reg[109]
   lw $t3 -2212($sp)
   sw $t3 -104($sp)

#------------314  FACTOR_CON INT 0 save in reg[110]
   li $t0 0
   sw $t0 -2216($sp)

#------------315  FACTOR_ARRAY INT t_array1 [reg[110]] save in reg[111]
   lw $t3 -2216($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -168($t3)
   sw $t3 -2220($sp)

#------------316  ASSIGN INT t13 = reg[111]
   lw $t3 -2220($sp)
   sw $t3 -108($sp)

#------------317  CALL INT ff2(0)
   sw $ra -2224($sp)
   addiu $sp $sp -2228
   jal .func_ff2
   subiu $sp $sp -2228
   lw $ra -2224($sp)

#------------318  FACTOR_FUNC INT ff2 save in reg[112]
   sw $v0 -2224($sp)

#------------319  ASSIGN INT t14 = reg[112]
   lw $t3 -2224($sp)
   sw $t3 -112($sp)

#------------320  FACTOR_CON CHAR 121 save in reg[113]
   li $t0 121
   sw $t0 -2228($sp)

#------------321  PUSH INT parareg[1] from reg[113]
   sw $ra -2232($sp)
   lw $t0 -2228($sp)
   sw $t0 -2236($sp)

#------------322  CALL CHAR ff1(1)
   addiu $sp $sp -2236
   jal .func_ff1
   subiu $sp $sp -2236
   lw $ra -2232($sp)

#------------323  FACTOR_FUNC CHAR ff1 save in reg[114]
   sw $v0 -2232($sp)

#------------324  ASSIGN CHAR c8 = reg[114]
   lw $t3 -2232($sp)
   sw $t3 -164($sp)

#------------325  FACTOR_VAR INT t10 save in reg[115]
   lw $t3 -96($sp)
   sw $t3 -2236($sp)

#------------326  FACTOR_VAR CHAR c5 save in reg[116]
   lw $t3 -152($sp)
   sw $t3 -2240($sp)

#------------327  reg[117] = reg[115] JIA reg[116]
   lw $t0 -2236($sp)
   lw $t1 -2240($sp)
   addu $t2 $t0 $t1
   sw $t2 -2244($sp)

#------------328  FACTOR_VAR CHAR c6 save in reg[118]
   lw $t3 -156($sp)
   sw $t3 -2248($sp)

#------------329  reg[119] = reg[117] JIA reg[118]
   lw $t0 -2244($sp)
   lw $t1 -2248($sp)
   addu $t2 $t0 $t1
   sw $t2 -2252($sp)

#------------330  FACTOR_VAR CHAR c7 save in reg[120]
   lw $t3 -160($sp)
   sw $t3 -2256($sp)

#------------331  reg[121] = reg[119] JIA reg[120]
   lw $t0 -2252($sp)
   lw $t1 -2256($sp)
   addu $t2 $t0 $t1
   sw $t2 -2260($sp)

#------------332  FACTOR_VAR INT t11 save in reg[122]
   lw $t3 -100($sp)
   sw $t3 -2264($sp)

#------------333  reg[123] = reg[121] JIA reg[122]
   lw $t0 -2260($sp)
   lw $t1 -2264($sp)
   addu $t2 $t0 $t1
   sw $t2 -2268($sp)

#------------334  FACTOR_VAR INT t12 save in reg[124]
   lw $t3 -104($sp)
   sw $t3 -2272($sp)

#------------335  reg[125] = reg[123] JIA reg[124]
   lw $t0 -2268($sp)
   lw $t1 -2272($sp)
   addu $t2 $t0 $t1
   sw $t2 -2276($sp)

#------------336  FACTOR_VAR INT t13 save in reg[126]
   lw $t3 -108($sp)
   sw $t3 -2280($sp)

#------------337  reg[127] = reg[125] JIA reg[126]
   lw $t0 -2276($sp)
   lw $t1 -2280($sp)
   addu $t2 $t0 $t1
   sw $t2 -2284($sp)

#------------338  FACTOR_VAR INT t14 save in reg[128]
   lw $t3 -112($sp)
   sw $t3 -2288($sp)

#------------339  reg[129] = reg[127] JIA reg[128]
   lw $t0 -2284($sp)
   lw $t1 -2288($sp)
   addu $t2 $t0 $t1
   sw $t2 -2292($sp)

#------------340  FACTOR_VAR CHAR c8 save in reg[130]
   lw $t3 -164($sp)
   sw $t3 -2296($sp)

#------------341  reg[131] = reg[129] JIA reg[130]
   lw $t0 -2292($sp)
   lw $t1 -2296($sp)
   addu $t2 $t0 $t1
   sw $t2 -2300($sp)

#------------342  ASSIGN INT t14 = reg[131]
   lw $t3 -2300($sp)
   sw $t3 -112($sp)

#------------343  FACTOR_VAR INT t11 save in reg[132]
   lw $t3 -100($sp)
   sw $t3 -2304($sp)

#------------344  FACTOR_CON INT -7 save in reg[133]
   li $t0 -7
   sw $t0 -2308($sp)

#------------345  reg[134] = reg[132] CHENG reg[133]
   lw $t0 -2304($sp)
   lw $t1 -2308($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2312($sp)

#------------346  FACTOR_VAR INT t13 save in reg[135]
   lw $t3 -108($sp)
   sw $t3 -2316($sp)

#------------347  reg[136] = reg[134] CHENG reg[135]
   lw $t0 -2312($sp)
   lw $t1 -2316($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2320($sp)

#------------348  FACTOR_VAR CHAR c8 save in reg[137]
   lw $t3 -164($sp)
   sw $t3 -2324($sp)

#------------349  reg[138] = reg[136] CHU reg[137]
   lw $t0 -2320($sp)
   lw $t1 -2324($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2328($sp)

#------------350  FACTOR_VAR INT t10 save in reg[139]
   lw $t3 -96($sp)
   sw $t3 -2332($sp)

#------------351  reg[140] = reg[138] CHU reg[139]
   lw $t0 -2328($sp)
   lw $t1 -2332($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2336($sp)

#------------352  FACTOR_VAR INT t12 save in reg[141]
   lw $t3 -104($sp)
   sw $t3 -2340($sp)

#------------353  reg[142] = reg[140] CHENG reg[141]
   lw $t0 -2336($sp)
   lw $t1 -2340($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2344($sp)

#------------354  WRITE INT reg[142]
   li $v0 1
   lw $a0 -2344($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------355  FACTOR_CON INT 4 save in reg[143]
   li $t0 4
   sw $t0 -2348($sp)

#------------356  FACTOR_VAR INT t14 save in reg[144]
   lw $t3 -112($sp)
   sw $t3 -2352($sp)

#------------357  reg[145] = reg[143] JIA reg[144]
   lw $t0 -2348($sp)
   lw $t1 -2352($sp)
   addu $t2 $t0 $t1
   sw $t2 -2356($sp)

#------------358  WRITE  
   li $v0 4
   la $a0 .str_13
   syscall

#------------359  WRITE INT reg[145]
   li $v0 1
   lw $a0 -2356($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall





#------------364  FACTOR_CON INT 1 save in reg[150]
   li $t0 1
   sw $t0 -2376($sp)

#------------365  WRITE  
   li $v0 4
   la $a0 .str_13
   syscall

#------------366  WRITE INT reg[150]
   li $v0 1
   lw $a0 -2376($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------369  FACTOR_CON INT 0 save in reg[153]
   li $t0 0
   sw $t0 -2388($sp)

#------------370  IF reg[153] BEQ reg[0] THEN GOTO label_22
   lw $t0 -2388($sp)
    beq $t0 $0 label_22

#------------371  WRITE error10
   li $v0 4
   la $a0 .str_14
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------372  JUMP to label_23
   j label_23

#------------373  label_22    ----------------Label----------------
label_22:

#------------374  FACTOR_CON INT 1 save in reg[154]
   li $t0 1
   sw $t0 -2392($sp)

#------------375  ASSIGN INT t15 = reg[154]
   lw $t3 -2392($sp)
   sw $t3 -116($sp)

#------------376  label_23    ----------------Label----------------
label_23:

#------------377  FACTOR_CON INT 3 save in reg[155]
   li $t0 3
   sw $t0 -2396($sp)

#------------378  FACTOR_CON INT 4 save in reg[156]
   li $t0 4
   sw $t0 -2400($sp)

#------------379  IF reg[155] BGEQ reg[156] THEN GOTO label_32
   lw $t0 -2396($sp)
   lw $t1 -2400($sp)
    bge $t0 $t1 label_32

#------------380  FACTOR_CON INT 4 save in reg[157]
   li $t0 4
   sw $t0 -2404($sp)

#------------381  FACTOR_CON INT 4 save in reg[158]
   li $t0 4
   sw $t0 -2408($sp)

#------------382  IF reg[157] BGEQ reg[158] THEN GOTO label_24
   lw $t0 -2404($sp)
   lw $t1 -2408($sp)
    bge $t0 $t1 label_24

#------------383  WRITE error11
   li $v0 4
   la $a0 .str_15
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------384  JUMP to label_31
   j label_31

#------------385  label_24    ----------------Label----------------
label_24:

#------------386  FACTOR_CON INT 4 save in reg[159]
   li $t0 4
   sw $t0 -2412($sp)

#------------387  FACTOR_CON INT 4 save in reg[160]
   li $t0 4
   sw $t0 -2416($sp)

#------------388  IF reg[159] BLSS reg[160] THEN GOTO label_29
   lw $t0 -2412($sp)
   lw $t1 -2416($sp)
    blt $t0 $t1 label_29

#------------389  FACTOR_VAR INT t15 save in reg[161]
   lw $t3 -116($sp)
   sw $t3 -2420($sp)

#------------390  FACTOR_CON INT 0 save in reg[162]
   li $t0 0
   sw $t0 -2424($sp)

#------------391  IF reg[161] BLEQ reg[162] THEN GOTO label_27
   lw $t0 -2420($sp)
   lw $t1 -2424($sp)
    ble $t0 $t1 label_27

#------------392  FACTOR_VAR INT t15 save in reg[163]
   lw $t3 -116($sp)
   sw $t3 -2428($sp)

#------------393  FACTOR_CON INT 0 save in reg[164]
   li $t0 0
   sw $t0 -2432($sp)

#------------394  IF reg[163] BGEQ reg[164] THEN GOTO label_25
   lw $t0 -2428($sp)
   lw $t1 -2432($sp)
    bge $t0 $t1 label_25

#------------395  WRITE error12
   li $v0 4
   la $a0 .str_16
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------396  JUMP to label_26
   j label_26

#------------397  label_25    ----------------Label----------------
label_25:

#------------398  WRITE  ojbk
   li $v0 4
   la $a0 .str_17
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------399  label_26    ----------------Label----------------
label_26:

#------------400  JUMP to label_28
   j label_28

#------------401  label_27    ----------------Label----------------
label_27:

#------------402  label_28    ----------------Label----------------
label_28:

#------------403  JUMP to label_30
   j label_30

#------------404  label_29    ----------------Label----------------
label_29:

#------------405  label_30    ----------------Label----------------
label_30:

#------------406  label_31    ----------------Label----------------
label_31:

#------------407  JUMP to label_33
   j label_33

#------------408  label_32    ----------------Label----------------
label_32:

#------------409  WRITE error13
   li $v0 4
   la $a0 .str_18
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------410  label_33    ----------------Label----------------
label_33:

#------------411  FACTOR_CON INT 1 save in reg[165]
   li $t0 1
   sw $t0 -2436($sp)

#------------412  ASSIGN INT t16 = reg[165]
   lw $t3 -2436($sp)
   sw $t3 -120($sp)

#------------413  FACTOR_CON INT 0 save in reg[166]
   li $t0 0
   sw $t0 -2440($sp)

#------------414  ASSIGN INT t18 = reg[166]
   lw $t3 -2440($sp)
   sw $t3 -128($sp)

#------------415  label_34    ----------------Label----------------
label_34:

#------------416  FACTOR_VAR INT t16 save in reg[167]
   lw $t3 -120($sp)
   sw $t3 -2444($sp)

#------------417  FACTOR_CON INT 4 save in reg[168]
   li $t0 4
   sw $t0 -2448($sp)

#------------418  IF reg[167] BGTR reg[168] THEN GOTO label_37
   lw $t0 -2444($sp)
   lw $t1 -2448($sp)
    bgt $t0 $t1 label_37

#------------419  FACTOR_CON INT 1 save in reg[169]
   li $t0 1
   sw $t0 -2452($sp)

#------------420  ASSIGN INT t17 = reg[169]
   lw $t3 -2452($sp)
   sw $t3 -124($sp)

#------------421  label_35    ----------------Label----------------
label_35:

#------------422  FACTOR_VAR INT t17 save in reg[170]
   lw $t3 -124($sp)
   sw $t3 -2456($sp)

#------------423  FACTOR_VAR INT t16 save in reg[171]
   lw $t3 -120($sp)
   sw $t3 -2460($sp)

#------------424  IF reg[170] BGEQ reg[171] THEN GOTO label_36
   lw $t0 -2456($sp)
   lw $t1 -2460($sp)
    bge $t0 $t1 label_36

#------------425  FACTOR_VAR INT t18 save in reg[172]
   lw $t3 -128($sp)
   sw $t3 -2464($sp)

#------------426  FACTOR_VAR INT t17 save in reg[173]
   lw $t3 -124($sp)
   sw $t3 -2468($sp)

#------------427  reg[174] = reg[172] JIA reg[173]
   lw $t0 -2464($sp)
   lw $t1 -2468($sp)
   addu $t2 $t0 $t1
   sw $t2 -2472($sp)

#------------428  ASSIGN INT t18 = reg[174]
   lw $t3 -2472($sp)
   sw $t3 -128($sp)

#------------429  FACTOR_VAR INT t17 save in reg[175]
   lw $t3 -124($sp)
   sw $t3 -2476($sp)

#------------430  FACTOR_CON INT 1 save in reg[176]
   li $t0 1
   sw $t0 -2480($sp)

#------------431  reg[177] = reg[175] JIA reg[176]
   lw $t0 -2476($sp)
   lw $t1 -2480($sp)
   addu $t2 $t0 $t1
   sw $t2 -2484($sp)

#------------432  ASSIGN INT t17 = reg[177]
   lw $t3 -2484($sp)
   sw $t3 -124($sp)

#------------433  JUMP to label_35
   j label_35

#------------434  label_36    ----------------Label----------------
label_36:

#------------435  FACTOR_VAR INT t16 save in reg[178]
   lw $t3 -120($sp)
   sw $t3 -2488($sp)

#------------436  FACTOR_CON INT 1 save in reg[179]
   li $t0 1
   sw $t0 -2492($sp)

#------------437  reg[180] = reg[178] JIA reg[179]
   lw $t0 -2488($sp)
   lw $t1 -2492($sp)
   addu $t2 $t0 $t1
   sw $t2 -2496($sp)

#------------438  ASSIGN INT t16 = reg[180]
   lw $t3 -2496($sp)
   sw $t3 -120($sp)

#------------439  JUMP to label_34
   j label_34

#------------440  label_37    ----------------Label----------------
label_37:

#------------441  FACTOR_CON INT 0 save in reg[181]
   li $t0 0
   sw $t0 -2500($sp)

#------------442  ASSIGN INT t19 = reg[181]
   lw $t3 -2500($sp)
   sw $t3 -132($sp)

#------------443  FACTOR_CON INT 2 save in reg[182]
   li $t0 2
   sw $t0 -2504($sp)

#------------444  ASSIGN INT t20 = reg[182]
   lw $t3 -2504($sp)
   sw $t3 -136($sp)

#------------445  label_38    ----------------Label----------------
label_38:

#------------446  FACTOR_CON INT 1 save in reg[183]
   li $t0 1
   sw $t0 -2508($sp)

#------------447  ASSIGN INT t22 = reg[183]
   lw $t3 -2508($sp)
   sw $t3 -144($sp)

#------------448  FACTOR_CON INT 2 save in reg[184]
   li $t0 2
   sw $t0 -2512($sp)

#------------449  ASSIGN INT t21 = reg[184]
   lw $t3 -2512($sp)
   sw $t3 -140($sp)

#------------450  label_39    ----------------Label----------------
label_39:

#------------451  FACTOR_VAR INT t22 save in reg[185]
   lw $t3 -144($sp)
   sw $t3 -2516($sp)

#------------452  FACTOR_VAR INT t21 save in reg[186]
   lw $t3 -140($sp)
   sw $t3 -2520($sp)

#------------453  reg[187] = reg[185] CHENG reg[186]
   lw $t0 -2516($sp)
   lw $t1 -2520($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2524($sp)

#------------454  ASSIGN INT t22 = reg[187]
   lw $t3 -2524($sp)
   sw $t3 -144($sp)

#------------455  FACTOR_VAR INT t21 save in reg[188]
   lw $t3 -140($sp)
   sw $t3 -2528($sp)

#------------456  FACTOR_CON INT 2 save in reg[189]
   li $t0 2
   sw $t0 -2532($sp)

#------------457  reg[190] = reg[188] JIA reg[189]
   lw $t0 -2528($sp)
   lw $t1 -2532($sp)
   addu $t2 $t0 $t1
   sw $t2 -2536($sp)

#------------458  ASSIGN INT t21 = reg[190]
   lw $t3 -2536($sp)
   sw $t3 -140($sp)

#------------459  FACTOR_VAR INT t21 save in reg[191]
   lw $t3 -140($sp)
   sw $t3 -2540($sp)

#------------460  FACTOR_VAR INT t20 save in reg[192]
   lw $t3 -136($sp)
   sw $t3 -2544($sp)

#------------461  IF reg[191] BLSS reg[192] THEN GOTO label_39
   lw $t0 -2540($sp)
   lw $t1 -2544($sp)
    blt $t0 $t1 label_39

#------------462  FACTOR_VAR INT t19 save in reg[193]
   lw $t3 -132($sp)
   sw $t3 -2548($sp)

#------------463  FACTOR_VAR INT t22 save in reg[194]
   lw $t3 -144($sp)
   sw $t3 -2552($sp)

#------------464  reg[195] = reg[193] JIA reg[194]
   lw $t0 -2548($sp)
   lw $t1 -2552($sp)
   addu $t2 $t0 $t1
   sw $t2 -2556($sp)

#------------465  ASSIGN INT t19 = reg[195]
   lw $t3 -2556($sp)
   sw $t3 -132($sp)

#------------466  FACTOR_VAR INT t20 save in reg[196]
   lw $t3 -136($sp)
   sw $t3 -2560($sp)

#------------467  FACTOR_CON INT 1 save in reg[197]
   li $t0 1
   sw $t0 -2564($sp)

#------------468  reg[198] = reg[196] JIA reg[197]
   lw $t0 -2560($sp)
   lw $t1 -2564($sp)
   addu $t2 $t0 $t1
   sw $t2 -2568($sp)

#------------469  ASSIGN INT t20 = reg[198]
   lw $t3 -2568($sp)
   sw $t3 -136($sp)

#------------470  FACTOR_VAR INT t20 save in reg[199]
   lw $t3 -136($sp)
   sw $t3 -2572($sp)

#------------471  FACTOR_CON INT 5 save in reg[200]
   li $t0 5
   sw $t0 -2576($sp)

#------------472  IF reg[199] BLEQ reg[200] THEN GOTO label_38
   lw $t0 -2572($sp)
   lw $t1 -2576($sp)
    ble $t0 $t1 label_38

#------------473  FACTOR_CON INT 100 save in reg[201]
   li $t0 100
   sw $t0 -2580($sp)

#------------474  ASSIGN INT t20 = reg[201]
   lw $t3 -2580($sp)
   sw $t3 -136($sp)

#------------475  label_40    ----------------Label----------------
label_40:

#------------476  FACTOR_CON INT 1 save in reg[202]
   li $t0 1
   sw $t0 -2584($sp)

#------------477  ASSIGN INT t22 = reg[202]
   lw $t3 -2584($sp)
   sw $t3 -144($sp)

#------------478  FACTOR_CON INT 100 save in reg[203]
   li $t0 100
   sw $t0 -2588($sp)

#------------479  ASSIGN INT t21 = reg[203]
   lw $t3 -2588($sp)
   sw $t3 -140($sp)

#------------480  label_41    ----------------Label----------------
label_41:

#------------481  FACTOR_VAR INT t22 save in reg[204]
   lw $t3 -144($sp)
   sw $t3 -2592($sp)

#------------482  FACTOR_VAR INT t21 save in reg[205]
   lw $t3 -140($sp)
   sw $t3 -2596($sp)

#------------483  reg[206] = reg[204] CHENG reg[205]
   lw $t0 -2592($sp)
   lw $t1 -2596($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2600($sp)

#------------484  ASSIGN INT t22 = reg[206]
   lw $t3 -2600($sp)
   sw $t3 -144($sp)

#------------485  FACTOR_VAR INT t21 save in reg[207]
   lw $t3 -140($sp)
   sw $t3 -2604($sp)

#------------486  FACTOR_CON INT 2 save in reg[208]
   li $t0 2
   sw $t0 -2608($sp)

#------------487  reg[209] = reg[207] JIAN reg[208]
   lw $t0 -2604($sp)
   lw $t1 -2608($sp)
   subu $t2 $t0 $t1
   sw $t2 -2612($sp)

#------------488  ASSIGN INT t21 = reg[209]
   lw $t3 -2612($sp)
   sw $t3 -140($sp)

#------------489  FACTOR_VAR INT t21 save in reg[210]
   lw $t3 -140($sp)
   sw $t3 -2616($sp)

#------------490  FACTOR_VAR INT t20 save in reg[211]
   lw $t3 -136($sp)
   sw $t3 -2620($sp)

#------------491  IF reg[210] BGTR reg[211] THEN GOTO label_41
   lw $t0 -2616($sp)
   lw $t1 -2620($sp)
    bgt $t0 $t1 label_41

#------------492  FACTOR_VAR INT t19 save in reg[212]
   lw $t3 -132($sp)
   sw $t3 -2624($sp)

#------------493  FACTOR_VAR INT t22 save in reg[213]
   lw $t3 -144($sp)
   sw $t3 -2628($sp)

#------------494  reg[214] = reg[212] JIA reg[213]
   lw $t0 -2624($sp)
   lw $t1 -2628($sp)
   addu $t2 $t0 $t1
   sw $t2 -2632($sp)

#------------495  ASSIGN INT t19 = reg[214]
   lw $t3 -2632($sp)
   sw $t3 -132($sp)

#------------496  FACTOR_VAR INT t20 save in reg[215]
   lw $t3 -136($sp)
   sw $t3 -2636($sp)

#------------497  FACTOR_CON INT 1 save in reg[216]
   li $t0 1
   sw $t0 -2640($sp)

#------------498  reg[217] = reg[215] JIAN reg[216]
   lw $t0 -2636($sp)
   lw $t1 -2640($sp)
   subu $t2 $t0 $t1
   sw $t2 -2644($sp)

#------------499  ASSIGN INT t20 = reg[217]
   lw $t3 -2644($sp)
   sw $t3 -136($sp)

#------------500  FACTOR_VAR INT t20 save in reg[218]
   lw $t3 -136($sp)
   sw $t3 -2648($sp)

#------------501  FACTOR_CON INT 97 save in reg[219]
   li $t0 97
   sw $t0 -2652($sp)

#------------502  IF reg[218] BGEQ reg[219] THEN GOTO label_40
   lw $t0 -2648($sp)
   lw $t1 -2652($sp)
    bge $t0 $t1 label_40

#------------503  FACTOR_CON INT 1 save in reg[220]
   li $t0 1
   sw $t0 -2656($sp)



#------------506  FACTOR_CON INT 0 save in reg[223]
   li $t0 0
   sw $t0 -2668($sp)

#------------507  IF reg[220] BLEQ reg[223] THEN GOTO label_42
   lw $t0 -2656($sp)
   lw $t1 -2668($sp)
    ble $t0 $t1 label_42

#------------508  WRITE  ojbk
   li $v0 4
   la $a0 .str_17
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------509  JUMP to label_43
   j label_43

#------------510  label_42    ----------------Label----------------
label_42:

#------------511  label_43    ----------------Label----------------
label_43:

#------------512  label_44    ----------------Label----------------
label_44:

#------------513  FACTOR_CON INT 1 save in reg[224]
   li $t0 1
   sw $t0 -2672($sp)

#------------514  IF reg[224] BEQ reg[0] THEN GOTO label_48
   lw $t0 -2672($sp)
    beq $t0 $0 label_48

#------------515  FACTOR_CON INT 0 save in reg[225]
   li $t0 0
   sw $t0 -2676($sp)

#------------516  ASSIGN INT t23 = reg[225]
   lw $t3 -2676($sp)
   sw $t3 -148($sp)

#------------517  label_45    ----------------Label----------------
label_45:

#------------518  FACTOR_VAR INT t23 save in reg[226]
   lw $t3 -148($sp)
   sw $t3 -2680($sp)

#------------519  FACTOR_CON INT 2 save in reg[227]
   li $t0 2
   sw $t0 -2684($sp)

#------------520  reg[228] = reg[226] JIA reg[227]
   lw $t0 -2680($sp)
   lw $t1 -2684($sp)
   addu $t2 $t0 $t1
   sw $t2 -2688($sp)

#------------521  ASSIGN INT t23 = reg[228]
   lw $t3 -2688($sp)
   sw $t3 -148($sp)

#------------522  FACTOR_VAR INT t23 save in reg[229]
   lw $t3 -148($sp)
   sw $t3 -2692($sp)

#------------523  FACTOR_CON INT 60 save in reg[230]
   li $t0 60
   sw $t0 -2696($sp)

#------------524  IF reg[229] BLEQ reg[230] THEN GOTO label_46
   lw $t0 -2692($sp)
   lw $t1 -2696($sp)
    ble $t0 $t1 label_46

#------------525  FACTOR_VAR INT t18 save in reg[231]
   lw $t3 -128($sp)
   sw $t3 -2700($sp)

#------------526  FACTOR_VAR INT t19 save in reg[232]
   lw $t3 -132($sp)
   sw $t3 -2704($sp)

#------------527  reg[233] = reg[231] JIA reg[232]
   lw $t0 -2700($sp)
   lw $t1 -2704($sp)
   addu $t2 $t0 $t1
   sw $t2 -2708($sp)

#------------528  FACTOR_VAR INT t23 save in reg[234]
   lw $t3 -148($sp)
   sw $t3 -2712($sp)

#------------529  reg[235] = reg[233] JIA reg[234]
   lw $t0 -2708($sp)
   lw $t1 -2712($sp)
   addu $t2 $t0 $t1
   sw $t2 -2716($sp)

#------------530  WRITE  
   li $v0 4
   la $a0 .str_13
   syscall

#------------531  WRITE INT reg[235]
   li $v0 1
   lw $a0 -2716($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------532  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -1776($sp)
   jr $ra

#------------533  JUMP to label_47
   j label_47

#------------534  label_46    ----------------Label----------------
label_46:

#------------535  label_47    ----------------Label----------------
label_47:

#------------536  FACTOR_VAR INT t23 save in reg[236]
   lw $t3 -148($sp)
   sw $t3 -2720($sp)

#------------537  FACTOR_CON INT 1 save in reg[237]
   li $t0 1
   sw $t0 -2724($sp)

#------------538  reg[238] = reg[236] JIA reg[237]
   lw $t0 -2720($sp)
   lw $t1 -2724($sp)
   addu $t2 $t0 $t1
   sw $t2 -2728($sp)

#------------539  ASSIGN INT t23 = reg[238]
   lw $t3 -2728($sp)
   sw $t3 -148($sp)

#------------540  FACTOR_VAR INT t23 save in reg[239]
   lw $t3 -148($sp)
   sw $t3 -2732($sp)

#------------541  FACTOR_CON INT 100 save in reg[240]
   li $t0 100
   sw $t0 -2736($sp)

#------------542  IF reg[239] BLSS reg[240] THEN GOTO label_45
   lw $t0 -2732($sp)
   lw $t1 -2736($sp)
    blt $t0 $t1 label_45

#------------543  JUMP to label_44
   j label_44

#------------544  label_48    ----------------Label----------------
label_48:

#------------545  WRITE error14
   li $v0 4
   la $a0 .str_19
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------546  JUMP to label_50
   j label_50

#------------547  label_49    ----------------Label----------------
label_49:

#------------548  label_50    ----------------Label----------------
label_50:

#------------549  FACTOR_VAR INT in_1 save in reg[241]
   lw $t3 0($sp)
   sw $t3 -2740($sp)

#------------550  FACTOR_CON INT 3 save in reg[242]
   li $t0 3
   sw $t0 -2744($sp)

#------------551  IF reg[241] BNE reg[242] THEN GOTO label_52
   lw $t0 -2740($sp)
   lw $t1 -2744($sp)
    bne $t0 $t1 label_52

#------------552  FACTOR_CON INT 1 save in reg[243]
   li $t0 1
   sw $t0 -2748($sp)

#------------553  PUSH INT parareg[2] from reg[243]
   sw $ra -2752($sp)
   lw $t0 -2748($sp)
   sw $t0 -2756($sp)

#------------554  CALL INT factorial(1)
   addiu $sp $sp -2756
   jal .func_factorial
   subiu $sp $sp -2756
   lw $ra -2752($sp)

#------------555  FACTOR_FUNC INT factorial save in reg[244]
   sw $v0 -2752($sp)

#------------556  FACTOR_CON INT 2 save in reg[245]
   li $t0 2
   sw $t0 -2756($sp)

#------------557  PUSH INT parareg[3] from reg[245]
   sw $ra -2760($sp)
   lw $t0 -2756($sp)
   sw $t0 -2764($sp)

#------------558  CALL INT factorial(1)
   addiu $sp $sp -2764
   jal .func_factorial
   subiu $sp $sp -2764
   lw $ra -2760($sp)

#------------559  FACTOR_FUNC INT factorial save in reg[246]
   sw $v0 -2760($sp)

#------------560  reg[247] = reg[244] JIA reg[246]
   lw $t0 -2752($sp)
   lw $t1 -2760($sp)
   addu $t2 $t0 $t1
   sw $t2 -2764($sp)

#------------561  FACTOR_CON INT 5 save in reg[248]
   li $t0 5
   sw $t0 -2768($sp)

#------------562  PUSH INT parareg[4] from reg[248]
   sw $ra -2772($sp)
   lw $t0 -2768($sp)
   sw $t0 -2776($sp)

#------------563  CALL INT factorial(1)
   addiu $sp $sp -2776
   jal .func_factorial
   subiu $sp $sp -2776
   lw $ra -2772($sp)

#------------564  FACTOR_FUNC INT factorial save in reg[249]
   sw $v0 -2772($sp)

#------------565  reg[250] = reg[247] JIA reg[249]
   lw $t0 -2764($sp)
   lw $t1 -2772($sp)
   addu $t2 $t0 $t1
   sw $t2 -2776($sp)

#------------566  WRITE INT reg[250]
   li $v0 1
   lw $a0 -2776($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------567  FACTOR_CON CHAR 97 save in reg[251]
   li $t0 97
   sw $t0 -2780($sp)

#------------568  ASSIGN_EXTERN CHAR _c1 = reg[251]
   lw $t3 -2780($sp)
   sw $t3 .var__c1

#------------569  FACTOR_CON CHAR 43 save in reg[252]
   li $t0 43
   sw $t0 -2784($sp)

#------------570  PUSH INT parareg[5] from reg[252]
   sw $ra -2788($sp)
   lw $t0 -2784($sp)
   sw $t0 -2792($sp)

#------------571  CALL CHAR ff1(1)
   addiu $sp $sp -2792
   jal .func_ff1
   subiu $sp $sp -2792
   lw $ra -2788($sp)

#------------572  FACTOR_VAR_EXTERN CHAR _c1 save in reg[253]
   lw $t3 .var__c1
   sw $t3 -2788($sp)

#------------573  WRITE CHAR reg[253]
   li $v0 11
   lw $a0 -2788($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------574  FACTOR_CON CHAR 98 save in reg[254]
   li $t0 98
   sw $t0 -2792($sp)

#------------575  ASSIGN_EXTERN CHAR _c2 = reg[254]
   lw $t3 -2792($sp)
   sw $t3 .var__c2

#------------576  CALL INT ff2(0)
   sw $ra -2796($sp)
   addiu $sp $sp -2800
   jal .func_ff2
   subiu $sp $sp -2800
   lw $ra -2796($sp)

#------------577  FACTOR_VAR_EXTERN CHAR _c2 save in reg[255]
   lw $t3 .var__c2
   sw $t3 -2796($sp)

#------------578  WRITE CHAR reg[255]
   li $v0 11
   lw $a0 -2796($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------579  FACTOR_CON INT 1 save in reg[256]
   li $t0 1
   sw $t0 -2800($sp)

#------------580  FACTOR_CON INT 2 save in reg[257]
   li $t0 2
   sw $t0 -2804($sp)

#------------581  FACTOR_CON CHAR 97 save in reg[258]
   li $t0 97
   sw $t0 -2808($sp)

#------------582  FACTOR_CON INT 3 save in reg[259]
   li $t0 3
   sw $t0 -2812($sp)

#------------583  FACTOR_CON CHAR 98 save in reg[260]
   li $t0 98
   sw $t0 -2816($sp)

#------------584  FACTOR_CON CHAR 99 save in reg[261]
   li $t0 99
   sw $t0 -2820($sp)

#------------585  PUSH INT parareg[6] from reg[256]
   sw $ra -2824($sp)
   lw $t0 -2800($sp)
   sw $t0 -2828($sp)

#------------586  PUSH INT parareg[7] from reg[257]
   lw $t0 -2804($sp)
   sw $t0 -2832($sp)

#------------587  PUSH INT parareg[8] from reg[258]
   lw $t0 -2808($sp)
   sw $t0 -2836($sp)

#------------588  PUSH INT parareg[9] from reg[259]
   lw $t0 -2812($sp)
   sw $t0 -2840($sp)

#------------589  PUSH INT parareg[10] from reg[260]
   lw $t0 -2816($sp)
   sw $t0 -2844($sp)

#------------590  PUSH INT parareg[11] from reg[261]
   lw $t0 -2820($sp)
   sw $t0 -2848($sp)

#------------591  CALL VOID ff3(6)
   addiu $sp $sp -2828
   jal .func_ff3
   subiu $sp $sp -2828
   lw $ra -2824($sp)

#------------592  CALL VOID ff4(0)
   sw $ra -2824($sp)
   addiu $sp $sp -2828
   jal .func_ff4
   subiu $sp $sp -2828
   lw $ra -2824($sp)

#------------593  FACTOR_CON CHAR 42 save in reg[262]
   li $t0 42
   sw $t0 -2824($sp)

#------------594  ASSIGN_EXTERN CHAR _c1 = reg[262]
   lw $t3 -2824($sp)
   sw $t3 .var__c1

#------------595  CALL VOID ff5(0)
   sw $ra -2828($sp)
   addiu $sp $sp -2832
   jal .func_ff5
   subiu $sp $sp -2832
   lw $ra -2828($sp)

#------------596  FACTOR_CON INT 6666 save in reg[263]
   li $t0 6666
   sw $t0 -2828($sp)

#------------597  ASSIGN INT _c4 = reg[263]
   lw $t3 -2828($sp)
   sw $t3 -968($sp)

#------------598  FACTOR_CON CHAR 56 save in reg[264]
   li $t0 56
   sw $t0 -2832($sp)

#------------599  ASSIGN CHAR _t1 = reg[264]
   lw $t3 -2832($sp)
   sw $t3 -976($sp)

#------------600  FACTOR_VAR INT _c4 save in reg[265]
   lw $t3 -968($sp)
   sw $t3 -2836($sp)

#------------601  FACTOR_VAR CHAR _t1 save in reg[266]
   lw $t3 -976($sp)
   sw $t3 -2840($sp)

#------------602  reg[267] = reg[265] JIA reg[266]
   lw $t0 -2836($sp)
   lw $t1 -2840($sp)
   addu $t2 $t0 $t1
   sw $t2 -2844($sp)

#------------603  WRITE INT reg[267]
   li $v0 1
   lw $a0 -2844($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------604  FACTOR_CON INT 50 save in reg[268]
   li $t0 50
   sw $t0 -2848($sp)

#------------605  FACTOR_CON CHAR 104 save in reg[269]
   li $t0 104
   sw $t0 -2852($sp)

#------------606  ASSIGN_ARR CHAR c_array2[reg[268]] = reg[269]
   lw $t0 -2848($sp)
   lw $t1 -2852($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -1380($t0)

#------------607  FACTOR_CON INT 50 save in reg[270]
   li $t0 50
   sw $t0 -2856($sp)

#------------608  FACTOR_ARRAY CHAR c_array2 [reg[270]] save in reg[271]
   lw $t3 -2856($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -1380($t3)
   sw $t3 -2860($sp)

#------------609  WRITE CHAR reg[271]
   li $v0 11
   lw $a0 -2860($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------610  FACTOR_CON CHAR 103 save in reg[272]
   li $t0 103
   sw $t0 -2864($sp)

#------------611  PUSH INT parareg[12] from reg[272]
   sw $ra -2868($sp)
   lw $t0 -2864($sp)
   sw $t0 -2872($sp)

#------------612  CALL CHAR ff1(1)
   addiu $sp $sp -2872
   jal .func_ff1
   subiu $sp $sp -2872
   lw $ra -2868($sp)

#------------613  FACTOR_FUNC CHAR ff1 save in reg[273]
   sw $v0 -2868($sp)

#------------614  WRITE CHAR reg[273]
   li $v0 11
   lw $a0 -2868($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall


#------------616  FACTOR_CON INT 114 save in reg[275]
   li $t0 114
   sw $t0 -2876($sp)

#------------617  WRITE INT reg[275]
   li $v0 1
   lw $a0 -2876($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------618  FACTOR_CON INT 0 save in reg[276]
   li $t0 0
   sw $t0 -2880($sp)

#------------619  ASSIGN INT i = reg[276]
   lw $t3 -2880($sp)
   sw $t3 -972($sp)

#------------620  label_51    ----------------Label----------------
label_51:

#------------621  FACTOR_VAR INT i save in reg[277]
   lw $t3 -972($sp)
   sw $t3 -2884($sp)

#------------622  FACTOR_VAR INT i save in reg[278]
   lw $t3 -972($sp)
   sw $t3 -2888($sp)

#------------623  ASSIGN_ARR INT t_array2[reg[277]] = reg[278]
   lw $t0 -2884($sp)
   lw $t1 -2888($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -980($t0)

#------------624  FACTOR_VAR INT i save in reg[279]
   lw $t3 -972($sp)
   sw $t3 -2892($sp)

#------------625  FACTOR_CON INT 1 save in reg[280]
   li $t0 1
   sw $t0 -2896($sp)

#------------626  reg[281] = reg[279] JIA reg[280]
   lw $t0 -2892($sp)
   lw $t1 -2896($sp)
   addu $t2 $t0 $t1
   sw $t2 -2900($sp)

#------------627  ASSIGN INT i = reg[281]
   lw $t3 -2900($sp)
   sw $t3 -972($sp)

#------------628  FACTOR_VAR INT i save in reg[282]
   lw $t3 -972($sp)
   sw $t3 -2904($sp)

#------------629  FACTOR_CON INT 100 save in reg[283]
   li $t0 100
   sw $t0 -2908($sp)

#------------630  IF reg[282] BLSS reg[283] THEN GOTO label_51
   lw $t0 -2904($sp)
   lw $t1 -2908($sp)
    blt $t0 $t1 label_51









#------------639  FACTOR_CON INT 60 save in reg[292]
   li $t0 60
   sw $t0 -2944($sp)

#------------640  FACTOR_ARRAY INT t_array2 [reg[292]] save in reg[293]
   lw $t3 -2944($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2948($sp)

#------------641  FACTOR_CON INT 23 save in reg[294]
   li $t0 23
   sw $t0 -2952($sp)

#------------642  reg[295] = reg[293] CHU reg[294]
   lw $t0 -2948($sp)
   lw $t1 -2952($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2956($sp)

#------------643  FACTOR_CON INT 22 save in reg[296]
   li $t0 22
   sw $t0 -2960($sp)

#------------644  FACTOR_VAR INT i save in reg[297]
   lw $t3 -972($sp)
   sw $t3 -2964($sp)

#------------645  reg[298] = reg[296] CHENG reg[297]
   lw $t0 -2960($sp)
   lw $t1 -2964($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2968($sp)

#------------646  FACTOR_CON INT 23 save in reg[299]
   li $t0 23
   sw $t0 -2972($sp)

#------------647  reg[300] = reg[298] CHU reg[299]
   lw $t0 -2968($sp)
   lw $t1 -2972($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2976($sp)

#------------648  FACTOR_CON INT 1 save in reg[301]
   li $t0 1
   sw $t0 -2980($sp)

#------------649  FACTOR_ARRAY INT t_array2 [reg[301]] save in reg[302]
   lw $t3 -2980($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2984($sp)

#------------650  FACTOR_CON INT 1000 save in reg[303]
   li $t0 1000
   sw $t0 -2988($sp)

#------------651  reg[304] = reg[302] CHENG reg[303]
   lw $t0 -2984($sp)
   lw $t1 -2988($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2992($sp)

#------------652  FACTOR_EXPR reg[304] save in reg[305]
   lw $t0 -2992($sp)
   sw $t0 -2996($sp)

#------------653  reg[306] = reg[300] CHENG reg[305]
   lw $t0 -2976($sp)
   lw $t1 -2996($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -3000($sp)

#------------654  FACTOR_CON INT 1000 save in reg[307]
   li $t0 1000
   sw $t0 -3004($sp)

#------------655  reg[308] = reg[306] CHU reg[307]
   lw $t0 -3000($sp)
   lw $t1 -3004($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -3008($sp)



#------------658  FACTOR_CON INT 3 save in reg[311]
   li $t0 3
   sw $t0 -3020($sp)

#------------659  reg[312] = reg[308] JIA reg[311]
   lw $t0 -3008($sp)
   lw $t1 -3020($sp)
   addu $t2 $t0 $t1
   sw $t2 -3024($sp)

#------------660  FACTOR_ARRAY INT t_array2 [reg[312]] save in reg[313]
   lw $t3 -3024($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -3028($sp)

#------------661  FACTOR_CON INT 30 save in reg[314]
   li $t0 30
   sw $t0 -3032($sp)

#------------662  reg[315] = reg[313] CHU reg[314]
   lw $t0 -3028($sp)
   lw $t1 -3032($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -3036($sp)

#------------663  reg[316] = reg[295] JIA reg[315]
   lw $t0 -2956($sp)
   lw $t1 -3036($sp)
   addu $t2 $t0 $t1
   sw $t2 -3040($sp)

#------------664  FACTOR_ARRAY INT t_array2 [reg[316]] save in reg[317]
   lw $t3 -3040($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -3044($sp)

#------------665  ASSIGN INT i = reg[317]
   lw $t3 -3044($sp)
   sw $t3 -972($sp)









#------------674  FACTOR_CON INT 60 save in reg[326]
   li $t0 60
   sw $t0 -3080($sp)

#------------675  FACTOR_ARRAY INT t_array2 [reg[326]] save in reg[327]
   lw $t3 -3080($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -3084($sp)

#------------676  FACTOR_CON INT 23 save in reg[328]
   li $t0 23
   sw $t0 -3088($sp)

#------------677  reg[329] = reg[327] CHU reg[328]
   lw $t0 -3084($sp)
   lw $t1 -3088($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -3092($sp)

#------------678  FACTOR_CON INT 22 save in reg[330]
   li $t0 22
   sw $t0 -3096($sp)

#------------679  FACTOR_VAR INT i save in reg[331]
   lw $t3 -972($sp)
   sw $t3 -3100($sp)

#------------680  reg[332] = reg[330] CHENG reg[331]
   lw $t0 -3096($sp)
   lw $t1 -3100($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -3104($sp)

#------------681  FACTOR_CON INT 23 save in reg[333]
   li $t0 23
   sw $t0 -3108($sp)

#------------682  reg[334] = reg[332] CHU reg[333]
   lw $t0 -3104($sp)
   lw $t1 -3108($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -3112($sp)

#------------683  FACTOR_CON INT 1 save in reg[335]
   li $t0 1
   sw $t0 -3116($sp)

#------------684  FACTOR_ARRAY INT t_array2 [reg[335]] save in reg[336]
   lw $t3 -3116($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -3120($sp)

#------------685  FACTOR_CON INT 1000 save in reg[337]
   li $t0 1000
   sw $t0 -3124($sp)

#------------686  reg[338] = reg[336] CHENG reg[337]
   lw $t0 -3120($sp)
   lw $t1 -3124($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -3128($sp)

#------------687  FACTOR_EXPR reg[338] save in reg[339]
   lw $t0 -3128($sp)
   sw $t0 -3132($sp)

#------------688  reg[340] = reg[334] CHENG reg[339]
   lw $t0 -3112($sp)
   lw $t1 -3132($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -3136($sp)

#------------689  FACTOR_CON INT 1000 save in reg[341]
   li $t0 1000
   sw $t0 -3140($sp)

#------------690  reg[342] = reg[340] CHU reg[341]
   lw $t0 -3136($sp)
   lw $t1 -3140($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -3144($sp)



#------------693  FACTOR_CON INT 3 save in reg[345]
   li $t0 3
   sw $t0 -3156($sp)

#------------694  reg[346] = reg[342] JIA reg[345]
   lw $t0 -3144($sp)
   lw $t1 -3156($sp)
   addu $t2 $t0 $t1
   sw $t2 -3160($sp)

#------------695  FACTOR_ARRAY INT t_array2 [reg[346]] save in reg[347]
   lw $t3 -3160($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -3164($sp)

#------------696  FACTOR_CON INT 30 save in reg[348]
   li $t0 30
   sw $t0 -3168($sp)

#------------697  reg[349] = reg[347] CHU reg[348]
   lw $t0 -3164($sp)
   lw $t1 -3168($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -3172($sp)

#------------698  reg[350] = reg[329] JIA reg[349]
   lw $t0 -3092($sp)
   lw $t1 -3172($sp)
   addu $t2 $t0 $t1
   sw $t2 -3176($sp)

#------------699  FACTOR_ARRAY INT t_array2 [reg[350]] save in reg[351]
   lw $t3 -3176($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -3180($sp)

#------------700  PUSH INT parareg[13] from reg[351]
   sw $ra -3184($sp)
   lw $t0 -3180($sp)
   sw $t0 -3188($sp)

#------------701  CALL INT factorial(1)
   addiu $sp $sp -3188
   jal .func_factorial
   subiu $sp $sp -3188
   lw $ra -3184($sp)

#------------702  FACTOR_FUNC INT factorial save in reg[352]
   sw $v0 -3184($sp)

#------------703  WRITE INT reg[352]
   li $v0 1
   lw $a0 -3184($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------704  JUMP to label_53
   j label_53

#------------705  label_52    ----------------Label----------------
label_52:

#------------706  label_53    ----------------Label----------------
label_53:

#------------707  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -1776($sp)
   jr $ra

   jr $ra

end:
