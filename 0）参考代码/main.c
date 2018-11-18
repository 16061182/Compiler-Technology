#include <ctype.h>
#include<stdio.h>
#include<string.h>
char token[100];//存放单词的字符串
int symbol=-1;//枚举型全局变量，保存当前所识别的单词类型
int NUM;//存放当前读入的整型数值
int num;//token个数
char CHAR;
int ifxory;//表示表达式中的值是显式的还是隐式的 显示的为1 隐式的为0
FILE *fin;
FILE *fout;
FILE *fout2;
FILE *fout3;
FILE *fout4;
FILE *fout5;
#define CONSTSY 13
#define INTSY 1//int
#define CHARSY 2//char
#define VOIDSY 3//void
#define MAINSY 4//main
#define IFSY 5//if
#define DOSY 6//do
#define WHILESY 7//while
#define SWITCHSY 8//switch
#define CASESY 9//case
#define SCANFSY 10//scanf
#define PRINTFSY 11//printf
#define RETURNSY 12//return
#define IDSY 20//标识符
#define intSY 21//数字
#define PLUSSY 22//+
#define MINUSSY 23//-
#define MULTSY 24//*
#define DIVISY 25// /
#define LPARSY 26//(
#define RPARSY 27//)
#define COMMASY 28//,
#define SEMISY 29//;
#define COLONSY 30//:
#define ASSIGNSY 31//=
#define EQUSY 32//==
#define LESSSY 33//<
#define LEQSY 34//<=
#define MORESY 35//>
#define MOREQSY 36//>=
#define NEQSY 37// !=
#define LBRASY 38//[
#define RBRASY 39//]
#define LBRACSY 40//{
#define RBRACSY 41//}
#define QUOSY 42//'
#define DQUOSY 43//"
#define NUL 44
#define namelength 100
#define fmax 1000
#define end -1
#define listmax 200
#define datanum 200//数据流最大数量
#define maxlevel 100//最大层次数
#define szmax 1000//数组最大值
#define codelength 2000//MIPS代码长度
#define NULL " "
#define symnum 100//标识符个数 活跃变量分析使用 一个块里最多这么多的变量
#define blockmax 500//块的个数
#define casenum 1000//case 最多储存的数
void error(int a);
/*-------------------------------------------------------符号表-----------------------------------------------------------------*/
struct Sym{//符号表中的一位
    char name[namelength];
    int sum;//数组元素个数
    int type;//类型编号 intsy voidsy charsy
    int arr;//表示是否是数组 是的话为1 不是的话为0
    int kind;//const or var or para para为3
    int fun;//是函数为1 不是为0
    int size;//大小
    int addr;//地址 符号表位移
    int value;//数值
    int lev;//作用域的嵌套层次
    int par;//参数类型 变量形参 or 值形参
    int linedef;//标识符声明的行号
    int lineused;//标识符应用的行号
    int funlev;//函数的内部变量存在表中的位置
    int paranum;//函数参数的个数
    int cgflag;
    int sz[1000];
    int index;
};

int Flev=1;
typedef struct Mipstransform{
    int type;
    int kind;
    int index;//标识符所存的偏移量
    char ch1[namelength];
    char ch2[namelength];
    char ch3[namelength];
    int reg1;
    int reg2;
    int reg3;
    int sum;

}Mips;
Mips mipsset[codelength];
int mipsnum=0;//mips代码长度
struct symlist{
    struct Sym slist[listmax];//符号表
    int listpos;//当前符号表下标
};

