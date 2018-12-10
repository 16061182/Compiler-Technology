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

#------------21  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -12($sp)

#------------22  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -16($sp)

#------------23  reg[5] = reg[5] JIAN reg[4]
   lw $t0 -16($sp)
   lw $t1 -12($sp)
   sub $t2 $t0 $t1
   sw $t2 -16($sp)

#------------24  WRITE INT reg[5]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------25  FACTOR_CON INT 0 save in reg[6]
   li $t0 0
   sw $t0 -20($sp)

#------------26  WRITE INT reg[6]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------27  FACTOR_CON INT 12345 save in reg[7]
   li $t0 12345
   sw $t0 -24($sp)

#------------28  WRITE INT reg[7]
   li $v0 1
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------29  FACTOR_CON INT 12345 save in reg[8]
   li $t0 12345
   sw $t0 -28($sp)

#------------30  FACTOR_CON INT 0 save in reg[9]
   li $t0 0
   sw $t0 -32($sp)

#------------31  reg[9] = reg[9] JIAN reg[8]
   lw $t0 -32($sp)
   lw $t1 -28($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------32  WRITE INT reg[9]
   li $v0 1
   lw $a0 -32($sp)
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

#------------75  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------76  FACTOR_CON CHAR 97 save in reg[2]
   li $t0 97
   sw $t0 -4($sp)

#------------77  reg[2] = reg[1] JIA reg[2]
   lw $t0 0($sp)
   lw $t1 -4($sp)
   add $t2 $t0 $t1
   sw $t2 -4($sp)

#------------78  WRITE INT reg[2]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------79  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------80  FACTOR_CON CHAR 97 save in reg[4]
   li $t0 97
   sw $t0 -12($sp)

#------------81  reg[4] = reg[3] JIAN reg[4]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   sub $t2 $t0 $t1
   sw $t2 -12($sp)

#------------82  WRITE INT reg[4]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------83  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -16($sp)

#------------84  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -20($sp)

#------------85  reg[6] = reg[5] CHENG reg[6]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -20($sp)

#------------86  WRITE INT reg[6]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------87  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -24($sp)

#------------88  FACTOR_CON CHAR 97 save in reg[8]
   li $t0 97
   sw $t0 -28($sp)

#------------89  reg[8] = reg[7] CHU reg[8]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -28($sp)

#------------90  WRITE INT reg[8]
   li $v0 1
   lw $a0 -28($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------91  FUNC VOID test_parenexpr(0)
   jr $ra

.func_test_parenexpr:

#------------92  WRITE Deeply Nested ParenExpr
   li $v0 4
   la $a0 .str_7
   syscall

#------------93  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------94  FACTOR_EXPR reg[1] save in reg[2]
   lw $t0 0($sp)
   sw $t0 -4($sp)

#------------95  FACTOR_EXPR reg[2] save in reg[3]
   lw $t0 -4($sp)
   sw $t0 -8($sp)

#------------96  FACTOR_EXPR reg[3] save in reg[4]
   lw $t0 -8($sp)
   sw $t0 -12($sp)

#------------97  FACTOR_EXPR reg[4] save in reg[5]
   lw $t0 -12($sp)
   sw $t0 -16($sp)

#------------98  FACTOR_EXPR reg[5] save in reg[6]
   lw $t0 -16($sp)
   sw $t0 -20($sp)

#------------99  FACTOR_EXPR reg[6] save in reg[7]
   lw $t0 -20($sp)
   sw $t0 -24($sp)

#------------100  FACTOR_EXPR reg[7] save in reg[8]
   lw $t0 -24($sp)
   sw $t0 -28($sp)

#------------101  FACTOR_EXPR reg[8] save in reg[9]
   lw $t0 -28($sp)
   sw $t0 -32($sp)

#------------102  FACTOR_EXPR reg[9] save in reg[10]
   lw $t0 -32($sp)
   sw $t0 -36($sp)

#------------103  WRITE INT reg[10]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------104  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -40($sp)

#------------105  FACTOR_EXPR reg[11] save in reg[12]
   lw $t0 -40($sp)
   sw $t0 -44($sp)

#------------106  FACTOR_CON INT 2 save in reg[13]
   li $t0 2
   sw $t0 -48($sp)

#------------107  FACTOR_EXPR reg[13] save in reg[14]
   lw $t0 -48($sp)
   sw $t0 -52($sp)

#------------108  FACTOR_CON INT 3 save in reg[15]
   li $t0 3
   sw $t0 -56($sp)

#------------109  FACTOR_EXPR reg[15] save in reg[16]
   lw $t0 -56($sp)
   sw $t0 -60($sp)

#------------110  FACTOR_CON INT 1 save in reg[17]
   li $t0 1
   sw $t0 -64($sp)

#------------111  FACTOR_EXPR reg[17] save in reg[18]
   lw $t0 -64($sp)
   sw $t0 -68($sp)

#------------112  FACTOR_CON INT 1 save in reg[19]
   li $t0 1
   sw $t0 -72($sp)

#------------113  FACTOR_CON INT 3 save in reg[20]
   li $t0 3
   sw $t0 -76($sp)

#------------114  reg[20] = reg[19] CHENG reg[20]
   lw $t0 -72($sp)
   lw $t1 -76($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -76($sp)

#------------115  FACTOR_EXPR reg[20] save in reg[21]
   lw $t0 -76($sp)
   sw $t0 -80($sp)

#------------116  reg[21] = reg[18] CHU reg[21]
   lw $t0 -68($sp)
   lw $t1 -80($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -80($sp)

#------------117  reg[21] = reg[16] JIAN reg[21]
   lw $t0 -60($sp)
   lw $t1 -80($sp)
   sub $t2 $t0 $t1
   sw $t2 -80($sp)

#------------118  FACTOR_EXPR reg[21] save in reg[22]
   lw $t0 -80($sp)
   sw $t0 -84($sp)

#------------119  reg[22] = reg[14] CHENG reg[22]
   lw $t0 -52($sp)
   lw $t1 -84($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -84($sp)

#------------120  reg[22] = reg[12] JIA reg[22]
   lw $t0 -44($sp)
   lw $t1 -84($sp)
   add $t2 $t0 $t1
   sw $t2 -84($sp)

#------------121  FACTOR_CON INT 1 save in reg[23]
   li $t0 1
   sw $t0 -88($sp)

#------------122  FACTOR_CON INT 3 save in reg[24]
   li $t0 3
   sw $t0 -92($sp)

#------------123  FACTOR_CON INT 4 save in reg[25]
   li $t0 4
   sw $t0 -96($sp)

#------------124  reg[25] = reg[24] CHENG reg[25]
   lw $t0 -92($sp)
   lw $t1 -96($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -96($sp)

#------------125  FACTOR_EXPR reg[25] save in reg[26]
   lw $t0 -96($sp)
   sw $t0 -100($sp)

#------------126  reg[26] = reg[23] JIA reg[26]
   lw $t0 -88($sp)
   lw $t1 -100($sp)
   add $t2 $t0 $t1
   sw $t2 -100($sp)

#------------127  FACTOR_EXPR reg[26] save in reg[27]
   lw $t0 -100($sp)
   sw $t0 -104($sp)

#------------128  reg[27] = reg[22] JIAN reg[27]
   lw $t0 -84($sp)
   lw $t1 -104($sp)
   sub $t2 $t0 $t1
   sw $t2 -104($sp)

#------------129  WRITE INT reg[27]
   li $v0 1
   lw $a0 -104($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------130  FUNC VOID test_unaryop(0)
   jr $ra

.func_test_unaryop:

#------------131  CONST INT intconstant = 1

#------------132  CONST CHAR charconstant = 97

#------------133  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------134  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -4($sp)

#------------135  reg[2] = reg[2] JIAN reg[1]
   lw $t0 -4($sp)
   lw $t1 0($sp)
   sub $t2 $t0 $t1
   sw $t2 -4($sp)

#------------136  WRITE INT reg[2]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------137  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -8($sp)

#------------138  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------139  FACTOR_CON CHAR 97 save in reg[4]
   li $t0 97
   sw $t0 -12($sp)

#------------140  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -16($sp)

#------------141  reg[5] = reg[5] JIAN reg[4]
   lw $t0 -16($sp)
   lw $t1 -12($sp)
   sub $t2 $t0 $t1
   sw $t2 -16($sp)

#------------142  WRITE CHAR reg[5]
   li $v0 11
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------143  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -20($sp)

#------------144  WRITE CHAR reg[6]
   li $v0 11
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------145  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -24($sp)

#------------146  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -28($sp)

#------------147  reg[8] = reg[8] JIAN reg[7]
   lw $t0 -28($sp)
   lw $t1 -24($sp)
   sub $t2 $t0 $t1
   sw $t2 -28($sp)

#------------148  FACTOR_EXPR reg[8] save in reg[9]
   lw $t0 -28($sp)
   sw $t0 -32($sp)

#------------149  FACTOR_CON INT 0 save in reg[10]
   li $t0 0
   sw $t0 -36($sp)

#------------150  reg[10] = reg[10] JIAN reg[9]
   lw $t0 -36($sp)
   lw $t1 -32($sp)
   sub $t2 $t0 $t1
   sw $t2 -36($sp)

#------------151  WRITE INT reg[10]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------152  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -40($sp)

#------------153  FACTOR_EXPR reg[11] save in reg[12]
   lw $t0 -40($sp)
   sw $t0 -44($sp)

#------------154  WRITE INT reg[12]
   li $v0 1
   lw $a0 -44($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------155  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -48($sp)

#------------156  FACTOR_EXPR reg[13] save in reg[14]
   lw $t0 -48($sp)
   sw $t0 -52($sp)

#------------157  FACTOR_CON INT 0 save in reg[15]
   li $t0 0
   sw $t0 -56($sp)

#------------158  reg[15] = reg[15] JIAN reg[14]
   lw $t0 -56($sp)
   lw $t1 -52($sp)
   sub $t2 $t0 $t1
   sw $t2 -56($sp)

#------------159  FACTOR_EXPR reg[15] save in reg[16]
   lw $t0 -56($sp)
   sw $t0 -60($sp)

#------------160  FACTOR_CON INT 0 save in reg[17]
   li $t0 0
   sw $t0 -64($sp)

#------------161  reg[17] = reg[17] JIAN reg[16]
   lw $t0 -64($sp)
   lw $t1 -60($sp)
   sub $t2 $t0 $t1
   sw $t2 -64($sp)

#------------162  FACTOR_EXPR reg[17] save in reg[18]
   lw $t0 -64($sp)
   sw $t0 -68($sp)

#------------163  FACTOR_CON INT 0 save in reg[19]
   li $t0 0
   sw $t0 -72($sp)

#------------164  reg[19] = reg[19] JIAN reg[18]
   lw $t0 -72($sp)
   lw $t1 -68($sp)
   sub $t2 $t0 $t1
   sw $t2 -72($sp)

#------------165  WRITE INT reg[19]
   li $v0 1
   lw $a0 -72($sp)
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

#------------222  reg[8] = reg[7] JIAN reg[8]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   sub $t2 $t0 $t1
   sw $t2 -40($sp)

#------------223  FACTOR_EXPR reg[8] save in reg[9]
   lw $t0 -40($sp)
   sw $t0 -44($sp)

#------------224  FACTOR_VAR INT singleintvariable save in reg[10]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------225  FACTOR_VAR INT singleintvariable save in reg[11]
   lw $t3 0($sp)
   sw $t3 -52($sp)

#------------226  FACTOR_ARRAY INT intarray [reg[11]] save in reg[12]
   lw $t3 -52($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -56($sp)

#------------227  FACTOR_ARRAY INT intarray [reg[12]] save in reg[13]
   lw $t3 -56($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -60($sp)

#------------228  reg[13] = reg[10] JIA reg[13]
   lw $t0 -48($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------229  FACTOR_EXPR reg[13] save in reg[14]
   lw $t0 -60($sp)
   sw $t0 -64($sp)

#------------230  FACTOR_VAR INT singleintvariable save in reg[15]
   lw $t3 0($sp)
   sw $t3 -68($sp)

#------------231  FACTOR_ARRAY INT intarray [reg[15]] save in reg[16]
   lw $t3 -68($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -72($sp)

#------------232  reg[16] = reg[14] JIA reg[16]
   lw $t0 -64($sp)
   lw $t1 -72($sp)
   add $t2 $t0 $t1
   sw $t2 -72($sp)

#------------233  FACTOR_EXPR reg[16] save in reg[17]
   lw $t0 -72($sp)
   sw $t0 -76($sp)

#------------234  reg[17] = reg[9] CHU reg[17]
   lw $t0 -44($sp)
   lw $t1 -76($sp)
   div $t0 $t1
   mflo $t2
   sw $t2 -76($sp)

#------------235  FACTOR_EXPR reg[17] save in reg[18]
   lw $t0 -76($sp)
   sw $t0 -80($sp)

#------------236  reg[18] = reg[6] CHENG reg[18]
   lw $t0 -32($sp)
   lw $t1 -80($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -80($sp)

#------------237  FACTOR_EXPR reg[18] save in reg[19]
   lw $t0 -80($sp)
   sw $t0 -84($sp)

#------------238  WRITE INT reg[19]
   li $v0 1
   lw $a0 -84($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------239  FACTOR_VAR INT singleintvariable save in reg[20]
   lw $t3 0($sp)
   sw $t3 -88($sp)

#------------240  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -92($sp)

#------------241  reg[21] = reg[20] JIA reg[21]
   lw $t0 -88($sp)
   lw $t1 -92($sp)
   add $t2 $t0 $t1
   sw $t2 -92($sp)

#------------242  FACTOR_EXPR reg[21] save in reg[22]
   lw $t0 -92($sp)
   sw $t0 -96($sp)

#------------243  FACTOR_VAR INT singleintvariable save in reg[23]
   lw $t3 0($sp)
   sw $t3 -100($sp)

#------------244  FACTOR_CON INT 2 save in reg[24]
   li $t0 2
   sw $t0 -104($sp)

#------------245  reg[24] = reg[23] CHENG reg[24]
   lw $t0 -100($sp)
   lw $t1 -104($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -104($sp)

#------------246  FACTOR_ARRAY INT intarray [reg[24]] save in reg[25]
   lw $t3 -104($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -108($sp)

#------------247  FACTOR_CON INT 2 save in reg[26]
   li $t0 2
   sw $t0 -112($sp)

#------------248  reg[26] = reg[25] CHENG reg[26]
   lw $t0 -108($sp)
   lw $t1 -112($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -112($sp)

#------------249  FACTOR_EXPR reg[26] save in reg[27]
   lw $t0 -112($sp)
   sw $t0 -116($sp)

#------------250  reg[27] = reg[22] CHENG reg[27]
   lw $t0 -96($sp)
   lw $t1 -116($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -116($sp)

#------------251  WRITE INT reg[27]
   li $v0 1
   lw $a0 -116($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------252  FACTOR_CON INT 0 save in reg[28]
   li $t0 0
   sw $t0 -120($sp)

#------------253  FACTOR_VAR INT singleintvariable save in reg[29]
   lw $t3 0($sp)
   sw $t3 -124($sp)

#------------254  FACTOR_VAR INT singleintvariable save in reg[30]
   lw $t3 0($sp)
   sw $t3 -128($sp)

#------------255  reg[30] = reg[29] CHENG reg[30]
   lw $t0 -124($sp)
   lw $t1 -128($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -128($sp)

#------------256  FACTOR_VAR INT singleintvariable save in reg[31]
   lw $t3 0($sp)
   sw $t3 -132($sp)

#------------257  reg[31] = reg[30] CHENG reg[31]
   lw $t0 -128($sp)
   lw $t1 -132($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -132($sp)

#------------258  FACTOR_EXPR reg[31] save in reg[32]
   lw $t0 -132($sp)
   sw $t0 -136($sp)

#------------259  reg[32] = reg[28] CHENG reg[32]
   lw $t0 -120($sp)
   lw $t1 -136($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -136($sp)

#------------260  FACTOR_ARRAY INT intarray [reg[32]] save in reg[33]
   lw $t3 -136($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -140($sp)

#------------261  WRITE INT reg[33]
   li $v0 1
   lw $a0 -140($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------262  FACTOR_CON INT 0 save in reg[34]
   li $t0 0
   sw $t0 -144($sp)

#------------263  FACTOR_VAR INT singleintvariable save in reg[35]
   lw $t3 0($sp)
   sw $t3 -148($sp)

#------------264  FACTOR_ARRAY INT intarray [reg[35]] save in reg[36]
   lw $t3 -148($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -152($sp)

#------------265  FACTOR_CON INT 4 save in reg[37]
   li $t0 4
   sw $t0 -156($sp)

#------------266  reg[37] = reg[36] CHENG reg[37]
   lw $t0 -152($sp)
   lw $t1 -156($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -156($sp)

#------------267  FACTOR_EXPR reg[37] save in reg[38]
   lw $t0 -156($sp)
   sw $t0 -160($sp)

#------------268  reg[38] = reg[34] CHENG reg[38]
   lw $t0 -144($sp)
   lw $t1 -160($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -160($sp)

#------------269  FACTOR_VAR INT singleintvariable save in reg[39]
   lw $t3 0($sp)
   sw $t3 -164($sp)

#------------270  reg[39] = reg[38] JIA reg[39]
   lw $t0 -160($sp)
   lw $t1 -164($sp)
   add $t2 $t0 $t1
   sw $t2 -164($sp)

#------------271  FACTOR_VAR INT singleintvariable save in reg[40]
   lw $t3 0($sp)
   sw $t3 -168($sp)

#------------272  reg[40] = reg[39] JIAN reg[40]
   lw $t0 -164($sp)
   lw $t1 -168($sp)
   sub $t2 $t0 $t1
   sw $t2 -168($sp)

#------------273  FACTOR_ARRAY INT intarray [reg[40]] save in reg[41]
   lw $t3 -168($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 -4($t3)
   sw $t3 -172($sp)

#------------274  WRITE INT reg[41]
   li $v0 1
   lw $a0 -172($sp)
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

#------------299  JUMP to label_9
   j label_9

#------------300  label_8    ----------------Label----------------
label_8:

#------------301  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------302  FACTOR_CON INT 1 save in reg[7]
   li $t0 1
   sw $t0 -28($sp)

#------------303  reg[7] = reg[6] JIA reg[7]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   add $t2 $t0 $t1
   sw $t2 -28($sp)

#------------304  ASSIGN INT i = reg[7]
   lw $t3 -28($sp)
   sw $t3 0($sp)

#------------305  FACTOR_VAR INT i save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------306  IF reg[8] BEQ reg[0] THEN GOTO label_10
   lw $t0 -32($sp)
    beq $t0 $0 label_10

#------------307  label_9    ----------------Label----------------
label_9:

#------------308  JUMP to label_8
   j label_8

#------------309  label_10    ----------------Label----------------
label_10:

#------------310  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -36($sp)

#------------311  ASSIGN INT i = reg[9]
   lw $t3 -36($sp)
   sw $t3 0($sp)

#------------312  JUMP to label_12
   j label_12

#------------313  label_11    ----------------Label----------------
label_11:

#------------314  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------315  FACTOR_CON INT 1 save in reg[11]
   li $t0 1
   sw $t0 -44($sp)

#------------316  reg[11] = reg[10] JIA reg[11]
   lw $t0 -40($sp)
   lw $t1 -44($sp)
   add $t2 $t0 $t1
   sw $t2 -44($sp)

#------------317  ASSIGN INT i = reg[11]
   lw $t3 -44($sp)
   sw $t3 0($sp)

#------------318  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------319  IF reg[12] BEQ reg[0] THEN GOTO label_13
   lw $t0 -48($sp)
    beq $t0 $0 label_13

#------------320  label_12    ----------------Label----------------
label_12:

#------------321  JUMP to label_11
   j label_11

#------------322  label_13    ----------------Label----------------
label_13:

#------------323  FUNC VOID test_read(0)
   jr $ra

.func_test_read:

#------------324  VAR INT singleintvariable

#------------325  VAR CHAR singlecharvariable

#------------326  VAR INT _1

#------------327  VAR INT _2

#------------328  VAR INT _3

#------------329  VAR CHAR _4

#------------330  VAR CHAR _5

#------------331  VAR CHAR _6

#------------332  READ INT singleintvariable
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------333  READ CHAR singlecharvariable
   li $v0 12
   syscall
   sw $v0 -4($sp)

#------------334  READ INT _1
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------335  READ INT _2
   li $v0 5
   syscall
   sw $v0 -12($sp)

#------------336  READ INT _3
   li $v0 5
   syscall
   sw $v0 -16($sp)

#------------337  READ CHAR _4
   li $v0 12
   syscall
   sw $v0 -20($sp)

#------------338  READ CHAR _5
   li $v0 12
   syscall
   sw $v0 -24($sp)

#------------339  READ CHAR _6
   li $v0 12
   syscall
   sw $v0 -28($sp)

#------------340  FUNC VOID test_write(0)
   jr $ra

.func_test_write:

#------------341  CONST INT intconstant = 1

#------------342  ARRAY INT intarray[2]

#------------343  WRITE SingleString
   li $v0 4
   la $a0 .str_8
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------344  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -8($sp)

#------------345  FACTOR_ARRAY INT intarray [reg[1]] save in reg[2]
   lw $t3 -8($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -12($sp)

#------------346  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -16($sp)

#------------347  FACTOR_ARRAY INT intarray [reg[3]] save in reg[4]
   lw $t3 -16($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -20($sp)

#------------348  reg[4] = reg[2] JIA reg[4]
   lw $t0 -12($sp)
   lw $t1 -20($sp)
   add $t2 $t0 $t1
   sw $t2 -20($sp)

#------------349  WRITE INT reg[4]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------350  WRITE StringAndExpression
   li $v0 4
   la $a0 .str_9
   syscall

#------------351  FACTOR_CON INT 1 save in reg[5]
   li $t0 1
   sw $t0 -24($sp)

#------------352  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -28($sp)

#------------353  FACTOR_ARRAY INT intarray [reg[6]] save in reg[7]
   lw $t3 -28($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -32($sp)

#------------354  FACTOR_ARRAY INT intarray [reg[7]] save in reg[8]
   lw $t3 -32($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -36($sp)

#------------355  reg[8] = reg[5] CHENG reg[8]
   lw $t0 -24($sp)
   lw $t1 -36($sp)
   mult $t0 $t1
   mflo $t2
   sw $t2 -36($sp)

#------------356  WRITE INT reg[8]
   li $v0 1
   lw $a0 -36($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------357  FUNC VOID test_return_void(0)
   jr $ra

.func_test_return_void:

#------------358  RETURN reg[0] TO $V0 AND THEN GOTO 0
   lw $v0 4($sp)
   jr $ra

#------------359  FUNC CHAR test_return_char(0)
   jr $ra

.func_test_return_char:

#------------360  CONST CHAR charconstant = 97

#------------361  ARRAY CHAR chararray[2]

#------------362  VAR CHAR charvariable

#------------363  FACTOR_VAR CHAR charvariable save in reg[1]
   lw $t3 -8($sp)
   sw $t3 -12($sp)

#------------364  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------365  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -16($sp)

#------------366  FACTOR_ARRAY CHAR chararray [reg[2]] save in reg[3]
   lw $t3 -16($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -20($sp)

#------------367  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------368  FACTOR_CON CHAR 97 save in reg[4]
   li $t0 97
   sw $t0 -24($sp)

#------------369  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -24($sp)
   jr $ra

#------------370  CALL CHAR test_return_char(0)
   sw $ra -28($sp)
   addi $sp $sp -32
   jal .func_test_return_char
   subi $sp $sp -32
   lw $ra -28($sp)

#------------371  FACTOR_FUNC CHAR test_return_char save in reg[5]
   sw $v0 -28($sp)

#------------372  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------373  FACTOR_CON CHAR 97 save in reg[6]
   li $t0 97
   sw $t0 -32($sp)

#------------374  RETURN reg[6] TO $V0 AND THEN GOTO 0
   lw $v0 -32($sp)
   jr $ra

#------------375  FUNC INT test_return_int(0)
   jr $ra

.func_test_return_int:

#------------376  CONST INT intconstant = 1

#------------377  ARRAY INT intarray[2]

#------------378  VAR INT intvariable

#------------379  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------380  RETURN reg[1] TO $V0 AND THEN GOTO 0
   lw $v0 -12($sp)
   jr $ra

#------------381  FACTOR_VAR INT intvariable save in reg[2]
   lw $t3 -8($sp)
   sw $t3 -16($sp)

#------------382  RETURN reg[2] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------383  CALL INT test_return_int(0)
   sw $ra -20($sp)
   addi $sp $sp -24
   jal .func_test_return_int
   subi $sp $sp -24
   lw $ra -20($sp)

#------------384  FACTOR_FUNC INT test_return_int save in reg[3]
   sw $v0 -20($sp)

#------------385  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------386  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -24($sp)

#------------387  FACTOR_ARRAY INT intarray [reg[4]] save in reg[5]
   lw $t3 -24($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -28($sp)

#------------388  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -28($sp)
   jr $ra

#------------389  FACTOR_VAR INT intvariable save in reg[6]
   lw $t3 -8($sp)
   sw $t3 -32($sp)

#------------390  FACTOR_EXPR reg[6] save in reg[7]
   lw $t0 -32($sp)
   sw $t0 -36($sp)

#------------391  FACTOR_ARRAY INT intarray [reg[7]] save in reg[8]
   lw $t3 -36($sp)
   sll $t3 $t3 2
   sub $t3 $sp $t3
   lw $t3 0($t3)
   sw $t3 -40($sp)

#------------392  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -40($sp)
   jr $ra

#------------393  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -44($sp)

#------------394  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------395  FUNC VOID test_compound_empty(0)
   jr $ra

.func_test_compound_empty:

#------------396  FUNC VOID test_compound_noconstdecl(0)
   jr $ra

.func_test_compound_noconstdecl:

#------------397  VAR INT intvariable

#------------398  FACTOR_VAR INT intvariable save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------399  WRITE INT reg[1]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------400  FUNC VOID test_compound_novardecl(0)
   jr $ra

.func_test_compound_novardecl:

#------------401  CONST INT intconstant = 1

#------------402  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 0($sp)

#------------403  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------404  FUNC VOID test_compound_nostmts(0)
   jr $ra

.func_test_compound_nostmts:

#------------405  CONST INT intconstant = 1

#------------406  VAR INT intvariable

#------------407  FUNC INT test_if(1)
   jr $ra

.func_test_if:

#------------408  PARA INT number

#------------409  FACTOR_VAR INT number save in reg[1]
   lw $t3 0($sp)
   sw $t3 -4($sp)

#------------410  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -8($sp)

#------------411  IF reg[1] BGEQ reg[2] THEN GOTO label_14
   lw $t0 -4($sp)
   lw $t1 -8($sp)
    bge $t0 $t1 label_14

#------------412  FACTOR_VAR INT number save in reg[3]
   lw $t3 0($sp)
   sw $t3 -12($sp)

#------------413  FACTOR_CON INT 0 save in reg[4]
   li $t0 0
   sw $t0 -16($sp)

#------------414  reg[4] = reg[4] JIAN reg[3]
   lw $t0 -16($sp)
   lw $t1 -12($sp)
   sub $t2 $t0 $t1
   sw $t2 -16($sp)

#------------415  RETURN reg[4] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------416  JUMP to label_15
   j label_15

#------------417  label_14    ----------------Label----------------
label_14:

#------------418  label_15    ----------------Label----------------
label_15:

#------------419  FACTOR_VAR INT number save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------420  RETURN reg[5] TO $V0 AND THEN GOTO 0
   lw $v0 -20($sp)
   jr $ra

#------------421  FUNC VOID test_for(0)
   jr $ra

.func_test_for:

#------------422  CONST INT limit = 10

#------------423  VAR INT i

#------------424  WRITE Incremental for
   li $v0 4
   la $a0 .str_10
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------425  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------426  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------427  JUMP to label_17
   j label_17

#------------428  label_16    ----------------Label----------------
label_16:

#------------429  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------430  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -12($sp)

#------------431  reg[3] = reg[2] JIA reg[3]
   lw $t0 -8($sp)
   lw $t1 -12($sp)
   add $t2 $t0 $t1
   sw $t2 -12($sp)

#------------432  ASSIGN INT i = reg[3]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------433  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------434  FACTOR_CON INT 10 save in reg[5]
   li $t0 10
   sw $t0 -20($sp)

#------------435  IF reg[4] BGEQ reg[5] THEN GOTO label_18
   lw $t0 -16($sp)
   lw $t1 -20($sp)
    bge $t0 $t1 label_18

#------------436  label_17    ----------------Label----------------
label_17:

#------------437  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------438  FACTOR_VAR INT i save in reg[6]
   lw $t3 0($sp)
   sw $t3 -24($sp)

#------------439  WRITE INT reg[6]
   li $v0 1
   lw $a0 -24($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------440  JUMP to label_16
   j label_16

#------------441  label_18    ----------------Label----------------
label_18:

#------------442  WRITE Decremental for
   li $v0 4
   la $a0 .str_12
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------443  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -28($sp)

#------------444  ASSIGN INT i = reg[7]
   lw $t3 -28($sp)
   sw $t3 0($sp)

#------------445  JUMP to label_20
   j label_20

#------------446  label_19    ----------------Label----------------
label_19:

#------------447  FACTOR_VAR INT i save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------448  FACTOR_CON INT 1 save in reg[9]
   li $t0 1
   sw $t0 -36($sp)

#------------449  reg[9] = reg[8] JIAN reg[9]
   lw $t0 -32($sp)
   lw $t1 -36($sp)
   sub $t2 $t0 $t1
   sw $t2 -36($sp)

#------------450  ASSIGN INT i = reg[9]
   lw $t3 -36($sp)
   sw $t3 0($sp)

#------------451  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------452  FACTOR_CON INT 0 save in reg[11]
   li $t0 0
   sw $t0 -44($sp)

#------------453  IF reg[10] BLSS reg[11] THEN GOTO label_21
   lw $t0 -40($sp)
   lw $t1 -44($sp)
    blt $t0 $t1 label_21

#------------454  label_20    ----------------Label----------------
label_20:

#------------455  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------456  FACTOR_VAR INT i save in reg[12]
   lw $t3 0($sp)
   sw $t3 -48($sp)

#------------457  WRITE INT reg[12]
   li $v0 1
   lw $a0 -48($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------458  JUMP to label_19
   j label_19

#------------459  label_21    ----------------Label----------------
label_21:

#------------460  WRITE for: execute only once
   li $v0 4
   la $a0 .str_13
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------461  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -52($sp)

#------------462  ASSIGN INT i = reg[13]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------463  JUMP to label_23
   j label_23

#------------464  label_22    ----------------Label----------------
label_22:

#------------465  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------466  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -60($sp)

#------------467  reg[15] = reg[14] JIAN reg[15]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   sub $t2 $t0 $t1
   sw $t2 -60($sp)

#------------468  ASSIGN INT i = reg[15]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------469  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------470  FACTOR_CON INT 10 save in reg[17]
   li $t0 10
   sw $t0 -68($sp)

#------------471  IF reg[16] BLEQ reg[17] THEN GOTO label_24
   lw $t0 -64($sp)
   lw $t1 -68($sp)
    ble $t0 $t1 label_24

#------------472  label_23    ----------------Label----------------
label_23:

#------------473  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------474  FACTOR_VAR INT i save in reg[18]
   lw $t3 0($sp)
   sw $t3 -72($sp)

#------------475  WRITE INT reg[18]
   li $v0 1
   lw $a0 -72($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------476  JUMP to label_22
   j label_22

#------------477  label_24    ----------------Label----------------
label_24:

#------------478  FUNC VOID test_while(0)
   jr $ra

.func_test_while:

#------------479  CONST INT limit = 10

#------------480  VAR INT i

#------------481  WRITE Incremental while
   li $v0 4
   la $a0 .str_14
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------482  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 -4($sp)

#------------483  ASSIGN INT i = reg[1]
   lw $t3 -4($sp)
   sw $t3 0($sp)

#------------484  label_25    ----------------Label----------------
label_25:

#------------485  FACTOR_VAR INT i save in reg[2]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------486  FACTOR_CON INT 10 save in reg[3]
   li $t0 10
   sw $t0 -12($sp)

#------------487  IF reg[2] BGEQ reg[3] THEN GOTO label_26
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    bge $t0 $t1 label_26

#------------488  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------489  FACTOR_VAR INT i save in reg[4]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------490  WRITE INT reg[4]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------491  FACTOR_VAR INT i save in reg[5]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------492  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -24($sp)

#------------493  reg[6] = reg[5] JIA reg[6]
   lw $t0 -20($sp)
   lw $t1 -24($sp)
   add $t2 $t0 $t1
   sw $t2 -24($sp)

#------------494  ASSIGN INT i = reg[6]
   lw $t3 -24($sp)
   sw $t3 0($sp)

#------------495  JUMP to label_25
   j label_25

#------------496  label_26    ----------------Label----------------
label_26:

#------------497  WRITE Decremental while
   li $v0 4
   la $a0 .str_15
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------498  FACTOR_CON INT 10 save in reg[7]
   li $t0 10
   sw $t0 -28($sp)

#------------499  ASSIGN INT i = reg[7]
   lw $t3 -28($sp)
   sw $t3 0($sp)

#------------500  label_27    ----------------Label----------------
label_27:

#------------501  FACTOR_VAR INT i save in reg[8]
   lw $t3 0($sp)
   sw $t3 -32($sp)

#------------502  FACTOR_CON INT 0 save in reg[9]
   li $t0 0
   sw $t0 -36($sp)

#------------503  IF reg[8] BLSS reg[9] THEN GOTO label_28
   lw $t0 -32($sp)
   lw $t1 -36($sp)
    blt $t0 $t1 label_28

#------------504  WRITE I = 
   li $v0 4
   la $a0 .str_11
   syscall

#------------505  FACTOR_VAR INT i save in reg[10]
   lw $t3 0($sp)
   sw $t3 -40($sp)

#------------506  WRITE INT reg[10]
   li $v0 1
   lw $a0 -40($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------507  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------508  FACTOR_CON INT 1 save in reg[12]
   li $t0 1
   sw $t0 -48($sp)

#------------509  reg[12] = reg[11] JIAN reg[12]
   lw $t0 -44($sp)
   lw $t1 -48($sp)
   sub $t2 $t0 $t1
   sw $t2 -48($sp)

#------------510  ASSIGN INT i = reg[12]
   lw $t3 -48($sp)
   sw $t3 0($sp)

#------------511  JUMP to label_27
   j label_27

#------------512  label_28    ----------------Label----------------
label_28:

#------------513  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -52($sp)

#------------514  ASSIGN INT i = reg[13]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------515  label_29    ----------------Label----------------
label_29:

#------------516  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------517  FACTOR_CON INT 10 save in reg[15]
   li $t0 10
   sw $t0 -60($sp)

#------------518  IF reg[14] BLEQ reg[15] THEN GOTO label_30
   lw $t0 -56($sp)
   lw $t1 -60($sp)
    ble $t0 $t1 label_30

#------------519  WRITE Never while
   li $v0 4
   la $a0 .str_16
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------520  JUMP to label_29
   j label_29

#------------521  label_30    ----------------Label----------------
label_30:

#------------522  FUNC VOID test_assign(0)
   jr $ra

.func_test_assign:

#------------523  VAR INT singleintvariable

#------------524  ARRAY INT intarray[2]

#------------525  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -12($sp)

#------------526  ASSIGN INT singleintvariable = reg[1]
   lw $t3 -12($sp)
   sw $t3 0($sp)

#------------527  FACTOR_CON INT 0 save in reg[2]
   li $t0 0
   sw $t0 -16($sp)

#------------528  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -20($sp)

#------------529  ASSIGN_ARR INT intarray[reg[2]] = reg[3]
   lw $t0 -16($sp)
   lw $t1 -20($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------530  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -24($sp)

#------------531  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -28($sp)

#------------532  ASSIGN_ARR INT intarray[reg[4]] = reg[5]
   lw $t0 -24($sp)
   lw $t1 -28($sp)
   sll $t0 $t0 2
   sub $t0 $sp $t0
   sw $t1 -4($t0)

#------------533  FUNC VOID test_stmt(0)
   jr $ra

.func_test_stmt:

#------------534  VAR INT i

#------------535  FACTOR_CON INT 1 save in reg[1]
   li $t0 1
   sw $t0 -4($sp)

#------------536  IF reg[1] BEQ reg[0] THEN GOTO label_35
   lw $t0 -4($sp)
    beq $t0 $0 label_35

#------------537  FACTOR_CON INT 2 save in reg[2]
   li $t0 2
   sw $t0 -8($sp)

#------------538  IF reg[2] BEQ reg[0] THEN GOTO label_33
   lw $t0 -8($sp)
    beq $t0 $0 label_33

#------------539  FACTOR_CON INT 3 save in reg[3]
   li $t0 3
   sw $t0 -12($sp)

#------------540  IF reg[3] BEQ reg[0] THEN GOTO label_31
   lw $t0 -12($sp)
    beq $t0 $0 label_31

#------------541  WRITE if if if
   li $v0 4
   la $a0 .str_17
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------542  JUMP to label_32
   j label_32

#------------543  label_31    ----------------Label----------------
label_31:

#------------544  WRITE if if else
   li $v0 4
   la $a0 .str_18
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------545  label_32    ----------------Label----------------
label_32:

#------------546  JUMP to label_34
   j label_34

#------------547  label_33    ----------------Label----------------
label_33:

#------------548  WRITE if else
   li $v0 4
   la $a0 .str_19
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------549  label_34    ----------------Label----------------
label_34:

#------------550  JUMP to label_36
   j label_36

#------------551  label_35    ----------------Label----------------
label_35:

#------------552  WRITE else
   li $v0 4
   la $a0 .str_20
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------553  label_36    ----------------Label----------------
label_36:

#------------554  label_37    ----------------Label----------------
label_37:

#------------555  FACTOR_CON INT 1 save in reg[4]
   li $t0 1
   sw $t0 -16($sp)

#------------556  IF reg[4] BEQ reg[0] THEN GOTO label_67
   lw $t0 -16($sp)
    beq $t0 $0 label_67

#------------557  label_38    ----------------Label----------------
label_38:

#------------558  FACTOR_CON INT 2 save in reg[5]
   li $t0 2
   sw $t0 -20($sp)

#------------559  IF reg[5] BEQ reg[0] THEN GOTO label_46
   lw $t0 -20($sp)
    beq $t0 $0 label_46

#------------560  label_39    ----------------Label----------------
label_39:

#------------561  FACTOR_CON INT 3 save in reg[6]
   li $t0 3
   sw $t0 -24($sp)

#------------562  IF reg[6] BEQ reg[0] THEN GOTO label_40
   lw $t0 -24($sp)
    beq $t0 $0 label_40

#------------563  WRITE while while while
   li $v0 4
   la $a0 .str_21
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------564  JUMP to label_39
   j label_39

#------------565  label_40    ----------------Label----------------
label_40:

#------------566  FACTOR_CON INT 3 save in reg[7]
   li $t0 3
   sw $t0 -28($sp)

#------------567  IF reg[7] BEQ reg[0] THEN GOTO label_44
   lw $t0 -28($sp)
    beq $t0 $0 label_44

#------------568  WRITE while while if
   li $v0 4
   la $a0 .str_22
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------569  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -32($sp)

#------------570  ASSIGN INT i = reg[8]
   lw $t3 -32($sp)
   sw $t3 0($sp)

#------------571  JUMP to label_42
   j label_42

#------------572  label_41    ----------------Label----------------
label_41:

#------------573  FACTOR_VAR INT i save in reg[9]
   lw $t3 0($sp)
   sw $t3 -36($sp)

#------------574  FACTOR_CON INT 1 save in reg[10]
   li $t0 1
   sw $t0 -40($sp)

#------------575  reg[10] = reg[9] JIA reg[10]
   lw $t0 -36($sp)
   lw $t1 -40($sp)
   add $t2 $t0 $t1
   sw $t2 -40($sp)

#------------576  ASSIGN INT i = reg[10]
   lw $t3 -40($sp)
   sw $t3 0($sp)

#------------577  FACTOR_VAR INT i save in reg[11]
   lw $t3 0($sp)
   sw $t3 -44($sp)

#------------578  FACTOR_CON INT 4 save in reg[12]
   li $t0 4
   sw $t0 -48($sp)

#------------579  IF reg[11] BGEQ reg[12] THEN GOTO label_43
   lw $t0 -44($sp)
   lw $t1 -48($sp)
    bge $t0 $t1 label_43

#------------580  label_42    ----------------Label----------------
label_42:

#------------581  WRITE while while if for
   li $v0 4
   la $a0 .str_23
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------582  JUMP to label_41
   j label_41

#------------583  label_43    ----------------Label----------------
label_43:

#------------584  JUMP to label_45
   j label_45

#------------585  label_44    ----------------Label----------------
label_44:

#------------586  label_45    ----------------Label----------------
label_45:

#------------587  JUMP to label_38
   j label_38

#------------588  label_46    ----------------Label----------------
label_46:

#------------589  FACTOR_CON INT 0 save in reg[13]
   li $t0 0
   sw $t0 -52($sp)

#------------590  ASSIGN INT i = reg[13]
   lw $t3 -52($sp)
   sw $t3 0($sp)

#------------591  JUMP to label_48
   j label_48

#------------592  label_47    ----------------Label----------------
label_47:

#------------593  FACTOR_VAR INT i save in reg[14]
   lw $t3 0($sp)
   sw $t3 -56($sp)

#------------594  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -60($sp)

#------------595  reg[15] = reg[14] JIA reg[15]
   lw $t0 -56($sp)
   lw $t1 -60($sp)
   add $t2 $t0 $t1
   sw $t2 -60($sp)

#------------596  ASSIGN INT i = reg[15]
   lw $t3 -60($sp)
   sw $t3 0($sp)

#------------597  FACTOR_VAR INT i save in reg[16]
   lw $t3 0($sp)
   sw $t3 -64($sp)

#------------598  FACTOR_CON INT 2 save in reg[17]
   li $t0 2
   sw $t0 -68($sp)

#------------599  IF reg[16] BGEQ reg[17] THEN GOTO label_57
   lw $t0 -64($sp)
   lw $t1 -68($sp)
    bge $t0 $t1 label_57

#------------600  label_48    ----------------Label----------------
label_48:

#------------601  FACTOR_CON INT 0 save in reg[18]
   li $t0 0
   sw $t0 -72($sp)

#------------602  ASSIGN INT i = reg[18]
   lw $t3 -72($sp)
   sw $t3 0($sp)

#------------603  JUMP to label_50
   j label_50

#------------604  label_49    ----------------Label----------------
label_49:

#------------605  FACTOR_VAR INT i save in reg[19]
   lw $t3 0($sp)
   sw $t3 -76($sp)

#------------606  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -80($sp)

#------------607  reg[20] = reg[19] JIA reg[20]
   lw $t0 -76($sp)
   lw $t1 -80($sp)
   add $t2 $t0 $t1
   sw $t2 -80($sp)

#------------608  ASSIGN INT i = reg[20]
   lw $t3 -80($sp)
   sw $t3 0($sp)

#------------609  FACTOR_VAR INT i save in reg[21]
   lw $t3 0($sp)
   sw $t3 -84($sp)

#------------610  FACTOR_CON INT 3 save in reg[22]
   li $t0 3
   sw $t0 -88($sp)

#------------611  IF reg[21] BGEQ reg[22] THEN GOTO label_56
   lw $t0 -84($sp)
   lw $t1 -88($sp)
    bge $t0 $t1 label_56

#------------612  label_50    ----------------Label----------------
label_50:

#------------613  FACTOR_CON INT 0 save in reg[23]
   li $t0 0
   sw $t0 -92($sp)

#------------614  ASSIGN INT i = reg[23]
   lw $t3 -92($sp)
   sw $t3 0($sp)

#------------615  JUMP to label_52
   j label_52

#------------616  label_51    ----------------Label----------------
label_51:

#------------617  FACTOR_VAR INT i save in reg[24]
   lw $t3 0($sp)
   sw $t3 -96($sp)

#------------618  FACTOR_CON INT 1 save in reg[25]
   li $t0 1
   sw $t0 -100($sp)

#------------619  reg[25] = reg[24] JIA reg[25]
   lw $t0 -96($sp)
   lw $t1 -100($sp)
   add $t2 $t0 $t1
   sw $t2 -100($sp)

#------------620  ASSIGN INT i = reg[25]
   lw $t3 -100($sp)
   sw $t3 0($sp)

#------------621  FACTOR_VAR INT i save in reg[26]
   lw $t3 0($sp)
   sw $t3 -104($sp)

#------------622  FACTOR_CON INT 4 save in reg[27]
   li $t0 4
   sw $t0 -108($sp)

#------------623  IF reg[26] BGEQ reg[27] THEN GOTO label_55
   lw $t0 -104($sp)
   lw $t1 -108($sp)
    bge $t0 $t1 label_55

#------------624  label_52    ----------------Label----------------
label_52:

#------------625  WRITE while for for for
   li $v0 4
   la $a0 .str_24
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------626  FACTOR_CON INT 5 save in reg[28]
   li $t0 5
   sw $t0 -112($sp)

#------------627  IF reg[28] BEQ reg[0] THEN GOTO label_53
   lw $t0 -112($sp)
    beq $t0 $0 label_53

#------------628  WRITE while for for for if
   li $v0 4
   la $a0 .str_25
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------629  JUMP to label_54
   j label_54

#------------630  label_53    ----------------Label----------------
label_53:

#------------631  label_54    ----------------Label----------------
label_54:

#------------632  JUMP to label_51
   j label_51

#------------633  label_55    ----------------Label----------------
label_55:

#------------634  JUMP to label_49
   j label_49

#------------635  label_56    ----------------Label----------------
label_56:

#------------636  JUMP to label_47
   j label_47

#------------637  label_57    ----------------Label----------------
label_57:

#------------638  WRITE while
   li $v0 4
   la $a0 .str_26
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------639  FACTOR_CON INT 2 save in reg[29]
   li $t0 2
   sw $t0 -116($sp)

#------------640  IF reg[29] BEQ reg[0] THEN GOTO label_65
   lw $t0 -116($sp)
    beq $t0 $0 label_65

#------------641  WRITE while if
   li $v0 4
   la $a0 .str_27
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------642  label_58    ----------------Label----------------
label_58:

#------------643  FACTOR_CON INT 3 save in reg[30]
   li $t0 3
   sw $t0 -120($sp)

#------------644  IF reg[30] BEQ reg[0] THEN GOTO label_64
   lw $t0 -120($sp)
    beq $t0 $0 label_64

#------------645  label_59    ----------------Label----------------
label_59:

#------------646  FACTOR_CON INT 4 save in reg[31]
   li $t0 4
   sw $t0 -124($sp)

#------------647  IF reg[31] BEQ reg[0] THEN GOTO label_63
   lw $t0 -124($sp)
    beq $t0 $0 label_63

#------------648  FACTOR_CON INT 0 save in reg[32]
   li $t0 0
   sw $t0 -128($sp)

#------------649  ASSIGN INT i = reg[32]
   lw $t3 -128($sp)
   sw $t3 0($sp)

#------------650  JUMP to label_61
   j label_61

#------------651  label_60    ----------------Label----------------
label_60:

#------------652  FACTOR_VAR INT i save in reg[33]
   lw $t3 0($sp)
   sw $t3 -132($sp)

#------------653  FACTOR_CON INT 1 save in reg[34]
   li $t0 1
   sw $t0 -136($sp)

#------------654  reg[34] = reg[33] JIA reg[34]
   lw $t0 -132($sp)
   lw $t1 -136($sp)
   add $t2 $t0 $t1
   sw $t2 -136($sp)

#------------655  ASSIGN INT i = reg[34]
   lw $t3 -136($sp)
   sw $t3 0($sp)

#------------656  FACTOR_VAR INT i save in reg[35]
   lw $t3 0($sp)
   sw $t3 -140($sp)

#------------657  FACTOR_CON INT 5 save in reg[36]
   li $t0 5
   sw $t0 -144($sp)

#------------658  IF reg[35] BGEQ reg[36] THEN GOTO label_62
   lw $t0 -140($sp)
   lw $t1 -144($sp)
    bge $t0 $t1 label_62

#------------659  label_61    ----------------Label----------------
label_61:

#------------660  WRITE while if while while for
   li $v0 4
   la $a0 .str_28
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------661  JUMP to label_60
   j label_60

#------------662  label_62    ----------------Label----------------
label_62:

#------------663  JUMP to label_59
   j label_59

#------------664  label_63    ----------------Label----------------
label_63:

#------------665  JUMP to label_58
   j label_58

#------------666  label_64    ----------------Label----------------
label_64:

#------------667  JUMP to label_66
   j label_66

#------------668  label_65    ----------------Label----------------
label_65:

#------------669  label_66    ----------------Label----------------
label_66:

#------------670  JUMP to label_37
   j label_37

#------------671  label_67    ----------------Label----------------
label_67:

#------------672  FUNC VOID printcompareop(0)
   jr $ra

.func_printcompareop:

#------------673  WRITE CompareEqual: 
   li $v0 4
   la $a0 .str_29
   syscall

#------------674  FACTOR_CON INT 0 save in reg[1]
   li $t0 0
   sw $t0 0($sp)

#------------675  WRITE INT reg[1]
   li $v0 1
   lw $a0 0($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------676  WRITE CompareNotEqual: 
   li $v0 4
   la $a0 .str_30
   syscall

#------------677  FACTOR_CON INT 1 save in reg[2]
   li $t0 1
   sw $t0 -4($sp)

#------------678  WRITE INT reg[2]
   li $v0 1
   lw $a0 -4($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------679  WRITE CompareLess: 
   li $v0 4
   la $a0 .str_31
   syscall

#------------680  FACTOR_CON INT 2 save in reg[3]
   li $t0 2
   sw $t0 -8($sp)

#------------681  WRITE INT reg[3]
   li $v0 1
   lw $a0 -8($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------682  WRITE CompareLessEqual: 
   li $v0 4
   la $a0 .str_32
   syscall

#------------683  FACTOR_CON INT 3 save in reg[4]
   li $t0 3
   sw $t0 -12($sp)

#------------684  WRITE INT reg[4]
   li $v0 1
   lw $a0 -12($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------685  WRITE CompareGreater: 
   li $v0 4
   la $a0 .str_33
   syscall

#------------686  FACTOR_CON INT 4 save in reg[5]
   li $t0 4
   sw $t0 -16($sp)

#------------687  WRITE INT reg[5]
   li $v0 1
   lw $a0 -16($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------688  WRITE CompareGreaterEqual: 
   li $v0 4
   la $a0 .str_34
   syscall

#------------689  FACTOR_CON INT 5 save in reg[6]
   li $t0 5
   sw $t0 -20($sp)

#------------690  WRITE INT reg[6]
   li $v0 1
   lw $a0 -20($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------691  FUNC INT threewayscompare(2)
   jr $ra

.func_threewayscompare:

#------------692  PARA INT a

#------------693  PARA INT b

#------------694  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -8($sp)

#------------695  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -12($sp)

#------------696  IF reg[1] BLEQ reg[2] THEN GOTO label_68
   lw $t0 -8($sp)
   lw $t1 -12($sp)
    ble $t0 $t1 label_68

#------------697  FACTOR_CON INT 1 save in reg[3]
   li $t0 1
   sw $t0 -16($sp)

#------------698  RETURN reg[3] TO $V0 AND THEN GOTO 0
   lw $v0 -16($sp)
   jr $ra

#------------699  JUMP to label_69
   j label_69

#------------700  label_68    ----------------Label----------------
label_68:

#------------701  label_69    ----------------Label----------------
label_69:

#------------702  FACTOR_VAR INT a save in reg[4]
   lw $t3 0($sp)
   sw $t3 -20($sp)

#------------703  FACTOR_VAR INT b save in reg[5]
   lw $t3 -4($sp)
   sw $t3 -24($sp)

#------------704  IF reg[4] BGEQ reg[5] THEN GOTO label_70
   lw $t0 -20($sp)
   lw $t1 -24($sp)
    bge $t0 $t1 label_70

#------------705  FACTOR_CON INT 1 save in reg[6]
   li $t0 1
   sw $t0 -28($sp)

#------------706  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -32($sp)

#------------707  reg[7] = reg[7] JIAN reg[6]
   lw $t0 -32($sp)
   lw $t1 -28($sp)
   sub $t2 $t0 $t1
   sw $t2 -32($sp)

#------------708  RETURN reg[7] TO $V0 AND THEN GOTO 0
   lw $v0 -32($sp)
   jr $ra

#------------709  JUMP to label_71
   j label_71

#------------710  label_70    ----------------Label----------------
label_70:

#------------711  label_71    ----------------Label----------------
label_71:

#------------712  FACTOR_CON INT 0 save in reg[8]
   li $t0 0
   sw $t0 -36($sp)

#------------713  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -36($sp)
   jr $ra

#------------714  FUNC INT richcompare(3)
   jr $ra

.func_richcompare:

#------------715  PARA INT a

#------------716  PARA INT b

#------------717  PARA INT compareop

#------------718  VAR INT order

#------------719  FACTOR_VAR INT a save in reg[1]
   lw $t3 0($sp)
   sw $t3 -16($sp)

#------------720  FACTOR_VAR INT b save in reg[2]
   lw $t3 -4($sp)
   sw $t3 -20($sp)

#------------721  PUSH INT parareg[6] from reg[1]
   sw $ra -24($sp)
   lw $t0 -16($sp)
   sw $t0 -28($sp)

#------------722  PUSH INT parareg[7] from reg[2]
   lw $t0 -20($sp)
   sw $t0 -32($sp)

#------------723  CALL INT threewayscompare(2)
   addi $sp $sp -28
   jal .func_threewayscompare
   subi $sp $sp -28
   lw $ra -24($sp)

#------------724  FACTOR_FUNC INT threewayscompare save in reg[3]
   sw $v0 -24($sp)

#------------725  ASSIGN INT order = reg[3]
   lw $t3 -24($sp)
   sw $t3 -12($sp)

#------------726  FACTOR_VAR INT compareop save in reg[4]
   lw $t3 -8($sp)
   sw $t3 -28($sp)

#------------727  FACTOR_CON INT 0 save in reg[5]
   li $t0 0
   sw $t0 -32($sp)

#------------728  IF reg[4] BNE reg[5] THEN GOTO label_74
   lw $t0 -28($sp)
   lw $t1 -32($sp)
    bne $t0 $t1 label_74

#------------729  FACTOR_VAR INT order save in reg[6]
   lw $t3 -12($sp)
   sw $t3 -36($sp)

#------------730  FACTOR_CON INT 0 save in reg[7]
   li $t0 0
   sw $t0 -40($sp)

#------------731  IF reg[6] BNE reg[7] THEN GOTO label_72
   lw $t0 -36($sp)
   lw $t1 -40($sp)
    bne $t0 $t1 label_72

#------------732  FACTOR_CON INT 1 save in reg[8]
   li $t0 1
   sw $t0 -44($sp)

#------------733  RETURN reg[8] TO $V0 AND THEN GOTO 0
   lw $v0 -44($sp)
   jr $ra

#------------734  JUMP to label_73
   j label_73

#------------735  label_72    ----------------Label----------------
label_72:

#------------736  FACTOR_CON INT 0 save in reg[9]
   li $t0 0
   sw $t0 -48($sp)

#------------737  RETURN reg[9] TO $V0 AND THEN GOTO 0
   lw $v0 -48($sp)
   jr $ra

#------------738  label_73    ----------------Label----------------
label_73:

#------------739  JUMP to label_95
   j label_95

#------------740  label_74    ----------------Label----------------
label_74:

#------------741  FACTOR_VAR INT compareop save in reg[10]
   lw $t3 -8($sp)
   sw $t3 -52($sp)

#------------742  FACTOR_CON INT 2 save in reg[11]
   li $t0 2
   sw $t0 -56($sp)

#------------743  IF reg[10] BNE reg[11] THEN GOTO label_77
   lw $t0 -52($sp)
   lw $t1 -56($sp)
    bne $t0 $t1 label_77

#------------744  FACTOR_VAR INT order save in reg[12]
   lw $t3 -12($sp)
   sw $t3 -60($sp)

#------------745  FACTOR_CON INT 1 save in reg[13]
   li $t0 1
   sw $t0 -64($sp)

#------------746  FACTOR_CON INT 0 save in reg[14]
   li $t0 0
   sw $t0 -68($sp)

#------------747  reg[14] = reg[14] JIAN reg[13]
   lw $t0 -68($sp)
   lw $t1 -64($sp)
   sub $t2 $t0 $t1
   sw $t2 -68($sp)

#------------748  IF reg[12] BNE reg[14] THEN GOTO label_75
   lw $t0 -60($sp)
   lw $t1 -68($sp)
    bne $t0 $t1 label_75

#------------749  FACTOR_CON INT 1 save in reg[15]
   li $t0 1
   sw $t0 -72($sp)

#------------750  RETURN reg[15] TO $V0 AND THEN GOTO 0
   lw $v0 -72($sp)
   jr $ra

#------------751  JUMP to label_76
   j label_76

#------------752  label_75    ----------------Label----------------
label_75:

#------------753  FACTOR_CON INT 0 save in reg[16]
   li $t0 0
   sw $t0 -76($sp)

#------------754  RETURN reg[16] TO $V0 AND THEN GOTO 0
   lw $v0 -76($sp)
   jr $ra

#------------755  label_76    ----------------Label----------------
label_76:

#------------756  JUMP to label_94
   j label_94

#------------757  label_77    ----------------Label----------------
label_77:

#------------758  FACTOR_VAR INT compareop save in reg[17]
   lw $t3 -8($sp)
   sw $t3 -80($sp)

#------------759  FACTOR_CON INT 4 save in reg[18]
   li $t0 4
   sw $t0 -84($sp)

#------------760  IF reg[17] BNE reg[18] THEN GOTO label_80
   lw $t0 -80($sp)
   lw $t1 -84($sp)
    bne $t0 $t1 label_80

#------------761  FACTOR_VAR INT order save in reg[19]
   lw $t3 -12($sp)
   sw $t3 -88($sp)

#------------762  FACTOR_CON INT 1 save in reg[20]
   li $t0 1
   sw $t0 -92($sp)

#------------763  IF reg[19] BNE reg[20] THEN GOTO label_78
   lw $t0 -88($sp)
   lw $t1 -92($sp)
    bne $t0 $t1 label_78

#------------764  FACTOR_CON INT 1 save in reg[21]
   li $t0 1
   sw $t0 -96($sp)

#------------765  RETURN reg[21] TO $V0 AND THEN GOTO 0
   lw $v0 -96($sp)
   jr $ra

#------------766  JUMP to label_79
   j label_79

#------------767  label_78    ----------------Label----------------
label_78:

#------------768  FACTOR_CON INT 0 save in reg[22]
   li $t0 0
   sw $t0 -100($sp)

#------------769  RETURN reg[22] TO $V0 AND THEN GOTO 0
   lw $v0 -100($sp)
   jr $ra

#------------770  label_79    ----------------Label----------------
label_79:

#------------771  JUMP to label_93
   j label_93

#------------772  label_80    ----------------Label----------------
label_80:

#------------773  FACTOR_VAR INT compareop save in reg[23]
   lw $t3 -8($sp)
   sw $t3 -104($sp)

#------------774  FACTOR_CON INT 1 save in reg[24]
   li $t0 1
   sw $t0 -108($sp)

#------------775  IF reg[23] BNE reg[24] THEN GOTO label_83
   lw $t0 -104($sp)
   lw $t1 -108($sp)
    bne $t0 $t1 label_83

#------------776  FACTOR_VAR INT a save in reg[25]
   lw $t3 0($sp)
   sw $t3 -112($sp)

#------------777  FACTOR_VAR INT b save in reg[26]
   lw $t3 -4($sp)
   sw $t3 -116($sp)

#------------778  FACTOR_CON INT 0 save in reg[27]
   li $t0 0
   sw $t0 -120($sp)

#------------779  PUSH INT parareg[8] from reg[25]
   sw $ra -124($sp)
   lw $t0 -112($sp)
   sw $t0 -128($sp)

#------------780  PUSH INT parareg[9] from reg[26]
   lw $t0 -116($sp)
   sw $t0 -132($sp)

#------------781  PUSH INT parareg[10] from reg[27]
   lw $t0 -120($sp)
   sw $t0 -136($sp)

#------------782  CALL INT richcompare(3)
   addi $sp $sp -128
   jal .func_richcompare
   subi $sp $sp -128
   lw $ra -124($sp)

#------------783  FACTOR_FUNC INT richcompare save in reg[28]
   sw $v0 -124($sp)

#------------784  ASSIGN INT order = reg[28]
   lw $t3 -124($sp)
   sw $t3 -12($sp)

#------------785  FACTOR_VAR INT order save in reg[29]
   lw $t3 -12($sp)
   sw $t3 -128($sp)

#------------786  IF reg[29] BEQ reg[0] THEN GOTO label_81
   lw $t0 -128($sp)
    beq $t0 $0 label_81

#------------787  FACTOR_CON INT 0 save in reg[30]
   li $t0 0
   sw $t0 -132($sp)

#------------788  RETURN reg[30] TO $V0 AND THEN GOTO 0
   lw $v0 -132($sp)
   jr $ra

#------------789  JUMP to label_82
   j label_82

#------------790  label_81    ----------------Label----------------
label_81:

#------------791  FACTOR_CON INT 1 save in reg[31]
   li $t0 1
   sw $t0 -136($sp)

#------------792  RETURN reg[31] TO $V0 AND THEN GOTO 0
   lw $v0 -136($sp)
   jr $ra

#------------793  label_82    ----------------Label----------------
label_82:

#------------794  JUMP to label_92
   j label_92

#------------795  label_83    ----------------Label----------------
label_83:

#------------796  FACTOR_VAR INT compareop save in reg[32]
   lw $t3 -8($sp)
   sw $t3 -140($sp)

#------------797  FACTOR_CON INT 3 save in reg[33]
   li $t0 3
   sw $t0 -144($sp)

#------------798  IF reg[32] BNE reg[33] THEN GOTO label_86
   lw $t0 -140($sp)
   lw $t1 -144($sp)
    bne $t0 $t1 label_86

#------------799  FACTOR_VAR INT a save in reg[34]
   lw $t3 0($sp)
   sw $t3 -148($sp)

#------------800  FACTOR_VAR INT b save in reg[35]
   lw $t3 -4($sp)
   sw $t3 -152($sp)

#------------801  FACTOR_CON INT 4 save in reg[36]
   li $t0 4
   sw $t0 -156($sp)

#------------802  PUSH INT parareg[11] from reg[34]
   sw $ra -160($sp)
   lw $t0 -148($sp)
   sw $t0 -164($sp)

#------------803  PUSH INT parareg[12] from reg[35]
   lw $t0 -152($sp)
   sw $t0 -168($sp)

#------------804  PUSH INT parareg[13] from reg[36]
   lw $t0 -156($sp)
   sw $t0 -172($sp)

#------------805  CALL INT richcompare(3)
   addi $sp $sp -164
   jal .func_richcompare
   subi $sp $sp -164
   lw $ra -160($sp)

#------------806  FACTOR_FUNC INT richcompare save in reg[37]
   sw $v0 -160($sp)

#------------807  ASSIGN INT order = reg[37]
   lw $t3 -160($sp)
   sw $t3 -12($sp)

#------------808  FACTOR_VAR INT order save in reg[38]
   lw $t3 -12($sp)
   sw $t3 -164($sp)

#------------809  IF reg[38] BEQ reg[0] THEN GOTO label_84
   lw $t0 -164($sp)
    beq $t0 $0 label_84

#------------810  FACTOR_CON INT 0 save in reg[39]
   li $t0 0
   sw $t0 -168($sp)

#------------811  RETURN reg[39] TO $V0 AND THEN GOTO 0
   lw $v0 -168($sp)
   jr $ra

#------------812  JUMP to label_85
   j label_85

#------------813  label_84    ----------------Label----------------
label_84:

#------------814  FACTOR_CON INT 1 save in reg[40]
   li $t0 1
   sw $t0 -172($sp)

#------------815  RETURN reg[40] TO $V0 AND THEN GOTO 0
   lw $v0 -172($sp)
   jr $ra

#------------816  label_85    ----------------Label----------------
label_85:

#------------817  JUMP to label_91
   j label_91

#------------818  label_86    ----------------Label----------------
label_86:

#------------819  FACTOR_VAR INT compareop save in reg[41]
   lw $t3 -8($sp)
   sw $t3 -176($sp)

#------------820  FACTOR_CON INT 5 save in reg[42]
   li $t0 5
   sw $t0 -180($sp)

#------------821  IF reg[41] BNE reg[42] THEN GOTO label_89
   lw $t0 -176($sp)
   lw $t1 -180($sp)
    bne $t0 $t1 label_89

#------------822  FACTOR_VAR INT a save in reg[43]
   lw $t3 0($sp)
   sw $t3 -184($sp)

#------------823  FACTOR_VAR INT b save in reg[44]
   lw $t3 -4($sp)
   sw $t3 -188($sp)

#------------824  FACTOR_CON INT 2 save in reg[45]
   li $t0 2
   sw $t0 -192($sp)

#------------825  PUSH INT parareg[14] from reg[43]
   sw $ra -196($sp)
   lw $t0 -184($sp)
   sw $t0 -200($sp)

#------------826  PUSH INT parareg[15] from reg[44]
   lw $t0 -188($sp)
   sw $t0 -204($sp)

#------------827  PUSH INT parareg[16] from reg[45]
   lw $t0 -192($sp)
   sw $t0 -208($sp)

#------------828  CALL INT richcompare(3)
   addi $sp $sp -200
   jal .func_richcompare
   subi $sp $sp -200
   lw $ra -196($sp)

#------------829  FACTOR_FUNC INT richcompare save in reg[46]
   sw $v0 -196($sp)

#------------830  ASSIGN INT order = reg[46]
   lw $t3 -196($sp)
   sw $t3 -12($sp)

#------------831  FACTOR_VAR INT order save in reg[47]
   lw $t3 -12($sp)
   sw $t3 -200($sp)

#------------832  IF reg[47] BEQ reg[0] THEN GOTO label_87
   lw $t0 -200($sp)
    beq $t0 $0 label_87

#------------833  FACTOR_CON INT 0 save in reg[48]
   li $t0 0
   sw $t0 -204($sp)

#------------834  RETURN reg[48] TO $V0 AND THEN GOTO 0
   lw $v0 -204($sp)
   jr $ra

#------------835  JUMP to label_88
   j label_88

#------------836  label_87    ----------------Label----------------
label_87:

#------------837  FACTOR_CON INT 1 save in reg[49]
   li $t0 1
   sw $t0 -208($sp)

#------------838  RETURN reg[49] TO $V0 AND THEN GOTO 0
   lw $v0 -208($sp)
   jr $ra

#------------839  label_88    ----------------Label----------------
label_88:

#------------840  JUMP to label_90
   j label_90

#------------841  label_89    ----------------Label----------------
label_89:

#------------842  WRITE Unknown CompareOp: 
   li $v0 4
   la $a0 .str_35
   syscall

#------------843  FACTOR_VAR INT compareop save in reg[50]
   lw $t3 -8($sp)
   sw $t3 -212($sp)

#------------844  WRITE INT reg[50]
   li $v0 1
   lw $a0 -212($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------845  FACTOR_CON INT 1 save in reg[51]
   li $t0 1
   sw $t0 -216($sp)

#------------846  FACTOR_CON INT 0 save in reg[52]
   li $t0 0
   sw $t0 -220($sp)

#------------847  reg[52] = reg[52] JIAN reg[51]
   lw $t0 -220($sp)
   lw $t1 -216($sp)
   sub $t2 $t0 $t1
   sw $t2 -220($sp)

#------------848  RETURN reg[52] TO $V0 AND THEN GOTO 0
   lw $v0 -220($sp)
   jr $ra

#------------849  label_90    ----------------Label----------------
label_90:

#------------850  label_91    ----------------Label----------------
label_91:

#------------851  label_92    ----------------Label----------------
label_92:

#------------852  label_93    ----------------Label----------------
label_93:

#------------853  label_94    ----------------Label----------------
label_94:

#------------854  label_95    ----------------Label----------------
label_95:

#------------855  FACTOR_CON INT 1 save in reg[53]
   li $t0 1
   sw $t0 -224($sp)

#------------856  FACTOR_CON INT 0 save in reg[54]
   li $t0 0
   sw $t0 -228($sp)

#------------857  reg[54] = reg[54] JIAN reg[53]
   lw $t0 -228($sp)
   lw $t1 -224($sp)
   sub $t2 $t0 $t1
   sw $t2 -228($sp)

#------------858  RETURN reg[54] TO $V0 AND THEN GOTO 0
   lw $v0 -228($sp)
   jr $ra

#------------859  FUNC VOID main(0)
   jr $ra

.func_main:

#------------860  VAR INT a

#------------861  VAR INT b

#------------862  VAR INT compareop

#------------863  VAR INT result

#------------864  WRITE Please input three integers: A, B and CompareOp
   li $v0 4
   la $a0 .str_36
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------865  WRITE where CompareOp are:
   li $v0 4
   la $a0 .str_37
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------866  CALL VOID printcompareop(0)
   sw $ra -16($sp)
   addi $sp $sp -20
   jal .func_printcompareop
   subi $sp $sp -20
   lw $ra -16($sp)

#------------867  READ INT a
   li $v0 5
   syscall
   sw $v0 0($sp)

#------------868  READ INT b
   li $v0 5
   syscall
   sw $v0 -4($sp)

#------------869  READ INT compareop
   li $v0 5
   syscall
   sw $v0 -8($sp)

#------------870  FACTOR_VAR INT a save in reg[55]
   lw $t3 0($sp)
   sw $t3 -232($sp)

#------------871  FACTOR_VAR INT b save in reg[56]
   lw $t3 -4($sp)
   sw $t3 -236($sp)

#------------872  FACTOR_VAR INT compareop save in reg[57]
   lw $t3 -8($sp)
   sw $t3 -240($sp)

#------------873  PUSH INT parareg[17] from reg[55]
   sw $ra -244($sp)
   lw $t0 -232($sp)
   sw $t0 -248($sp)

#------------874  PUSH INT parareg[18] from reg[56]
   lw $t0 -236($sp)
   sw $t0 -252($sp)

#------------875  PUSH INT parareg[19] from reg[57]
   lw $t0 -240($sp)
   sw $t0 -256($sp)

#------------876  CALL INT richcompare(3)
   addi $sp $sp -248
   jal .func_richcompare
   subi $sp $sp -248
   lw $ra -244($sp)

#------------877  FACTOR_FUNC INT richcompare save in reg[58]
   sw $v0 -244($sp)

#------------878  ASSIGN INT result = reg[58]
   lw $t3 -244($sp)
   sw $t3 -12($sp)

#------------879  FACTOR_VAR INT result save in reg[59]
   lw $t3 -12($sp)
   sw $t3 -248($sp)

#------------880  FACTOR_CON INT 0 save in reg[60]
   li $t0 0
   sw $t0 -252($sp)

#------------881  IF reg[59] BLSS reg[60] THEN GOTO label_96
   lw $t0 -248($sp)
   lw $t1 -252($sp)
    blt $t0 $t1 label_96

#------------882  WRITE Result: 
   li $v0 4
   la $a0 .str_38
   syscall

#------------883  FACTOR_VAR INT result save in reg[61]
   lw $t3 -12($sp)
   sw $t3 -256($sp)

#------------884  WRITE INT reg[61]
   li $v0 1
   lw $a0 -256($sp)
   syscall
   li $v0 11
   li $a0 10
   syscall

#------------885  JUMP to label_97
   j label_97

#------------886  label_96    ----------------Label----------------
label_96:

#------------887  label_97    ----------------Label----------------
label_97:

   jr $ra

end:
