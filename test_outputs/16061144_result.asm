.data
   .var_g1: .word 0
   .var_g2: .space 28
   .var_g3: .word 0
   .var_g4: .space 2800
   .var_iftest: .word 0
   .str_0: .asciiz "hhh!####"
   .str_1: .asciiz "####"
   .str_2: .asciiz " "
   .str_3: .asciiz "geq_h  "
   .str_4: .asciiz "grt_f  "
   .str_5: .asciiz "leq_a  "
   .str_6: .asciiz "lss_c "
   .str_7: .asciiz "eq_d "
   .str_8: .asciiz "neq_e  "
   .str_9: .asciiz "is e!!"
   .str_10: .asciiz "string test!"
   .str_11: .asciiz " !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQ"
   .str_12: .asciiz "RSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
   .str_13: .asciiz "gcd = "
.text
   jal .func_main
   j end
#------------74  FUNC INT gcd(2)
.func_gcd:

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



#------------89  FACTOR_CON INT -188 save in reg[8]
   li $t0 -188
   sw $t0 -36($sp)

#------------90  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------91  label_1    ----------------Label----------------
label_1:

#------------92  JUMP to label_3
   j label_3

#------------93  label_2    ----------------Label----------------
label_2:

#------------94  label_3    ----------------Label----------------
label_3:

#------------95  FACTOR_VAR INT b save in reg[9]
   lw $t3 -4($sp)
   sw $t3 -40($sp)

#------------96  FACTOR_VAR INT a save in reg[10]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------97  FACTOR_VAR INT a save in reg[11]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------98  FACTOR_VAR INT b save in reg[12]
   lw $t3 -4($sp)
   sw $t3 -52($sp)

#------------99  reg[13] = reg[11] CHU reg[12]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -56($sp)

#------------100  FACTOR_VAR INT b save in reg[14]
   lw $t3 -4($sp)
   sw $t3 -60($sp)

#------------101  reg[15] = reg[13] CHENG reg[14]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -64($sp)

#------------102  FACTOR_EXPR reg[15] save in reg[16]
   lw $t0 -64($sp)
   sw $t0 -68($sp)

#------------103  reg[17] = reg[10] JIAN reg[16]
   lw $t0 -44($sp)
   lw $t1 -68($sp)
   subu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------104  PUSH INT parareg[0] from reg[9]
   sw $ra -76($sp)
   lw $t0 -40($sp)
   sw $t0 -80($sp)

#------------105  PUSH INT parareg[1] from reg[17]
   lw $t0 -72($sp)
   sw $t0 -84($sp)

#------------106  CALL INT gcd(2)
   addiu $sp $sp -80
   jal .func_gcd
   subiu $sp $sp -80
   lw $ra -76($sp)

#------------107  FACTOR_FUNC INT gcd save in reg[18]
   sw $v0 -76($sp)

#------------108  RETURN reg[18] TO $V0 AND THEN GOTO 0
   lw $v0 -76($sp)
   jr $ra

#------------109  FUNC CHAR f2(0)
   jr $ra

.func_f2:

#------------110  FACTOR_CON CHAR 99 save in reg[1]
   li $t0 99
   sw $t0 0($sp)

#------------111  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------112  FUNC VOID p1(2)
   jr $ra

.func_p1:

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









#------------131  FACTOR_CON INT 4 save in reg[12]
   li $t0 4
   sw $t0 -60($sp)

#------------132  reg[13] = reg[3] JIAN reg[12]
   lw $t0 -24($sp)
   lw $t1 -60($sp)
   subu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------133  FACTOR_CON INT 5 save in reg[14]
   li $t0 5
   sw $t0 -68($sp)

#------------134  reg[15] = reg[13] JIA reg[14]
   lw $t0 -64($sp)
   lw $t1 -68($sp)
   addu $t2 $t0 $t1
   sw $t2 -72($sp)

#------------135  ASSIGN INT ps1 = reg[15]
   lw $t3 -72($sp)
   sw $t3 0($sp)

#------------136  JUMP to label_4
   j label_4

#------------137  label_5    ----------------Label----------------
label_5:

#------------138  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -76($sp)

#------------139  ASSIGN INT i = reg[16]
   lw $t3 -76($sp)
   sw $t3 -8($sp)

#------------140  label_6    ----------------Label----------------
label_6:

#------------141  FACTOR_VAR INT ps1 save in reg[17]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------142  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -84($sp)

#------------143  reg[19] = reg[17] JIA reg[18]
   lw $t0 -80($sp)
   lw $t1 -84($sp)
   addu $t2 $t0 $t1
   sw $t2 -88($sp)

#------------144  ASSIGN INT ps1 = reg[19]
   lw $t3 -88($sp)
   sw $t3 0($sp)

#------------145  FACTOR_VAR INT i save in reg[20]
   lw $t3 -8($sp)
   sw $t3 -92($sp)

#------------146  FACTOR_CON INT 2 save in reg[21]
   li $t0 2
   sw $t0 -96($sp)

#------------147  reg[22] = reg[20] JIA reg[21]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   addu $t2 $t0 $t1
   sw $t2 -100($sp)

#------------148  ASSIGN INT i = reg[22]
   lw $t3 -100($sp)
   sw $t3 -8($sp)

#------------149  FACTOR_VAR INT i save in reg[23]
   lw $t3 -8($sp)
   sw $t3 -104($sp)

#------------150  FACTOR_CON INT 100 save in reg[24]
   li $t0 100
   sw $t0 -108($sp)

#------------151  IF reg[23] BLSS reg[24] THEN GOTO label_6
   lw $t0 -104($sp)
   lw $t1 -108($sp)
    blt $t0 $t1 label_6

#------------152  WRITE hhh!####
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------153  FACTOR_VAR INT ps1 save in reg[25]
   lw $t3 0($sp)
   sw $t3 -112($sp)

#------------154  FACTOR_CON INT 10 save in reg[26]
   li $t0 10
   sw $t0 -116($sp)

#------------155  reg[27] = reg[25] CHU reg[26]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -120($sp)

#------------156  WRITE INT reg[27]
   li $v0 1
   lw $a0 -120($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------157  WRITE ####
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------158  FUNC VOID p2(0)
   jr $ra

.func_p2:

#------------159  VAR INT a

#------------160  VAR INT b

#------------161  VAR INT c

#------------162  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------163  READ INT b
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------164  READ INT c
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------165  FACTOR_VAR INT c save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------166  WRITE INT reg[1]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------167  WRITE  
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------168  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -16($sp)

#------------169  WRITE INT reg[2]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------170  WRITE  
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------171  FACTOR_VAR INT a save in reg[3]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------172  WRITE INT reg[3]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------173  WRITE ####
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------174  FUNC VOID iftestt(1)
   jr $ra

.func_iftestt:

#------------175  PARA CHAR test

#------------176  FACTOR_VAR CHAR test save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------177  FACTOR_CON CHAR 104 save in reg[2]
   li $t0 104
   sw $t0 -8($sp)

#------------178  IF reg[1] BLSS reg[2] THEN GOTO label_7
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    blt $t0 $t1 label_7

#------------179  WRITE geq_h  
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------180  JUMP to label_18
   j label_18

#------------181  label_7    ----------------Label----------------
label_7:

#------------182  FACTOR_VAR CHAR test save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------183  FACTOR_CON CHAR 102 save in reg[4]
   li $t0 102
   sw $t0 -16($sp)

#------------184  IF reg[3] BLEQ reg[4] THEN GOTO label_8
   lw $t0 -12($sp)
   lw $t1 -16($sp)
    ble $t0 $t1 label_8

#------------185  WRITE grt_f  
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------186  JUMP to label_17
   j label_17

#------------187  label_8    ----------------Label----------------
label_8:

#------------188  FACTOR_VAR CHAR test save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------189  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -24($sp)

#------------190  IF reg[5] BGTR reg[6] THEN GOTO label_9
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bgt $t0 $t1 label_9

#------------191  WRITE leq_a  
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------192  JUMP to label_16
   j label_16

#------------193  label_9    ----------------Label----------------
label_9:

#------------194  FACTOR_VAR CHAR test save in reg[7]
   lw $t3 0($sp)
   sw $t3 -28($sp)

#------------195  FACTOR_CON CHAR 99 save in reg[8]
   li $t0 99
   sw $t0 -32($sp)

#------------196  IF reg[7] BGEQ reg[8] THEN GOTO label_10
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    bge $t0 $t1 label_10

#------------197  WRITE lss_c 
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------198  JUMP to label_15
   j label_15

#------------199  label_10    ----------------Label----------------
label_10:

#------------200  FACTOR_VAR CHAR test save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------201  FACTOR_CON CHAR 100 save in reg[10]
   li $t0 100
   sw $t0 -40($sp)

#------------202  IF reg[9] BNE reg[10] THEN GOTO label_11
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    bne $t0 $t1 label_11

#------------203  WRITE eq_d 
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------204  JUMP to label_14
   j label_14

#------------205  label_11    ----------------Label----------------
label_11:

#------------206  FACTOR_VAR CHAR test save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------207  FACTOR_CON CHAR 101 save in reg[12]
   li $t0 101
   sw $t0 -48($sp)

#------------208  IF reg[11] BEQ reg[12] THEN GOTO label_12
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    beq $t0 $t1 label_12

#------------209  WRITE neq_e  
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------210  JUMP to label_13
   j label_13

#------------211  label_12    ----------------Label----------------
label_12:

#------------212  WRITE is e!!
   li $v0 4
   la $a0 .str_9
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------213  label_13    ----------------Label----------------
label_13:

#------------214  label_14    ----------------Label----------------
label_14:

#------------215  label_15    ----------------Label----------------
label_15:

#------------216  label_16    ----------------Label----------------
label_16:

#------------217  label_17    ----------------Label----------------
label_17:

#------------218  label_18    ----------------Label----------------
label_18:

#------------219  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 0($sp)
   jr $ra

#------------220  FUNC VOID main(0)
   jr $ra

.func_main:

#------------221  VAR CHAR q

#------------222  VAR INT w

#------------223  VAR INT e

#------------224  VAR INT r

#------------225  VAR INT nothing

#------------226  WRITE string test!
   li $v0 4
   la $a0 .str_10
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------227  WRITE  !#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQ
   li $v0 4
   la $a0 .str_11
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------228  WRITE RSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
   li $v0 4
   la $a0 .str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------229  CALL CHAR f2(0)
   sw $ra -20($sp)
   addiu $sp $sp -24
   jal .func_f2
   subiu $sp $sp -24
   lw $ra -20($sp)

#------------230  FACTOR_FUNC CHAR f2 save in reg[13]
   sw $v0 -68($sp)

#------------231  ASSIGN CHAR q = reg[13]
   lw $t3 -68($sp)
   sw $t3 0($sp)

#------------232  READ INT w
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------233  READ INT e
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------234  READ_EXTERN CHAR iftest
   li $v0 12
   syscall
   sw $v0 .var_iftest

#------------235  FACTOR_VAR INT w save in reg[14]
   lw $t3 -4($sp)
   sw $t3 -72($sp)

#------------236  FACTOR_VAR INT e save in reg[15]
   lw $t3 -8($sp)
   sw $t3 -76($sp)

#------------237  PUSH INT parareg[2] from reg[14]
   sw $ra -80($sp)
   lw $t0 -72($sp)
   sw $t0 -84($sp)

#------------238  PUSH INT parareg[3] from reg[15]
   lw $t0 -76($sp)
   sw $t0 -88($sp)

#------------239  CALL INT gcd(2)
   addiu $sp $sp -84
   jal .func_gcd
   subiu $sp $sp -84
   lw $ra -80($sp)

#------------240  FACTOR_FUNC INT gcd save in reg[16]
   sw $v0 -80($sp)

#------------241  ASSIGN INT r = reg[16]
   lw $t3 -80($sp)
   sw $t3 -12($sp)

#------------242  WRITE gcd = 
   li $v0 4
   la $a0 .str_13
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------243  FACTOR_VAR INT r save in reg[17]
   lw $t3 -12($sp)
   sw $t3 -84($sp)

#------------244  WRITE INT reg[17]
   li $v0 1
   lw $a0 -84($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------245  WRITE ####
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------246  FACTOR_VAR_EXTERN CHAR iftest save in reg[18]
   lw $t3 .var_iftest
   sw $t3 -88($sp)

#------------247  PUSH INT parareg[4] from reg[18]
   sw $ra -92($sp)
   lw $t0 -88($sp)
   sw $t0 -96($sp)

#------------248  CALL VOID iftestt(1)
   addiu $sp $sp -96
   jal .func_iftestt
   subiu $sp $sp -96
   lw $ra -92($sp)

#------------249  FACTOR_CON CHAR 95 save in reg[19]
   li $t0 95
   sw $t0 -92($sp)

#------------250  WRITE CHAR reg[19]
   li $v0 11
   lw $a0 -92($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------251  FACTOR_CON CHAR 48 save in reg[20]
   li $t0 48
   sw $t0 -96($sp)

#------------252  WRITE CHAR reg[20]
   li $v0 11
   lw $a0 -96($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------253  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -100($sp)

#------------254  ASSIGN INT nothing = reg[21]
   lw $t3 -100($sp)
   sw $t3 -16($sp)

#------------255  FACTOR_VAR INT nothing save in reg[22]
   lw $t3 -16($sp)
   sw $t3 -104($sp)

#------------256  IF reg[22] BEQ reg[0] THEN GOTO label_19
   lw $t0 -104($sp)
    beq $t0 $0 label_19

#------------257  JUMP to label_20
   j label_20

#------------258  label_19    ----------------Label----------------
label_19:

#------------259  label_20    ----------------Label----------------
label_20:

#------------260  FACTOR_CON INT 4 save in reg[23]
   li $t0 4
   sw $t0 -108($sp)

#------------261  FACTOR_CON INT 123456 save in reg[24]
   li $t0 123456
   sw $t0 -112($sp)

#------------262  ASSIGN_ARR_EXTERN INT g2[reg[23]] = reg[24]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   sll $t0 $t0 2
   sw $t1 .var_g2($t0)

#------------263  FACTOR_CON INT 3 save in reg[25]
   li $t0 3
   sw $t0 -116($sp)

#------------264  FACTOR_CON INT 7890 save in reg[26]
   li $t0 7890
   sw $t0 -120($sp)

#------------265  ASSIGN_ARR_EXTERN INT g2[reg[25]] = reg[26]
   lw $t0 -116($sp)
   lw $t1 -120($sp)
   sll $t0 $t0 2
   sw $t1 .var_g2($t0)



#------------268  FACTOR_CON INT 4 save in reg[29]
   li $t0 4
   sw $t0 -132($sp)

#------------269  FACTOR_ARRAY_EXTERN INT g2 [reg[29]] save in reg[30]
   lw $t3 -132($sp)
   sll $t3 $t3 2
   lw $t3 .var_g2($t3)
   sw $t3 -136($sp)



#------------272  FACTOR_CON INT 3 save in reg[33]
   li $t0 3
   sw $t0 -148($sp)

#------------273  FACTOR_ARRAY_EXTERN INT g2 [reg[33]] save in reg[34]
   lw $t3 -148($sp)
   sll $t3 $t3 2
   lw $t3 .var_g2($t3)
   sw $t3 -152($sp)

#------------274  reg[35] = reg[30] JIA reg[34]
   lw $t0 -136($sp)
   lw $t1 -152($sp)
   addu $t2 $t0 $t1
   sw $t2 -156($sp)

#------------275  WRITE INT reg[35]
   li $v0 1
   lw $a0 -156($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------276  WRITE ####
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------277  CALL VOID p2(0)
   sw $ra -160($sp)
   addiu $sp $sp -164
   jal .func_p2
   subiu $sp $sp -164
   lw $ra -160($sp)

#------------278  FACTOR_VAR INT r save in reg[36]
   lw $t3 -12($sp)
   sw $t3 -160($sp)

#------------279  FACTOR_VAR CHAR q save in reg[37]
   lw $t3 0($sp)
   sw $t3 -164($sp)

#------------280  PUSH INT parareg[5] from reg[36]
   sw $ra -168($sp)
   lw $t0 -160($sp)
   sw $t0 -172($sp)

#------------281  PUSH INT parareg[6] from reg[37]
   lw $t0 -164($sp)
   sw $t0 -176($sp)

#------------282  CALL VOID p1(2)
   addiu $sp $sp -172
   jal .func_p1
   subiu $sp $sp -172
   lw $ra -168($sp)

   jr $ra

end:
