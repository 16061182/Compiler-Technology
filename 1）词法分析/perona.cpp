#include<iostream>
#include<string.h>
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
#define	NEQ 13//!=
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
#define	ICON 27//整形常量 
#define	CCON 28//字符常量
#define	SCON 29//字符串常量	
#define	PLUS 30//+
#define	MINUS 31//-
#define	TIMES 32//*
#define	DIV 33///
#define MAINSY 34//main

#define IDENL 50//标识符的长度不超过50 
#define LINEL 1024//行的长度不超过1024
#define KEYNUM 12//预定义关键字的数量
#define SYMNUM 35//symbol的数量 
#define MAXINT 2147483647//整型的最大值
#define MAXINTN 10//最大的整型位数 

char printsym[SYMNUM][IDENL] = {
"CONSTSY",//const
"INTSY",//int
"CHARSY",//char
"VOIDSY",//void
"IDEN",//标识符
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
"ICON",//整形常量 
"CCON",//字符常量
"SCON",//字符串常量	
"PLUS",//+
"MINUS",//-
"TIMES",//*
"DIV",///
"MAINSY"//main
};
 
FILE *fin;//源代码输入文件 
char ch;//当前读到的字符 
int ll = 0;//lenth of current line       LenOfCline
int cc = 0;//character counter      indexInLine
int lc = 0;//line counter        
char line[LINEL];//保存一行字符
char key[KEYNUM][IDENL];//预定义关键字表
int ksy[KEYNUM]; //预定义关键字对应的symbol 
int sy;
char id[IDENL];//关键字最长占50个字符 
int inum;//getsym读取的数字 
int printnum = 1;

void error(){
	printf("与保留字冲突");
}

void getch(){
	if(ll == cc){//读到行尾
		lc++;
		ll = 0;//清空行长度 
		cc = 0;//清空字符计数器 
		if(fgets(line,1024,fin)!=NULL){
			ll = strlen(line);
			line[ll] = '\0';//行尾设置为空格? 
		}
		else{
			ch = EOF;
			return ;
		}
	}
	ch = line[cc++];
}

void getsym(){
	while(ch == ' '||ch == '\t'||ch == '\n'){
		getch();
	}
	if(ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z' || ch == '_'){
		int i = 0;
		do{
			id[i++] = ch;
			getch();
		}while(ch >= 'a'&&ch <= 'z' || ch >= 'A' && ch <= 'Z' || ch == '_' || ch >= '0'&&ch <= '9');
		id[i] = '\0';
		char id0[IDENL];
		for(i=0;i<strlen(id);i++){
			if(id[i]>='A'&&id[i]<='Z'){
			}
			id0[i] = tolower(id[i]);
		}
		id0[i] = '\0';
		int found = 0;
		int isiden = 1;//假设不是保留字 
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
		int k = 0;//数字位数 
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
	fin = fopen("16061182_test.txt","r");
	setup();
	getch();
	//printf("%c",ch);
	while(ch != EOF){
		//getch();
		//printf("%c",ch);
		getsym();
	}
	
	
	fclose(fin);
	return 0;
}






