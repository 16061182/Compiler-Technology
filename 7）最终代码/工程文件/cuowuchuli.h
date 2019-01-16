#ifndef CUOWUCHULI_H_INCLUDED
#define CUOWUCHULI_H_INCLUDED
#include<iostream>
#include<fstream>
#include"define.h"
#include"cifafenxi.h"
#include"siyuanshi.h"
using namespace std;

int error_num = 0;//错误数量
void error(int e){
    error_num ++;
    if(e == ILLEGAL_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : ILLEGAL SYMBOL\n";
    else if(e == IDEN_NOTFOUND_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : IDENTIFIER NOT FOUND\n";
    else if(e == IDEN_WRONG_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : IDENTIFIER BEGINS WITH NUMBER\n";
    else if(e == LPAR_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'(\' HERE\n";
    else if(e == RPAR_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \')\' HERE\n";
    else if(e == LBRA_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'[\' HERE\n";
    else if(e == RBRA_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \']\' HERE\n";
    else if(e == LBPA_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'{\' HERE\n";
    else if(e == RBPA_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'}\' HERE\n";

    else if(e == INTEGER_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT INTEGER HERE\n";
    else if(e == INTEGER_ICON_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT UNSIGNED INTEGER HERE\n";
    else if(e == DECCON_SEMI_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \';\' HERE\n";
    else if(e == DECCON_CONSTSY_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"const\" HERE\n";
    else if(e == DEFCON_CCON_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT CONSTANT CHARACTER HERE\n";
    else if(e == DEFCON_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";
    else if(e == DEFCON_BECOM_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'=\' HERE\n";
    else if(e == DEFCON_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n";
    else if(e == DECVAR_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n";
    else if(e == DECVAR_SEMI_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \';\' HERE\n";
    else if(e == DEFVAR_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n";
    else if(e == DEFVAR_SEMI_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \';\' HERE\n";
    else if(e == DEFVAR_ICON_ERROR){ eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT CONSTANT INTEGER HERE\n";
    cout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT CONSTANT INTEGER HERE\n";
    }
    else if(e == DEFVAR_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";

    else if(e == DEFFUNCT_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'(\' OR \'{\' FOLLOWING A FUNCTION IDENTIFIER\n";
    else if(e == DEFFUNCT_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n";
    else if(e == DEFFUNCT_NAME_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT FUNCTION IDENTIFIER HERE\n";
    else if(e == DEFFUNCF_VOID_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"void\" HERE\n";
    else if(e == DEFFUNCF_NAME_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT FUNCTION IDENTIFIER HERE\n";
    else if(e == DEFFUNCF_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'(\' OR \'{\' FOLLOWING A FUNCTION IDENTIFIER\n";
    else if(e == PARALIST_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n";
    else if(e == PARALIST_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";
    else if(e == STATE_SEMI_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \';\' HERE\n";
    else if(e == FUZHISTATE_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";
    else if(e == FUZHISTATE_BECOM_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'=\' HERE\n";
    else if(e == TIAOJIANSTATE_IF_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"if\" HERE\n";
    else if(e == XUNHUANSTATE_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";
    else if(e == XUNHUANSTATE_STEP_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : ERROR APPEARS WITHIN ADDING STEP IN \"for\" STATE\n";
    else if(e == XUNHUANSTATE_BECOM_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'=\' HERE\n";
    else if(e == READSTATE_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";
    else if(e == MAINFUNC_VOID_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"void\" HERE\n";
    else if(e == MAINFUNC_MAIN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"main\" HERE\n";

    else if(e == FACTOR_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT FACTOR HERE\n";
    else if(e == STATE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT STATE HERE\n";
    else if(e == XUNHUANSTATE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOLS \"while\" OR \"for\" HERE\n";
    else if(e == XUNHUANSTATE_SEMI_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \';\' HERE\n";
    else if(e == CALLFUNCT_NAME_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND FUNCTION(WITH RETURN VALUE) HERE\n";
    else if(e == CALLFUNCF_NAME_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND FUNCTION(WITHOUT RETURN VALUE)HERE\n";
    else if(e == READSTATE_SCANF_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"scanf\" HERE\n";
    else if(e == WRITESTATE_PRINTF_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"printf\" HERE\n";
    else if(e == RETURNSTATE_RETURN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT THE SYMBOL \"return\" HERE\n";
    else if(e == IDEN_KIND_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : THE KIND OF THE IDENTIFIER IS NOT CORRECT\n";
    else if(e == PROGRAM_IDEN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER HERE\n";
    else if(e == FUNC_NOTFOUND_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : FUNCTION IDENTIFIER NOT FOUND\n";
    else if(e == IDEN_REDEFINE) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : THE IDENTIFIER IS REDEFINED\n";
    //else if(e == IDEN_NOT_ARRAY) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND ARRAY HERE\n";
    else if(e == IDEN_NOT_VAR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND VARIABLE HERE \n";
    else if(e == IDEN_NOT_CONST) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND CONSTANT HERE\n";
    else if(e == IDEN_NOT_FUNCT) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND FUNCTION(WITH RETURN VALUE) HERE\n";
    else if(e == IDEN_NOT_FUNCF) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND FUNCTION(WITHOUT RETURN VALUE) HERE\n";
    else if(e == BECOM_NOT_MATCH) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPRESSIONS AT LEFT AND RIGHT SIDES OF \'=\' IS NOT OF THE SAME TYPE\n";
    else if(e == IDEN_NOT_VARORCONST) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT IDENTIFIER OF KIND VARIABLE OR CONSTANT\n";

    else if(e == TIAOJIAN_NOT_MATCH) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : TYPE OF EXPRESSIONS IN CONDITION STATE DO NOT MATCH\n";
    else if(e == PARA_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : PARAMETER IS NOT OF A CORRECT TYPE\n";
    else if(e == FUNCF_RETURN_VALUE) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : VOID FUNCTION BUT RETURN A VALUE\n";
    else if(e == FUNCT_RETURN_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : RETURN VALUE IS NOT OF A CORRECT TYPE\n";
    else if(e == PARA_TOO_MANY) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : TOO MANY PARAMETERS\n";
    else if(e == PARA_TOO_FEW) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : TOO FEW PARAMETERS\n";
    else if(e == ARRAY_INDEX_TYPE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : INDEX OF ARRAY SHOULD BE TYPE INT\n";
    else if(e == NONEPARA_BUT_LPAR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : FIND \'(\' WHILE CALLING A NON-PARAMETER FUNCTION\n";
    else if(e == INDEX_OUTOF_BOUNDS) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : INDEX OUT OF BOUNDS EXCEPTION\n";
    else if(e == NOTARRAY_BUT_LBRA) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : IDENTIFIER IS NOT ARRAY BUT FIND \'[\'\n";
    else if(e == FUZHISTATE_KIND_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT ONLY VAR OR ARRAY TO BE ASSIGNED\n";
    else if(e == TIAOJIAN_SHOULDBE_INT) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPRESSIONS IN CONDITION STATE SHOULD BE OF TYPE INT\n";
    else if(e == SQUOTE_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'\'\' HERE\n";
    else if(e == DQUOTE_LOST_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : EXPECT \'\"\' HERE\n";
    else if(e == ARRAY_SIZE_ERROR) eout << "ERROR NO." << error_num << " AT LINE " << lc << " : SIZE OF ARRAY SHOULD BE A POSITIVE INTEGER\n";

}

void skip(int e){
    return ;
}


#endif // CUOWUCHULI_H_INCLUDED
