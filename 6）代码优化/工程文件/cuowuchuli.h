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
    if(e == ILLEGAL_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : ILLEGAL SYMBOL\n",error_num,lc);
    else if(e == IDEN_NOTFOUND_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : IDENTIFIER NOT FOUND\n",error_num,lc);
    else if(e == IDEN_WRONG_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : IDENTIFIER BEGINS WITH NUMBER\n",error_num,lc);
    else if(e == LPAR_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'(\' HERE\n",error_num,lc);
    else if(e == RPAR_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \')\' HERE\n",error_num,lc);
    else if(e == LBRA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'[\' HERE\n",error_num,lc);
    else if(e == RBRA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \']\' HERE\n",error_num,lc);
    else if(e == LBPA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'{\' HERE\n",error_num,lc);
    else if(e == RBPA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'}\' HERE\n",error_num,lc);

    else if(e == INTEGER_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT INTEGER HERE\n",error_num,lc);
    else if(e == INTEGER_ICON_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT UNSIGNED INTEGER HERE\n",error_num,lc);
    else if(e == DECCON_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \';\' HERE\n",error_num,lc);
    else if(e == DECCON_CONSTSY_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"const\" HERE\n",error_num,lc);
    else if(e == DEFCON_CCON_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT CONSTANT CHARACTER HERE\n",error_num,lc);
    else if(e == DEFCON_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);
    else if(e == DEFCON_BECOM_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'=\' HERE\n",error_num,lc);
    else if(e == DEFCON_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n",error_num,lc);
    else if(e == DECVAR_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n",error_num,lc);
    else if(e == DECVAR_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \';\' HERE\n",error_num,lc);
    else if(e == DEFVAR_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n",error_num,lc);
    else if(e == DEFVAR_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \';\' HERE\n",error_num,lc);
    else if(e == DEFVAR_ICON_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT CONSTANT INTEGER HERE\n",error_num,lc);
    else if(e == DEFVAR_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);

    else if(e == DEFFUNCT_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'(\' OR \'{\' FOLLOWING A FUNCTION IDENTIFIER\n",error_num,lc);
    else if(e == DEFFUNCT_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n",error_num,lc);
    else if(e == DEFFUNCT_NAME_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT FUNCTION IDENTIFIER HERE\n",error_num,lc);
    else if(e == DEFFUNCF_VOID_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"void\" HERE\n",error_num,lc);
    else if(e == DEFFUNCF_NAME_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT FUNCTION IDENTIFIER HERE\n",error_num,lc);
    else if(e == DEFFUNCF_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'(\' OR \'{\' FOLLOWING A FUNCTION IDENTIFIER\n",error_num,lc);
    else if(e == PARALIST_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOLS \"int\" OR \"char\" HERE\n",error_num,lc);
    else if(e == PARALIST_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);
    else if(e == STATE_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \';\' HERE\n",error_num,lc);
    else if(e == FUZHISTATE_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);
    else if(e == FUZHISTATE_BECOM_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'=\' HERE\n",error_num,lc);
    else if(e == TIAOJIANSTATE_IF_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"if\" HERE\n",error_num,lc);
    else if(e == XUNHUANSTATE_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);
    else if(e == XUNHUANSTATE_STEP_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : ERROR APPEARS WITHIN ADDING STEP IN \"for\" STATE\n",error_num,lc);
    else if(e == XUNHUANSTATE_BECOM_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \'=\' HERE\n",error_num,lc);
    else if(e == READSTATE_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);
    else if(e == MAINFUNC_VOID_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"void\" HERE\n",error_num,lc);
    else if(e == MAINFUNC_MAIN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"main\" HERE\n",error_num,lc);

    else if(e == FACTOR_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT FACTOR HERE\n",error_num,lc);
    else if(e == STATE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT STATE HERE\n",error_num,lc);
    else if(e == XUNHUANSTATE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOLS \"while\" OR \"for\" HERE\n",error_num,lc);
    else if(e == XUNHUANSTATE_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT \';\' HERE\n",error_num,lc);
    else if(e == CALLFUNCT_NAME_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND FUNCTION(WITH RETURN VALUE) HERE\n",error_num,lc);
    else if(e == CALLFUNCF_NAME_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND FUNCTION(WITHOUT RETURN VALUE)HERE\n",error_num,lc);
    else if(e == READSTATE_SCANF_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"scanf\" HERE\n",error_num,lc);
    else if(e == WRITESTATE_PRINTF_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"printf\" HERE\n",error_num,lc);
    else if(e == RETURNSTATE_RETURN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"return\" HERE\n",error_num,lc);
    else if(e == IDEN_KIND_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : THE KIND OF THE IDENTIFIER IS NOT CORRECT\n",error_num,lc);
    else if(e == PROGRAM_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER HERE\n",error_num,lc);
    else if(e == FUNC_NOTFOUND_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : FUNCTION IDENTIFIER NOT FOUND\n",error_num,lc);
    else if(e == IDEN_REDEFINE) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : THE IDENTIFIER IS REDEFINED\n",error_num,lc);
    else if(e == IDEN_NOT_ARRAY) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND ARRAY HERE\n",error_num,lc);
    else if(e == IDEN_NOT_VAR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND VARIABLE HERE \n",error_num,lc);
    else if(e == IDEN_NOT_CONST) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND CONSTANT HERE\n",error_num,lc);
    else if(e == IDEN_NOT_FUNCT) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND FUNCTION(WITH RETURN VALUE) HERE\n",error_num,lc);
    else if(e == IDEN_NOT_FUNCF) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND FUNCTION(WITHOUT RETURN VALUE) HERE\n",error_num,lc);
    else if(e == BECOM_NOT_MATCH) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPRESSIONS AT LEFT AND RIGHT SIDES OF \'=\' IS NOT OF THE SAME TYPE\n",error_num,lc);
    else if(e == IDEN_NOT_VARORCONST) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT IDENTIFIER OF KIND VARIABLE OR CONSTANT\n",error_num,lc);

    else if(e == TIAOJIAN_NOT_MATCH) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : CONDITION STATE NOT MATCH\n",error_num,lc);
    else if(e == PARA_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : PARAMETER IS NOT OF A CORRECT TYPE\n",error_num,lc);
    else if(e == FUNCF_RETURN_VALUE) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : VOID FUNCTION BUT RETURN A VALUE\n",error_num,lc);
    else if(e == FUNCT_RETURN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : RETURN VALUE IS NOT OF A CORRECT TYPE\n",error_num,lc);
}


#endif // CUOWUCHULI_H_INCLUDED
