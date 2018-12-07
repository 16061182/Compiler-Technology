.data
   var_g1: .word 0
   var_g2: .space 28
   var_g3: .word 0
   var_g4: .space 2800
   var_iftest: .word 0
   str_0: .asciiz "hhh!####"
   str_1: .asciiz "####"
   str_2: .asciiz " "
   str_3: .asciiz "geq_h  "
   str_4: .asciiz "grt_f  "
   str_5: .asciiz "leq_a  "
   str_6: .asciiz "lss_c "
   str_7: .asciiz "eq_d "
   str_8: .asciiz "neq_e  "
   str_9: .asciiz "is e!!"
   str_10: .asciiz "string test!"
   str_11: .asciiz " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQ"
   str_12: .asciiz "RSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
   str_13: .asciiz "gcd = "
.text
   jal main
   j end
#------------74  FUNC INT gcd(2)
gcd:

#------------75  PARA INT a

#------------76  PARA INT b

#------------77  FACTOR_VAR INT b save in reg[1]
   lw $t3 -4($sp)
   sw $t3 -8($sp)

#------------78  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -12($sp)

#------------79  IF reg[1] BNE reg[2] THEN GOTO label_2
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    bne $t0 $t1 label_2

#------------80  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------81  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -20($sp)

#------------82  IF reg[3] BEQ reg[4] THEN GOTO label_0
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    beq $t0 $t1 label_0

#------------83  FACTOR_VAR INT a save in reg[5]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------84  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------85  JUMP to label_1
   j label_1

#------------86  label_0    ----------------Label----------------
label_0:

#------------87  FACTOR_CON INT 188 save in reg[6]
   li $t0 188
   sw $t0 -28($sp)

#------------88  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -32($sp)

#------------89  reg[7] = reg[7] JIAN reg[6]
   lw $t0 -32($sp)
   lw $t1 -28($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------90  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -32($sp)
   jr $ra

#------------91  label_1    ----------------Label----------------
label_1:

#------------92  JUMP to label_3
   j label_3

#------------93  label_2    ----------------Label----------------
label_2:

#------------94  label_3    ----------------Label----------------
label_3:

#------------95  FACTOR_VAR INT b save in reg[8]
   lw $t3 -4($sp)
   sw $t3 -36($sp)

#------------96  FACTOR_VAR INT a save in reg[9]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------97  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------98  FACTOR_VAR INT b save in reg[11]
   lw $t3 -4($sp)
   sw $t3 -48($sp)

#------------99  reg[11] = reg[10] CHU reg[11]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -48($sp)

#------------100  FACTOR_VAR INT b save in reg[12]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------101  reg[12] = reg[11] CHENG reg[12]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -52($sp)

#------------102  FACTOR_EXPR reg[12] save in reg[13]
   lw $t0 -52($sp)
   sw $t0 -56($sp)

#------------103  reg[13] = reg[9] JIAN reg[13]
   lw $t0 -40($sp)
   lw $t1 -56($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------104  PUSH INT parareg[0] from reg[8]
   sw $ra -60($sp)
   lw $t0 -36($sp)
   sw $t0 -64($sp)

#------------105  PUSH INT parareg[1] from reg[13]
   lw $t0 -56($sp)
   sw $t0 -68($sp)

#------------106  CALL INT gcd(2)
   addi $sp $sp -64
   jal gcd
   subi $sp $sp -64
   lw $ra -60($sp)

#------------107  FACTOR_FUNC INT gcd save in reg[13]
   sw $v0 -56($sp)

#------------108  RETURN reg[13] TO $V0 AND THEN GOTO 0
   lw $v0 -56($sp)
   jr $ra

#------------109  FUNC CHAR f2(0)
   jr $ra

f2:

#------------110  FACTOR_CON CHAR 99 save in reg[1]
   li $t0 99
   sw $t0 0($sp)

#------------111  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------112  FUNC VOID p1(2)
   jr $ra

p1:

#------------113  PARA INT ps1

#------------114  PARA CHAR ps2

#------------115  CONST INT q1 = 100

#------------116  VAR INT i

#------------117  VAR CHAR q2

#------------118  label_4    ----------------Label----------------
label_4:

#------------119  FACTOR_CON INT 100 save in reg[1]
   li $t0 100
   sw $t0 -16($sp)

#------------120  FACTOR_VAR INT ps1 save in reg[2]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------121  IF reg[1] BLSS reg[2] THEN GOTO label_5
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    blt $t0 $t1 label_5

#------------122  FACTOR_VAR INT ps1 save in reg[3]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------123  FACTOR_CON INT 4 save in reg[4]
   li $t0 4
   sw $t0 -28($sp)

#------------124  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -32($sp)

#------------125  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -36($sp)

#------------126  reg[6] = reg[5] JIA reg[6]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   add $t2 $t0 $t1
   sw $t2 -36($sp)

#------------127  FACTOR_EXPR reg[6] save in reg[7]
   lw $t0 -36($sp)
   sw $t0 -40($sp)

#------------128  reg[7] = reg[4] CHU reg[7]
   lw $t0 -28($sp)
   lw $t1 -40($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -40($sp)

#------------129  FACTOR_EXPR reg[7] save in reg[8]
   lw $t0 -40($sp)
   sw $t0 -44($sp)

#------------130  FACTOR_CON INT 2 save in reg[9]
   li $t0 2
   sw $t0 -48($sp)

#------------131  reg[9] = reg[8] CHENG reg[9]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -48($sp)

#------------132  reg[9] = reg[3] JIAN reg[9]
   lw $t0 -24($sp)
   lw $t1 -48($sp)
   sub $t2 $t0 $t1
   sw $t2 -48($sp)

#------------133  FACTOR_CON INT 5 save in reg[10]
   li $t0 5
   sw $t0 -52($sp)

#------------134  reg[10] = reg[9] JIA reg[10]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------135  ASSIGN INT ps1 = reg[10]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------136  JUMP to label_4
   j label_4

#------------137  label_5    ----------------Label----------------
label_5:

#------------138  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -56($sp)

#------------139  ASSIGN INT i = reg[11]
   lw $t3 -56($sp)
   sw $t3 -8($sp)

#------------140  JUMP to label_7
   j label_7

#------------141  label_6    ----------------Label----------------
label_6:

#------------142  FACTOR_VAR INT i save in reg[12]
   lw $t3 -8($sp)
   sw $t3 -60($sp)

#------------143  FACTOR_CON INT 2 save in reg[13]
   li $t0 2
   sw $t0 -64($sp)

#------------144  reg[13] = reg[12] JIA reg[13]
   lw $t0 -60($sp)
   lw $t1 -64($sp)
   add $t2 $t0 $t1
   sw $t2 -64($sp)

#------------145  ASSIGN INT i = reg[13]
   lw $t3 -64($sp)
   sw $t3 -8($sp)

#------------146  FACTOR_VAR INT i save in reg[14]
   lw $t3 -8($sp)
   sw $t3 -68($sp)

#------------147  FACTOR_CON INT 100 save in reg[15]
   li $t0 100
   sw $t0 -72($sp)

#------------148  IF reg[14] BGEQ reg[15] THEN GOTO label_8
   lw $t0 -68($sp)
   lw $t1 -72($sp)
    bge $t0 $t1 label_8

#------------149  label_7    ----------------Label----------------
label_7:

#------------150  FACTOR_VAR INT ps1 save in reg[16]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------151  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -80($sp)

#------------152  reg[17] = reg[16] JIA reg[17]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   add $t2 $t0 $t1
   sw $t2 -80($sp)

#------------153  ASSIGN INT ps1 = reg[17]
   lw $t3 -80($sp)
   sw $t3 0($sp)

#------------154  JUMP to label_6
   j label_6

#------------155  label_8    ----------------Label----------------
label_8:

#------------156  WRITE hhh!####
   li $v0 4
   la $a0 str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------157  FACTOR_VAR INT ps1 save in reg[18]
   lw $t3 0($sp)
   sw $t3 -84($sp)

#------------158  FACTOR_CON INT 10 save in reg[19]
   li $t0 10
   sw $t0 -88($sp)

#------------159  reg[19] = reg[18] CHU reg[19]
   lw $t0 -84($sp)
   lw $t1 -88($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -88($sp)

#------------160  WRITE INT reg[19]
   li $v0 1
   lw $a0 -88($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------161  WRITE ####
   li $v0 4
   la $a0 str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------162  FUNC VOID p2(0)
   jr $ra

p2:

#------------163  VAR INT a

#------------164  VAR INT b

#------------165  VAR INT c

#------------166  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------167  READ INT b
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------168  READ INT c
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------169  FACTOR_VAR INT c save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------170  WRITE INT reg[1]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------171  WRITE  
   li $v0 4
   la $a0 str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------172  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -16($sp)

#------------173  WRITE INT reg[2]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------174  WRITE  
   li $v0 4
   la $a0 str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------175  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------176  WRITE INT reg[3]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------177  WRITE ####
   li $v0 4
   la $a0 str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------178  FUNC VOID iftestt(1)
   jr $ra

iftestt:

#------------179  PARA CHAR test

#------------180  FACTOR_VAR CHAR test save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------181  FACTOR_CON CHAR 104 save in reg[2]
   li $t0 104
   sw $t0 -8($sp)

#------------182  IF reg[1] BLSS reg[2] THEN GOTO label_9
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    blt $t0 $t1 label_9

#------------183  WRITE geq_h  
   li $v0 4
   la $a0 str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------184  JUMP to label_20
   j label_20

#------------185  label_9    ----------------Label----------------
label_9:

#------------186  FACTOR_VAR CHAR test save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------187  FACTOR_CON CHAR 102 save in reg[4]
   li $t0 102
   sw $t0 -16($sp)

#------------188  IF reg[3] BLEQ reg[4] THEN GOTO label_10
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    ble $t0 $t1 label_10

#------------189  WRITE grt_f  
   li $v0 4
   la $a0 str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------190  JUMP to label_19
   j label_19

#------------191  label_10    ----------------Label----------------
label_10:

#------------192  FACTOR_VAR CHAR test save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------193  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -24($sp)

#------------194  IF reg[5] BGTR reg[6] THEN GOTO label_11
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bgt $t0 $t1 label_11

#------------195  WRITE leq_a  
   li $v0 4
   la $a0 str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------196  JUMP to label_18
   j label_18

#------------197  label_11    ----------------Label----------------
label_11:

#------------198  FACTOR_VAR CHAR test save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------199  FACTOR_CON CHAR 99 save in reg[8]
   li $t0 99
   sw $t0 -32($sp)

#------------200  IF reg[7] BGEQ reg[8] THEN GOTO label_12
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    bge $t0 $t1 label_12

#------------201  WRITE lss_c 
   li $v0 4
   la $a0 str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------202  JUMP to label_17
   j label_17

#------------203  label_12    ----------------Label----------------
label_12:

#------------204  FACTOR_VAR CHAR test save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------205  FACTOR_CON CHAR 100 save in reg[10]
   li $t0 100
   sw $t0 -40($sp)

#------------206  IF reg[9] BNE reg[10] THEN GOTO label_13
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    bne $t0 $t1 label_13

#------------207  WRITE eq_d 
   li $v0 4
   la $a0 str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------208  JUMP to label_16
   j label_16

#------------209  label_13    ----------------Label----------------
label_13:

#------------210  FACTOR_VAR CHAR test save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------211  FACTOR_CON CHAR 101 save in reg[12]
   li $t0 101
   sw $t0 -48($sp)

#------------212  IF reg[11] BEQ reg[12] THEN GOTO label_14
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    beq $t0 $t1 label_14

#------------213  WRITE neq_e  
   li $v0 4
   la $a0 str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------214  JUMP to label_15
   j label_15

#------------215  label_14    ----------------Label----------------
label_14:

#------------216  WRITE is e!!
   li $v0 4
   la $a0 str_9
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------217  label_15    ----------------Label----------------
label_15:

#------------218  label_16    ----------------Label----------------
label_16:

#------------219  label_17    ----------------Label----------------
label_17:

#------------220  label_18    ----------------Label----------------
label_18:

#------------221  label_19    ----------------Label----------------
label_19:

#------------222  label_20    ----------------Label----------------
label_20:

#------------223  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------224  FUNC VOID main(0)
   jr $ra

main:

#------------225  VAR CHAR q

#------------226  VAR INT w

#------------227  VAR INT e

#------------228  VAR INT r

#------------229  VAR INT nothing

#------------230  WRITE string test!
   li $v0 4
   la $a0 str_10
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------231  WRITE  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQ
   li $v0 4
   la $a0 str_11
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------232  WRITE RSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
   li $v0 4
   la $a0 str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------233  CALL CHAR f2(0)
   sw $ra -20($sp)
   addi $sp $sp -24
   jal f2
   subi $sp $sp -24
   lw $ra -20($sp)

#------------234  FACTOR_FUNC CHAR f2 save in reg[12]
   sw $v0 -64($sp)

#------------235  ASSIGN CHAR q = reg[12]
   lw $t3 -64($sp)
   sw $t3 0($sp)

#------------236  READ INT w
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------237  READ INT e
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------238  READ_EXTERN CHAR iftest
   li $v0 12
   syscall
   sw $v0 var_iftest

#------------239  FACTOR_VAR INT w save in reg[13]
   lw $t3 -4($sp)
   sw $t3 -68($sp)

#------------240  FACTOR_VAR INT e save in reg[14]
   lw $t3 -8($sp)
   sw $t3 -72($sp)

#------------241  PUSH INT parareg[2] from reg[13]
   sw $ra -76($sp)
   lw $t0 -68($sp)
   sw $t0 -80($sp)

#------------242  PUSH INT parareg[3] from reg[14]
   lw $t0 -72($sp)
   sw $t0 -84($sp)

#------------243  CALL INT gcd(2)
   addi $sp $sp -80
   jal gcd
   subi $sp $sp -80
   lw $ra -76($sp)

#------------244  FACTOR_FUNC INT gcd save in reg[14]
   sw $v0 -72($sp)

#------------245  ASSIGN INT r = reg[14]
   lw $t3 -72($sp)
   sw $t3 -12($sp)

#------------246  WRITE gcd = 
   li $v0 4
   la $a0 str_13
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------247  FACTOR_VAR INT r save in reg[15]
   lw $t3 -12($sp)
   sw $t3 -76($sp)

#------------248  WRITE INT reg[15]
   li $v0 1
   lw $a0 -76($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------249  WRITE ####
   li $v0 4
   la $a0 str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------250  FACTOR_VAR_EXTERN CHAR iftest save in reg[16]
   lw $t3 var_iftest
   sw $t3 -80($sp)

#------------251  PUSH INT parareg[4] from reg[16]
   sw $ra -84($sp)
   lw $t0 -80($sp)
   sw $t0 -88($sp)

#------------252  CALL VOID iftestt(1)
   addi $sp $sp -88
   jal iftestt
   subi $sp $sp -88
   lw $ra -84($sp)

#------------253  FACTOR_CON CHAR 95 save in reg[17]
   li $t0 95
   sw $t0 -84($sp)

#------------254  WRITE CHAR reg[17]
   li $v0 11
   lw $a0 -84($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------255  FACTOR_CON CHAR 48 save in reg[18]
   li $t0 48
   sw $t0 -88($sp)

#------------256  WRITE CHAR reg[18]
   li $v0 11
   lw $a0 -88($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------257  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -92($sp)

#------------258  ASSIGN INT nothing = reg[19]
   lw $t3 -92($sp)
   sw $t3 -16($sp)

#------------259  FACTOR_VAR INT nothing save in reg[20]
   lw $t3 -16($sp)
   sw $t3 -96($sp)

#------------260  IF reg[20] BEQ reg[0] THEN GOTO label_21
   lw $t0 -96($sp)
    beq $t0 $0 label_21

#------------261  JUMP to label_22
   j label_22

#------------262  label_21    ----------------Label----------------
label_21:

#------------263  label_22    ----------------Label----------------
label_22:

#------------264  FACTOR_CON INT 4 save in reg[21]
   li $t0 4
   sw $t0 -100($sp)

#------------265  FACTOR_CON INT 123456 save in reg[22]
   li $t0 123456
   sw $t0 -104($sp)

#------------266  ASSIGN_ARR_EXTERN INT g2[reg[21]] = reg[22]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   sll $t0 $t0 2
   sw $t1 var_g2($t0)

#------------267  FACTOR_CON INT 3 save in reg[23]
   li $t0 3
   sw $t0 -108($sp)

#------------268  FACTOR_CON INT 7890 save in reg[24]
   li $t0 7890
   sw $t0 -112($sp)

#------------269  ASSIGN_ARR_EXTERN INT g2[reg[23]] = reg[24]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   sll $t0 $t0 2
   sw $t1 var_g2($t0)

#------------270  FACTOR_CON INT 2 save in reg[25]
   li $t0 2
   sw $t0 -116($sp)

#------------271  FACTOR_CON INT 2 save in reg[26]
   li $t0 2
   sw $t0 -120($sp)

#------------272  reg[26] = reg[25] JIA reg[26]
   lw $t0 -116($sp)
   lw $t1 -120($sp)
   add $t2 $t0 $t1
   sw $t2 -120($sp)

#------------273  FACTOR_ARRAY_EXTERN INT g2 [reg[26]] save in reg[27]
   lw $t3 -120($sp)
   sll $t3 $t3 2
   lw $t3 var_g2($t3)
   sw $t3 -124($sp)

#------------274  FACTOR_CON INT 4 save in reg[28]
   li $t0 4
   sw $t0 -128($sp)

#------------275  FACTOR_CON INT 1 save in reg[29]
   li $t0 1
   sw $t0 -132($sp)

#------------276  reg[29] = reg[28] JIAN reg[29]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   sub $t2 $t0 $t1
   sw $t2 -132($sp)

#------------277  FACTOR_ARRAY_EXTERN INT g2 [reg[29]] save in reg[30]
   lw $t3 -132($sp)
   sll $t3 $t3 2
   lw $t3 var_g2($t3)
   sw $t3 -136($sp)

#------------278  reg[30] = reg[27] JIA reg[30]
   lw $t0 -124($sp)
   lw $t1 -136($sp)
   add $t2 $t0 $t1
   sw $t2 -136($sp)

#------------279  WRITE INT reg[30]
   li $v0 1
   lw $a0 -136($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------280  WRITE ####
   li $v0 4
   la $a0 str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------281  CALL VOID p2(0)
   sw $ra -140($sp)
   addi $sp $sp -144
   jal p2
   subi $sp $sp -144
   lw $ra -140($sp)

#------------282  FACTOR_VAR INT r save in reg[31]
   lw $t3 -12($sp)
   sw $t3 -140($sp)

#------------283  FACTOR_VAR CHAR q save in reg[32]
   lw $t3 0($sp)
   sw $t3 -144($sp)

#------------284  PUSH INT parareg[5] from reg[31]
   sw $ra -148($sp)
   lw $t0 -140($sp)
   sw $t0 -152($sp)

#------------285  PUSH INT parareg[6] from reg[32]
   lw $t0 -144($sp)
   sw $t0 -156($sp)

#------------286  CALL VOID p1(2)
   addi $sp $sp -152
   jal p1
   subi $sp $sp -152
   lw $ra -148($sp)

   jr $ra

end:
