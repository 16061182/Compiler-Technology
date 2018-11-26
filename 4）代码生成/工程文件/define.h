#ifndef DEFINE_H_INCLUDED
#define DEFINE_H_INCLUDED
#include<iostream>
#include<string.h>
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
#define MAXBLK 100//最大分程序数量
#define MAXSOURCECODE 1000000//读入的源代码的长度限制
#define MARK indextmp = sourceindex; sytmp = sy; chtmp = ch;
#define BACK sourceindex = indextmp; sy = sytmp; ch = chtmp;

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
    int totalblock;//total number of blocks
    int blockindex[MAXBLK];//block index tab
}symboltab;

ifstream fin;//Ô´´úÂëÊäÈëÎÄ¼þ
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

//源代码存储数组及其索引
char sourcecode[MAXSOURCECODE];
int sourcelenth = 0;
int sourceindex = 0;

//语法分析回退用变量
int indextmp;
int sytmp;
char chtmp;


#endif // DEFINE_H_INCLUDED
