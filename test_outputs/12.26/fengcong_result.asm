.data
   .str_0: .asciiz ""
   .str_1: .asciiz "1"
   .str_2: .asciiz "\\n\\t\\f\\r\\\\\\'\\a\\b"
   .str_3: .asciiz " !#$%&'()*+,-./"
   .str_4: .asciiz "0123456789:;<=>?"
   .str_5: .asciiz "@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
   .str_6: .asciiz "[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
   .str_7: .asciiz "Deeply Nested ParenExpr"
   .str_8: .asciiz "SingleString"
   .str_9: .asciiz "StringAndExpression"
   .str_10: .asciiz "Incremental for"
   .str_11: .asciiz "I = "
   .str_12: .asciiz "Decremental for"
   .str_13: .asciiz "for: execute only once"
   .str_14: .asciiz "Incremental while"
   .str_15: .asciiz "Decremental while"
   .str_16: .asciiz "Never while"
   .str_17: .asciiz "if if if"
   .str_18: .asciiz "if if else"
   .str_19: .asciiz "if else"
   .str_20: .asciiz "else"
   .str_21: .asciiz "while while while"
   .str_22: .asciiz "while while if"
   .str_23: .asciiz "while while if for"
   .str_24: .asciiz "while for for for"
   .str_25: .asciiz "while for for for if"
   .str_26: .asciiz "while"
   .str_27: .asciiz "while if"
   .str_28: .asciiz "while if while while for"
   .str_29: .asciiz "CompareEqual: "
   .str_30: .asciiz "CompareNotEqual: "
   .str_31: .asciiz "CompareLess: "
   .str_32: .asciiz "CompareLessEqual: "
   .str_33: .asciiz "CompareGreater: "
   .str_34: .asciiz "CompareGreaterEqual: "
   .str_35: .asciiz "Unknown CompareOp: "
   .str_36: .asciiz "Please input three integers: A, B and CompareOp"
   .str_37: .asciiz "where CompareOp are:"
   .str_38: .asciiz "Result: "
.text
   jal .func_main
   j end
#------------6  FUNC VOID tokentest_string(0)
.func_tokentest_string:

#------------7  WRITE 
   li $v0 4
   la $a0 .str_0
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------8  WRITE 1
   li $v0 4
   la $a0 .str_1
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------9  WRITE \n\t\f\r\\\'\a\b
   li $v0 4
   la $a0 .str_2
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------10  WRITE  !#$%&'()*+,-./
   li $v0 4
   la $a0 .str_3
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------11  WRITE 0123456789:;<=>?
   li $v0 4
   la $a0 .str_4
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------12  WRITE @ABCDEFGHIJKLMNOPQRSTUVWXYZ
   li $v0 4
   la $a0 .str_5
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------13  WRITE [\]^_`abcdefghijklmnopqrstuvwxyz{|}~
   li $v0 4
   la $a0 .str_6
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------14  FUNC VOID tokentest_number(0)
   jr $ra

.func_tokentest_number:

#------------15  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------16  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------17  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------18  WRITE INT reg[2]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------19  FACTOR_CON INT 123456 save in reg[3]
   li $t0 123456
   sw $t0 -8($sp)

#------------20  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------23  FACTOR_CON INT 0 save in reg[6]
   li $t0 0
   sw $t0 -20($sp)

#------------24  WRITE INT reg[6]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------25  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -24($sp)

#------------26  WRITE INT reg[7]
   li $v0 1
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------27  FACTOR_CON INT 12345 save in reg[8]
   li $t0 12345
   sw $t0 -28($sp)

#------------28  WRITE INT reg[8]
   li $v0 1
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------31  FACTOR_CON INT -12345 save in reg[11]
   li $t0 -12345
   sw $t0 -40($sp)

#------------32  WRITE INT reg[11]
   li $v0 1
   lw $a0 -40($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------33  FUNC VOID tokentest_character(0)
   jr $ra

.func_tokentest_character:

#------------34  FACTOR_CON CHAR 43 save in reg[1]
   li $t0 43
   sw $t0 0($sp)

#------------35  WRITE CHAR reg[1]
   li $v0 11
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------36  FACTOR_CON CHAR 45 save in reg[2]
   li $t0 45
   sw $t0 -4($sp)

#------------37  WRITE CHAR reg[2]
   li $v0 11
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------38  FACTOR_CON CHAR 42 save in reg[3]
   li $t0 42
   sw $t0 -8($sp)

#------------39  WRITE CHAR reg[3]
   li $v0 11
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------40  FACTOR_CON CHAR 47 save in reg[4]
   li $t0 47
   sw $t0 -12($sp)

#------------41  WRITE CHAR reg[4]
   li $v0 11
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------42  FACTOR_CON CHAR 97 save in reg[5]
   li $t0 97
   sw $t0 -16($sp)

#------------43  WRITE CHAR reg[5]
   li $v0 11
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------44  FACTOR_CON CHAR 98 save in reg[6]
   li $t0 98
   sw $t0 -20($sp)

#------------45  WRITE CHAR reg[6]
   li $v0 11
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------46  FACTOR_CON CHAR 99 save in reg[7]
   li $t0 99
   sw $t0 -24($sp)

#------------47  WRITE CHAR reg[7]
   li $v0 11
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------48  FACTOR_CON CHAR 100 save in reg[8]
   li $t0 100
   sw $t0 -28($sp)

#------------49  WRITE CHAR reg[8]
   li $v0 11
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------50  FACTOR_CON CHAR 48 save in reg[9]
   li $t0 48
   sw $t0 -32($sp)

#------------51  WRITE CHAR reg[9]
   li $v0 11
   lw $a0 -32($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------52  FACTOR_CON CHAR 49 save in reg[10]
   li $t0 49
   sw $t0 -36($sp)

#------------53  WRITE CHAR reg[10]
   li $v0 11
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------54  FACTOR_CON CHAR 50 save in reg[11]
   li $t0 50
   sw $t0 -40($sp)

#------------55  WRITE CHAR reg[11]
   li $v0 11
   lw $a0 -40($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------56  FACTOR_CON CHAR 51 save in reg[12]
   li $t0 51
   sw $t0 -44($sp)

#------------57  WRITE CHAR reg[12]
   li $v0 11
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------58  FUNC VOID tokentest_identifier(0)
   jr $ra

.func_tokentest_identifier:

#------------59  CONST INT _underscorelead = 1

#------------60  CONST INT underscoretail_ = 2

#------------61  CONST INT oneapple_2banana_3pineapple = 3

#------------62  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------63  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------64  FACTOR_CON INT 2 save in reg[2]
   li $t0 2
   sw $t0 -4($sp)

#------------65  WRITE INT reg[2]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------66  FACTOR_CON INT 3 save in reg[3]
   li $t0 3
   sw $t0 -8($sp)

#------------67  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------68  FUNC VOID tokentest_caseignored(0)
   jr $ra

.func_tokentest_caseignored:

#------------69  CONST INT all_upper_int_constant = 1

#------------70  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------71  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------72  FUNC VOID test_binop(0)
   jr $ra

.func_test_binop:

#------------73  CONST INT intconstant = 1

#------------74  CONST CHAR charconstant = 97



#------------77  FACTOR_CON INT 98 save in reg[3]
   li $t0 98
   sw $t0 -8($sp)

#------------78  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------81  FACTOR_CON INT -96 save in reg[6]
   li $t0 -96
   sw $t0 -20($sp)

#------------82  WRITE INT reg[6]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------85  FACTOR_CON INT 97 save in reg[9]
   li $t0 97
   sw $t0 -32($sp)

#------------86  WRITE INT reg[9]
   li $v0 1
   lw $a0 -32($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------89  FACTOR_CON INT 0 save in reg[12]
   li $t0 0
   sw $t0 -44($sp)

#------------90  WRITE INT reg[12]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------91  FUNC VOID test_parenexpr(0)
   jr $ra

.func_test_parenexpr:










#------------101  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -36($sp)

#------------102  WRITE Deeply Nested ParenExpr
   li $v0 4
   la $a0 .str_7
   syscall

#------------103  WRITE INT reg[10]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

























#------------128  FACTOR_CON INT -6 save in reg[35]
   li $t0 -6
   sw $t0 -136($sp)

#------------129  WRITE INT reg[35]
   li $v0 1
   lw $a0 -136($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------130  FUNC VOID test_unaryop(0)
   jr $ra

.func_test_unaryop:

#------------131  CONST INT intconstant = 1

#------------132  CONST CHAR charconstant = 97



#------------135  FACTOR_CON INT -1 save in reg[3]
   li $t0 -1
   sw $t0 -8($sp)

#------------136  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------137  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -12($sp)

#------------138  WRITE INT reg[4]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------141  FACTOR_CON INT -97 save in reg[7]
   li $t0 -97
   sw $t0 -24($sp)

#------------142  WRITE INT reg[7]
   li $v0 1
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------143  FACTOR_CON CHAR 97 save in reg[8]
   li $t0 97
   sw $t0 -28($sp)

#------------144  WRITE CHAR reg[8]
   li $v0 11
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall






#------------150  FACTOR_CON INT 1 save in reg[14]
   li $t0 1
   sw $t0 -52($sp)

#------------151  WRITE INT reg[14]
   li $v0 1
   lw $a0 -52($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall


#------------153  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -60($sp)

#------------154  WRITE INT reg[16]
   li $v0 1
   lw $a0 -60($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall










#------------164  FACTOR_CON INT -1 save in reg[26]
   li $t0 -1
   sw $t0 -100($sp)

#------------165  WRITE INT reg[26]
   li $v0 1
   lw $a0 -100($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------166  FUNC VOID test_subscript(0)
   jr $ra

.func_test_subscript:

#------------167  ARRAY INT intarray[2]

#------------168  ARRAY CHAR chararray[2]

#------------169  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -16($sp)

#------------170  FACTOR_ARRAY INT intarray [reg[1]] save in reg[2]
   lw $t3 -16($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -20($sp)

#------------171  WRITE INT reg[2]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------172  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -24($sp)

#------------173  FACTOR_ARRAY CHAR chararray [reg[3]] save in reg[4]
   lw $t3 -24($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -8($t3)
   sw $t3 -28($sp)

#------------174  WRITE CHAR reg[4]
   li $v0 11
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------175  FUNC VOID test_functionvoid_void(0)
   jr $ra

.func_test_functionvoid_void:

#------------176  FUNC INT test_functionint_int(1)
   jr $ra

.func_test_functionint_int:

#------------177  PARA INT int1

#------------178  FACTOR_VAR INT int1 save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------179  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -4($sp)
   jr $ra

#------------180  FUNC CHAR test_functionchar_intchar(2)
   jr $ra

.func_test_functionchar_intchar:

#------------181  PARA INT int1

#------------182  PARA CHAR char2

#------------183  FACTOR_VAR CHAR char2 save in reg[1]
   lw $t3 -4($sp)
   sw $t3 -8($sp)

#------------184  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -8($sp)
   jr $ra

#------------185  FUNC INT test_functionint_charcharchar(3)
   jr $ra

.func_test_functionint_charcharchar:

#------------186  PARA CHAR char1

#------------187  PARA CHAR char2

#------------188  PARA CHAR char3

#------------189  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------190  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------191  FUNC VOID test_call(0)
   jr $ra

.func_test_call:

#------------192  CALL VOID test_functionvoid_void(0)
   sw $ra 0($sp)
   addi $sp $sp -4
   jal .func_test_functionvoid_void
   subi $sp $sp -4
   lw $ra 0($sp)

#------------193  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------194  PUSH INT parareg[0] from reg[1]
   sw $ra -4($sp)
   lw $t0 0($sp)
   sw $t0 -8($sp)

#------------195  CALL INT test_functionint_int(1)
   addi $sp $sp -8
   jal .func_test_functionint_int
   subi $sp $sp -8
   lw $ra -4($sp)

#------------196  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------197  FACTOR_CON CHAR 97 save in reg[3]
   li $t0 97
   sw $t0 -8($sp)

#------------198  PUSH INT parareg[1] from reg[2]
   sw $ra -12($sp)
   lw $t0 -4($sp)
   sw $t0 -16($sp)

#------------199  PUSH INT parareg[2] from reg[3]
   lw $t0 -8($sp)
   sw $t0 -20($sp)

#------------200  CALL CHAR test_functionchar_intchar(2)
   addi $sp $sp -16
   jal .func_test_functionchar_intchar
   subi $sp $sp -16
   lw $ra -12($sp)

#------------201  FACTOR_CON CHAR 97 save in reg[4]
   li $t0 97
   sw $t0 -12($sp)

#------------202  FACTOR_CON CHAR 98 save in reg[5]
   li $t0 98
   sw $t0 -16($sp)

#------------203  FACTOR_CON CHAR 99 save in reg[6]
   li $t0 99
   sw $t0 -20($sp)

#------------204  PUSH INT parareg[3] from reg[4]
   sw $ra -24($sp)
   lw $t0 -12($sp)
   sw $t0 -28($sp)

#------------205  PUSH INT parareg[4] from reg[5]
   lw $t0 -16($sp)
   sw $t0 -32($sp)

#------------206  PUSH INT parareg[5] from reg[6]
   lw $t0 -20($sp)
   sw $t0 -36($sp)

#------------207  CALL INT test_functionint_charcharchar(3)
   addi $sp $sp -28
   jal .func_test_functionint_charcharchar
   subi $sp $sp -28
   lw $ra -24($sp)

#------------208  FUNC VOID test_expr(0)
   jr $ra

.func_test_expr:

#------------209  VAR INT singleintvariable

#------------210  ARRAY INT intarray[2]

#------------211  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------212  ASSIGN INT singleintvariable = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------213  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -16($sp)

#------------214  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -20($sp)

#------------215  ASSIGN_ARR INT intarray[reg[2]] = reg[3]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------216  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -24($sp)

#------------217  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -28($sp)

#------------218  ASSIGN_ARR INT intarray[reg[4]] = reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------219  FACTOR_VAR INT singleintvariable save in reg[6]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------220  FACTOR_VAR INT singleintvariable save in reg[7]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------221  FACTOR_CON INT 2 save in reg[8]
   li $t0 2
   sw $t0 -40($sp)

#------------222  reg[9] = reg[7] JIAN reg[8]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   sub $t2 $t0 $t1
   sw $t2 -44($sp)

#------------223  FACTOR_EXPR reg[9] save in reg[10]
   lw $t0 -44($sp)
   sw $t0 -48($sp)

#------------224  FACTOR_VAR INT singleintvariable save in reg[11]
   lw $t3 0($sp)
   sw $t3 -52($sp)

#------------225  FACTOR_VAR INT singleintvariable save in reg[12]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------226  FACTOR_ARRAY INT intarray [reg[12]] save in reg[13]
   lw $t3 -56($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -60($sp)

#------------227  FACTOR_ARRAY INT intarray [reg[13]] save in reg[14]
   lw $t3 -60($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -64($sp)

#------------228  reg[15] = reg[11] JIA reg[14]
   lw $t0 -52($sp)
   lw $t1 -64($sp)
   add $t2 $t0 $t1
   sw $t2 -68($sp)

#------------229  FACTOR_EXPR reg[15] save in reg[16]
   lw $t0 -68($sp)
   sw $t0 -72($sp)

#------------230  FACTOR_VAR INT singleintvariable save in reg[17]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------231  FACTOR_ARRAY INT intarray [reg[17]] save in reg[18]
   lw $t3 -76($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -80($sp)

#------------232  reg[19] = reg[16] JIA reg[18]
   lw $t0 -72($sp)
   lw $t1 -80($sp)
   add $t2 $t0 $t1
   sw $t2 -84($sp)

#------------233  FACTOR_EXPR reg[19] save in reg[20]
   lw $t0 -84($sp)
   sw $t0 -88($sp)

#------------234  reg[21] = reg[10] CHU reg[20]
   lw $t0 -48($sp)
   lw $t1 -88($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -92($sp)

#------------235  FACTOR_EXPR reg[21] save in reg[22]
   lw $t0 -92($sp)
   sw $t0 -96($sp)

#------------236  reg[23] = reg[6] CHENG reg[22]
   lw $t0 -32($sp)
   lw $t1 -96($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -100($sp)

#------------237  FACTOR_EXPR reg[23] save in reg[24]
   lw $t0 -100($sp)
   sw $t0 -104($sp)

#------------238  WRITE INT reg[24]
   li $v0 1
   lw $a0 -104($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------239  FACTOR_VAR INT singleintvariable save in reg[25]
   lw $t3 0($sp)
   sw $t3 -108($sp)

#------------240  FACTOR_CON INT 1 save in reg[26]
   li $t0 1
   sw $t0 -112($sp)

#------------241  reg[27] = reg[25] JIA reg[26]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   add $t2 $t0 $t1
   sw $t2 -116($sp)

#------------242  FACTOR_EXPR reg[27] save in reg[28]
   lw $t0 -116($sp)
   sw $t0 -120($sp)

#------------243  FACTOR_VAR INT singleintvariable save in reg[29]
   lw $t3 0($sp)
   sw $t3 -124($sp)

#------------244  FACTOR_CON INT 2 save in reg[30]
   li $t0 2
   sw $t0 -128($sp)

#------------245  reg[31] = reg[29] CHENG reg[30]
   lw $t0 -124($sp)
   lw $t1 -128($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -132($sp)

#------------246  FACTOR_ARRAY INT intarray [reg[31]] save in reg[32]
   lw $t3 -132($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -136($sp)

#------------247  FACTOR_CON INT 2 save in reg[33]
   li $t0 2
   sw $t0 -140($sp)

#------------248  reg[34] = reg[32] CHENG reg[33]
   lw $t0 -136($sp)
   lw $t1 -140($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -144($sp)

#------------249  FACTOR_EXPR reg[34] save in reg[35]
   lw $t0 -144($sp)
   sw $t0 -148($sp)

#------------250  reg[36] = reg[28] CHENG reg[35]
   lw $t0 -120($sp)
   lw $t1 -148($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -152($sp)

#------------251  WRITE INT reg[36]
   li $v0 1
   lw $a0 -152($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------252  FACTOR_CON INT 0 save in reg[37]
   li $t0 0
   sw $t0 -156($sp)

#------------253  FACTOR_VAR INT singleintvariable save in reg[38]
   lw $t3 0($sp)
   sw $t3 -160($sp)

#------------254  FACTOR_VAR INT singleintvariable save in reg[39]
   lw $t3 0($sp)
   sw $t3 -164($sp)

#------------255  reg[40] = reg[38] CHENG reg[39]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -168($sp)

#------------256  FACTOR_VAR INT singleintvariable save in reg[41]
   lw $t3 0($sp)
   sw $t3 -172($sp)

#------------257  reg[42] = reg[40] CHENG reg[41]
   lw $t0 -168($sp)
   lw $t1 -172($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -176($sp)

#------------258  FACTOR_EXPR reg[42] save in reg[43]
   lw $t0 -176($sp)
   sw $t0 -180($sp)

#------------259  reg[44] = reg[37] CHENG reg[43]
   lw $t0 -156($sp)
   lw $t1 -180($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -184($sp)

#------------260  FACTOR_ARRAY INT intarray [reg[44]] save in reg[45]
   lw $t3 -184($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -188($sp)

#------------261  WRITE INT reg[45]
   li $v0 1
   lw $a0 -188($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------262  FACTOR_CON INT 0 save in reg[46]
   li $t0 0
   sw $t0 -192($sp)

#------------263  FACTOR_VAR INT singleintvariable save in reg[47]
   lw $t3 0($sp)
   sw $t3 -196($sp)

#------------264  FACTOR_ARRAY INT intarray [reg[47]] save in reg[48]
   lw $t3 -196($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -200($sp)

#------------265  FACTOR_CON INT 4 save in reg[49]
   li $t0 4
   sw $t0 -204($sp)

#------------266  reg[50] = reg[48] CHENG reg[49]
   lw $t0 -200($sp)
   lw $t1 -204($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -208($sp)

#------------267  FACTOR_EXPR reg[50] save in reg[51]
   lw $t0 -208($sp)
   sw $t0 -212($sp)

#------------268  reg[52] = reg[46] CHENG reg[51]
   lw $t0 -192($sp)
   lw $t1 -212($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -216($sp)

#------------269  FACTOR_VAR INT singleintvariable save in reg[53]
   lw $t3 0($sp)
   sw $t3 -220($sp)

#------------270  reg[54] = reg[52] JIA reg[53]
   lw $t0 -216($sp)
   lw $t1 -220($sp)
   add $t2 $t0 $t1
   sw $t2 -224($sp)

#------------271  FACTOR_VAR INT singleintvariable save in reg[55]
   lw $t3 0($sp)
   sw $t3 -228($sp)

#------------272  reg[56] = reg[54] JIAN reg[55]
   lw $t0 -224($sp)
   lw $t1 -228($sp)
   sub $t2 $t0 $t1
   sw $t2 -232($sp)

#------------273  FACTOR_ARRAY INT intarray [reg[56]] save in reg[57]
   lw $t3 -232($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -236($sp)

#------------274  WRITE INT reg[57]
   li $v0 1
   lw $a0 -236($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------275  FUNC VOID test_empty(0)
   jr $ra

.func_test_empty:

#------------276  VAR INT i

#------------277  label_0    ----------------Label----------------
label_0:

#------------278  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -4($sp)

#------------279  IF reg[1] BEQ reg[0] THEN GOTO label_1
   lw $t0 -4($sp)
    beq $t0 $0 label_1

#------------280  JUMP to label_0
   j label_0

#------------281  label_1    ----------------Label----------------
label_1:

#------------282  label_2    ----------------Label----------------
label_2:

#------------283  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -8($sp)

#------------284  IF reg[2] BEQ reg[0] THEN GOTO label_3
   lw $t0 -8($sp)
    beq $t0 $0 label_3

#------------285  JUMP to label_2
   j label_2

#------------286  label_3    ----------------Label----------------
label_3:

#------------287  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------288  IF reg[3] BEQ reg[0] THEN GOTO label_4
   lw $t0 -12($sp)
    beq $t0 $0 label_4

#------------289  JUMP to label_5
   j label_5

#------------290  label_4    ----------------Label----------------
label_4:

#------------291  label_5    ----------------Label----------------
label_5:

#------------292  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -16($sp)

#------------293  IF reg[4] BEQ reg[0] THEN GOTO label_6
   lw $t0 -16($sp)
    beq $t0 $0 label_6

#------------294  JUMP to label_7
   j label_7

#------------295  label_6    ----------------Label----------------
label_6:

#------------296  label_7    ----------------Label----------------
label_7:

#------------297  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -20($sp)

#------------298  ASSIGN INT i = reg[5]
   lw $t3 -20($sp)
   sw $t3 0($sp)

#------------299  label_8    ----------------Label----------------
label_8:

#------------300  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------301  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -28($sp)

#------------302  reg[8] = reg[6] JIA reg[7]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -32($sp)

#------------303  ASSIGN INT i = reg[8]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------304  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------305  IF reg[9] BNE reg[0] THEN GOTO label_8
   lw $t0 -36($sp)
    bne $t0 $0 label_8

#------------306  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -40($sp)

#------------307  ASSIGN INT i = reg[10]
   lw $t3 -40($sp)
   sw $t3 0($sp)

#------------308  label_9    ----------------Label----------------
label_9:

#------------309  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------310  FACTOR_CON INT 1 save in reg[12]
   li $t0 1
   sw $t0 -48($sp)

#------------311  reg[13] = reg[11] JIA reg[12]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   add $t2 $t0 $t1
   sw $t2 -52($sp)

#------------312  ASSIGN INT i = reg[13]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------313  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------314  IF reg[14] BNE reg[0] THEN GOTO label_9
   lw $t0 -56($sp)
    bne $t0 $0 label_9

#------------315  FUNC VOID test_read(0)
   jr $ra

.func_test_read:

#------------316  VAR INT singleintvariable

#------------317  VAR CHAR singlecharvariable

#------------318  VAR INT _1

#------------319  VAR INT _2

#------------320  VAR INT _3

#------------321  VAR CHAR _4

#------------322  VAR CHAR _5

#------------323  VAR CHAR _6

#------------324  READ INT singleintvariable
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------325  READ CHAR singlecharvariable
   li $v0 12
   syscall
   sw $v0 -4($sp)

#------------326  READ INT _1
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------327  READ INT _2
   li $v0 5
   syscall
   sw $v0 -12($sp)

#------------328  READ INT _3
   li $v0 5
   syscall
   sw $v0 -16($sp)

#------------329  READ CHAR _4
   li $v0 12
   syscall
   sw $v0 -20($sp)

#------------330  READ CHAR _5
   li $v0 12
   syscall
   sw $v0 -24($sp)

#------------331  READ CHAR _6
   li $v0 12
   syscall
   sw $v0 -28($sp)

#------------332  FUNC VOID test_write(0)
   jr $ra

.func_test_write:

#------------333  CONST INT intconstant = 1

#------------334  ARRAY INT intarray[2]

#------------335  WRITE SingleString
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------336  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -8($sp)

#------------337  FACTOR_ARRAY INT intarray [reg[1]] save in reg[2]
   lw $t3 -8($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -12($sp)

#------------338  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -16($sp)

#------------339  FACTOR_ARRAY INT intarray [reg[3]] save in reg[4]
   lw $t3 -16($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -20($sp)

#------------340  reg[5] = reg[2] JIA reg[4]
   lw $t0 -12($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------341  WRITE INT reg[5]
   li $v0 1
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------342  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -28($sp)

#------------343  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -32($sp)

#------------344  FACTOR_ARRAY INT intarray [reg[7]] save in reg[8]
   lw $t3 -32($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -36($sp)

#------------345  FACTOR_ARRAY INT intarray [reg[8]] save in reg[9]
   lw $t3 -36($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -40($sp)

#------------346  reg[10] = reg[6] CHENG reg[9]
   lw $t0 -28($sp)
   lw $t1 -40($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -44($sp)

#------------347  WRITE StringAndExpression
   li $v0 4
   la $a0 .str_9
   syscall

#------------348  WRITE INT reg[10]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------349  FUNC VOID test_return_void(0)
   jr $ra

.func_test_return_void:

#------------350  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 4($sp)
   jr $ra

#------------351  FUNC CHAR test_return_char(0)
   jr $ra

.func_test_return_char:

#------------352  CONST CHAR charconstant = 97

#------------353  ARRAY CHAR chararray[2]

#------------354  VAR CHAR charvariable

#------------355  FACTOR_VAR CHAR charvariable save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------356  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------357  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -16($sp)

#------------358  FACTOR_ARRAY CHAR chararray [reg[2]] save in reg[3]
   lw $t3 -16($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -20($sp)

#------------359  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------360  FACTOR_CON CHAR 97 save in reg[4]
   li $t0 97
   sw $t0 -24($sp)

#------------361  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------362  CALL CHAR test_return_char(0)
   sw $ra -28($sp)
   addi $sp $sp -32
   jal .func_test_return_char
   subi $sp $sp -32
   lw $ra -28($sp)

#------------363  FACTOR_FUNC CHAR test_return_char save in reg[5]
   sw $v0 -28($sp)

#------------364  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------365  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -32($sp)

#------------366  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -32($sp)
   jr $ra

#------------367  FUNC INT test_return_int(0)
   jr $ra

.func_test_return_int:

#------------368  CONST INT intconstant = 1

#------------369  ARRAY INT intarray[2]

#------------370  VAR INT intvariable

#------------371  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------372  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------373  FACTOR_VAR INT intvariable save in reg[2]
   lw $t3 -8($sp)
   sw $t3 -16($sp)

#------------374  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------375  CALL INT test_return_int(0)
   sw $ra -20($sp)
   addi $sp $sp -24
   jal .func_test_return_int
   subi $sp $sp -24
   lw $ra -20($sp)

#------------376  FACTOR_FUNC INT test_return_int save in reg[3]
   sw $v0 -20($sp)

#------------377  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------378  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -24($sp)

#------------379  FACTOR_ARRAY INT intarray [reg[4]] save in reg[5]
   lw $t3 -24($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -28($sp)

#------------380  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------381  FACTOR_VAR INT intvariable save in reg[6]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------382  FACTOR_EXPR reg[6] save in reg[7]
   lw $t0 -32($sp)
   sw $t0 -36($sp)

#------------383  FACTOR_ARRAY INT intarray [reg[7]] save in reg[8]
   lw $t3 -36($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -40($sp)

#------------384  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------385  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -44($sp)

#------------386  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------387  FUNC VOID test_compound_empty(0)
   jr $ra

.func_test_compound_empty:

#------------388  FUNC VOID test_compound_noconstdecl(0)
   jr $ra

.func_test_compound_noconstdecl:

#------------389  VAR INT intvariable

#------------390  FACTOR_VAR INT intvariable save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------391  WRITE INT reg[1]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------392  FUNC VOID test_compound_novardecl(0)
   jr $ra

.func_test_compound_novardecl:

#------------393  CONST INT intconstant = 1

#------------394  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------395  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------396  FUNC VOID test_compound_nostmts(0)
   jr $ra

.func_test_compound_nostmts:

#------------397  CONST INT intconstant = 1

#------------398  VAR INT intvariable

#------------399  FUNC INT test_if(1)
   jr $ra

.func_test_if:

#------------400  PARA INT number

#------------401  FACTOR_VAR INT number save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------402  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------403  IF reg[1] BGEQ reg[2] THEN GOTO label_10
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_10

#------------404  FACTOR_VAR INT number save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------405  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -16($sp)

#------------406  reg[5] = reg[4] JIAN reg[3]
   lw $t0 -16($sp)
   lw $t1 -12($sp)
   sub $t2 $t0 $t1
   sw $t2 -20($sp)

#------------407  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------408  JUMP to label_11
   j label_11

#------------409  label_10    ----------------Label----------------
label_10:

#------------410  label_11    ----------------Label----------------
label_11:

#------------411  FACTOR_VAR INT number save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------412  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------413  FUNC VOID test_for(0)
   jr $ra

.func_test_for:

#------------414  CONST INT limit = 10

#------------415  VAR INT i

#------------416  WRITE Incremental for
   li $v0 4
   la $a0 .str_10
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------417  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------418  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------419  label_12    ----------------Label----------------
label_12:

#------------420  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------421  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------422  WRITE INT reg[2]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------423  FACTOR_VAR INT i save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------424  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -16($sp)

#------------425  reg[5] = reg[3] JIA reg[4]
   lw $t0 -12($sp)
   lw $t1 -16($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------426  ASSIGN INT i = reg[5]
   lw $t3 -20($sp)
   sw $t3 0($sp)

#------------427  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------428  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -28($sp)

#------------429  IF reg[6] BLSS reg[7] THEN GOTO label_12
   lw $t0 -24($sp)
   lw $t1 -28($sp)
    blt $t0 $t1 label_12

#------------430  WRITE Decremental for
   li $v0 4
   la $a0 .str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------431  FACTOR_CON INT 10 save in reg[8]
   li $t0 10
   sw $t0 -32($sp)

#------------432  ASSIGN INT i = reg[8]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------433  label_13    ----------------Label----------------
label_13:

#------------434  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------435  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------436  WRITE INT reg[9]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------437  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------438  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -44($sp)

#------------439  reg[12] = reg[10] JIAN reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   sub $t2 $t0 $t1
   sw $t2 -48($sp)

#------------440  ASSIGN INT i = reg[12]
   lw $t3 -48($sp)
   sw $t3 0($sp)

#------------441  FACTOR_VAR INT i save in reg[13]
   lw $t3 0($sp)
   sw $t3 -52($sp)

#------------442  FACTOR_CON INT 0 save in reg[14]
   li $t0 0
   sw $t0 -56($sp)

#------------443  IF reg[13] BGEQ reg[14] THEN GOTO label_13
   lw $t0 -52($sp)
   lw $t1 -56($sp)
    bge $t0 $t1 label_13

#------------444  WRITE for: execute only once
   li $v0 4
   la $a0 .str_13
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------445  FACTOR_CON INT 0 save in reg[15]
   li $t0 0
   sw $t0 -60($sp)

#------------446  ASSIGN INT i = reg[15]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------447  label_14    ----------------Label----------------
label_14:

#------------448  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------449  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------450  WRITE INT reg[16]
   li $v0 1
   lw $a0 -64($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------451  FACTOR_VAR INT i save in reg[17]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------452  FACTOR_CON INT 1 save in reg[18]
   li $t0 1
   sw $t0 -72($sp)

#------------453  reg[19] = reg[17] JIAN reg[18]
   lw $t0 -68($sp)
   lw $t1 -72($sp)
   sub $t2 $t0 $t1
   sw $t2 -76($sp)

#------------454  ASSIGN INT i = reg[19]
   lw $t3 -76($sp)
   sw $t3 0($sp)

#------------455  FACTOR_VAR INT i save in reg[20]
   lw $t3 0($sp)
   sw $t3 -80($sp)

#------------456  FACTOR_CON INT 10 save in reg[21]
   li $t0 10
   sw $t0 -84($sp)

#------------457  IF reg[20] BGTR reg[21] THEN GOTO label_14
   lw $t0 -80($sp)
   lw $t1 -84($sp)
    bgt $t0 $t1 label_14

#------------458  FUNC VOID test_while(0)
   jr $ra

.func_test_while:

#------------459  CONST INT limit = 10

#------------460  VAR INT i

#------------461  WRITE Incremental while
   li $v0 4
   la $a0 .str_14
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------462  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------463  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------464  label_15    ----------------Label----------------
label_15:

#------------465  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------466  FACTOR_CON INT 10 save in reg[3]
   li $t0 10
   sw $t0 -12($sp)

#------------467  IF reg[2] BGEQ reg[3] THEN GOTO label_16
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    bge $t0 $t1 label_16

#------------468  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------469  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------470  WRITE INT reg[4]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------471  FACTOR_VAR INT i save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------472  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------473  reg[7] = reg[5] JIA reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------474  ASSIGN INT i = reg[7]
   lw $t3 -28($sp)
   sw $t3 0($sp)

#------------475  JUMP to label_15
   j label_15

#------------476  label_16    ----------------Label----------------
label_16:

#------------477  WRITE Decremental while
   li $v0 4
   la $a0 .str_15
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------478  FACTOR_CON INT 10 save in reg[8]
   li $t0 10
   sw $t0 -32($sp)

#------------479  ASSIGN INT i = reg[8]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------480  label_17    ----------------Label----------------
label_17:

#------------481  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------482  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -40($sp)

#------------483  IF reg[9] BLSS reg[10] THEN GOTO label_18
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    blt $t0 $t1 label_18

#------------484  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------485  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------486  WRITE INT reg[11]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------487  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------488  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -52($sp)

#------------489  reg[14] = reg[12] JIAN reg[13]
   lw $t0 -48($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------490  ASSIGN INT i = reg[14]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------491  JUMP to label_17
   j label_17

#------------492  label_18    ----------------Label----------------
label_18:

#------------493  FACTOR_CON INT 0 save in reg[15]
   li $t0 0
   sw $t0 -60($sp)

#------------494  ASSIGN INT i = reg[15]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------495  label_19    ----------------Label----------------
label_19:

#------------496  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------497  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -68($sp)

#------------498  IF reg[16] BLEQ reg[17] THEN GOTO label_20
   lw $t0 -64($sp)
   lw $t1 -68($sp)
    ble $t0 $t1 label_20

#------------499  WRITE Never while
   li $v0 4
   la $a0 .str_16
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------500  JUMP to label_19
   j label_19

#------------501  label_20    ----------------Label----------------
label_20:

#------------502  FUNC VOID test_assign(0)
   jr $ra

.func_test_assign:

#------------503  VAR INT singleintvariable

#------------504  ARRAY INT intarray[2]

#------------505  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------506  ASSIGN INT singleintvariable = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------507  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -16($sp)

#------------508  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -20($sp)

#------------509  ASSIGN_ARR INT intarray[reg[2]] = reg[3]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------510  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -24($sp)

#------------511  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -28($sp)

#------------512  ASSIGN_ARR INT intarray[reg[4]] = reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------513  FUNC VOID test_stmt(0)
   jr $ra

.func_test_stmt:

#------------514  VAR INT i

#------------515  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -4($sp)

#------------516  IF reg[1] BEQ reg[0] THEN GOTO label_25
   lw $t0 -4($sp)
    beq $t0 $0 label_25

#------------517  FACTOR_CON INT 2 save in reg[2]
   li $t0 2
   sw $t0 -8($sp)

#------------518  IF reg[2] BEQ reg[0] THEN GOTO label_23
   lw $t0 -8($sp)
    beq $t0 $0 label_23

#------------519  FACTOR_CON INT 3 save in reg[3]
   li $t0 3
   sw $t0 -12($sp)

#------------520  IF reg[3] BEQ reg[0] THEN GOTO label_21
   lw $t0 -12($sp)
    beq $t0 $0 label_21

#------------521  WRITE if if if
   li $v0 4
   la $a0 .str_17
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------522  JUMP to label_22
   j label_22

#------------523  label_21    ----------------Label----------------
label_21:

#------------524  WRITE if if else
   li $v0 4
   la $a0 .str_18
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------525  label_22    ----------------Label----------------
label_22:

#------------526  JUMP to label_24
   j label_24

#------------527  label_23    ----------------Label----------------
label_23:

#------------528  WRITE if else
   li $v0 4
   la $a0 .str_19
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------529  label_24    ----------------Label----------------
label_24:

#------------530  JUMP to label_26
   j label_26

#------------531  label_25    ----------------Label----------------
label_25:

#------------532  WRITE else
   li $v0 4
   la $a0 .str_20
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------533  label_26    ----------------Label----------------
label_26:

#------------534  label_27    ----------------Label----------------
label_27:

#------------535  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -16($sp)

#------------536  IF reg[4] BEQ reg[0] THEN GOTO label_47
   lw $t0 -16($sp)
    beq $t0 $0 label_47

#------------537  label_28    ----------------Label----------------
label_28:

#------------538  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -20($sp)

#------------539  IF reg[5] BEQ reg[0] THEN GOTO label_34
   lw $t0 -20($sp)
    beq $t0 $0 label_34

#------------540  label_29    ----------------Label----------------
label_29:

#------------541  FACTOR_CON INT 3 save in reg[6]
   li $t0 3
   sw $t0 -24($sp)

#------------542  IF reg[6] BEQ reg[0] THEN GOTO label_30
   lw $t0 -24($sp)
    beq $t0 $0 label_30

#------------543  WRITE while while while
   li $v0 4
   la $a0 .str_21
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------544  JUMP to label_29
   j label_29

#------------545  label_30    ----------------Label----------------
label_30:

#------------546  FACTOR_CON INT 3 save in reg[7]
   li $t0 3
   sw $t0 -28($sp)

#------------547  IF reg[7] BEQ reg[0] THEN GOTO label_32
   lw $t0 -28($sp)
    beq $t0 $0 label_32

#------------548  WRITE while while if
   li $v0 4
   la $a0 .str_22
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------549  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -32($sp)

#------------550  ASSIGN INT i = reg[8]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------551  label_31    ----------------Label----------------
label_31:

#------------552  WRITE while while if for
   li $v0 4
   la $a0 .str_23
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------553  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------554  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -40($sp)

#------------555  reg[11] = reg[9] JIA reg[10]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------556  ASSIGN INT i = reg[11]
   lw $t3 -44($sp)
   sw $t3 0($sp)

#------------557  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------558  FACTOR_CON INT 4 save in reg[13]
   li $t0 4
   sw $t0 -52($sp)

#------------559  IF reg[12] BLSS reg[13] THEN GOTO label_31
   lw $t0 -48($sp)
   lw $t1 -52($sp)
    blt $t0 $t1 label_31

#------------560  JUMP to label_33
   j label_33

#------------561  label_32    ----------------Label----------------
label_32:

#------------562  label_33    ----------------Label----------------
label_33:

#------------563  JUMP to label_28
   j label_28

#------------564  label_34    ----------------Label----------------
label_34:

#------------565  FACTOR_CON INT 0 save in reg[14]
   li $t0 0
   sw $t0 -56($sp)

#------------566  ASSIGN INT i = reg[14]
   lw $t3 -56($sp)
   sw $t3 0($sp)

#------------567  label_35    ----------------Label----------------
label_35:

#------------568  FACTOR_CON INT 0 save in reg[15]
   li $t0 0
   sw $t0 -60($sp)

#------------569  ASSIGN INT i = reg[15]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------570  label_36    ----------------Label----------------
label_36:

#------------571  FACTOR_CON INT 0 save in reg[16]
   li $t0 0
   sw $t0 -64($sp)

#------------572  ASSIGN INT i = reg[16]
   lw $t3 -64($sp)
   sw $t3 0($sp)

#------------573  label_37    ----------------Label----------------
label_37:

#------------574  WRITE while for for for
   li $v0 4
   la $a0 .str_24
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------575  FACTOR_CON INT 5 save in reg[17]
   li $t0 5
   sw $t0 -68($sp)

#------------576  IF reg[17] BEQ reg[0] THEN GOTO label_38
   lw $t0 -68($sp)
    beq $t0 $0 label_38

#------------577  WRITE while for for for if
   li $v0 4
   la $a0 .str_25
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------578  JUMP to label_39
   j label_39

#------------579  label_38    ----------------Label----------------
label_38:

#------------580  label_39    ----------------Label----------------
label_39:

#------------581  FACTOR_VAR INT i save in reg[18]
   lw $t3 0($sp)
   sw $t3 -72($sp)

#------------582  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -76($sp)

#------------583  reg[20] = reg[18] JIA reg[19]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   add $t2 $t0 $t1
   sw $t2 -80($sp)

#------------584  ASSIGN INT i = reg[20]
   lw $t3 -80($sp)
   sw $t3 0($sp)

#------------585  FACTOR_VAR INT i save in reg[21]
   lw $t3 0($sp)
   sw $t3 -84($sp)

#------------586  FACTOR_CON INT 4 save in reg[22]
   li $t0 4
   sw $t0 -88($sp)

#------------587  IF reg[21] BLSS reg[22] THEN GOTO label_37
   lw $t0 -84($sp)
   lw $t1 -88($sp)
    blt $t0 $t1 label_37

#------------588  FACTOR_VAR INT i save in reg[23]
   lw $t3 0($sp)
   sw $t3 -92($sp)

#------------589  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -96($sp)

#------------590  reg[25] = reg[23] JIA reg[24]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   add $t2 $t0 $t1
   sw $t2 -100($sp)

#------------591  ASSIGN INT i = reg[25]
   lw $t3 -100($sp)
   sw $t3 0($sp)

#------------592  FACTOR_VAR INT i save in reg[26]
   lw $t3 0($sp)
   sw $t3 -104($sp)

#------------593  FACTOR_CON INT 3 save in reg[27]
   li $t0 3
   sw $t0 -108($sp)

#------------594  IF reg[26] BLSS reg[27] THEN GOTO label_36
   lw $t0 -104($sp)
   lw $t1 -108($sp)
    blt $t0 $t1 label_36

#------------595  FACTOR_VAR INT i save in reg[28]
   lw $t3 0($sp)
   sw $t3 -112($sp)

#------------596  FACTOR_CON INT 1 save in reg[29]
   li $t0 1
   sw $t0 -116($sp)

#------------597  reg[30] = reg[28] JIA reg[29]
   lw $t0 -112($sp)
   lw $t1 -116($sp)
   add $t2 $t0 $t1
   sw $t2 -120($sp)

#------------598  ASSIGN INT i = reg[30]
   lw $t3 -120($sp)
   sw $t3 0($sp)

#------------599  FACTOR_VAR INT i save in reg[31]
   lw $t3 0($sp)
   sw $t3 -124($sp)

#------------600  FACTOR_CON INT 2 save in reg[32]
   li $t0 2
   sw $t0 -128($sp)

#------------601  IF reg[31] BLSS reg[32] THEN GOTO label_35
   lw $t0 -124($sp)
   lw $t1 -128($sp)
    blt $t0 $t1 label_35

#------------602  WRITE while
   li $v0 4
   la $a0 .str_26
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------603  FACTOR_CON INT 2 save in reg[33]
   li $t0 2
   sw $t0 -132($sp)

#------------604  IF reg[33] BEQ reg[0] THEN GOTO label_45
   lw $t0 -132($sp)
    beq $t0 $0 label_45

#------------605  WRITE while if
   li $v0 4
   la $a0 .str_27
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------606  label_40    ----------------Label----------------
label_40:

#------------607  FACTOR_CON INT 3 save in reg[34]
   li $t0 3
   sw $t0 -136($sp)

#------------608  IF reg[34] BEQ reg[0] THEN GOTO label_44
   lw $t0 -136($sp)
    beq $t0 $0 label_44

#------------609  label_41    ----------------Label----------------
label_41:

#------------610  FACTOR_CON INT 4 save in reg[35]
   li $t0 4
   sw $t0 -140($sp)

#------------611  IF reg[35] BEQ reg[0] THEN GOTO label_43
   lw $t0 -140($sp)
    beq $t0 $0 label_43

#------------612  FACTOR_CON INT 0 save in reg[36]
   li $t0 0
   sw $t0 -144($sp)

#------------613  ASSIGN INT i = reg[36]
   lw $t3 -144($sp)
   sw $t3 0($sp)

#------------614  label_42    ----------------Label----------------
label_42:

#------------615  WRITE while if while while for
   li $v0 4
   la $a0 .str_28
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------616  FACTOR_VAR INT i save in reg[37]
   lw $t3 0($sp)
   sw $t3 -148($sp)

#------------617  FACTOR_CON INT 1 save in reg[38]
   li $t0 1
   sw $t0 -152($sp)

#------------618  reg[39] = reg[37] JIA reg[38]
   lw $t0 -148($sp)
   lw $t1 -152($sp)
   add $t2 $t0 $t1
   sw $t2 -156($sp)

#------------619  ASSIGN INT i = reg[39]
   lw $t3 -156($sp)
   sw $t3 0($sp)

#------------620  FACTOR_VAR INT i save in reg[40]
   lw $t3 0($sp)
   sw $t3 -160($sp)

#------------621  FACTOR_CON INT 5 save in reg[41]
   li $t0 5
   sw $t0 -164($sp)

#------------622  IF reg[40] BLSS reg[41] THEN GOTO label_42
   lw $t0 -160($sp)
   lw $t1 -164($sp)
    blt $t0 $t1 label_42

#------------623  JUMP to label_41
   j label_41

#------------624  label_43    ----------------Label----------------
label_43:

#------------625  JUMP to label_40
   j label_40

#------------626  label_44    ----------------Label----------------
label_44:

#------------627  JUMP to label_46
   j label_46

#------------628  label_45    ----------------Label----------------
label_45:

#------------629  label_46    ----------------Label----------------
label_46:

#------------630  JUMP to label_27
   j label_27

#------------631  label_47    ----------------Label----------------
label_47:

#------------632  FUNC VOID printcompareop(0)
   jr $ra

.func_printcompareop:

#------------633  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------634  WRITE CompareEqual: 
   li $v0 4
   la $a0 .str_29
   syscall

#------------635  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------636  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------637  WRITE CompareNotEqual: 
   li $v0 4
   la $a0 .str_30
   syscall

#------------638  WRITE INT reg[2]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------639  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -8($sp)

#------------640  WRITE CompareLess: 
   li $v0 4
   la $a0 .str_31
   syscall

#------------641  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------642  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -12($sp)

#------------643  WRITE CompareLessEqual: 
   li $v0 4
   la $a0 .str_32
   syscall

#------------644  WRITE INT reg[4]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------645  FACTOR_CON INT 4 save in reg[5]
   li $t0 4
   sw $t0 -16($sp)

#------------646  WRITE CompareGreater: 
   li $v0 4
   la $a0 .str_33
   syscall

#------------647  WRITE INT reg[5]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------648  FACTOR_CON INT 5 save in reg[6]
   li $t0 5
   sw $t0 -20($sp)

#------------649  WRITE CompareGreaterEqual: 
   li $v0 4
   la $a0 .str_34
   syscall

#------------650  WRITE INT reg[6]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------651  FUNC INT threewayscompare(2)
   jr $ra

.func_threewayscompare:

#------------652  PARA INT a

#------------653  PARA INT b

#------------654  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------655  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------656  IF reg[1] BLEQ reg[2] THEN GOTO label_48
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    ble $t0 $t1 label_48

#------------657  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -16($sp)

#------------658  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------659  JUMP to label_49
   j label_49

#------------660  label_48    ----------------Label----------------
label_48:

#------------661  label_49    ----------------Label----------------
label_49:

#------------662  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------663  FACTOR_VAR INT b save in reg[5]
   lw $t3 -4($sp)
   sw $t3 -24($sp)

#------------664  IF reg[4] BGEQ reg[5] THEN GOTO label_50
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bge $t0 $t1 label_50



#------------667  FACTOR_CON INT -1 save in reg[8]
   li $t0 -1
   sw $t0 -36($sp)

#------------668  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------669  JUMP to label_51
   j label_51

#------------670  label_50    ----------------Label----------------
label_50:

#------------671  label_51    ----------------Label----------------
label_51:

#------------672  FACTOR_CON INT 0 save in reg[9]
   li $t0 0
   sw $t0 -40($sp)

#------------673  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------674  FUNC INT richcompare(3)
   jr $ra

.func_richcompare:

#------------675  PARA INT a

#------------676  PARA INT b

#------------677  PARA INT compareop

#------------678  VAR INT order

#------------679  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------680  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------681  PUSH INT parareg[6] from reg[1]
   sw $ra -24($sp)
   lw $t0 -16($sp)
   sw $t0 -28($sp)

#------------682  PUSH INT parareg[7] from reg[2]
   lw $t0 -20($sp)
   sw $t0 -32($sp)

#------------683  CALL INT threewayscompare(2)
   addi $sp $sp -28
   jal .func_threewayscompare
   subi $sp $sp -28
   lw $ra -24($sp)

#------------684  FACTOR_FUNC INT threewayscompare save in reg[3]
   sw $v0 -24($sp)

#------------685  ASSIGN INT order = reg[3]
   lw $t3 -24($sp)
   sw $t3 -12($sp)

#------------686  FACTOR_VAR INT compareop save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -28($sp)

#------------687  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -32($sp)

#------------688  IF reg[4] BNE reg[5] THEN GOTO label_54
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    bne $t0 $t1 label_54

#------------689  FACTOR_VAR INT order save in reg[6]
   lw $t3 -12($sp)
   sw $t3 -36($sp)

#------------690  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -40($sp)

#------------691  IF reg[6] BNE reg[7] THEN GOTO label_52
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    bne $t0 $t1 label_52

#------------692  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -44($sp)

#------------693  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------694  JUMP to label_53
   j label_53

#------------695  label_52    ----------------Label----------------
label_52:

#------------696  FACTOR_CON INT 0 save in reg[9]
   li $t0 0
   sw $t0 -48($sp)

#------------697  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------698  label_53    ----------------Label----------------
label_53:

#------------699  JUMP to label_75
   j label_75

#------------700  label_54    ----------------Label----------------
label_54:

#------------701  FACTOR_VAR INT compareop save in reg[10]
   lw $t3 -8($sp)
   sw $t3 -52($sp)

#------------702  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -56($sp)

#------------703  IF reg[10] BNE reg[11] THEN GOTO label_57
   lw $t0 -52($sp)
   lw $t1 -56($sp)
    bne $t0 $t1 label_57

#------------704  FACTOR_VAR INT order save in reg[12]
   lw $t3 -12($sp)
   sw $t3 -60($sp)



#------------707  FACTOR_CON INT -1 save in reg[15]
   li $t0 -1
   sw $t0 -72($sp)

#------------708  IF reg[12] BNE reg[15] THEN GOTO label_55
   lw $t0 -60($sp)
   lw $t1 -72($sp)
    bne $t0 $t1 label_55

#------------709  FACTOR_CON INT 1 save in reg[16]
   li $t0 1
   sw $t0 -76($sp)

#------------710  RETURN reg[16] TO $V0 AND THEN GOTO 0
   lw $v0 -76($sp)
   jr $ra

#------------711  JUMP to label_56
   j label_56

#------------712  label_55    ----------------Label----------------
label_55:

#------------713  FACTOR_CON INT 0 save in reg[17]
   li $t0 0
   sw $t0 -80($sp)

#------------714  RETURN reg[17] TO $V0 AND THEN GOTO 0
   lw $v0 -80($sp)
   jr $ra

#------------715  label_56    ----------------Label----------------
label_56:

#------------716  JUMP to label_74
   j label_74

#------------717  label_57    ----------------Label----------------
label_57:

#------------718  FACTOR_VAR INT compareop save in reg[18]
   lw $t3 -8($sp)
   sw $t3 -84($sp)

#------------719  FACTOR_CON INT 4 save in reg[19]
   li $t0 4
   sw $t0 -88($sp)

#------------720  IF reg[18] BNE reg[19] THEN GOTO label_60
   lw $t0 -84($sp)
   lw $t1 -88($sp)
    bne $t0 $t1 label_60

#------------721  FACTOR_VAR INT order save in reg[20]
   lw $t3 -12($sp)
   sw $t3 -92($sp)

#------------722  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -96($sp)

#------------723  IF reg[20] BNE reg[21] THEN GOTO label_58
   lw $t0 -92($sp)
   lw $t1 -96($sp)
    bne $t0 $t1 label_58

#------------724  FACTOR_CON INT 1 save in reg[22]
   li $t0 1
   sw $t0 -100($sp)

#------------725  RETURN reg[22] TO $V0 AND THEN GOTO 0
   lw $v0 -100($sp)
   jr $ra

#------------726  JUMP to label_59
   j label_59

#------------727  label_58    ----------------Label----------------
label_58:

#------------728  FACTOR_CON INT 0 save in reg[23]
   li $t0 0
   sw $t0 -104($sp)

#------------729  RETURN reg[23] TO $V0 AND THEN GOTO 0
   lw $v0 -104($sp)
   jr $ra

#------------730  label_59    ----------------Label----------------
label_59:

#------------731  JUMP to label_73
   j label_73

#------------732  label_60    ----------------Label----------------
label_60:

#------------733  FACTOR_VAR INT compareop save in reg[24]
   lw $t3 -8($sp)
   sw $t3 -108($sp)

#------------734  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -112($sp)

#------------735  IF reg[24] BNE reg[25] THEN GOTO label_63
   lw $t0 -108($sp)
   lw $t1 -112($sp)
    bne $t0 $t1 label_63

#------------736  FACTOR_VAR INT a save in reg[26]
   lw $t3 0($sp)
   sw $t3 -116($sp)

#------------737  FACTOR_VAR INT b save in reg[27]
   lw $t3 -4($sp)
   sw $t3 -120($sp)

#------------738  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -124($sp)

#------------739  PUSH INT parareg[8] from reg[26]
   sw $ra -128($sp)
   lw $t0 -116($sp)
   sw $t0 -132($sp)

#------------740  PUSH INT parareg[9] from reg[27]
   lw $t0 -120($sp)
   sw $t0 -136($sp)

#------------741  PUSH INT parareg[10] from reg[28]
   lw $t0 -124($sp)
   sw $t0 -140($sp)

#------------742  CALL INT richcompare(3)
   addi $sp $sp -132
   jal .func_richcompare
   subi $sp $sp -132
   lw $ra -128($sp)

#------------743  FACTOR_FUNC INT richcompare save in reg[29]
   sw $v0 -128($sp)

#------------744  ASSIGN INT order = reg[29]
   lw $t3 -128($sp)
   sw $t3 -12($sp)

#------------745  FACTOR_VAR INT order save in reg[30]
   lw $t3 -12($sp)
   sw $t3 -132($sp)

#------------746  IF reg[30] BEQ reg[0] THEN GOTO label_61
   lw $t0 -132($sp)
    beq $t0 $0 label_61

#------------747  FACTOR_CON INT 0 save in reg[31]
   li $t0 0
   sw $t0 -136($sp)

#------------748  RETURN reg[31] TO $V0 AND THEN GOTO 0
   lw $v0 -136($sp)
   jr $ra

#------------749  JUMP to label_62
   j label_62

#------------750  label_61    ----------------Label----------------
label_61:

#------------751  FACTOR_CON INT 1 save in reg[32]
   li $t0 1
   sw $t0 -140($sp)

#------------752  RETURN reg[32] TO $V0 AND THEN GOTO 0
   lw $v0 -140($sp)
   jr $ra

#------------753  label_62    ----------------Label----------------
label_62:

#------------754  JUMP to label_72
   j label_72

#------------755  label_63    ----------------Label----------------
label_63:

#------------756  FACTOR_VAR INT compareop save in reg[33]
   lw $t3 -8($sp)
   sw $t3 -144($sp)

#------------757  FACTOR_CON INT 3 save in reg[34]
   li $t0 3
   sw $t0 -148($sp)

#------------758  IF reg[33] BNE reg[34] THEN GOTO label_66
   lw $t0 -144($sp)
   lw $t1 -148($sp)
    bne $t0 $t1 label_66

#------------759  FACTOR_VAR INT a save in reg[35]
   lw $t3 0($sp)
   sw $t3 -152($sp)

#------------760  FACTOR_VAR INT b save in reg[36]
   lw $t3 -4($sp)
   sw $t3 -156($sp)

#------------761  FACTOR_CON INT 4 save in reg[37]
   li $t0 4
   sw $t0 -160($sp)

#------------762  PUSH INT parareg[11] from reg[35]
   sw $ra -164($sp)
   lw $t0 -152($sp)
   sw $t0 -168($sp)

#------------763  PUSH INT parareg[12] from reg[36]
   lw $t0 -156($sp)
   sw $t0 -172($sp)

#------------764  PUSH INT parareg[13] from reg[37]
   lw $t0 -160($sp)
   sw $t0 -176($sp)

#------------765  CALL INT richcompare(3)
   addi $sp $sp -168
   jal .func_richcompare
   subi $sp $sp -168
   lw $ra -164($sp)

#------------766  FACTOR_FUNC INT richcompare save in reg[38]
   sw $v0 -164($sp)

#------------767  ASSIGN INT order = reg[38]
   lw $t3 -164($sp)
   sw $t3 -12($sp)

#------------768  FACTOR_VAR INT order save in reg[39]
   lw $t3 -12($sp)
   sw $t3 -168($sp)

#------------769  IF reg[39] BEQ reg[0] THEN GOTO label_64
   lw $t0 -168($sp)
    beq $t0 $0 label_64

#------------770  FACTOR_CON INT 0 save in reg[40]
   li $t0 0
   sw $t0 -172($sp)

#------------771  RETURN reg[40] TO $V0 AND THEN GOTO 0
   lw $v0 -172($sp)
   jr $ra

#------------772  JUMP to label_65
   j label_65

#------------773  label_64    ----------------Label----------------
label_64:

#------------774  FACTOR_CON INT 1 save in reg[41]
   li $t0 1
   sw $t0 -176($sp)

#------------775  RETURN reg[41] TO $V0 AND THEN GOTO 0
   lw $v0 -176($sp)
   jr $ra

#------------776  label_65    ----------------Label----------------
label_65:

#------------777  JUMP to label_71
   j label_71

#------------778  label_66    ----------------Label----------------
label_66:

#------------779  FACTOR_VAR INT compareop save in reg[42]
   lw $t3 -8($sp)
   sw $t3 -180($sp)

#------------780  FACTOR_CON INT 5 save in reg[43]
   li $t0 5
   sw $t0 -184($sp)

#------------781  IF reg[42] BNE reg[43] THEN GOTO label_69
   lw $t0 -180($sp)
   lw $t1 -184($sp)
    bne $t0 $t1 label_69

#------------782  FACTOR_VAR INT a save in reg[44]
   lw $t3 0($sp)
   sw $t3 -188($sp)

#------------783  FACTOR_VAR INT b save in reg[45]
   lw $t3 -4($sp)
   sw $t3 -192($sp)

#------------784  FACTOR_CON INT 2 save in reg[46]
   li $t0 2
   sw $t0 -196($sp)

#------------785  PUSH INT parareg[14] from reg[44]
   sw $ra -200($sp)
   lw $t0 -188($sp)
   sw $t0 -204($sp)

#------------786  PUSH INT parareg[15] from reg[45]
   lw $t0 -192($sp)
   sw $t0 -208($sp)

#------------787  PUSH INT parareg[16] from reg[46]
   lw $t0 -196($sp)
   sw $t0 -212($sp)

#------------788  CALL INT richcompare(3)
   addi $sp $sp -204
   jal .func_richcompare
   subi $sp $sp -204
   lw $ra -200($sp)

#------------789  FACTOR_FUNC INT richcompare save in reg[47]
   sw $v0 -200($sp)

#------------790  ASSIGN INT order = reg[47]
   lw $t3 -200($sp)
   sw $t3 -12($sp)

#------------791  FACTOR_VAR INT order save in reg[48]
   lw $t3 -12($sp)
   sw $t3 -204($sp)

#------------792  IF reg[48] BEQ reg[0] THEN GOTO label_67
   lw $t0 -204($sp)
    beq $t0 $0 label_67

#------------793  FACTOR_CON INT 0 save in reg[49]
   li $t0 0
   sw $t0 -208($sp)

#------------794  RETURN reg[49] TO $V0 AND THEN GOTO 0
   lw $v0 -208($sp)
   jr $ra

#------------795  JUMP to label_68
   j label_68

#------------796  label_67    ----------------Label----------------
label_67:

#------------797  FACTOR_CON INT 1 save in reg[50]
   li $t0 1
   sw $t0 -212($sp)

#------------798  RETURN reg[50] TO $V0 AND THEN GOTO 0
   lw $v0 -212($sp)
   jr $ra

#------------799  label_68    ----------------Label----------------
label_68:

#------------800  JUMP to label_70
   j label_70

#------------801  label_69    ----------------Label----------------
label_69:

#------------802  FACTOR_VAR INT compareop save in reg[51]
   lw $t3 -8($sp)
   sw $t3 -216($sp)

#------------803  WRITE Unknown CompareOp: 
   li $v0 4
   la $a0 .str_35
   syscall

#------------804  WRITE INT reg[51]
   li $v0 1
   lw $a0 -216($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall



#------------807  FACTOR_CON INT -1 save in reg[54]
   li $t0 -1
   sw $t0 -228($sp)

#------------808  RETURN reg[54] TO $V0 AND THEN GOTO 0
   lw $v0 -228($sp)
   jr $ra

#------------809  label_70    ----------------Label----------------
label_70:

#------------810  label_71    ----------------Label----------------
label_71:

#------------811  label_72    ----------------Label----------------
label_72:

#------------812  label_73    ----------------Label----------------
label_73:

#------------813  label_74    ----------------Label----------------
label_74:

#------------814  label_75    ----------------Label----------------
label_75:



#------------817  FACTOR_CON INT -1 save in reg[57]
   li $t0 -1
   sw $t0 -240($sp)

#------------818  RETURN reg[57] TO $V0 AND THEN GOTO 0
   lw $v0 -240($sp)
   jr $ra

#------------819  FUNC VOID main(0)
   jr $ra

.func_main:

#------------820  VAR INT a

#------------821  VAR INT b

#------------822  VAR INT compareop

#------------823  VAR INT result

#------------824  WRITE Please input three integers: A, B and CompareOp
   li $v0 4
   la $a0 .str_36
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------825  WRITE where CompareOp are:
   li $v0 4
   la $a0 .str_37
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------826  CALL VOID printcompareop(0)
   sw $ra -16($sp)
   addi $sp $sp -20
   jal .func_printcompareop
   subi $sp $sp -20
   lw $ra -16($sp)

#------------827  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------828  READ INT b
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------829  READ INT compareop
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------830  FACTOR_VAR INT a save in reg[58]
   lw $t3 0($sp)
   sw $t3 -244($sp)

#------------831  FACTOR_VAR INT b save in reg[59]
   lw $t3 -4($sp)
   sw $t3 -248($sp)

#------------832  FACTOR_VAR INT compareop save in reg[60]
   lw $t3 -8($sp)
   sw $t3 -252($sp)

#------------833  PUSH INT parareg[17] from reg[58]
   sw $ra -256($sp)
   lw $t0 -244($sp)
   sw $t0 -260($sp)

#------------834  PUSH INT parareg[18] from reg[59]
   lw $t0 -248($sp)
   sw $t0 -264($sp)

#------------835  PUSH INT parareg[19] from reg[60]
   lw $t0 -252($sp)
   sw $t0 -268($sp)

#------------836  CALL INT richcompare(3)
   addi $sp $sp -260
   jal .func_richcompare
   subi $sp $sp -260
   lw $ra -256($sp)

#------------837  FACTOR_FUNC INT richcompare save in reg[61]
   sw $v0 -256($sp)

#------------838  ASSIGN INT result = reg[61]
   lw $t3 -256($sp)
   sw $t3 -12($sp)

#------------839  FACTOR_VAR INT result save in reg[62]
   lw $t3 -12($sp)
   sw $t3 -260($sp)

#------------840  FACTOR_CON INT 0 save in reg[63]
   li $t0 0
   sw $t0 -264($sp)

#------------841  IF reg[62] BLSS reg[63] THEN GOTO label_76
   lw $t0 -260($sp)
   lw $t1 -264($sp)
    blt $t0 $t1 label_76

#------------842  FACTOR_VAR INT result save in reg[64]
   lw $t3 -12($sp)
   sw $t3 -268($sp)

#------------843  WRITE Result: 
   li $v0 4
   la $a0 .str_38
   syscall

#------------844  WRITE INT reg[64]
   li $v0 1
   lw $a0 -268($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------845  JUMP to label_77
   j label_77

#------------846  label_76    ----------------Label----------------
label_76:

#------------847  label_77    ----------------Label----------------
label_77:

   jr $ra

end:
