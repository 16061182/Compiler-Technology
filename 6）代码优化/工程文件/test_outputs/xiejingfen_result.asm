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

#------------17  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------18  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -8($sp)

#------------19  reg[3] = reg[2] JIA reg[3]
   lw $t0 -4($sp)
   lw $t1 -8($sp)
   add $t2 $t0 $t1
   sw $t2 -8($sp)

#------------20  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -12($sp)

#------------21  reg[4] = reg[3] JIA reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------22  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
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

#------------32  reg[2] = reg[1] JIA reg[2]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------33  FACTOR_VAR CHAR c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------34  reg[3] = reg[2] JIA reg[3]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------35  FACTOR_VAR INT d save in reg[4]
   lw $t3 -12($sp)
   sw $t3 -36($sp)

#------------36  reg[4] = reg[3] JIA reg[4]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------37  FACTOR_VAR CHAR e save in reg[5]
   lw $t3 -16($sp)
   sw $t3 -40($sp)

#------------38  reg[5] = reg[4] JIA reg[5]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------39  FACTOR_VAR CHAR f save in reg[6]
   lw $t3 -20($sp)
   sw $t3 -44($sp)

#------------40  reg[6] = reg[5] JIA reg[6]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------41  WRITE INT reg[6]
   li $v0 1
   lw $a0 -44($sp)
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

#------------57  reg[5] = reg[4] JIAN reg[5]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -24($sp)

#------------58  PUSH INT parareg[0] from reg[5]
   sw $ra -28($sp)
   lw $t0 -24($sp)
   sw $t0 -32($sp)

#------------59  CALL INT factorial(1)
   addi $sp $sp -32
   jal .func_factorial
   subi $sp $sp -32
   lw $ra -28($sp)

#------------60  FACTOR_FUNC INT factorial save in reg[6]
   sw $v0 -28($sp)

#------------61  FACTOR_VAR INT a save in reg[7]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------62  reg[7] = reg[6] CHENG reg[7]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -32($sp)

#------------63  FACTOR_EXPR reg[7] save in reg[8]
   lw $t0 -32($sp)
   sw $t0 -36($sp)

#------------64  ASSIGN INT b = reg[8]
   lw $t3 -36($sp)
   sw $t3 -4($sp)

#------------65  FACTOR_VAR INT b save in reg[9]
   lw $t3 -4($sp)
   sw $t3 -40($sp)

#------------66  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
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

#------------75  reg[3] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------76  FACTOR_VAR_EXTERN CHAR _c1 save in reg[4]
   lw $t3 .var__c1
   sw $t3 -16($sp)

#------------77  reg[4] = reg[3] JIA reg[4]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   add $t2 $t0 $t1
   sw $t2 -16($sp)

#------------78  WRITE INT reg[4]
   li $v0 1
   lw $a0 -16($sp)
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

#------------123  FACTOR_VAR INT in_1 save in reg[5]
   lw $t3 0($sp)
   sw $t3 -1796($sp)

#------------124  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -1800($sp)

#------------125  IF reg[5] BNE reg[6] THEN GOTO label_20
   lw $t0 -1796($sp)
   lw $t1 -1800($sp)
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

#------------130  FACTOR_VAR CHAR c2 save in reg[7]
   lw $t3 -16($sp)
   sw $t3 -1804($sp)

#------------131  FACTOR_VAR INT t1 save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -1808($sp)

#------------132  FACTOR_VAR CHAR c2 save in reg[9]
   lw $t3 -16($sp)
   sw $t3 -1812($sp)

#------------133  reg[9] = reg[8] CHENG reg[9]
   lw $t0 -1808($sp)
   lw $t1 -1812($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -1812($sp)

#------------134  reg[9] = reg[7] JIA reg[9]
   lw $t0 -1804($sp)
   lw $t1 -1812($sp)
   add $t2 $t0 $t1
   sw $t2 -1812($sp)

#------------135  FACTOR_VAR INT t1 save in reg[10]
   lw $t3 -4($sp)
   sw $t3 -1816($sp)

#------------136  FACTOR_VAR CHAR c1 save in reg[11]
   lw $t3 -12($sp)
   sw $t3 -1820($sp)

#------------137  reg[11] = reg[10] CHU reg[11]
   lw $t0 -1816($sp)
   lw $t1 -1820($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -1820($sp)

#------------138  reg[11] = reg[9] JIAN reg[11]
   lw $t0 -1812($sp)
   lw $t1 -1820($sp)
   sub $t2 $t0 $t1
   sw $t2 -1820($sp)

#------------139  WRITE INT reg[11]
   li $v0 1
   lw $a0 -1820($sp)
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

#------------142  WRITE @@@@@
   li $v0 4
   la $a0 .str_3
   syscall

#------------143  FACTOR_VAR CHAR c2 save in reg[12]
   lw $t3 -16($sp)
   sw $t3 -1824($sp)

#------------144  WRITE CHAR reg[12]
   li $v0 11
   lw $a0 -1824($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------145  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -1828($sp)

#------------146  FACTOR_CON CHAR 43 save in reg[14]
   li $t0 43
   sw $t0 -1832($sp)

#------------147  ASSIGN_ARR CHAR single_chars[reg[13]] = reg[14]
   lw $t0 -1828($sp)
   lw $t1 -1832($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------148  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -1836($sp)

#------------149  FACTOR_CON CHAR 45 save in reg[16]
   li $t0 45
   sw $t0 -1840($sp)

#------------150  ASSIGN_ARR CHAR single_chars[reg[15]] = reg[16]
   lw $t0 -1836($sp)
   lw $t1 -1840($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------151  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -1844($sp)

#------------152  FACTOR_CON CHAR 42 save in reg[18]
   li $t0 42
   sw $t0 -1848($sp)

#------------153  ASSIGN_ARR CHAR single_chars[reg[17]] = reg[18]
   lw $t0 -1844($sp)
   lw $t1 -1848($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------154  FACTOR_CON INT 3 save in reg[19]
   li $t0 3
   sw $t0 -1852($sp)

#------------155  FACTOR_CON CHAR 47 save in reg[20]
   li $t0 47
   sw $t0 -1856($sp)

#------------156  ASSIGN_ARR CHAR single_chars[reg[19]] = reg[20]
   lw $t0 -1852($sp)
   lw $t1 -1856($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------157  FACTOR_CON INT 4 save in reg[21]
   li $t0 4
   sw $t0 -1860($sp)

#------------158  FACTOR_CON CHAR 48 save in reg[22]
   li $t0 48
   sw $t0 -1864($sp)

#------------159  ASSIGN_ARR CHAR single_chars[reg[21]] = reg[22]
   lw $t0 -1860($sp)
   lw $t1 -1864($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------160  FACTOR_CON INT 5 save in reg[23]
   li $t0 5
   sw $t0 -1868($sp)

#------------161  FACTOR_CON CHAR 57 save in reg[24]
   li $t0 57
   sw $t0 -1872($sp)

#------------162  ASSIGN_ARR CHAR single_chars[reg[23]] = reg[24]
   lw $t0 -1868($sp)
   lw $t1 -1872($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------163  FACTOR_CON INT 6 save in reg[25]
   li $t0 6
   sw $t0 -1876($sp)

#------------164  FACTOR_CON CHAR 97 save in reg[26]
   li $t0 97
   sw $t0 -1880($sp)

#------------165  ASSIGN_ARR CHAR single_chars[reg[25]] = reg[26]
   lw $t0 -1876($sp)
   lw $t1 -1880($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------166  FACTOR_CON INT 7 save in reg[27]
   li $t0 7
   sw $t0 -1884($sp)

#------------167  FACTOR_CON CHAR 122 save in reg[28]
   li $t0 122
   sw $t0 -1888($sp)

#------------168  ASSIGN_ARR CHAR single_chars[reg[27]] = reg[28]
   lw $t0 -1884($sp)
   lw $t1 -1888($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------169  FACTOR_CON INT 8 save in reg[29]
   li $t0 8
   sw $t0 -1892($sp)

#------------170  FACTOR_CON CHAR 65 save in reg[30]
   li $t0 65
   sw $t0 -1896($sp)

#------------171  ASSIGN_ARR CHAR single_chars[reg[29]] = reg[30]
   lw $t0 -1892($sp)
   lw $t1 -1896($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------172  FACTOR_CON INT 9 save in reg[31]
   li $t0 9
   sw $t0 -1900($sp)

#------------173  FACTOR_CON CHAR 90 save in reg[32]
   li $t0 90
   sw $t0 -1904($sp)

#------------174  ASSIGN_ARR CHAR single_chars[reg[31]] = reg[32]
   lw $t0 -1900($sp)
   lw $t1 -1904($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -20($t0)

#------------175  FACTOR_CON CHAR 43 save in reg[33]
   li $t0 43
   sw $t0 -1908($sp)

#------------176  ASSIGN_EXTERN CHAR _c1 = reg[33]
   lw $t3 -1908($sp)
   sw $t3 .var__c1

#------------177  FACTOR_CON CHAR 97 save in reg[34]
   li $t0 97
   sw $t0 -1912($sp)

#------------178  ASSIGN_EXTERN CHAR _c3 = reg[34]
   lw $t3 -1912($sp)
   sw $t3 .var__c3

#------------179  FACTOR_VAR_EXTERN CHAR _c1 save in reg[35]
   lw $t3 .var__c1
   sw $t3 -1916($sp)

#------------180  FACTOR_CON INT 2 save in reg[36]
   li $t0 2
   sw $t0 -1920($sp)

#------------181  reg[36] = reg[35] JIA reg[36]
   lw $t0 -1916($sp)
   lw $t1 -1920($sp)
   add $t2 $t0 $t1
   sw $t2 -1920($sp)

#------------182  ASSIGN INT t3 = reg[36]
   lw $t3 -1920($sp)
   sw $t3 -60($sp)

#------------183  FACTOR_VAR_EXTERN CHAR _c3 save in reg[37]
   lw $t3 .var__c3
   sw $t3 -1924($sp)

#------------184  FACTOR_CON CHAR 0 save in reg[38]
   li $t0 0
   sw $t0 -1928($sp)

#------------185  reg[38] = reg[38] JIAN reg[37]
   lw $t0 -1928($sp)
   lw $t1 -1924($sp)
   sub $t2 $t0 $t1
   sw $t2 -1928($sp)

#------------186  FACTOR_CON INT 77 save in reg[39]
   li $t0 77
   sw $t0 -1932($sp)

#------------187  reg[39] = reg[38] JIA reg[39]
   lw $t0 -1928($sp)
   lw $t1 -1932($sp)
   add $t2 $t0 $t1
   sw $t2 -1932($sp)

#------------188  ASSIGN INT t4 = reg[39]
   lw $t3 -1932($sp)
   sw $t3 -64($sp)

#------------189  FACTOR_CON INT 1 save in reg[40]
   li $t0 1
   sw $t0 -1936($sp)

#------------190  FACTOR_CON CHAR 0 save in reg[41]
   li $t0 0
   sw $t0 -1940($sp)

#------------191  reg[41] = reg[41] JIAN reg[40]
   lw $t0 -1940($sp)
   lw $t1 -1936($sp)
   sub $t2 $t0 $t1
   sw $t2 -1940($sp)

#------------192  FACTOR_CON CHAR 45 save in reg[42]
   li $t0 45
   sw $t0 -1944($sp)

#------------193  reg[42] = reg[41] JIA reg[42]
   lw $t0 -1940($sp)
   lw $t1 -1944($sp)
   add $t2 $t0 $t1
   sw $t2 -1944($sp)

#------------194  FACTOR_CON INT 1 save in reg[43]
   li $t0 1
   sw $t0 -1948($sp)

#------------195  reg[43] = reg[42] JIA reg[43]
   lw $t0 -1944($sp)
   lw $t1 -1948($sp)
   add $t2 $t0 $t1
   sw $t2 -1948($sp)

#------------196  ASSIGN INT t5 = reg[43]
   lw $t3 -1948($sp)
   sw $t3 -68($sp)

#------------197  FACTOR_VAR INT t3 save in reg[44]
   lw $t3 -60($sp)
   sw $t3 -1952($sp)

#------------198  FACTOR_VAR INT t5 save in reg[45]
   lw $t3 -68($sp)
   sw $t3 -1956($sp)

#------------199  IF reg[44] BEQ reg[45] THEN GOTO label_2
   lw $t0 -1952($sp)
   lw $t1 -1956($sp)
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

#------------204  FACTOR_VAR INT t3 save in reg[46]
   lw $t3 -60($sp)
   sw $t3 -1960($sp)

#------------205  FACTOR_VAR INT t4 save in reg[47]
   lw $t3 -64($sp)
   sw $t3 -1964($sp)

#------------206  IF reg[46] BNE reg[47] THEN GOTO label_4
   lw $t0 -1960($sp)
   lw $t1 -1964($sp)
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

#------------211  FACTOR_VAR INT t3 save in reg[48]
   lw $t3 -60($sp)
   sw $t3 -1968($sp)

#------------212  FACTOR_VAR INT t4 save in reg[49]
   lw $t3 -64($sp)
   sw $t3 -1972($sp)

#------------213  IF reg[48] BGTR reg[49] THEN GOTO label_6
   lw $t0 -1968($sp)
   lw $t1 -1972($sp)
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

#------------218  FACTOR_VAR INT t3 save in reg[50]
   lw $t3 -60($sp)
   sw $t3 -1976($sp)

#------------219  FACTOR_VAR INT t5 save in reg[51]
   lw $t3 -68($sp)
   sw $t3 -1980($sp)

#------------220  IF reg[50] BGEQ reg[51] THEN GOTO label_8
   lw $t0 -1976($sp)
   lw $t1 -1980($sp)
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

#------------225  FACTOR_VAR INT t4 save in reg[52]
   lw $t3 -64($sp)
   sw $t3 -1984($sp)

#------------226  FACTOR_VAR INT t5 save in reg[53]
   lw $t3 -68($sp)
   sw $t3 -1988($sp)

#------------227  IF reg[52] BLSS reg[53] THEN GOTO label_10
   lw $t0 -1984($sp)
   lw $t1 -1988($sp)
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

#------------232  FACTOR_VAR INT t5 save in reg[54]
   lw $t3 -68($sp)
   sw $t3 -1992($sp)

#------------233  FACTOR_VAR INT t3 save in reg[55]
   lw $t3 -60($sp)
   sw $t3 -1996($sp)

#------------234  IF reg[54] BLEQ reg[55] THEN GOTO label_12
   lw $t0 -1992($sp)
   lw $t1 -1996($sp)
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

#------------239  FACTOR_CON INT 12 save in reg[56]
   li $t0 12
   sw $t0 -2000($sp)

#------------240  ASSIGN INT t6 = reg[56]
   lw $t3 -2000($sp)
   sw $t3 -72($sp)

#------------241  FACTOR_CON INT 23 save in reg[57]
   li $t0 23
   sw $t0 -2004($sp)

#------------242  ASSIGN INT t7 = reg[57]
   lw $t3 -2004($sp)
   sw $t3 -76($sp)

#------------243  FACTOR_CON INT 23 save in reg[58]
   li $t0 23
   sw $t0 -2008($sp)

#------------244  FACTOR_CON CHAR 0 save in reg[59]
   li $t0 0
   sw $t0 -2012($sp)

#------------245  reg[59] = reg[59] JIAN reg[58]
   lw $t0 -2012($sp)
   lw $t1 -2008($sp)
   sub $t2 $t0 $t1
   sw $t2 -2012($sp)

#------------246  ASSIGN INT t8 = reg[59]
   lw $t3 -2012($sp)
   sw $t3 -80($sp)

#------------247  FACTOR_VAR INT t8 save in reg[60]
   lw $t3 -80($sp)
   sw $t3 -2016($sp)

#------------248  FACTOR_VAR INT t6 save in reg[61]
   lw $t3 -72($sp)
   sw $t3 -2020($sp)

#------------249  reg[61] = reg[60] JIA reg[61]
   lw $t0 -2016($sp)
   lw $t1 -2020($sp)
   add $t2 $t0 $t1
   sw $t2 -2020($sp)

#------------250  FACTOR_VAR INT t7 save in reg[62]
   lw $t3 -76($sp)
   sw $t3 -2024($sp)

#------------251  reg[62] = reg[61] JIA reg[62]
   lw $t0 -2020($sp)
   lw $t1 -2024($sp)
   add $t2 $t0 $t1
   sw $t2 -2024($sp)

#------------252  FACTOR_CON INT 12 save in reg[63]
   li $t0 12
   sw $t0 -2028($sp)

#------------253  IF reg[62] BEQ reg[63] THEN GOTO label_14
   lw $t0 -2024($sp)
   lw $t1 -2028($sp)
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

#------------258  FACTOR_CON INT 3 save in reg[64]
   li $t0 3
   sw $t0 -2032($sp)

#------------259  FACTOR_CON INT 5 save in reg[65]
   li $t0 5
   sw $t0 -2036($sp)

#------------260  IF reg[64] BLEQ reg[65] THEN GOTO label_16
   lw $t0 -2032($sp)
   lw $t1 -2036($sp)
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

#------------265  FACTOR_CON INT 9 save in reg[66]
   li $t0 9
   sw $t0 -2040($sp)

#------------266  ASSIGN INT t9 = reg[66]
   lw $t3 -2040($sp)
   sw $t3 -84($sp)

#------------267  FACTOR_CON CHAR 51 save in reg[67]
   li $t0 51
   sw $t0 -2044($sp)

#------------268  ASSIGN CHAR c3 = reg[67]
   lw $t3 -2044($sp)
   sw $t3 -88($sp)

#------------269  FACTOR_CON CHAR 52 save in reg[68]
   li $t0 52
   sw $t0 -2048($sp)

#------------270  ASSIGN CHAR c4 = reg[68]
   lw $t3 -2048($sp)
   sw $t3 -92($sp)

#------------271  FACTOR_VAR CHAR c4 save in reg[69]
   lw $t3 -92($sp)
   sw $t3 -2052($sp)

#------------272  FACTOR_VAR CHAR c3 save in reg[70]
   lw $t3 -88($sp)
   sw $t3 -2056($sp)

#------------273  reg[70] = reg[69] JIAN reg[70]
   lw $t0 -2052($sp)
   lw $t1 -2056($sp)
   sub $t2 $t0 $t1
   sw $t2 -2056($sp)

#------------274  FACTOR_VAR INT t9 save in reg[71]
   lw $t3 -84($sp)
   sw $t3 -2060($sp)

#------------275  reg[71] = reg[70] JIA reg[71]
   lw $t0 -2056($sp)
   lw $t1 -2060($sp)
   add $t2 $t0 $t1
   sw $t2 -2060($sp)

#------------276  FACTOR_CON INT 10 save in reg[72]
   li $t0 10
   sw $t0 -2064($sp)

#------------277  IF reg[71] BEQ reg[72] THEN GOTO label_18
   lw $t0 -2060($sp)
   lw $t1 -2064($sp)
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

#------------285  FACTOR_VAR INT in_1 save in reg[73]
   lw $t3 0($sp)
   sw $t3 -2068($sp)

#------------286  FACTOR_CON INT 2 save in reg[74]
   li $t0 2
   sw $t0 -2072($sp)

#------------287  IF reg[73] BNE reg[74] THEN GOTO label_59
   lw $t0 -2068($sp)
   lw $t1 -2072($sp)
    bne $t0 $t1 label_59

#------------288  FACTOR_CON INT 0 save in reg[75]
   li $t0 0
   sw $t0 -2076($sp)

#------------289  FACTOR_CON INT 2333 save in reg[76]
   li $t0 2333
   sw $t0 -2080($sp)

#------------290  ASSIGN_ARR INT t_array1[reg[75]] = reg[76]
   lw $t0 -2076($sp)
   lw $t1 -2080($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -168($t0)

#------------291  FACTOR_CON INT 0 save in reg[77]
   li $t0 0
   sw $t0 -2084($sp)

#------------292  FACTOR_CON CHAR 47 save in reg[78]
   li $t0 47
   sw $t0 -2088($sp)

#------------293  ASSIGN_ARR CHAR c_array1[reg[77]] = reg[78]
   lw $t0 -2084($sp)
   lw $t1 -2088($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -568($t0)

#------------294  FACTOR_CON INT 7 save in reg[79]
   li $t0 7
   sw $t0 -2092($sp)

#------------295  FACTOR_CON CHAR 0 save in reg[80]
   li $t0 0
   sw $t0 -2096($sp)

#------------296  reg[80] = reg[80] JIAN reg[79]
   lw $t0 -2096($sp)
   lw $t1 -2092($sp)
   sub $t2 $t0 $t1
   sw $t2 -2096($sp)

#------------297  FACTOR_CON INT 9 save in reg[81]
   li $t0 9
   sw $t0 -2100($sp)

#------------298  reg[81] = reg[80] JIA reg[81]
   lw $t0 -2096($sp)
   lw $t1 -2100($sp)
   add $t2 $t0 $t1
   sw $t2 -2100($sp)

#------------299  FACTOR_EXPR reg[81] save in reg[82]
   lw $t0 -2100($sp)
   sw $t0 -2104($sp)

#------------300  ASSIGN INT t10 = reg[82]
   lw $t3 -2104($sp)
   sw $t3 -96($sp)

#------------301  FACTOR_CON CHAR 43 save in reg[83]
   li $t0 43
   sw $t0 -2108($sp)

#------------302  ASSIGN CHAR c5 = reg[83]
   lw $t3 -2108($sp)
   sw $t3 -152($sp)

#------------303  FACTOR_VAR CHAR c5 save in reg[84]
   lw $t3 -152($sp)
   sw $t3 -2112($sp)

#------------304  ASSIGN CHAR c6 = reg[84]
   lw $t3 -2112($sp)
   sw $t3 -156($sp)

#------------305  FACTOR_CON INT 0 save in reg[85]
   li $t0 0
   sw $t0 -2116($sp)

#------------306  FACTOR_ARRAY CHAR c_array1 [reg[85]] save in reg[86]
   lw $t3 -2116($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -568($t3)
   sw $t3 -2120($sp)

#------------307  ASSIGN CHAR c7 = reg[86]
   lw $t3 -2120($sp)
   sw $t3 -160($sp)

#------------308  FACTOR_CON INT 7 save in reg[87]
   li $t0 7
   sw $t0 -2124($sp)

#------------309  FACTOR_CON CHAR 0 save in reg[88]
   li $t0 0
   sw $t0 -2128($sp)

#------------310  reg[88] = reg[88] JIAN reg[87]
   lw $t0 -2128($sp)
   lw $t1 -2124($sp)
   sub $t2 $t0 $t1
   sw $t2 -2128($sp)

#------------311  ASSIGN INT t11 = reg[88]
   lw $t3 -2128($sp)
   sw $t3 -100($sp)

#------------312  FACTOR_VAR INT t11 save in reg[89]
   lw $t3 -100($sp)
   sw $t3 -2132($sp)

#------------313  ASSIGN INT t12 = reg[89]
   lw $t3 -2132($sp)
   sw $t3 -104($sp)

#------------314  FACTOR_CON INT 0 save in reg[90]
   li $t0 0
   sw $t0 -2136($sp)

#------------315  FACTOR_ARRAY INT t_array1 [reg[90]] save in reg[91]
   lw $t3 -2136($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -168($t3)
   sw $t3 -2140($sp)

#------------316  ASSIGN INT t13 = reg[91]
   lw $t3 -2140($sp)
   sw $t3 -108($sp)

#------------317  CALL INT ff2(0)
   sw $ra -2144($sp)
   addi $sp $sp -2148
   jal .func_ff2
   subi $sp $sp -2148
   lw $ra -2144($sp)

#------------318  FACTOR_FUNC INT ff2 save in reg[92]
   sw $v0 -2144($sp)

#------------319  ASSIGN INT t14 = reg[92]
   lw $t3 -2144($sp)
   sw $t3 -112($sp)

#------------320  FACTOR_CON CHAR 121 save in reg[93]
   li $t0 121
   sw $t0 -2148($sp)

#------------321  PUSH INT parareg[1] from reg[93]
   sw $ra -2152($sp)
   lw $t0 -2148($sp)
   sw $t0 -2156($sp)

#------------322  CALL CHAR ff1(1)
   addi $sp $sp -2156
   jal .func_ff1
   subi $sp $sp -2156
   lw $ra -2152($sp)

#------------323  FACTOR_FUNC CHAR ff1 save in reg[94]
   sw $v0 -2152($sp)

#------------324  ASSIGN CHAR c8 = reg[94]
   lw $t3 -2152($sp)
   sw $t3 -164($sp)

#------------325  FACTOR_VAR INT t10 save in reg[95]
   lw $t3 -96($sp)
   sw $t3 -2156($sp)

#------------326  FACTOR_VAR CHAR c5 save in reg[96]
   lw $t3 -152($sp)
   sw $t3 -2160($sp)

#------------327  reg[96] = reg[95] JIA reg[96]
   lw $t0 -2156($sp)
   lw $t1 -2160($sp)
   add $t2 $t0 $t1
   sw $t2 -2160($sp)

#------------328  FACTOR_VAR CHAR c6 save in reg[97]
   lw $t3 -156($sp)
   sw $t3 -2164($sp)

#------------329  reg[97] = reg[96] JIA reg[97]
   lw $t0 -2160($sp)
   lw $t1 -2164($sp)
   add $t2 $t0 $t1
   sw $t2 -2164($sp)

#------------330  FACTOR_VAR CHAR c7 save in reg[98]
   lw $t3 -160($sp)
   sw $t3 -2168($sp)

#------------331  reg[98] = reg[97] JIA reg[98]
   lw $t0 -2164($sp)
   lw $t1 -2168($sp)
   add $t2 $t0 $t1
   sw $t2 -2168($sp)

#------------332  FACTOR_VAR INT t11 save in reg[99]
   lw $t3 -100($sp)
   sw $t3 -2172($sp)

#------------333  reg[99] = reg[98] JIA reg[99]
   lw $t0 -2168($sp)
   lw $t1 -2172($sp)
   add $t2 $t0 $t1
   sw $t2 -2172($sp)

#------------334  FACTOR_VAR INT t12 save in reg[100]
   lw $t3 -104($sp)
   sw $t3 -2176($sp)

#------------335  reg[100] = reg[99] JIA reg[100]
   lw $t0 -2172($sp)
   lw $t1 -2176($sp)
   add $t2 $t0 $t1
   sw $t2 -2176($sp)

#------------336  FACTOR_VAR INT t13 save in reg[101]
   lw $t3 -108($sp)
   sw $t3 -2180($sp)

#------------337  reg[101] = reg[100] JIA reg[101]
   lw $t0 -2176($sp)
   lw $t1 -2180($sp)
   add $t2 $t0 $t1
   sw $t2 -2180($sp)

#------------338  FACTOR_VAR INT t14 save in reg[102]
   lw $t3 -112($sp)
   sw $t3 -2184($sp)

#------------339  reg[102] = reg[101] JIA reg[102]
   lw $t0 -2180($sp)
   lw $t1 -2184($sp)
   add $t2 $t0 $t1
   sw $t2 -2184($sp)

#------------340  FACTOR_VAR CHAR c8 save in reg[103]
   lw $t3 -164($sp)
   sw $t3 -2188($sp)

#------------341  reg[103] = reg[102] JIA reg[103]
   lw $t0 -2184($sp)
   lw $t1 -2188($sp)
   add $t2 $t0 $t1
   sw $t2 -2188($sp)

#------------342  ASSIGN INT t14 = reg[103]
   lw $t3 -2188($sp)
   sw $t3 -112($sp)

#------------343  FACTOR_VAR INT t11 save in reg[104]
   lw $t3 -100($sp)
   sw $t3 -2192($sp)

#------------344  FACTOR_CON INT -7 save in reg[105]
   li $t0 -7
   sw $t0 -2196($sp)

#------------345  reg[105] = reg[104] CHENG reg[105]
   lw $t0 -2192($sp)
   lw $t1 -2196($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2196($sp)

#------------346  FACTOR_VAR INT t13 save in reg[106]
   lw $t3 -108($sp)
   sw $t3 -2200($sp)

#------------347  reg[106] = reg[105] CHENG reg[106]
   lw $t0 -2196($sp)
   lw $t1 -2200($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2200($sp)

#------------348  FACTOR_VAR CHAR c8 save in reg[107]
   lw $t3 -164($sp)
   sw $t3 -2204($sp)

#------------349  reg[107] = reg[106] CHU reg[107]
   lw $t0 -2200($sp)
   lw $t1 -2204($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2204($sp)

#------------350  FACTOR_VAR INT t10 save in reg[108]
   lw $t3 -96($sp)
   sw $t3 -2208($sp)

#------------351  reg[108] = reg[107] CHU reg[108]
   lw $t0 -2204($sp)
   lw $t1 -2208($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2208($sp)

#------------352  FACTOR_VAR INT t12 save in reg[109]
   lw $t3 -104($sp)
   sw $t3 -2212($sp)

#------------353  reg[109] = reg[108] CHENG reg[109]
   lw $t0 -2208($sp)
   lw $t1 -2212($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2212($sp)

#------------354  WRITE INT reg[109]
   li $v0 1
   lw $a0 -2212($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------355  WRITE  
   li $v0 4
   la $a0 .str_13
   syscall

#------------356  FACTOR_CON INT 4 save in reg[110]
   li $t0 4
   sw $t0 -2216($sp)

#------------357  FACTOR_VAR INT t14 save in reg[111]
   lw $t3 -112($sp)
   sw $t3 -2220($sp)

#------------358  reg[111] = reg[110] JIA reg[111]
   lw $t0 -2216($sp)
   lw $t1 -2220($sp)
   add $t2 $t0 $t1
   sw $t2 -2220($sp)

#------------359  WRITE INT reg[111]
   li $v0 1
   lw $a0 -2220($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------360  WRITE  
   li $v0 4
   la $a0 .str_13
   syscall

#------------361  FACTOR_CON INT 3 save in reg[112]
   li $t0 3
   sw $t0 -2224($sp)

#------------362  FACTOR_CON INT -2 save in reg[113]
   li $t0 -2
   sw $t0 -2228($sp)

#------------363  reg[113] = reg[112] CHU reg[113]
   lw $t0 -2224($sp)
   lw $t1 -2228($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2228($sp)

#------------364  FACTOR_CON CHAR 0 save in reg[114]
   li $t0 0
   sw $t0 -2232($sp)

#------------365  reg[114] = reg[114] JIAN reg[113]
   lw $t0 -2232($sp)
   lw $t1 -2228($sp)
   sub $t2 $t0 $t1
   sw $t2 -2232($sp)

#------------366  WRITE INT reg[114]
   li $v0 1
   lw $a0 -2232($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------367  FACTOR_CON INT 4 save in reg[115]
   li $t0 4
   sw $t0 -2236($sp)

#------------368  FACTOR_CON INT 5 save in reg[116]
   li $t0 5
   sw $t0 -2240($sp)

#------------369  reg[116] = reg[115] CHU reg[116]
   lw $t0 -2236($sp)
   lw $t1 -2240($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2240($sp)

#------------370  IF reg[116] BEQ reg[0] THEN GOTO label_22
   lw $t0 -2240($sp)
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

#------------374  FACTOR_CON INT 1 save in reg[117]
   li $t0 1
   sw $t0 -2244($sp)

#------------375  ASSIGN INT t15 = reg[117]
   lw $t3 -2244($sp)
   sw $t3 -116($sp)

#------------376  label_23    ----------------Label----------------
label_23:

#------------377  FACTOR_CON INT 3 save in reg[118]
   li $t0 3
   sw $t0 -2248($sp)

#------------378  FACTOR_CON INT 4 save in reg[119]
   li $t0 4
   sw $t0 -2252($sp)

#------------379  IF reg[118] BGEQ reg[119] THEN GOTO label_32
   lw $t0 -2248($sp)
   lw $t1 -2252($sp)
    bge $t0 $t1 label_32

#------------380  FACTOR_CON INT 4 save in reg[120]
   li $t0 4
   sw $t0 -2256($sp)

#------------381  FACTOR_CON INT 4 save in reg[121]
   li $t0 4
   sw $t0 -2260($sp)

#------------382  IF reg[120] BGEQ reg[121] THEN GOTO label_24
   lw $t0 -2256($sp)
   lw $t1 -2260($sp)
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

#------------386  FACTOR_CON INT 4 save in reg[122]
   li $t0 4
   sw $t0 -2264($sp)

#------------387  FACTOR_CON INT 4 save in reg[123]
   li $t0 4
   sw $t0 -2268($sp)

#------------388  IF reg[122] BLSS reg[123] THEN GOTO label_29
   lw $t0 -2264($sp)
   lw $t1 -2268($sp)
    blt $t0 $t1 label_29

#------------389  FACTOR_VAR INT t15 save in reg[124]
   lw $t3 -116($sp)
   sw $t3 -2272($sp)

#------------390  FACTOR_CON INT 0 save in reg[125]
   li $t0 0
   sw $t0 -2276($sp)

#------------391  IF reg[124] BLEQ reg[125] THEN GOTO label_27
   lw $t0 -2272($sp)
   lw $t1 -2276($sp)
    ble $t0 $t1 label_27

#------------392  FACTOR_VAR INT t15 save in reg[126]
   lw $t3 -116($sp)
   sw $t3 -2280($sp)

#------------393  FACTOR_CON INT 0 save in reg[127]
   li $t0 0
   sw $t0 -2284($sp)

#------------394  IF reg[126] BGEQ reg[127] THEN GOTO label_25
   lw $t0 -2280($sp)
   lw $t1 -2284($sp)
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

#------------411  FACTOR_CON INT 1 save in reg[128]
   li $t0 1
   sw $t0 -2288($sp)

#------------412  ASSIGN INT t16 = reg[128]
   lw $t3 -2288($sp)
   sw $t3 -120($sp)

#------------413  FACTOR_CON INT 0 save in reg[129]
   li $t0 0
   sw $t0 -2292($sp)

#------------414  ASSIGN INT t18 = reg[129]
   lw $t3 -2292($sp)
   sw $t3 -128($sp)

#------------415  label_34    ----------------Label----------------
label_34:

#------------416  FACTOR_VAR INT t16 save in reg[130]
   lw $t3 -120($sp)
   sw $t3 -2296($sp)

#------------417  FACTOR_CON INT 4 save in reg[131]
   li $t0 4
   sw $t0 -2300($sp)

#------------418  IF reg[130] BGTR reg[131] THEN GOTO label_37
   lw $t0 -2296($sp)
   lw $t1 -2300($sp)
    bgt $t0 $t1 label_37

#------------419  FACTOR_CON INT 1 save in reg[132]
   li $t0 1
   sw $t0 -2304($sp)

#------------420  ASSIGN INT t17 = reg[132]
   lw $t3 -2304($sp)
   sw $t3 -124($sp)

#------------421  label_35    ----------------Label----------------
label_35:

#------------422  FACTOR_VAR INT t17 save in reg[133]
   lw $t3 -124($sp)
   sw $t3 -2308($sp)

#------------423  FACTOR_VAR INT t16 save in reg[134]
   lw $t3 -120($sp)
   sw $t3 -2312($sp)

#------------424  IF reg[133] BGEQ reg[134] THEN GOTO label_36
   lw $t0 -2308($sp)
   lw $t1 -2312($sp)
    bge $t0 $t1 label_36

#------------425  FACTOR_VAR INT t18 save in reg[135]
   lw $t3 -128($sp)
   sw $t3 -2316($sp)

#------------426  FACTOR_VAR INT t17 save in reg[136]
   lw $t3 -124($sp)
   sw $t3 -2320($sp)

#------------427  reg[136] = reg[135] JIA reg[136]
   lw $t0 -2316($sp)
   lw $t1 -2320($sp)
   add $t2 $t0 $t1
   sw $t2 -2320($sp)

#------------428  ASSIGN INT t18 = reg[136]
   lw $t3 -2320($sp)
   sw $t3 -128($sp)

#------------429  FACTOR_VAR INT t17 save in reg[137]
   lw $t3 -124($sp)
   sw $t3 -2324($sp)

#------------430  FACTOR_CON INT 1 save in reg[138]
   li $t0 1
   sw $t0 -2328($sp)

#------------431  reg[138] = reg[137] JIA reg[138]
   lw $t0 -2324($sp)
   lw $t1 -2328($sp)
   add $t2 $t0 $t1
   sw $t2 -2328($sp)

#------------432  ASSIGN INT t17 = reg[138]
   lw $t3 -2328($sp)
   sw $t3 -124($sp)

#------------433  JUMP to label_35
   j label_35

#------------434  label_36    ----------------Label----------------
label_36:

#------------435  FACTOR_VAR INT t16 save in reg[139]
   lw $t3 -120($sp)
   sw $t3 -2332($sp)

#------------436  FACTOR_CON INT 1 save in reg[140]
   li $t0 1
   sw $t0 -2336($sp)

#------------437  reg[140] = reg[139] JIA reg[140]
   lw $t0 -2332($sp)
   lw $t1 -2336($sp)
   add $t2 $t0 $t1
   sw $t2 -2336($sp)

#------------438  ASSIGN INT t16 = reg[140]
   lw $t3 -2336($sp)
   sw $t3 -120($sp)

#------------439  JUMP to label_34
   j label_34

#------------440  label_37    ----------------Label----------------
label_37:

#------------441  FACTOR_CON INT 0 save in reg[141]
   li $t0 0
   sw $t0 -2340($sp)

#------------442  ASSIGN INT t19 = reg[141]
   lw $t3 -2340($sp)
   sw $t3 -132($sp)

#------------443  FACTOR_CON INT 2 save in reg[142]
   li $t0 2
   sw $t0 -2344($sp)

#------------444  ASSIGN INT t20 = reg[142]
   lw $t3 -2344($sp)
   sw $t3 -136($sp)

#------------445  JUMP to label_39
   j label_39

#------------446  label_38    ----------------Label----------------
label_38:

#------------447  FACTOR_VAR INT t20 save in reg[143]
   lw $t3 -136($sp)
   sw $t3 -2348($sp)

#------------448  FACTOR_CON INT 1 save in reg[144]
   li $t0 1
   sw $t0 -2352($sp)

#------------449  reg[144] = reg[143] JIA reg[144]
   lw $t0 -2348($sp)
   lw $t1 -2352($sp)
   add $t2 $t0 $t1
   sw $t2 -2352($sp)

#------------450  ASSIGN INT t20 = reg[144]
   lw $t3 -2352($sp)
   sw $t3 -136($sp)

#------------451  FACTOR_VAR INT t20 save in reg[145]
   lw $t3 -136($sp)
   sw $t3 -2356($sp)

#------------452  FACTOR_CON INT 5 save in reg[146]
   li $t0 5
   sw $t0 -2360($sp)

#------------453  IF reg[145] BGTR reg[146] THEN GOTO label_43
   lw $t0 -2356($sp)
   lw $t1 -2360($sp)
    bgt $t0 $t1 label_43

#------------454  label_39    ----------------Label----------------
label_39:

#------------455  FACTOR_CON INT 1 save in reg[147]
   li $t0 1
   sw $t0 -2364($sp)

#------------456  ASSIGN INT t22 = reg[147]
   lw $t3 -2364($sp)
   sw $t3 -144($sp)

#------------457  FACTOR_CON INT 2 save in reg[148]
   li $t0 2
   sw $t0 -2368($sp)

#------------458  ASSIGN INT t21 = reg[148]
   lw $t3 -2368($sp)
   sw $t3 -140($sp)

#------------459  JUMP to label_41
   j label_41

#------------460  label_40    ----------------Label----------------
label_40:

#------------461  FACTOR_VAR INT t21 save in reg[149]
   lw $t3 -140($sp)
   sw $t3 -2372($sp)

#------------462  FACTOR_CON INT 2 save in reg[150]
   li $t0 2
   sw $t0 -2376($sp)

#------------463  reg[150] = reg[149] JIA reg[150]
   lw $t0 -2372($sp)
   lw $t1 -2376($sp)
   add $t2 $t0 $t1
   sw $t2 -2376($sp)

#------------464  ASSIGN INT t21 = reg[150]
   lw $t3 -2376($sp)
   sw $t3 -140($sp)

#------------465  FACTOR_VAR INT t21 save in reg[151]
   lw $t3 -140($sp)
   sw $t3 -2380($sp)

#------------466  FACTOR_VAR INT t20 save in reg[152]
   lw $t3 -136($sp)
   sw $t3 -2384($sp)

#------------467  IF reg[151] BGEQ reg[152] THEN GOTO label_42
   lw $t0 -2380($sp)
   lw $t1 -2384($sp)
    bge $t0 $t1 label_42

#------------468  label_41    ----------------Label----------------
label_41:

#------------469  FACTOR_VAR INT t22 save in reg[153]
   lw $t3 -144($sp)
   sw $t3 -2388($sp)

#------------470  FACTOR_VAR INT t21 save in reg[154]
   lw $t3 -140($sp)
   sw $t3 -2392($sp)

#------------471  reg[154] = reg[153] CHENG reg[154]
   lw $t0 -2388($sp)
   lw $t1 -2392($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2392($sp)

#------------472  ASSIGN INT t22 = reg[154]
   lw $t3 -2392($sp)
   sw $t3 -144($sp)

#------------473  JUMP to label_40
   j label_40

#------------474  label_42    ----------------Label----------------
label_42:

#------------475  FACTOR_VAR INT t19 save in reg[155]
   lw $t3 -132($sp)
   sw $t3 -2396($sp)

#------------476  FACTOR_VAR INT t22 save in reg[156]
   lw $t3 -144($sp)
   sw $t3 -2400($sp)

#------------477  reg[156] = reg[155] JIA reg[156]
   lw $t0 -2396($sp)
   lw $t1 -2400($sp)
   add $t2 $t0 $t1
   sw $t2 -2400($sp)

#------------478  ASSIGN INT t19 = reg[156]
   lw $t3 -2400($sp)
   sw $t3 -132($sp)

#------------479  JUMP to label_38
   j label_38

#------------480  label_43    ----------------Label----------------
label_43:

#------------481  FACTOR_CON INT 100 save in reg[157]
   li $t0 100
   sw $t0 -2404($sp)

#------------482  ASSIGN INT t20 = reg[157]
   lw $t3 -2404($sp)
   sw $t3 -136($sp)

#------------483  JUMP to label_45
   j label_45

#------------484  label_44    ----------------Label----------------
label_44:

#------------485  FACTOR_VAR INT t20 save in reg[158]
   lw $t3 -136($sp)
   sw $t3 -2408($sp)

#------------486  FACTOR_CON INT 1 save in reg[159]
   li $t0 1
   sw $t0 -2412($sp)

#------------487  reg[159] = reg[158] JIAN reg[159]
   lw $t0 -2408($sp)
   lw $t1 -2412($sp)
   sub $t2 $t0 $t1
   sw $t2 -2412($sp)

#------------488  ASSIGN INT t20 = reg[159]
   lw $t3 -2412($sp)
   sw $t3 -136($sp)

#------------489  FACTOR_VAR INT t20 save in reg[160]
   lw $t3 -136($sp)
   sw $t3 -2416($sp)

#------------490  FACTOR_CON INT 97 save in reg[161]
   li $t0 97
   sw $t0 -2420($sp)

#------------491  IF reg[160] BLSS reg[161] THEN GOTO label_49
   lw $t0 -2416($sp)
   lw $t1 -2420($sp)
    blt $t0 $t1 label_49

#------------492  label_45    ----------------Label----------------
label_45:

#------------493  FACTOR_CON INT 1 save in reg[162]
   li $t0 1
   sw $t0 -2424($sp)

#------------494  ASSIGN INT t22 = reg[162]
   lw $t3 -2424($sp)
   sw $t3 -144($sp)

#------------495  FACTOR_CON INT 100 save in reg[163]
   li $t0 100
   sw $t0 -2428($sp)

#------------496  ASSIGN INT t21 = reg[163]
   lw $t3 -2428($sp)
   sw $t3 -140($sp)

#------------497  JUMP to label_47
   j label_47

#------------498  label_46    ----------------Label----------------
label_46:

#------------499  FACTOR_VAR INT t21 save in reg[164]
   lw $t3 -140($sp)
   sw $t3 -2432($sp)

#------------500  FACTOR_CON INT 2 save in reg[165]
   li $t0 2
   sw $t0 -2436($sp)

#------------501  reg[165] = reg[164] JIAN reg[165]
   lw $t0 -2432($sp)
   lw $t1 -2436($sp)
   sub $t2 $t0 $t1
   sw $t2 -2436($sp)

#------------502  ASSIGN INT t21 = reg[165]
   lw $t3 -2436($sp)
   sw $t3 -140($sp)

#------------503  FACTOR_VAR INT t21 save in reg[166]
   lw $t3 -140($sp)
   sw $t3 -2440($sp)

#------------504  FACTOR_VAR INT t20 save in reg[167]
   lw $t3 -136($sp)
   sw $t3 -2444($sp)

#------------505  IF reg[166] BLEQ reg[167] THEN GOTO label_48
   lw $t0 -2440($sp)
   lw $t1 -2444($sp)
    ble $t0 $t1 label_48

#------------506  label_47    ----------------Label----------------
label_47:

#------------507  FACTOR_VAR INT t22 save in reg[168]
   lw $t3 -144($sp)
   sw $t3 -2448($sp)

#------------508  FACTOR_VAR INT t21 save in reg[169]
   lw $t3 -140($sp)
   sw $t3 -2452($sp)

#------------509  reg[169] = reg[168] CHENG reg[169]
   lw $t0 -2448($sp)
   lw $t1 -2452($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2452($sp)

#------------510  ASSIGN INT t22 = reg[169]
   lw $t3 -2452($sp)
   sw $t3 -144($sp)

#------------511  JUMP to label_46
   j label_46

#------------512  label_48    ----------------Label----------------
label_48:

#------------513  FACTOR_VAR INT t19 save in reg[170]
   lw $t3 -132($sp)
   sw $t3 -2456($sp)

#------------514  FACTOR_VAR INT t22 save in reg[171]
   lw $t3 -144($sp)
   sw $t3 -2460($sp)

#------------515  reg[171] = reg[170] JIA reg[171]
   lw $t0 -2456($sp)
   lw $t1 -2460($sp)
   add $t2 $t0 $t1
   sw $t2 -2460($sp)

#------------516  ASSIGN INT t19 = reg[171]
   lw $t3 -2460($sp)
   sw $t3 -132($sp)

#------------517  JUMP to label_44
   j label_44

#------------518  label_49    ----------------Label----------------
label_49:

#------------519  FACTOR_CON INT 1 save in reg[172]
   li $t0 1
   sw $t0 -2464($sp)

#------------520  FACTOR_CON INT 0 save in reg[173]
   li $t0 0
   sw $t0 -2468($sp)

#------------521  FACTOR_CON CHAR 0 save in reg[174]
   li $t0 0
   sw $t0 -2472($sp)

#------------522  reg[174] = reg[174] JIAN reg[173]
   lw $t0 -2472($sp)
   lw $t1 -2468($sp)
   sub $t2 $t0 $t1
   sw $t2 -2472($sp)

#------------523  IF reg[172] BLEQ reg[174] THEN GOTO label_50
   lw $t0 -2464($sp)
   lw $t1 -2472($sp)
    ble $t0 $t1 label_50

#------------524  WRITE  ojbk
   li $v0 4
   la $a0 .str_17
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------525  JUMP to label_51
   j label_51

#------------526  label_50    ----------------Label----------------
label_50:

#------------527  label_51    ----------------Label----------------
label_51:

#------------528  label_52    ----------------Label----------------
label_52:

#------------529  FACTOR_CON INT 1 save in reg[175]
   li $t0 1
   sw $t0 -2476($sp)

#------------530  IF reg[175] BEQ reg[0] THEN GOTO label_58
   lw $t0 -2476($sp)
    beq $t0 $0 label_58

#------------531  FACTOR_CON INT 0 save in reg[176]
   li $t0 0
   sw $t0 -2480($sp)

#------------532  ASSIGN INT t23 = reg[176]
   lw $t3 -2480($sp)
   sw $t3 -148($sp)

#------------533  JUMP to label_54
   j label_54

#------------534  label_53    ----------------Label----------------
label_53:

#------------535  FACTOR_VAR INT t23 save in reg[177]
   lw $t3 -148($sp)
   sw $t3 -2484($sp)

#------------536  FACTOR_CON INT 1 save in reg[178]
   li $t0 1
   sw $t0 -2488($sp)

#------------537  reg[178] = reg[177] JIA reg[178]
   lw $t0 -2484($sp)
   lw $t1 -2488($sp)
   add $t2 $t0 $t1
   sw $t2 -2488($sp)

#------------538  ASSIGN INT t23 = reg[178]
   lw $t3 -2488($sp)
   sw $t3 -148($sp)

#------------539  FACTOR_VAR INT t23 save in reg[179]
   lw $t3 -148($sp)
   sw $t3 -2492($sp)

#------------540  FACTOR_CON INT 100 save in reg[180]
   li $t0 100
   sw $t0 -2496($sp)

#------------541  IF reg[179] BGEQ reg[180] THEN GOTO label_57
   lw $t0 -2492($sp)
   lw $t1 -2496($sp)
    bge $t0 $t1 label_57

#------------542  label_54    ----------------Label----------------
label_54:

#------------543  FACTOR_VAR INT t23 save in reg[181]
   lw $t3 -148($sp)
   sw $t3 -2500($sp)

#------------544  FACTOR_CON INT 2 save in reg[182]
   li $t0 2
   sw $t0 -2504($sp)

#------------545  reg[182] = reg[181] JIA reg[182]
   lw $t0 -2500($sp)
   lw $t1 -2504($sp)
   add $t2 $t0 $t1
   sw $t2 -2504($sp)

#------------546  ASSIGN INT t23 = reg[182]
   lw $t3 -2504($sp)
   sw $t3 -148($sp)

#------------547  FACTOR_VAR INT t23 save in reg[183]
   lw $t3 -148($sp)
   sw $t3 -2508($sp)

#------------548  FACTOR_CON INT 60 save in reg[184]
   li $t0 60
   sw $t0 -2512($sp)

#------------549  IF reg[183] BLEQ reg[184] THEN GOTO label_55
   lw $t0 -2508($sp)
   lw $t1 -2512($sp)
    ble $t0 $t1 label_55

#------------550  WRITE  
   li $v0 4
   la $a0 .str_13
   syscall

#------------551  FACTOR_VAR INT t18 save in reg[185]
   lw $t3 -128($sp)
   sw $t3 -2516($sp)

#------------552  FACTOR_VAR INT t19 save in reg[186]
   lw $t3 -132($sp)
   sw $t3 -2520($sp)

#------------553  reg[186] = reg[185] JIA reg[186]
   lw $t0 -2516($sp)
   lw $t1 -2520($sp)
   add $t2 $t0 $t1
   sw $t2 -2520($sp)

#------------554  FACTOR_VAR INT t23 save in reg[187]
   lw $t3 -148($sp)
   sw $t3 -2524($sp)

#------------555  reg[187] = reg[186] JIA reg[187]
   lw $t0 -2520($sp)
   lw $t1 -2524($sp)
   add $t2 $t0 $t1
   sw $t2 -2524($sp)

#------------556  WRITE INT reg[187]
   li $v0 1
   lw $a0 -2524($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------557  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -1776($sp)
   jr $ra

#------------558  JUMP to label_56
   j label_56

#------------559  label_55    ----------------Label----------------
label_55:

#------------560  label_56    ----------------Label----------------
label_56:

#------------561  JUMP to label_53
   j label_53

#------------562  label_57    ----------------Label----------------
label_57:

#------------563  JUMP to label_52
   j label_52

#------------564  label_58    ----------------Label----------------
label_58:

#------------565  WRITE error14
   li $v0 4
   la $a0 .str_19
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------566  JUMP to label_60
   j label_60

#------------567  label_59    ----------------Label----------------
label_59:

#------------568  label_60    ----------------Label----------------
label_60:

#------------569  FACTOR_VAR INT in_1 save in reg[188]
   lw $t3 0($sp)
   sw $t3 -2528($sp)

#------------570  FACTOR_CON INT 3 save in reg[189]
   li $t0 3
   sw $t0 -2532($sp)

#------------571  IF reg[188] BNE reg[189] THEN GOTO label_64
   lw $t0 -2528($sp)
   lw $t1 -2532($sp)
    bne $t0 $t1 label_64

#------------572  FACTOR_CON INT 1 save in reg[190]
   li $t0 1
   sw $t0 -2536($sp)

#------------573  PUSH INT parareg[2] from reg[190]
   sw $ra -2540($sp)
   lw $t0 -2536($sp)
   sw $t0 -2544($sp)

#------------574  CALL INT factorial(1)
   addi $sp $sp -2544
   jal .func_factorial
   subi $sp $sp -2544
   lw $ra -2540($sp)

#------------575  FACTOR_FUNC INT factorial save in reg[191]
   sw $v0 -2540($sp)

#------------576  FACTOR_CON INT 2 save in reg[192]
   li $t0 2
   sw $t0 -2544($sp)

#------------577  PUSH INT parareg[3] from reg[192]
   sw $ra -2548($sp)
   lw $t0 -2544($sp)
   sw $t0 -2552($sp)

#------------578  CALL INT factorial(1)
   addi $sp $sp -2552
   jal .func_factorial
   subi $sp $sp -2552
   lw $ra -2548($sp)

#------------579  FACTOR_FUNC INT factorial save in reg[193]
   sw $v0 -2548($sp)

#------------580  reg[193] = reg[191] JIA reg[193]
   lw $t0 -2540($sp)
   lw $t1 -2548($sp)
   add $t2 $t0 $t1
   sw $t2 -2548($sp)

#------------581  FACTOR_CON INT 5 save in reg[194]
   li $t0 5
   sw $t0 -2552($sp)

#------------582  PUSH INT parareg[4] from reg[194]
   sw $ra -2556($sp)
   lw $t0 -2552($sp)
   sw $t0 -2560($sp)

#------------583  CALL INT factorial(1)
   addi $sp $sp -2560
   jal .func_factorial
   subi $sp $sp -2560
   lw $ra -2556($sp)

#------------584  FACTOR_FUNC INT factorial save in reg[195]
   sw $v0 -2556($sp)

#------------585  reg[195] = reg[193] JIA reg[195]
   lw $t0 -2548($sp)
   lw $t1 -2556($sp)
   add $t2 $t0 $t1
   sw $t2 -2556($sp)

#------------586  WRITE INT reg[195]
   li $v0 1
   lw $a0 -2556($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------587  FACTOR_CON CHAR 97 save in reg[196]
   li $t0 97
   sw $t0 -2560($sp)

#------------588  ASSIGN_EXTERN CHAR _c1 = reg[196]
   lw $t3 -2560($sp)
   sw $t3 .var__c1

#------------589  FACTOR_CON CHAR 43 save in reg[197]
   li $t0 43
   sw $t0 -2564($sp)

#------------590  PUSH INT parareg[5] from reg[197]
   sw $ra -2568($sp)
   lw $t0 -2564($sp)
   sw $t0 -2572($sp)

#------------591  CALL CHAR ff1(1)
   addi $sp $sp -2572
   jal .func_ff1
   subi $sp $sp -2572
   lw $ra -2568($sp)

#------------592  FACTOR_VAR_EXTERN CHAR _c1 save in reg[198]
   lw $t3 .var__c1
   sw $t3 -2568($sp)

#------------593  WRITE CHAR reg[198]
   li $v0 11
   lw $a0 -2568($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------594  FACTOR_CON CHAR 98 save in reg[199]
   li $t0 98
   sw $t0 -2572($sp)

#------------595  ASSIGN_EXTERN CHAR _c2 = reg[199]
   lw $t3 -2572($sp)
   sw $t3 .var__c2

#------------596  CALL INT ff2(0)
   sw $ra -2576($sp)
   addi $sp $sp -2580
   jal .func_ff2
   subi $sp $sp -2580
   lw $ra -2576($sp)

#------------597  FACTOR_VAR_EXTERN CHAR _c2 save in reg[200]
   lw $t3 .var__c2
   sw $t3 -2576($sp)

#------------598  WRITE CHAR reg[200]
   li $v0 11
   lw $a0 -2576($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------599  FACTOR_CON INT 1 save in reg[201]
   li $t0 1
   sw $t0 -2580($sp)

#------------600  FACTOR_CON INT 2 save in reg[202]
   li $t0 2
   sw $t0 -2584($sp)

#------------601  FACTOR_CON CHAR 97 save in reg[203]
   li $t0 97
   sw $t0 -2588($sp)

#------------602  FACTOR_CON INT 3 save in reg[204]
   li $t0 3
   sw $t0 -2592($sp)

#------------603  FACTOR_CON CHAR 98 save in reg[205]
   li $t0 98
   sw $t0 -2596($sp)

#------------604  FACTOR_CON CHAR 99 save in reg[206]
   li $t0 99
   sw $t0 -2600($sp)

#------------605  PUSH INT parareg[6] from reg[201]
   sw $ra -2604($sp)
   lw $t0 -2580($sp)
   sw $t0 -2608($sp)

#------------606  PUSH INT parareg[7] from reg[202]
   lw $t0 -2584($sp)
   sw $t0 -2612($sp)

#------------607  PUSH INT parareg[8] from reg[203]
   lw $t0 -2588($sp)
   sw $t0 -2616($sp)

#------------608  PUSH INT parareg[9] from reg[204]
   lw $t0 -2592($sp)
   sw $t0 -2620($sp)

#------------609  PUSH INT parareg[10] from reg[205]
   lw $t0 -2596($sp)
   sw $t0 -2624($sp)

#------------610  PUSH INT parareg[11] from reg[206]
   lw $t0 -2600($sp)
   sw $t0 -2628($sp)

#------------611  CALL VOID ff3(6)
   addi $sp $sp -2608
   jal .func_ff3
   subi $sp $sp -2608
   lw $ra -2604($sp)

#------------612  CALL VOID ff4(0)
   sw $ra -2604($sp)
   addi $sp $sp -2608
   jal .func_ff4
   subi $sp $sp -2608
   lw $ra -2604($sp)

#------------613  FACTOR_CON CHAR 42 save in reg[207]
   li $t0 42
   sw $t0 -2604($sp)

#------------614  ASSIGN_EXTERN CHAR _c1 = reg[207]
   lw $t3 -2604($sp)
   sw $t3 .var__c1

#------------615  CALL VOID ff5(0)
   sw $ra -2608($sp)
   addi $sp $sp -2612
   jal .func_ff5
   subi $sp $sp -2612
   lw $ra -2608($sp)

#------------616  FACTOR_CON INT 6666 save in reg[208]
   li $t0 6666
   sw $t0 -2608($sp)

#------------617  ASSIGN INT _c4 = reg[208]
   lw $t3 -2608($sp)
   sw $t3 -968($sp)

#------------618  FACTOR_CON CHAR 56 save in reg[209]
   li $t0 56
   sw $t0 -2612($sp)

#------------619  ASSIGN CHAR _t1 = reg[209]
   lw $t3 -2612($sp)
   sw $t3 -976($sp)

#------------620  FACTOR_VAR INT _c4 save in reg[210]
   lw $t3 -968($sp)
   sw $t3 -2616($sp)

#------------621  FACTOR_VAR CHAR _t1 save in reg[211]
   lw $t3 -976($sp)
   sw $t3 -2620($sp)

#------------622  reg[211] = reg[210] JIA reg[211]
   lw $t0 -2616($sp)
   lw $t1 -2620($sp)
   add $t2 $t0 $t1
   sw $t2 -2620($sp)

#------------623  WRITE INT reg[211]
   li $v0 1
   lw $a0 -2620($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------624  FACTOR_CON INT 50 save in reg[212]
   li $t0 50
   sw $t0 -2624($sp)

#------------625  FACTOR_CON CHAR 104 save in reg[213]
   li $t0 104
   sw $t0 -2628($sp)

#------------626  ASSIGN_ARR CHAR c_array2[reg[212]] = reg[213]
   lw $t0 -2624($sp)
   lw $t1 -2628($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -1380($t0)

#------------627  FACTOR_CON INT 50 save in reg[214]
   li $t0 50
   sw $t0 -2632($sp)

#------------628  FACTOR_ARRAY CHAR c_array2 [reg[214]] save in reg[215]
   lw $t3 -2632($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -1380($t3)
   sw $t3 -2636($sp)

#------------629  WRITE CHAR reg[215]
   li $v0 11
   lw $a0 -2636($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------630  FACTOR_CON CHAR 103 save in reg[216]
   li $t0 103
   sw $t0 -2640($sp)

#------------631  PUSH INT parareg[12] from reg[216]
   sw $ra -2644($sp)
   lw $t0 -2640($sp)
   sw $t0 -2648($sp)

#------------632  CALL CHAR ff1(1)
   addi $sp $sp -2648
   jal .func_ff1
   subi $sp $sp -2648
   lw $ra -2644($sp)

#------------633  FACTOR_FUNC CHAR ff1 save in reg[217]
   sw $v0 -2644($sp)

#------------634  WRITE CHAR reg[217]
   li $v0 11
   lw $a0 -2644($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------635  FACTOR_CON CHAR 114 save in reg[218]
   li $t0 114
   sw $t0 -2648($sp)

#------------636  FACTOR_EXPR reg[218] save in reg[219]
   lw $t0 -2648($sp)
   sw $t0 -2652($sp)

#------------637  WRITE INT reg[219]
   li $v0 1
   lw $a0 -2652($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------638  FACTOR_CON INT 0 save in reg[220]
   li $t0 0
   sw $t0 -2656($sp)

#------------639  ASSIGN INT i = reg[220]
   lw $t3 -2656($sp)
   sw $t3 -972($sp)

#------------640  JUMP to label_62
   j label_62

#------------641  label_61    ----------------Label----------------
label_61:

#------------642  FACTOR_VAR INT i save in reg[221]
   lw $t3 -972($sp)
   sw $t3 -2660($sp)

#------------643  FACTOR_CON INT 1 save in reg[222]
   li $t0 1
   sw $t0 -2664($sp)

#------------644  reg[222] = reg[221] JIA reg[222]
   lw $t0 -2660($sp)
   lw $t1 -2664($sp)
   add $t2 $t0 $t1
   sw $t2 -2664($sp)

#------------645  ASSIGN INT i = reg[222]
   lw $t3 -2664($sp)
   sw $t3 -972($sp)

#------------646  FACTOR_VAR INT i save in reg[223]
   lw $t3 -972($sp)
   sw $t3 -2668($sp)

#------------647  FACTOR_CON INT 100 save in reg[224]
   li $t0 100
   sw $t0 -2672($sp)

#------------648  IF reg[223] BGEQ reg[224] THEN GOTO label_63
   lw $t0 -2668($sp)
   lw $t1 -2672($sp)
    bge $t0 $t1 label_63

#------------649  label_62    ----------------Label----------------
label_62:

#------------650  FACTOR_VAR INT i save in reg[225]
   lw $t3 -972($sp)
   sw $t3 -2676($sp)

#------------651  FACTOR_VAR INT i save in reg[226]
   lw $t3 -972($sp)
   sw $t3 -2680($sp)

#------------652  ASSIGN_ARR INT t_array2[reg[225]] = reg[226]
   lw $t0 -2676($sp)
   lw $t1 -2680($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -980($t0)

#------------653  JUMP to label_61
   j label_61

#------------654  label_63    ----------------Label----------------
label_63:

#------------655  FACTOR_CON INT 34 save in reg[227]
   li $t0 34
   sw $t0 -2684($sp)

#------------656  FACTOR_CON INT 4 save in reg[228]
   li $t0 4
   sw $t0 -2688($sp)

#------------657  reg[228] = reg[227] CHU reg[228]
   lw $t0 -2684($sp)
   lw $t1 -2688($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2688($sp)

#------------658  FACTOR_CON INT 6 save in reg[229]
   li $t0 6
   sw $t0 -2692($sp)

#------------659  reg[229] = reg[228] CHENG reg[229]
   lw $t0 -2688($sp)
   lw $t1 -2692($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2692($sp)

#------------660  FACTOR_CON CHAR 122 save in reg[230]
   li $t0 122
   sw $t0 -2696($sp)

#------------661  FACTOR_CON INT 10 save in reg[231]
   li $t0 10
   sw $t0 -2700($sp)

#------------662  reg[231] = reg[230] CHU reg[231]
   lw $t0 -2696($sp)
   lw $t1 -2700($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2700($sp)

#------------663  reg[231] = reg[229] JIA reg[231]
   lw $t0 -2692($sp)
   lw $t1 -2700($sp)
   add $t2 $t0 $t1
   sw $t2 -2700($sp)

#------------664  FACTOR_ARRAY INT t_array2 [reg[231]] save in reg[232]
   lw $t3 -2700($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2704($sp)

#------------665  FACTOR_CON INT 23 save in reg[233]
   li $t0 23
   sw $t0 -2708($sp)

#------------666  reg[233] = reg[232] CHU reg[233]
   lw $t0 -2704($sp)
   lw $t1 -2708($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2708($sp)

#------------667  FACTOR_CON INT 22 save in reg[234]
   li $t0 22
   sw $t0 -2712($sp)

#------------668  FACTOR_VAR INT i save in reg[235]
   lw $t3 -972($sp)
   sw $t3 -2716($sp)

#------------669  reg[235] = reg[234] CHENG reg[235]
   lw $t0 -2712($sp)
   lw $t1 -2716($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2716($sp)

#------------670  FACTOR_CON INT 23 save in reg[236]
   li $t0 23
   sw $t0 -2720($sp)

#------------671  reg[236] = reg[235] CHU reg[236]
   lw $t0 -2716($sp)
   lw $t1 -2720($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2720($sp)

#------------672  FACTOR_CON INT 1 save in reg[237]
   li $t0 1
   sw $t0 -2724($sp)

#------------673  FACTOR_ARRAY INT t_array2 [reg[237]] save in reg[238]
   lw $t3 -2724($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2728($sp)

#------------674  FACTOR_CON INT 1000 save in reg[239]
   li $t0 1000
   sw $t0 -2732($sp)

#------------675  reg[239] = reg[238] CHENG reg[239]
   lw $t0 -2728($sp)
   lw $t1 -2732($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2732($sp)

#------------676  FACTOR_EXPR reg[239] save in reg[240]
   lw $t0 -2732($sp)
   sw $t0 -2736($sp)

#------------677  reg[240] = reg[236] CHENG reg[240]
   lw $t0 -2720($sp)
   lw $t1 -2736($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2736($sp)

#------------678  FACTOR_CON INT 1000 save in reg[241]
   li $t0 1000
   sw $t0 -2740($sp)

#------------679  reg[241] = reg[240] CHU reg[241]
   lw $t0 -2736($sp)
   lw $t1 -2740($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2740($sp)

#------------680  FACTOR_CON CHAR 57 save in reg[242]
   li $t0 57
   sw $t0 -2744($sp)

#------------681  FACTOR_CON INT 17 save in reg[243]
   li $t0 17
   sw $t0 -2748($sp)

#------------682  reg[243] = reg[242] CHU reg[243]
   lw $t0 -2744($sp)
   lw $t1 -2748($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2748($sp)

#------------683  reg[243] = reg[241] JIA reg[243]
   lw $t0 -2740($sp)
   lw $t1 -2748($sp)
   add $t2 $t0 $t1
   sw $t2 -2748($sp)

#------------684  FACTOR_ARRAY INT t_array2 [reg[243]] save in reg[244]
   lw $t3 -2748($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2752($sp)

#------------685  FACTOR_CON INT 30 save in reg[245]
   li $t0 30
   sw $t0 -2756($sp)

#------------686  reg[245] = reg[244] CHU reg[245]
   lw $t0 -2752($sp)
   lw $t1 -2756($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2756($sp)

#------------687  reg[245] = reg[233] JIA reg[245]
   lw $t0 -2708($sp)
   lw $t1 -2756($sp)
   add $t2 $t0 $t1
   sw $t2 -2756($sp)

#------------688  FACTOR_ARRAY INT t_array2 [reg[245]] save in reg[246]
   lw $t3 -2756($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2760($sp)

#------------689  ASSIGN INT i = reg[246]
   lw $t3 -2760($sp)
   sw $t3 -972($sp)

#------------690  FACTOR_CON INT 34 save in reg[247]
   li $t0 34
   sw $t0 -2764($sp)

#------------691  FACTOR_CON INT 4 save in reg[248]
   li $t0 4
   sw $t0 -2768($sp)

#------------692  reg[248] = reg[247] CHU reg[248]
   lw $t0 -2764($sp)
   lw $t1 -2768($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2768($sp)

#------------693  FACTOR_CON INT 6 save in reg[249]
   li $t0 6
   sw $t0 -2772($sp)

#------------694  reg[249] = reg[248] CHENG reg[249]
   lw $t0 -2768($sp)
   lw $t1 -2772($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2772($sp)

#------------695  FACTOR_CON CHAR 122 save in reg[250]
   li $t0 122
   sw $t0 -2776($sp)

#------------696  FACTOR_CON INT 10 save in reg[251]
   li $t0 10
   sw $t0 -2780($sp)

#------------697  reg[251] = reg[250] CHU reg[251]
   lw $t0 -2776($sp)
   lw $t1 -2780($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2780($sp)

#------------698  reg[251] = reg[249] JIA reg[251]
   lw $t0 -2772($sp)
   lw $t1 -2780($sp)
   add $t2 $t0 $t1
   sw $t2 -2780($sp)

#------------699  FACTOR_ARRAY INT t_array2 [reg[251]] save in reg[252]
   lw $t3 -2780($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2784($sp)

#------------700  FACTOR_CON INT 23 save in reg[253]
   li $t0 23
   sw $t0 -2788($sp)

#------------701  reg[253] = reg[252] CHU reg[253]
   lw $t0 -2784($sp)
   lw $t1 -2788($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2788($sp)

#------------702  FACTOR_CON INT 22 save in reg[254]
   li $t0 22
   sw $t0 -2792($sp)

#------------703  FACTOR_VAR INT i save in reg[255]
   lw $t3 -972($sp)
   sw $t3 -2796($sp)

#------------704  reg[255] = reg[254] CHENG reg[255]
   lw $t0 -2792($sp)
   lw $t1 -2796($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2796($sp)

#------------705  FACTOR_CON INT 23 save in reg[256]
   li $t0 23
   sw $t0 -2800($sp)

#------------706  reg[256] = reg[255] CHU reg[256]
   lw $t0 -2796($sp)
   lw $t1 -2800($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2800($sp)

#------------707  FACTOR_CON INT 1 save in reg[257]
   li $t0 1
   sw $t0 -2804($sp)

#------------708  FACTOR_ARRAY INT t_array2 [reg[257]] save in reg[258]
   lw $t3 -2804($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2808($sp)

#------------709  FACTOR_CON INT 1000 save in reg[259]
   li $t0 1000
   sw $t0 -2812($sp)

#------------710  reg[259] = reg[258] CHENG reg[259]
   lw $t0 -2808($sp)
   lw $t1 -2812($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2812($sp)

#------------711  FACTOR_EXPR reg[259] save in reg[260]
   lw $t0 -2812($sp)
   sw $t0 -2816($sp)

#------------712  reg[260] = reg[256] CHENG reg[260]
   lw $t0 -2800($sp)
   lw $t1 -2816($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -2816($sp)

#------------713  FACTOR_CON INT 1000 save in reg[261]
   li $t0 1000
   sw $t0 -2820($sp)

#------------714  reg[261] = reg[260] CHU reg[261]
   lw $t0 -2816($sp)
   lw $t1 -2820($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2820($sp)

#------------715  FACTOR_CON CHAR 57 save in reg[262]
   li $t0 57
   sw $t0 -2824($sp)

#------------716  FACTOR_CON INT 17 save in reg[263]
   li $t0 17
   sw $t0 -2828($sp)

#------------717  reg[263] = reg[262] CHU reg[263]
   lw $t0 -2824($sp)
   lw $t1 -2828($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2828($sp)

#------------718  reg[263] = reg[261] JIA reg[263]
   lw $t0 -2820($sp)
   lw $t1 -2828($sp)
   add $t2 $t0 $t1
   sw $t2 -2828($sp)

#------------719  FACTOR_ARRAY INT t_array2 [reg[263]] save in reg[264]
   lw $t3 -2828($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2832($sp)

#------------720  FACTOR_CON INT 30 save in reg[265]
   li $t0 30
   sw $t0 -2836($sp)

#------------721  reg[265] = reg[264] CHU reg[265]
   lw $t0 -2832($sp)
   lw $t1 -2836($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -2836($sp)

#------------722  reg[265] = reg[253] JIA reg[265]
   lw $t0 -2788($sp)
   lw $t1 -2836($sp)
   add $t2 $t0 $t1
   sw $t2 -2836($sp)

#------------723  FACTOR_ARRAY INT t_array2 [reg[265]] save in reg[266]
   lw $t3 -2836($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -980($t3)
   sw $t3 -2840($sp)

#------------724  PUSH INT parareg[13] from reg[266]
   sw $ra -2844($sp)
   lw $t0 -2840($sp)
   sw $t0 -2848($sp)

#------------725  CALL INT factorial(1)
   addi $sp $sp -2848
   jal .func_factorial
   subi $sp $sp -2848
   lw $ra -2844($sp)

#------------726  FACTOR_FUNC INT factorial save in reg[267]
   sw $v0 -2844($sp)

#------------727  WRITE INT reg[267]
   li $v0 1
   lw $a0 -2844($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------728  JUMP to label_65
   j label_65

#------------729  label_64    ----------------Label----------------
label_64:

#------------730  label_65    ----------------Label----------------
label_65:

#------------731  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -1776($sp)
   jr $ra

   jr $ra

end:
