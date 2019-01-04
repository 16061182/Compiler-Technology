#ifndef CUOWUCHULI_H_INCLUDED
#define CUOWUCHULI_H_INCLUDED
#include<iostream>
#include<fstream>
#include"define.h"
#include"cifafenxi.h"
#include"siyuanshi.h"
using namespace std;

FILE *error_message;
int error_num = 0;//代码中错误的数量
void error(int e){
    error_num ++;
    if(e == ILLEGAL_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : ILLEGAL SYMBOL\n",error_num,lc);
    else if(e == IDEN_NOTFOUND_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : IDENTIFIER NOT FOUND\n",error_num,lc);
    else if(e == IDEN_WRONG_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : IDENTIFIER BEGINS WITH NUMBER\n",error_num,lc);
    else if(e == LPAR_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \"(\" HERE\n",error_num,lc);
    else if(e == RPAR_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \")\" HERE\n",error_num,lc);
    else if(e == LBRA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \"[\" HERE\n",error_num,lc);
    else if(e == RBRA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \"]\" HERE\n",error_num,lc);
    else if(e == LBPA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \"{\" HERE\n",error_num,lc);
    else if(e == RBPA_LOST_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \"}\" HERE\n",error_num,lc);

    else if(e == INTEGER_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT AN INTEGER HERE\n",error_num,lc);
    else if(e == INTEGER_ICON_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT AN UNSIGNED INTEGER HERE\n",error_num,lc);
    else if(e == DECCON_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A \";\" HERE\n",error_num,lc);
    else if(e == DECCON_CONSTSY_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT THE SYMBOL \"const\" HERE\n",error_num,lc);
    else if(e == DEFCON_CCON_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT A CONST CHARACTER HERE\n",error_num,lc);
    else if(e == DEFCON_IDEN_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : EXPECT AN IDENTIFIER HERE\n",error_num,lc);
    else if(e == DEFCON_BECOM_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == DEFCON_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == DECVAR_TYPE_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == DECVAR_SEMI_ERROR) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);
    else if(e == ) fprintf(error_message,"ERROR NO.%3d AT LINE %3d : \n",error_num,lc);


}

#endif // CUOWUCHULI_H_INCLUDED
