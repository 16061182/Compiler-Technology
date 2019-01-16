.data
   .var_int_global_var: .word 0
   .var_int_global_array: .space 28
   .var_char_global_var: .word 0
   .var_char_global_array: .space 2800
.text
   jal .func_main
   j end
#------------6  FUNC INT int_func(3)
.func_int_func:

#------------7  PARA INT int_para

#------------8  PARA CHAR char_para

#------------9  PARA INT return_int

#------------10  FACTOR_VAR INT return_int save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------11  IF reg[1] BEQ reg[0] THEN GOTO label_0
   lw $t0 -12($sp)
    beq $t0 $0 label_0

#------------12  FACTOR_VAR INT int_para save in reg[2]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------13  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------14  JUMP to label_1
   j label_1

#------------15  label_0    ----------------Label----------------
label_0:

#------------16  FACTOR_VAR CHAR char_para save in reg[3]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------17  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------18  label_1    ----------------Label----------------
label_1:

#------------19  FUNC CHAR char_func(3)
   jr $ra

.func_char_func:

#------------20  PARA INT int_para

#------------21  PARA CHAR char_para

#------------22  PARA INT return_int

#------------23  FACTOR_VAR INT return_int save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------24  IF reg[1] BEQ reg[0] THEN GOTO label_2
   lw $t0 -12($sp)
    beq $t0 $0 label_2

#------------25  FACTOR_VAR INT int_para save in reg[2]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------26  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------27  JUMP to label_3
   j label_3

#------------28  label_2    ----------------Label----------------
label_2:

#------------29  FACTOR_VAR CHAR char_para save in reg[3]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------30  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------31  label_3    ----------------Label----------------
label_3:

#------------32  FUNC VOID voidd(2)
   jr $ra

.func_voidd:

#------------33  PARA INT int_para

#------------34  PARA CHAR char_para

#------------35  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------36  FUNC VOID main(0)
   jr $ra

.func_main:

#------------37  CONST INT const_local_int = 1

#------------38  CONST CHAR const_local_char = 43

#------------39  VAR INT int_local_var

#------------40  ARRAY INT int_local_array[7]

#------------41  VAR CHAR char_local_var

#------------42  ARRAY CHAR char_local_array[700]

#------------43  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -2836($sp)

#------------44  WRITE INT reg[1]
   li $v0 1
   lw $a0 -2836($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------45  FACTOR_CON CHAR 43 save in reg[2]
   li $t0 43
   sw $t0 -2840($sp)

#------------46  WRITE CHAR reg[2]
   li $v0 11
   lw $a0 -2840($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall


#------------48  FACTOR_CON INT 43 save in reg[4]
   li $t0 43
   sw $t0 -2848($sp)

#------------49  WRITE INT reg[4]
   li $v0 1
   lw $a0 -2848($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------50  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -2852($sp)

#------------51  WRITE INT reg[5]
   li $v0 1
   lw $a0 -2852($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------52  FACTOR_CON CHAR 43 save in reg[6]
   li $t0 43
   sw $t0 -2856($sp)

#------------53  WRITE CHAR reg[6]
   li $v0 11
   lw $a0 -2856($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall


#------------55  FACTOR_CON INT 43 save in reg[8]
   li $t0 43
   sw $t0 -2864($sp)

#------------56  WRITE INT reg[8]
   li $v0 1
   lw $a0 -2864($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------57  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -2868($sp)

#------------58  WRITE INT reg[9]
   li $v0 1
   lw $a0 -2868($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------59  FACTOR_CON CHAR 43 save in reg[10]
   li $t0 43
   sw $t0 -2872($sp)

#------------60  WRITE CHAR reg[10]
   li $v0 11
   lw $a0 -2872($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall


#------------62  FACTOR_CON INT 43 save in reg[12]
   li $t0 43
   sw $t0 -2880($sp)

#------------63  WRITE INT reg[12]
   li $v0 1
   lw $a0 -2880($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------64  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -2884($sp)

#------------65  FACTOR_ARRAY INT int_local_array [reg[13]] save in reg[14]
   lw $t3 -2884($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -2888($sp)

#------------66  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -2892($sp)

#------------67  FACTOR_ARRAY CHAR char_local_array [reg[15]] save in reg[16]
   lw $t3 -2892($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -2896($sp)

#------------68  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -2900($sp)

#------------69  PUSH INT parareg[0] from reg[14]
   sw $ra -2904($sp)
   lw $t0 -2888($sp)
   sw $t0 -2908($sp)

#------------70  PUSH INT parareg[1] from reg[16]
   lw $t0 -2896($sp)
   sw $t0 -2912($sp)

#------------71  PUSH INT parareg[2] from reg[17]
   lw $t0 -2900($sp)
   sw $t0 -2916($sp)

#------------72  CALL INT int_func(3)
   addi $sp $sp -2908
   jal .func_int_func
   subi $sp $sp -2908
   lw $ra -2904($sp)

#------------73  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -2904($sp)

#------------74  FACTOR_ARRAY INT int_local_array [reg[18]] save in reg[19]
   lw $t3 -2904($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -2908($sp)

#------------75  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -2912($sp)

#------------76  FACTOR_ARRAY CHAR char_local_array [reg[20]] save in reg[21]
   lw $t3 -2912($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -2916($sp)

#------------77  FACTOR_CON INT 0 save in reg[22]
   li $t0 0
   sw $t0 -2920($sp)

#------------78  PUSH INT parareg[3] from reg[19]
   sw $ra -2924($sp)
   lw $t0 -2908($sp)
   sw $t0 -2928($sp)

#------------79  PUSH INT parareg[4] from reg[21]
   lw $t0 -2916($sp)
   sw $t0 -2932($sp)

#------------80  PUSH INT parareg[5] from reg[22]
   lw $t0 -2920($sp)
   sw $t0 -2936($sp)

#------------81  CALL INT int_func(3)
   addi $sp $sp -2928
   jal .func_int_func
   subi $sp $sp -2928
   lw $ra -2924($sp)

#------------82  FACTOR_CON CHAR 43 save in reg[23]
   li $t0 43
   sw $t0 -2924($sp)

#------------83  FACTOR_ARRAY CHAR char_local_array [reg[23]] save in reg[24]
   lw $t3 -2924($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -2928($sp)

#------------84  FACTOR_CON CHAR 43 save in reg[25]
   li $t0 43
   sw $t0 -2932($sp)

#------------85  FACTOR_ARRAY INT int_local_array [reg[25]] save in reg[26]
   lw $t3 -2932($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -2936($sp)

#------------86  FACTOR_CON INT 1 save in reg[27]
   li $t0 1
   sw $t0 -2940($sp)

#------------87  PUSH INT parareg[6] from reg[24]
   sw $ra -2944($sp)
   lw $t0 -2928($sp)
   sw $t0 -2948($sp)

#------------88  PUSH INT parareg[7] from reg[26]
   lw $t0 -2936($sp)
   sw $t0 -2952($sp)

#------------89  PUSH INT parareg[8] from reg[27]
   lw $t0 -2940($sp)
   sw $t0 -2956($sp)

#------------90  CALL INT int_func(3)
   addi $sp $sp -2948
   jal .func_int_func
   subi $sp $sp -2948
   lw $ra -2944($sp)

#------------91  FACTOR_CON CHAR 43 save in reg[28]
   li $t0 43
   sw $t0 -2944($sp)

#------------92  FACTOR_ARRAY CHAR char_local_array [reg[28]] save in reg[29]
   lw $t3 -2944($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -2948($sp)

#------------93  FACTOR_CON CHAR 43 save in reg[30]
   li $t0 43
   sw $t0 -2952($sp)

#------------94  FACTOR_ARRAY INT int_local_array [reg[30]] save in reg[31]
   lw $t3 -2952($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -2956($sp)

#------------95  FACTOR_CON INT 0 save in reg[32]
   li $t0 0
   sw $t0 -2960($sp)

#------------96  PUSH INT parareg[9] from reg[29]
   sw $ra -2964($sp)
   lw $t0 -2948($sp)
   sw $t0 -2968($sp)

#------------97  PUSH INT parareg[10] from reg[31]
   lw $t0 -2956($sp)
   sw $t0 -2972($sp)

#------------98  PUSH INT parareg[11] from reg[32]
   lw $t0 -2960($sp)
   sw $t0 -2976($sp)

#------------99  CALL INT int_func(3)
   addi $sp $sp -2968
   jal .func_int_func
   subi $sp $sp -2968
   lw $ra -2964($sp)

#------------100  FACTOR_CON INT 1 save in reg[33]
   li $t0 1
   sw $t0 -2964($sp)

#------------101  FACTOR_ARRAY INT int_local_array [reg[33]] save in reg[34]
   lw $t3 -2964($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -2968($sp)

#------------102  FACTOR_CON INT 1 save in reg[35]
   li $t0 1
   sw $t0 -2972($sp)

#------------103  FACTOR_ARRAY CHAR char_local_array [reg[35]] save in reg[36]
   lw $t3 -2972($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -2976($sp)

#------------104  FACTOR_CON INT 1 save in reg[37]
   li $t0 1
   sw $t0 -2980($sp)

#------------105  PUSH INT parareg[12] from reg[34]
   sw $ra -2984($sp)
   lw $t0 -2968($sp)
   sw $t0 -2988($sp)

#------------106  PUSH INT parareg[13] from reg[36]
   lw $t0 -2976($sp)
   sw $t0 -2992($sp)

#------------107  PUSH INT parareg[14] from reg[37]
   lw $t0 -2980($sp)
   sw $t0 -2996($sp)

#------------108  CALL CHAR char_func(3)
   addi $sp $sp -2988
   jal .func_char_func
   subi $sp $sp -2988
   lw $ra -2984($sp)

#------------109  FACTOR_CON INT 1 save in reg[38]
   li $t0 1
   sw $t0 -2984($sp)

#------------110  FACTOR_ARRAY INT int_local_array [reg[38]] save in reg[39]
   lw $t3 -2984($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -2988($sp)

#------------111  FACTOR_CON INT 1 save in reg[40]
   li $t0 1
   sw $t0 -2992($sp)

#------------112  FACTOR_ARRAY CHAR char_local_array [reg[40]] save in reg[41]
   lw $t3 -2992($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -2996($sp)

#------------113  FACTOR_CON INT 0 save in reg[42]
   li $t0 0
   sw $t0 -3000($sp)

#------------114  PUSH INT parareg[15] from reg[39]
   sw $ra -3004($sp)
   lw $t0 -2988($sp)
   sw $t0 -3008($sp)

#------------115  PUSH INT parareg[16] from reg[41]
   lw $t0 -2996($sp)
   sw $t0 -3012($sp)

#------------116  PUSH INT parareg[17] from reg[42]
   lw $t0 -3000($sp)
   sw $t0 -3016($sp)

#------------117  CALL CHAR char_func(3)
   addi $sp $sp -3008
   jal .func_char_func
   subi $sp $sp -3008
   lw $ra -3004($sp)

#------------118  FACTOR_CON CHAR 43 save in reg[43]
   li $t0 43
   sw $t0 -3004($sp)

#------------119  FACTOR_ARRAY CHAR char_local_array [reg[43]] save in reg[44]
   lw $t3 -3004($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3008($sp)

#------------120  FACTOR_CON CHAR 43 save in reg[45]
   li $t0 43
   sw $t0 -3012($sp)

#------------121  FACTOR_ARRAY INT int_local_array [reg[45]] save in reg[46]
   lw $t3 -3012($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3016($sp)

#------------122  FACTOR_CON INT 1 save in reg[47]
   li $t0 1
   sw $t0 -3020($sp)

#------------123  PUSH INT parareg[18] from reg[44]
   sw $ra -3024($sp)
   lw $t0 -3008($sp)
   sw $t0 -3028($sp)

#------------124  PUSH INT parareg[19] from reg[46]
   lw $t0 -3016($sp)
   sw $t0 -3032($sp)

#------------125  PUSH INT parareg[20] from reg[47]
   lw $t0 -3020($sp)
   sw $t0 -3036($sp)

#------------126  CALL CHAR char_func(3)
   addi $sp $sp -3028
   jal .func_char_func
   subi $sp $sp -3028
   lw $ra -3024($sp)

#------------127  FACTOR_CON CHAR 43 save in reg[48]
   li $t0 43
   sw $t0 -3024($sp)

#------------128  FACTOR_ARRAY CHAR char_local_array [reg[48]] save in reg[49]
   lw $t3 -3024($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3028($sp)

#------------129  FACTOR_CON CHAR 43 save in reg[50]
   li $t0 43
   sw $t0 -3032($sp)

#------------130  FACTOR_ARRAY INT int_local_array [reg[50]] save in reg[51]
   lw $t3 -3032($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3036($sp)

#------------131  FACTOR_CON INT 0 save in reg[52]
   li $t0 0
   sw $t0 -3040($sp)

#------------132  PUSH INT parareg[21] from reg[49]
   sw $ra -3044($sp)
   lw $t0 -3028($sp)
   sw $t0 -3048($sp)

#------------133  PUSH INT parareg[22] from reg[51]
   lw $t0 -3036($sp)
   sw $t0 -3052($sp)

#------------134  PUSH INT parareg[23] from reg[52]
   lw $t0 -3040($sp)
   sw $t0 -3056($sp)

#------------135  CALL CHAR char_func(3)
   addi $sp $sp -3048
   jal .func_char_func
   subi $sp $sp -3048
   lw $ra -3044($sp)

#------------136  FACTOR_CON INT 1 save in reg[53]
   li $t0 1
   sw $t0 -3044($sp)

#------------137  FACTOR_ARRAY INT int_local_array [reg[53]] save in reg[54]
   lw $t3 -3044($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3048($sp)

#------------138  FACTOR_CON INT 1 save in reg[55]
   li $t0 1
   sw $t0 -3052($sp)

#------------139  FACTOR_ARRAY CHAR char_local_array [reg[55]] save in reg[56]
   lw $t3 -3052($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3056($sp)

#------------140  PUSH INT parareg[24] from reg[54]
   sw $ra -3060($sp)
   lw $t0 -3048($sp)
   sw $t0 -3064($sp)

#------------141  PUSH INT parareg[25] from reg[56]
   lw $t0 -3056($sp)
   sw $t0 -3068($sp)

#------------142  CALL VOID voidd(2)
   addi $sp $sp -3064
   jal .func_voidd
   subi $sp $sp -3064
   lw $ra -3060($sp)

#------------143  FACTOR_CON CHAR 43 save in reg[57]
   li $t0 43
   sw $t0 -3060($sp)

#------------144  FACTOR_ARRAY CHAR char_local_array [reg[57]] save in reg[58]
   lw $t3 -3060($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3064($sp)

#------------145  FACTOR_CON CHAR 43 save in reg[59]
   li $t0 43
   sw $t0 -3068($sp)

#------------146  FACTOR_ARRAY INT int_local_array [reg[59]] save in reg[60]
   lw $t3 -3068($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3072($sp)

#------------147  PUSH INT parareg[26] from reg[58]
   sw $ra -3076($sp)
   lw $t0 -3064($sp)
   sw $t0 -3080($sp)

#------------148  PUSH INT parareg[27] from reg[60]
   lw $t0 -3072($sp)
   sw $t0 -3084($sp)

#------------149  CALL VOID voidd(2)
   addi $sp $sp -3080
   jal .func_voidd
   subi $sp $sp -3080
   lw $ra -3076($sp)

#------------150  FACTOR_CON INT 1 save in reg[61]
   li $t0 1
   sw $t0 -3076($sp)

#------------151  FACTOR_ARRAY INT int_local_array [reg[61]] save in reg[62]
   lw $t3 -3076($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3080($sp)

#------------152  FACTOR_CON INT 1 save in reg[63]
   li $t0 1
   sw $t0 -3084($sp)

#------------153  FACTOR_ARRAY CHAR char_local_array [reg[63]] save in reg[64]
   lw $t3 -3084($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3088($sp)

#------------154  FACTOR_CON INT 1 save in reg[65]
   li $t0 1
   sw $t0 -3092($sp)

#------------155  PUSH INT parareg[28] from reg[62]
   sw $ra -3096($sp)
   lw $t0 -3080($sp)
   sw $t0 -3100($sp)

#------------156  PUSH INT parareg[29] from reg[64]
   lw $t0 -3088($sp)
   sw $t0 -3104($sp)

#------------157  PUSH INT parareg[30] from reg[65]
   lw $t0 -3092($sp)
   sw $t0 -3108($sp)

#------------158  CALL CHAR char_func(3)
   addi $sp $sp -3100
   jal .func_char_func
   subi $sp $sp -3100
   lw $ra -3096($sp)

#------------159  FACTOR_FUNC CHAR char_func save in reg[66]
   sw $v0 -3096($sp)

#------------160  WRITE CHAR reg[66]
   li $v0 11
   lw $a0 -3096($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall


#------------162  FACTOR_CON INT 43 save in reg[68]
   li $t0 43
   sw $t0 -3104($sp)

#------------163  FACTOR_ARRAY CHAR char_local_array [reg[68]] save in reg[69]
   lw $t3 -3104($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3108($sp)

#------------164  FACTOR_CON CHAR 43 save in reg[70]
   li $t0 43
   sw $t0 -3112($sp)

#------------165  FACTOR_ARRAY INT int_local_array [reg[70]] save in reg[71]
   lw $t3 -3112($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3116($sp)

#------------166  FACTOR_CON INT 0 save in reg[72]
   li $t0 0
   sw $t0 -3120($sp)

#------------167  PUSH INT parareg[31] from reg[69]
   sw $ra -3124($sp)
   lw $t0 -3108($sp)
   sw $t0 -3128($sp)

#------------168  PUSH INT parareg[32] from reg[71]
   lw $t0 -3116($sp)
   sw $t0 -3132($sp)

#------------169  PUSH INT parareg[33] from reg[72]
   lw $t0 -3120($sp)
   sw $t0 -3136($sp)

#------------170  CALL CHAR char_func(3)
   addi $sp $sp -3128
   jal .func_char_func
   subi $sp $sp -3128
   lw $ra -3124($sp)

#------------171  FACTOR_FUNC CHAR char_func save in reg[73]
   sw $v0 -3124($sp)

#------------172  FACTOR_EXPR reg[73] save in reg[74]
   lw $t0 -3124($sp)
   sw $t0 -3128($sp)

#------------173  WRITE INT reg[74]
   li $v0 1
   lw $a0 -3128($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------174  FACTOR_CON INT 1 save in reg[75]
   li $t0 1
   sw $t0 -3132($sp)

#------------175  FACTOR_ARRAY_EXTERN INT int_global_array [reg[75]] save in reg[76]
   lw $t3 -3132($sp)
   sll $t3 $t3 2
   lw $t3 .var_int_global_array($t3)
   sw $t3 -3136($sp)

#------------176  FACTOR_CON INT 1 save in reg[77]
   li $t0 1
   sw $t0 -3140($sp)

#------------177  FACTOR_ARRAY CHAR char_local_array [reg[77]] save in reg[78]
   lw $t3 -3140($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3144($sp)

#------------178  IF reg[76] BNE reg[78] THEN GOTO label_4
   lw $t0 -3136($sp)
   lw $t1 -3144($sp)
    bne $t0 $t1 label_4

#------------179  FACTOR_CON CHAR 43 save in reg[79]
   li $t0 43
   sw $t0 -3148($sp)

#------------180  FACTOR_ARRAY CHAR char_local_array [reg[79]] save in reg[80]
   lw $t3 -3148($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -36($t3)
   sw $t3 -3152($sp)

#------------181  FACTOR_CON CHAR 43 save in reg[81]
   li $t0 43
   sw $t0 -3156($sp)

#------------182  FACTOR_ARRAY INT int_local_array [reg[81]] save in reg[82]
   lw $t3 -3156($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -3160($sp)

#------------183  FACTOR_CON INT 1 save in reg[83]
   li $t0 1
   sw $t0 -3164($sp)

#------------184  PUSH INT parareg[34] from reg[80]
   sw $ra -3168($sp)
   lw $t0 -3152($sp)
   sw $t0 -3172($sp)

#------------185  PUSH INT parareg[35] from reg[82]
   lw $t0 -3160($sp)
   sw $t0 -3176($sp)

#------------186  PUSH INT parareg[36] from reg[83]
   lw $t0 -3164($sp)
   sw $t0 -3180($sp)

#------------187  CALL CHAR char_func(3)
   addi $sp $sp -3172
   jal .func_char_func
   subi $sp $sp -3172
   lw $ra -3168($sp)

#------------188  JUMP to label_5
   j label_5

#------------189  label_4    ----------------Label----------------
label_4:

#------------190  label_5    ----------------Label----------------
label_5:

#------------191  FACTOR_VAR_EXTERN INT int_global_var save in reg[84]
   lw $t3 .var_int_global_var
   sw $t3 -3168($sp)

#------------192  FACTOR_CON CHAR 43 save in reg[85]
   li $t0 43
   sw $t0 -3172($sp)

#------------193  IF reg[84] BNE reg[85] THEN GOTO label_6
   lw $t0 -3168($sp)
   lw $t1 -3172($sp)
    bne $t0 $t1 label_6

#------------194  JUMP to label_7
   j label_7

#------------195  label_6    ----------------Label----------------
label_6:

#------------196  label_7    ----------------Label----------------
label_7:

#------------197  FACTOR_VAR_EXTERN INT int_global_var save in reg[86]
   lw $t3 .var_int_global_var
   sw $t3 -3176($sp)

#------------198  FACTOR_CON INT 1 save in reg[87]
   li $t0 1
   sw $t0 -3180($sp)

#------------199  IF reg[86] BNE reg[87] THEN GOTO label_8
   lw $t0 -3176($sp)
   lw $t1 -3180($sp)
    bne $t0 $t1 label_8

#------------200  JUMP to label_9
   j label_9

#------------201  label_8    ----------------Label----------------
label_8:

#------------202  label_9    ----------------Label----------------
label_9:

#------------203  FACTOR_CON INT 1 save in reg[88]
   li $t0 1
   sw $t0 -3184($sp)

#------------204  FACTOR_CON INT 1 save in reg[89]
   li $t0 1
   sw $t0 -3188($sp)

#------------205  ASSIGN_ARR INT int_local_array[reg[88]] = reg[89]
   lw $t0 -3184($sp)
   lw $t1 -3188($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------206  FACTOR_CON INT 1 save in reg[90]
   li $t0 1
   sw $t0 -3192($sp)

#------------207  FACTOR_CON CHAR 43 save in reg[91]
   li $t0 43
   sw $t0 -3196($sp)

#------------208  ASSIGN_ARR INT int_local_array[reg[90]] = reg[91]
   lw $t0 -3192($sp)
   lw $t1 -3196($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------209  FACTOR_CON CHAR 43 save in reg[92]
   li $t0 43
   sw $t0 -3200($sp)

#------------210  FACTOR_CON CHAR 43 save in reg[93]
   li $t0 43
   sw $t0 -3204($sp)

#------------211  ASSIGN_ARR CHAR char_local_array[reg[92]] = reg[93]
   lw $t0 -3200($sp)
   lw $t1 -3204($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -36($t0)


#------------213  FACTOR_CON INT 43 save in reg[95]
   li $t0 43
   sw $t0 -3212($sp)

#------------214  FACTOR_CON CHAR 43 save in reg[96]
   li $t0 43
   sw $t0 -3216($sp)

#------------215  ASSIGN_ARR INT int_local_array[reg[95]] = reg[96]
   lw $t0 -3212($sp)
   lw $t1 -3216($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------216  FACTOR_CON CHAR 49 save in reg[97]
   li $t0 49
   sw $t0 -3220($sp)

#------------217  ASSIGN INT int_local_var = reg[97]
   lw $t3 -3220($sp)
   sw $t3 0($sp)

#------------218  label_10    ----------------Label----------------
label_10:

#------------219  FACTOR_VAR INT int_local_var save in reg[98]
   lw $t3 0($sp)
   sw $t3 -3224($sp)

#------------220  FACTOR_CON INT 1 save in reg[99]
   li $t0 1
   sw $t0 -3228($sp)

#------------221  reg[100] = reg[98] JIA reg[99]
   lw $t0 -3224($sp)
   lw $t1 -3228($sp)
   add $t2 $t0 $t1
   sw $t2 -3232($sp)

#------------222  ASSIGN INT int_local_var = reg[100]
   lw $t3 -3232($sp)
   sw $t3 0($sp)

#------------223  FACTOR_VAR_EXTERN INT int_global_var save in reg[101]
   lw $t3 .var_int_global_var
   sw $t3 -3236($sp)

#------------224  FACTOR_CON INT 1 save in reg[102]
   li $t0 1
   sw $t0 -3240($sp)

#------------225  IF reg[101] BEQ reg[102] THEN GOTO label_10
   lw $t0 -3236($sp)
   lw $t1 -3240($sp)
    beq $t0 $t1 label_10

#------------226  FACTOR_CON CHAR 49 save in reg[103]
   li $t0 49
   sw $t0 -3244($sp)

#------------227  ASSIGN INT char_local_var = reg[103]
   lw $t3 -3244($sp)
   sw $t3 -32($sp)

#------------228  label_11    ----------------Label----------------
label_11:

#------------229  FACTOR_VAR INT char_local_var save in reg[104]
   lw $t3 -32($sp)
   sw $t3 -3248($sp)

#------------230  FACTOR_CON INT 1 save in reg[105]
   li $t0 1
   sw $t0 -3252($sp)

#------------231  reg[106] = reg[104] JIA reg[105]
   lw $t0 -3248($sp)
   lw $t1 -3252($sp)
   add $t2 $t0 $t1
   sw $t2 -3256($sp)

#------------232  ASSIGN INT char_local_var = reg[106]
   lw $t3 -3256($sp)
   sw $t3 -32($sp)

#------------233  FACTOR_VAR_EXTERN CHAR char_global_var save in reg[107]
   lw $t3 .var_char_global_var
   sw $t3 -3260($sp)

#------------234  FACTOR_CON CHAR 43 save in reg[108]
   li $t0 43
   sw $t0 -3264($sp)

#------------235  IF reg[107] BEQ reg[108] THEN GOTO label_11
   lw $t0 -3260($sp)
   lw $t1 -3264($sp)
    beq $t0 $t1 label_11

   jr $ra

end:
