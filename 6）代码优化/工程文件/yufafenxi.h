//表达式的类型全是int（mips中也没有char类型，变量的类型应该会保存在运行栈中）
////return指令的跳转
#ifndef YUFAFENXI_H_INCLUDED
#define YUFAFENXI_H_INCLUDED
#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
#include"cifafenxi.h"
#include"siyuanshi.h"
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
int expr();
int item();
int factor();
void state();
void fuzhistate();
void tiaojianstate();
int tiaojian();
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
            error(IDEN_REDEFINE);//标识符重定义
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
		entermidcode(CONST,INT,idvalue,"",integervalue,0,0);//登录四元式表
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
			entermidcode(CONST,INT,idvalue,"",integervalue,0,0);//登录四元式表
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
		//integervalue = inum;//获取ASCII码值
		enter(TYPE_CHAR,KIND_CONST,inum,idvalue,levelvalue,0);//登录符号表
		entermidcode(CONST,CHAR,idvalue,"",inum,0,0);//登录四元式表
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
			//integervalue = inum;//获取ASCII码值
            enter(TYPE_CHAR,KIND_CONST,inum,idvalue,levelvalue,0);//登录符号表
            entermidcode(CONST,CHAR,idvalue,"",inum,0,0);//登录四元式表
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
        if(sy == LPAR || sy == LBPA){//如果是'('或'{'，说明不是var而是有返回值函数
            BACK
            tab.index --;//符号表回退
            midtab.index --;//四元式表回退
            extern_var_index--;//全局变量表回退
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
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录变量类型（符号表）
	midtypevalue = (sy == INTSY)?INT:CHAR;//记录变量类型（四元式）
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
		if(levelvalue == 0){//是外部数组
            enter_extern_var(idvalue,KIND_ARRAY,integervalue);//加入外部变量表
		}
		//登录参数表
        enter_para(idvalue,integervalue);
		entermidcode(ARRAY,midtypevalue,idvalue,"",integervalue,0,0);//登录四元式表（数组）
		getsym();
	}
	else{
        enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//登录符号表
        if(levelvalue == 0){//是外部变量
            enter_extern_var(idvalue,KIND_VAR,0);//加入外部变量表
        }
        //登录参数表
        enter_para(idvalue,1);
        entermidcode(VAR,midtypevalue,idvalue,"",0,0,0);//登录四元式表
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
			if(levelvalue == 0){//是外部数组
                enter_extern_var(idvalue,KIND_ARRAY,integervalue);//加入外部变量表
            }
			//登录参数表
            enter_para(idvalue,integervalue);
			entermidcode(ARRAY,midtypevalue,idvalue,"",integervalue,0,0);//登录四元式表（数组）
			getsym();
		}
		else{
            enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//登录符号表
            if(levelvalue == 0){//是外部变量
                enter_extern_var(idvalue,KIND_VAR,0);//加入外部变量表
            }
            //登录参数表
            enter_para(idvalue,1);
            entermidcode(VAR,midtypevalue,idvalue,"",0,0,0);//登录四元式表
		}
	}
	printf("This is a defvar\n");
}

void deffunct(){//有返回值函数定义*
    regno = 1;//清零存储空间
	if(sy != INTSY && sy != CHARSY){//省略声明头部的定义
		error(DEFFUNCT_TYPE_ERROR);
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录变量类型
	midtypevalue = (sy == INTSY)?INT:CHAR;//记录变量类型（四元式）
	getsym();
	if(sy != IDEN){
		error(DEFFUNCT_NAME_ERROR);
	}
	char idvalue[IDENL];//保存函数名
	strcpy(idvalue,id0);//获取符号名称
	funcindex = tab.index;//记录函数名保存位置
	intarrayindex = tempintindex;//记录int数组表下标
	chararrayindex = tempcharindex;//记录char数组表下标
	enter(typevalue,KIND_FUNCT,0,idvalue,levelvalue,0);//函数名加入符号表
	//函数加入函数表
	enter_func(idvalue);
	midfuncindex = midtab.index;
	entermidcode(FUNC,midtypevalue,idvalue,"",0,0,0);//登录四元式表（暂缺paranum）
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
		midtab.midcodes[midfuncindex].value = paranumvalue;//参数数量计入四元式
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
	//记录下一个函数使用的寄存器时的基础位移
	func_regnum[func_index] = regno - 1 + func_regnum[func_index-1];//表示成累加和的形式
	printf("This is a deffunct\n");
}

void deffuncf(){//无返回值函数定义*
    regno = 1;//清零存储空间
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
	//函数加入函数表
	enter_func(idvalue);
	midfuncindex = midtab.index;
	entermidcode(FUNC,VOID,idvalue,"",0,0,0);//四元式
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
		midtab.midcodes[midfuncindex].value = paranumvalue;//参数数量计入四元式
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
	//记录下一个函数使用的寄存器时的基础位移
	func_regnum[func_index] = regno - 1 + func_regnum[func_index-1];//表示成累加和的形式
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
	midtypevalue = (sy == INTSY)?INT:CHAR;//记录变量类型（四元式）
	getsym();
	if(sy != IDEN){
		error(PARALIST_IDEN_ERROR);
	}
	strcpy(idvalue,id0);//记录参数名称
	enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//加入符号表
	//加入参数表
	enter_para(idvalue,1);//参数为int或char，大小为1
	entermidcode(PARA,midtypevalue,idvalue,"",0,0,0);//四元式
	paranumvalue += 1;//记录参数的个数
	getsym();
	while(sy == COMMA){
		getsym();
		if(sy != INTSY && sy != CHARSY){
			error(PARALIST_TYPE_ERROR);
		}
		typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录参数类型
		midtypevalue = (sy == INTSY)?INT:CHAR;//记录变量类型（四元式）
		getsym();
		if(sy != IDEN){
			error(PARALIST_IDEN_ERROR);
		}
		strcpy(idvalue,id0);//记录参数名称
		enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//加入符号表
		//加入参数表
        enter_para(idvalue,1);//参数为int或char，大小为1
		entermidcode(PARA,midtypevalue,idvalue,"",0,0,0);//四元式
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
	enter_func("main");
	entermidcode(FUNC,VOID,"main","",0,0,0);//主函数加入四元式
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
	//主函数的末尾，需要考虑
	getsym();
	//记录下一个函数使用的寄存器时的基础位移
	func_regnum[func_index] = regno - 1 + func_regnum[func_index-1];//表示成累加和的形式
	reg_index = func_regnum[func_index] + 1;//寄存器的总数
	printf("This is a mainfunc\n");
	enter_func("exit");
}

int expr(){//表达式*
	int negative = 0;//如果是1，代表第一个项的值需要取反
	exprlevel ++;//嵌套层数加一
	if(sy == PLUS){
		getsym();
	}
	else if(sy == MINUS){
		getsym();
		negative = 1;
	}
	int t1 = item();
	int t2;
	if(negative){
        t2 = t1;//t2 = t1
        entermidcode(FACTOR_CON,midtypevalue,"","",regno++,0,0);//存入0
        //把因子的存储位置标记为常量
        int ans = func_regnum[func_index-1];//当前函数的基础位移
        reg_is_con[ans + regno-1] = KIND_CONST;
        reg_con_value[ans + regno-1] = 0;
        t1 = regno - 1;//t1 = 0
        entermidcode(JIAN,INT,"","",regno++,t1,t2);//存在最后操作数的位置
        t1 = regno - 1;
	}
	while(sy == PLUS || sy == MINUS){
        midcode_kind kind = (sy == PLUS)?JIA:JIAN;
		getsym();
		t2 = item();
		/*if(negative){
            entermidcode(kind,INT,"negative","",regno++,t1,t2);
            negative = 0;
		}*/
        entermidcode(kind,INT,"","",regno++,t1,t2);//存在第二个操作数的位置
        t1 = regno - 1;//前面计算完的视为一项
	}
	printf("This is a expr\n");
	return regno - 1;
}

int item(){//项* 返回值是项的值保存的寄存器编号
	int t1 = factor();
	while(sy == TIMES || sy == DIV){
		midcode_kind kind = (sy == TIMES)?CHENG:CHU;
		getsym();
		int t2 = factor();
        //int t1 = regno - 2;//左操作数寄存器下标
        //int t2 = regno - 1;//右操作数寄存器下标
		entermidcode(kind,INT,"","",regno++,t1,t2);//存在第二个操作数的位置
		t1 = regno - 1;
	}
	printf("This is a item\n");
	return regno - 1;
}

int factor(){//因子*
    //factorsum ++;
	if(sy == IDEN){//根据符号表判断是标识符还是有返回值函数调用
		strcpy(idvalue,id0);//保存符号名称
		int location = loc(idvalue);//查找位置
		if(location >= 0 ){
            int kind = tab.symbols[location].kind;
            int level = tab.symbols[location].level;//记录层数（0层为外部变量）
            midcode_type midtypevalue;//记录因子类型
            if(tab.symbols[location].type == TYPE_INT){
                midtypevalue = INT;
                exprtype += 2;//根据因子的类型更改特征值
            }
            else if(tab.symbols[location].type == TYPE_CHAR){
                midtypevalue = CHAR;
                exprtype += 1;
            }
            char name[IDENL];
            strcpy(name,tab.symbols[location].name);//记录因子名称
            if(kind == KIND_FUNCT){
                //保存现场（valueparalist里面含有表达式）
                int recordtype = exprtype;
                int recordlevel = exprlevel;
                callfunctstate();
                exprtype = recordtype;
                exprlevel = recordlevel;
                entermidcode(FACTOR_FUNC,midtypevalue,name,"",regno++,0,0);//（特殊）把函数返回值保存在regno-1号寄存器中//事实证明这样会出bug，存在下一个寄存器比较稳妥
            }
            else if(kind == KIND_VAR){
                if(level > 0){//是普通变量
                    entermidcode(FACTOR_VAR,midtypevalue,name,"",regno++,0,0);
                }
                else if(level == 0){//是外部变量
                    entermidcode(FACTOR_VAR_EXTERN,midtypevalue,name,"",regno++,0,0);
                }
                getsym();
            }
            else if(kind == KIND_CONST){
                int value = tab.symbols[location].value;//获取常量的值，常量因子直接传值，值记录在t1
                entermidcode(FACTOR_CON,midtypevalue,"","",regno++,value,0);
                //把因子的存储位置标记为常量
                int ans = func_regnum[func_index-1];//当前函数的基础位移
                reg_is_con[ans + regno-1] = KIND_CONST;
                reg_con_value[ans + regno-1] = value;
            	getsym();
			}
            else if(kind == KIND_ARRAY){
                getsym();
                if(sy != LBRA){
                    error(LBRA_LOST_ERROR);
                }
                getsym();
                //保存现场
                int recordtype = exprtype;
                int recordlevel = exprlevel;
                int index = expr();//数组下标（可以视为int，不参与特征值更改，因此要保存现场）
                exprtype = recordtype;
                exprlevel = recordlevel;
                if(sy != RBRA){
                    error(RBRA_LOST_ERROR);
                }
                if(level > 0){
                    entermidcode(FACTOR_ARRAY,midtypevalue,name,"",regno++,index,0);
                }
                else if(level == 0){//是外部数组
                    entermidcode(FACTOR_ARRAY_EXTERN,midtypevalue,name,"",regno++,index,0);
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
		int index = expr();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		entermidcode(FACTOR_EXPR,INT,"","",regno++,index,0);
		getsym();
	}
	else if(sy == ICON || sy == PLUS || sy == MINUS){
        exprtype += 2;
		integer();
		entermidcode(FACTOR_CON,INT,"","",regno++,integervalue,0);
        //把因子的存储位置标记为常量
        int ans = func_regnum[func_index-1];//当前函数的基础位移
        reg_is_con[ans + regno-1] = KIND_CONST;
        reg_con_value[ans + regno-1] = integervalue;
	}
	else if(sy == CCON){
	    exprtype += 1;
		getsym();
		//此时inum中保存了CCON的ASCII值
		entermidcode(FACTOR_CON,CHAR,"","",regno++,inum,0);
        //把因子的存储位置标记为常量
        int ans = func_regnum[func_index-1];//当前函数的基础位移
        reg_is_con[ans + regno-1] = KIND_CONST;
        reg_con_value[ans + regno-1] = inum;
	}
	else{
		error(FACTOR_ERROR);
	}
	printf("This is a factor\n");
	return regno - 1;
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
	char name[IDENL]; strcpy(name,id0);//记录名称
	midcode_type type;//要复制的标识符类型
	//记录标识符位置
	int location = loc(name);
	if(location < 0){
        error(IDEN_NOTFOUND_ERROR);
	}
	int level = tab.symbols[location].level;//获得符号的层次
	int iden_type = tab.symbols[location].type;//获得被赋值符号的类型
	if(iden_type == TYPE_INT) type = INT;
	else if(iden_type == TYPE_CHAR) type = CHAR;
	//int indexloc = midtab.index;
	getsym();
	int flag = 0;//是否判断过标识符正确性
	midcode_kind kind;//要赋值的标识符种类
	int temp;//
	if(sy == LBRA){//需要查找符号表判断是不是数组
		getsym();
		temp = expr();//数组下标
		if(sy != RBRA){
			error(RBRA_LOST_ERROR);
		}
		//判断标识符是不是数组
        if(tab.symbols[location].kind != KIND_ARRAY){
            error(IDEN_NOT_ARRAY);
        }
        flag = 1;
        kind = ASSIGN_ARR;
		//数组元素赋值
		//entermidcode(ASSIGN_ARR,INT,name,"",0,temp,0);//t1记录数组下标的寄存器位置
		getsym();
	}
	if(!flag){
        //判断标识符是不是普通变量
        if(tab.symbols[location].kind != KIND_VAR){
            error(IDEN_NOT_VAR);
        }
        kind = ASSIGN;
        //普通变量赋值
        //entermidcode(ASSIGN,INT,name,"",0,0,0);
	}
	if(sy != BECOM){
		error(FUZHISTATE_BECOM_ERROR);
	}
	getsym();
	//检查赋值语句两侧类型是否相同
    initexprtype();
	int value = expr();//获得=右侧表达式值存储的寄存器号
	int expr_type = getexprtype();
	if(expr_type != iden_type){
        error(BECOM_NOT_MATCH);//
	}
	if(level > 0){
        entermidcode(kind,type,name,"",value,temp,0);//加入四元式表
	}
	else if(level == 0){//外部变量赋值
        if(kind == ASSIGN){
            entermidcode(ASSIGN_EXTERN,type,name,"",value,temp,0);//加入四元式表
        }
        else if(kind == ASSIGN_ARR){
            entermidcode(ASSIGN_ARR_EXTERN,type,name,"",value,temp,0);//加入四元式表
        }
	}
	//midtab.midcodes[indexloc].value = value;
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
	int relation = tiaojian();//记录关系
	if(sy != RPAR){
		error(RPAR_LOST_ERROR);
	}
	//生成条件跳转四元式
	midcode_kind kind;
	switch(relation){
	    case LSS : kind = BGEQ; break;// < to >=
	    case LEQ : kind = BGTR; break;// <= to >
	    case GTR : kind = BLEQ; break;// > to <=
	    case GEQ : kind = BLSS; break;// >= to <
	    case NEQ : kind = BEQ; break;// != to ==
	    case EQL : kind = BNE; break;// == to !=
	    default : break;
	}
	int indexloc = midtab.index;
	entermidcode(kind,INT,"","",0,exprregno1,exprregno2);//这里的value是跳转的目标行，应该是state()之后的位置
	getsym();
	state();
    //midtab.midcodes[indexloc].value = midtab.index + 1;//写入跳转位置（midtab.index+1才是else语句第一句话的位置）
    int _indexloc = midtab.index;
    entermidcode(JUMP,INT,"","",0,0,0);//value是else的state之后的位置
    //生成label
    /*int i = labelno++;
    char str[IDENL];
    string per = to_string(i);
    strcpy(str,per.c_str());
    char labelname[IDENL] = {'l','a','b','e','l','_'};
    strcat(labelname,str);*/
    char labelname[IDENL];
    memset(labelname,65,sizeof(labelname));
    string perona = getlabel();
    strcpy(labelname,perona.c_str());
    entermidcode(LABEL,INT,labelname,"",0,0,0);//生成label
    //cout << "len is ------ " << strlen(labelname) << "content is " << labelname << endl;
    strcpy(midtab.midcodes[indexloc].name1,labelname);//设置name1为跳转的目标
	if(sy == ELSESY){
		getsym();
		state();
	}
	//midtab.midcodes[_indexloc].value = midtab.index;//写入跳转位置
	//生成label
    /*i = labelno++;
    per = to_string(i);
    strcpy(str,per.c_str());
    char _labelname[IDENL] = {'l','a','b','e','l','_'};
    strcat(_labelname,str);*/
	char _labelname[IDENL];
	memset(_labelname,65,sizeof(_labelname));
	string _perona = getlabel();
	strcpy(_labelname,_perona.c_str());
	entermidcode(LABEL,INT,_labelname,"",0,0,0);
	strcpy(midtab.midcodes[_indexloc].name1,_labelname);//设置name1为跳转的目标
	printf("This is a tiaojianstate\n");
}

int tiaojian(){//条件*
	exprregno1 = expr();
	int relation;
	if(sy == LSS || sy == LEQ || sy == GTR || sy == GEQ || sy == NEQ || sy == EQL){
		relation = sy;
		getsym();
		exprregno2 = expr();
	}
	else{
        //expr1 != 0
        relation = NEQ;
        exprregno2 = 0;//$zero
	}
	printf("This is a tiaojian\n");
	return relation;//返回条件的类型
}

void xunhuanstate(){//循环语句*
	if(sy == WHILESY){
		getsym();
		if(sy != LPAR){
			error(LPAR_LOST_ERROR);
		}
		getsym();
        char labelname[IDENL];
        memset(labelname,65,sizeof(labelname));
        string perona = getlabel();
        strcpy(labelname,perona.c_str());
		entermidcode(LABEL,INT,labelname,"",0,0,0);
		int relation = tiaojian();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		//生成条件跳转四元式
        midcode_kind kind;
        switch(relation){
            case LSS : kind = BGEQ; break;// < to >=
            case LEQ : kind = BGTR; break;// <= to >
            case GTR : kind = BLEQ; break;// > to <=
            case GEQ : kind = BLSS; break;// >= to <
            case NEQ : kind = BEQ; break;// != to ==
            case EQL : kind = BNE; break;// == to !=
            default : break;
        }
        int indexloc = midtab.index;
        entermidcode(kind,INT,"","",0,exprregno1,exprregno2);
		getsym();
		state();
		entermidcode(JUMP,INT,labelname,"",indexloc,0,0);//跳转到while的循环条件
        char _labelname[IDENL];
        memset(_labelname,65,sizeof(_labelname));
        string _perona = getlabel();
        strcpy(_labelname,_perona.c_str());
		entermidcode(LABEL,INT,_labelname,"",0,0,0);
		strcpy(midtab.midcodes[indexloc].name1,_labelname);//设置跳转的目标
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
		char name[IDENL];
		strcpy(name,id0);//记录名称
		//检查是否定义过以及是否是普通标识符
		int location = loc(name);
		int level;
		if(location >= 0){
            if(tab.symbols[location].kind != KIND_VAR){
                error(IDEN_NOT_VAR);
            }
            level = tab.symbols[location].level;
		}
		else{
            error(IDEN_NOTFOUND_ERROR);
		}
		getsym();
		if(sy != BECOM){
			error(XUNHUANSTATE_BECOM_ERROR);
		}
		getsym();
		int init = expr();
		//生成赋值语句
		if(level > 0){//是普通变量
            entermidcode(ASSIGN,INT,name,"",init,0,0);//直接默认循环变量是int类型
		}
		else if(level == 0){//是外部变量
            entermidcode(ASSIGN_EXTERN,INT,name,"",init,0,0);//直接默认循环变量是int类型
		}
		/*//生成无条件跳转
		int indexloc = midtab.index;//记录跳转指令的位置
		entermidcode(JUMP,INT,"","",0,0,0);
		int huitiaoweizhi = midtab.index;//回跳应该跳到的位置*/
		if(sy != SEMI){
			error(XUNHUANSTATE_SEMI_ERROR);
		}

/*-------------------生成label-------------------------*/
		char labelname[IDENL];
        memset(labelname,65,sizeof(labelname));
        string perona = getlabel();
        strcpy(labelname,perona.c_str());
		entermidcode(LABEL,INT,labelname,"",0,0,0);

/*-------------------先执行语句列-------------------------*/
        int index_record_tiaojian = sourceindex;//保存条件语句开始的位置（分号）
        char ch_record_tiaojian = ch;
        int sy_record_tiaojian = sy;
        getsym();
        while(sy != SEMI){//一直读到下一个分号//此处可以报错
            getsym();
            //cout << "---------------------the sy is " << sy << endl;
        }
        int index_record_step = sourceindex;//保存步长变化语句开始的位置（分号）
        char ch_record_step = ch;
        int sy_record_step = sy;
        getsym();
        while(sy != RPAR){//一直读到右括号//此处可以报错
            getsym();
        }
        getsym();
        state();
        int index_record_over = sourceindex;//保存for语句结束的位置
        char ch_record_over = ch;
        int sy_record_over = sy;
        char id0_record_over[IDENL];
        strcpy(id0_record_over,id0);

/*-------------------再执行步长变化-----------------------*/
        /*int index_record = sourceindex;
        char ch_record = ch;
        int sy_record = sy;*/
        sourceindex = index_record_step;
        ch = ch_record_step;
        sy = sy_record_step;
        getsym();
       /* while(sy != SEMI){//一直读到下一个分号//此处可以报错
            getsym();
            //cout << "---------------------the sy is " << sy << endl;
        }*/
        //getsym();
        if(sy != IDEN){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		strcpy(name,id0);//保存标识符名
		//检查是否定义过以及是否是普通标识符
		location = loc(name);
		int level_0;
		if(location >= 0){
            if(tab.symbols[location].kind != KIND_VAR){
                error(IDEN_NOT_VAR);
            }
            if(tab.symbols[location].type != TYPE_INT){
                error(BECOM_NOT_MATCH);//步长变化语句左侧变量必须是int型，因为右侧必定是int型表达式
            }
            level_0 = tab.symbols[location].level;
		}
		else{
            error(IDEN_NOTFOUND_ERROR);
		}
		getsym();
		if(sy != BECOM){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		getsym();
		if(sy != IDEN){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		char name_1[IDENL];//保存后边的标识符名
		strcpy(name_1,id0);
		//检查是否定义过以及是否是普通标识符
		int location_1 = loc(name_1);
		int level_1;
		if(location_1 >= 0){
            if(tab.symbols[location_1].kind != KIND_VAR && tab.symbols[location_1].kind != KIND_CONST){//后面的标识符可以是const
                error(IDEN_NOT_VARORCONST);
            }
            level_1 = tab.symbols[location_1].level;
		}
		else{
            error(IDEN_NOTFOUND_ERROR);
		}
		getsym();
		if(sy != PLUS && sy != MINUS){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		midcode_kind kind = (sy == PLUS)?JIA:JIAN;//记录步长变化符号
		getsym();
		if(sy != ICON){
			error(XUNHUANSTATE_STEP_ERROR);
		}
		int value = inum;//记录步长的值
		getsym();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
        /*char labelname_step[IDENL];
        memset(labelname_step,65,sizeof(labelname_step));
        string perona_step = getlabel();
        strcpy(labelname_step,perona_step.c_str());
		entermidcode(LABEL,INT,labelname_step,"",0,0,0);*/
        //步长变化语句
        if(level_1 > 0){//是普通变量
            entermidcode(FACTOR_VAR,INT,name_1,"",regno++,0,0);//标识符因子读到寄存器
        }
        else if(level_1 == 0){//是外部变量
            entermidcode(FACTOR_VAR_EXTERN,INT,name_1,"",regno++,0,0);//外部变量因子读到寄存器
        }
        entermidcode(FACTOR_CON,INT,"","",regno++,value,0);//步长因子读到寄存器
         //把因子的存储位置标记为常量
        int ans = func_regnum[func_index-1];//当前函数的基础位移
        reg_is_con[ans + regno-1] = KIND_CONST;
        reg_con_value[ans + regno-1] = value;
        int t1 = regno - 2;
        int t2 = regno - 1;
        //变更循环变量
        entermidcode(kind,INT,"","",regno++,t1,t2);//计算新的循环变量
        if(level_0 > 0){//是普通变量
            entermidcode(ASSIGN,INT,name,"",regno-1,0,0);
        }
        else if(level_0 == 0){//是外部变量
            entermidcode(ASSIGN_EXTERN,INT,name,"",regno-1,0,0);
        }
        /*//记录分析到的位置
        int _index_record = sourceindex;
        char _ch_record = ch;
        int _sy_record = sy;*/
/*-----------------------------分析中间的部分（条件跳转）------------------------------*/
        //回退读到的位置（当前符号为分号）
        sourceindex = index_record_tiaojian;
        ch = ch_record_tiaojian;
        sy = sy_record_tiaojian;
        getsym();
		int relation = tiaojian();
		//生成条件跳转语句
		int expr1 = exprregno1;
		int expr2 = exprregno2;
		//生成条件跳转语句
		midcode_kind kind_1;
        switch(relation){
            case LSS : kind_1 = BLSS; break;//相同
            case LEQ : kind_1 = BLEQ; break;//
            case GTR : kind_1 = BGTR; break;//
            case GEQ : kind_1 = BGEQ; break;//
            case NEQ : kind_1 = BNE; break;//
            case EQL : kind_1 = BEQ; break;//
            default : break;
        }
        //int tiaojiantiaozhuan = midtab.index;//记录条件跳转语句的下标，之后更新跳转位置
        entermidcode(kind_1,INT,labelname,"",0,expr1,expr2);//
		if(sy != SEMI){
			error(XUNHUANSTATE_SEMI_ERROR);
		}
		//下标置为for语句结束位置
		sourceindex = index_record_over;
		ch = ch_record_over;
		sy = sy_record_over;
		strcpy(id0,id0_record_over);
/*--------------------------分析语句列部分------------------------------------*/
        //回退读到的位置（读到右括号）
        //sourceindex = _index_record;
        //ch = _ch_record;
        //sy = _sy_record;

		//getsym();
		/*//生成label
        i = labelno++;
        itoa(i,str,10);
        char labelname[IDENL] = {'l','a','b','e','l','_'};
        strcat(labelname,str);*/
        /*char labelname[IDENL];
        memset(labelname,65,sizeof(labelname));
        string perona = getlabel();
        strcpy(labelname,perona.c_str());
		entermidcode(LABEL,INT,labelname,"",0,0,0);*/
		//midtab.midcodes[indexloc].value = midtab.index;
		//strcpy(midtab.midcodes[indexloc].name1,labelname);//记录跳转的位置（语句的开始）

		//state();
        //无条件跳转到步长变化语句
        //entermidcode(JUMP,INT,labelname_step,"",huitiaoweizhi,0,0);
        /*char _labelname[IDENL];
        memset(_labelname,65,sizeof(_labelname));
        string _perona = getlabel();
        strcpy(_labelname,_perona.c_str());
        entermidcode(LABEL,INT,_labelname,"",0,0,0);*/
        //strcpy(midtab.midcodes[tiaojiantiaozhuan].name1,_labelname);
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
	char name[IDENL];
	strcpy(name,id0);//记录函数名
	//检查是否声明过
	int paranum;
	midcode_type type;
	int location = loc(name);
	if(location >= 0){
        if(tab.symbols[location].kind == KIND_FUNCT){
            paranum = tab.symbols[location].paranum;//获取参数的个数
            type = (tab.symbols[location].type == TYPE_INT)?INT:CHAR;//获取返回值的类型
        }
        else{
            error(IDEN_NOT_FUNCT);
        }
	}
	else{
        error(FUNC_NOTFOUND_ERROR);
	}
	getsym();
	int flag = 0;//是否生成四元式
	if(sy == LPAR){
		getsym();
		valueparalist();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
        //前几个寄存器保存了参数值
		entermidcode(CALL,type,name,"",paranum,0,0);//把参数寄存器的前n个参数作为要传入的参数
		flag = 1;
		getsym();
	}
	if(!flag){
        entermidcode(CALL,type,name,"",0,0,0);//没有参数
	}
	printf("This is a callfunctstate\n");
}

void callfuncfstate(){//无返回值函数调用语句*
	if(sy != IDEN){
		error(CALLFUNCF_NAME_ERROR);
	}
	char name[IDENL];
	strcpy(name,id0);//记录函数名
	//检查是否声明过
	int paranum;
	int location = loc(name);
	if(location >= 0){
        if(tab.symbols[location].kind == KIND_FUNCF){
            paranum = tab.symbols[location].paranum;//获取参数个数
        }
        else{
            error(IDEN_NOT_FUNCF);
        }
	}
	else{
        error(FUNC_NOTFOUND_ERROR);
	}
	getsym();
	int flag = 0;//是否生成四元式
	if(sy == LPAR){
		getsym();
		valueparalist();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
        //前几个寄存器保存了参数值
        entermidcode(CALL,VOID,name,"",paranum,0,0);//把参数寄存器的前n个参数作为要传入的参数
        flag = 1;
		getsym();
	}
	if(!flag){
        entermidcode(CALL,VOID,name,"",0,0,0);//参数个数为0
	}
	printf("This is a callfuncfstate\n");
}

void valueparalist(){//值参数表*
    //值参数表（值参数的寄存器号）（用来改四元式输出顺序，一次性读完值参数再一起PUSH，方便生成mips）
    int value_paras[MAXVALUEPARA] = {0};
    int value_para_index = 0;
	int value;
	//获得值参数的类型
	initexprtype();
	value = expr();//值参数保存的寄存器编号
	int expr_type = getexprtype();
	midcode_type type = (expr_type == TYPE_INT)?INT:CHAR;
	//entermidcode(PUSH,type,"","",pararegno++,value,0);//文法规定值参数不能是数组元素;加入参数寄存器
	//加入值参数表
	value_paras[value_para_index++] = value;
	while(sy == COMMA){
		getsym();
		//获得值参数的类型
		initexprtype();
		value = expr();
		expr_type = getexprtype();
		type = (expr_type == TYPE_INT)?INT:CHAR;
		//entermidcode(PUSH,type,"","",pararegno++,value,0);//值参数加入参数寄存器
		//加入值参数表
        value_paras[value_para_index++] = value;
	}
	int ans;
	for(ans=0;ans<value_para_index;ans++){
        entermidcode(PUSH,INT,"","",pararegno++,value_paras[ans],0);
	}
	value_para_index = 0;//参数表清零
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
	char name[IDENL];
	strcpy(name,id0);
	//检查是否定义过同时获取type
	midcode_type type;
	int level;//记录变量的层次
	int location = loc(name);
	if(location >= 0){
        if(tab.symbols[location].kind == KIND_VAR){
            type = (tab.symbols[location].type == TYPE_INT)?INT:CHAR;
            level = tab.symbols[location].level;
        }
        else{
            error(IDEN_NOT_VAR);
        }
	}
	else{
        error(IDEN_NOTFOUND_ERROR);
	}
	if(level > 0){
        entermidcode(READ,type,name,"",0,0,0);
	}
	else if(level == 0){
        entermidcode(READ_EXTERN,type,name,"",0,0,0);
	}
	getsym();
	while(sy == COMMA){
		getsym();
		if(sy != IDEN){
			error(READSTATE_IDEN_ERROR);
		}
		strcpy(name,id0);
		//检查是否定义过
		location = loc(name);
		if(location >= 0){
            if(tab.symbols[location].kind == KIND_VAR){
                type = (tab.symbols[location].type == TYPE_INT)?INT:CHAR;
                level = tab.symbols[location].level;
            }
            else{
                error(IDEN_NOT_VAR);
            }
		}
		else{
            error(IDEN_NOTFOUND_ERROR);
		}
		if(level > 0){
            entermidcode(READ,type,name,"",0,0,0);
		}
		else if(level == 0){
            entermidcode(READ_EXTERN,type,name,"",0,0,0);
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
        //打印表达式
        entermidcode(WRITE,STR,str,"",0,0,0);//name1为需要打印的内容str
		//加入字符串常量表
		enter_str_con(str);
		getsym();
		if(sy == COMMA){
            //记录上一条WRITE CON语句打印完之后不换行
            midtab.midcodes[midtab.index-1].t2 = 1;
			getsym();
			//获得表达式的类型
			initexprtype();
			int value = expr();
			int expr_type = getexprtype();
			midcode_type type = (expr_type == TYPE_INT)?INT:CHAR;
			entermidcode(WRITE,type,"","",value,0,0);////表达式如果是单个字符或者单个字符变量的话，应视为打印字母?
		}
	}
	else{
        //获得表达式的类型
        initexprtype();
		int value = expr();
        int expr_type = getexprtype();
        midcode_type type = (expr_type == TYPE_INT)?INT:CHAR;
		entermidcode(WRITE,type,"","",value,0,0);////表达式如果是单个字符或者单个字符变量的话，应视为打印字母?
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
		int value = expr();
		if(sy != RPAR){
			error(RPAR_LOST_ERROR);
		}
		//返回
		entermidcode(RETURN,INT,"","",0,value,0);//不需要知道返回值类型，返回值读入1号寄存器
		getsym();
	}
	else{
        //返回void
        entermidcode(RETURN,VOID,"","",0,0,0);//这时默认返回reg[0]，即$0，不过void的返回值应该无影响？
	}
	printf("This is a returnstate\n");
}

#endif // YUFAFENXI_H_INCLUDED
