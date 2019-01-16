.data
   .var_x: .word 0
   .var_yy: .word 0
   .var_zz: .word 0
   .var_yyy: .space 28
   .str_0: .asciiz "!@#$%%abcd114514ABCD963287~;: "
   .str_1: .asciiz "1 hit "
   .str_2: .asciiz "2 hit "
   .str_3: .asciiz "3 hit "
   .str_4: .asciiz "4 hit "
   .str_5: .asciiz "5 hit "
   .str_6: .asciiz "6 hit "
.text
   jal .func_main
   j end
#------------10  FUNC INT fact(1)
.func_fact:

#------------11  PARA INT t

#------------12  FACTOR_VAR INT t save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------13  FACTOR_CON INT 3 save in reg[2]
   li $t0 3
   sw $t0 -8($sp)

#------------14  IF reg[1] BGEQ reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_0

#------------15  FACTOR_VAR INT t save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------16  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------17  JUMP to label_1
   j label_1

#------------18  label_0    ----------------Label----------------
label_0:

#------------19  FACTOR_VAR INT t save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------20  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------21  reg[6] = reg[4] JIAN reg[5]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   subu $t2 $t0 $t1
   sw $t2 -24($sp)

#------------22  PUSH INT parareg[0] from reg[6]
   sw $ra -28($sp)
   lw $t0 -24($sp)
   sw $t0 -32($sp)

#------------23  CALL INT fact(1)
   addiu $sp $sp -32
   jal .func_fact
   subiu $sp $sp -32
   lw $ra -28($sp)

#------------24  FACTOR_FUNC INT fact save in reg[7]
   sw $v0 -28($sp)

#------------25  FACTOR_VAR INT t save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------26  reg[9] = reg[7] CHENG reg[8]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------27  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------28  label_1    ----------------Label----------------
label_1:

#------------29  FUNC INT rt15(0)
   jr $ra

.func_rt15:

#------------30  CONST INT zero = 1









#------------39  FACTOR_CON INT 15 save in reg[9]
   li $t0 15
   sw $t0 -32($sp)

#------------40  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -32($sp)
   jr $ra

#------------41  FUNC CHAR fun2(6)
   jr $ra

.func_fun2:

#------------42  PARA INT a

#------------43  PARA INT b

#------------44  PARA INT c

#------------45  PARA INT d

#------------46  PARA INT e

#------------47  PARA INT f

#------------48  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------49  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -28($sp)

#------------50  FACTOR_VAR INT c save in reg[3]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------51  reg[4] = reg[2] CHENG reg[3]
   lw $t0 -28($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------52  FACTOR_VAR INT d save in reg[5]
   lw $t3 -12($sp)
   sw $t3 -40($sp)

#------------53  reg[6] = reg[4] CHENG reg[5]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -44($sp)

#------------54  FACTOR_VAR INT e save in reg[7]
   lw $t3 -16($sp)
   sw $t3 -48($sp)

#------------55  reg[8] = reg[6] CHU reg[7]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -52($sp)

#------------56  reg[9] = reg[1] JIA reg[8]
   lw $t0 -24($sp)
   lw $t1 -52($sp)
   addu $t2 $t0 $t1
   sw $t2 -56($sp)

#------------57  FACTOR_VAR INT f save in reg[10]
   lw $t3 -20($sp)
   sw $t3 -60($sp)

#------------58  reg[11] = reg[9] JIAN reg[10]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   subu $t2 $t0 $t1
   sw $t2 -64($sp)

#------------59  WRITE INT reg[11]
   li $v0 1
   lw $a0 -64($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------60  FACTOR_CON CHAR 65 save in reg[12]
   li $t0 65
   sw $t0 -68($sp)

#------------61  RETURN reg[12] TO $V0 AND THEN GOTO 0
   lw $v0 -68($sp)
   jr $ra

#------------62  FUNC VOID main(0)
   jr $ra

.func_main:

#------------63  CONST INT b = 1

#------------64  CONST INT c = 2

#------------65  CONST INT d = 3

#------------66  CONST INT e = 4

#------------67  ARRAY CHAR ar[2]

#------------68  VAR INT r

#------------69  ARRAY INT m1[8]

#------------70  VAR INT aa

#------------71  VAR INT a

#------------72  FACTOR_CON INT -1 save in reg[13]
   li $t0 -1
   sw $t0 -100($sp)

#------------73  ASSIGN_EXTERN INT x = reg[13]
   lw $t3 -100($sp)
   sw $t3 .var_x



#------------76  FACTOR_CON INT -4 save in reg[16]
   li $t0 -4
   sw $t0 -112($sp)

#------------77  ASSIGN INT r = reg[16]
   lw $t3 -112($sp)
   sw $t3 -8($sp)

#------------78  FACTOR_CON INT 6 save in reg[17]
   li $t0 6
   sw $t0 -116($sp)

#------------79  ASSIGN INT aa = reg[17]
   lw $t3 -116($sp)
   sw $t3 -44($sp)

#------------80  FACTOR_VAR INT aa save in reg[18]
   lw $t3 -44($sp)
   sw $t3 -120($sp)

#------------81  PUSH INT parareg[1] from reg[18]
   sw $ra -124($sp)
   lw $t0 -120($sp)
   sw $t0 -128($sp)

#------------82  CALL INT fact(1)
   addiu $sp $sp -128
   jal .func_fact
   subiu $sp $sp -128
   lw $ra -124($sp)

#------------83  FACTOR_FUNC INT fact save in reg[19]
   sw $v0 -124($sp)

#------------84  WRITE !@#$%%abcd114514ABCD963287~;: 
   li $v0 4
   la $a0 .str_0
   syscall

#------------85  WRITE INT reg[19]
   li $v0 1
   lw $a0 -124($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall












#------------97  FACTOR_CON INT 0 save in reg[31]
   li $t0 0
   sw $t0 -172($sp)

#------------98  FACTOR_VAR_EXTERN INT x save in reg[32]
   lw $t3 .var_x
   sw $t3 -176($sp)

#------------99  FACTOR_VAR INT r save in reg[33]
   lw $t3 -8($sp)
   sw $t3 -180($sp)

#------------100  reg[34] = reg[32] JIAN reg[33]
   lw $t0 -176($sp)
   lw $t1 -180($sp)
   subu $t2 $t0 $t1
   sw $t2 -184($sp)

#------------101  FACTOR_VAR INT aa save in reg[35]
   lw $t3 -44($sp)
   sw $t3 -188($sp)

#------------102  FACTOR_CON INT 1 save in reg[36]
   li $t0 1
   sw $t0 -192($sp)

#------------103  FACTOR_CON INT 4 save in reg[37]
   li $t0 4
   sw $t0 -196($sp)

#------------104  FACTOR_CON INT 2 save in reg[38]
   li $t0 2
   sw $t0 -200($sp)

#------------105  FACTOR_CON INT -2 save in reg[39]
   li $t0 -2
   sw $t0 -204($sp)

#------------106  PUSH INT parareg[2] from reg[34]
   sw $ra -208($sp)
   lw $t0 -184($sp)
   sw $t0 -212($sp)

#------------107  PUSH INT parareg[3] from reg[35]
   lw $t0 -188($sp)
   sw $t0 -216($sp)

#------------108  PUSH INT parareg[4] from reg[36]
   lw $t0 -192($sp)
   sw $t0 -220($sp)

#------------109  PUSH INT parareg[5] from reg[37]
   lw $t0 -196($sp)
   sw $t0 -224($sp)

#------------110  PUSH INT parareg[6] from reg[38]
   lw $t0 -200($sp)
   sw $t0 -228($sp)

#------------111  PUSH INT parareg[7] from reg[39]
   lw $t0 -204($sp)
   sw $t0 -232($sp)

#------------112  CALL CHAR fun2(6)
   addiu $sp $sp -212
   jal .func_fun2
   subiu $sp $sp -212
   lw $ra -208($sp)

#------------113  FACTOR_FUNC CHAR fun2 save in reg[40]
   sw $v0 -208($sp)

#------------114  ASSIGN_ARR CHAR ar[reg[31]] = reg[40]
   lw $t0 -172($sp)
   lw $t1 -208($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 0($t0)

#------------115  FACTOR_CON INT 0 save in reg[41]
   li $t0 0
   sw $t0 -212($sp)

#------------116  FACTOR_CON INT 4 save in reg[42]
   li $t0 4
   sw $t0 -216($sp)

#------------117  PUSH INT parareg[8] from reg[42]
   sw $ra -220($sp)
   lw $t0 -216($sp)
   sw $t0 -224($sp)

#------------118  CALL INT fact(1)
   addiu $sp $sp -224
   jal .func_fact
   subiu $sp $sp -224
   lw $ra -220($sp)

#------------119  FACTOR_FUNC INT fact save in reg[43]
   sw $v0 -220($sp)

#------------120  reg[44] = reg[41] CHU reg[43]
   lw $t0 -212($sp)
   lw $t1 -220($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -224($sp)

#------------121  FACTOR_ARRAY CHAR ar [reg[44]] save in reg[45]
   lw $t3 -224($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -228($sp)

#------------122  FACTOR_EXPR reg[45] save in reg[46]
   lw $t0 -228($sp)
   sw $t0 -232($sp)

#------------123  WRITE INT reg[46]
   li $v0 1
   lw $a0 -232($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------124  FACTOR_CON INT 1 save in reg[47]
   li $t0 1
   sw $t0 -236($sp)

#------------125  FACTOR_CON CHAR 48 save in reg[48]
   li $t0 48
   sw $t0 -240($sp)

#------------126  ASSIGN_ARR CHAR ar[reg[47]] = reg[48]
   lw $t0 -236($sp)
   lw $t1 -240($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 0($t0)

#------------127  FACTOR_CON INT 1 save in reg[49]
   li $t0 1
   sw $t0 -244($sp)

#------------128  FACTOR_CON INT 1 save in reg[50]
   li $t0 1
   sw $t0 -248($sp)

#------------129  FACTOR_ARRAY CHAR ar [reg[50]] save in reg[51]
   lw $t3 -248($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -252($sp)

#------------130  CALL INT rt15(0)
   sw $ra -256($sp)
   addiu $sp $sp -260
   jal .func_rt15
   subiu $sp $sp -260
   lw $ra -256($sp)

#------------131  FACTOR_FUNC INT rt15 save in reg[52]
   sw $v0 -256($sp)

#------------132  reg[53] = reg[51] JIA reg[52]
   lw $t0 -252($sp)
   lw $t1 -256($sp)
   addu $t2 $t0 $t1
   sw $t2 -260($sp)

#------------133  FACTOR_EXPR reg[53] save in reg[54]
   lw $t0 -260($sp)
   sw $t0 -264($sp)

#------------134  reg[55] = reg[49] CHENG reg[54]
   lw $t0 -244($sp)
   lw $t1 -264($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -268($sp)

#------------135  FACTOR_CON CHAR 0 save in reg[56]
   li $t0 0
   sw $t0 -272($sp)

#------------136  reg[57] = reg[56] JIAN reg[55]
   lw $t0 -272($sp)
   lw $t1 -268($sp)
   subu $t2 $t0 $t1
   sw $t2 -276($sp)






#------------142  FACTOR_CON INT -34 save in reg[63]
   li $t0 -34
   sw $t0 -300($sp)

#------------143  reg[64] = reg[57] JIA reg[63]
   lw $t0 -276($sp)
   lw $t1 -300($sp)
   addu $t2 $t0 $t1
   sw $t2 -304($sp)



#------------146  FACTOR_CON INT 218 save in reg[67]
   li $t0 218
   sw $t0 -316($sp)

#------------147  reg[68] = reg[64] JIA reg[67]
   lw $t0 -304($sp)
   lw $t1 -316($sp)
   addu $t2 $t0 $t1
   sw $t2 -320($sp)

#------------148  ASSIGN INT aa = reg[68]
   lw $t3 -320($sp)
   sw $t3 -44($sp)

#------------149  FACTOR_VAR INT aa save in reg[69]
   lw $t3 -44($sp)
   sw $t3 -324($sp)

#------------150  WRITE INT reg[69]
   li $v0 1
   lw $a0 -324($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------151  FACTOR_VAR INT aa save in reg[70]
   lw $t3 -44($sp)
   sw $t3 -328($sp)

#------------152  ASSIGN INT a = reg[70]
   lw $t3 -328($sp)
   sw $t3 -48($sp)

#------------153  READ INT a
   li $v0 5
   syscall
   sw $v0 -48($sp)

#------------154  READ_EXTERN INT x
   li $v0 5
   syscall
   sw $v0 .var_x

#------------155  FACTOR_VAR INT a save in reg[71]
   lw $t3 -48($sp)
   sw $t3 -332($sp)

#------------156  FACTOR_CON INT 0 save in reg[72]
   li $t0 0
   sw $t0 -336($sp)

#------------157  IF reg[71] BLEQ reg[72] THEN GOTO label_4
   lw $t0 -332($sp)
   lw $t1 -336($sp)
    ble $t0 $t1 label_4

#------------158  WRITE 1 hit 
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------159  FACTOR_VAR_EXTERN INT x save in reg[73]
   lw $t3 .var_x
   sw $t3 -340($sp)

#------------160  FACTOR_CON INT 0 save in reg[74]
   li $t0 0
   sw $t0 -344($sp)

#------------161  IF reg[73] BGTR reg[74] THEN GOTO label_2
   lw $t0 -340($sp)
   lw $t1 -344($sp)
    bgt $t0 $t1 label_2

#------------162  FACTOR_VAR INT a save in reg[75]
   lw $t3 -48($sp)
   sw $t3 -348($sp)

#------------163  FACTOR_VAR_EXTERN INT x save in reg[76]
   lw $t3 .var_x
   sw $t3 -352($sp)

#------------164  reg[77] = reg[75] CHU reg[76]
   lw $t0 -348($sp)
   lw $t1 -352($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -356($sp)

#------------165  FACTOR_VAR INT a save in reg[78]
   lw $t3 -48($sp)
   sw $t3 -360($sp)

#------------166  reg[79] = reg[77] CHENG reg[78]
   lw $t0 -356($sp)
   lw $t1 -360($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -364($sp)

#------------167  ASSIGN INT r = reg[79]
   lw $t3 -364($sp)
   sw $t3 -8($sp)

#------------168  WRITE 2 hit 
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------169  JUMP to label_3
   j label_3

#------------170  label_2    ----------------Label----------------
label_2:

#------------171  label_3    ----------------Label----------------
label_3:

#------------172  FACTOR_VAR INT r save in reg[80]
   lw $t3 -8($sp)
   sw $t3 -368($sp)

#------------173  FACTOR_VAR INT aa save in reg[81]
   lw $t3 -44($sp)
   sw $t3 -372($sp)

#------------174  reg[82] = reg[80] JIA reg[81]
   lw $t0 -368($sp)
   lw $t1 -372($sp)
   addu $t2 $t0 $t1
   sw $t2 -376($sp)

#------------175  ASSIGN INT r = reg[82]
   lw $t3 -376($sp)
   sw $t3 -8($sp)

#------------176  JUMP to label_5
   j label_5

#------------177  label_4    ----------------Label----------------
label_4:

#------------178  label_5    ----------------Label----------------
label_5:

#------------179  FACTOR_VAR_EXTERN INT x save in reg[83]
   lw $t3 .var_x
   sw $t3 -380($sp)

#------------180  FACTOR_CON INT 0 save in reg[84]
   li $t0 0
   sw $t0 -384($sp)

#------------181  IF reg[83] BEQ reg[84] THEN GOTO label_8
   lw $t0 -380($sp)
   lw $t1 -384($sp)
    beq $t0 $t1 label_8

#------------182  WRITE 3 hit 
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------183  FACTOR_VAR INT a save in reg[85]
   lw $t3 -48($sp)
   sw $t3 -388($sp)



#------------186  FACTOR_CON INT -4 save in reg[88]
   li $t0 -4
   sw $t0 -400($sp)

#------------187  IF reg[85] BNE reg[88] THEN GOTO label_6
   lw $t0 -388($sp)
   lw $t1 -400($sp)
    bne $t0 $t1 label_6

#------------188  FACTOR_VAR INT r save in reg[89]
   lw $t3 -8($sp)
   sw $t3 -404($sp)

#------------189  FACTOR_CON INT 1 save in reg[90]
   li $t0 1
   sw $t0 -408($sp)

#------------190  reg[91] = reg[89] JIA reg[90]
   lw $t0 -404($sp)
   lw $t1 -408($sp)
   addu $t2 $t0 $t1
   sw $t2 -412($sp)

#------------191  ASSIGN INT r = reg[91]
   lw $t3 -412($sp)
   sw $t3 -8($sp)

#------------192  WRITE 4 hit 
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------193  JUMP to label_7
   j label_7

#------------194  label_6    ----------------Label----------------
label_6:

#------------195  label_7    ----------------Label----------------
label_7:

#------------196  JUMP to label_9
   j label_9

#------------197  label_8    ----------------Label----------------
label_8:

#------------198  label_9    ----------------Label----------------
label_9:

#------------199  FACTOR_VAR INT a save in reg[92]
   lw $t3 -48($sp)
   sw $t3 -416($sp)

#------------200  FACTOR_CON INT 0 save in reg[93]
   li $t0 0
   sw $t0 -420($sp)

#------------201  IF reg[92] BGEQ reg[93] THEN GOTO label_12
   lw $t0 -416($sp)
   lw $t1 -420($sp)
    bge $t0 $t1 label_12

#------------202  WRITE 5 hit 
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------203  FACTOR_VAR_EXTERN INT x save in reg[94]
   lw $t3 .var_x
   sw $t3 -424($sp)

#------------204  FACTOR_CON INT 0 save in reg[95]
   li $t0 0
   sw $t0 -428($sp)

#------------205  IF reg[94] BLSS reg[95] THEN GOTO label_10
   lw $t0 -424($sp)
   lw $t1 -428($sp)
    blt $t0 $t1 label_10

#------------206  FACTOR_VAR INT r save in reg[96]
   lw $t3 -8($sp)
   sw $t3 -432($sp)

#------------207  FACTOR_VAR INT a save in reg[97]
   lw $t3 -48($sp)
   sw $t3 -436($sp)

#------------208  reg[98] = reg[96] JIA reg[97]
   lw $t0 -432($sp)
   lw $t1 -436($sp)
   addu $t2 $t0 $t1
   sw $t2 -440($sp)

#------------209  ASSIGN INT r = reg[98]
   lw $t3 -440($sp)
   sw $t3 -8($sp)

#------------210  WRITE 6 hit 
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------211  JUMP to label_11
   j label_11

#------------212  label_10    ----------------Label----------------
label_10:

#------------213  label_11    ----------------Label----------------
label_11:

#------------214  JUMP to label_13
   j label_13

#------------215  label_12    ----------------Label----------------
label_12:

#------------216  FACTOR_VAR INT r save in reg[99]
   lw $t3 -8($sp)
   sw $t3 -444($sp)

#------------217  FACTOR_CON INT -1 save in reg[100]
   li $t0 -1
   sw $t0 -448($sp)

#------------218  reg[101] = reg[99] CHENG reg[100]
   lw $t0 -444($sp)
   lw $t1 -448($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -452($sp)

#------------219  ASSIGN INT r = reg[101]
   lw $t3 -452($sp)
   sw $t3 -8($sp)

#------------220  FACTOR_VAR INT r save in reg[102]
   lw $t3 -8($sp)
   sw $t3 -456($sp)

#------------221  WRITE INT reg[102]
   li $v0 1
   lw $a0 -456($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------222  label_13    ----------------Label----------------
label_13:



#------------225  FACTOR_CON INT -2 save in reg[105]
   li $t0 -2
   sw $t0 -468($sp)

#------------226  ASSIGN INT a = reg[105]
   lw $t3 -468($sp)
   sw $t3 -48($sp)

#------------227  label_14    ----------------Label----------------
label_14:

#------------228  FACTOR_VAR_EXTERN INT x save in reg[106]
   lw $t3 .var_x
   sw $t3 -472($sp)

#------------229  FACTOR_CON INT 4 save in reg[107]
   li $t0 4
   sw $t0 -476($sp)

#------------230  reg[108] = reg[106] JIA reg[107]
   lw $t0 -472($sp)
   lw $t1 -476($sp)
   addu $t2 $t0 $t1
   sw $t2 -480($sp)

#------------231  ASSIGN_EXTERN INT x = reg[108]
   lw $t3 -480($sp)
   sw $t3 .var_x

#------------232  FACTOR_VAR INT a save in reg[109]
   lw $t3 -48($sp)
   sw $t3 -484($sp)

#------------233  FACTOR_CON INT 1 save in reg[110]
   li $t0 1
   sw $t0 -488($sp)

#------------234  reg[111] = reg[109] JIA reg[110]
   lw $t0 -484($sp)
   lw $t1 -488($sp)
   addu $t2 $t0 $t1
   sw $t2 -492($sp)

#------------235  ASSIGN INT a = reg[111]
   lw $t3 -492($sp)
   sw $t3 -48($sp)

#------------236  FACTOR_VAR INT a save in reg[112]
   lw $t3 -48($sp)
   sw $t3 -496($sp)

#------------237  FACTOR_CON INT 3 save in reg[113]
   li $t0 3
   sw $t0 -500($sp)

#------------238  IF reg[112] BLSS reg[113] THEN GOTO label_14
   lw $t0 -496($sp)
   lw $t1 -500($sp)
    blt $t0 $t1 label_14

#------------239  label_15    ----------------Label----------------
label_15:

#------------240  FACTOR_VAR_EXTERN INT x save in reg[114]
   lw $t3 .var_x
   sw $t3 -504($sp)

#------------241  FACTOR_CON INT 0 save in reg[115]
   li $t0 0
   sw $t0 -508($sp)

#------------242  IF reg[114] BLEQ reg[115] THEN GOTO label_16
   lw $t0 -504($sp)
   lw $t1 -508($sp)
    ble $t0 $t1 label_16

#------------243  FACTOR_VAR_EXTERN INT x save in reg[116]
   lw $t3 .var_x
   sw $t3 -512($sp)

#------------244  FACTOR_CON INT 2 save in reg[117]
   li $t0 2
   sw $t0 -516($sp)

#------------245  reg[118] = reg[116] JIAN reg[117]
   lw $t0 -512($sp)
   lw $t1 -516($sp)
   subu $t2 $t0 $t1
   sw $t2 -520($sp)

#------------246  ASSIGN_EXTERN INT x = reg[118]
   lw $t3 -520($sp)
   sw $t3 .var_x

#------------247  JUMP to label_15
   j label_15

#------------248  label_16    ----------------Label----------------
label_16:

#------------249  FACTOR_VAR_EXTERN INT x save in reg[119]
   lw $t3 .var_x
   sw $t3 -524($sp)

#------------250  WRITE INT reg[119]
   li $v0 1
   lw $a0 -524($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

   jr $ra

end:
