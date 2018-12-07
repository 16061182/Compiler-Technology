#ifndef DEFINE_H_INCLUDED
#define DEFINE_H_INCLUDED
#include<iostream>
#include<string.h>
#include<stdlib.h>
#include<fstream>
using namespace std;

#define	CONSTSY 0//const
#define	INTSY 1//int
#define	CHARSY 2//char
#define	VOIDSY 3//void
#define	IDEN 4//标识符
#define	IFSY 5//if
#define	ELSESY 6//else
#define	WHILESY 7//while
#define	FORSY 8//for
#define	SCANFSY 9//scanf
#define	PRINTFSY 10//printf
#define	RETURNSY 11//return
#define	EQL 12//==
#define	NEQ 13
#define	GTR 14//>
#define	GEQ 15//>=
#define	LSS 16//<
#define	LEQ 17//<=
#define	LPAR 18//(
#define	RPAR 19//)
#define	LBRA 20//[
#define	RBRA 21//]
#define	LBPA 22//{
#define	RBPA 23//}
#define	COMMA 24//,
#define	SEMI 25//;
#define	BECOM 26//=
#define	ICON 27//整型常量
#define	CCON 28//字符常量
#define	SCON 29//字符串常量
#define	PLUS 30//+
#define	MINUS 31//-
#define	TIMES 32//*
#define	DIV 33
#define MAINSY 34//main

#define IDENL 50//标识符长度限制
#define LINEL 1024//一行长度限制1024
#define KEYNUM 12//预定义关键字数量
#define SYMNUM 35//符号类型数量
#define MAXINT 2147483647//最大整数
#define MAXINTN 10//整数长度限制
#define MAXTAB 500//符号表最大长度
#define MAXMIDCODETAB 5000//四元式表最大长度
#define MAXBLK 100//最大分程序数量
#define MAXSOURCECODE 1000000//读入的源代码的长度限制
#define MARK indextmp = sourceindex; sytmp = sy; chtmp = ch;
#define BACK sourceindex = indextmp; sy = sytmp; ch = chtmp;
#define MAXYUNXINGZHAN 1000//运行栈的大小限制
#define MAXFUNC 1000//函数个数限制
#define MAXPARA 1000//参数表长度限制
#define MAXVALUEPARA 50
#define MIPS_IDENL 100//用在mips中的label长度

#define TYPE_INT 1
#define TYPE_CHAR 2
#define TYPE_VOID 3
#define KIND_CONST 1
#define KIND_VAR 2
#define KIND_ARRAY 3
#define KIND_FUNCT 4
#define KIND_FUNCF 5

#define ILLEGAL_ERROR 0 //不合法的符号
#define IDEN_NOTFOUND_ERROR 1 //未声明的标识符
#define IDEN_WRONG_ERROR 2 //标识符以数字开头
#define LPAR_LOST_ERROR 3 //'('丢失
#define RPAR_LOST_ERROR 4 //')'丢失
#define LBRA_LOST_ERROR 5 //'['丢失
#define RBRA_LOST_ERROR 6 //']'丢失
#define LBPA_LOST_ERROR 7 //'{'丢失
#define RBPA_LOST_ERROR 8 //'}'丢失

#define INTEGER_ERROR 9 //integer错误
#define INTEGER_ICON_ERROR 10 //integer中的无符号整数部分错误
#define DECCON_SEMI_ERROR 11 //缺少分号
#define DECCON_CONSTSY_ERROR 12 //deccon缺少const
#define DEFCON_CCON_ERROR 13 //deccon字符常量定义缺少字符
#define DEFCON_IDEN_ERROR 14
#define DEFCON_BECOM_ERROR 15
#define DEFCON_TYPE_ERROR 16
#define DECVAR_TYPE_ERROR 17
#define DECVAR_SEMI_ERROR 18
#define DEFVAR_TYPE_ERROR 19
#define DEFVAR_SEMI_ERROR 20
#define DEFVAR_ICON_ERROR 21
#define DEFVAR_IDEN_ERROR 22
#define DEFFUNCT_ERROR 23 //deffunct函数名后面不是'('或'{'
#define DEFFUNCT_TYPE_ERROR 24
#define DEFFUNCT_NAME_ERROR 25 //deffunct缺少函数名
#define DEFFUNCF_VOID_ERROR 26 //deffuncf缺少"void"
#define DEFFUNCF_NAME_ERROR 27 //deffuncf缺少函数名
#define DEFFUNCF_ERROR 28 //deffuncf函数名后面不是'('或'{'
#define PARALIST_TYPE_ERROR 29
#define PARALIST_IDEN_ERROR 30
#define STATE_SEMI_ERROR 31
#define FUZHISTATE_IDEN_ERROR 32
#define FUZHISTATE_BECOM_ERROR 33
#define TIAOJIANSTATE_IF_ERROR 34
#define XUNHUANSTATE_IDEN_ERROR 35
#define XUNHUANSTATE_STEP_ERROR 36 //后面的Step变化部分出错
#define XUNHUANSTATE_BECOM_ERROR 37
#define READSTATE_IDEN_ERROR 38
#define MAINFUNC_VOID_ERROR 39 //mainfunc缺少void
#define MAINFUNC_MAIN_ERROR 40 //mainfunc缺少main
#define FACTOR_ERROR 41 //因子错误
#define STATE_ERROR 42 //语句错误
#define XUNHUANSTATE_ERROR 43 //循环语句不以while或for开头
#define XUNHUANSTATE_SEMI_ERROR 44 //for语句缺少分号
#define CALLFUNCT_NAME_ERROR 45 //有返回值函数调用缺少函数名
#define CALLFUNCF_NAME_ERROR 46 //无返回值函数调用缺少函数名
#define READSTATE_SCANF_ERROR 47 //读语句开头不是scanf
#define WRITESTATE_PRINTF_ERROR 48 //写语句开头不是printf
#define RETURNSTATE_RETURN_ERROR 49 //返回语句开头不是return
#define IDEN_KIND_ERROR 50 //标识符种类错误（用于factor和state）
#define PROGRAM_IDEN_ERROR 51
#define FUNC_NOTFOUND_ERROR 52//未声明的函数
#define IDEN_REDEFINE 53//标识符重定义
#define IDEN_NOT_ARRAY 54//标识符不是数组名（本应是数组名）
#define IDEN_NOT_VAR 55
#define IDEN_NOT_CONST 56
#define IDEN_NOT_FUNCT 57
#define IDEN_NOT_FUNCF 58
#define BECOM_NOT_MATCH 59//赋值语句左右两侧类型不同
#define IDEN_NOT_VARORCONST 60
char printsym[SYMNUM][IDENL] = {
"CONSTSY",//const
"INTSY",//int
"CHARSY",//char
"VOIDSY",//void
"IDEN",//±êÊ¶·û
"IFSY",//if
"ELSESY",//else
"WHILESY",//while
"FORSY",//for
"SCANFSY",//scanf
"PRINTFSY",//printf
"RETURNSY",//return
"EQL",//==
"NEQ",//!=
"GTR",//>
"GEQ",//>=
"LSS",//<
"LEQ",//<=
"LPAR",//(
"RPAR",//)
"LBRA",//[
"RBRA",//]
"LBPA",//{
"RBPA",//}
"COMMA",//,
"SEMI",//;
"BECOM",//=
"ICON",//ÕûÐÎ³£Á¿
"CCON",//×Ö·û³£Á¿
"SCON",//×Ö·û´®³£Á¿
"PLUS",//+
"MINUS",//-
"TIMES",//*
"DIV",///
"MAINSY"//main
};

typedef struct{
    char name[IDENL];//标识符名称
    int type;//标识符类型 1:int 2:char 3:void
    int kind;//标识符种类 1:const 2:var 3:array 4:funct 5:funcf
    int value;//标识符的值
    int address;//数组或函数的入口地址
    int paranum;//函数参数个数或数组大小
    int level;//静态层次
}symbol;
typedef struct{
    symbol symbols[MAXTAB];//symbol tab
    int index;
    /*int totalblock;//total number of blocks
    int blockindex[MAXBLK];//block index tab*/
}symboltab;

typedef struct{
    char name[IDENL];//函数参数的名称
    int offset;//相对于函数头的偏移（从0开始，最小单位为4）
    int nextoffset;//下一个参数相对于函数头的偏移
}para_offset;//偏移量表的表项
int current_offset;//相对于当前函数的偏移
para_offset para_offsets[MAXPARA];//参数表
int para_offsets_index;//参数表索引
void enter_para(char *_name,int _size){//添加参数表
    strcpy(para_offsets[para_offsets_index].name,_name);
    para_offsets[para_offsets_index].offset = current_offset;
    current_offset -= _size * 4;//更新当前函数内偏移
    para_offsets[para_offsets_index].nextoffset = current_offset;
    para_offsets_index ++;
}

char func_names[MAXFUNC][IDENL];//函数名表
int func_firstpara[MAXFUNC];//函数对应的第一个参数在参数表中的位置
int func_index;//函数表索引
void enter_func(char *_name){//添加函数表
    strcpy(func_names[func_index],_name);
    func_firstpara[func_index] = para_offsets_index;//第一个参数在表中的位置
    func_index ++;
    current_offset = 0;//当前函数内偏移清零
}
int get_firstpara(char *_name){//根据函数名获取第一个参数的位置
    int i;
    for(i=0;i<func_index;i++){
        if(strcmp(_name,func_names[i]) == 0){
            break;
        }
    }
    return func_firstpara[i];
}
int get_funcend(char *_name){//获取寄存器在栈中开始的位置
    int i;
    for(i=0;i<func_index;i++){
        if(strcmp(_name,func_names[i]) == 0){
            break;
        }
    }
    if(func_firstpara[i] != func_firstpara[i+1]){//有参数
        int ans = func_firstpara[i+1] - 1;
        return para_offsets[ans].nextoffset + 4;//因为四元式中的寄存器号从1开始
    }
    else{//无参数
        return 4;//为了防止没有参数时占用下一个函数第一个参数的空间（如果是0的话）
    }
}
int get_para_offset(char *_funcname,char *_paraname,int _paraindex){//获取某个特定参数的具体偏移，paraindex是数组的下标
    int loc = get_firstpara(_funcname);
    for(;;loc++){
        if(strcmp(para_offsets[loc].name,_paraname) == 0){//找到参数名
            break;
        }
    }
    int outcome = para_offsets[loc].offset - 4*_paraindex;
    return outcome;
}

void print_func(){//打印函数表和参数表
    int i,j;
    for(i=0;i<func_index-1;i++){//遍历函数表
        cout << func_names[i] << endl;
        for(j=func_firstpara[i];j<func_firstpara[i+1];j++){//遍历参数表
            cout << "       name : " << para_offsets[j].name << "      offset : " << para_offsets[j].offset << endl;
        }
    }
}

enum midcode_kind{
    CONST,
    VAR,
    ARRAY,
    FUNC,
    CALL,
    PARA,
    PUSH,
    ASSIGN,
    ASSIGN_ARR,
    JIA,
    JIAN,
    CHENG,
    CHU,
    FACTOR_CON,
    FACTOR_VAR,
    FACTOR_FUNC,
    FACTOR_ARRAY,
    FACTOR_EXPR,
    BEQ,
    BNE,
    BGTR,
    BGEQ,
    BLSS,
    BLEQ,
    JUMP,
    READ,
    WRITE,
    RETURN,
    LABEL,
    FACTOR_VAR_EXTERN,
    FACTOR_ARRAY_EXTERN,
    ASSIGN_EXTERN,
    ASSIGN_ARR_EXTERN,
    READ_EXTERN
};
enum midcode_type{
    INT,
    CHAR,
    VOID,
    STR
};
typedef struct{
    midcode_kind kind;//四元式种类标志
    midcode_type type;//操作数类型
    char name1[IDENL];//被赋值者的名称
    char name2[IDENL];//赋值者的名称
    int value;
    int t1;//第一个寄存器号
    int t2;//第二个寄存器号
}midcode;
typedef struct{
    midcode midcodes[MAXMIDCODETAB];
    int index;
}midcodetab;

ifstream fin;//Ô´´úÂëÊäÈëÎÄ¼þ
ofstream fout;//mips代码输出文件
char ch;//µ±Ç°¶Áµ½µÄ×Ö·û
int ll = 0;//lenth of current line       LenOfCline
int cc = 0;//character counter      indexInLine
int lc = 0;//行计数器（用来打印报错信息）
char line[LINEL];//±£´æÒ»ÐÐ×Ö·û
char key[KEYNUM][IDENL];//Ô¤¶¨Òå¹Ø¼ü×Ö±í
int ksy[KEYNUM]; //Ô¤¶¨Òå¹Ø¼ü×Ö¶ÔÓ¦µÄsymbol
int sy;
int inum;//getsym¶ÁÈ¡µÄÊý×Ö
int printnum = 1;
char id0[IDENL];
char str[LINEL];

//符号表相关的变量声明
symboltab tab;
char id[IDENL];//¹Ø¼ü×Ö×î³¤Õ¼50¸ö×Ö·û
int tempintarray[MAXSOURCECODE];//临时保存所有int数组信息
int tempintindex = 0;
char tempchararray[MAXSOURCECODE];//临时保存所有char数组信息
int tempcharindex = 0;
int integervalue;//保存一个integer值
int typevalue;//保存当前IDEN的类型int,char,void
char idvalue[IDENL];//保存当前IDEN的名称（小写）
int levelvalue;//保存当前层次
int paranumvalue;//保存当前参数个数
int funcindex;//当前函数在符号表中的地址
int intarrayindex;//当前函数开始时int数组表的下标
int chararrayindex;//当前函数开始时char数组表的下标
int exprtype;//表达式类型特征值，1代表类型是char，其他代表类型是int
int exprlevel;//表达式嵌套层数
/*int firstfactorflag;//第一个因子flag，为0的话表达式未读到第1个因子，为1的话表达式已经读到第1个因子
int factorsum;//一个表达式中的因子数量
int firstfactortype;//第一个因子的type，分为TYPE_INT和TYPE_CHAR
int exprlevel;//表达式嵌套层数*/

//源代码存储数组及其索引
char sourcecode[MAXSOURCECODE];
int sourcelenth = 0;
int sourceindex = 0;

//语法分析回退用变量
int indextmp;
int sytmp;
char chtmp;

//四元式相关的变量声明
midcodetab midtab;
midcode_type midtypevalue;//记录type的临时变量
int midfuncindex;//记录函数定义四元式位置的临时变量
int midtiaojian;//记录条件操作符的临时变量
//int reg1;
//int reg2;
int regno = 1;//申请的临时寄存器编号（0号为$zero，1号为函数返回寄存器）
int pararegno = 0;//保存函数调用传入参数的寄存器组
int exprregno1;//记录表达式值保存的寄存器的下标
int exprregno2;

void initexprtype(){//初始化特征值
    exprtype = 0;
    exprlevel = 0;
}
int getexprtype(){//根据特征值获取表达式类型
    if(exprlevel > 1) return TYPE_INT;
    else{
        if(exprtype == 1) return TYPE_CHAR;
        else return TYPE_INT;
    }
}

//获取标签名称
int labelno;
char *getlabel(){
    int i = labelno++;
    char str[IDENL];
    itoa(i,str,10);
    char lab[IDENL] = {'l','a','b','e','l','_'};
    strcat(lab,str);
    return lab;
}

//外部全局变量记录
typedef struct{
    char name[IDENL];
    int kind;//种类
    int arraysize;//数组下标
}extern_var;
extern_var extern_vars[MAXTAB];
int extern_var_index;
//int extern_var_offset;//在mips堆中的偏移
//添加外部全局变量
void enter_extern_var(char *_name,int _kind,int _size){//变量_size为0，数组_size为数组大小
    if(_kind == KIND_VAR){//是变量
        strcpy(extern_vars[extern_var_index].name,_name);
        extern_vars[extern_var_index].kind = KIND_VAR;
        //extern_vars[extern_var_index].offset = extern_var_offset;
        //extern_var_offset += 4*_size;
        extern_var_index++;
    }
    else if(_kind == KIND_ARRAY){//是数组//仅需记录数组名和数组大小（用来生成数组名.space）
        strcpy(extern_vars[extern_var_index].name,_name);
        extern_vars[extern_var_index].kind = KIND_ARRAY;
        extern_vars[extern_var_index].arraysize = _size;//数组大小
        extern_var_index++;
        /*int i;
        for(i=0;i<_size;i++){
            strcpy(extern_vars[extern_var_index].name,_name);
            char no[IDENL];
            itoa(i,no,10);//获取下标
            strcat(extern_vars[extern_var_index].name,"_");//名字后面加上下划线
            strcat(extern_vars[extern_var_index].name,no);//下划线后面加上下标数字（最后一个下划线后的数字是数组下标）
            extern_vars[extern_var_index].kind == KIND_ARRAY;
            extern_var_index++;
        }*/
    }
}
//打印全局变量
void print_extern_var(){
    int i;
    for(i=0;i<extern_var_index;i++){
        cout << extern_vars[i].name << "    " << extern_vars[i].kind << "   " << extern_vars[i].arraysize << endl;
    }
}

//字符串常量记录
char str_cons[MAXTAB][LINEL];//字符串常量数组
int str_con_index;//下标
void enter_str_con(char *_content){
    int i;
    for(i=0;i<str_con_index;i++){
        if(strcmp(str_cons[i],_content) == 0){//已经存在该字符串
            return ;
        }
    }
    strcpy(str_cons[str_con_index],_content);
    str_con_index ++;
}
int find_str_con(char *_content){//查找字符串的位置
    int i;
    for(i=0;i<str_con_index;i++){
        if(strcmp(str_cons[i],_content) == 0){
            break;
        }
    }
    return i;
}
void print_str_con(){
    int i;
    for(i=0;i<str_con_index;i++){
        cout << str_cons[i] << endl;
    }
}
/*typedef struct{
    char content[LINEL];
    int offset;
}str_con;
str_con str_cons[MAXTAB];//字符串常量表
int str_con_index;
//int str_con_offset;
void enter_str_con(char *_content){
    strcpy(str_cons[str_con_index].content,_content);
    //str_cons[str_con_index].offset = str_con_offset;
    //offset位移用记录吗？//不用记录，因为字符串常量不会被赋值
    str_con_index ++;
}*/

//值参数表（值参数的寄存器号）（用来改四元式输出顺序，一次性读完值参数再一起PUSH，方便生成mips）
int value_paras[MAXVALUEPARA];
int value_para_index;

#endif // DEFINE_H_INCLUDED
