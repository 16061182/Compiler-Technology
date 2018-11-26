#ifndef YUFAFENXI_H_INCLUDED
#define YUFAFENXI_H_INCLUDED
#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
#include"cifafenxi.h"
using namespace std;

void deccon();
void defcon();
void integer();
void decvar_extern();
void decvar();
void defvar();
void deffunct();
void deffuncf();
void multistate();
void paralist();
void mainfunc();
void expr();
void item();
void factor();
void state();
void fuzhistate();
void tiaojianstate();
void tiaojian();
void xunhuanstate();
void callfunctstate();
void callfuncfstate();
void valueparalist();
void states();
void readstate();
void writestate();
void returnstate();

void enter(int _type,int _kind,int _value,char *_name,int _level,int _paranum){
    int index = tab.index;
    int i;
    for(i=tab.index - 1;tab.symbols[i].level == _level;i--){
        if(strcmp(_name,tab.symbols[i].name) == 0){//在当前层中已经定义过
            cout << _name << " have been declared in the same level" << endl;
            return ;
        }
    }
    tab.symbols[index].type = _type;
    tab.symbols[index].kind = _kind;
    tab.symbols[index].value = _value;
    strcpy(tab.symbols[index].name,_name);
    tab.symbols[index].address = 0;
    tab.symbols[index].level = _level;
    tab.symbols[index].paranum = _paranum;//数组的长度
    if(_kind == KIND_ARRAY){
        if(_type == TYPE_INT){
            tab.symbols[index].address = tempintindex;//该数组第一个参数在tempintarray中的位置
            tempintindex += _paranum;//预留出空间
        }
        else if(_type == TYPE_CHAR){
            tab.symbols[index].address = tempcharindex;
            tempcharindex += _paranum;
        }
    }
    char types[4][IDENL] = {"","int","char","void"};
    char kinds[6][IDENL] = {"","const","var","array","funct","funcf"};
    tab.index += 1;
    for(i=0;i<tab.index;i++){
        cout << "       type:" << types[tab.symbols[i].type] << " kind:" << kinds[tab.symbols[i].kind] << " value:" << tab.symbols[i].value << " name:" << tab.symbols[i].name << " level:" << tab.symbols[i].level << " paranum:" << tab.symbols[i].paranum << " address:" << tab.symbols[i].address << endl;
    }
}

int loc(char *_name){//查找符号表，找到返回下标，未找到返回-1
    int i;
    int found = 0;
    for(i=tab.index-1;i>=0;i--){
        if(strcmp(_name,tab.symbols[i].name) == 0){
            found = 1;
            break;
        }
    }
    if(found) return i;
    else return -1;
}

/*void clean(int index){//清除符号表项的内容
    tab.symbols[index].type = 0;
    tab.symbols[index].kind = 0;
    tab.symbols[index].value = 0;
    strcpy(tab.symbols[index].name,"");
    tab.symbols[index].address = 0;
    tab.symbols[index].level = 0;
    tab.symbols[index].paranum = 0;//数组的长度

}*/

void program(){//程序*
    levelvalue = 0;
    if(sy == CONSTSY){
        deccon();
    }
    /*int i,j[10];
    int i(int a) { }*/
    if(sy == INTSY || sy == CHARSY){
        MARK
        getsym();
        if(sy != IDEN){
            error(PROGRAM_IDEN_ERROR);
        }
        getsym();
        if(sy == COMMA || sy == LBRA || sy == SEMI){//是变量说明
            BACK
            decvar_extern();
        }
        else if(sy == LPAR || sy == LBPA){//是有返回值函数定义
            BACK
        }
        else{
        	error(ILLEGAL_ERROR);
        }
    }
    while(sy == INTSY || sy == CHARSY || sy == VOIDSY){//循环定义函数
        if(sy == INTSY || sy == CHARSY){
            deffunct();
        }
        else if(sy == VOIDSY){
        	MARK
        	getsym();
        	if(sy == IDEN){//说明是无返回值函数定义
        		BACK
        		deffuncf();
        	}
        	else if(sy == MAINSY){//说明是主函数
        		BACK
        		break;
        	}
        }
    }
    mainfunc();
    printf("This is a program\n");
}

void deccon(){//常量说明*
	if(sy != CONSTSY){
		error(DECCON_CONSTSY_ERROR);
	}
	while(sy == CONSTSY){
		getsym();
		defcon();
		if(sy != SEMI){
			error(DECCON_SEMI_ERROR);
		}
		getsym();
	}
	printf("This is a deccon\n");
}

void defcon(){//常量定义*
	if(sy == INTSY){
		getsym();
		if(sy != IDEN){
			error(DEFCON_IDEN_ERROR);
		}
		strcpy(idvalue,id0);//获取符号名称
		getsym();
		if(sy != BECOM){
			error(DEFCON_BECOM_ERROR);
		}
		getsym();
		integer();
		enter(TYPE_INT,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
		while(sy == COMMA){
			getsym();
			if(sy != IDEN){
				error(DEFCON_IDEN_ERROR);
			}
			strcpy(idvalue,id0);//获取符号名称
			getsym();
			if(sy != BECOM){
				error(DEFCON_BECOM_ERROR);
			}
			getsym();
			integer();
			enter(TYPE_INT,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
		}
	}
	else if(sy == CHARSY){
		getsym();
		if(sy != IDEN){
			error(DEFCON_IDEN_ERROR);
		}
		strcpy(idvalue,id0);//获取符号名称
		getsym();
		if(sy != BECOM){
			error(DEFCON_BECOM_ERROR);
		}
		getsym();
		if(sy != CCON){
			error(DEFCON_CCON_ERROR);
		}
		integervalue = inum;//获取ASCII码值
		enter(TYPE_CHAR,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
		getsym();
		while(sy == COMMA){
			getsym();
			if(sy != IDEN){
				error(DEFCON_IDEN_ERROR);
			}
			strcpy(idvalue,id0);//获取符号名称
			getsym();
			if(sy != BECOM){
				error(DEFCON_BECOM_ERROR);
			}
			getsym();
			if(sy != CCON){
				error(DEFCON_CCON_ERROR);
			}
			integervalue = inum;//获取ASCII码值
            enter(TYPE_CHAR,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
			getsym();
		}
	}
	else{
		error(DEFCON_TYPE_ERROR);
	}
	printf("This is a defcon\n");
}

void integer(){//整数*
	if(sy == PLUS){
		getsym();
		if(sy != ICON){
			error(INTEGER_ICON_ERROR);
		}
		integervalue = inum;//正号
		getsym();
	}
	else if(sy == MINUS){
		getsym();
		if(sy != ICON){
			error(INTEGER_ICON_ERROR);
		}
		integervalue = 0-inum;//负号
		getsym();
	}
	else if(sy == ICON){
        integervalue = inum;//正号
		getsym();
	}
	else{
		error(INTEGER_ERROR);
	}
	printf("This is a integer\n");
}

void decvar_extern(){//用于程序中的变量说明（带回溯）
    if(sy != INTSY && sy != CHARSY){
		error(DECVAR_TYPE_ERROR);
	}
	while(sy == INTSY || sy == CHARSY){
        MARK
		defvar();
        if(sy == LPAR){//如果是'('，说明不是var而是有返回值函数
            BACK
            tab.index --;//符号表回退
            break;
        }
		else if(sy == SEMI){
            getsym();
		}
		else{
            error(DECVAR_SEMI_ERROR);
		}
	}
	printf("This is a decvar_extern\n");
}

void decvar(){//用于语句列中的变量说明*
	if(sy != INTSY && sy != CHARSY){
		error(DECVAR_TYPE_ERROR);
	}
	while(sy == INTSY || sy == CHARSY){
		defvar();
		if(sy != SEMI){
            error(DECCON_SEMI_ERROR);
		}
		getsym();
	}
	printf("This is a decvar\n");
}

void defvar(){//变量定义*
	if(sy != INTSY && sy != CHARSY){
		error(DEFVAR_TYPE_ERROR);
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录变量类型
	getsym();
	if(sy != IDEN){
		error(DEFVAR_IDEN_ERROR);
	}
	strcpy(idvalue,id0);//获取符号名称
	getsym();
	if(sy == LBRA){
		getsym();
		if(sy != ICON){
			error(DEFVAR_ICON_ERROR);
		}
		integervalue = inum;//记录数组元素个数
		getsym();
		if(sy != RBRA){
			error(RBRA_LOST_ERROR);
		}
		enter(typevalue,KIND_ARRAY,0,idvalue,levelvalue,integervalue);//登录符号表（数组）
		getsym();
	}
	else{
        enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//登录符号表
	}
	while(sy == COMMA){
		getsym();
		if(sy != IDEN){
			error(DEFVAR_IDEN_ERROR);
		}
		strcpy(idvalue,id0);//获取符号名称
		getsym();
		if(sy == LBRA){
			getsym();
			if(sy != ICON){
				error(DEFVAR_ICON_ERROR);
			}
			integervalue = inum;//记录数组元素个数
			getsym();
			if(sy != RBRA){
				error(RBRA_LOST_ERROR);
			}
			enter(typevalue,KIND_ARRAY,0,idvalue,levelvalue,integervalue);//登录符号表（数组）
			getsym();
		}
		else{
            enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//登录符号表
		}
	}
	printf("This is a defvar\n");
}

void deffunct(){//有返回值函数定义*
	if(sy != INTSY && sy != CHARSY){//省略声明头部的定义
		error(DEFFUNCT_TYPE_ERROR);
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录变量类型
	getsym();
	if(sy != IDEN){
		error(DEFFUNCT_NAME_ERROR);
	}
	strcpy(idvalue,id0);//获取符号名称
	funcindex = tab.index;//获取函数名保存位置
	intarrayindex = tempintindex;//获取int数组表下标
	chararrayindex = tempcharindex;//获取char数组表下标
	enter(typevalue,KIND_FUNCT,0,idvalue,levelvalue,0);//函数名加入符号表
	paranumvalue = 0;//初始化当前函数所包含的参数个数
	levelvalue += 1;//层次加一
	getsym();
	if(sy == LPAR){
		getsym();
		paralist();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		tab.symbols[funcindex].paranum = paranumvalue;//记录函数参数的数量
		getsym();
		if(sy != LBPA){
			error(LBPA_LOST_ERROR);
		}
		getsym();
		multistate();
		if(sy != RBPA){
			error(RBPA_LOST_ERROR);
		}
		//函数结束，退栈
		tab.index = funcindex + 1;//函数名保留在符号栈中
		tempintindex = intarrayindex;//int数组表回退
		tempcharindex = chararrayindex;//char数组表回退
		levelvalue --;//层次减一
		getsym();
	}
	else if(sy == LBPA){
		getsym();
		multistate();
		if(sy != RBPA){
			error(RBPA_LOST_ERROR);
		}
        //函数结束，退栈
		tab.index = funcindex + 1;//函数名保留在符号栈中
		tempintindex = intarrayindex;//int数组表回退
		tempcharindex = chararrayindex;//char数组表回退
		levelvalue --;//层次减一
		getsym();
	}
	else{
		error(DEFFUNCT_ERROR);
	}
	printf("This is a deffunct\n");
}

void deffuncf(){//无返回值函数定义*
	if(sy != VOIDSY){
		error(DEFFUNCF_VOID_ERROR);
	}
	getsym();
	if(sy != IDEN){
		error(DEFFUNCF_NAME_ERROR);
	}
	strcpy(idvalue,id0);//获取符号名称
	funcindex = tab.index;//获取函数名保存位置
	intarrayindex = tempintindex;//获取int数组表下标
	chararrayindex = tempcharindex;//获取char数组表下标
	enter(TYPE_VOID,KIND_FUNCF,0,idvalue,levelvalue,0);//加入符号表
	paranumvalue = 0;//初始化当前函数所包含的参数个数
	levelvalue += 1;//层次加一
	getsym();
	if(sy == LPAR){
		getsym();
		paralist();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		tab.symbols[funcindex].paranum = paranumvalue;//记录函数参数的数量
		getsym();
		if(sy != LBPA){
			error(LBPA_LOST_ERROR);
		}
		getsym();
		multistate();
		if(sy != RBPA){
			error(RBPA_LOST_ERROR);
		}
		//函数结束，退栈
		tab.index = funcindex + 1;//函数名保留在符号栈中
		tempintindex = intarrayindex;//int数组表回退
		tempcharindex = chararrayindex;//char数组表回退
		levelvalue --;//层次减一
		getsym();
	}
	else if(sy == LBPA){
		getsym();
		multistate();
		if(sy != RBPA){
			error(RBPA_LOST_ERROR);
		}
		//函数结束，退栈
		tab.index = funcindex + 1;//函数名保留在符号栈中
		tempintindex = intarrayindex;//int数组表回退
		tempcharindex = chararrayindex;//char数组表回退
		levelvalue --;//层次减一
		getsym();
	}
	else{
		error(DEFFUNCF_ERROR);
	}
	printf("This is a deffuncf\n");
}

void multistate(){//语句列*
	if(sy == CONSTSY){
		deccon();
	}
	if(sy == INTSY || sy == CHARSY){
		decvar();
	}
	states();
	printf("This is a multistate\n");
}

void paralist(){//参数表*
	if(sy != INTSY && sy != CHARSY){
		error(PARALIST_TYPE_ERROR);
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录参数类型
	getsym();
	if(sy != IDEN){
		error(PARALIST_IDEN_ERROR);
	}
	strcpy(idvalue,id0);//记录参数名称
	enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//加入符号表
	paranumvalue += 1;//记录参数的个数
	getsym();
	while(sy == COMMA){
		getsym();
		if(sy != INTSY && sy != CHARSY){
			error(PARALIST_TYPE_ERROR);
		}
		typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录参数类型
		getsym();
		if(sy != IDEN){
			error(PARALIST_IDEN_ERROR);
		}
		strcpy(idvalue,id0);//记录参数名称
		enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//加入符号表
		paranumvalue++;//参数的个数++
		getsym();
	}
	printf("This is a paralist\n");
}

void mainfunc(){//主函数*
	if(sy != VOIDSY){
		error(MAINFUNC_VOID_ERROR);
	}
	getsym();
	if(sy != MAINSY){
		error(MAINFUNC_MAIN_ERROR);
	}
	getsym();
	if(sy != LPAR){
		error(LPAR_LOST_ERROR);
	}
	getsym();
	if(sy != RPAR){
		error(RPAR_LOST_ERROR);
	}
	getsym();
	if(sy != LBPA){
		error(LBPA_LOST_ERROR);
	}
	levelvalue ++;
	getsym();
	multistate();
	if(sy != RBPA){
		error(RBPA_LOST_ERROR);
	}
	levelvalue --;
	getsym();//主函数的末尾，需要考虑
	printf("This is a mainfunc\n");
}

void expr(){//表达式*
	if(sy == PLUS){
		getsym();
	}
	else if(sy == MINUS){
		getsym();
	}
	item();
	while(sy == PLUS || sy == MINUS){
		getsym();
		item();
	}
	printf("This is a expr\n");
}

void item(){//项*
	factor();
	while(sy == TIMES || sy == DIV){
		getsym();
		factor();
	}
	printf("This is a item\n");
}

void factor(){//因子*
	if(sy == IDEN){//根据符号表判断是标识符还是有返回值函数调用
		strcpy(idvalue,id0);//保存符号名称
		int location = loc(idvalue);//查找位置
		if(location >= 0 ){
            int kind = tab.symbols[location].kind;
            if(kind == KIND_FUNCT){
                callfunctstate();
            }
            else if(kind == KIND_VAR){
                getsym();
            }
            else if(kind == KIND_CONST){
            	getsym();
			}
            else if(kind == KIND_ARRAY){
                getsym();
                if(sy != LBRA){
                    error(LBRA_LOST_ERROR);
                }
                getsym();
                expr();
                if(sy != RBRA){
                    error(RBRA_LOST_ERROR);
                }
                getsym();
            }
            else{
                error(IDEN_KIND_ERROR);
            }
		}
		else{
            error(IDEN_NOTFOUND_ERROR);//未声明的标识符
		}
	}
	else if(sy == LPAR){
		getsym();
		expr();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		getsym();
	}
	else if(sy == ICON || sy == PLUS || sy == MINUS){
		integer();
	}
	else if(sy == CCON){
		getsym();
	}
	else{
		error(FACTOR_ERROR);
	}
	printf("This is a factor\n");
}

void state(){//语句*
	if(sy == IFSY){
		tiaojianstate();
	}
	else if(sy == WHILESY || sy == FORSY){
		xunhuanstate();
	}
	else if(sy == LBPA){
		getsym();
		states();
		if(sy != RBPA){
			error(RBPA_LOST_ERROR);
		}
		getsym();
	}
	else if(sy == IDEN){//根据符号表判断是函数调用还是赋值
		strcpy(idvalue,id0);//保存符号名称
		int location = loc(idvalue);//查找位置
		if(location>=0){
            int kind = tab.symbols[location].kind;
            if(kind == KIND_FUNCT){
                callfunctstate();
            }
            else if(kind == KIND_FUNCF){
                callfuncfstate();
            }
            else if(kind == KIND_VAR || kind == KIND_ARRAY){
                fuzhistate();
            }
            else{
                error(IDEN_KIND_ERROR);
            }
		}
		else{
            error(IDEN_NOTFOUND_ERROR);//未声明的标识符
		}
		if(sy != SEMI){
            error(STATE_SEMI_ERROR);
		}
		getsym();
		/*MARK
		getsym();
		if(sy == SEMI || sy == LPAR){//º¯Êýµ÷ÓÃÓï¾ä
			BACK
			callfunctstate();//´Ë´¦ÐèÒª¸ù¾Ý±êÊ¶·ûÅÐ¶ÏÊÇµ÷ÓÃÓÐ·µ»ØÖµ»¹ÊÇÎÞ·µ»ØÖµ
		}
		else if(sy == BECOM || sy == LBRA){//¸³ÖµÓï¾ä
			BACK
			fuzhistate();
		}
		if(sy != SEMI){
			error();
		}
		getsym();*/
	}
	else if(sy == SCANFSY){
		readstate();
		if(sy != SEMI){
			error(STATE_SEMI_ERROR);
		}
		getsym();
	}
	else if(sy == PRINTFSY){
		writestate();
		if(sy != SEMI){
			error(STATE_SEMI_ERROR);
		}
		getsym();
	}
	else if(sy == RETURNSY){
		returnstate();
		if(sy != SEMI){
			error(STATE_SEMI_ERROR);
		}
		getsym();
	}
	else if(sy == SEMI){
		getsym();
	}
	else{
		error(STATE_ERROR);
	}
	printf("This is a state\n");
}

void fuzhistate(){//赋值语句*
	if(sy != IDEN){
		error(FUZHISTATE_IDEN_ERROR);
	}
	getsym();
	if(sy == LBRA){//需要查找符号表判断是不是数组
		getsym();
		expr();
		if(sy != RBRA){
			error(RBRA_LOST_ERROR);
		}
		getsym();
	}
	if(sy != BECOM){
		error(FUZHISTATE_BECOM_ERROR);
	}
	getsym();
	expr();
	printf("This is a fuzhistate\n");
}

void tiaojianstate(){//条件语句*
	if(sy != IFSY){
		error(TIAOJIANSTATE_IF_ERROR);
	}
	getsym();
	if(sy != LPAR){
		error(LPAR_LOST_ERROR);
	}
	getsym();
	tiaojian();
	if(sy != RPAR){
		error(RPAR_LOST_ERROR);
	}
	getsym();
	state();
	if(sy == ELSESY){
		getsym();
		state();
	}
	printf("This is a tiaojianstate\n");
}

void tiaojian(){//条件*
	expr();
	if(sy == LSS || sy == LEQ || sy == GTR || sy == GEQ || sy == NEQ || sy == EQL){
		getsym();
		expr();
	}
	printf("This is a tiaojian\n");
}

void xunhuanstate(){//循环语句*
	if(sy == WHILESY){
		getsym();
		if(sy != LPAR){
			error(LPAR_LOST_ERROR);
		}
		getsym();
		tiaojian();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		getsym();
		state();
	}
	else if(sy == FORSY){
		getsym();
		if(sy != LPAR){
			error(LPAR_LOST_ERROR);
		}
		getsym();
		if(sy != IDEN){
			error(XUNHUANSTATE_IDEN_ERROR);
		}
		getsym();
		if(sy != BECOM){
			error(XUNHUANSTATE_BECOM_ERROR);
		}
		getsym();
		expr();
		if(sy != SEMI){
			error(XUNHUANSTATE_SEMI_ERROR);
		}
		getsym();
		tiaojian();
		if(sy != SEMI){
			error(XUNHUANSTATE_SEMI_ERROR);
		}
		getsym();
		if(sy != IDEN){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		getsym();
		if(sy != BECOM){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		getsym();
		if(sy != IDEN){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		getsym();
		if(sy != PLUS && sy != MINUS){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		getsym();
		if(sy != ICON){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		getsym();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		getsym();
		state();
	}
	else{
		error(XUNHUANSTATE_ERROR);
	}
	printf("This is a xunhuanstate\n");
}

void callfunctstate(){//有返回值函数调用语句*
	if(sy != IDEN){
		error(CALLFUNCT_NAME_ERROR);
	}
	getsym();
	if(sy == LPAR){
		getsym();
		valueparalist();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		getsym();
	}
	printf("This is a callfunctstate\n");
}

void callfuncfstate(){//无返回值函数调用语句*
	if(sy != IDEN){
		error(CALLFUNCF_NAME_ERROR);
	}
	getsym();
	if(sy == LPAR){
		getsym();
		valueparalist();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		getsym();
	}
	printf("This is a callfuncfstate\n");
}

void valueparalist(){//值参数表*
	expr();
	while(sy == COMMA){
		getsym();
		expr();
	}
	printf("This is a valueparalist\n");
}

void states(){//语句列*
	while(sy == IFSY || sy == WHILESY || sy == FORSY || sy == LBPA
		|| sy == IDEN || sy == SCANFSY || sy == PRINTFSY || sy == RETURNSY || sy == SEMI){
		state();
	}
	printf("This is a states\n");
}

void readstate(){//读语句*
	if(sy != SCANFSY){
		error(READSTATE_SCANF_ERROR);
	}
	getsym();
	if(sy != LPAR){
		error(LPAR_LOST_ERROR);
	}
	getsym();
	if(sy != IDEN){
		error(READSTATE_IDEN_ERROR);
	}
	getsym();
	while(sy == COMMA){
		getsym();
		if(sy != IDEN){
			error(READSTATE_IDEN_ERROR);
		}
		getsym();
	}
	if(sy != RPAR){
		error(RPAR_LOST_ERROR);
	}
	getsym();
	printf("This is a readstate\n");
}

void writestate(){//写语句*
	if(sy != PRINTFSY){
		error(WRITESTATE_PRINTF_ERROR);
	}
	getsym();
	if(sy != LPAR){
		error(LPAR_LOST_ERROR);
	}
	getsym();
	if(sy == SCON){
		getsym();
		if(sy == COMMA){
			getsym();
			expr();
		}
	}
	else{
		expr();
	}
	if(sy != RPAR){
		error(RPAR_LOST_ERROR);
	}
	getsym();
	printf("This is a writestate\n");
}

void returnstate(){//返回语句*
	if(sy != RETURNSY){
		error(RETURNSTATE_RETURN_ERROR);
	}
	getsym();
	if(sy == LPAR){
		getsym();
		expr();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		getsym();
	}
	printf("This is a returnstate\n");
}

#endif // YUFAFENXI_H_INCLUDED
