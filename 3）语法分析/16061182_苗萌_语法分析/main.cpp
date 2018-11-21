/*
(1)标识符名称和预定义名称相同时，会直接视符号为预定义名称，因此应保证标识符名称和预定义名称不相同(相同则报错)
(2)判断语句是函数调用语句还是赋值语句时，可以直接根据符号表中的参数名来判断。若此语句所在模块中，
	在此语句之前有该IDEN的声明和赋值操作，那么即使定义了该IDEN函数，仍把同一模块中后面所有的IDEN视为变量而不是函数名（c语言特性）
*/
#include<iostream>
#include<string.h>
#include<fstream>
using namespace std;
#define	CONSTSY 0//const
#define	INTSY 1//int
#define	CHARSY 2//char
#define	VOIDSY 3//void
#define	IDEN 4//±êÊ¶·û
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
#define	ICON 27//ÕûÐÎ³£Á¿
#define	CCON 28//×Ö·û³£Á¿
#define	SCON 29//×Ö·û´®³£Á¿
#define	PLUS 30//+
#define	MINUS 31//-
#define	TIMES 32//*
#define	DIV 33
#define MAINSY 34//main

#define IDENL 50//±êÊ¶·ûµÄ³¤¶È²»³¬¹ý50
#define LINEL 1024//ÐÐµÄ³¤¶È²»³¬¹ý1024
#define KEYNUM 12//Ô¤¶¨Òå¹Ø¼ü×ÖµÄÊýÁ¿
#define SYMNUM 35//symbolµÄÊýÁ¿
#define MAXINT 2147483647//ÕûÐÍµÄ×î´óÖµ
#define MAXINTN 10//×î´óµÄÕûÐÍÎ»Êý
#define MAXTAB 500//size limit of symbol tab
#define MAXBLK 100//size limit of block index tab
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

void error(){
	printf("error!\n");
}

void readfile(){
    while(!fin.eof()){
        if(fin.good()){
            fin >> sourcecode[sourcelenth++];
        }
    }
//    sourcecode[sourcelenth++] = EOF;//末尾加上EOF便于停止
}

void getch(){
	ch = sourcecode[sourceindex++];
}

void getsym(){
	while(ch == ' '||ch == '\t'||ch == '\n'){
        if(ch == '\n') lc++;
		getch();
	}
	if(ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z' || ch == '_'){
		int i = 0;
		do{
			id[i++] = ch;
			getch();
		}while(ch >= 'a'&&ch <= 'z' || ch >= 'A' && ch <= 'Z' || ch == '_' || ch >= '0'&&ch <= '9');
		id[i] = '\0';
		//char id0[IDENL];
		for(i=0;i<strlen(id);i++){
			if(id[i]>='A'&&id[i]<='Z'){
			}
			id0[i] = tolower(id[i]);
		}
		id0[i] = '\0';
		int found = 0;
		int isiden = 1;//¼ÙÉè²»ÊÇ±£Áô×Ö
		for(i=0;i<KEYNUM;i++){
			if(strcmp(key[i],id0) == 0){
				found = 1;
				break;
			}
		}
		if(found) sy = ksy[i];
		else sy = IDEN;
		printf("%d %s %s\n",printnum++,printsym[sy],id);
	}
	else if(ch == '='){
		getch();
		if(ch == '='){
			sy = EQL;
			printf("%d %s\n",printnum++,printsym[sy]);
			getch();
		}
		else{
			sy = BECOM;
			printf("%d %s\n",printnum++,printsym[sy]);
		}
	}
	else if(ch == '!'){
		getch();
		if(ch == '='){
			sy = NEQ;
			printf("%d %s\n",printnum++,printsym[sy]);
			getch();
		}
	}
	else if(ch == '>'){
		getch();
		if(ch == '='){
			sy = GEQ;
			printf("%d %s\n",printnum++,printsym[sy]);
			getch();
		}
		else{
			sy = GTR;
			printf("%d %s\n",printnum++,printsym[sy]);
		}
	}
	else if(ch == '<'){
		getch();
		if(ch == '='){
			sy = LEQ;
			printf("%d %s\n",printnum++,printsym[sy]);
			getch();
		}
		else{
			sy = LSS;
			printf("%d %s\n",printnum++,printsym[sy]);
		}
	}
	else if(ch == '('){
		getch();
		sy = LPAR;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == ')'){
		getch();
		sy = RPAR;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == '['){
		getch();
		sy = LBRA;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == ']'){
		getch();
		sy = RBRA;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == '{'){
		getch();
		sy = LBPA;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == '}'){
		getch();
		sy = RBPA;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == ','){
		getch();
		sy = COMMA;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == ';'){
		getch();
		sy  = SEMI;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch >= '0'&&ch <= '9'){
		int k = 0;//Êý×ÖÎ»Êý
		inum = 0;
		sy = ICON;
		do{
			inum = inum*10+ch-'0';
			k++;
			getch();
		}while(ch >= '0'&&ch <= '9'&&inum <= MAXINT&&k<=MAXINTN);
		printf("%d %s %d\n",printnum++,printsym[sy],inum);
	}
	else if(ch == '\''){
		getch();
		if(ch == '+'||ch == '-'||ch == '*'||ch == '/'||ch >= 'a'&&ch <= 'z'||ch >= 'A'&&ch <= 'Z'||ch >= '0'&&ch <= '9'||ch == '_'){
			inum = ch;
			getch();
			if(ch == '\''){
				sy = CCON;
				printf("%d %s %c\n",printnum++,printsym[sy],inum);
				getch();
			}
		}
	}
	else if(ch == '\"'){
		getch();
		char str[LINEL];
		int i = 0;
		while(ch >= 32&&ch <= 126&&ch != 34&&i < LINEL){
			str[i++] = ch;
			getch();
		}
		if(ch == '\"'){
			sy = SCON;
			str[i] = '\0';
			printf("%d %s %s\n",printnum++,printsym[sy],str);
			getch();
		}
	}
	else if(ch == '+'){
		getch();
		sy = PLUS;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == '-'){
		getch();
		sy = MINUS;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == '*'){
		getch();
		sy = TIMES;
		printf("%d %s\n",printnum++,printsym[sy]);
	}
	else if(ch == '/'){
		getch();
		sy = DIV;
		printf("%d %s\n",printnum++,printsym[sy]);
	}

}

//---------------------------------------------------------------------------
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
            error();
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
        	error();
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
    printf("it is program\n");
}

void deccon(){//常量说明*
	if(sy != CONSTSY){
		error();
	}
	while(sy == CONSTSY){
		getsym();
		defcon();
		if(sy != SEMI){
			error();
		}
		getsym();
	}
	printf("it is deccon\n");
}

void defcon(){//常量定义*
	if(sy == INTSY){
		getsym();
		if(sy != IDEN){
			error();
		}
		strcpy(idvalue,id0);//获取符号名称
		getsym();
		if(sy != BECOM){
			error();
		}
		getsym();
		integer();
		enter(TYPE_INT,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
		//paranumvalue ++;//函数参数数量加一
		while(sy == COMMA){
			getsym();
			if(sy != IDEN){
				error();
			}
			strcpy(idvalue,id0);//获取符号名称
			getsym();
			if(sy != BECOM){
				error();
			}
			getsym();
			integer();
			enter(TYPE_INT,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
			//paranumvalue ++;//函数参数数量加一
		}
	}
	else if(sy == CHARSY){
		getsym();
		if(sy != IDEN){
			error();
		}
		strcpy(idvalue,id0);//获取符号名称
		getsym();
		if(sy != BECOM){
			error();
		}
		getsym();
		if(sy != CCON){
			error();
		}
		integervalue = inum;//获取ASCII码值
		enter(TYPE_CHAR,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
		//paranumvalue ++;//函数参数数量加一
		getsym();
		while(sy == COMMA){
			getsym();
			if(sy != IDEN){
				error();
			}
			strcpy(idvalue,id0);//获取符号名称
			getsym();
			if(sy != BECOM){
				error();
			}
			getsym();
			if(sy != CCON){
				error();
			}
			integervalue = inum;//获取ASCII码值
            enter(TYPE_CHAR,KIND_CONST,integervalue,idvalue,levelvalue,0);//登录符号表
            //paranumvalue ++;//函数参数数量加一
			getsym();
		}
	}
	else{
		error();
	}
	printf("it is defcon\n");
}

void integer(){//整数*
	if(sy == PLUS){
		getsym();
		if(sy != ICON){
			error();
		}
		integervalue = inum;//正号
		getsym();
	}
	else if(sy == MINUS){
		getsym();
		if(sy != ICON){
			error();
		}
		integervalue = 0-inum;//负号
		getsym();
	}
	else if(sy == ICON){
        integervalue = inum;//正号
		getsym();
	}
	else{
		error();
	}
	printf("it is integer\n");
}

void decvar_extern(){//用于程序中的变量说明（带回溯）
    if(sy != INTSY && sy != CHARSY){
		error();
	}
	while(sy == INTSY || sy == CHARSY){
        MARK
        //printf("after mark %c\n",ch);
		defvar();
        if(sy == LPAR){//如果是'('，说明不是var而是有返回值函数
            BACK
            tab.index --;//符号表回退
            //printf("after back %c\n",ch);
            break;
        }
		else if(sy == SEMI){
            getsym();
		}
		else{
            error();
		}
	}
	printf("it is decvar_extern\n");
}

void decvar(){//用于语句列中的变量说明*
	if(sy != INTSY && sy != CHARSY){
		error();
	}
	while(sy == INTSY || sy == CHARSY){
		defvar();
		if(sy != SEMI){
            error();
		}
		getsym();
	}
	printf("it is decvar\n");
}

void defvar(){//变量定义*
	if(sy != INTSY && sy != CHARSY){
		error();
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录变量类型
	getsym();
	if(sy != IDEN){
		error();
	}
	strcpy(idvalue,id0);//获取符号名称
	getsym();
	if(sy == LBRA){
		getsym();
		if(sy != ICON){
			error();
		}
		integervalue = inum;//记录数组元素个数
		getsym();
		if(sy != RBRA){
			error();
		}
		enter(typevalue,KIND_ARRAY,0,idvalue,levelvalue,integervalue);//登录符号表（数组）
		//paranumvalue ++;//函数参数数量加一
		getsym();
	}
	else{
        enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//登录符号表
        //paranumvalue ++;//函数参数数量加一
	}
	while(sy == COMMA){
		getsym();
		if(sy != IDEN){
			error();
		}
		strcpy(idvalue,id0);//获取符号名称
		getsym();
		if(sy == LBRA){
			getsym();
			if(sy != ICON){
				error();
			}
			integervalue = inum;//记录数组元素个数
			getsym();
			if(sy != RBRA){
				error();
			}
			enter(typevalue,KIND_ARRAY,0,idvalue,levelvalue,integervalue);//登录符号表（数组）
			//paranumvalue ++;//函数参数数量加一
			getsym();
		}
		else{
            enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//登录符号表
            //paranumvalue ++;//函数参数数量加一
		}
	}
	printf("it is defvar\n");
}

void deffunct(){//有返回值函数定义*
	if(sy != INTSY && sy != CHARSY){//省略声明头部的定义
		error();
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录变量类型
	getsym();
	if(sy != IDEN){
		error();
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
			error();
		}
		tab.symbols[funcindex].paranum = paranumvalue;//记录函数参数的数量
		getsym();
		if(sy != LBPA){
			error();
		}
		getsym();
		multistate();
		if(sy != RBPA){
			error();
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
			error();
		}
        //函数结束，退栈
		tab.index = funcindex + 1;//函数名保留在符号栈中
		tempintindex = intarrayindex;//int数组表回退
		tempcharindex = chararrayindex;//char数组表回退
		levelvalue --;//层次减一
		getsym();
	}
	else{
		error();
	}
	printf("it is deffunct\n");
}

void deffuncf(){//无返回值函数定义*
	if(sy != VOIDSY){
		error();
	}
	getsym();
	if(sy != IDEN){
		error();
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
			error();
		}
		tab.symbols[funcindex].paranum = paranumvalue;//记录函数参数的数量
		getsym();
		if(sy != LBPA){
			error();
		}
		getsym();
		multistate();
		if(sy != RBPA){
			error();
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
			error();
		}
		//函数结束，退栈
		tab.index = funcindex + 1;//函数名保留在符号栈中
		tempintindex = intarrayindex;//int数组表回退
		tempcharindex = chararrayindex;//char数组表回退
		levelvalue --;//层次减一
		getsym();
	}
	else{
		error();
	}
	printf("it is deffuncf\n");
}

void multistate(){//语句列*
	if(sy == CONSTSY){
		deccon();
	}
	if(sy == INTSY || sy == CHARSY){
		decvar();
	}
	states();
	printf("it is multistate\n");
}

void paralist(){//参数表*
	if(sy != INTSY && sy != CHARSY){
		error();
	}
	typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录参数类型
	getsym();
	if(sy != IDEN){
		error();
	}
	strcpy(idvalue,id0);//记录参数名称
	enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//加入符号表
	paranumvalue += 1;//记录参数的个数
	getsym();
	while(sy == COMMA){
		getsym();
		if(sy != INTSY && sy != CHARSY){
			error();
		}
		typevalue = (sy == INTSY)?TYPE_INT:TYPE_CHAR;//记录参数类型
		getsym();
		if(sy != IDEN){
			error();
		}
		strcpy(idvalue,id0);//记录参数名称
		enter(typevalue,KIND_VAR,0,idvalue,levelvalue,0);//加入符号表
		paranumvalue++;//参数的个数++
		getsym();
	}
	printf("it is paralist\n");
}

void mainfunc(){//主函数*
	if(sy != VOIDSY){
		error();
	}
	getsym();
	if(sy != MAINSY){
		error();
	}
	getsym();
	if(sy != LPAR){
		error();
	}
	getsym();
	if(sy != RPAR){
		error();
	}
	getsym();
	if(sy != LBPA){
		error();
	}
	levelvalue ++;
	getsym();
	multistate();
	if(sy != RBPA){
		error();
	}
	levelvalue --;
	getsym();//主函数的末尾，需要考虑
	printf("it is mainfunc\n");
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
	printf("it is expr\n");
}

void item(){//项*
	factor();
	while(sy == TIMES || sy == DIV){
		getsym();
		factor();
	}
	printf("it is item\n");
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
            else if(kind == KIND_ARRAY){
                getsym();
                if(sy != LBRA){
                    error();
                }
                getsym();
                expr();
                if(sy != RBRA){
                    error();
                }
                getsym();
            }
            else{
                error();
            }
		}
		else{
            error();//未声明的标识符
		}
		/*MARK
		getsym();
		if(sy == LPAR){
			BACK
			callfunctstate();
		}
		if(sy == LBRA){
			getsym();
			expr();
			if(sy != RBRA){
				error();
			}
			getsym();
		}*/
	}
	else if(sy == LPAR){
		getsym();
		expr();
		if(sy != RPAR){
			error();
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
		error();
	}
	printf("it is factor\n");
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
			error();
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
                error();
            }
		}
		else{
            error();//未声明的标识符
		}
		if(sy != SEMI){
            error();
		}
		getsym();
		/*MARK
		getsym();
		if(sy == SEMI || sy == LPAR){//函数调用语句
			BACK
			callfunctstate();//此处需要根据标识符判断是调用有返回值还是无返回值
		}
		else if(sy == BECOM || sy == LBRA){//赋值语句
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
			error();
		}
		getsym();
	}
	else if(sy == PRINTFSY){
		writestate();
		if(sy != SEMI){
			error();
		}
		getsym();
	}
	else if(sy == RETURNSY){
		returnstate();
		if(sy != SEMI){
			error();
		}
		getsym();
	}
	else if(sy == SEMI){
		getsym();
	}
	else{
		error();
	}
	printf("it is state\n");
}

void fuzhistate(){//赋值语句*
	if(sy != IDEN){
		error();
	}
	getsym();
	if(sy == LBRA){//需要查找符号表判断是不是数组
		getsym();
		expr();
		if(sy != RBRA){
			error();
		}
		getsym();
	}
	if(sy != BECOM){
		error();
	}
	getsym();
	expr();
	printf("it is fuzhistate\n");
}

void tiaojianstate(){//条件语句*
	if(sy != IFSY){
		error();
	}
	getsym();
	if(sy != LPAR){
		error();
	}
	getsym();
	tiaojian();
	if(sy != RPAR){
		error();
	}
	getsym();
	state();
	if(sy == ELSESY){
		getsym();
		state();
	}
	printf("it is tiaojianstate\n");
}

void tiaojian(){//条件*
	expr();
	if(sy == LSS || sy == LEQ || sy == GTR || sy == GEQ || sy == NEQ || sy == EQL){
		getsym();
		expr();
	}
	printf("it is tiaojian\n");
}

void xunhuanstate(){//循环语句*
	if(sy == WHILESY){
		getsym();
		if(sy != LPAR){
			error();
		}
		getsym();
		tiaojian();
		if(sy != RPAR){
			error();
		}
		getsym();
		state();
	}
	else if(sy == FORSY){
		getsym();
		if(sy != LPAR){
			error();
		}
		getsym();
		if(sy != IDEN){
			error();
		}
		getsym();
		if(sy != BECOM){
			error();
		}
		getsym();
		expr();
		if(sy != SEMI){
			error();
		}
		getsym();
		tiaojian();
		if(sy != SEMI){
			error();
		}
		getsym();
		if(sy != IDEN){
			error();
		}
		getsym();
		if(sy != BECOM){
			error();
		}
		getsym();
		if(sy != IDEN){
			error();
		}
		getsym();
		if(sy != PLUS && sy != MINUS){
			error();
		}
		getsym();
		if(sy != ICON){
			error();
		}
		getsym();
		if(sy != RPAR){
			error();
		}
		getsym();
		state();
	}
	else{
		error();
	}
	printf("it is xunhuanstate\n");
}

void callfunctstate(){//有返回值函数调用语句*
	if(sy != IDEN){
		error();
	}
	getsym();
	if(sy == LPAR){
		getsym();
		valueparalist();
		if(sy != RPAR){
			error();
		}
		getsym();
	}
	printf("it is callfunctstate\n");
}

void callfuncfstate(){//无返回值函数调用语句*
	if(sy != IDEN){
		error();
	}
	getsym();
	if(sy == LPAR){
		getsym();
		valueparalist();
		if(sy != RPAR){
			error();
		}
		getsym();
	}
	printf("it is callfuncfstate\n");
}

void valueparalist(){//值参数表*
	expr();
	while(sy == COMMA){
		getsym();
		expr();
	}
	printf("it is valueparalist\n");
}

void states(){//语句列*
	while(sy == IFSY || sy == WHILESY || sy == FORSY || sy == LBPA
		|| sy == IDEN || sy == SCANFSY || sy == PRINTFSY || sy == RETURNSY || sy == SEMI){
		state();
	}
	printf("it is states\n");
}

void readstate(){//读语句*
	if(sy != SCANFSY){
		error();
	}
	getsym();
	if(sy != LPAR){
		error();
	}
	getsym();
	if(sy != IDEN){
		error();
	}
	getsym();
	while(sy == COMMA){
		getsym();
		if(sy != IDEN){
			error();
		}
		getsym();
	}
	if(sy != RPAR){
		error();
	}
	getsym();
	printf("it is readstate\n");
}

void writestate(){//写语句*
	if(sy != PRINTFSY){
		error();
	}
	getsym();
	if(sy != LPAR){
		error();
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
		error();
	}
	getsym();
	printf("it is writestate\n");
}

void returnstate(){//返回语句*
	if(sy != RETURNSY){
		error();
	}
	getsym();
	if(sy == LPAR){
		getsym();
		expr();
		if(sy != RPAR){
			error();
		}
		getsym();
	}
	printf("it is returnstate\n");
}


void setup(){
	strcpy(key[0],"const");
	strcpy(key[1],"int");
	strcpy(key[2],"char");
	strcpy(key[3],"void");
	strcpy(key[4],"if");
	strcpy(key[5],"else");
	strcpy(key[6],"while");
	strcpy(key[7],"for");
	strcpy(key[8],"scanf");
	strcpy(key[9],"printf");
	strcpy(key[10],"return");
	strcpy(key[11],"main");

	ksy[0] = CONSTSY;
	ksy[1] = INTSY;
	ksy[2] = CHARSY;
	ksy[3] = VOIDSY;
	ksy[4] = IFSY;
	ksy[5] = ELSESY;
	ksy[6] = WHILESY;
	ksy[7] = FORSY;
	ksy[8] = SCANFSY;
	ksy[9] = PRINTFSY;
	ksy[10] = RETURNSY;
	ksy[11] = MAINSY;
}

int main(){
	fin.open("16061182_test.txt",ios::in);
	fin.unsetf(ios::skipws);//取消忽略空白符
	setup();
	readfile();
	/*printf("%c\n",sourcecode[33]);
	printf("%c\n",sourcecode[34]);
	printf("%c\n",sourcecode[35]);*/
	getch();
	getsym();
	program();
	//printf("%c",ch);
//	while(sourceindex < sourcelenth){
		//getch();
		//printf("%c",ch);
//		getsym();
		//printf("%d %d\n",sourceindex,sourcelenth);
		//printf("%d\n",ch);
//	}
	//sourcecode[sourcelenth] = EOF;
	//printf("%d",sourcecode[sourcelenth]);

	fin.close();
	return 0;
}