int chanum;
struct symlist alist[maxlevel];
int findsym(char name[],int lev){//判断是否存在变量声明
    int i;

    if(lev>0){
        for(i=0;i<alist[lev].listpos;i++){
            if(strcmp(name,alist[lev].slist[i].name)==0){
                return 1;
            }
        }
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(name,alist[0].slist[i].name)==0){
                return 1;
            }
        }
    }else{
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(name,alist[0].slist[i].name)==0){
                return 1;
            }
        }
    }
    return 0;
}
struct Sym getvalue(char name[],int lev){
    int i;
    if(lev>0){
        for(i=0;i<alist[lev].listpos;i++){
            if(strcmp(name,alist[lev].slist[i].name)==0){
                return alist[lev].slist[i];
            }
        }
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(name,alist[0].slist[i].name)==0){
                return alist[0].slist[i];
            }
        }
    }else{
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(name,alist[0].slist[i].name)==0){
                return alist[0].slist[i];
            }
        }
    }
    return alist[0].slist[0];
}
int setmaxflag=1;
int insertvalue(struct Sym tempsym,int index,int value,int lev,int ifarray){
    int i;
    if(lev==0){
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(tempsym.name,alist[0].slist[i].name)==0){
                if(ifarray==1){
                  //  fprintf(fout3,"kaishicharu!!!!");

                    if(index>=szmax) {
                        if(setmaxflag==1){
                            printf("szmax set too small!\n");
                            setmaxflag=0;
                        }

                    }else alist[0].slist[i].sz[index]=value;
                    return 1;
                }else{
                    alist[0].slist[i].value=value;
                    return 1;
                }
            }
        }
    }else{
        for(i=0;i<alist[lev].listpos;i++){
            if(strcmp(tempsym.name,alist[lev].slist[i].name)==0){
                if(ifarray==1){
                    if(index>=szmax) {
                        if(setmaxflag==1){
                            printf("szmax set too small!\n");
                            setmaxflag=0;
                        }

                    }else alist[lev].slist[i].sz[index]=value;
                    return 1;
                }else{
                    alist[lev].slist[i].value=value;
                 //   fprintf(fout3,"!!!!chengg");
                    return 1;
                }
            }
        }
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(tempsym.name,alist[0].slist[i].name)==0){
                if(ifarray==1){
                    if(index>=szmax) {
                        if(setmaxflag==1){
                            printf("szmax set too small!\n");
                            setmaxflag=0;
                        }

                    }else alist[0].slist[i].sz[index]=value;
                    return 1;
                }else{
                    alist[0].slist[i].value=value;
                    return 1;
                }
            }
        }

    }

    return 0;
}
int insertsym(struct Sym tempsym,int j,int lev){//插入符号表 0为插入符号 1为插入int值 2为插入字符值 3为插入数组  lev为层次

  if(j==0){
    int i;
  /*  fprintf(fout3,"-------------------start-------------------\n");
    for(i=0;i<Flev;i++){
        fprintf(fout3,"list%d\n",i);
        for(j=0;j<alist[i].listpos;j++){
            fprintf(fout3,"%s\tlev=%d\tfunlev=%d\tfun=%d\tarr=%d\ttype=%d\tkind=%d\tvalue=%d\tkind=%d\tparanum=%d\t\n",alist[i].slist[j].name,alist[i].slist[j].lev,alist[i].slist[j].funlev,alist[i].slist[j].fun,alist[i].slist[j].arr,alist[i].slist[j].type,alist[i].slist[j].kind,alist[i].slist[j].value,alist[i].slist[j].kind,alist[i].slist[j].paranum);
        }
        fprintf(fout3,"\n");
    }
    fprintf(fout3,"-----------------------------------------\n");*/

   // printf("    pos=%d",alist[lev].listpos);
  //  printf("jinlaile %s listpos=%d",tempsym.name,alist[lev].listpos);
    for(i=0;i<alist[lev].listpos;i++){
       // printf("%s vs %s",token,)
        if(strcmp(tempsym.name,alist[lev].slist[i].name)==0){
            error(61);
            return -1;
        }
    }
   // tempsym.index=alist[lev].listpos;
    alist[lev].slist[alist[lev].listpos]=tempsym;
    alist[lev].listpos++;
   /* fprintf(fout3,"-------------------end-------------------\n");
    for(i=0;i<Flev;i++){
        fprintf(fout3,"list%d\n",i);
        for(j=0;j<alist[i].listpos;j++){
            fprintf(fout3,"%s\tlev=%d\tfunlev=%d\tfun=%d\tarr=%d\ttype=%d\tkind=%d\tvalue=%d\tkind=%d\tparanum=%d\t\n",alist[i].slist[j].name,alist[i].slist[j].lev,alist[i].slist[j].funlev,alist[i].slist[j].fun,alist[i].slist[j].arr,alist[i].slist[j].type,alist[i].slist[j].kind,alist[i].slist[j].value,alist[i].slist[j].kind,alist[i].slist[j].paranum);
        }
        fprintf(fout3,"\n");
    }
    fprintf(fout3,"-----------------------------------------\n");*/
  }else if(j==1){
    int i;
    for(i=0;i<alist[lev].listpos;i++){
        if(strcmp(tempsym.name,alist[lev].slist[i].name)==0){
            alist[lev].slist[i].value=NUM;
            return 1;
        }
    }
  }else if(j==2){
    int i;
    for(i=0;i<alist[lev].listpos;i++){
        if(strcmp(tempsym.name,alist[lev].slist[i].name)==0){
            alist[lev].slist[i].value=token[0];
            return 1;
        }
    }
  }else if(j==3){
      int i;

  }
  return 1;
}
int typeoffunc(char name[]){
    int i;
    for(i=0;i<alist[0].listpos;i++){
        if((strcmp(alist[0].slist[i].name,name)==0)&&(alist[0].slist[i].fun==1)){
            return alist[0].slist[i].type;
        }
    }
    return -1;
}
/*----------------------------------------------------------词法分析部分-----------------------------------------------------------*/
int line=1;
int isSpace(){//判断是否试空格
	if(CHAR==' ') {
            return 1;
	}
	else return 0;
}
int isNewline(){//判断是否是空行
	if(CHAR=='\n') {
            line++;
            fprintf(fout2,"\n%d:\n",line);
            return 1;
	}
	else return 0;
}
int isTab(){//判断是否是Tab
	if(CHAR=='\t') return 1;
	else return 0;
}
int isLetter(){//判断是否是字母
	if((CHAR>='a'&CHAR<='z')|(CHAR>='A'&CHAR<='Z')|CHAR=='_') return 1;
	else return 0;
}
int isDight(){//判断是否试数字
	if(CHAR>='0'&&CHAR<='9') return 1;
	else return 0;
}
void clearToken(){//清空token字符数组
    num=0;
    int i;
    for(i=0;i<100;i++){
        token[i]=' ';
    }
}
void catToken(int flag){//每次调用把CHAR和token中的字符数组连接
    if(flag==1) token[num]=CHAR;
    else token[num]=tolower(CHAR);

	num++;
}
void retract(){//将字符指针回退一个字符
	ungetc(CHAR,fin);
}
int reserver(){//查找保留字，若返回为0说明是一个标识符，否则返回保留字的类编号
	token[num]='\0';
	char *str;
	str=(char *)malloc((num+1)*(sizeof(char)));
	int i;
	for(i=0;i<num;i++){
        str[i]=token[i];
	}
	str[num]='\0';
	if(strcmp(str,"const")==0) return CONSTSY;
	else if(strcmp(str,"int")==0) return INTSY;
	else if(strcmp(str,"char")==0) return CHARSY;
	else if(strcmp(str,"void")==0) return VOIDSY;
	else if(strcmp(str,"main")==0) return MAINSY;
	else if(strcmp(str,"if")==0) return IFSY;
	else if(strcmp(str,"do")==0) return DOSY;
	else if(strcmp(str,"while")==0) return WHILESY;
	else if(strcmp(str,"switch")==0) return SWITCHSY;
	else if(strcmp(str,"case")==0) return CASESY;
	else if(strcmp(str,"scanf")==0) return SCANFSY;
	else if(strcmp(str,"printf")==0) return PRINTFSY;
	else if(strcmp(str,"return")==0) return RETURNSY;
	return 0;
}
int transNum(){
	NUM=0;
	int i;
	for(i=0;i<num;i++){
		NUM=NUM*10+token[i]-'0';
	}
	return NUM;
}
void error2(){
    printf("%d:word wrong!%c\n",line,CHAR);
}
int getsym(){
    clearToken();
    symbol==NUL;
    int dightflag=-1;
    int endflag=0;
    if(fscanf(fin,"%c",&CHAR)!=EOF){
        fprintf(fout2,"%c",CHAR);
    }else endflag=1;
    while(isSpace()||isNewline()||isTab()){
        if(fscanf(fin,"%c",&CHAR)==EOF) {
                fprintf(fout2,"%c",CHAR);
                endflag=1;
                break;

        }else fprintf(fout2,"%c",CHAR);
    }
    if(endflag==0){
    if(isLetter()){
        while(isLetter()||isDight()){
            catToken(0);
            if(fscanf(fin,"%c",&CHAR)==EOF) {
                    fprintf(fout2,"%c",CHAR);
                    break;
            }else if(isLetter()||isDight()){
                fprintf(fout2,"%c",CHAR);
            }
        }
        retract();

        int resultValue=reserver();
		if(resultValue==0) symbol=IDSY;
		else symbol=resultValue;

    }else if(isDight()){
        while(isDight()){
            if(dightflag==-1){
                if(CHAR=='0') dightflag=1;
                else dightflag=0;
            }else if(dightflag==1){
                dightflag=2;
            }
            catToken(0);
            if(fscanf(fin,"%c",&CHAR)==EOF) {
                    fprintf(fout2,"%c",CHAR);
                    break;
            }else if(isDight()){
                fprintf(fout2,"%c",CHAR);
            }
        }
        if(dightflag==2) error(68);
        retract();
        transNum();
        symbol=intSY;
    }else if(CHAR==':'){
        symbol=COLONSY;

    }else if(CHAR=='+') symbol=PLUSSY;
    else if(CHAR=='-') symbol=MINUSSY;
    else if(CHAR=='(')symbol=LPARSY;
    else if(CHAR==')')symbol=RPARSY;
    else if(CHAR==',') symbol=COMMASY;
    else if(CHAR==';')symbol=SEMISY;
    else if(CHAR=='/')symbol=DIVISY;
    else if(CHAR=='*')symbol=MULTSY;
    else if(CHAR=='='){
        fscanf(fin,"%c",&CHAR);
        if(CHAR=='=') {
                fprintf(fout2,"%c",CHAR);
                symbol=EQUSY;
        }
        else {
            retract();
            symbol=ASSIGNSY;
        }
    }else if(CHAR=='<'){
        fscanf(fin,"%c",&CHAR);
        if(CHAR=='=') {
            fprintf(fout2,"%c",CHAR);
            symbol=LEQSY;
        }else {
            retract();
            symbol=LESSSY;
        }
    }else if(CHAR=='>'){
        fscanf(fin,"%c",&CHAR);
        if(CHAR=='='){
            fprintf(fout2,"%c",CHAR);
            symbol=MOREQSY;
        }
        else {
            retract();
            symbol=MORESY;
        }
    }else if(CHAR=='!'){
        fscanf(fin,"%c",&CHAR);
        fprintf(fout2,"%c",CHAR);
        if(CHAR=='=') symbol=NEQSY;
        else error2();
    }else if(CHAR=='[')symbol=LBRASY;
    else if(CHAR==']') symbol=RBRASY;
    else if(CHAR=='{') symbol=LBRACSY;
    else if(CHAR=='}')symbol=RBRACSY;
    else if(CHAR=='\''){
        fscanf(fin,"%c",&CHAR);
        fprintf(fout2,"%c",CHAR);
        if(CHAR=='\''){
        }else if(CHAR=='+'||CHAR=='-'||CHAR=='*'||CHAR=='/'||isLetter()||isDight()){
            catToken(1);
            token[num]='\0';
            fscanf(fin,"%c",&CHAR);
            fprintf(fout2,"%c",CHAR);
            if(CHAR=='\''){

            }else {
                error2();
            }
        }else {
            error2();
        }
        symbol=QUOSY;
    }
    else if(CHAR=='"') {
        fscanf(fin,"%c",&CHAR);
        fprintf(fout2,"%c",CHAR);
        while(CHAR==32||CHAR==33||(CHAR>=35&&CHAR<=126)){
            catToken(1);
            fscanf(fin,"%c",&CHAR);
            fprintf(fout2,"%c",CHAR);
        }
        if(CHAR=='"'){

        }else error2();
        symbol=DQUOSY;
    }else if(isSpace()||isNewline()||isTab()){
        symbol=NUL;
    }else {
        error2();
    }
    }else symbol=end;
}
void error(int a){
    switch(a){
        case 1:printf("%d:add wrong\n",line);fprintf(fout3,"add wrong\n");break;
        case 2:printf("%d:mul wrong\n",line);fprintf(fout3,"mul wrong\n");break;
        case 3:printf("%d:relation wrong\n",line);fprintf(fout3,"relation wrong\n");break;
        case 10:printf("%d:Number wrong no intsy\n",line);fprintf(fout3,"Number wrong no intsy\n");break;
        case 19:printf("%d:Parameterlist wrong no IDSY\n",line);fprintf(fout3,"Parameterlist wrong no IDSY\n");break;
        case 20:printf("%d:Statement colunm wrong no }\n",line);fprintf(fout3,"Statement colunm wrong no }\n");break;
        case 21:printf("%d:Statement revafuncuse wrong no ;\n",line);fprintf(fout3,"Statement revafuncuse wrong no ;\n");break;
        case 22:printf("%d:Statement assign wrong no ;\n",line);fprintf(fout3,"Statement assign wrong no ;\n");break;
        case 18:printf("%d:Statement Idsy wrong no =|[]|()\n",line);fprintf(fout3,"Statement Idsy wrong no =|[]|()\n");break;
        case 17:printf("%d:Statement scanf wrong no ;\n",line);fprintf(fout3,"Statement scanf wrong no ;\n");break;
        case 16:printf("%d:Statement print wrong no ;\n",line);fprintf(fout3,"Statement print wrong no ;\n");break;
        case 15:printf("%d:Statement return wrong no ;\n",line);fprintf(fout3,"Statement return wrong no ;\n");break;
        case 14:printf("%d:Statement wrong no anything\n",line);fprintf(fout3,"Statement wrong no anything\n");break;
        case 13:printf("%d:Revafuncdefin wrong no }\n",line);fprintf(fout3,"Revafuncdefin wrong no }\n");break;
        case 12:printf("%d:Revafuncdefin wrong no {\n",line);fprintf(fout3,"Revafuncdefin wrong no {\n");break;
		case 11:printf("%d:Revafuncdefin wrong no )\n",line);fprintf(fout3,"Revafuncdefin wrong no )\n");break;
		case 4:printf("%d:Novafuncdefin wrong no (\n",line);fprintf(fout3,"Novafuncdefin wrong no (\n");break;
		case 5:printf("%d:Novafuncdefin wrong no )\n",line);fprintf(fout3,"Novafuncdefin wrong no )\n");break;
		case 6:printf("%d:Novafuncdefin wrong no {\n",line);fprintf(fout3,"Novafuncdefin wrong no {\n");break;
		case 7:printf("%d:Novafuncdefin wrong no }\n",line);fprintf(fout3,"Novafuncdefin wrong no }\n");break;
		case 8:printf("%d:Main wrong no }\n",line);fprintf(fout3,"Main wrong no }\n");break;
		case 9:printf("%d:Main wrong no {\n",line);fprintf(fout3,"Main wrong no {\n");break;
		case 50:printf("%d:Main wrong no )\n",line);fprintf(fout3,"Main wrong no )\n");break;
		case 51:printf("%d:Main wrong no (\n",line);fprintf(fout3,"Main wrong no (\n");break;
		case 43:printf("%d:Constantdefine wrong no Idsy\n",line);fprintf(fout3,"Constantdefine wrong no Idsy\n");break;
		case 42:printf("%d:Constantdefine wrong no =\n",line);fprintf(fout3,"Constantdefine wrong no =\n");break;
		case 41:printf("%d:Constantdefine wrong no ;|,\n",line);fprintf(fout3,"Constantdefine wrong no ;|,\n");break;
		case 45:printf("%d:Constantdefine wrong no '\n",line);fprintf(fout3,"Constantdefine wrong no '\n");break;
		case 44:printf("%d:Constantdefine wrong no int|char\n",line);fprintf(fout3,"Constantdefine wrong no int|char\n");break;
		case 46:printf("%d:Constantdefine wrong var after revafuncuse\n",line);fprintf(fout3,"Constantdefine wrong var after revafuncuse\n");break;
		case 47:printf("%d:Variabledefinition revafuncuse at var\n",line);fprintf(fout3,"Variabledefinition revafuncuse at var\n");break;
		case 48:printf("%d:Variabledefinition wrong no ]\n",line);fprintf(fout3,"Variabledefinition wrong no ]\n");break;
		case 49:printf("%d:Variabledefinition wrong no ,|;\n",line);fprintf(fout3,"Variabledefinition wrong no ,|;\n");break;
		case 52:printf("%d:Variabledefinition wrong no idsy\n",line);fprintf(fout3,"Variabledefinition wrong no idsy\n");break;
		case 53:printf("%d:Revafuncuse wrong no )\n",line);fprintf(fout3,"Revafuncuse wrong no )\n");break;
		case 54:printf("%d:Factor wrong no ]\n",line);fprintf(fout3,"Factor wrong no ]\n");break;
		case 55:printf("%d:Factor wrong no )\n",line);fprintf(fout3,"Factor wrong no )\n");break;
		case 56:printf("%d:Factor wrong no anything\n",line);fprintf(fout3,"Factor wrong no anything\n");break;
        case 23:printf("%d:Situation wrong no }\n",line);fprintf(fout3,"Situation wrong no }\n");break;
        case 31:printf("%d:Situation wrong no {\n",line);fprintf(fout3,"Situation wrong no {\n");break;
        case 24:printf("%d:Situation wrong no (\n",line);fprintf(fout3,"Situation wrong no (\n");break;
        case 25:printf("%d:Situation wrong no )\n",line);fprintf(fout3,"Situation wrong no )\n");break;
        case 26:printf("%d:Condition wrong no (\n",line);fprintf(fout3,"Condition wrong no (\n");break;
        case 27:printf("%d:Condition wrong no )\n",line);fprintf(fout3,"Condition wrong no )\n");break;
        case 28:printf("%d:Loop wrong no while\n",line);fprintf(fout3,"Loop wrong no while\n");break;
        case 29:printf("%d:Loop wrong no (\n",line);fprintf(fout3,"Loop wrong no (\n");break;
        case 30:printf("%d:Loop wrong no )\n",line);fprintf(fout3,"Loop wrong no )\n");break;
        case 32:printf("%d:Assignment wrong no =\n",line);fprintf(fout3,"Assignment wrong no =\n");break;
        case 33:printf("%d:Assignment wrong no ]\n",line);fprintf(fout3,"Assignment wrong no ]\n");break;
        case 34:printf("%d:Read wrong no (\n",line);fprintf(fout3,"Read wrong no (\n");break;
        case 35:printf("%d:Read wrong no IDSY\n",line);fprintf(fout3,"Read wrong no IDSY\n");break;
        case 36:printf("%d:Read wrong no )\n",line);fprintf(fout3,"Read wrong no )\n");break;
        case 37:printf("%d:Write wrong no (\n",line);fprintf(fout3,"Write wrong no (\n");break;
        case 38:printf("%d:Write wrong no )\n",line);fprintf(fout3,"Write wrong no )\n");break;
        case 39:printf("%d:Return wrong no )\n",line);fprintf(fout3,"Return wrong no )\n");break;
        case 60:printf("%d:Variabledefinition wrong [0]\n",line);fprintf(fout3,"Variabledefinition wrong [0]\n");break;
        case 62:printf("%d:Function did not exist\n",line);fprintf(fout3,"Function did not exist\n");break;
        case 63:printf("%d:Sonsituation wrong no :\n",line);fprintf(fout3,"Sonsituation wrong no :\n");break;
        case 64:printf("%d:Return wrong no (\n",line);fprintf(fout3,"Return wrong no (\n");break;
        case 66:printf("%d:Procedure wrong something wrong\n",line);fprintf(fout3,"Procedure wrong something wrong\n");break;
        case 67:printf("%d:Number wrong with +|-0\n",line);fprintf(fout3,"Number wrong with +|-0\n");break;
        case 68:printf("%d:Number wrong with 0xx\n",line);fprintf(fout3,"Number wrong with 0xx\n");break;
        case 61:printf("%d:The idsy has exist\n",line);fprintf(fout3,"The idsy has exist\n");break;
        case 80:printf("%d:the function tunning with wrong para number\n",line);fprintf(fout3,"the function tunning with wrong para number\n");break;
        case 81:printf("%d:there are something after main\n",line);fprintf(fout3,"there are something after main\n");break;
        case 82:printf("%d:the idsy was array it should not be array\n",line);fprintf(fout3,"the idsy should not be array\n");break;
        case 83:printf("%d:type was not matched int to char was wrong\n",line);fprintf(fout3,"type was not matched int to char was wrong\n");break;
        case 84:printf("%d:the array was out of range\n",line);fprintf(fout3,"the array was out of range\n");break;
        case 85:printf("%d:the idsy was not exist\n",line/*,token*/);fprintf(fout3,"the idsy was not exist\n");break;
        case 86:printf("%d:the value of const can not be changed\n",line);fprintf(fout3,"the value of const can not be changed\n");break;
        case 87:printf("%d:the idsy was function\n",line);fprintf(fout3,"the idsy was function\n");break;
        case 88:printf("%d:the idsy was not array it should be array\n",line);fprintf(fout3,"the idsy should be array\n");break;
        case 89:printf("%d:0 can not be DIVIDED\n",line);fprintf(fout3,"0 can not be DIVIDED\n");break;
        case 90:printf("%d:return type is wrong\n",line);fprintf(fout3,"return type is wrong\n");break;
        case 91:printf("%d:lack return statement\n",line);fprintf(fout3,"lack return statement\n");break;
        case 92:printf("%d:this function with return value doesnot exist\n",line);fprintf(fout3,"this function with return value doesnot exist\n");break;
        case 94:printf("%d:the case type is wrong inttochar or chartoint\n",line);fprintf(fout3,"the case type is wrong inttochar or chartoint\n");break;
        case 95:printf("%d:the case num/char is same\n",line);fprintf(fout3,"the case num/char is same\n");break;
        default:printf("%d wrong\n",a);fprintf(fout3,"%d wrong\n",a);
    }


}
/*--------------------------------------------------------------生成四元式部分-------------------------------------------------------------------*/
char fact1[namelength];
int reg=0;
int label=0;
int label2=100;
int intfact1;
int dataflag=0;
int ifcori=0;//如果是字符类型就是CHARSY 如果是数字就INTSY
int strnum=0;
char strsz[codelength][1000];//字符串数组
typedef struct md{
    int type;
    int kind;
    char ch1[namelength];
    char ch2[namelength];
    char ch3[namelength];
    int ifprint;
    int lev;
    int blockn;
    int defouse;//1为def 2为use 0没出现
}midcode;
int midnum=0;
midcode midcodes[codelength];
int ecbl=0;//二次遍历
void getmid(int type,int kind,char ch1[],char ch2[],char ch3[],int ifprint,int lev){

  if(ifprint==1){
    strcpy(mipsset[mipsnum].ch1,ch1);
    strcpy(mipsset[mipsnum].ch2,ch2);
  //  printf("   %d",strcmp(ch3,"\0"));
  //  if(strcmp(ch3,NULL)==0) printf("shikong!");
   // if(strcmp(ch3,NULL)==0) strcpy(mipsset[mipsnum].ch3,NULL);
    strcpy(mipsset[mipsnum].ch3,ch3);
    mipsset[mipsnum].type=type;
    mipsset[mipsnum].kind=kind;
    mipsset[mipsnum].reg1=0;
    mipsset[mipsnum].reg2=0;
    mipsset[mipsnum].reg3=0;
    if(ecbl==0){
        midcodes[midnum].type=type;
        midcodes[midnum].kind=kind;
        midcodes[midnum].ifprint=1;
        midcodes[midnum].lev=lev;
        strcpy(midcodes[midnum].ch1,ch1);
        strcpy(midcodes[midnum].ch2,ch2);
        strcpy(midcodes[midnum].ch3,ch3);
        midcodes[midnum].defouse=0;

    }
    switch(type){
        case 0:{
          //  printf("22jinlaile!");
            if(kind==1) {
                if(dataflag==0){
                    dataflag=1;
                    fprintf(fout4,".data\n");
                }
                if(lev==0)fprintf(fout4,"%s: .word %s\n",ch1,ch2);
                else{
                    char templev[namelength];
                    itoa(lev,templev,10);
                    strcat(ch1,".");
                    strcat(ch1,templev);
                    fprintf(fout4,"%s: .word %s\n",ch1,ch2);
                }
            //    fprintf(fout4,"%s: .word %s\n",ch1,ch2);
                fprintf(fout3,"con\tint\t%s\t%s\n",ch1,ch2);
            //    printf("shuchule!");

            }else if(kind==2) {
                if(dataflag==0){
                    dataflag=1;
                    fprintf(fout4,".data\n");
                }
                if(lev==0) fprintf(fout4,"%s: .word \'%s\'\n",ch1,ch2);
                else {
                    char templev[namelength];
                    itoa(lev,templev,10);
                    strcat(ch1,".");
                    strcat(ch1,templev);
                    fprintf(fout4,"%s: .word \'%s\'\n",ch1,ch2);

                }
              //  fprintf(fout4,"%s: .word \'%s\'\n",ch1,ch2);
                fprintf(fout3,"con\tchar\t%s\t%s\n",ch1,ch2);
            }
            break;

        }case 1:{
            if(kind==1) {
                    fprintf(fout3,"F\tint\t%s\n",ch1);
            }else if(kind==2) {
                fprintf(fout3,"F\tchar\t%s\n",ch1);
            }else if(kind==3) {
                fprintf(fout3,"F\tvoid\t%s\n",ch1);
            }break;
        }
        case 2:{
            struct Sym tempsym;
            tempsym=getvalue(ch1,lev);
            mipsset[mipsnum].index=tempsym.index;
            if(kind==1) {
                if(tempsym.lev==0){
                    if(dataflag==0){
                        dataflag=1;
                        fprintf(fout4,".data\n");
                    }
                    fprintf(fout4,"%s: .space 4\n",tempsym.name);

                }

                fprintf(fout3,"var\tint\t%s\n",ch1);
            }else if(kind==2) {
                if(tempsym.lev==0){
                    if(dataflag==0){
                        dataflag=1;
                        fprintf(fout4,".data\n");
                    }
                    fprintf(fout4,"%s: .space 4\n",tempsym.name);

                }


                fprintf(fout3,"var\tchar\t%s\n",ch1);
            }
            break;
        }
        case 3:{
            if(kind==1) fprintf(fout3,"para\tint\t%s\t%s\n",ch1,ch2);
            else if(kind==2) fprintf(fout3,"para\tchar\t%s\t%s\n",ch1,ch2);
            break;
        }
        case 4:{
            struct Sym tempsym;
            tempsym=getvalue(ch1,lev);
            mipsset[mipsnum].index=tempsym.index;
            mipsset[mipsnum].sum=tempsym.sum;
            if(kind==1){
                if(tempsym.lev==0){
                    if(dataflag==0){
                        dataflag=1;
                        fprintf(fout4,".data\n");
                    }
                    fprintf(fout4,"%s: .space %d\n",tempsym.name,4*tempsym.sum);

                }
                fprintf(fout3,"array\tint\t%s\t%s\n",ch1,ch2);
            }else if(kind==2){
                if(tempsym.lev==0){
                    if(dataflag==0){
                        dataflag=1;
                        fprintf(fout4,".data\n");
                    }
                    fprintf(fout4,"%s: .space %d\n",tempsym.name,4*tempsym.sum);

                }

                fprintf(fout3,"array\tchar\t%s\t%s\n",ch1,ch2);
            }
            break;
        }
        case 5:{
            if(kind==EQUSY) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }
                fprintf(fout3,"BEQ\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }else if(kind==NEQSY) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }
                fprintf(fout3,"BNE\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }else if(kind==MORESY) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }
                fprintf(fout3,"BLE\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }else if(kind==MOREQSY) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }

                fprintf(fout3,"BLT\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }else if(kind==LEQSY) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }
                fprintf(fout3,"BGT\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }else if(kind==LESSSY) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }
                fprintf(fout3,"BGE\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }
            break;
        }
        case 6:{
            fprintf(fout3,"JMP\t%s\n",ch1);
            break;
        }
        case 7:{
            fprintf(fout3,"Label%s:\n",ch1);
            break;
        }
        case 8:{
            int i=0;
            int num=0;
            while(ch2[i]>='0'&&ch2[i]<='9'){
                num=num*10+ch2[i]-'0';
                i++;
            }
            mipsset[mipsnum].reg2=num;
            if(kind==1) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                fprintf(fout3,"ret\t%s\t%d\n",ch1,mipsset[mipsnum].reg2);
            }else if(kind==2) fprintf(fout3,"ret\t%d\n",mipsset[mipsnum].reg2);

            break;
        }
        case 9:{
          if(kind==1||kind==2||kind==3||kind==4){
            struct Sym tempsym;
            tempsym=getvalue(ch1,lev);
            if(tempsym.type==INTSY) {
                    if(tempsym.lev==0) mipsset[mipsnum].kind=3;
                    else mipsset[mipsnum].kind=1;
                    midcodes[midnum].kind=mipsset[mipsnum].kind;
            }else if(tempsym.type==CHARSY) {
                if(tempsym.lev==0) mipsset[mipsnum].kind=4;
                else mipsset[mipsnum].kind=2;
                midcodes[midnum].kind=mipsset[mipsnum].kind;
            }mipsset[mipsnum].index=tempsym.index;

          }else{
            if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
            }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
            }
          }
          fprintf(fout3,"IN\t%s\n",ch1);
          break;
        }
        case 10:{
            if(kind==1||kind==3) {
                    struct Sym tempsym;
                    tempsym=getvalue(ch1,lev);
                    mipsset[mipsnum].index=tempsym.index;
                    if(ch1[0]=='0'){
                        mipsset[mipsnum].reg1=0;
                    }else{
                        int i=1;
                        int num=0;
                        while(ch1[i]>='0'&&ch1[i]<='9'){
                            num=num*10+ch1[i]-'0';
                            i++;
                        }
                        mipsset[mipsnum].reg1=num+5;
                    }
                    fprintf(fout3,"OUT\t%s\n",ch1);
            }else if(kind==2) {//输出的是内容 字符串
                    if(dataflag==0){
                        dataflag=1;
                        fprintf(fout4,".data\n");
                    }
                    char tempstr2[1000];
                    strcpy(tempstr2,"str");
                    char tempstr[namelength];
                    itoa(strnum,tempstr,10);
                    strcat(tempstr2,tempstr);
                    strcat(tempstr2,": .asciiz \"");
                    strcat(tempstr2,ch1);
                    strcat(tempstr2,"\"");
                    strcpy(strsz[strnum++],tempstr2);
                  //  fprintf(fout4,"str%d: .asciiz \"%s\"\n",strnum++,ch1);
                    strcpy(ch1,"str");
                    strcat(ch1,tempstr);
                    strcpy(mipsset[mipsnum].ch1,ch1);

                    fprintf(fout3,"OUT\t%s\n",ch1);
                 //   printf("---------------OUT%s----------------\n",ch1);
            }
            break;
        }
        case 11:{
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
                }
                if(ch3[0]=='0'){
                    mipsset[mipsnum].reg3=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch3[i]>='0'&&ch3[i]<='9'){
                        num=num*10+ch3[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg3=num+5;
                }
            if(kind==PLUSSY) {
                fprintf(fout3,"%s\t%s\t+\t%s\n",ch1,ch2,ch3);
            }else if(kind==MINUSSY) fprintf(fout3,"%s\t%s\t-\t%s\n",ch1,ch2,ch3);
            else if(kind==MULTSY) fprintf(fout3,"%s\t%s\t*\t%s\n",ch1,ch2,ch3);
            else if(kind==DIVISY) fprintf(fout3,"%s\t%s\t/\t%s\n",ch1,ch2,ch3);
            break;
        }
        case 12:{
            struct Sym tempsym;
            tempsym=getvalue(ch1,lev);
            mipsset[mipsnum].index=tempsym.index;
            if(tempsym.lev==0) mipsset[mipsnum].kind=2;
            else mipsset[mipsnum].kind=1;
            if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
            }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
            }
            if(ch3[0]=='0'){
                    mipsset[mipsnum].reg3=0;
            }else{
                    int i=1;
                    int num=0;
                    while(ch3[i]>='0'&&ch3[i]<='9'){
                        num=num*10+ch3[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg3=num+5;
            }
            fprintf(fout3,"array\t%s\t%s\t%s\n",ch1,ch2,ch3);
            break;
        }
        case 13:{
          if(kind==4){
            if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
            }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
            }
            if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
            }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
            }
          }else{
            struct Sym tempsym;
            tempsym=getvalue(ch1,lev);
            mipsset[mipsnum].index=tempsym.index;
            if(tempsym.lev==0) {
                    mipsset[mipsnum].kind=2;
                    if(ecbl==0) midcodes[midnum].kind=2;
            }
            else if(tempsym.kind==3) {
                    mipsset[mipsnum].kind=3;
                    mipsset[mipsnum].reg3=tempsym.paranum;
            }else mipsset[mipsnum].kind=1;
            if(ch2[0]=='0'){
                    mipsset[mipsnum].reg2=0;
            }else{
                    int i=1;
                    int num=0;
                    while(ch2[i]>='0'&&ch2[i]<='9'){
                        num=num*10+ch2[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg2=num+5;
            }
          }
            fprintf(fout3,"%s\t=\t%s\n",ch1,ch2);
            break;
        }
        case 14:{
            if(kind==1) {
                    if(ch2[0]=='0'){
                        mipsset[mipsnum].reg2=0;
                    }else{
                        int i=1;
                        int num=0;
                        while(ch2[i]>='0'&&ch2[i]<='9'){
                            num=num*10+ch2[i]-'0';
                            i++;
                        }
                        mipsset[mipsnum].reg2=num+5;
                    }
                    if(ch3[0]=='0'){
                        mipsset[mipsnum].reg3=0;
                    }else{
                        int i=1;
                        int num=0;
                        while(ch3[i]>='0'&&ch3[i]<='9'){
                            num=num*10+ch3[i]-'0';
                            i++;
                        }
                        mipsset[mipsnum].reg3=num+5;
                    }
                    struct Sym tempsym;
                    tempsym=getvalue(ch1,lev);
                    mipsset[mipsnum].index=tempsym.index;
                    fprintf(fout3,"la\t%s\t%s\t%s\n",ch1,ch2,ch3);
            }else if(kind==2) {
                struct Sym tempsym;
                tempsym=getvalue(ch2,lev);
                mipsset[mipsnum].index=tempsym.index;
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                fprintf(fout3,"la\t%s\t%s\n",ch1,ch2);
            }else if(kind==3) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }

                    mipsset[mipsnum].reg1=num+5;
                }
                fprintf(fout3,"la\t%s\t%s\n",ch1,ch2);
            }else if(kind==4) {
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                fprintf(fout3,"la\t%s\t%s\n",ch1,ch2);
            }else if(kind==5){
                struct Sym tempsym;
                tempsym=getvalue(ch2,lev);
                mipsset[mipsnum].index=tempsym.index;
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(ch3[0]>='0'&&ch3[0]<='9'){
                    int i=0;
                    int num=0;
                    while(ch3[i]>='0'&&ch3[i]<='9'){
                        num=num*10+ch3[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg3=num;
                }
                fprintf(fout3,"lapara\t%s\t%s\n",ch1,ch2);

            }else if(kind==6){//获取全局变量
                struct Sym tempsym;
                tempsym=getvalue(ch2,lev);
                mipsset[mipsnum].index=tempsym.index;
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                fprintf(fout3,"laol\t%s\t%s\n",ch1,ch2);
            }else if(kind==7){
                    if(ch2[0]=='0'){
                        mipsset[mipsnum].reg2=0;
                    }else{
                        int i=1;
                        int num=0;
                        while(ch2[i]>='0'&&ch2[i]<='9'){
                            num=num*10+ch2[i]-'0';
                            i++;
                        }
                        mipsset[mipsnum].reg2=num+5;
                    }
                    if(ch3[0]=='0'){
                        mipsset[mipsnum].reg3=0;
                    }else{
                        int i=1;
                        int num=0;
                        while(ch3[i]>='0'&&ch3[i]<='9'){
                            num=num*10+ch3[i]-'0';
                            i++;
                        }
                        mipsset[mipsnum].reg3=num+5;
                    }
                    struct Sym tempsym;
                    tempsym=getvalue(ch1,lev);
                    mipsset[mipsnum].index=tempsym.index;
                    fprintf(fout3,"laol\t%s\t%s\t%s\n",ch1,ch2,ch3);

            }else if(kind==8){
                struct Sym tempsym;
                tempsym=getvalue(ch2,lev);
                mipsset[mipsnum].index=tempsym.type;//用来表示是全局int 还是char
                if(ch1[0]=='0'){
                    mipsset[mipsnum].reg1=0;
                }else{
                    int i=1;
                    int num=0;
                    while(ch1[i]>='0'&&ch1[i]<='9'){
                        num=num*10+ch1[i]-'0';
                        i++;
                    }
                    mipsset[mipsnum].reg1=num+5;
                }
                if(tempsym.lev!=0){
                    char templev[namelength];
                    strcat(mipsset[mipsnum].ch2,".");
                    itoa(lev,templev,10);
                    strcat(mipsset[mipsnum].ch2,templev);

                }
                fprintf(fout3,"laol\t%s\t%s\n",ch1,ch2);

            }
            break;
        }
        case 15:{
            int i=1;
            int num=0;
          //  printf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!%s\n",ch2);
            while(ch2[i]>='0'&&ch2[i]<='9'){
                num=num*10+ch2[i]-'0';
                i++;
            }
            mipsset[mipsnum].index=-1*num;
            if(ch1[0]=='0'){
                mipsset[mipsnum].reg1=0;
            }else{
                int i=1;
                int num=0;
                while(ch1[i]>='0'&&ch1[i]<='9'){
                    num=num*10+ch1[i]-'0';
                    i++;
                }
                mipsset[mipsnum].reg1=num+5;
            }
            fprintf(fout3,"push\t%s\n",ch1);
            break;
        }
        case 16:{
            fprintf(fout3,"call\t%s\n",ch1);
            break;
        }
        case 17:{
            if(ch1[0]=='0'){
                mipsset[mipsnum].reg1=0;
            }else{
                int i=1;
                int num=0;
                while(ch1[i]>='0'&&ch1[i]<='9'){
                    num=num*10+ch1[i]-'0';
                    i++;
                }
                mipsset[mipsnum].reg1=num+5;
            }
            fprintf(fout3,"%s\t=\tRET\n",ch1);
            break;
        }

    }
    mipsnum++;
    if(ecbl==0) midnum++;
  }
}
/*---------------------------------------------------------代码优化-----------------------------------------------------------------------*/
int flown=1;
void getflow(){
    int i;
    for(i=0;i<midnum;i++){
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].lev==0){
            midcodes[i].blockn=0;
            continue;
        }
        if(midcodes[i].type!=1&&midcodes[i].type!=5&&midcodes[i].type!=6&&midcodes[i].type!=7&&midcodes[i].type!=8&&midcodes[i].type!=16){
            midcodes[i].blockn=flown;
        }else{
            if(midcodes[i].type==7){
                flown++;
                midcodes[i].blockn=flown;
            }else{
                midcodes[i].blockn=flown++;
            }
        }
    }

}
typedef struct df{
    char defname[symnum][namelength];//symnum为最多标识符个数
    int defnum;
    char usename[symnum][namelength];
    int usenum;
    int exist;
    int hjset[1000];//最大的块数 后继块
    int hjnum;
    char in[symnum][namelength];
    char out[symnum][namelength];
    int innum;
    int outnum;
}defuse;
//defuse du[flown+1];
typedef struct ct{
    char name[namelength];
    char c[symnum][namelength];
    int cnum;
}conflict;
int confnum=0;
conflict cf[symnum];
defuse du[blockmax];
void getalldefanduse(){
    int i;
    for(i=0;i<midnum;i++){
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==1){
            confnum=0;
            getdefanduse(midcodes[i].ch1);

        }
    }

}
void getdefanduse(char fname[namelength]){//数据流分析——活跃变量分析
  //  printf("kaishi!!! flown=%d",flown);
  //  int i;
   // defuse du[100];
 //   printf("chenggongshengming");
    int i;
    if(flown>blockmax){
        printf("\nblock number is too much!!");
        return;
    }

    for(i=0;i<flown+1;i++){
      //  printf(" %d ",i);
        du[i].defnum=0;
        du[i].usenum=0;
        du[i].exist=0;
        du[i].hjnum=0;
        du[i].innum=0;
        du[i].outnum=0;
    //    printf(" %d ",i);
    }
    for(i=0;i<symnum;i++){
        cf[i].cnum=0;
    }
  //  printf("kaishizhaodefuse");
    for(i=0;i<midnum;i++){//确定每个块的def use集合
        if(strcmp(midcodes[i].ch1,fname)!=0) continue;
        int j;
        int nowflow=0;
        for(j=i+1;j<midnum;j++){
            if(midcodes[j].ifprint==0) continue;
            if(midcodes[j].type==1) break;
            if(midcodes[j].blockn!=nowflow){
                nowflow=midcodes[j].blockn;
                du[midcodes[j].blockn].exist=1;
            }
         /*   if(j==87){
                fprintf(fout3,"\n!!!%d %d %s",midcodes[j].type,midcodes[j].kind,midcodes[j].ch2);
            }*/
            switch(midcodes[j].type){
                case 9:{
                    if(midcodes[j].kind==1){//def
                        int k;
                        int flag=1;
                        for(k=0;k<du[midcodes[j].blockn].usenum;k++){
                            if(strcmp(du[midcodes[j].blockn].usename[k],midcodes[j].ch1)==0){
                                flag=0;
                                break;
                            }
                        }
                        if(flag==1){
                            for(k=0;k<du[midcodes[j].blockn].defnum;k++){
                                if(strcmp(du[midcodes[j].blockn].defname[k],midcodes[j].ch1)==0){
                                    flag=0;
                                    break;
                                }
                            }
                        }
                        if(flag==1){
                            int num=du[midcodes[j].blockn].defnum;
                            strcpy(du[midcodes[j].blockn].defname[num],midcodes[j].ch1);
                            du[midcodes[j].blockn].defnum++;
                        }

                    }
                    break;
                }
                case 13:{
                    if(midcodes[j].kind==1||midcodes[j].kind==3){//def
                        int k;
                        int flag=1;
                        for(k=0;k<du[midcodes[j].blockn].usenum;k++){
                            if(strcmp(du[midcodes[j].blockn].usename[k],midcodes[j].ch1)==0){
                                flag=0;
                                break;
                            }
                        }
                        if(flag==1){
                            for(k=0;k<du[midcodes[j].blockn].defnum;k++){
                                if(strcmp(du[midcodes[j].blockn].defname[k],midcodes[j].ch1)==0){
                                    flag=0;
                                    break;
                                }
                            }
                        }
                        if(flag==1){
                            int num=du[midcodes[j].blockn].defnum;
                            strcpy(du[midcodes[j].blockn].defname[num],midcodes[j].ch1);
                            du[midcodes[j].blockn].defnum++;
                        }
                    }
                    break;
                }
                case 14:{
                    if(midcodes[j].kind==2||midcodes[j].kind==5){//use
                        int k;
                        int flag=1;
                     /*   if(midcodes[j].blockn==10){
                            fprintf(fout3,"\n!!!!%s  %d!!!!\n",midcodes[j].ch2,j);
                        }*/
                        for(k=0;k<du[midcodes[j].blockn].defnum;k++){
                            if(strcmp(du[midcodes[j].blockn].defname[k],midcodes[j].ch2)==0){
                                flag=0;
                                break;
                            }
                        }
                    /*    if(midcodes[j].blockn==10){
                            fprintf(fout3,"\n!!!!flag1=%d!!!!\n",flag);
                        }*/
                        if(flag==1){
                            for(k=0;k<du[midcodes[j].blockn].usenum;k++){
                                if(strcmp(du[midcodes[j].blockn].usename[k],midcodes[j].ch2)==0){
                                    flag=0;
                                    break;
                                }
                            }
                        }
                      /*  if(midcodes[j].blockn==10){
                            fprintf(fout3,"\n!!!!flag2=%d!!!!\n",flag);
                        }*/
                        if(flag==1){
                            int num=du[midcodes[j].blockn].usenum;
                            strcpy(du[midcodes[j].blockn].usename[num],midcodes[j].ch2);
                            du[midcodes[j].blockn].usenum++;
                        }

                    }

                    break;
                }

            }
      //      if(midcodes[j].type==9&&midcodes[j].kind==1)



        }
        break;

    }
  /*  for(i=1;i<flown+1;i++){
        int j;
        fprintf(fout3,"\nB%d def:",i);
        for(j=0;j<du[i].defnum;j++){
            fprintf(fout3," %s ",du[i].defname[j]);
        }
        fprintf(fout3,"\nB%d use:",i);
        for(j=0;j<du[i].usenum;j++){
            fprintf(fout3," %s ",du[i].usename[j]);
        }
    }

    for(i=0;i<midnum;i++){
        if(strcmp(midcodes[i].ch1,"main")!=0) continue;
        else break;
    }*/
   // printf("\n%d\n",midnum);
  // printf("\nkaishizhaohouji!!!!\n");
   fprintf(fout5,"\n\n\n****************%s****************\n\n\n",fname);
    for(i=i+1;i<midnum;i++){//找每个块的后继
      //  midcodes[i].type!=1&&midcodes[i].type!=5&&midcodes[i].type!=6&&midcodes[i].type!=7&&midcodes[i].type!=8&&midcodes[i].type!=16
      //  printf("%d %d %d\n",i,midcodes[i].blockn,midcodes[i].type);
        if(midcodes[i].ifprint==0) continue;
     //   printf("%d %d %d\n",i,midcodes[i].blockn,midcodes[i].type);
        if(midcodes[i].type==1) break;
        if(midcodes[i].type==5){
            int j;
        /*    if(i==98){
                fprintf(fout3,"hhh1");
            }*/
            for(j=1;j<flown+1-midcodes[i].blockn;j++){
                if(du[j+midcodes[i].blockn].exist==1){
                    du[midcodes[i].blockn].hjset[du[midcodes[i].blockn].hjnum]=j+midcodes[i].blockn;
                    du[midcodes[i].blockn].hjnum++;
                    break;
                }

            }
            for(j=0;j<midnum;j++){
                if(midcodes[j].type==7){
                    char templabel[namelength];
                    strcpy(templabel,"Label");
                    strcat(templabel,midcodes[j].ch1);
                    if(strcmp(templabel,midcodes[i].ch3)==0){
                        du[midcodes[i].blockn].hjset[du[midcodes[i].blockn].hjnum]=midcodes[j].blockn;
                        du[midcodes[i].blockn].hjnum++;
                        break;
                    }
                }
            }
        }else if(midcodes[i].type==6){
            int j;
            for(j=0;j<midnum;j++){
                if(midcodes[j].type==7){
                    char templabel[namelength];
                    strcpy(templabel,"Label");
                    strcat(templabel,midcodes[j].ch1);
                    if(strcmp(templabel,midcodes[i].ch1)==0){
                        du[midcodes[i].blockn].hjset[du[midcodes[i].blockn].hjnum]=midcodes[j].blockn;
                        du[midcodes[i].blockn].hjnum++;
                        break;
                    }
                }
            }
        }else if(midcodes[i].type==8||midcodes[i].type==16){
            int j;
            for(j=1;j<flown+1-midcodes[i].blockn;j++){
                if(du[j+midcodes[i].blockn].exist==1){
                    du[midcodes[i].blockn].hjset[du[midcodes[i].blockn].hjnum]=j+midcodes[i].blockn;
                    du[midcodes[i].blockn].hjnum++;
                    break;
                }

            }

        }else if(midcodes[i].type==7){
            int j;
            for(j=midcodes[i].blockn-1;j>0;j--){
                if(du[j].exist==1){
                    du[j].hjset[du[j].hjnum]=midcodes[i].blockn;
                    du[j].hjnum++;
                    break;
                }
            }

        }
    }
 //   printf("hhhhhhhh");
    int lastblock=0;
    printf("-----------------Block next,def,use------------------");
    fprintf(fout5,"-----------------Block next,def,use------------------");
    for(i=1;i<flown+1;i++){
        int j;
      //  printf("%d %d",i,du[i].exist);
        if(du[i].exist==0) continue;
        if(i>lastblock) lastblock=i;
        fprintf(fout5,"\nB%d hj:",i);
        for(j=0;j<du[i].hjnum;j++){
            fprintf(fout5," B%d ",du[i].hjset[j]);
        }
        fprintf(fout5,"\nB%d def:",i);
        for(j=0;j<du[i].defnum;j++){
            fprintf(fout5," %s ",du[i].defname[j]);
        }
        fprintf(fout5,"\nB%d use:",i);
        for(j=0;j<du[i].usenum;j++){
            fprintf(fout5," %s ",du[i].usename[j]);
        }
    }
    fprintf(fout5,"\n\n\n");
    printf("lastblock=%d",lastblock);
    int change=1;
    int gs=0;
    while(change){
        gs++;
        change=0;
        int i;
        for(i=lastblock;i>0;i--){
            if(du[i].exist==0) continue;
            int j;
            for(j=0;j<du[i].hjnum;j++){//out[B]=U后继in[P]
                int k;
                int hjbh=du[i].hjset[j];
                for(k=0;k<du[hjbh].innum;k++){
                    int w;
                    int flag=1;
                    for(w=0;w<du[i].outnum;w++){
                        if(strcmp(du[i].out[w],du[hjbh].in[k])==0){
                            flag=0;
                            break;
                        }
                    }
                    if(flag==1) {
                        change=1;
                        strcpy(du[i].out[du[i].outnum++],du[hjbh].in[k]);
                    }
                }
            }
            for(j=0;j<du[i].usenum;j++){//in[B]=in[B]Uuse[B]
                int k;
                int flag=1;
                for(k=0;k<du[i].innum;k++){
                    if(strcmp(du[i].in[k],du[i].usename[j])==0){
                        flag=0;
                        break;
                    }
                }
                if(flag==1){
                    change=1;
                    strcpy(du[i].in[du[i].innum++],du[i].usename[j]);
                }

            }
            for(j=0;j<du[i].outnum;j++){//out[B]-def[B] Uin[B]
                int k;
                int flag=1;
                for(k=0;k<du[i].defnum;k++){//out[B]-def[B]
                    if(strcmp(du[i].defname[k],du[i].out[j])==0){
                        flag=0;
                        break;
                    }
                }
                if(flag==1){//Uin[B]
                    for(k=0;k<du[i].innum;k++){
                        if(strcmp(du[i].in[k],du[i].out[j])==0){
                            flag=0;
                            break;
                        }
                    }
                    if(flag==1){
                        change=1;
                        strcpy(du[i].in[du[i].innum++],du[i].out[j]);
                    }
                }
            }
        }


    }
    printf("\ngs=%d\n",gs);
    fprintf(fout5,"-------------------Block in,out---------------------");
    for(i=1;i<flown+1;i++){
        int j;
      //  printf("%d %d",i,du[i].exist);fout3
        if(du[i].exist==0) continue;
   /*     if(i>lastblock) lastblock=i;
        fprintf(fout3,"\nB%d hj:",i);
        for(j=0;j<du[i].hjnum;j++){
            fprintf(fout3," B%d ",du[i].hjset[j]);
        }
        fprintf(fout3,"\nB%d def:",i);
        for(j=0;j<du[i].defnum;j++){
            fprintf(fout3," %s ",du[i].defname[j]);
        }
        fprintf(fout3,"\nB%d use:",i);
        for(j=0;j<du[i].usenum;j++){
            fprintf(fout3," %s ",du[i].usename[j]);
        }*/
        fprintf(fout5,"\nB%d in:",i);
        for(j=0;j<du[i].innum;j++){
            fprintf(fout5," %s ",du[i].in[j]);
            int k;
            int flag=1;
            for(k=0;k<confnum;k++){
                if(strcmp(cf[k].name,du[i].in[j])==0){
                    flag=0;
                    break;
                }
            }
            int number;
            if(flag==1){
                strcpy(cf[confnum++].name,du[i].in[j]);
                number=confnum-1;


            }else number=k;
            int w;
            for(w=0;w<du[i].innum;w++){//in[B]
                if(strcmp(du[i].in[w],cf[number].name)==0) continue;
                flag=1;
                int q;
                for(q=0;q<cf[number].cnum;q++){
                    if(strcmp(cf[number].c[q],du[i].in[w])==0){
                        flag=0;
                        break;
                    }
                }
                if(flag==1){
                    strcpy(cf[number].c[cf[number].cnum++],du[i].in[w]);
                }

            }
      /*      for(w=0;w<du[i].defnum;w++){//conflict=in[B]Udef[B]
                if(strcmp(du[i].defname[w],cf[number].name)==0) continue;
                flag=1;
                int q;
                for(q=0;q<cf[number].cnum;q++){
                    if(strcmp(cf[number].c[q],du[i].defname[w])==0){
                        flag=0;
                        break;
                    }
                }
                if(flag==1){
                    strcpy(cf[number].c[cf[number].cnum++],du[i].defname[w]);
                }

            }*/
        }
        fprintf(fout5,"\nB%d out:",i);
        for(j=0;j<du[i].outnum;j++){
            fprintf(fout5," %s ",du[i].out[j]);
        }

    }
  /*  for(i=1;i<flown+1;i++){
        if(du[i].exist==0) continue;
        int j;
        for(j=0;j<du[i].defnum;j++){
            int k;
            int flag=1;
            for(k=0;k<confnum;k++){
                if(strcmp(cf[k].name,du[i].defname[j])==0){
                    flag=0;
                    break;
                }
            }
            int number;
            if(flag==1){
                strcpy(cf[confnum++].name,du[i].defname[j]);
                number=confnum-1;


            }else number=k;
            int w;
            for(w=0;w<du[i].innum;w++){//in[B]
                if(strcmp(du[i].in[w],cf[number].name)==0) continue;
                flag=1;
                int q;
                for(q=0;q<cf[number].cnum;q++){
                    if(strcmp(cf[number].c[q],du[i].in[w])==0){
                        flag=0;
                        break;
                    }
                }
                if(flag==1){
                    strcpy(cf[number].c[cf[number].cnum++],du[i].in[w]);
                }

            }
            for(w=0;w<du[i].defnum;w++){//conflict=in[B]Udef[B]
                if(strcmp(du[i].defname[w],cf[number].name)==0) continue;
                flag=1;
                int q;
                for(q=0;q<cf[number].cnum;q++){
                    if(strcmp(cf[number].c[q],du[i].defname[w])==0){
                        flag=0;
                        break;
                    }
                }
                if(flag==1){
                    strcpy(cf[number].c[cf[number].cnum++],du[i].defname[w]);
                }

            }
        }
    }*/
    fprintf(fout5,"\n\n\n");
    fprintf(fout5,"-------------------conflict pic-----------------------");
    for(i=0;i<confnum;i++){
        int j;
        fprintf(fout5,"\n%s conflict with:",cf[i].name);
        for(j=0;j<cf[i].cnum;j++){
            fprintf(fout5," %s ",cf[i].c[j]);
        }
    }

}
void dellabel(){//窥孔优化
    int i;
    for(i=0;i<midnum;i++){
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==7&&midcodes[i+1].type==7){
            int j;
            char labeltemp[namelength];
            char labeltemp2[namelength];
            strcpy(labeltemp,"Label");
            strcat(labeltemp,midcodes[i].ch1);
            strcpy(labeltemp2,"Label");
            strcat(labeltemp2,midcodes[i+1].ch1);
            for(j=0;j<midnum;j++){
                if(midcodes[j].ifprint==0) continue;

                if(midcodes[j].type==5&&strcmp(labeltemp,midcodes[j].ch3)==0){
                    strcpy(midcodes[j].ch3,labeltemp2);
                }
                if(midcodes[j].type==6&&strcmp(labeltemp,midcodes[j].ch1)==0){
                    strcpy(midcodes[j].ch1,labeltemp2);
                }

            }
            midcodes[i].ifprint=0;


        }

    }
    int change=1;

    while(change==1){

    change=0;
    for(i=0;i<midnum;i++){
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==5){
            int j;
            for(j=i+1;;j++){
                if(midcodes[j].ifprint==0) continue;
                else break;
            }
            if(midcodes[j].type==7){
                char labeltemp[namelength];
                strcpy(labeltemp,"Label");
                strcat(labeltemp,midcodes[j].ch1);
                if(strcmp(midcodes[i].ch3,labeltemp)==0) {
                        midcodes[i].ifprint=0;
                        change=1;
                }

            }
        }else if(midcodes[i].type==6){
            int j;
            for(j=i+1;;j++){
                if(midcodes[j].ifprint==0) continue;
                else break;
            }
            if(midcodes[j].type==7){
                char labeltemp[namelength];
                strcpy(labeltemp,"Label");
                strcat(labeltemp,midcodes[j].ch1);
                if(strcmp(midcodes[i].ch1,labeltemp)==0) {
                        midcodes[i].ifprint=0;
                        change=1;
                }
            }
        }

    }
    }

}
void combineconstant(){//常数合并
    int i;
    for(i=0;i<midnum;i++){
        if(midcodes[i].lev==0) continue;
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==14&&midcodes[i].kind==3&&(midcodes[i].ch2[0]>'0'&&midcodes[i].ch2[0]<='9')){
            if(midcodes[i+1].ifprint!=0&&midcodes[i+1].type==14&&midcodes[i+1].kind==3&&(midcodes[i+1].ch2[0]>'0'&&midcodes[i+1].ch2[0]<='9')){
                if(midcodes[i+2].ifprint!=0&&midcodes[i+2].type==11&&(strcmp(midcodes[i+2].ch2,midcodes[i].ch1)==0)&&(strcmp(midcodes[i+2].ch3,midcodes[i+1].ch1)==0)){
                    int z;
                    switch(midcodes[i+2].kind){
                        case PLUSSY:{
                            z=atoi(midcodes[i].ch2)+atoi(midcodes[i+1].ch2);break;
                        }
                        case MINUSSY:{
                            z=atoi(midcodes[i].ch2)-atoi(midcodes[i+1].ch2);break;
                        }
                        case MULTSY:{
                            z=atoi(midcodes[i].ch2)*atoi(midcodes[i+1].ch2);break;
                        }
                        case DIVISY:{
                            z=atoi(midcodes[i].ch2)/atoi(midcodes[i+1].ch2);break;
                        }
                    }
                    midcodes[i].ifprint=0;
                    midcodes[i+1].ifprint=0;
                    midcodes[i+2].type=14;
                    midcodes[i+2].kind=3;
                    itoa(z,midcodes[i+2].ch2,10);
                    i=i+1;
                }
            }

        }
        if(midcodes[i].type==14&&midcodes[i].kind==3&&(midcodes[i].ch2[0]>'0'&&midcodes[i].ch2[0]<='9')){//删除0+-*/num
            if(midcodes[i+1].ifprint!=0&&midcodes[i+1].type==11&&(strcmp(midcodes[i+1].ch2,"0")==0)&&(strcmp(midcodes[i+1].ch3,midcodes[i].ch1)==0)){
                    int z;
                    switch(midcodes[i+1].kind){
                        case PLUSSY:{
                            z=atoi(midcodes[i].ch2);break;
                        }
                        case MINUSSY:{
                            z=0-atoi(midcodes[i].ch2);break;
                        }
                        case MULTSY:{
                            z=0;break;
                        }
                        case DIVISY:{
                            z=0;break;
                        }
                    }
                    midcodes[i].ifprint=0;
                    midcodes[i+1].type=14;
                    midcodes[i+1].kind=3;
                    itoa(z,midcodes[i+1].ch2,10);
            }
        }

    }


}

void delcomexp(){//删除公共子表达式 DAG
    fout3 = fopen("aftoptmid.txt","w");
    int i;
    int nowlev=0;
    for(i=0;i<midnum;i++){
        if(midcodes[i].lev==0) continue;
        if(midcodes[i].lev!=nowlev){
            nowlev=midcodes[i].lev;
        }
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==14&&(midcodes[i].kind==2||midcodes[i].kind==3||midcodes[i].kind==4||midcodes[i].kind==5||midcodes[i].kind==6)){//找到获得值的寄存器
            int j;
            for(j=i+1;;j++){
                if(midcodes[j].lev!=nowlev)break;
                if(midcodes[j].ifprint==0) continue;
                if(midcodes[j].type==5||midcodes[j].type==6||midcodes[j].type==7||midcodes[j].type==16||(midcodes[j].type==13&&strcmp(midcodes[j].ch1,midcodes[i].ch2)==0)) break;
                if(midcodes[j].type==14&&midcodes[j].kind==midcodes[i].kind&&strcmp(midcodes[j].ch2,midcodes[i].ch2)==0){//找到获得相同值的寄存器 并修改之后所有的该寄存器的t
                    midcodes[j].ifprint=0;
                    int k;
                 //   fprintf(fout3,"jinlaile!!!");
                    for(k=j+1;;k++){
                        if(midcodes[k].lev!=nowlev)break;
                        if(midcodes[k].ifprint==0) continue;

                        switch(midcodes[k].type){
                            case 5:{
                                if(strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }else if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 8:{
                                if(midcodes[k].kind==1&&strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 10:{
                                if((midcodes[k].kind==1||midcodes[k].kind==3)&&strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 11:{
                            //    fprintf(fout3,"hhhhh!!!!!!!!!!%d\n",k);
                                if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }else if(strcmp(midcodes[k].ch3,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch3,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 12:{
                                if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }else if(strcmp(midcodes[k].ch3,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch3,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 13:{
                                if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 14:{
                                if((midcodes[k].kind==7||midcodes[k].kind==1)&&strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 15:{
                                if(strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }
                                break;
                            }
                        }
                    }

                }
            }
        }

    }


    //删除类似a=t1+t2 b=t1+t2的情况
    int ifchange=1;//判断是否需要再删除
    while(ifchange==1){
    ifchange=0;
    for(i=0;i<midnum;i++){
        if(midcodes[i].lev==0) continue;
        if(midcodes[i].lev!=nowlev){
            nowlev=midcodes[i].lev;
        }
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==11){//找到加减乘除语句
            int j;
            for(j=i+1;;j++){
                if(midcodes[j].lev!=nowlev)break;
                if(midcodes[j].ifprint==0) continue;
                if(midcodes[j].type==5||midcodes[j].type==6||midcodes[j].type==7||midcodes[j].type==16) break;//每个临时寄存器只能代表一个变量 所以不需要考虑重新赋值的情况
                if(midcodes[j].type==11&&midcodes[j].kind==midcodes[i].kind&&(strcmp(midcodes[j].ch2,midcodes[i].ch2)==0)&&(strcmp(midcodes[j].ch3,midcodes[i].ch3)==0)){//找到获得相同值的寄存器 并修改之后所有的该寄存器的t
                    midcodes[j].ifprint=0;
                    ifchange=1;
                    int k;
                 //   fprintf(fout3,"jinlaile!!!");
                    for(k=j+1;;k++){
                        if(midcodes[k].lev!=nowlev)break;
                        if(midcodes[k].ifprint==0) continue;

                        switch(midcodes[k].type){
                            case 5:{
                                if(strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }else if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 8:{
                                if(midcodes[k].kind==1&&strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 10:{
                                if((midcodes[k].kind==1||midcodes[k].kind==3)&&strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 11:{
                            //    fprintf(fout3,"hhhhh!!!!!!!!!!%d\n",k);
                                if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }else if(strcmp(midcodes[k].ch3,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch3,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 12:{
                                if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }else if(strcmp(midcodes[k].ch3,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch3,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 13:{
                                if(strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 14:{
                                if((midcodes[k].kind==7||midcodes[k].kind==1)&&strcmp(midcodes[k].ch2,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch2,midcodes[i].ch1);
                                }
                                break;
                            }
                            case 15:{
                                if(strcmp(midcodes[k].ch1,midcodes[j].ch1)==0){
                                    strcpy(midcodes[k].ch1,midcodes[i].ch1);
                                }
                                break;
                            }
                        }
                    }

                }
            }
        }

    }
    }
}
void countreg(){//计数分配寄存器
    int usereg[reg+6];
    memset(usereg,0,sizeof(usereg));
    int i;
    for(i=0;i<midnum;i++){
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].type==5||(midcodes[i].type==8&&midcodes[i].kind==1)||(midcodes[i].type==10&&(midcodes[i].kind==1||midcodes[i].kind==3))||
           midcodes[i].type==11||(midcodes[i].type==14&&(midcodes[i].kind==2||midcodes[i].kind==3||midcodes[i].kind==4||midcodes[i].kind==5||
                                                         midcodes[i].kind==6||midcodes[i].kind==8))||
           midcodes[i].type==15||midcodes[i].type==17){
                if(midcodes[i].ch1[0]=='0'){
                    usereg[0]++;
                }else{
                    int j=1;
                    int num=0;
                    while(midcodes[i].ch1[j]>='0'&&midcodes[i].ch1[j]<='9'){
                        num=num*10+midcodes[i].ch1[j]-'0';
                        j++;
                    }
                    usereg[num]++;
                }

           }
        if(midcodes[i].type==5||midcodes[i].type==11||midcodes[i].type==12||midcodes[i].type==13||(midcodes[i].type==14&&(midcodes[i].kind==1||midcodes[i].kind==7))){
            if(midcodes[i].ch2[0]=='0'){
                usereg[0]++;
            }else{
                int j=1;
                int num=0;
                while(midcodes[i].ch2[j]>='0'&&midcodes[i].ch2[j]<='9'){
                    num=num*10+midcodes[i].ch2[j]-'0';
                    j++;
                }
                usereg[num]++;
            }
        }
        if(midcodes[i].type==11||midcodes[i].type==12||(midcodes[i].type==14&&(midcodes[i].kind==1||midcodes[i].kind==7))){
            if(midcodes[i].ch3[0]=='0'){
                usereg[0]++;
            }else{
                int j=1;
                int num=0;
                while(midcodes[i].ch3[j]>='0'&&midcodes[i].ch3[j]<='9'){
                    num=num*10+midcodes[i].ch3[j]-'0';
                    j++;
                }
                usereg[num]++;
            }
        }



    }
    for(i=0;i<reg+6;i++){
        fprintf(fout3,"useregnum:%d\n",usereg[i]);

    }

}
void allocatereg(){//全局寄存器分配
    int i;
    int nowlev=0;
    FILE *fout3;
    fout3=fopen("regallocate.txt","w");
    for(i=0;i<midnum;i++){
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].lev==0) continue;
        if(midcodes[i].lev!=nowlev){
            nowlev=midcodes[i].lev;//新的一个函数层
        }else continue;
        fprintf(fout3,"lev%d:\n",nowlev);
        int j;
        int tempregnum[reg+6];
        int tempreg=0;
        memset(tempregnum,0,sizeof(tempregnum));
        for(j=i;;j++){
            if(midcodes[j].lev!=nowlev) break;
            if(midcodes[j].ifprint==0) continue;
            if(midcodes[j].type==5||(midcodes[j].type==8&&midcodes[j].kind==1)||(midcodes[j].type==10&&(midcodes[j].kind==1||midcodes[j].kind==3))||
            midcodes[j].type==11||(midcodes[j].type==14&&(midcodes[j].kind==2||midcodes[j].kind==3||midcodes[j].kind==4||midcodes[j].kind==5||
                                                         midcodes[j].kind==6||midcodes[j].kind==8))||
            midcodes[j].type==15||midcodes[j].type==17){
                if(midcodes[j].ch1[0]=='0'){

                }else{
                    int k=1;
                    int num=0;
                    while(midcodes[j].ch1[k]>='0'&&midcodes[j].ch1[k]<='9'){
                        num=num*10+midcodes[j].ch1[k]-'0';
                        k++;
                    }
                    if(tempregnum[num]==0){
                        tempreg++;
                        fprintf(fout3,"reg%d ",num);
                    }
                    tempregnum[num]++;

                }
            }
            if(midcodes[j].type==5||midcodes[j].type==11||midcodes[j].type==12||midcodes[j].type==13||(midcodes[j].type==14&&(midcodes[j].kind==1||midcodes[j].kind==7))){
                if(midcodes[j].ch2[0]=='0'){

                }else{
                    int k=1;
                    int num=0;
                    while(midcodes[j].ch2[k]>='0'&&midcodes[j].ch2[k]<='9'){
                        num=num*10+midcodes[j].ch2[k]-'0';
                        k++;
                    }
                    if(tempregnum[num]==0){
                        tempreg++;
                        fprintf(fout3,"reg%d ",num);
                    }
                    tempregnum[num]++;
                }
            }
            if(midcodes[j].type==11||midcodes[j].type==12||(midcodes[j].type==14&&(midcodes[j].kind==1||midcodes[j].kind==7))){
                if(midcodes[j].ch3[0]=='0'){

                }else{
                    int k=1;
                    int num=0;
                    while(midcodes[j].ch3[k]>='0'&&midcodes[j].ch3[k]<='9'){
                        num=num*10+midcodes[j].ch3[k]-'0';
                        k++;
                    }
                    if(tempregnum[num]==0){
                        tempreg++;
                        fprintf(fout3,"reg%d ",num);
                    }
                    tempregnum[num]++;
                }
            }






        }
        fprintf(fout3,"\n");
        if(tempreg>11) tempreg=11;
        int k,mnum;//mnum为当前使用最多的寄存器的编号
     //   fprintf(fout3,"184==%d ",tempregnum[184]);
        for(k=0;k<tempreg;k++){
            int w;
            int max=0;
            for(w=0;w<reg;w++){

                if(tempregnum[w]>max){
                    max=tempregnum[w];
                    mnum=w;
                }
            }
            fprintf(fout3,"t%d max=%d",mnum,max);
            if(mnum==k) {
                    tempregnum[mnum]=0;
                    continue;
            }
            if(max==0) break;
            fprintf(fout3,"kaishijiaohuan\n");
            char tempreg1[namelength];//t0
            char tempreg2[namelength];// tk
            char tempreg3[namelength];
            strcpy(tempreg1,"t");
            strcpy(tempreg2,"t");
            itoa(k,tempreg3,10);
            strcat(tempreg1,tempreg3);

            itoa(mnum,tempreg3,10);
            strcat(tempreg2,tempreg3);
            tempregnum[mnum]=tempregnum[k];
            tempregnum[k]=0;
            for(w=i;w<midnum;w++){
                if(midcodes[w].lev!=nowlev) break;
                if(midcodes[w].ifprint==0) continue;
                if(midcodes[w].type==5||(midcodes[w].type==8&&midcodes[w].kind==1)||(midcodes[w].type==10&&(midcodes[w].kind==1||midcodes[w].kind==3))||
                midcodes[w].type==11||(midcodes[w].type==14&&(midcodes[w].kind==2||midcodes[w].kind==3||midcodes[w].kind==4||midcodes[w].kind==5||
                                                            midcodes[w].kind==6||midcodes[w].kind==8))||
                midcodes[w].type==15||midcodes[w].type==17){
                    if(strcmp(midcodes[w].ch1,tempreg1)==0){
                        strcpy(midcodes[w].ch1,tempreg2);

                    }else if(strcmp(midcodes[w].ch1,tempreg2)==0){
                        strcpy(midcodes[w].ch1,tempreg1);
                    }
                }
                if(midcodes[w].type==5||midcodes[w].type==11||midcodes[w].type==12||midcodes[w].type==13||(midcodes[w].type==14&&(midcodes[w].kind==1||midcodes[w].kind==7))){
                    if(strcmp(midcodes[w].ch2,tempreg1)==0){
                        strcpy(midcodes[w].ch2,tempreg2);

                    }else if(strcmp(midcodes[w].ch2,tempreg2)==0){
                        strcpy(midcodes[w].ch2,tempreg1);
                    }
                }
                if(midcodes[w].type==11||midcodes[w].type==12||(midcodes[w].type==14&&(midcodes[w].kind==1||midcodes[w].kind==7))){
                    if(strcmp(midcodes[w].ch3,tempreg1)==0){
                        strcpy(midcodes[w].ch3,tempreg2);

                    }else if(strcmp(midcodes[w].ch3,tempreg2)==0){
                        strcpy(midcodes[w].ch3,tempreg1);
                    }
                }
            }
         /*   tempregnum[w]=tempregnum[k];
            tempregnum[k]=0;*/
        }


        i=j-1;
    }

}
typedef struct regname{
    char name[namelength];
    int usenum;
}rn;
void allocatereg2(){//全局寄存器分配
   // printf("kaishi");
    int i;
    int nowlev=0;
    FILE *fout3;
    rn regn[1000];//存放函数层 每个函数层变量个数最多为1000
    int reggs=0;

    fout3=fopen("regallocate.txt","w");
    for(i=0;i<midnum;i++){
     //   printf("i=%d ",i);
        if(midcodes[i].ifprint==0) continue;
        if(midcodes[i].lev==0) continue;
        if(midcodes[i].lev!=nowlev){
            nowlev=midcodes[i].lev;//新的一个函数层
            reggs=0;
        }else continue;
        fprintf(fout3,"lev%d:\n",nowlev);
        int j;
    //    int tempregnum[reg+6];
        int tempreg=0;
     //   memset(tempregnum,0,sizeof(tempregnum));
        for(j=i;;j++){
            if(midcodes[j].lev!=nowlev) break;
            if(midcodes[j].ifprint==0) continue;
            if((midcodes[j].type==13&&(midcodes[j].kind==1))||(midcodes[j].type==14&&midcodes[j].kind==2)){
                char name[namelength];
                if(midcodes[j].type==13){
                    strcpy(name,midcodes[j].ch1);
                }else if(midcodes[j].type==14){
                    strcpy(name,midcodes[j].ch2);
                }
                int k;
                int flag=1;
                for(k=0;k<reggs;k++){
                    if(strcmp(regn[k].name,name)==0){
                        regn[k].usenum++;
                        flag=0;
                    }
                }
                if(flag==1){
                    strcpy(regn[reggs++].name,name);
                    regn[reggs-1].usenum=1;
                    tempreg++;
                }

            }


        }
        fprintf(fout3,"\n");
        if(tempreg>11) tempreg=11;
        int k,mnum;//mnum为当前使用最多的寄存器的编号
     //   fprintf(fout3,"184==%d ",tempregnum[184]);
        for(k=0;k<tempreg;k++){
            int w;
            int max=0;
            for(w=0;w<reggs;w++){

                if(regn[w].usenum>max){
                    max=regn[w].usenum;
                    mnum=w;
                }
            }
            fprintf(fout3,"t%d max=%s usenum=%d\n",k,regn[mnum].name,regn[mnum].usenum);
            if(regn[mnum].usenum==0) continue;
            regn[mnum].usenum=0;
            int find=0;
             char changereg[namelength];
            for(w=i;w<midnum;w++){
                if(midcodes[w].lev!=nowlev) break;
                if(midcodes[w].ifprint==0) continue;

                if(midcodes[w].type==14&&midcodes[w].kind==2&&strcmp(midcodes[w].ch2,regn[mnum].name)==0){

                    strcpy(changereg,midcodes[w].ch1);
                    //!!!!!!!!!!!!!!!!!!注意！！！
                    midcodes[w].ifprint=0;
                    find=1;
                    break;
                }


            }
            if(find==0){
                k=k-1;
                continue;
            }
            int keynum=w;

            char tempreg1[namelength];//t0
            char tempreg2[namelength];// tk
            char tempreg3[namelength];
            strcpy(tempreg1,"t");
            strcpy(tempreg2,changereg);//t228
            itoa(k,tempreg3,10);
            strcat(tempreg1,tempreg3);//reg1=t0
            fprintf(fout3,"reg1=%s ",tempreg1);
            fprintf(fout3,"reg2=%s \n",tempreg2);
            strcpy(midcodes[keynum].ch1,tempreg1);
            for(w=i;w<midnum;w++){
                if(strcmp(tempreg1,tempreg2)==0) {
                        fprintf(fout3,"tiaochu\n");
                        break;
                }
                if(midcodes[w].lev!=nowlev) break;
                if(midcodes[w].ifprint==0) continue;
                if(midcodes[w].type==5||(midcodes[w].type==8&&midcodes[w].kind==1)||(midcodes[w].type==10&&(midcodes[w].kind==1||midcodes[w].kind==3))||
                midcodes[w].type==11||(midcodes[w].type==14&&(midcodes[w].kind==2||midcodes[w].kind==3||midcodes[w].kind==4||midcodes[w].kind==5||
                                                            midcodes[w].kind==6||midcodes[w].kind==8))||
                midcodes[w].type==15||midcodes[w].type==17){
                    if(strcmp(midcodes[w].ch1,tempreg1)==0){
                        strcpy(midcodes[w].ch1,tempreg2);
                    }else if(strcmp(midcodes[w].ch1,tempreg2)==0){
                        strcpy(midcodes[w].ch1,tempreg1);
                    }

                }
                if(midcodes[w].type==5||midcodes[w].type==11||midcodes[w].type==12||midcodes[w].type==13||(midcodes[w].type==14&&(midcodes[w].kind==1||midcodes[w].kind==7))){
                    if(strcmp(midcodes[w].ch2,tempreg1)==0){
                        strcpy(midcodes[w].ch2,tempreg2);

                    }else if(strcmp(midcodes[w].ch2,tempreg2)==0){
                        strcpy(midcodes[w].ch2,tempreg1);
                    }
                }
                if(midcodes[w].type==11||midcodes[w].type==12||(midcodes[w].type==14&&(midcodes[w].kind==1||midcodes[w].kind==7))){
                    if(strcmp(midcodes[w].ch3,tempreg1)==0){
                        strcpy(midcodes[w].ch3,tempreg2);

                    }else if(strcmp(midcodes[w].ch3,tempreg2)==0){
                        strcpy(midcodes[w].ch3,tempreg1);
                    }
                }
            }
            for(w=i;w<midnum;w++){
                if(midcodes[w].lev!=nowlev) break;
                if(midcodes[w].ifprint==0) continue;

                if(midcodes[w].type==14&&midcodes[w].kind==2&&strcmp(midcodes[w].ch2,regn[mnum].name)==0){
                    if(w==keynum) continue;
                    fprintf(fout3,"find la %s %s\n",midcodes[w].ch1,regn[mnum].name);
                    midcodes[w].ifprint=0;
                    char changereg[namelength];
                    strcpy(changereg,midcodes[w].ch1);
                    int q;
                    for(q=i;q<midnum;q++){
                        if(midcodes[q].lev!=nowlev) break;
                        if(midcodes[q].ifprint==0) continue;
                        if(midcodes[q].type==5||(midcodes[q].type==8&&midcodes[q].kind==1)||(midcodes[q].type==10&&(midcodes[q].kind==1||midcodes[q].kind==3))||
                        midcodes[q].type==11||(midcodes[q].type==14&&(midcodes[q].kind==2||midcodes[q].kind==3||midcodes[q].kind==4||midcodes[q].kind==5||
                                                                    midcodes[q].kind==6||midcodes[q].kind==8))||
                        midcodes[q].type==15||midcodes[q].type==17){
                            if(strcmp(midcodes[q].ch1,changereg)==0){
                                strcpy(midcodes[q].ch1,tempreg1);
                            }
                        }
                        if(midcodes[q].type==5||midcodes[q].type==11||midcodes[q].type==12||midcodes[q].type==13||(midcodes[q].type==14&&(midcodes[q].kind==1||midcodes[q].kind==7))){
                            if(strcmp(midcodes[q].ch2,changereg)==0){
                                strcpy(midcodes[q].ch2,tempreg1);

                            }
                        }
                        if(midcodes[q].type==11||midcodes[q].type==12||(midcodes[q].type==14&&(midcodes[q].kind==1||midcodes[q].kind==7))){
                            if(strcmp(midcodes[q].ch3,changereg)==0){
                                strcpy(midcodes[q].ch3,tempreg1);

                            }
                        }
                    }
                  //  break;//!!!!!!!

                }
                if(midcodes[w].type==13&&midcodes[w].kind==1&&strcmp(midcodes[w].ch1,regn[mnum].name)==0){
                    midcodes[w].kind=4;
                    strcpy(midcodes[w].ch1,tempreg1);
                }
                if(midcodes[w].type==9&&midcodes[w].kind==1&&strcmp(midcodes[w].ch1,regn[mnum].name)==0){
                    midcodes[w].kind=5;
                    strcpy(midcodes[w].ch1,tempreg1);
                }
                if(midcodes[w].type==9&&midcodes[w].kind==2&&strcmp(midcodes[w].ch1,regn[mnum].name)==0){
                    midcodes[w].kind=6;
                    strcpy(midcodes[w].ch1,tempreg1);
                }
            }
           // break;//!!!!!



        }


        i=j-1;
    }

}

int strnum2;
void getopmid(){
    ecbl=1;

    int i;
    dataflag=0;
    mipsnum=0;
    strnum2=strnum;
    fout4=fopen("aftopmips.txt","w");
    for(i=0;i<midnum;i++){
     //   if(i==0) fprintf(fout3,"%d %s %s %s",midcodes[i].lev,midcodes[i].ch1,midcodes[i].ch2,midcodes[i].ch3);
        if(midcodes[i].ifprint!=0)fprintf(fout3,"%d:",midcodes[i].blockn);
        getmid(midcodes[i].type,midcodes[i].kind,midcodes[i].ch1,midcodes[i].ch2,midcodes[i].ch3,midcodes[i].ifprint,midcodes[i].lev);

    }

}
int index=-40;
int maxreg=15;

void getv2(int vnum,int mipssetreg,int i,int j){
    if(mipssetreg>maxreg){
        fprintf(fout4,"lw $s%d,%d($sp)\n",vnum,-4*(mipssetreg-maxreg));//!!!!!!!
        char temp[namelength];
        strcpy(temp,"s");
        char temp2[namelength];
        itoa(vnum,temp2,10);
        strcat(temp,temp2);
        switch(j){
            case 1:{
                strcpy(mipsset[i].ch1,temp);break;
            }
            case 2:{
                strcpy(mipsset[i].ch2,temp);break;
            }
            case 3:{
                strcpy(mipsset[i].ch3,temp);break;
            }
        }

    }else{
      //  fprintf(fout4,"move $s%d,$%d\n",vnum,mipssetreg);
        char temp[namelength];
        itoa(mipssetreg,temp,10);
        switch(j){
            case 1:{
                strcpy(mipsset[i].ch1,temp);break;
            }
            case 2:{
                strcpy(mipsset[i].ch2,temp);break;
            }
            case 3:{
                strcpy(mipsset[i].ch3,temp);break;
            }
        }
    }

}
void printmipsaft(){
    int i;
    int regmaxnum=0;
    printf("mipsnum=%d\n",mipsnum);
    for(i=strnum2;i<strnum;i++){
        fprintf(fout4,"%s\n",strsz[i]);
    }
    for(i=0;i<mipsnum;i++){
      // fprintf(fout4,"i=%d type=%d kind=%d\n",i,mipsset[i].type,mipsset[i].kind);
        if(i==0){
          //  fprintf(fout4,"subi sp,sp,%d\n",-1*index);//预留所有的堆空间
            fprintf(fout4,".text\n");
            fprintf(fout4,"j main\n");
        }
        if(mipsset[i].reg1>regmaxnum){
            regmaxnum=mipsset[i].reg1;
        }
        if(mipsset[i].reg2>regmaxnum){
            regmaxnum=mipsset[i].reg2;
        }
        if(mipsset[i].reg3>regmaxnum){
            regmaxnum=mipsset[i].reg3;
        }
        switch(mipsset[i].type){
            case 1:{
                fprintf(fout4,"%s:\n",mipsset[i].ch1);

             //   printf("name=%s",mipsset[i].ch1);
                if(strcmp("main",mipsset[i].ch1)==0){
                    fprintf(fout4,"move $s0,$sp\n");
                    fprintf(fout4,"move $s5,$sp\n");

                    fprintf(fout4,"move $s4,$sp\n");
                    fprintf(fout4,"subi $sp,$sp,%d\n",4-1*index);//用s0暂时替代堆开始的地方
                    fprintf(fout4,"subi $s5,$sp,%d\n",4*reg);
                    fprintf(fout4,"subi,$s5,$s5,24\n");

                }else {
                    fprintf(fout4,"sw $ra,4($sp)\n");
                  //  fprintf(fout4,"move $s6,$ra\n");//用s0暂时替代堆开始的地方
             // printf("bijiaochenggong");
                }

                break;
            }
            case 2:{
            //    fprintf(fout4,"subi $sp,$sp,4\n");
                break;
            }
            case 3:{
              //  fprintf(fout4,"subi $sp,$sp,4\n");
                break;
            }
            case 4:{
              //  fprintf(fout4,"subi $sp,$sp,%d\n",mipsset[i].sum*4);
                break;
            }
            case 5:{
                if(mipsset[i].kind==EQUSY){
                    getv2(1,mipsset[i].reg1,i,1);
                    getv2(2,mipsset[i].reg2,i,2);
                    fprintf(fout4,"bne $%s,$%s,%s\n",mipsset[i].ch1,mipsset[i].ch2,mipsset[i].ch3);
                }else if(mipsset[i].kind==NEQSY){
                    getv2(1,mipsset[i].reg1,i,1);
                    getv2(2,mipsset[i].reg2,i,2);
                    fprintf(fout4,"beq $%s,$%s,%s\n",mipsset[i].ch1,mipsset[i].ch2,mipsset[i].ch3);
                }else if(mipsset[i].kind==MORESY){//要考虑0号寄存器的赋值问题
                    getv2(1,mipsset[i].reg1,i,1);
                    getv2(2,mipsset[i].reg2,i,2);
                 //   fprintf(fout4,"sub $s1,$%s,$%s\n",mipsset[i].ch1,mipsset[i].ch2);
                    fprintf(fout4,"ble $%s,$%s,%s\n",mipsset[i].ch1,mipsset[i].ch2,mipsset[i].ch3);
                  //  if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                   // else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                   // fprintf(fout4,"blez $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);
                }else if(mipsset[i].kind==MOREQSY){
                    getv2(1,mipsset[i].reg1,i,1);
                    getv2(2,mipsset[i].reg2,i,2);
                  //  fprintf(fout4,"sub $s1,$%s,$%s\n",mipsset[i].ch1,mipsset[i].ch2);
                    fprintf(fout4,"blt $%s,$%s,%s\n",mipsset[i].ch1,mipsset[i].ch2,mipsset[i].ch3);
                   // if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                   // else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                    //fprintf(fout4,"bltz $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);

                }else if(mipsset[i].kind==LEQSY){
                    getv2(1,mipsset[i].reg1,i,1);
                    getv2(2,mipsset[i].reg2,i,2);
                  //  fprintf(fout4,"sub $s1,$%s,$%s\n",mipsset[i].ch1,mipsset[i].ch2);
                    fprintf(fout4,"bgt $%s,$%s,%s\n",mipsset[i].ch1,mipsset[i].ch2,mipsset[i].ch3);
                   // if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                   // else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                   // fprintf(fout4,"bgtz $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);
                }else if(mipsset[i].kind==LESSSY){
                    getv2(1,mipsset[i].reg1,i,1);
                    getv2(2,mipsset[i].reg2,i,2);
                  //  fprintf(fout4,"sub $s1,$%s,$%s\n",mipsset[i].ch1,mipsset[i].ch2);
                    fprintf(fout4,"bge $%s,$%s,%s\n",mipsset[i].ch1,mipsset[i].ch2,mipsset[i].ch3);
                   // if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                    //else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                    //fprintf(fout4,"bgez $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);

                }
                break;
            }
            case 6:{
                fprintf(fout4,"j %s\n",mipsset[i].ch1);

                break;
            }
            case 7:{
                fprintf(fout4,"Label%s:\n",mipsset[i].ch1);
                break;
            }
            case 8:{
                if(mipsset[i].kind==1){
                    //还原现场
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"lw $v0,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"move $v0,$%d\n",mipsset[i].reg1);

                }else{//还原现场
                }
                if(mipsset[i].kind==3){
                    fprintf(fout4,"j Labelend\n");
                }
                fprintf(fout4,"lw $ra,4($sp)\n");
              //  fprintf(fout4,"move $ra,$s6\n");
             //   fprintf(fout4,"addi $sp,$sp,%d\n",8-1*index);//改了！！！
             //   fprintf(fout4,"addi $sp,$sp,24\n");
                fprintf(fout4,"move $s5,$s0\n");
             //   fprintf(fout4,"addi $s5,$s5,4\n");
                fprintf(fout4,"addi $s5,$s5,%d\n",mipsset[i].reg2*4+4);
                fprintf(fout4,"lw $sp,4($s0)\n");
                fprintf(fout4,"addi $sp,$sp,24\n");
                fprintf(fout4,"lw $s7,0($sp)\n");
                fprintf(fout4,"lw $s0,-4($sp)\n");
                fprintf(fout4,"lw $s1,-8($sp)\n");
                fprintf(fout4,"lw $s2,-12($sp)\n");
                fprintf(fout4,"lw $s3,-16($sp)\n");
                fprintf(fout4,"lw $s4,-20($sp)\n");
                fprintf(fout4,"lw $a1,0($s0)\n");
                fprintf(fout4,"lw $a2,-4,($s0)\n");
                fprintf(fout4,"lw $a3,-8,($s0)\n");
                fprintf(fout4,"lw $t0,-12($s0)\n");
                fprintf(fout4,"lw $t1,-16($s0)\n");
                fprintf(fout4,"lw $t2,-20($s0)\n");
                fprintf(fout4,"lw $t3,-24($s0)\n");
                fprintf(fout4,"lw $t4,-28($s0)\n");
                fprintf(fout4,"lw $t5,-32($s0)\n");
                fprintf(fout4,"lw $t6,-36($s0)\n");
                fprintf(fout4,"lw $t7,-40($s0)\n");
                fprintf(fout4,"move $sp,$s7\n");
                fprintf(fout4,"jr $ra\n");
                break;
            }
            case 9:{
                if(mipsset[i].kind==1){//读入一个整数
                    fprintf(fout4,"li $v0,5\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"sw $v0,%d($s0)\n",mipsset[i].index);


                }else if(mipsset[i].kind==2){//读入一个字符
                    fprintf(fout4,"li $v0,12\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"sw $v0,%d($s0)\n",mipsset[i].index);

                }else if(mipsset[i].kind==3){//读入一个全局变量整数
                    fprintf(fout4,"li $v0,5\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"la $s1,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"sw $v0,0($s1)\n");

                }else if(mipsset[i].kind==4){//读入一个全局变量字符
                    fprintf(fout4,"li $v0,12\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"la $s1,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"sw $v0,0($s1)\n");
                }else if(mipsset[i].kind==5){
                    fprintf(fout4,"li $v0,5\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"move $%d $v0\n",mipsset[i].reg1);

                }else if(mipsset[i].kind==6){
                    fprintf(fout4,"li $v0,12\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"move $%d $v0\n",mipsset[i].reg1);
                }
                break;
            }
            case 10:{
                if(mipsset[i].kind==1){
                    getv2(1,mipsset[i].reg1,i,1);
                    fprintf(fout4,"li $v0,1\n");
                    fprintf(fout4,"move $a0,$%s\n",mipsset[i].ch1);
                   // fprintf(fout4,"move $a0,$%d\n",mipsset[i].reg1);
                    fprintf(fout4,"syscall\n");

                }else if(mipsset[i].kind==3){
                    fprintf(fout4,"li $v0,11\n");
                    getv2(1,mipsset[i].reg1,i,1);
                    fprintf(fout4,"move $a0,$%s\n",mipsset[i].ch1);
                    fprintf(fout4,"syscall\n");
                }else if(mipsset[i].kind==2){
                    fprintf(fout4,"li $v0,4\n");
                    fprintf(fout4,"la $a0,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"syscall\n");
                }
                break;
            }
            case 11:{
                if(mipsset[i].kind==PLUSSY){
                    getv2(1,mipsset[i].reg2,i,2);
                    getv2(2,mipsset[i].reg3,i,3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"add $s3,$%s,$%s\n",mipsset[i].ch2,mipsset[i].ch3);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"add $%d,$%s,$%s\n",mipsset[i].reg1,mipsset[i].ch2,mipsset[i].ch3);
                 //   fprintf(fout4,"add $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }else if(mipsset[i].kind==MINUSSY){
                    getv2(1,mipsset[i].reg2,i,2);
                    getv2(2,mipsset[i].reg3,i,3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"sub $s3,$%s,$%s\n",mipsset[i].ch2,mipsset[i].ch3);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"sub $%d,$%s,$%s\n",mipsset[i].reg1,mipsset[i].ch2,mipsset[i].ch3);
                 //   fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }else if(mipsset[i].kind==DIVISY){
                    getv2(1,mipsset[i].reg2,i,2);
                    getv2(2,mipsset[i].reg3,i,3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"div $s3,$%s,$%s\n",mipsset[i].ch2,mipsset[i].ch3);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"div $%d,$%s,$%s\n",mipsset[i].reg1,mipsset[i].ch2,mipsset[i].ch3);
                  //  fprintf(fout4,"div $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }else if(mipsset[i].kind==MULTSY){
                    getv2(1,mipsset[i].reg2,i,2);
                    getv2(2,mipsset[i].reg3,i,3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"mul $s3,$%s,$%s\n",mipsset[i].ch2,mipsset[i].ch3);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"mul $%d,$%s,$%s\n",mipsset[i].reg1,mipsset[i].ch2,mipsset[i].ch3);
                  //  fprintf(fout4,"mul $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }
                break;
            }
            case 12:{
                if(mipsset[i].kind==1){
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"mul $s1,$%s,4\n"/*,mipsset[i].reg2,mipsset[i].reg2*/,mipsset[i].ch2);
                    fprintf(fout4,"sub $s1,$0,$s1\n");
                    fprintf(fout4,"addi $s1,$s1,%d\n",mipsset[i].index);
                    fprintf(fout4,"add $s1,$s1,$s0\n");
                    getv2(2,mipsset[i].reg3,i,3);
                    fprintf(fout4,"sw $%s,0($s1)\n",mipsset[i].ch3);

                }else if(mipsset[i].kind==2){
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"mul $s1,$%s,4\n"/*,mipsset[i].reg2,mipsset[i].reg2*/,mipsset[i].ch2);
                    fprintf(fout4,"la $s2,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"add $s1,$s1,$s2\n");
                    getv2(2,mipsset[i].reg3,i,3);
                    fprintf(fout4,"sw $%s,0($s1)\n",mipsset[i].ch3);
                }
              //  fprintf(fout4,"subi $%d,$0,$%d\n",mipsset[i].reg2,mipsset[i].reg2);
              //  fprintf(fout4,"addi $%d,$%d,%d\n",mipsset[i].reg2,mipsset[i].reg2,mipsset[i].index);
              //  fprintf(fout4,"sw $%d,%d($s0)\n",mipsset[i].reg3,mipsset[i].reg2);
                break;
            }
            case 13:{

                if(mipsset[i].kind==1){
                   // fprintf(fout4,"reg2=%d\n",mipsset[i].reg2);
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"sw $%s,%d($s0)\n",mipsset[i].ch2,mipsset[i].index);
                }else if(mipsset[i].kind==2){
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"la $s2,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"sw $%s,0($s2)\n",mipsset[i].ch2);
                 //   fprintf(fout4,"sw $s1,%d($s5)\n",mipsset[i].index);
                }else if(mipsset[i].kind==3){//给参数赋值
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"sw $%s,%d($s0)\n",mipsset[i].ch2,4*(mipsset[i].reg3-mipsset[i].index+2));
                  //  fprintf(fout4,"subi $s5,$s5,4\n");

                }else if(mipsset[i].kind==4){
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"move $%d $%s\n",mipsset[i].reg1,mipsset[i].ch2);

                }
              //  fprintf(fout4,"sw $%d,%d($s0)\n",mipsset[i].reg2,mipsset[i].index);
                break;
            }
            case 14:{
                if(mipsset[i].kind==1){
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"mul $s1,$%s,4\n",mipsset[i].ch2);
                    fprintf(fout4,"sub $s1,$0,$s1\n");
                    fprintf(fout4,"addi $s1,$s1,%d\n",mipsset[i].index);
                    fprintf(fout4,"add $s1,$s1,$s0\n");
                    if(mipsset[i].reg3>maxreg){
                        fprintf(fout4,"lw $s3,0($s1)\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg3-maxreg));
                    }else{
                        fprintf(fout4,"lw $%d,0($s1)\n",mipsset[i].reg3);
                    }
                  //  fprintf(fout4,"mul $%d,$%d,4\n",mipsset[i].reg2,mipsset[i].reg2);
                  //  fprintf(fout4,"subi $%d,$0,$%d\n",mipsset[i].reg2,mipsset[i].reg2);
                   // fprintf(fout4,"addi $%d,$%d,%d\n",mipsset[i].reg2,mipsset[i].reg2,mipsset[i].index);
                  //  fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg3,mipsset[i].reg2);//如果reg3 的大小小于最大可用的寄存器
                   // fprintf(fout4,"move $t%d,$t%d\n",mipsset[i].reg3,mipsset[i].reg2);//如果reg3 的大小小于最大可用的寄存器
                    //fprintf(fout4,"sw $t%d,-%d($sp)\n",mipsset[i].reg2,mipsset[i].reg3);


                }else if(mipsset[i].kind==2){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"lw $s3,%d($s0)\n",mipsset[i].index);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg1,mipsset[i].index);
                  //  fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg1,mipsset[i].index)//如果reg1 的大小小于最大可用的寄存器)
                    //fprintf(fout4,"move $t%d,$t%d\n",)

                }else if(mipsset[i].kind==3){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"li $s3,%s\n",mipsset[i].ch2);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"li $%d,%s\n",mipsset[i].reg1,mipsset[i].ch2);
                  //  fprintf(fout4,"li $%d,%s\n",mipsset[mipsnum].reg1,mipsset[mipsnum].ch2);
                }else if(mipsset[i].kind==4){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"li $s3,%d\n",mipsset[i].ch2[0]);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"li $%d,%d\n",mipsset[i].reg1,mipsset[i].ch2[0]);
                   // fprintf(fout4,"li $%d,%s\n",mipsset[mipsnum].reg1,mipsset[mipsnum].ch2);
                }else if(mipsset[i].kind==5){//取参数
                    fprintf(fout4,"#mipsset[i].reg3=%d,mipsset[i].index=%d,sum=%d reg1=%d\n",mipsset[i].reg3,mipsset[i].index,4*(mipsset[i].reg3-mipsset[i].index+1),mipsset[i].reg1);
                    if(mipsset[i].reg1>maxreg){

                        fprintf(fout4,"lw $s3,%d($s0)\n",4*(mipsset[i].reg3-mipsset[i].index+2));
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                    }else fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg1,4*(mipsset[i].reg3-mipsset[i].index+2));
                }else if(mipsset[i].kind==6){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"la $s1,%s\n",mipsset[i].ch2);
                        fprintf(fout4,"lw $s3,0($s1)\n");
                     //   fprintf(fout4,"lw $s3,%d($s5)\n",mipsset[i].index);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                    }else {
                        fprintf(fout4,"la $s1,%s\n",mipsset[i].ch2);
                        fprintf(fout4,"lw $%d,0($s1)\n",mipsset[i].reg1);
                       // fprintf(fout4,"lw $%d,%d($s5)\n",mipsset[i].reg1,mipsset[i].index);
                    }
                }else if(mipsset[i].kind==7){//全局变量数组
                    getv2(1,mipsset[i].reg2,i,2);
                    fprintf(fout4,"mul $s1,$%s,4\n",mipsset[i].ch2);
                  //  fprintf(fout4,"sub $s1,$0,$s1\n");
                  //  fprintf(fout4,"addi $s1,$s1,%d\n",mipsset[i].index);
                    fprintf(fout4,"la $s2,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"add $s1,$s2,$s1\n");
                   // fprintf(fout4,"add $s1,$s1,$s5\n");
                    if(mipsset[i].reg3>maxreg){
                        fprintf(fout4,"lw $s3,0($s1)\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg3-maxreg));
                    }else{
                        fprintf(fout4,"lw $%d,0($s1)\n",mipsset[i].reg3);
                    }

                }else if(mipsset[i].kind==8){//获得全局常量
                    if(mipsset[i].index==INTSY){
                        if(mipsset[i].reg1>maxreg){
                            fprintf(fout4,"lw $s3,%s\n",mipsset[i].ch2);
                            fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                        }else fprintf(fout4,"lw $%d,%s\n",mipsset[i].reg1,mipsset[i].ch2);

                    }else if(mipsset[i].index==CHARSY){
                        if(mipsset[i].reg1>maxreg){
                            fprintf(fout4,"lw $s3,%s\n",mipsset[i].ch2);
                            fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                        }else fprintf(fout4,"lw $%d,%s\n",mipsset[i].reg1,mipsset[i].ch2);
                    }
                }
                break;
            }
            case 15:{
                if(mipsset[i].reg1>maxreg){
                    fprintf(fout4,"lw $s1,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                //    fprintf(fout4,"sw $s1,%d($s0)\n",mipsset[i].index);
                  //  getv(1,mipsset[i].reg2);
                    fprintf(fout4,"sw $s1,0($s5)\n");
                    fprintf(fout4,"subi $s5,$s5,4\n");
                }else{
                    fprintf(fout4,"sw $%d,0($s5)\n",mipsset[i].reg1);
                    fprintf(fout4,"subi $s5,$s5,4\n");
                }
                break;
            }
            case 16:{//保存现场

            //    fprintf(fout4,"sw $k0,0($sp)\n");
              //  fprintf(fout4,"subi $sp,$sp,4\n");
             //   fprintf(fout4,"sw $s0,0($sp)\n");//把之前的sp位置保存
                fprintf(fout4,"move $s7,$sp\n");
                int tempmax;
                if(regmaxnum>maxreg) tempmax=4*(regmaxnum-maxreg);
                else tempmax=0;
                tempmax=4*reg;
                fprintf(fout4,"subi $sp,$sp,%d\n",tempmax);
                fprintf(fout4,"sw $a1,0($s0)\n");
                fprintf(fout4,"sw $a2,-4,($s0)\n");
                fprintf(fout4,"sw $a3,-8,($s0)\n");
                fprintf(fout4,"sw $t0,-12($s0)\n");
                fprintf(fout4,"sw $t1,-16($s0)\n");
                fprintf(fout4,"sw $t2,-20($s0)\n");
                fprintf(fout4,"sw $t3,-24($s0)\n");
                fprintf(fout4,"sw $t4,-28($s0)\n");
                fprintf(fout4,"sw $t5,-32($s0)\n");
                fprintf(fout4,"sw $t6,-36($s0)\n");
                fprintf(fout4,"sw $t7,-40($s0)\n");
                fprintf(fout4,"sw $s7,0($sp)\n");//存储上一个sp
                fprintf(fout4,"sw $s0,-4($sp)\n");
                fprintf(fout4,"sw $s1,-8($sp)\n");
                fprintf(fout4,"sw $s2,-12($sp)\n");
                fprintf(fout4,"sw $s3,-16($sp)\n");
                fprintf(fout4,"sw $s4,-20($sp)\n");
                fprintf(fout4,"subi $sp,$sp,24\n");
                fprintf(fout4,"move $s4,$s0\n");
                fprintf(fout4,"move $s0,$s5\n");
                fprintf(fout4,"sw $sp,0($s0)\n");
                fprintf(fout4,"subi $s0,$s0,4\n");
                fprintf(fout4,"subi $sp,$s0,%d\n",8-1*index);//改成9
                fprintf(fout4,"subi $s5,$sp,%d\n",4*reg);
                fprintf(fout4,"subi,$s5,$s5,24\n");
               // fprintf(fout4,"move $s0,$sp\n");

                //fprintf(fout4,"");
               // fprintf(fout4,"");
               // fprintf(fout4,"");

                fprintf(fout4,"jal %s\n",mipsset[i].ch1);
                break;
            }
            case 17:{
                if(mipsset[i].reg1>maxreg){
                    fprintf(fout4,"sw $v0,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                }else fprintf(fout4,"move $%d,$v0\n",mipsset[i].reg1);
              //  fprintf(fout4,"move $%d,$v0\n",mipsset[mipsnum].reg1);//如果reg1 的大小小于最大可用的寄存器)
                //fprintf(fout4,"sw $v0,%d($sp)\n",-4*(mipsset[mipsnum].reg1-maxreg))
                ;
            }
        }


        if(i==mipsnum-1){
            fprintf(fout4,"Labelend:\n");
            fprintf(fout4,"li $v0,10\n");
            fprintf(fout4,"syscall\n");

        }
    }


}


/*--------------------------------------------------------生成mips------------------------------------------------------------------------*/


void getv(int vnum,int mipssetreg){
    if(mipssetreg>maxreg){
        fprintf(fout4,"lw $s%d,%d($sp)\n",vnum,-4*(mipssetreg-maxreg));//!!!!!!!
    }else{
        fprintf(fout4,"move $s%d,$%d\n",vnum,mipssetreg);
    }

}
void printmips(){
    int i;
    int regmaxnum=0;
    printf("mipsnum=%d\n",mipsnum);
    for(i=0;i<strnum;i++){
        fprintf(fout4,"%s\n",strsz[i]);
    }
    for(i=0;i<mipsnum;i++){
      // fprintf(fout4,"i=%d type=%d kind=%d\n",i,mipsset[i].type,mipsset[i].kind);
        if(i==0){
          //  fprintf(fout4,"subi sp,sp,%d\n",-1*index);//预留所有的堆空间
            fprintf(fout4,".text\n");
            fprintf(fout4,"j main\n");
        }
        if(mipsset[i].reg1>regmaxnum){
            regmaxnum=mipsset[i].reg1;
        }
        if(mipsset[i].reg2>regmaxnum){
            regmaxnum=mipsset[i].reg2;
        }
        if(mipsset[i].reg3>regmaxnum){
            regmaxnum=mipsset[i].reg3;
        }
        switch(mipsset[i].type){
            case 1:{
                fprintf(fout4,"%s:\n",mipsset[i].ch1);

             //   printf("name=%s",mipsset[i].ch1);
                if(strcmp("main",mipsset[i].ch1)==0){
                    fprintf(fout4,"move $s0,$sp\n");
                    fprintf(fout4,"move $s5,$sp\n");

                    fprintf(fout4,"move $s4,$sp\n");
                    fprintf(fout4,"subi $sp,$sp,%d\n",4-1*index);//用s0暂时替代堆开始的地方
                    fprintf(fout4,"subi $s5,$sp,%d\n",4*reg);
                    fprintf(fout4,"subi,$s5,$s5,24\n");

                }else {
                    fprintf(fout4,"sw $ra,4($sp)\n");
                  //  fprintf(fout4,"move $s6,$ra\n");//用s0暂时替代堆开始的地方
             // printf("bijiaochenggong");
                }

                break;
            }
            case 2:{
            //    fprintf(fout4,"subi $sp,$sp,4\n");
                break;
            }
            case 3:{
              //  fprintf(fout4,"subi $sp,$sp,4\n");
                break;
            }
            case 4:{
              //  fprintf(fout4,"subi $sp,$sp,%d\n",mipsset[i].sum*4);
                break;
            }
            case 5:{
                if(mipsset[i].kind==EQUSY){
                    getv(1,mipsset[i].reg1);
                    getv(2,mipsset[i].reg2);
                    fprintf(fout4,"bne $s1,$s2,%s\n",mipsset[i].ch3);
                }else if(mipsset[i].kind==NEQSY){
                    getv(1,mipsset[i].reg1);
                    getv(2,mipsset[i].reg2);
                    fprintf(fout4,"beq $s1,$s2,%s\n",mipsset[i].ch3);
                }else if(mipsset[i].kind==MORESY){//要考虑0号寄存器的赋值问题
                    getv(1,mipsset[i].reg1);
                    getv(2,mipsset[i].reg2);
                   // fprintf(fout4,"sub $s1,$s1,$s2\n");
                    fprintf(fout4,"ble $s1,$s2,%s\n",mipsset[i].ch3);
                  //  if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                   // else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                   // fprintf(fout4,"blez $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);
                }else if(mipsset[i].kind==MOREQSY){
                    getv(1,mipsset[i].reg1);
                    getv(2,mipsset[i].reg2);
                 //   fprintf(fout4,"sub $s1,$s1,$s2\n");
                    fprintf(fout4,"blt $s1,$s2,%s\n",mipsset[i].ch3);
                   // if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                   // else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                    //fprintf(fout4,"bltz $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);

                }else if(mipsset[i].kind==LEQSY){
                    getv(1,mipsset[i].reg1);
                    getv(2,mipsset[i].reg2);
                  //  fprintf(fout4,"sub $s1,$s1,$s2\n");
                    fprintf(fout4,"bgt $s1,$s2,%s\n",mipsset[i].ch3);
                   // if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                   // else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                   // fprintf(fout4,"bgtz $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);
                }else if(mipsset[i].kind==LESSSY){
                    getv(1,mipsset[i].reg1);
                    getv(2,mipsset[i].reg2);
                  //  fprintf(fout4,"sub $s1,$s1,$s2\n");
                    fprintf(fout4,"bge $s1,$s2,%s\n",mipsset[i].ch3);
                   // if(mipsset[i].reg1==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg2,mipsset[i].reg1,mipsset[i].reg2);
                    //else if(mipsset[i].reg2==0) fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg1,mipsset[i].reg2);
                    //fprintf(fout4,"bgez $%d,%s\n",mipsset[i].reg1,mipsset[i].ch3);

                }
                break;
            }
            case 6:{
                fprintf(fout4,"j %s\n",mipsset[i].ch1);

                break;
            }
            case 7:{
                fprintf(fout4,"Label%s:\n",mipsset[i].ch1);
                break;
            }
            case 8:{
                if(mipsset[i].kind==1){
                    //还原现场
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"lw $v0,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"move $v0,$%d\n",mipsset[i].reg1);

                }else{//还原现场
                }
                if(mipsset[i].kind==3){
                    fprintf(fout4,"j Labelend\n");
                }
                fprintf(fout4,"lw $ra,4($sp)\n");
              //  fprintf(fout4,"move $ra,$s6\n");
             //   fprintf(fout4,"addi $sp,$sp,%d\n",8-1*index);//改了！！！
             //   fprintf(fout4,"addi $sp,$sp,24\n");
                fprintf(fout4,"move $s5,$s0\n");
             //   fprintf(fout4,"addi $s5,$s5,4\n");
                fprintf(fout4,"addi $s5,$s5,%d\n",mipsset[i].reg2*4+4);
                fprintf(fout4,"lw $sp,4($s0)\n");
                fprintf(fout4,"addi $sp,$sp,24\n");
                fprintf(fout4,"lw $s7,0($sp)\n");
                fprintf(fout4,"lw $s0,-4($sp)\n");
                fprintf(fout4,"lw $s1,-8($sp)\n");
                fprintf(fout4,"lw $s2,-12($sp)\n");
                fprintf(fout4,"lw $s3,-16($sp)\n");
                fprintf(fout4,"lw $s4,-20($sp)\n");
                fprintf(fout4,"lw $a1,0($s0)\n");
                fprintf(fout4,"lw $a2,-4,($s0)\n");
                fprintf(fout4,"lw $a3,-8,($s0)\n");
                fprintf(fout4,"lw $t0,-12($s0)\n");
                fprintf(fout4,"lw $t1,-16($s0)\n");
                fprintf(fout4,"lw $t2,-20($s0)\n");
                fprintf(fout4,"lw $t3,-24($s0)\n");
                fprintf(fout4,"lw $t4,-28($s0)\n");
                fprintf(fout4,"lw $t5,-32($s0)\n");
                fprintf(fout4,"lw $t6,-36($s0)\n");
                fprintf(fout4,"lw $t7,-44($s0)\n");
                fprintf(fout4,"move $sp,$s7\n");
                fprintf(fout4,"jr $ra\n");
                break;
            }
            case 9:{
                if(mipsset[i].kind==1){//读入一个整数
                    fprintf(fout4,"li $v0,5\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"sw $v0,%d($s0)\n",mipsset[i].index);


                }else if(mipsset[i].kind==2){//读入一个字符
                    fprintf(fout4,"li $v0,12\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"sw $v0,%d($s0)\n",mipsset[i].index);

                }else if(mipsset[i].kind==3){//读入一个全局变量整数
                    fprintf(fout4,"li $v0,5\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"la $s1,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"sw $v0,0($s1)\n");

                }else if(mipsset[i].kind==4){//读入一个全局变量字符
                    fprintf(fout4,"li $v0,12\n");
                    fprintf(fout4,"syscall\n");
                    fprintf(fout4,"la $s1,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"sw $v0,0($s1)\n");
                }
                break;
            }
            case 10:{
                if(mipsset[i].kind==1){
                    getv(1,mipsset[i].reg1);
                    fprintf(fout4,"li $v0,1\n");
                    fprintf(fout4,"move $a0,$s1\n");
                   // fprintf(fout4,"move $a0,$%d\n",mipsset[i].reg1);
                    fprintf(fout4,"syscall\n");

                }else if(mipsset[i].kind==3){
                    fprintf(fout4,"li $v0,11\n");
                    getv(1,mipsset[i].reg1);
                    fprintf(fout4,"move $a0,$s1\n");
                    fprintf(fout4,"syscall\n");
                }else if(mipsset[i].kind==2){
                    fprintf(fout4,"li $v0,4\n");
                    fprintf(fout4,"la $a0,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"syscall\n");
                }
                break;
            }
            case 11:{
                if(mipsset[i].kind==PLUSSY){
                    getv(1,mipsset[i].reg2);
                    getv(2,mipsset[i].reg3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"add $s3,$s1,$s2\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"add $%d,$s1,$s2\n",mipsset[i].reg1);
                 //   fprintf(fout4,"add $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }else if(mipsset[i].kind==MINUSSY){
                    getv(1,mipsset[i].reg2);
                    getv(2,mipsset[i].reg3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"sub $s3,$s1,$s2\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"sub $%d,$s1,$s2\n",mipsset[i].reg1);
                 //   fprintf(fout4,"sub $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }else if(mipsset[i].kind==DIVISY){
                    getv(1,mipsset[i].reg2);
                    getv(2,mipsset[i].reg3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"div $s3,$s1,$s2\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"div $%d,$s1,$s2\n",mipsset[i].reg1);
                  //  fprintf(fout4,"div $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }else if(mipsset[i].kind==MULTSY){
                    getv(1,mipsset[i].reg2);
                    getv(2,mipsset[i].reg3);
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"mul $s3,$s1,$s2\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"mul $%d,$s1,$s2\n",mipsset[i].reg1);
                  //  fprintf(fout4,"mul $%d,$%d,$%d\n",mipsset[i].reg1,mipsset[i].reg2,mipsset[i].reg3);
                }
                break;
            }
            case 12:{
                if(mipsset[i].kind==1){
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"mul $s1,$s1,4\n"/*,mipsset[i].reg2,mipsset[i].reg2*/);
                    fprintf(fout4,"sub $s1,$0,$s1\n");
                    fprintf(fout4,"addi $s1,$s1,%d\n",mipsset[i].index);
                    fprintf(fout4,"add $s1,$s1,$s0\n");
                    getv(2,mipsset[i].reg3);
                    fprintf(fout4,"sw $s2,0($s1)\n");

                }else if(mipsset[i].kind==2){
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"mul $s1,$s1,4\n"/*,mipsset[i].reg2,mipsset[i].reg2*/);
                    fprintf(fout4,"la $s2,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"add $s1,$s1,$s2\n");
                    getv(2,mipsset[i].reg3);
                    fprintf(fout4,"sw $s2,0($s1)\n");
                }
              //  fprintf(fout4,"subi $%d,$0,$%d\n",mipsset[i].reg2,mipsset[i].reg2);
              //  fprintf(fout4,"addi $%d,$%d,%d\n",mipsset[i].reg2,mipsset[i].reg2,mipsset[i].index);
              //  fprintf(fout4,"sw $%d,%d($s0)\n",mipsset[i].reg3,mipsset[i].reg2);
                break;
            }
            case 13:{

                if(mipsset[i].kind==1){
                   // fprintf(fout4,"reg2=%d\n",mipsset[i].reg2);
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"sw $s1,%d($s0)\n",mipsset[i].index);
                }else if(mipsset[i].kind==2){
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"la $s2,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"sw $s1,0($s2)\n");
                 //   fprintf(fout4,"sw $s1,%d($s5)\n",mipsset[i].index);
                }else if(mipsset[i].kind==3){//给参数赋值
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"sw $s1,%d($s0)\n",4*(mipsset[i].reg3-mipsset[i].index+2));
                  //  fprintf(fout4,"subi $s5,$s5,4\n");

                }
              //  fprintf(fout4,"sw $%d,%d($s0)\n",mipsset[i].reg2,mipsset[i].index);
                break;
            }
            case 14:{
                if(mipsset[i].kind==1){
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"mul $s1,$s1,4\n");
                    fprintf(fout4,"sub $s1,$0,$s1\n");
                    fprintf(fout4,"addi $s1,$s1,%d\n",mipsset[i].index);
                    fprintf(fout4,"add $s1,$s1,$s0\n");
                    if(mipsset[i].reg3>maxreg){
                        fprintf(fout4,"lw $s3,0($s1)\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg3-maxreg));
                    }else{
                        fprintf(fout4,"lw $%d,0($s1)\n",mipsset[i].reg3);
                    }
                  //  fprintf(fout4,"mul $%d,$%d,4\n",mipsset[i].reg2,mipsset[i].reg2);
                  //  fprintf(fout4,"subi $%d,$0,$%d\n",mipsset[i].reg2,mipsset[i].reg2);
                   // fprintf(fout4,"addi $%d,$%d,%d\n",mipsset[i].reg2,mipsset[i].reg2,mipsset[i].index);
                  //  fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg3,mipsset[i].reg2);//如果reg3 的大小小于最大可用的寄存器
                   // fprintf(fout4,"move $t%d,$t%d\n",mipsset[i].reg3,mipsset[i].reg2);//如果reg3 的大小小于最大可用的寄存器
                    //fprintf(fout4,"sw $t%d,-%d($sp)\n",mipsset[i].reg2,mipsset[i].reg3);


                }else if(mipsset[i].kind==2){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"lw $s3,%d($s0)\n",mipsset[i].index);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg1,mipsset[i].index);
                  //  fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg1,mipsset[i].index)//如果reg1 的大小小于最大可用的寄存器)
                    //fprintf(fout4,"move $t%d,$t%d\n",)

                }else if(mipsset[i].kind==3){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"li $s3,%s\n",mipsset[i].ch2);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"li $%d,%s\n",mipsset[i].reg1,mipsset[i].ch2);
                  //  fprintf(fout4,"li $%d,%s\n",mipsset[mipsnum].reg1,mipsset[mipsnum].ch2);
                }else if(mipsset[i].kind==4){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"li $s3,%d\n",mipsset[i].ch2[0]);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                    }else fprintf(fout4,"li $%d,%d\n",mipsset[i].reg1,mipsset[i].ch2[0]);
                   // fprintf(fout4,"li $%d,%s\n",mipsset[mipsnum].reg1,mipsset[mipsnum].ch2);
                }else if(mipsset[i].kind==5){//取参数
                    fprintf(fout4,"#mipsset[i].reg3=%d,mipsset[i].index=%d,sum=%d\n",mipsset[i].reg3,mipsset[i].index,4*(mipsset[i].reg3-mipsset[i].index+1));
                    if(mipsset[i].reg1>maxreg){

                        fprintf(fout4,"lw $s3,%d($s0)\n",4*(mipsset[i].reg3-mipsset[i].index+2));
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                    }else fprintf(fout4,"lw $%d,%d($s0)\n",mipsset[i].reg1,4*(mipsset[i].reg3-mipsset[i].index+2));
                }else if(mipsset[i].kind==6){
                    if(mipsset[i].reg1>maxreg){
                        fprintf(fout4,"la $s1,%s\n",mipsset[i].ch2);
                        fprintf(fout4,"lw $s3,0($s1)\n");
                     //   fprintf(fout4,"lw $s3,%d($s5)\n",mipsset[i].index);
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                    }else {
                        fprintf(fout4,"la $s1,%s\n",mipsset[i].ch2);
                        fprintf(fout4,"lw $%d,0($s1)\n",mipsset[i].reg1);
                       // fprintf(fout4,"lw $%d,%d($s5)\n",mipsset[i].reg1,mipsset[i].index);
                    }
                }else if(mipsset[i].kind==7){//全局变量数组
                    getv(1,mipsset[i].reg2);
                    fprintf(fout4,"mul $s1,$s1,4\n");
                  //  fprintf(fout4,"sub $s1,$0,$s1\n");
                  //  fprintf(fout4,"addi $s1,$s1,%d\n",mipsset[i].index);
                    fprintf(fout4,"la $s2,%s\n",mipsset[i].ch1);
                    fprintf(fout4,"add $s1,$s2,$s1\n");
                   // fprintf(fout4,"add $s1,$s1,$s5\n");
                    if(mipsset[i].reg3>maxreg){
                        fprintf(fout4,"lw $s3,0($s1)\n");
                        fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg3-maxreg));
                    }else{
                        fprintf(fout4,"lw $%d,0($s1)\n",mipsset[i].reg3);
                    }

                }else if(mipsset[i].kind==8){//获得全局常量
                    if(mipsset[i].index==INTSY){
                        if(mipsset[i].reg1>maxreg){
                            fprintf(fout4,"lw $s3,%s\n",mipsset[i].ch2);
                            fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                        }else fprintf(fout4,"lw $%d,%s\n",mipsset[i].reg1,mipsset[i].ch2);

                    }else if(mipsset[i].index==CHARSY){
                        if(mipsset[i].reg1>maxreg){
                            fprintf(fout4,"lw $s3,%s\n",mipsset[i].ch2);
                            fprintf(fout4,"sw $s3,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));

                        }else fprintf(fout4,"lw $%d,%s\n",mipsset[i].reg1,mipsset[i].ch2);
                    }
                }
                break;
            }
            case 15:{
                if(mipsset[i].reg1>maxreg){
                    fprintf(fout4,"lw $s1,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                //    fprintf(fout4,"sw $s1,%d($s0)\n",mipsset[i].index);
                  //  getv(1,mipsset[i].reg2);
                    fprintf(fout4,"sw $s1,0($s5)\n");
                    fprintf(fout4,"subi $s5,$s5,4\n");
                }else{
                    fprintf(fout4,"sw $%d,0($s5)\n",mipsset[i].reg1);
                    fprintf(fout4,"subi $s5,$s5,4\n");
                }
                break;
            }
            case 16:{//保存现场

            //    fprintf(fout4,"sw $k0,0($sp)\n");
              //  fprintf(fout4,"subi $sp,$sp,4\n");
             //   fprintf(fout4,"sw $s0,0($sp)\n");//把之前的sp位置保存
                fprintf(fout4,"move $s7,$sp\n");
                int tempmax;
                if(regmaxnum>maxreg) tempmax=4*(regmaxnum-maxreg);
                else tempmax=0;
                tempmax=4*reg;
                fprintf(fout4,"subi $sp,$sp,%d\n",tempmax);
                fprintf(fout4,"sw $a1,0($s0)\n");
                fprintf(fout4,"sw $a2,-4,($s0)\n");
                fprintf(fout4,"sw $a3,-8,($s0)\n");
                fprintf(fout4,"sw $t0,-12($s0)\n");
                fprintf(fout4,"sw $t1,-16($s0)\n");
                fprintf(fout4,"sw $t2,-20($s0)\n");
                fprintf(fout4,"sw $t3,-24($s0)\n");
                fprintf(fout4,"sw $t4,-28($s0)\n");
                fprintf(fout4,"sw $t5,-32($s0)\n");
                fprintf(fout4,"sw $t6,-36($s0)\n");
                fprintf(fout4,"sw $t7,-40($s0)\n");
                fprintf(fout4,"sw $s7,0($sp)\n");//存储上一个sp
                fprintf(fout4,"sw $s0,-4($sp)\n");
                fprintf(fout4,"sw $s1,-8($sp)\n");
                fprintf(fout4,"sw $s2,-12($sp)\n");
                fprintf(fout4,"sw $s3,-16($sp)\n");
                fprintf(fout4,"sw $s4,-20($sp)\n");
                fprintf(fout4,"subi $sp,$sp,24\n");
                fprintf(fout4,"move $s4,$s0\n");
                fprintf(fout4,"move $s0,$s5\n");
                fprintf(fout4,"sw $sp,0($s0)\n");
                fprintf(fout4,"subi $s0,$s0,4\n");
                fprintf(fout4,"subi $sp,$s0,%d\n",8-1*index);//改成9
                fprintf(fout4,"subi $s5,$sp,%d\n",4*reg);
                fprintf(fout4,"subi,$s5,$s5,24\n");
               // fprintf(fout4,"move $s0,$sp\n");

                //fprintf(fout4,"");
               // fprintf(fout4,"");
               // fprintf(fout4,"");

                fprintf(fout4,"jal %s\n",mipsset[i].ch1);
                break;
            }
            case 17:{
                if(mipsset[i].reg1>maxreg){
                    fprintf(fout4,"sw $v0,%d($sp)\n",-4*(mipsset[i].reg1-maxreg));
                }else fprintf(fout4,"move $%d,$v0\n",mipsset[i].reg1);
              //  fprintf(fout4,"move $%d,$v0\n",mipsset[mipsnum].reg1);//如果reg1 的大小小于最大可用的寄存器)
                //fprintf(fout4,"sw $v0,%d($sp)\n",-4*(mipsset[mipsnum].reg1-maxreg))
                ;
            }
        }


        if(i==mipsnum-1){
            fprintf(fout4,"Labelend:\n");
            fprintf(fout4,"li $v0,10\n");
            fprintf(fout4,"syscall\n");

        }
    }


}






/*--------------------------------------------------------语法分析部分------------------------------------------------------------------------*/
typedef struct func{
    char name[namelength];
    int type;//0为有返回值的函数调用 1为无返回值的函数调用
}Func;
Func funct[fmax];
int fnum=0;
void insertfunct(Func tempfunc){
    funct[fnum]=tempfunc;
    fnum++;
}

int errs[100];
void skip(int n){
    int flag=0;
    while(1){
        if(symbol==end) {

                break;
        }

        int i;
        for(i=0;i<n;i++){
            if(symbol==errs[i]){
                flag=1;
                break;
            }
        }
        if(flag==1) break;
        getsym();
    }
}
int rety;
int returnflag=0;//0为没有return 1为int的return 2为char的return 3为void的return
int Expression(int lev,int cg);//出错return 0 不出错return 1
void Add();
void Multip();
void Relation();
void Character();
int Number();
void Parameterlist(struct Sym tempsym);
int Con(int lev,int cg);
void NCon(int lev,int cg,char templabel[]);//相反条件为了满足跳转
void Condition(int lev,int cg);
void Loop(int lev,int cg);
void Const();
void Sonsituation(int lev,char templabel3[],struct Sym tempsym,int cg,int ifci);
void Situationlist(int lev,struct Sym tempsym,int cg,int ifci);
void Situation(int lev,int cg);
void Assignment(int lev,struct Sym tempsym,int cg);
void Read(int lev,int cg);
void Write(int lev,int cg);
void Return(int lev,int cg);
void Statement(int lev,int cg);
int Term(int lev,int cg);
int Factor(int lev,int cg);
int Revafuncuse(int lev,struct Sym tempsym,int cg);
void Novafuncuse(int lev,struct Sym tempsym,int cg);
int Valueparameterlist(int lev,struct Sym tempsym,int cg);
struct Sym Variabledefinition(int lev,int cg);
void Procedure();
void Constantdefine(int lev,int cg);
void Main(struct Sym tempsym);
void Novafuncdefin(struct Sym tempsym);
void Revafuncdefin(struct Sym tempsym);
void Compound(int lev,int cg);
void Statementcolumn(int lev,int cg);
int templine=0;
void Add(){//加法运算符
    if(symbol==PLUSSY||symbol==MINUSSY){
        getsym();
    }else{
        error(1);
    }
  //  printf("This is a Add statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Add statement!\n");
}
void Multip(){//乘法运算符
    if(symbol==MULTSY||symbol==DIVISY){
        getsym();
    }else{
        error(2);
    }
   // printf("This is a Multiplication statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Multiplication statement!\n");
}
void Relation(){//关系运算符
    if(symbol==LESSSY||symbol==LEQSY||symbol==MORESY||symbol==MOREQSY||symbol==NEQSY||symbol==EQUSY){
        getsym();
    }else error(3);
  //  printf("This is a Relation statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Relation statement!\n");
}
void Character(){//字符

}
int Number(){//整数
    if(symbol==PLUSSY){
        getsym();
        if(symbol==intSY){
            if(NUM==0) error(67);
            getsym();
        }else error(10);
    }else if(symbol==MINUSSY){
        getsym();
        if(symbol==intSY){
            if(NUM==0) error(67);
            NUM=NUM*-1;
            getsym();
        }else error(10);
    }else if(symbol==intSY){
        getsym();
    }else {
        error(10);
        return 0;
    }
 //   printf("This is a Number!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Number!\n");
    return 1;
}
//int hsflag=0;//1为int 函数 2为char函数
int csgs=1;//参数个数
void Parameterlist(struct Sym tempsym){//参数表 ＜参数表＞    ::=  ＜类型标识符＞＜标识符＞{,＜类型标识符＞＜标识符＞}| ＜空＞
 //   fprintf(fout3,"woshihanshu~~~%slt%d\n",tempsym.name,tempsym.funlev);
    struct Sym temps2;
    if(symbol==INTSY||symbol==CHARSY){
      //  int zf;
      //  if(symbol==INTSY) zf=1;
      //  else zf=2;
    //    printf(" %s",token);
        temps2.type=symbol;
        temps2.kind=3;
        temps2.lev=tempsym.funlev;
        temps2.arr=0;
        temps2.funlev=0;
        temps2.value=0;
        temps2.paranum=0;
        temps2.fun=0;
        getsym();
        if(symbol==IDSY){
           // printf(" %s",token);
            strcpy(temps2.name,token);
            if(strcmp(temps2.name,tempsym.name)!=0) {//函数的参数和函数名不相等
            //    printf(" chenggong %d",tempsym.cgflag);
                if(tempsym.cgflag>0){
                    temps2.index=csgs;
              //      printf("lev=%d",temps2.lev);
                    temps2.cgflag=insertsym(temps2,0,temps2.lev);
                //    printf(" flag=%d",temps2.cgflag);
                    if(temps2.cgflag>0){
                  //      printf("temps2cheng!!!");
                   //     index=index-4;
                        csgs++;
                        int i;

                        for(i=0;i<alist[0].listpos;i++){
                            if(strcmp(alist[0].slist[i].name,tempsym.name)==0){
                                alist[0].slist[i].paranum++;
                                break;
                            }
                        }
                        int kind;
                        if(temps2.type==INTSY) kind=1;
                        else kind=2;
                      //  printf("!!!!!!!!!!!!!!!!!!!!%s!!!!!\n",temps2.name);
                        getmid(3,kind,temps2.name,tempsym.name,NULL,tempsym.cgflag,temps2.lev);

                    }else error(85);
                }

            }else{
                error(61);
            }
            getsym();
            if(symbol==COMMASY){
                getsym();
                Parameterlist(tempsym);

            }
        }else {
            error(19);
            errs[0]=RPARSY;
            skip(1);
            return;
        }
    }
  //  printf("This is a Parameterlist statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Parameterlist statement!\n");
}
int Con(int lev,int cg){//条件
    cg=Expression(lev,cg)&&cg;
    char tempname[namelength];
    strcpy(tempname,fact1);
    char templabel[namelength];
    char templabel2[namelength];
    strcpy(templabel,"Label");
    itoa(label++,templabel2,10);
    strcat(templabel,templabel2);
    if(symbol==LESSSY||symbol==LEQSY||symbol==MOREQSY||symbol==MORESY||symbol==NEQSY||symbol==EQUSY){
        int op=symbol;
        Relation();
     //   printf("chulaile nextsymbol=%d\n",symbol);
        cg=Expression(lev,cg)&&cg;

        getmid(5,op,tempname,fact1,templabel,cg,lev);
    }else getmid(5,NEQSY,tempname,"0",templabel,cg,lev);
  //  reg--;//********************************

 //   printf("This is a Condition!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Condition!\n");
    return cg;
}
void Condition(int lev,int cg){//条件语句
    if(symbol==LPARSY){
        getsym();
        cg=cg&&Con(lev,cg);
        if(symbol==RPARSY){
            getsym();
          //  fprintf(fout3,)
            char templabel[namelength];
            itoa(label-1,templabel,10);
            Statement(lev,cg);
            getmid(7,1,templabel,NULL,NULL,cg,lev);
           // fprintf(fout3,"Label%d:",label-1);
        }else {//还有各种语句的开头 if里面不能跳到分号！！！
            error(27);
         //   errs[0]=SEMISY;
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            if(symbol==SEMISY) getsym();
            return;
        }
    }else {//还有各种语句的开头 if里面不能跳到分号！！！
        error(26);
     //   errs[0]=SEMISY;
        errs[0]=IFSY;
        errs[1]=DOSY;
        errs[2]=SWITCHSY;
        errs[3]=LBRACSY;
        errs[4]=IDSY;
        errs[5]=SCANFSY;
        errs[6]=PRINTFSY;
        errs[7]=SEMISY;
        errs[8]=RETURNSY;
        skip(9);
        if(symbol==SEMISY) getsym();
        return;
    }
 //   printf("This is a Condition statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Condition statement!\n");
}
void NCon(int lev,int cg,char templabel[]){//条件
    cg=Expression(lev,cg)&&cg;
    char tempname[namelength];
    strcpy(tempname,fact1);
  //  char templabel[namelength];
   // char templabel2[namelength];
    //strcpy(templabel,"Label");
    //itoa(label++,templabel2,10);
   // strcat(templabel,templabel2);
    if(symbol==LESSSY||symbol==LEQSY||symbol==MOREQSY||symbol==MORESY||symbol==NEQSY||symbol==EQUSY){
        int op;
        if(symbol==LESSSY) op=MOREQSY;
        else if(symbol==LEQSY) op=MORESY;
        else if(symbol==MOREQSY) op=LESSSY;
        else if(symbol==MORESY) op=LEQSY;
        else if(symbol==EQUSY) op=NEQSY;
        else if(symbol==NEQSY) op=EQUSY;
        Relation();
     //   printf("chulaile nextsymbol=%d\n",symbol);
        cg=Expression(lev,cg)&&cg;

        getmid(5,op,tempname,fact1,templabel,cg,lev);
    }else getmid(5,EQUSY,tempname,"0",templabel,cg,lev);
   // reg--;//********************

 //   printf("This is a Condition!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Condition!\n");
}
void Loop(int lev,int cg){//循环语句
   // fprintf(fout3,"Label%d:",label);
    char templabel[namelength];
    itoa(label++,templabel,10);
    getmid(7,1,templabel,NULL,NULL,cg,lev);
  //  char templabel[namelength];
    char templabel2[namelength];
    strcpy(templabel,"Label");
    itoa(label-1,templabel2,10);
    strcat(templabel,templabel2);
    Statement(lev,cg);
    if(symbol==WHILESY){
        getsym();
        if(symbol==LPARSY){
            getsym();
            NCon(lev,cg,templabel);
            if(symbol==RPARSY){//如果缺少后括号 说明已经读到了下一个语句的开始 之前ncon出错的话 也会跳到下一个语句的开始
                getsym();
            }else {

                error(30);
                return;
            }

        }else {
            error(29);
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            if(symbol==SEMISY) getsym();
            return;
          //  errs[0]=RPARSY;
           // skip(1);
          //  getsym();
            return;
        }
    }else error(28);
 //   printf("This is a Loop statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Loop statement!\n");
}
void Const(){//常量
    if(symbol==QUOSY){
        getsym();
    }else{
        Number();
    }
  //  printf("This is a Const statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Const statement!\n");
}
int caseexm[casenum];
int casegs;//表示caseexm的位置
int casesetflag=1;
void Sonsituation(int lev,char templabel3[],struct Sym tempsym,int cg,int ifci){//情况子语句
   // Const();
    char tempname[namelength];
    if(symbol==QUOSY){
        if(ifci!=CHARSY){
            //    printf("yinggaishiint\n");
            error(94);
        }else{
            if(casegs>=casenum){
                if(casesetflag==1){
                    printf("casenum set too small!\n");
                    casesetflag=0;
                }
            }else{
                int ti;
                int sameflag=1;
                for(ti=0;ti<casegs;ti++){
                    if(caseexm[ti]==token[0]){
                        sameflag=0;
                        break;
                    }
                }
                if(sameflag==0){
                    error(95);
                }else{
                    caseexm[casegs++]=token[0];
                }
            }
        }
        char tempname2[namelength];
        strcpy(tempname,"t");
        itoa(reg++,tempname2,10);
        strcat(tempname,tempname2);
        getmid(14,4,tempname,token,NULL,cg,lev);
     //   strcpy(tempname,token);
        getsym();
    }else{
        cg=Number()&&cg;
        if(ifci!=INTSY){
            error(94);
        }else{
            if(casegs>=casenum){
                if(casesetflag==1){
                    printf("casenum set too small!\n");
                    casesetflag=0;
                }
            }else{
                int ti;
                int sameflag=1;
                for(ti=0;ti<casegs;ti++){
                    if(caseexm[ti]==NUM){
                       // printf("ti=%d,CASEEXM[ti]=%d,NUM=%d\n",ti,caseexm[ti],NUM,)
                        sameflag=0;
                        break;
                    }
                }
                if(sameflag==0){

                    error(95);
                }else{
                    caseexm[casegs++]=NUM;
                }
            }
        }
        char tempname2[namelength];
        strcpy(tempname,"t");
        itoa(reg++,tempname2,10);
       // itoa(NUM,tempname2,10);
        strcat(tempname,tempname2);
        itoa(NUM,tempname2,10);
        getmid(14,3,tempname,tempname2,NULL,cg,lev);
      //  itoa(NUM,tempname,10);
    }
    if(symbol==COLONSY){
        char templabel[namelength];
        strcpy(templabel,"Label");
        char templabel2[namelength];
        itoa(label++,templabel2,10);
        strcat(templabel,templabel2);
        getmid(5,EQUSY,tempsym.name,tempname,templabel,cg,lev);
      //  reg--;//***************************
        strcpy(templabel,"");
        itoa(label-1,templabel,10);
        getsym();
        Statement(lev,cg);
      //  strcpy(templabel,"Label");
       // itoa(label2,templabel2,10);
       // strcat(templabel,templabel2);
        getmid(6,1,templabel3,NULL,NULL,cg,lev);


 //       strcpy(templabel,"");
   //     itoa(label-1,templabel,10);
        getmid(7,1,templabel,NULL,NULL,cg,lev);
      //  fprintf(fout3,"Label%d:",label-1);
    }else{
        error(63);
        errs[0]=SEMISY;
        errs[1]=CASESY;
        skip(2);
        if(symbol==SEMISY) getsym();
        return;

    }
  //  printf("This is a Son_situation statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Son_situation statement!\n");
}
void Situationlist(int lev,struct Sym tempsym,int cg,int ifci){//情况表
    char templabel[namelength];
    itoa(label2--,templabel,10);
    char templabel2[namelength];
    strcpy(templabel2,"Label");
    strcat(templabel2,templabel);
    casegs=0;
    while(symbol==CASESY){
        getsym();
        Sonsituation(lev,templabel2,tempsym,cg,ifci);
    }
  //  char templabel[namelength];
  //  itoa(label2--,templabel,10);
    getmid(7,1,templabel,NULL,NULL,cg,lev);
//fprintf(fout3,"Label%d:",label2--);
 //   printf("This is a Situation_list statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Situation_list statement!\n");
}
void Situation(int lev,int cg){//情况语句 switch
    struct Sym tempsym;
    if(symbol==LPARSY){
        getsym();
        cg=Expression(lev,cg)&&cg;
        strcpy(tempsym.name,fact1);
        int ifci=ifcori;
     //   fprintf(fout3,"symbol=%d ",symbol);
        if(symbol==RPARSY){
            getsym();
            if(symbol==LBRACSY){
                getsym();
                Situationlist(lev,tempsym,cg,ifci);
                if(symbol==RBRACSY){
                    getsym();
                }else error(23);
            }else {
                error(31);
             //   errs[0]=RBRACSY;
                errs[0]=IFSY;
                errs[1]=DOSY;
                errs[2]=SWITCHSY;
                errs[3]=LBRACSY;
                errs[4]=IDSY;
                errs[5]=SCANFSY;
                errs[6]=PRINTFSY;
                errs[7]=SEMISY;
                errs[8]=RETURNSY;
                skip(9);
                getsym();
                return;
            }
        }else {
            error(25);
          //  errs[0]=RBRACSY;//此时如果都到了if的后大括号 则会有一些问题
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            getsym();
            return;
        }
    }else {
        error(24);
     //   errs[0]=RBRACSY;
        errs[0]=IFSY;
        errs[1]=DOSY;
        errs[2]=SWITCHSY;
        errs[3]=LBRACSY;
        errs[4]=IDSY;
        errs[5]=SCANFSY;
        errs[6]=PRINTFSY;
        errs[7]=SEMISY;
        errs[8]=RETURNSY;
        skip(9);
        getsym();
        return;
    }
  //  printf("This is a Situation statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Situation statement!\n");
}
void Assignment(int lev,struct Sym tempsym,int cg){//赋值语句
    //cg如果为1 说明存在该tempsym
    if(symbol==ASSIGNSY){
        getsym();
        cg=Expression(lev,cg)&&cg;
       // getmid(13,1,tempsym.name,fact1,NULL,cg);
        if(cg==1){
            tempsym=getvalue(tempsym.name,lev);
            if(tempsym.kind==1){//如果是常量
                error(86);
                cg=0;
            }else if(tempsym.fun==1){
                error(87);
                cg=0;
            }else if(tempsym.arr==1){
                error(82);
                cg=0;
            }else if(tempsym.type==CHARSY){//char肯定是可以转换成int的 这里主要是判断此时是不是合法的int可以转换成char
                    if(intfact1=='+'||intfact1=='-'||intfact1=='*'||intfact1=='/'||(intfact1>='a'&&intfact1<='z')||(intfact1>='A'&&intfact1<='Z')||intfact1=='_'||(intfact1>=0&&intfact1<=9)){
                        if(ifcori==INTSY) error(83);
                    }else{
                    //    fprintf(fout3,"%s shibaicharu ",tempsym.name);
                        if(ifcori==INTSY) error(83);//可能是一些未知的量
                     //   cg=0;
                    }
            }
            if(cg==1){
                if(ifxory==1) insertvalue(tempsym,0,intfact1,tempsym.lev,0);
               // fprintf(fout3,"%s chenggongcharu %d ",tempsym.name,intfact1);
            }
        }
        getmid(13,1,tempsym.name,fact1,NULL,cg,lev);
      //  reg--;//*************************
    }else if(symbol==LBRASY){
        getsym();
     //   printf("shishuzu!");
        cg=Expression(lev,cg)&&cg;
        char tempnum[namelength];
        strcpy(tempnum,fact1);
        int intfact2=intfact1;
        int ifxory2=ifxory;
        if(symbol==RBRASY){
            getsym();
            if(symbol==ASSIGNSY){
                getsym();
                cg=Expression(lev,cg)&&cg;
                //getmid(12,1,tempsym.name,tempnum,fact1,cg);
                if(cg==1){//判断数组是否越界和是否存在
                    tempsym=getvalue(tempsym.name,lev);
                    if(tempsym.kind==1){
                        error(86);
                        cg=0;
                    }else if(tempsym.arr==1){
                        if(tempsym.sum>intfact2||ifxory2==0){
                         //   printf("intfact2=%d tempsym.sum=%d\n",intfact2,tempsym.sum);
                            if(intfact2<0&&ifxory2==1){
                                error(84);
                                cg=0;
                            }
                            if(tempsym.type==CHARSY){
                                if(intfact1=='+'||intfact1=='-'||intfact1=='*'||intfact1=='/'||(intfact1>='a'&&intfact1<='z')||(intfact1>='A'&&intfact1<='Z')||intfact1=='_'||(intfact1>=0&&intfact1<=9)){
                                    if(ifcori==INTSY) error(83);
                                }else{
                                   if(ifcori==INTSY) error(83);
                                   // cg=0;
                                }
                            }
                            if(cg==1){
                              //  fprintf(fout3,"sz开始插入%d=%d",intfact2,intfact1);
                                if(ifxory2==1&&ifxory==1) insertvalue(tempsym,intfact2,intfact1,tempsym.lev,1);
                            }
                        }else {
                            error(84);
                            cg=0;
                        }
                    }else{
                        error(88);
                        cg=0;
                    }
                }
              //  cg=Expression(lev,cg)&&cg;
                getmid(12,1,tempsym.name,tempnum,fact1,cg,lev);
             //   reg--;//*************************
             //   reg--;
            }else {//要加上各种语句的开头
                error(32);
                errs[0]=IFSY;
                errs[1]=DOSY;
                errs[2]=SWITCHSY;
                errs[3]=LBRACSY;
                errs[4]=IDSY;
                errs[5]=SCANFSY;
                errs[6]=PRINTFSY;
                errs[7]=SEMISY;
                errs[8]=RETURNSY;
                skip(9);
                return;
            }
        }else {//要加上各种语句的开头
            error(33);
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            return;
        }

    }else {//要加上各种语句的开头
        error(32);
        errs[0]=IFSY;
        errs[1]=DOSY;
        errs[2]=SWITCHSY;
        errs[3]=LBRACSY;
        errs[4]=IDSY;
        errs[5]=SCANFSY;
        errs[6]=PRINTFSY;
        errs[7]=SEMISY;
        errs[8]=RETURNSY;
        skip(9);
        return;
    }
  //  printf("!!!!!!!!!!!!!%s\n",tempsym.name);
 //   printf("This is a Assignment statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Assignment statement!\n");
}
void Read(int lev,int cg){//读语句
   // printf("666");
    if(symbol==LPARSY){
        getsym();
        if(symbol==IDSY){
            cg=findsym(token,lev)&&cg;
            if(cg==1){
                struct Sym tempsym;
                tempsym=getvalue(token,lev);
                if(tempsym.kind==1){
                    error(86);
                    cg=0;
                }else if(tempsym.arr==1){
                    error(82);
                    cg=0;
                }else if(tempsym.fun==1){
                    error(87);
                    cg=0;
                }
            }
            getmid(9,1,token,NULL,NULL,cg,lev);
            getsym();
            if(symbol==COMMASY){
             //   printf("hhhhhhhhhhhhhh");
                while(symbol==COMMASY){
                    getsym();
                    if(symbol==IDSY){
                        cg=findsym(token,lev)&&cg;
                        getmid(9,1,token,NULL,NULL,cg,lev);
                        getsym();
                //        printf("hhhhhhh %s",token);
                    }else {
                        error(35);
                        errs[0]=SEMISY;
                        skip(1);
                        return;
                    }
                }
            }
            if(symbol==RPARSY){
                getsym();
            }else {
                error(36);
                errs[0]=SEMISY;
                skip(1);
            //    printf("6666666666 %d",symbol);
                return;
            }
        }else {
            error(35);
            errs[0]=SEMISY;
            skip(1);

            return;
        }
    }else {
        error(34);
        errs[0]=SEMISY;
        skip(1);
        return;
    }
 //   printf("This is a Read statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Read statement!\n");
}
void Write(int lev,int cg){//写语句
    if(symbol==LPARSY){
        getsym();
        if(symbol==43){
            char name[namelength];
            strcpy(name,token);
            name[num]='\0';
            getsym();
            if(symbol==COMMASY){
                getmid(10,2,name,NULL,NULL,cg,lev);
                fprintf(fout3,"shuchu!!");
                getsym();
            //    fprintf(fout3,"cg=%d ",cg);
                cg=Expression(lev,cg)&&cg;
              //  fprintf(fout3,"cg=%d ",cg);
               // fprintf(fout3,"   %s !!!!!!!",name);
             //   getmid(10,2,name,NULL,NULL,cg,lev);
                if(ifcori==INTSY) {
                        getmid(10,1,fact1,NULL,NULL,cg,lev);
                }else if(ifcori==CHARSY) getmid(10,3,fact1,NULL,NULL,cg,lev);
                //reg--;//***********************
             //   printf("------------------%s--------------------\n",fact1);
            }else{
              //  fprintf(fout3,"   %s !!!!!!!",name);
                getmid(10,2,name,NULL,NULL,cg,lev);
            }
        }else{
          //  fprintf(fout3,"2nextsymol=%d token=%s\n",symbol,token);
            cg=Expression(lev,cg)&&cg;
            if(ifcori==INTSY) getmid(10,1,fact1,NULL,NULL,cg,lev);
            else if(ifcori==CHARSY) getmid(10,3,fact1,NULL,NULL,cg,lev);
           // reg--;//***************
         //   fprintf(fout3,"nextsymol=%d token=%s\n",symbol,token);
        }
        if(symbol==RPARSY){
            getsym();
        }else {//加上各种语句的开头！！
            error(38);
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            return;
        }
    }else {
        error(37);
        errs[0]=IFSY;
        errs[1]=DOSY;
        errs[2]=SWITCHSY;
        errs[3]=LBRACSY;
        errs[4]=IDSY;
        errs[5]=SCANFSY;
        errs[6]=PRINTFSY;
        errs[7]=SEMISY;
        errs[8]=RETURNSY;
        skip(9);
        return;
    }
  //  printf("This is a Write statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Write statement!\n");
}
int hscs;//该函数得参数个数
void Return(int lev,int cg){//返回语句
  //  printf("jinlaile");
    char temppara[namelength];
    itoa(hscs,temppara,10);
    if(symbol==LPARSY){
        getsym();
        cg=Expression(lev,cg)&&cg;

       // printf("chulaile");
        if(symbol==RPARSY){
           // fprintf(fout3,"return!!!!");
            if(ifcori==INTSY) returnflag=1;
            else if(ifcori==CHARSY) returnflag=2;
        //    fprintf(fout3,"rety=%dreturn!!!!returnflag=%d ifcori=%d",rety,returnflag,ifcori);

            if(rety==returnflag) getmid(8,1,fact1,temppara,NULL,cg,lev);
            else{
                error(90);
           //     fprintf(fout3,"rety=%dreturn!!!!returnflag=%d ifcori=%d",rety,returnflag,ifcori);
                if(rety==1){
             //       fprintf(fout3,"hhh3");
                    getmid(8,1,"0",temppara,NULL,cg,lev);
                }else if(rety==2){
               //     fprintf(fout3,"hhh4");
                    getmid(8,1,"0",temppara,NULL,cg,lev);
                }else if(rety==3){
                 //   fprintf(fout3,"hhh5");
                    getmid(8,2,NULL,temppara,NULL,cg,lev);

                }else if(rety==4){
                    getmid(8,3,NULL,temppara,NULL,cg,lev);
                }

            }
          //  reg--;
            getsym();
        }else {//要加上各种语句的开头
            error(39);
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            return;
        }
    }else {
        returnflag=3;
        if(returnflag==rety) getmid(8,2,NULL,temppara,NULL,cg,lev);
        else{
            if(rety==4){
                getmid(8,3,NULL,temppara,NULL,cg,lev);
            }else{
                error(90);
                getmid(8,2,NULL,temppara,NULL,cg,lev);
            }
        }

        if(symbol!=SEMISY){
            error(64);
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            return;
        }
      //  getsym();
       // printf("%d  %s",symbol,token);
    }
  //  printf("This is a Return statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Return statement!\n");
}
void Statement(int lev,int cg){//语句
    if(symbol==IFSY){
        getsym();
        Condition(lev,cg);
    }else if(symbol==DOSY){
     //   printf("%s!!!!!!",token);
        getsym();
        Loop(lev,cg);
    }else if(symbol==SWITCHSY){
        getsym();
        Situation(lev,cg);
    }else if(symbol==LBRACSY){
        getsym();
        Statementcolumn(lev,cg);
        if(symbol==RBRACSY){
            getsym();
        }else {//这种情况只可能读完了
          /*  error(20);
            errs[0]=RBRACSY;
            skip(1);
            return;*/
        }
    }else if(symbol==IDSY){
       // fprintf(fout3,"nextsymbol3=%s\n",token);
        struct Sym tempsym;
        strcpy(tempsym.name,token);
     //   fprintf(fout3,"nextsymbol4=%s\n",tempsym.name);
        getsym();
        if(symbol==LPARSY){
            getsym();
            int type;
            type=typeoffunc(tempsym.name);
          //  printf("66666666666%s   type=%d\n",temp.name,type);
            if(type==CHARSY||type==INTSY) {
               //     printf("!!!!!!!!!!!youfanhuizhidehanshu!!!!!%s\n",tempsym.name);
                    Revafuncuse(lev,tempsym,cg);
            }
            else if(type==VOIDSY) Novafuncuse(lev,tempsym,cg);
            else {
              //  printf("name=%s\n",tempsym.name);
                error(62);//或者各种语句的开头！！
                errs[0]=SEMISY;
                skip(1);
                getsym();
                return;//!!!!!!!!!!!!!!!!!!!!!!!!!!!
            }
           if(symbol==SEMISY){
                getsym();

           }else {
               error(21);
           }
        }else if(symbol==ASSIGNSY||symbol==LBRASY){
            int cg1=cg;
            cg=findsym(tempsym.name,lev)&&cg;
          //  fprintf(fout3,"666666666\tcg=%d\tname=%s\n",cg,tempsym.name);
            if(cg==1) {
                    tempsym=getvalue(tempsym.name,lev);
                    if(tempsym.kind==1) {
                        error(86);
                        cg=0;
                    }else if(tempsym.fun==1){
                        error(87);
                        cg=0;
                    }
            }else{
                if(cg1==1) error(85);
            }
            Assignment(lev,tempsym,cg);
            if(symbol==SEMISY){
                getsym();
           }else {
               error(22);

           }
        }else {//或者各种语句的开头
            error(18);
            errs[0]=IFSY;
            errs[1]=DOSY;
            errs[2]=SWITCHSY;
            errs[3]=LBRACSY;
            errs[4]=IDSY;
            errs[5]=SCANFSY;
            errs[6]=PRINTFSY;
            errs[7]=SEMISY;
            errs[8]=RETURNSY;
            skip(9);
            return;
        }
    }else if(symbol==SCANFSY){
        getsym();
        Read(lev,cg);
        if(symbol==SEMISY){
            getsym();
        }else error(17);
    }else if(symbol==PRINTFSY){
        getsym();
        Write(lev,cg);
        if(symbol==SEMISY){
            getsym();
        }else error(16);
    }else if(symbol==SEMISY){
        getsym();
    }else if(symbol==RETURNSY){
        getsym();
        Return(lev,cg);
        if(symbol==SEMISY){
            getsym();
        }else error(15);
    }else {
        error(14);
        errs[0]=IFSY;
        errs[1]=DOSY;
        errs[2]=SWITCHSY;
        errs[3]=LBRACSY;
        errs[4]=IDSY;
        errs[5]=SCANFSY;
        errs[6]=PRINTFSY;
        errs[7]=SEMISY;
        errs[8]=RETURNSY;
        skip(9);
        return;
    }
  //  printf("This is a Statement statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Statement statement!\n");
}
void Statementcolumn(int lev,int cg){//语句列 和语句有递归关系
    while(symbol!=RBRACSY&symbol!=end){
       // fprintf(fout3,"nextsymbol2=%s\n",token);
        Statement(lev,cg);

    }
//    printf("This is a Statement_column statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Statement_column statement!\n");
}
int hsflag=0;//1为int 函数 2为char函数
void Compound(int lev,int cg){//＜复合语句＞   ::=  ［＜常量说明＞］［＜变量说明＞］＜语句列＞
    while(symbol==CONSTSY){
        getsym();
        Constantdefine(lev,cg);
        if(symbol!=RBRACSY&&symbol!=CONSTSY&&symbol!=CHARSY&&symbol!=INTSY&&symbol!=IDSY&&symbol!=IFSY&&symbol!=DOSY&&symbol!=SWITCHSY&&symbol!=LBRACSY&&symbol!=SCANFSY&&symbol!=PRINTFSY&&symbol!=SEMISY&&symbol!=RETURNSY){
            errs[0]=INTSY;
            errs[1]=CHARSY;
          //  errs[2]=VOIDSY;
            errs[2]=CONSTSY;

            errs[3]=IFSY;
            errs[4]=DOSY;
            errs[5]=SWITCHSY;
            errs[6]=LBRACSY;
            errs[11]=IDSY;
            errs[7]=SCANFSY;
            errs[8]=PRINTFSY;
            errs[9]=SEMISY;
            errs[10]=RETURNSY;
            skip(12);
            if(symbol==SEMISY) getsym();

        }
    }
    while(symbol==INTSY||symbol==CHARSY){
        hsflag=6;
        Variabledefinition(lev,cg);
        if(symbol!=RBRACSY&&symbol!=INTSY&&symbol!=CHARSY&&symbol!=IFSY&&symbol!=IDSY&&symbol!=DOSY&&symbol!=SWITCHSY&&symbol!=LBRACSY&&symbol!=SCANFSY&&symbol!=PRINTFSY&&symbol!=SEMISY&&symbol!=RETURNSY){
            errs[0]=INTSY;
            errs[1]=CHARSY;
          //  errs[2]=VOIDSY;
           // errs[2]=CONSTSY;

            errs[2]=IFSY;
            errs[3]=DOSY;
            errs[4]=SWITCHSY;
            errs[5]=LBRACSY;
            errs[10]=IDSY;
            errs[6]=SCANFSY;
            errs[7]=PRINTFSY;
            errs[8]=SEMISY;
            errs[9]=RETURNSY;
            skip(11);
            if(symbol==SEMISY) getsym();

        }
    //    fprintf(fout3,"nextsymbol=%s\n",token);
    }

    Statementcolumn(lev,cg);
  //  getsym();
  //  printf("This is a Compound statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Compound statement!\n");
}
//int hsflag=0;//1为int 函数 2为char函数
void Revafuncdefin(struct Sym tempsym){//有返回值函数定义
    csgs=1;
    Parameterlist(tempsym);
    int listpos;
    int paranum;
    int i;
  //  printf("hanshuyoufanhuizhi!%s\n",tempsym.name);
    for(i=0;i<alist[0].listpos;i++){
        if(strcmp(alist[0].slist[i].name,tempsym.name)==0){
                paranum=alist[0].slist[i].paranum;
                listpos=alist[0].slist[i].funlev;
                break;
        }
    }
    for(i=0;i<alist[listpos].listpos;i++){
        if(alist[listpos].slist[i].kind==3){
                alist[listpos].slist[i].paranum=paranum;
        }
    }
    hscs=paranum;
    if(symbol==RPARSY){
        getsym();
        if(symbol==LBRACSY){
            getsym();
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            if(tempsym.type==INTSY) rety=1;
            else if(tempsym.type==CHARSY) rety=2;
         //   fprintf(fout3,"hanshuyoufanhuizhi!%s type=%d\n",tempsym.name,tempsym.type);
            returnflag=0;
            Compound(tempsym.funlev,cg);
            if(returnflag==0){
               // char tempreturn[namelength];
              //  strcpy(tempreturn,"0");
               // getmid(8,1,tempreturn,NULL,NULL,cg,tempsym.funlev);
                error(91);
            }
            char temppara[namelength];
            itoa(hscs,temppara,10);
         //   fprintf(fout3,"hhh2 hscs=%d",hscs);
            getmid(8,1,"0",temppara,NULL,cg,tempsym.funlev);//在所有函数后面加return
            if(symbol==RBRACSY){
                getsym();

            }else error(13);
        }else {
            error(12);
            errs[0]=INTSY;
            errs[1]=CHARSY;
            errs[2]=VOIDSY;
            skip(3);
            return;
        }
    }else {
        error(11);
      //  errs[0]=RBRACSY;
       // error(66);
        errs[0]=INTSY;
        errs[1]=CHARSY;
        errs[2]=VOIDSY;
        skip(3);
    //    errs[]
      //  skip(1);
    //    getsym();
        return;
    }
 //   printf("This is a Function_definition_with_return_value statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Function_definition_with_return_value statement!\n");
}
void Novafuncdefin(struct Sym tempsym){//无返回值函数定义
    //当前symbol为标识符名称
    getsym();
    if(symbol==LPARSY){
        getsym();
        csgs=1;
     //   fprintf(fout3,"meiyou!!!!!shuyoufanhuizhi!%s\n",tempsym.name);
        Parameterlist(tempsym);
        int listpos;
        int paranum;
        int i;
  //  printf("hanshuyoufanhuizhi!%s\n",tempsym.name);
        for(i=0;i<alist[0].listpos;i++){
            if(strcmp(alist[0].slist[i].name,tempsym.name)==0){
                paranum=alist[0].slist[i].paranum;
                listpos=alist[0].slist[i].funlev;
                break;
            }
        }
        for(i=0;i<alist[listpos].listpos;i++){
            if(alist[listpos].slist[i].kind==3){
                alist[listpos].slist[i].paranum=paranum;
            }
        }
        hscs=paranum;
        if(symbol==RPARSY){
            getsym();
            if(symbol==LBRACSY){
                getsym();
                int cg=1;
                if(tempsym.cgflag<0) cg=0;
                returnflag=0;
                returnflag=0;
                rety=3;
                Compound(tempsym.funlev,cg);
                if(returnflag==0){
                    error(91);
                  //  getmid(8,2,NULL,NULL,NULL,cg,tempsym.funlev);

                }
                char temppara[namelength];
                itoa(hscs,temppara,10);
          //      fprintf(fout3,"hhh1");
                getmid(8,2,NULL,temppara,NULL,cg,tempsym.funlev);
                if(symbol==RBRACSY){
                    getsym();
                }else error(7);
            }else {
                error(6);
             //   errs[0]=RBRACSY;
              //  skip(1);
               // getsym();
                errs[0]=INTSY;
                errs[1]=CHARSY;
                errs[2]=VOIDSY;
                skip(3);
                return;
            }
        }else {
            error(5);
         //   errs[0]=RBRACSY;
           // skip(1);
            //getsym();
            errs[0]=INTSY;
            errs[1]=CHARSY;
            errs[2]=VOIDSY;
            skip(3);
            return;
        }
    }else {
        error(4);
        errs[0]=INTSY;
        errs[1]=CHARSY;
        errs[2]=VOIDSY;
        skip(3);
       // errs[0]=RBRACSY;
        //skip(1);
       // getsym();
        return;
    }
  //  printf("This is a Function_definition_without_return_value statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Function_definition_without_return_value statement!\n");
}
void Main(struct Sym tempsym){//主函数
  if(symbol==LPARSY){
    getsym();
    if(symbol==RPARSY){
        getsym();
    }else {
        error(50);
        errs[0]=RBRACSY;
        skip(1);
      //  getsym();
        return;
    }
    if(symbol==LBRACSY){
        getsym();
        int cg=1;
        if(tempsym.cgflag<0) cg=0;
        returnflag=0;
        rety=4;
        Compound(tempsym.funlev,cg);
        if(symbol==RBRACSY){
            getsym();
        }else error(8);
    }else {
        error(9);
        errs[0]=RBRACSY;
        skip(1);
      //  getsym();
        return;
    }

  }else {
      error(51);
      errs[0]=RBRACSY;
      skip(1);
    //  getsym();
      return;
  }
 //  printf("This is a Main statement!\n");
   if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
   fprintf(fout,"%s","This is a Main statement!\n");
}

void Constantdefine(int lev,int cg){//常量定义int a=1,b=2 char c='a'
    //int kind;
    if(symbol==INTSY){
      //  kind=1;
        getsym();
      //  printf("    %d ",symbol);
        if(symbol==IDSY){
            struct Sym tempsym;
            strcpy(tempsym.name,token);
            tempsym.type=INTSY;
            tempsym.lev=lev;
            tempsym.kind=1;
            tempsym.arr=0;
            tempsym.fun=0;
            tempsym.sum=0;
            tempsym.funlev=0;
            tempsym.value=0;
            tempsym.paranum=0;
            tempsym.index=0;
           // int cgflag=0;//判断常量是否定义成功
            tempsym.cgflag=insertsym(tempsym,0,lev);
            if(tempsym.cgflag<0) cg=0;
            getsym();
         //   printf("    %d ",symbol);
            if(symbol==ASSIGNSY){
                getsym();
                Number();
                char tempnum[namelength];
                itoa(NUM,tempnum,10);
                if(tempsym.cgflag==1){
                    insertsym(tempsym,1,lev);

                }
             //   printf("jinlaile!");
                getmid(0,1,tempsym.name,tempnum,NULL,cg,lev);
              //  printf("chulaile!");
             //   getsym();
                if(symbol==COMMASY){
                    symbol=INTSY;
                    Constantdefine(lev,cg);
                }else if(symbol==SEMISY){
                    getsym();
                }else {
                    error(41);
                }
            }else {
                error(42);
            /*    errs[0]=SEMISY;
                errs[1]=COMMASY;
                errs[2]=INTSY;
                errs[3]=CHARSY;
                errs[4]=VOIDSY;
                errs[5]=IFSY;
                errs[6]=DOSY;
                errs[7]=SWITCHSY;
                errs[8]=LBRACSY;
                errs[9]=IDSY;
                errs[10]=SCANFSY;
                errs[11]=PRINTFSY;
                errs[12]=SEMISY;
                errs[13]=RETURNSY;
                skip(2);
                if(symbol==SEMISY) getsym();
                else if(symbol==COMMASY){
                    symbol=INTSY;
                    Constantdefine(lev,cg);
                }*/
                return;
            }
        }else {
            error(43);
         /*   errs[0]=SEMISY;
            errs[1]=COMMASY;
            skip(2);
            if(symbol==SEMISY) getsym();
            else if(symbol==COMMASY){
                symbol=INTSY;
                Constantdefine(lev,cg);
            }*/
            return;
        }
    }else if(symbol==CHARSY){
      //  kind=2;
        getsym();
        if(symbol==IDSY){
            struct Sym tempsym;
            strcpy(tempsym.name,token);
            tempsym.type=CHARSY;
            tempsym.kind=1;
            tempsym.arr=0;
            tempsym.fun=0;
            tempsym.sum=0;
            tempsym.lev=lev;
            tempsym.funlev=0;
            tempsym.value=0;
            tempsym.paranum=0;
            tempsym.index=0;
            tempsym.cgflag=insertsym(tempsym,0,lev);
            if(tempsym.cgflag<0) cg=0;
            getsym();
            if(symbol==ASSIGNSY){
                getsym();
                if(symbol==QUOSY){
                    char tempquo[namelength];
                    strcpy(tempquo,"'");
                    strcat(tempquo,token);
                    strcat(tempquo,"'");
                    if(tempsym.cgflag==1) {
                        insertsym(tempsym,2,lev);

                    }
                    getmid(0,2,tempsym.name,token,tempquo,cg,lev);
                    getsym();
                    if(symbol==COMMASY){
                        symbol=CHARSY;
                     //   printf("daozhelile");
                        Constantdefine(lev,cg);
                    }else if(symbol==SEMISY){
                        getsym();
                    }else {
                        error(41);
                    }
                }else {
                    error(45);
                /*    errs[0]=SEMISY;
                    errs[1]=COMMASY;
                    skip(2);
                    if(symbol==SEMISY) getsym();
                    else if(symbol==COMMASY){
                        symbol=CHARSY;
                        Constantdefine(lev,cg);
                    }*/
                    return;
                }
            }else {
                error(42);
            /*    errs[0]=SEMISY;
                errs[1]=COMMASY;
                skip(2);
                if(symbol==SEMISY) getsym();
                else if(symbol==COMMASY){
                    symbol=CHARSY;
                    Constantdefine(lev,cg);
                }*/
                return;
            }
        }else {
            error(43);
         /*   errs[0]=SEMISY;
            errs[1]=COMMASY;
            skip(2);
            if(symbol==SEMISY) getsym();
            else if(symbol==COMMASY){
                symbol=CHARSY;
                Constantdefine(lev,cg);
            }*/
            return;
        }
    }else {

        error(44);
    //    errs[0]=SEMISY;
     //   skip(1);
    //  getsym();
        return;
    }
  //  printf("This is a Constant_definition statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Constant_definition statement!\n");
}
void Procedure(){//程序
    while(symbol==CONSTSY){
        getsym();
        Constantdefine(0,1);
        if(symbol!=INTSY&&symbol!=CHARSY&&symbol!=VOIDSY&&symbol!=CONSTSY){
            error(66);
            errs[0]=INTSY;
            errs[1]=CHARSY;
            errs[2]=VOIDSY;
            errs[3]=CONSTSY;
            skip(4);
        }
    }
    int cs=0;
    while(symbol==INTSY||symbol==CHARSY||symbol==VOIDSY){
        //int flag=0;
      if(symbol==INTSY||symbol==CHARSY){
        hsflag=0;
        Func tempfun;
        struct Sym tempsym;
    //    printf("jinlai");
        tempsym=Variabledefinition(0,1);//变量说明已经完全处理完毕
      //  printf("chulai");
        if(hsflag==1|hsflag==2){
            int kind;
            if(tempsym.type==INTSY) kind=1;
            else kind=2;
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            getmid(1,kind,tempsym.name,NULL,NULL,cg,0);
       //     printf("zaijinlai %s",tempsym.name);
            Revafuncdefin(tempsym);

         //   printf("zaichulai");

            cs=1;
        }else{
            if(cs==1) {
                error(46);//变量说明出现在了有返回值函数定义的后面
                errs[0]=INTSY;
                errs[1]=CHARSY;
                errs[2]=VOIDSY;
                skip(3);
            }
        }
      /*  if(symbol!=INTSY&&symbol!=CHARSY&&symbol!=VOIDSY){
            error(66);
            errs[0]=INTSY;
            errs[1]=CHARSY;
            errs[2]=VOIDSY;
            skip(3);
        }*/

      }else{//VOID
        getsym();
        struct Sym tempsym;
        strcpy(tempsym.name,token);
        tempsym.type=VOIDSY;
        tempsym.kind=2;
        tempsym.lev=0;
        tempsym.fun=1;
        tempsym.arr=0;
        tempsym.sum=0;
        tempsym.value=0;
        tempsym.paranum=0;
        tempsym.funlev=Flev++;
        if(symbol==MAINSY){
            tempsym.cgflag=insertsym(tempsym,0,0);
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            getmid(1,3,token,NULL,NULL,cg,0);
            getsym();
            Main(tempsym);
            break;
        }else{
            tempsym.cgflag=insertsym(tempsym,0,0);
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            getmid(1,3,tempsym.name,NULL,NULL,cg,0);
            Novafuncdefin(tempsym);
        }

      }
      if(symbol!=end&&symbol!=INTSY&&symbol!=CHARSY&&symbol!=VOIDSY){
            error(66);
            errs[0]=INTSY;
            errs[1]=CHARSY;
            errs[2]=VOIDSY;
            skip(3);

      }
      //  printf("  %s",token);
    }
 /*   while(symbol==INTSY||symbol==CHARSY){
        //int flag=0;
        hsflag=0;
        Func tempfun;
        struct Sym tempsym;
        tempsym=Variabledefinition(0,1);//变量说明已经完全处理完毕

        if(hsflag==1|hsflag==2){
            int kind;
            if(tempsym.type==INTSY) kind=1;
            else kind=2;
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            getmid(1,kind,tempsym.name,NULL,NULL,cg,0);
            Revafuncdefin(tempsym);



            cs=1;
        }else{
            if(cs==1) {
                error(46);//变量说明出现在了有返回值函数定义的后面
                errs[0]=INTSY;
                errs[1]=CHARSY;
                errs[2]=VOIDSY;
                skip(3);
            }
        }
        if(symbol!=INTSY&&symbol!=CHARSY&&symbol!=VOIDSY){
            error(66);
            errs[0]=INTSY;
            errs[1]=CHARSY;
            errs[2]=VOIDSY;
            skip(3);
        }

    }

    while(symbol==VOIDSY){
        getsym();
        struct Sym tempsym;
        strcpy(tempsym.name,token);
        tempsym.type=VOIDSY;
        tempsym.kind=2;
        tempsym.lev=0;
        tempsym.fun=1;
        tempsym.arr=0;
        tempsym.sum=0;
        tempsym.value=0;
        tempsym.paranum=0;
        tempsym.funlev=Flev++;
        if(symbol==MAINSY){
            tempsym.cgflag=insertsym(tempsym,0,0);
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            getmid(1,3,token,NULL,NULL,cg,0);
            getsym();
            Main(tempsym);
            break;
        }else{
            tempsym.cgflag=insertsym(tempsym,0,0);
            int cg=1;
            if(tempsym.cgflag<0) cg=0;
            getmid(1,3,tempsym.name,NULL,NULL,cg,0);
            Novafuncdefin(tempsym);
        }
    }*/
  //  printf("This is a Procedure statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Procedure statement!\n");
    if(symbol==end){

    }else {
      //  printf("symbol=%d",symbol);
        error(81);
    }
}
struct Sym Variabledefinition(int lev,int cg){//变量定义int a,b,c[];char a,b,c[]
    int cgflag=0;
    struct Sym tempsym;
    if(symbol==INTSY){
        getsym();
        if(symbol==IDSY){
            strcpy(tempsym.name,token);
         //   fprintf(fout3,"name=%s token=%s\n",tempsym.name,token);
            tempsym.type=INTSY;
            tempsym.kind=2;
            tempsym.lev=lev;
            tempsym.fun=0;
            tempsym.funlev=0;
            tempsym.arr=0;
            tempsym.sum=0;
            tempsym.value=0;
            tempsym.paranum=0;
            getsym();//获得变量或者函数的标识符
            if(symbol==LPARSY&&hsflag!=5){
                if(hsflag==6){
                    error(47);//在只有变量说明的地方出现了有返回值函数的定义 在语句列里有函数定义！！！
                }
                hsflag=1;
                getsym();
                tempsym.arr=0;
                tempsym.fun=1;
                tempsym.funlev=Flev++;
                tempsym.index=0;

                tempsym.cgflag=insertsym(tempsym,0,lev);
                return tempsym;
            }else if(symbol==LBRASY){//[]

                getsym();//获得无符号整数
                if(NUM==0)error(60);
                else{
                    tempsym.arr=1;
                    tempsym.sum=NUM;
                    if(lev!=0) tempsym.index=index-4;
                    else{
                        tempsym.index=0;

                    }
                 //   tempsym.cgflag=insertsym(tempsym,0,lev);
                  //  fprintf(fout3,"name=%s cgflag=%d\n",tempsym.name,tempsym.cgflag);
                   // if(tempsym.cgflag<0) cg=0;
                   // else{
                   //     index=index-4*tempsym.sum;
                   // }
                   // char tempnum[namelength];
                   // itoa(NUM,tempnum,10);
                   // getmid(4,1,tempsym.name,tempnum,NULL,cg);
                }
                getsym();
                if(symbol!=RBRASY){
                    error(48);
                }else{
                    tempsym.cgflag=insertsym(tempsym,0,lev);
                    if(tempsym.cgflag<0) cg=0;
                    else{
                        if(lev!=0) index=index-4*tempsym.sum;
                    }
                    char tempnum[namelength];
                    itoa(NUM,tempnum,10);
                    getmid(4,1,tempsym.name,tempnum,NULL,cg,lev);
                    getsym();
                }
            }else{
                tempsym.arr=0;
                tempsym.sum=0;
                if(lev!=0) tempsym.index=index-4;
                else tempsym.index=0;
                tempsym.cgflag=insertsym(tempsym,0,lev);
              //  fprintf(fout3,"name=%s cgflag=%d\n",tempsym.name,tempsym.cgflag);
                if(tempsym.cgflag<0) cg=0;
                else{
                    if(lev!=0) index=index-4;

                }
                getmid(2,1,tempsym.name,NULL,NULL,cg,lev);
            }
            hsflag=5;
            if(symbol==COMMASY){
                symbol=INTSY;
                Variabledefinition(lev,cg);
            }else if(symbol==SEMISY){
                getsym();
            }else {
                error(49);

            }
        }else {
            error(52);
        /*    errs[0]=SEMISY;
            errs[1]=COMMASY;
            skip(2);
            if(symbol==COMMASY){
                symbol=INTSY;
                Variabledefinition(lev,cg);
            }else if(symbol==SEMISY){
                getsym();
            }*/
            return;
        }
    }else if(symbol==CHARSY){
        getsym();
        if(symbol==IDSY){
            strcpy(tempsym.name,token);
         //   fprintf(fout3,"name=%s token=%s\n",tempsym.name,token);
            tempsym.type=CHARSY;
            tempsym.kind=2;
            tempsym.lev=lev;
            tempsym.fun=0;
            tempsym.funlev=0;
            tempsym.arr=0;
            tempsym.sum=0;
            tempsym.value=0;
            tempsym.paranum=0;
            getsym();
            if(symbol==LPARSY&&hsflag!=5){
                if(hsflag==6){
                    error(47);//在只有变量说明的地方出现了有返回值函数的定义 在语句列里有函数定义！！！
                }
                hsflag=2;
                getsym();
                tempsym.arr=0;
                tempsym.funlev=Flev++;
                tempsym.fun=1;
                tempsym.index=0;
                tempsym.cgflag=insertsym(tempsym,0,lev);
                return tempsym;
            }else if(symbol==LBRASY){
                getsym();//获得数组大小
                if(NUM==0)error(60);
                else{
                    tempsym.arr=1;
                    tempsym.sum=NUM;
                    if(lev!=0) tempsym.index=index-4;
                    else tempsym.index=0;
                  //  tempsym.cgflag=insertsym(tempsym,0,lev);
                  //  if(tempsym.cgflag<0) cg=0;
                   // else{
                   //     index=index-4*tempsym.sum;
                   // }
                   // char tempnum[namelength];
                   // itoa(NUM,tempnum,10);
                   // getmid(4,2,tempsym.name,tempnum,NULL,cg);
                }
                getsym();
                if(symbol!=RBRASY){
                    error(48);
                }else{
                    tempsym.cgflag=insertsym(tempsym,0,lev);
                    if(tempsym.cgflag<0) cg=0;
                    else{
                        if(lev!=0) index=index-4*tempsym.sum;
                    }
                    char tempnum[namelength];
                    itoa(NUM,tempnum,10);
                    getmid(4,2,tempsym.name,tempnum,NULL,cg,lev);
                    getsym();
                }
            }else{
                tempsym.arr=0;
                tempsym.sum=0;
                if(lev!=0) tempsym.index=index-4;
                else tempsym.index=0;
                tempsym.cgflag=insertsym(tempsym,0,lev);
                if(tempsym.cgflag<0) cg=0;
                else{
                    if(lev!=0) index=index-4;
                }
                getmid(2,2,tempsym.name,NULL,NULL,cg,lev);
            }
            hsflag=5;
            if(symbol==COMMASY){
                symbol=CHARSY;
                Variabledefinition(lev,cg);
            }else if(symbol==SEMISY){
                getsym();
            }else error(49);
        }else {
            error(52);
          /*  errs[0]=SEMISY;
            errs[1]=COMMASY;
            skip(2);
            if(symbol==COMMASY){
                symbol=CHARSY;
                Variabledefinition(lev,cg);
            }else if(symbol==SEMISY){
                getsym();
            }*/
            return;
        }
    }
 //   printf("This is a Variable_definition statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Variable_definition statement!\n");
    return tempsym;
}
int Valueparameterlist(int lev,struct Sym tempsym,int cg){//值参数表
    //在此之前应该已经确定了函数存在 cg就应该为1
    int res=1;
    int i;
    int paranum=0;
    int tempnum=0;
    int funlev=0;
    char tempindex[namelength];
    for(i=0;i<alist[0].listpos;i++){
        if(strcmp(tempsym.name,alist[0].slist[i].name)==0){
            paranum=alist[0].slist[i].paranum;
            funlev=alist[0].slist[i].funlev;
            break;
        }
    }
    if(symbol==RPARSY){

    }else{
        res=Expression(lev,cg);
        cg=cg&&res;
      //  getmid(15,1,fact1,NULL,NULL,cg);
//        tempsym=getvalue(tempsym.name,)
        if(cg){
            if(alist[funlev].slist[tempnum].type==ifcori){
                 //   printf("!!!!!!!!!!!!!!!!!!!!!%d\n",alist[funlev].slist[tempnum].index);
                    itoa(alist[funlev].slist[tempnum].index,tempindex,10);
            }else {
                res=0;
                cg=0;
                error(83);
            }
        }
        getmid(15,1,fact1,tempindex,NULL,cg,lev);
       // reg--;//**********************
        tempnum++;
        while(symbol==COMMASY){
            getsym();
            res=Expression(lev,cg)&&res;
            cg=cg&&res;
           // getmid(15,1,fact1,NULL,NULL,cg);
             if(cg){
                if(alist[funlev].slist[tempnum].type==ifcori){
                    itoa(alist[funlev].slist[tempnum].index,tempindex,10);
                }else {
                    res=0;
                    cg=0;
                    error(83);
                }
            }
            getmid(15,1,fact1,tempindex,NULL,cg,lev);
          //  reg--;//***********************
            tempnum++;
        }
    }
    if(tempnum!=paranum){
        error(80);
        return 0;
    }
 //   printf("This is a Value_parameterlist statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Value_parameterlist statement!\n");
    return res;
}
void Novafuncuse(int lev,struct Sym tempsym,int cg){//无返回值的函数调用 值参数表）
    cg=Valueparameterlist(lev,tempsym,cg)&&cg;
    if(symbol==RPARSY){
        getmid(16,0,tempsym.name,NULL,NULL,cg,lev);
        getsym();
    }else error(53);
 //   printf("This is a Function_tuning_without_return_value statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Function_tuning_without_return_value statement!\n");
}
int Revafuncuse(int lev,struct Sym tempsym,int cg){//有返回值的函数调用 值参数表）
    int res=1;
    res=Valueparameterlist(lev,tempsym,cg);
   // fprintf(fout3,"usefres=%d\n",res);
    cg=cg&&res;
    if(symbol==RPARSY){
        getmid(16,0,tempsym.name,NULL,NULL,cg,lev);
        char tempreg[namelength];
        char tempreg2[namelength];
        strcpy(tempreg,"t");
        itoa(reg++,tempreg2,10);
        strcat(tempreg,tempreg2);
        getmid(17,1,tempreg,NULL,NULL,cg,lev);
        strcpy(fact1,tempreg);
        getsym();

    }else {
        error(53);
        return 0;
    }
  //  printf("This is a Function_tuning_with_return_value statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Function_tuning_with_return_value statement!\n");
    return res;
}
int Factor(int lev,int cg){//因子
    int flagwr=0;
    int res=1;
    if(symbol==IDSY){
      //  fprintf(fout3,"token2=%s\n",token);
        ifxory=0;
        struct Sym tempsym;
        strcpy(tempsym.name,token);
        getsym();
        if(symbol==LBRASY){
            res=findsym(tempsym.name,lev);
            cg=cg&&res;
            if(res==1){//获取当前数组的类型
                tempsym=getvalue(tempsym.name,lev);
                ifcori=tempsym.type;
                if(tempsym.arr==0){
                    res=0;
                    cg=0;
                    error(88);
                }
            }else error(85);
            getsym();
            int tempifcori;
            tempifcori=ifcori;
            cg=Expression(lev,cg)&&cg;
            if(symbol==RBRASY){
                if(res==1){
                  //  printf("intfact1=%d",intfact1);
                    if(ifxory==1&&tempsym.sum<=intfact1){
                        if(intfact1<0) error(84);
                  //      printf("%d",intfact1);
                        error(84);
                        res=0;
                        cg=0;
                    }
                    if(ifxory==1&&intfact1<0) error(84);
                }
                char tempreg[namelength];
                itoa(reg++,tempreg,10);
                char tempreg2[namelength];
                strcpy(tempreg2,"t");
                strcat(tempreg2,tempreg);
                if(res==1){
                    if(tempsym.kind==3){

                    }else if(tempsym.kind==2&&tempsym.lev==0){
                        getmid(14,7,tempsym.name,fact1,tempreg2,cg,lev);
                    }else getmid(14,1,tempsym.name,fact1,tempreg2,cg,lev);
                }

                if(cg==1){//获得数组的值
                    if(ifxory==1&&intfact1>=szmax) {
                        if(setmaxflag==1){
                            printf("szmax set too small!\n");
                            setmaxflag=0;
                        }

                    }else {
                      // printf("jinli ifxory=%d intfact1=%d ",ifxory,intfact1);
                        if(ifxory==1&&intfact1>=0&&intfact1<tempsym.sum) intfact1=tempsym.sz[intfact1];//!!!!!!!!!!!!!!!!!!
                      //  printf("intfact1=%d ",intfact1);
                    }
                }
                strcpy(fact1,tempreg2);//fact2
                //给intfact1赋值
                ifcori=tempifcori;
                ifxory=0;
                getsym();
            }else {
                error(54);
                flagwr=1;
            }
        }else if(symbol==LPARSY){
            getsym();
            int type;
            type=typeoffunc(tempsym.name);

          //  printf("66666666666%s   type=%d\n",temp.name,type);
            if(type==CHARSY||type==INTSY) {
               //     printf("!!!!!!!!!!!youfanhuizhidehanshu!!!!!%s\n",tempsym.name);
                    res=Revafuncuse(lev,tempsym,cg)&&res;//函数调用完后 结果在fact1中  数字结果也在intfact1里 ifcori也赋值了
                    ifcori=type;
            }else{
                error(92);
                cg=0;
                res=0;
            }
        //    res=Revafuncuse(lev,tempsym,cg)&&res;//函数调用完后 结果在fact1中  数字结果也在intfact1里 ifcori也赋值了
            //if(res==0) flagwr=1;
            cg=cg&&res;
        }else{

            res=findsym(tempsym.name,lev)&&res;
            cg=cg&&res;
            strcpy(fact1,tempsym.name);
            if(res==1){
                tempsym=getvalue(tempsym.name,lev);
                if(tempsym.arr==1) {
                        error(82);
                        res=res&&0;
                        cg=0;
                }else if(tempsym.fun==1){//应该是标识符 不应该是函数标识符 函数标识符应该在上面
                        error(87);
                        res=0;
                        cg=0;
                }else{
                   // printf("value=%d\n",tempsym.value);
                   // int v=tempsym.value;

                    intfact1=tempsym.value;
                    ifcori=tempsym.type;
                    char tempreg[namelength];
                    itoa(reg++,tempreg,10);
                    char tempreg2[namelength];
                    strcpy(tempreg2,"t");
                    strcat(tempreg2,tempreg);
                    if(tempsym.kind==3) {
                            char temppara[namelength];
                            itoa(tempsym.paranum,temppara,10);
                            getmid(14,5,tempreg2,fact1,temppara,cg,lev);
                    }else if(tempsym.kind==2&&tempsym.lev==0) getmid(14,6,tempreg2,fact1,NULL,cg,lev);
                    else if(tempsym.kind==1) getmid(14,8,tempreg2,fact1,NULL,cg,lev);
                    else getmid(14,2,tempreg2,fact1,NULL,cg,lev);
                    strcpy(fact1,tempreg2);

                  //  printf("%szhaodaole!%d intfact1=%d ifcori=%d\n",tempsym.name,symbol,intfact1,ifcori);
                }

            }
         //   fprintf(fout3,"%s flag=%d",tempsym.name,flagwr);
         //   printf("%szhaodaole!%d\n",tempsym.name,symbol);

        }
    }else if(symbol==PLUSSY||symbol==MINUSSY||symbol==intSY){
        ifxory=1;
        ifcori=INTSY;
        int zf=0;
        if(symbol==PLUSSY||symbol==MINUSSY){
            if(symbol==MINUSSY) zf=1;//是负数
            getsym();
            if(symbol==intSY) {
                if(NUM==0) {
                    error(67);
                    strcpy(fact1,"0");
                }else{
                    if(zf==1){
                        itoa(NUM,fact1,10);
                        char tempreg[namelength];
                        itoa(reg++,tempreg,10);
                        char tempreg2[namelength];
                        strcpy(tempreg2,"t");
                        strcat(tempreg2,tempreg);
                        getmid(14,3,tempreg2,fact1,NULL,cg,lev);
                        strcpy(fact1,tempreg2);


                      //  itoa(NUM,fact1,10);
                        char tempnum2[namelength];
                        char tempnum3[namelength];
                        strcpy(tempnum2,"t");
                        itoa(reg++,tempnum3,10);
                        strcat(tempnum2,tempnum3);
                        getmid(11,MINUSSY,tempnum2,"0",fact1,cg,lev);
                        strcpy(fact1,tempnum2);
                        intfact1=NUM*-1;
                    }else{
                        itoa(NUM,fact1,10);
                        char tempreg[namelength];
                        itoa(reg++,tempreg,10);
                        char tempreg2[namelength];
                        strcpy(tempreg2,"t");
                        strcat(tempreg2,tempreg);
                        getmid(14,3,tempreg2,fact1,NULL,cg,lev);
                        strcpy(fact1,tempreg2);
                      //  itoa(NUM,fact1,10);
                        intfact1=NUM;
                    }
                    ifcori=INTSY;
                }
                getsym();
            }else flagwr=1;
        }else {
            Number();
            itoa(NUM,fact1,10);
            char tempreg[namelength];
            itoa(reg++,tempreg,10);
            char tempreg2[namelength];
            strcpy(tempreg2,"t");
            strcat(tempreg2,tempreg);
            getmid(14,3,tempreg2,fact1,NULL,cg,lev);
            strcpy(fact1,tempreg2);
            intfact1=NUM;
            ifcori=INTSY;

        }
    }else if(symbol==QUOSY){
        ifxory=1;
     /*   ifcori=CHARSY;
        strcpy(fact1,"'");
        strcat(fact1,token);
        strcat(fact1,"'");*/
        intfact1=token[0];
        ifcori=CHARSY;

     //   itoa(token[0],fact1,10);
        strcpy(fact1,token);
        char tempreg[namelength];
        itoa(reg++,tempreg,10);
        char tempreg2[namelength];
        strcpy(tempreg2,"t");
        strcat(tempreg2,tempreg);
        getmid(14,4,tempreg2,fact1,NULL,cg,lev);
        strcpy(fact1,tempreg2);

     //   printf("fact1=%s",fact1);
        getsym();
    }else if(symbol==LPARSY){
        getsym();
        res=Expression(lev,cg)&&res;//当前类型就是括号里的表达式的类型
        cg=cg&&res;
        if(symbol==RPARSY){
            getsym();
        }else {
            error(55);
            flagwr=1;
        }
    }else {
        ifxory=0;
        error(56);
        flagwr=1;
    }
    if(flagwr==1){
        errs[0]=PLUSSY;
        errs[1]=MINUSSY;
        errs[2]=MULTSY;
        errs[3]=DIVISY;

      /*  errs[4]=SEMISY;
        errs[5]=RBRASY;
        errs[6]=RPARSY;
        errs[7]=LESSSY;
        errs[8]=LEQSY;
        errs[9]=MOREQSY;
        errs[10]=MORESY;
        errs[11]=EQUSY;
        errs[12]=NEQSY;
        errs[13]=COMMASY;*/

        errs[4]=IFSY;
        errs[5]=DOSY;
        errs[6]=SWITCHSY;
        errs[7]=LBRACSY;
        errs[8]=IDSY;
        errs[9]=SCANFSY;
        errs[10]=PRINTFSY;
        errs[11]=SEMISY;
        errs[12]=RETURNSY;

        skip(13);
        res=0;
    }
  //  printf("This is a Factor statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Factor statement!\n");
  //  fprintf(fout3,"!!!%d!!!!",ifcori);
    return res;
}
int Term(int lev,int cg){//项
  //  fprintf(fout3,"jinlaileterm\n");
    cg=Factor(lev,cg)&&cg;
   // fprintf(fout3,"!!!%d!!!!",ifcori);
   // printf("666chuliale symbol=%c %d",CHAR,symbol);
    while(symbol==DIVISY||symbol==MULTSY){
        int op=symbol;
     //   printf(" op=%d",op);
        char tempreg3[namelength];
        char tempreg2[namelength];
        strcpy(tempreg3,fact1);
        int intfact2=intfact1;
        int ifxory2=ifxory;
        getsym();
        cg=Factor(lev,cg)&&cg;
        //修改了
        if(op==DIVISY) {
                if(intfact1==0){
                    intfact1=intfact2;
                    if(ifxory==1) error(89);
                }else intfact1=intfact2/intfact1;
        }else {
          //  fprintf(fout3,"chengfa!!!!");
            intfact1=intfact2*intfact1;
        }
        char tempreg[namelength];
        strcpy(tempreg2,"t");
        itoa(reg++,tempreg,10);
        strcat(tempreg2,tempreg);
        getmid(11,op,tempreg2,tempreg3,fact1,cg,lev);
        strcpy(fact1,tempreg2);
        ifcori=INTSY;
        ifxory=ifxory&&ifxory2;
    }
 //   printf("This is a Term statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
    fprintf(fout,"%s","This is a Term statement!\n");
    return cg;
}
int Expression(int lev,int cg){//＜表达式＞    ::= ［＋｜－］＜项＞{＜加法运算符＞＜项＞}
   // fprintf(fout3,"jinlaileexpression\n");
    ifcori=0;
    int sz=0;//1为负数
    intfact1=0;//!!!!!!!!!!!!!!!!!!!!!!!!!!
    if(symbol==PLUSSY||symbol==MINUSSY){
        if(symbol==MINUSSY) sz=1;
    //    printf("youfuhao!!!!");
        getsym();
    }
    cg=Term(lev,cg)&&cg;
  //  printf("chulaile2");
    if(sz==1){
        char tempreg[namelength];
        char tempreg2[namelength];
        strcpy(tempreg,"t");
        itoa(reg++,tempreg2,10);
        strcat(tempreg,tempreg2);
        getmid(11,MINUSSY,tempreg,"0",fact1,cg,lev);
        strcpy(fact1,tempreg);
        intfact1=-1*intfact1;
        ifcori=INTSY;
    }

    sz=0;
   // fprintf(fout3,"!!!%d!!!!",ifcori);
    while(symbol==PLUSSY||symbol==MINUSSY){
        int ifxory2=ifxory;
        int intfact2=intfact1;
        int op=symbol;
        char tempname[namelength];
        strcpy(tempname,fact1);
        getsym();
        cg=Term(lev,cg)&&cg;
     //   printf("chulaile3");
        char tempreg[namelength];
        char tempreg2[namelength];
        strcpy(tempreg,"t");
      //  printf("chulaile4");
        itoa(reg++,tempreg2,10);
        strcat(tempreg,tempreg2);
     //   printf("chulaile5 op=%d tempreg=%s tempname=%s fact1=%s\n",op,tempreg,tempname,fact1);
        getmid(11,op,tempreg,tempname,fact1,cg,lev);
     //   printf("chulaile7");
        strcpy(fact1,tempreg);
        if(op==PLUSSY) intfact1=intfact1+intfact2;
        else intfact1=intfact2-intfact1;
        ifcori=INTSY;
        ifxory=ifxory&&ifxory2;
     //   printf("chulaile6");
    }
 //   printf("This is a Expression statement!\n");
    if(templine!=line){
        fprintf(fout,"\n%d:\n",line);
        templine=line;
    }
 //   fprintf(fout3,"!!!%d!!!!",ifcori);
    fprintf(fout,"%s","This is a Expression statement!\n");
    return cg;
}


int main(){
    char file[100];
    printf("Please enter the location of the input file:");
    scanf("%s",file);
    fin=fopen(file,"r");
    fout = fopen("2.txt","w");
    fout2 = fopen("3.txt","w");
    fout3 = fopen("4.txt","w");
    fout4=fopen("mips.txt","w");
    fout5 = fopen("dataflowconflict.txt","w");
  //  fin=fopen("1.txt","r");
    fprintf(fout2,"%d:\n",line);
    int i,j,k;
    for(i=0;i<maxlevel;i++){
        alist[i].listpos=0;

    }
    getsym();
    Procedure();
    printmips();
    for(i=0;i<Flev;i++){
        fprintf(fout3,"list%d\n",i);
        for(j=0;j<alist[i].listpos;j++){
            fprintf(fout3,"%s\tlev=%d\tfunlev=%d\tindex=%d\tfun=%d\tarr=%d\ttype=%d\tkind=%d\tvalue=%d\tkind=%d\tparanum=%d\t\n",alist[i].slist[j].name,alist[i].slist[j].lev,alist[i].slist[j].funlev,alist[i].slist[j].index,alist[i].slist[j].fun,alist[i].slist[j].arr,alist[i].slist[j].type,alist[i].slist[j].kind,alist[i].slist[j].value,alist[i].slist[j].kind,alist[i].slist[j].paranum);
            if(alist[i].slist[j].arr==1){
                for(k=0;k<alist[i].slist[j].sum;k++){
                    if(k>=szmax) {
                        if(setmaxflag==1){
                            printf("szmax set too small!\n");
                            setmaxflag=0;
                        }

                    }else fprintf(fout3,"\t%s[%d]=%d\n",alist[i].slist[j].name,k,alist[i].slist[j].sz[k]);
                }
            }
        }
        fprintf(fout3,"\n");
    }
    dellabel();
    combineconstant();
    delcomexp();
    getflow();
  //  printf("flowjieshu");
    //allocatereg();
    allocatereg2();
   // printf("jieshule");
    getopmid();
    printmipsaft();
    getalldefanduse();
   // countreg();

}

