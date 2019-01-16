.data
   .str_0: .asciiz " x = "
   .str_1: .asciiz " y = "
   .str_2: .asciiz " SWAP x = "
   .str_3: .asciiz " SWAP y = "
   .str_4: .asciiz " OVERFLOW!          "
   .str_5: .asciiz " complete number: "
   .str_6: .asciiz "  "
   .str_7: .asciiz "          "
   .str_8: .asciiz " ---------------------------------------------------------------          "
   .str_9: .asciiz " b = "
   .str_10: .asciiz " "
   .str_11: .asciiz "          The total is "
   .str_12: .asciiz " 10! = "
.text
   jal .func_main
   j end
#------------1  FUNC INT factorial(1)
.func_factorial:

#------------2  PARA INT n

#------------3  FACTOR_VAR INT n save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------4  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------5  IF reg[1] BGTR reg[2] THEN GOTO label_0
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bgt $t0 $t1 label_0

#------------6  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------7  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------8  JUMP to label_1
   j label_1

#------------9  label_0    ----------------Label----------------
label_0:

#------------10  label_1    ----------------Label----------------
label_1:

#------------11  FACTOR_VAR INT n save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------12  FACTOR_VAR INT n save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------13  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------14  reg[7] = reg[5] JIAN reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   subu $t2 $t0 $t1
   sw $t2 -28($sp)

#------------15  PUSH INT parareg[0] from reg[7]
   sw $ra -32($sp)
   lw $t0 -28($sp)
   sw $t0 -36($sp)

#------------16  CALL INT factorial(1)
   addiu $sp $sp -36
   jal .func_factorial
   subiu $sp $sp -36
   lw $ra -32($sp)

#------------17  FACTOR_FUNC INT factorial save in reg[8]
   sw $v0 -32($sp)

#------------18  reg[9] = reg[4] CHENG reg[8]
   lw $t0 -16($sp)
   lw $t1 -32($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------19  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------20  FUNC INT mod(2)
   jr $ra

.func_mod:

#------------21  PARA INT x

#------------22  PARA INT y

#------------23  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------24  FACTOR_VAR INT x save in reg[2]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------25  FACTOR_VAR INT y save in reg[3]
   lw $t3 -4($sp)
   sw $t3 -16($sp)

#------------26  reg[4] = reg[2] CHU reg[3]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -20($sp)

#------------27  FACTOR_VAR INT y save in reg[5]
   lw $t3 -4($sp)
   sw $t3 -24($sp)

#------------28  reg[6] = reg[4] CHENG reg[5]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -28($sp)

#------------29  reg[7] = reg[1] JIAN reg[6]
   lw $t0 -8($sp)
   lw $t1 -28($sp)
   subu $t2 $t0 $t1
   sw $t2 -32($sp)

#------------30  ASSIGN INT x = reg[7]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------31  FACTOR_VAR INT x save in reg[8]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------32  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------33  FUNC VOID swap(2)
   jr $ra

.func_swap:

#------------34  PARA INT x

#------------35  PARA INT y

#------------36  VAR INT temp

#------------37  FACTOR_VAR INT x save in reg[1]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------38  WRITE  x = 
   li $v0 4
   la $a0 .str_0
   syscall

#------------39  WRITE INT reg[1]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------40  FACTOR_VAR INT y save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -16($sp)

#------------41  WRITE  y = 
   li $v0 4
   la $a0 .str_1
   syscall

#------------42  WRITE INT reg[2]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------43  FACTOR_VAR INT x save in reg[3]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------44  ASSIGN INT temp = reg[3]
   lw $t3 -20($sp)
   sw $t3 -8($sp)

#------------45  FACTOR_VAR INT y save in reg[4]
   lw $t3 -4($sp)
   sw $t3 -24($sp)

#------------46  ASSIGN INT x = reg[4]
   lw $t3 -24($sp)
   sw $t3 0($sp)

#------------47  FACTOR_VAR INT temp save in reg[5]
   lw $t3 -8($sp)
   sw $t3 -28($sp)

#------------48  ASSIGN INT y = reg[5]
   lw $t3 -28($sp)
   sw $t3 -4($sp)

#------------49  FACTOR_VAR INT x save in reg[6]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------50  WRITE  SWAP x = 
   li $v0 4
   la $a0 .str_2
   syscall

#------------51  WRITE INT reg[6]
   li $v0 1
   lw $a0 -32($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------52  FACTOR_VAR INT y save in reg[7]
   lw $t3 -4($sp)
   sw $t3 -36($sp)

#------------53  WRITE  SWAP y = 
   li $v0 4
   la $a0 .str_3
   syscall

#------------54  WRITE INT reg[7]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------55  FUNC VOID complete_num(1)
   jr $ra

.func_complete_num:

#------------56  PARA INT val

#------------57  ARRAY INT k[128]

#------------58  VAR INT i

#------------59  VAR INT j

#------------60  VAR INT n

#------------61  VAR INT s

#------------62  VAR INT x1

#------------63  VAR INT m

#------------64  VAR INT k2

#------------65  VAR INT h

#------------66  VAR INT leap

#------------67  VAR INT x2

#------------68  VAR INT a

#------------69  VAR INT b

#------------70  VAR INT c

#------------71  FACTOR_VAR INT val save in reg[1]
   lw $t3 0($sp)
   sw $t3 -568($sp)

#------------72  ASSIGN INT j = reg[1]
   lw $t3 -568($sp)
   sw $t3 -520($sp)

#------------73  label_2    ----------------Label----------------
label_2:

#------------74  FACTOR_VAR INT j save in reg[2]
   lw $t3 -520($sp)
   sw $t3 -572($sp)

#------------75  FACTOR_CON INT 1024 save in reg[3]
   li $t0 1024
   sw $t0 -576($sp)

#------------76  IF reg[2] BGEQ reg[3] THEN GOTO label_15
   lw $t0 -572($sp)
   lw $t1 -576($sp)
    bge $t0 $t1 label_15



#------------79  FACTOR_CON INT -1 save in reg[6]
   li $t0 -1
   sw $t0 -588($sp)

#------------80  ASSIGN INT n = reg[6]
   lw $t3 -588($sp)
   sw $t3 -524($sp)

#------------81  FACTOR_VAR INT j save in reg[7]
   lw $t3 -520($sp)
   sw $t3 -592($sp)

#------------82  ASSIGN INT s = reg[7]
   lw $t3 -592($sp)
   sw $t3 -528($sp)

#------------83  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -596($sp)

#------------84  ASSIGN INT i = reg[8]
   lw $t3 -596($sp)
   sw $t3 -516($sp)

#------------85  label_3    ----------------Label----------------
label_3:

#------------86  FACTOR_VAR INT i save in reg[9]
   lw $t3 -516($sp)
   sw $t3 -600($sp)

#------------87  FACTOR_VAR INT j save in reg[10]
   lw $t3 -520($sp)
   sw $t3 -604($sp)

#------------88  IF reg[9] BGEQ reg[10] THEN GOTO label_10
   lw $t0 -600($sp)
   lw $t1 -604($sp)
    bge $t0 $t1 label_10

#------------89  FACTOR_VAR INT j save in reg[11]
   lw $t3 -520($sp)
   sw $t3 -608($sp)

#------------90  FACTOR_VAR INT i save in reg[12]
   lw $t3 -516($sp)
   sw $t3 -612($sp)

#------------91  reg[13] = reg[11] CHU reg[12]
   lw $t0 -608($sp)
   lw $t1 -612($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -616($sp)

#------------92  FACTOR_EXPR reg[13] save in reg[14]
   lw $t0 -616($sp)
   sw $t0 -620($sp)

#------------93  FACTOR_VAR INT i save in reg[15]
   lw $t3 -516($sp)
   sw $t3 -624($sp)

#------------94  reg[16] = reg[14] CHENG reg[15]
   lw $t0 -620($sp)
   lw $t1 -624($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -628($sp)

#------------95  ASSIGN INT x1 = reg[16]
   lw $t3 -628($sp)
   sw $t3 -532($sp)

#------------96  FACTOR_VAR INT j save in reg[17]
   lw $t3 -520($sp)
   sw $t3 -632($sp)

#------------97  FACTOR_VAR INT i save in reg[18]
   lw $t3 -516($sp)
   sw $t3 -636($sp)

#------------98  PUSH INT parareg[1] from reg[17]
   sw $ra -640($sp)
   lw $t0 -632($sp)
   sw $t0 -644($sp)

#------------99  PUSH INT parareg[2] from reg[18]
   lw $t0 -636($sp)
   sw $t0 -648($sp)

#------------100  CALL INT mod(2)
   addiu $sp $sp -644
   jal .func_mod
   subiu $sp $sp -644
   lw $ra -640($sp)

#------------101  FACTOR_FUNC INT mod save in reg[19]
   sw $v0 -640($sp)

#------------102  FACTOR_CON INT 0 save in reg[20]
   li $t0 0
   sw $t0 -644($sp)

#------------103  IF reg[19] BNE reg[20] THEN GOTO label_8
   lw $t0 -640($sp)
   lw $t1 -644($sp)
    bne $t0 $t1 label_8

#------------104  FACTOR_VAR INT n save in reg[21]
   lw $t3 -524($sp)
   sw $t3 -648($sp)

#------------105  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -652($sp)

#------------106  reg[23] = reg[21] JIA reg[22]
   lw $t0 -648($sp)
   lw $t1 -652($sp)
   addu $t2 $t0 $t1
   sw $t2 -656($sp)

#------------107  ASSIGN INT n = reg[23]
   lw $t3 -656($sp)
   sw $t3 -524($sp)

#------------108  FACTOR_VAR INT s save in reg[24]
   lw $t3 -528($sp)
   sw $t3 -660($sp)

#------------109  FACTOR_VAR INT i save in reg[25]
   lw $t3 -516($sp)
   sw $t3 -664($sp)

#------------110  reg[26] = reg[24] JIAN reg[25]
   lw $t0 -660($sp)
   lw $t1 -664($sp)
   subu $t2 $t0 $t1
   sw $t2 -668($sp)

#------------111  ASSIGN INT s = reg[26]
   lw $t3 -668($sp)
   sw $t3 -528($sp)

#------------112  FACTOR_VAR INT n save in reg[27]
   lw $t3 -524($sp)
   sw $t3 -672($sp)

#------------113  FACTOR_CON INT 128 save in reg[28]
   li $t0 128
   sw $t0 -676($sp)

#------------114  IF reg[27] BLSS reg[28] THEN GOTO label_4
   lw $t0 -672($sp)
   lw $t1 -676($sp)
    blt $t0 $t1 label_4

#------------115  WRITE  OVERFLOW!          
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------116  JUMP to label_5
   j label_5

#------------117  label_4    ----------------Label----------------
label_4:

#------------118  label_5    ----------------Label----------------
label_5:

#------------119  FACTOR_VAR INT n save in reg[29]
   lw $t3 -524($sp)
   sw $t3 -680($sp)

#------------120  FACTOR_CON INT 128 save in reg[30]
   li $t0 128
   sw $t0 -684($sp)

#------------121  IF reg[29] BGEQ reg[30] THEN GOTO label_6
   lw $t0 -680($sp)
   lw $t1 -684($sp)
    bge $t0 $t1 label_6

#------------122  FACTOR_VAR INT n save in reg[31]
   lw $t3 -524($sp)
   sw $t3 -688($sp)

#------------123  FACTOR_VAR INT i save in reg[32]
   lw $t3 -516($sp)
   sw $t3 -692($sp)

#------------124  ASSIGN_ARR INT k[reg[31]] = reg[32]
   lw $t0 -688($sp)
   lw $t1 -692($sp)
   sll $t0 $t0 2
   subu $t0 $sp $t0
   sw $t1 -4($t0)

#------------125  JUMP to label_7
   j label_7

#------------126  label_6    ----------------Label----------------
label_6:

#------------127  label_7    ----------------Label----------------
label_7:

#------------128  JUMP to label_9
   j label_9

#------------129  label_8    ----------------Label----------------
label_8:

#------------130  label_9    ----------------Label----------------
label_9:

#------------131  FACTOR_VAR INT i save in reg[33]
   lw $t3 -516($sp)
   sw $t3 -696($sp)

#------------132  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -700($sp)

#------------133  reg[35] = reg[33] JIA reg[34]
   lw $t0 -696($sp)
   lw $t1 -700($sp)
   addu $t2 $t0 $t1
   sw $t2 -704($sp)

#------------134  ASSIGN INT i = reg[35]
   lw $t3 -704($sp)
   sw $t3 -516($sp)

#------------135  JUMP to label_3
   j label_3

#------------136  label_10    ----------------Label----------------
label_10:

#------------137  FACTOR_VAR INT s save in reg[36]
   lw $t3 -528($sp)
   sw $t3 -708($sp)

#------------138  FACTOR_CON INT 0 save in reg[37]
   li $t0 0
   sw $t0 -712($sp)

#------------139  IF reg[36] BNE reg[37] THEN GOTO label_13
   lw $t0 -708($sp)
   lw $t1 -712($sp)
    bne $t0 $t1 label_13

#------------140  FACTOR_VAR INT j save in reg[38]
   lw $t3 -520($sp)
   sw $t3 -716($sp)

#------------141  WRITE  complete number: 
   li $v0 4
   la $a0 .str_5
   syscall

#------------142  WRITE INT reg[38]
   li $v0 1
   lw $a0 -716($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------143  FACTOR_CON INT 0 save in reg[39]
   li $t0 0
   sw $t0 -720($sp)

#------------144  ASSIGN INT i = reg[39]
   lw $t3 -720($sp)
   sw $t3 -516($sp)

#------------145  label_11    ----------------Label----------------
label_11:

#------------146  FACTOR_VAR INT i save in reg[40]
   lw $t3 -516($sp)
   sw $t3 -724($sp)

#------------147  FACTOR_VAR INT n save in reg[41]
   lw $t3 -524($sp)
   sw $t3 -728($sp)

#------------148  IF reg[40] BGTR reg[41] THEN GOTO label_12
   lw $t0 -724($sp)
   lw $t1 -728($sp)
    bgt $t0 $t1 label_12

#------------149  FACTOR_VAR INT i save in reg[42]
   lw $t3 -516($sp)
   sw $t3 -732($sp)

#------------150  FACTOR_ARRAY INT k [reg[42]] save in reg[43]
   lw $t3 -732($sp)
   sll $t3 $t3 2
   subu $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -736($sp)

#------------151  WRITE   
   li $v0 4
   la $a0 .str_6
   syscall

#------------152  WRITE INT reg[43]
   li $v0 1
   lw $a0 -736($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------153  FACTOR_VAR INT i save in reg[44]
   lw $t3 -516($sp)
   sw $t3 -740($sp)

#------------154  FACTOR_CON INT 1 save in reg[45]
   li $t0 1
   sw $t0 -744($sp)

#------------155  reg[46] = reg[44] JIA reg[45]
   lw $t0 -740($sp)
   lw $t1 -744($sp)
   addu $t2 $t0 $t1
   sw $t2 -748($sp)

#------------156  ASSIGN INT i = reg[46]
   lw $t3 -748($sp)
   sw $t3 -516($sp)

#------------157  JUMP to label_11
   j label_11

#------------158  label_12    ----------------Label----------------
label_12:

#------------159  WRITE           
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------160  JUMP to label_14
   j label_14

#------------161  label_13    ----------------Label----------------
label_13:

#------------162  label_14    ----------------Label----------------
label_14:

#------------163  FACTOR_VAR INT j save in reg[47]
   lw $t3 -520($sp)
   sw $t3 -752($sp)

#------------164  FACTOR_CON INT 1 save in reg[48]
   li $t0 1
   sw $t0 -756($sp)

#------------165  reg[49] = reg[47] JIA reg[48]
   lw $t0 -752($sp)
   lw $t1 -756($sp)
   addu $t2 $t0 $t1
   sw $t2 -760($sp)

#------------166  ASSIGN INT j = reg[49]
   lw $t3 -760($sp)
   sw $t3 -520($sp)

#------------167  JUMP to label_2
   j label_2

#------------168  label_15    ----------------Label----------------
label_15:

#------------169  WRITE  ---------------------------------------------------------------          
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------170  FACTOR_CON INT 0 save in reg[50]
   li $t0 0
   sw $t0 -764($sp)

#------------171  ASSIGN INT a = reg[50]
   lw $t3 -764($sp)
   sw $t3 -556($sp)

#------------172  FACTOR_CON INT 0 save in reg[51]
   li $t0 0
   sw $t0 -768($sp)

#------------173  ASSIGN INT i = reg[51]
   lw $t3 -768($sp)
   sw $t3 -516($sp)

#------------174  label_16    ----------------Label----------------
label_16:

#------------175  FACTOR_VAR INT i save in reg[52]
   lw $t3 -516($sp)
   sw $t3 -772($sp)

#------------176  FACTOR_CON INT 1024 save in reg[53]
   li $t0 1024
   sw $t0 -776($sp)

#------------177  IF reg[52] BGEQ reg[53] THEN GOTO label_17
   lw $t0 -772($sp)
   lw $t1 -776($sp)
    bge $t0 $t1 label_17

#------------178  FACTOR_VAR INT a save in reg[54]
   lw $t3 -556($sp)
   sw $t3 -780($sp)

#------------179  FACTOR_VAR INT i save in reg[55]
   lw $t3 -516($sp)
   sw $t3 -784($sp)

#------------180  reg[56] = reg[54] CHENG reg[55]
   lw $t0 -780($sp)
   lw $t1 -784($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -788($sp)

#------------181  ASSIGN INT b = reg[56]
   lw $t3 -788($sp)
   sw $t3 -560($sp)

#------------182  FACTOR_VAR INT j save in reg[57]
   lw $t3 -520($sp)
   sw $t3 -792($sp)

#------------183  FACTOR_VAR INT n save in reg[58]
   lw $t3 -524($sp)
   sw $t3 -796($sp)

#------------184  reg[59] = reg[57] CHENG reg[58]
   lw $t0 -792($sp)
   lw $t1 -796($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -800($sp)

#------------185  ASSIGN INT c = reg[59]
   lw $t3 -800($sp)
   sw $t3 -564($sp)

#------------186  FACTOR_VAR INT a save in reg[60]
   lw $t3 -556($sp)
   sw $t3 -804($sp)

#------------187  FACTOR_VAR INT i save in reg[61]
   lw $t3 -516($sp)
   sw $t3 -808($sp)

#------------188  reg[62] = reg[60] CHENG reg[61]
   lw $t0 -804($sp)
   lw $t1 -808($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -812($sp)

#------------189  ASSIGN INT a = reg[62]
   lw $t3 -812($sp)
   sw $t3 -556($sp)

#------------190  FACTOR_VAR INT a save in reg[63]
   lw $t3 -556($sp)
   sw $t3 -816($sp)

#------------191  FACTOR_VAR INT b save in reg[64]
   lw $t3 -560($sp)
   sw $t3 -820($sp)

#------------192  reg[65] = reg[63] JIA reg[64]
   lw $t0 -816($sp)
   lw $t1 -820($sp)
   addu $t2 $t0 $t1
   sw $t2 -824($sp)

#------------193  FACTOR_VAR INT c save in reg[66]
   lw $t3 -564($sp)
   sw $t3 -828($sp)

#------------194  reg[67] = reg[65] JIA reg[66]
   lw $t0 -824($sp)
   lw $t1 -828($sp)
   addu $t2 $t0 $t1
   sw $t2 -832($sp)

#------------195  ASSIGN INT a = reg[67]
   lw $t3 -832($sp)
   sw $t3 -556($sp)

#------------196  FACTOR_VAR INT i save in reg[68]
   lw $t3 -516($sp)
   sw $t3 -836($sp)

#------------197  FACTOR_CON INT 1 save in reg[69]
   li $t0 1
   sw $t0 -840($sp)

#------------198  reg[70] = reg[68] JIA reg[69]
   lw $t0 -836($sp)
   lw $t1 -840($sp)
   addu $t2 $t0 $t1
   sw $t2 -844($sp)

#------------199  ASSIGN INT i = reg[70]
   lw $t3 -844($sp)
   sw $t3 -516($sp)

#------------200  JUMP to label_16
   j label_16

#------------201  label_17    ----------------Label----------------
label_17:

#------------202  FACTOR_VAR INT a save in reg[71]
   lw $t3 -556($sp)
   sw $t3 -848($sp)

#------------203  ASSIGN INT b = reg[71]
   lw $t3 -848($sp)
   sw $t3 -560($sp)

#------------204  FACTOR_CON INT 0 save in reg[72]
   li $t0 0
   sw $t0 -852($sp)

#------------205  ASSIGN INT i = reg[72]
   lw $t3 -852($sp)
   sw $t3 -516($sp)

#------------206  label_18    ----------------Label----------------
label_18:

#------------207  FACTOR_VAR INT i save in reg[73]
   lw $t3 -516($sp)
   sw $t3 -856($sp)

#------------208  FACTOR_CON INT 1024 save in reg[74]
   li $t0 1024
   sw $t0 -860($sp)

#------------209  IF reg[73] BGEQ reg[74] THEN GOTO label_19
   lw $t0 -856($sp)
   lw $t1 -860($sp)
    bge $t0 $t1 label_19

#------------210  FACTOR_VAR INT b save in reg[75]
   lw $t3 -560($sp)
   sw $t3 -864($sp)

#------------211  FACTOR_VAR INT i save in reg[76]
   lw $t3 -516($sp)
   sw $t3 -868($sp)

#------------212  reg[77] = reg[75] JIA reg[76]
   lw $t0 -864($sp)
   lw $t1 -868($sp)
   addu $t2 $t0 $t1
   sw $t2 -872($sp)

#------------213  ASSIGN INT b = reg[77]
   lw $t3 -872($sp)
   sw $t3 -560($sp)

#------------214  FACTOR_VAR INT i save in reg[78]
   lw $t3 -516($sp)
   sw $t3 -876($sp)

#------------215  FACTOR_CON INT 1 save in reg[79]
   li $t0 1
   sw $t0 -880($sp)

#------------216  reg[80] = reg[78] JIA reg[79]
   lw $t0 -876($sp)
   lw $t1 -880($sp)
   addu $t2 $t0 $t1
   sw $t2 -884($sp)

#------------217  ASSIGN INT i = reg[80]
   lw $t3 -884($sp)
   sw $t3 -516($sp)

#------------218  JUMP to label_18
   j label_18

#------------219  label_19    ----------------Label----------------
label_19:

#------------220  FACTOR_VAR INT b save in reg[81]
   lw $t3 -560($sp)
   sw $t3 -888($sp)

#------------221  WRITE  b = 
   li $v0 4
   la $a0 .str_9
   syscall

#------------222  WRITE INT reg[81]
   li $v0 1
   lw $a0 -888($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------223  WRITE  ---------------------------------------------------------------          
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------224  FACTOR_CON INT 0 save in reg[82]
   li $t0 0
   sw $t0 -892($sp)

#------------225  ASSIGN INT h = reg[82]
   lw $t3 -892($sp)
   sw $t3 -544($sp)

#------------226  FACTOR_CON INT 1 save in reg[83]
   li $t0 1
   sw $t0 -896($sp)

#------------227  ASSIGN INT leap = reg[83]
   lw $t3 -896($sp)
   sw $t3 -548($sp)

#------------228  FACTOR_CON INT 2 save in reg[84]
   li $t0 2
   sw $t0 -900($sp)

#------------229  ASSIGN INT m = reg[84]
   lw $t3 -900($sp)
   sw $t3 -536($sp)

#------------230  label_20    ----------------Label----------------
label_20:

#------------231  FACTOR_VAR INT m save in reg[85]
   lw $t3 -536($sp)
   sw $t3 -904($sp)

#------------232  FACTOR_CON INT 1024 save in reg[86]
   li $t0 1024
   sw $t0 -908($sp)

#------------233  IF reg[85] BGTR reg[86] THEN GOTO label_29
   lw $t0 -904($sp)
   lw $t1 -908($sp)
    bgt $t0 $t1 label_29

#------------234  FACTOR_VAR INT m save in reg[87]
   lw $t3 -536($sp)
   sw $t3 -912($sp)

#------------235  FACTOR_CON INT 2 save in reg[88]
   li $t0 2
   sw $t0 -916($sp)

#------------236  reg[89] = reg[87] CHU reg[88]
   lw $t0 -912($sp)
   lw $t1 -916($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -920($sp)

#------------237  ASSIGN INT k2 = reg[89]
   lw $t3 -920($sp)
   sw $t3 -540($sp)

#------------238  FACTOR_CON INT 2 save in reg[90]
   li $t0 2
   sw $t0 -924($sp)

#------------239  ASSIGN INT i = reg[90]
   lw $t3 -924($sp)
   sw $t3 -516($sp)

#------------240  label_21    ----------------Label----------------
label_21:

#------------241  FACTOR_VAR INT i save in reg[91]
   lw $t3 -516($sp)
   sw $t3 -928($sp)

#------------242  FACTOR_VAR INT k2 save in reg[92]
   lw $t3 -540($sp)
   sw $t3 -932($sp)

#------------243  IF reg[91] BGTR reg[92] THEN GOTO label_24
   lw $t0 -928($sp)
   lw $t1 -932($sp)
    bgt $t0 $t1 label_24

#------------244  FACTOR_VAR INT m save in reg[93]
   lw $t3 -536($sp)
   sw $t3 -936($sp)

#------------245  FACTOR_VAR INT i save in reg[94]
   lw $t3 -516($sp)
   sw $t3 -940($sp)

#------------246  reg[95] = reg[93] CHU reg[94]
   lw $t0 -936($sp)
   lw $t1 -940($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -944($sp)

#------------247  FACTOR_EXPR reg[95] save in reg[96]
   lw $t0 -944($sp)
   sw $t0 -948($sp)

#------------248  FACTOR_VAR INT i save in reg[97]
   lw $t3 -516($sp)
   sw $t3 -952($sp)

#------------249  reg[98] = reg[96] CHENG reg[97]
   lw $t0 -948($sp)
   lw $t1 -952($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -956($sp)

#------------250  ASSIGN INT x2 = reg[98]
   lw $t3 -956($sp)
   sw $t3 -552($sp)

#------------251  FACTOR_VAR INT m save in reg[99]
   lw $t3 -536($sp)
   sw $t3 -960($sp)

#------------252  FACTOR_VAR INT i save in reg[100]
   lw $t3 -516($sp)
   sw $t3 -964($sp)

#------------253  PUSH INT parareg[3] from reg[99]
   sw $ra -968($sp)
   lw $t0 -960($sp)
   sw $t0 -972($sp)

#------------254  PUSH INT parareg[4] from reg[100]
   lw $t0 -964($sp)
   sw $t0 -976($sp)

#------------255  CALL INT mod(2)
   addiu $sp $sp -972
   jal .func_mod
   subiu $sp $sp -972
   lw $ra -968($sp)

#------------256  FACTOR_FUNC INT mod save in reg[101]
   sw $v0 -968($sp)

#------------257  FACTOR_CON INT 0 save in reg[102]
   li $t0 0
   sw $t0 -972($sp)

#------------258  IF reg[101] BNE reg[102] THEN GOTO label_22
   lw $t0 -968($sp)
   lw $t1 -972($sp)
    bne $t0 $t1 label_22

#------------259  FACTOR_CON INT 0 save in reg[103]
   li $t0 0
   sw $t0 -976($sp)

#------------260  ASSIGN INT leap = reg[103]
   lw $t3 -976($sp)
   sw $t3 -548($sp)

#------------261  JUMP to label_23
   j label_23

#------------262  label_22    ----------------Label----------------
label_22:

#------------263  label_23    ----------------Label----------------
label_23:

#------------264  FACTOR_VAR INT i save in reg[104]
   lw $t3 -516($sp)
   sw $t3 -980($sp)

#------------265  FACTOR_CON INT 1 save in reg[105]
   li $t0 1
   sw $t0 -984($sp)

#------------266  reg[106] = reg[104] JIA reg[105]
   lw $t0 -980($sp)
   lw $t1 -984($sp)
   addu $t2 $t0 $t1
   sw $t2 -988($sp)

#------------267  ASSIGN INT i = reg[106]
   lw $t3 -988($sp)
   sw $t3 -516($sp)

#------------268  JUMP to label_21
   j label_21

#------------269  label_24    ----------------Label----------------
label_24:

#------------270  FACTOR_VAR INT leap save in reg[107]
   lw $t3 -548($sp)
   sw $t3 -992($sp)

#------------271  FACTOR_CON INT 1 save in reg[108]
   li $t0 1
   sw $t0 -996($sp)

#------------272  IF reg[107] BNE reg[108] THEN GOTO label_27
   lw $t0 -992($sp)
   lw $t1 -996($sp)
    bne $t0 $t1 label_27

#------------273  FACTOR_VAR INT m save in reg[109]
   lw $t3 -536($sp)
   sw $t3 -1000($sp)

#------------274  WRITE  
   li $v0 4
   la $a0 .str_10
   syscall

#------------275  WRITE INT reg[109]
   li $v0 1
   lw $a0 -1000($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------276  FACTOR_VAR INT h save in reg[110]
   lw $t3 -544($sp)
   sw $t3 -1004($sp)

#------------277  FACTOR_CON INT 1 save in reg[111]
   li $t0 1
   sw $t0 -1008($sp)

#------------278  reg[112] = reg[110] JIA reg[111]
   lw $t0 -1004($sp)
   lw $t1 -1008($sp)
   addu $t2 $t0 $t1
   sw $t2 -1012($sp)

#------------279  ASSIGN INT h = reg[112]
   lw $t3 -1012($sp)
   sw $t3 -544($sp)

#------------280  FACTOR_VAR INT h save in reg[113]
   lw $t3 -544($sp)
   sw $t3 -1016($sp)

#------------281  FACTOR_CON INT 10 save in reg[114]
   li $t0 10
   sw $t0 -1020($sp)

#------------282  reg[115] = reg[113] CHU reg[114]
   lw $t0 -1016($sp)
   lw $t1 -1020($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -1024($sp)

#------------283  FACTOR_EXPR reg[115] save in reg[116]
   lw $t0 -1024($sp)
   sw $t0 -1028($sp)

#------------284  FACTOR_CON INT 10 save in reg[117]
   li $t0 10
   sw $t0 -1032($sp)

#------------285  reg[118] = reg[116] CHENG reg[117]
   lw $t0 -1028($sp)
   lw $t1 -1032($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -1036($sp)

#------------286  ASSIGN INT x2 = reg[118]
   lw $t3 -1036($sp)
   sw $t3 -552($sp)

#------------287  FACTOR_VAR INT x2 save in reg[119]
   lw $t3 -552($sp)
   sw $t3 -1040($sp)

#------------288  FACTOR_VAR INT h save in reg[120]
   lw $t3 -544($sp)
   sw $t3 -1044($sp)

#------------289  IF reg[119] BNE reg[120] THEN GOTO label_25
   lw $t0 -1040($sp)
   lw $t1 -1044($sp)
    bne $t0 $t1 label_25

#------------290  WRITE           
   li $v0 4
   la $a0 .str_7
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------291  JUMP to label_26
   j label_26

#------------292  label_25    ----------------Label----------------
label_25:

#------------293  label_26    ----------------Label----------------
label_26:

#------------294  JUMP to label_28
   j label_28

#------------295  label_27    ----------------Label----------------
label_27:

#------------296  label_28    ----------------Label----------------
label_28:

#------------297  FACTOR_CON INT 1 save in reg[121]
   li $t0 1
   sw $t0 -1048($sp)

#------------298  ASSIGN INT leap = reg[121]
   lw $t3 -1048($sp)
   sw $t3 -548($sp)

#------------299  FACTOR_VAR INT m save in reg[122]
   lw $t3 -536($sp)
   sw $t3 -1052($sp)

#------------300  FACTOR_CON INT 1 save in reg[123]
   li $t0 1
   sw $t0 -1056($sp)

#------------301  reg[124] = reg[122] JIA reg[123]
   lw $t0 -1052($sp)
   lw $t1 -1056($sp)
   addu $t2 $t0 $t1
   sw $t2 -1060($sp)

#------------302  ASSIGN INT m = reg[124]
   lw $t3 -1060($sp)
   sw $t3 -536($sp)

#------------303  JUMP to label_20
   j label_20

#------------304  label_29    ----------------Label----------------
label_29:

#------------305  FACTOR_VAR INT h save in reg[125]
   lw $t3 -544($sp)
   sw $t3 -1064($sp)

#------------306  WRITE           The total is 
   li $v0 4
   la $a0 .str_11
   syscall

#------------307  WRITE INT reg[125]
   li $v0 1
   lw $a0 -1064($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------308  FUNC VOID main(0)
   jr $ra

.func_main:

#------------309  VAR INT n

#------------310  FACTOR_CON INT 10 save in reg[126]
   li $t0 10
   sw $t0 -504($sp)

#------------311  PUSH INT parareg[5] from reg[126]
   sw $ra -508($sp)
   lw $t0 -504($sp)
   sw $t0 -512($sp)

#------------312  CALL INT factorial(1)
   addiu $sp $sp -512
   jal .func_factorial
   subiu $sp $sp -512
   lw $ra -508($sp)

#------------313  FACTOR_FUNC INT factorial save in reg[127]
   sw $v0 -508($sp)

#------------314  ASSIGN INT n = reg[127]
   lw $t3 -508($sp)
   sw $t3 0($sp)

#------------315  FACTOR_VAR INT n save in reg[128]
   lw $t3 0($sp)
   sw $t3 -512($sp)

#------------316  WRITE  10! = 
   li $v0 4
   la $a0 .str_12
   syscall

#------------317  WRITE INT reg[128]
   li $v0 1
   lw $a0 -512($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------318  FACTOR_CON INT 5 save in reg[129]
   li $t0 5
   sw $t0 -516($sp)

#------------319  FACTOR_CON INT 10 save in reg[130]
   li $t0 10
   sw $t0 -520($sp)

#------------320  PUSH INT parareg[6] from reg[129]
   sw $ra -524($sp)
   lw $t0 -516($sp)
   sw $t0 -528($sp)

#------------321  PUSH INT parareg[7] from reg[130]
   lw $t0 -520($sp)
   sw $t0 -532($sp)

#------------322  CALL VOID swap(2)
   addiu $sp $sp -528
   jal .func_swap
   subiu $sp $sp -528
   lw $ra -524($sp)

#------------323  FACTOR_CON INT 2 save in reg[131]
   li $t0 2
   sw $t0 -524($sp)

#------------324  PUSH INT parareg[8] from reg[131]
   sw $ra -528($sp)
   lw $t0 -524($sp)
   sw $t0 -532($sp)

#------------325  CALL VOID complete_num(1)
   addiu $sp $sp -532
   jal .func_complete_num
   subiu $sp $sp -532
   lw $ra -528($sp)

   jr $ra

end:
