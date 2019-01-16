#ifndef CIFAFENXI_H_INCLUDED
#define CIFAFENXI_H_INCLUDED
#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
#include"cuowuchuli.h"
using namespace std;

void getch(){
       ch = sourcecode[sourceindex++];
       cout << ch << endl;
}

void getsym(){
       while(ch == ' '||ch == '\t'||ch == '\n'){
        if(ch == '\n') {
                lc++;
                cout << "hangshu jia+++++++" << lc << endl;
        }
              getch();
       }
       if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || ch == '_'){
              int i = 0;
              do{
                     id[i++] = ch;
                     getch();
              }while((ch >= 'a'&&ch <= 'z') || (ch >= 'A' && ch <= 'Z') || ch == '_' ||( ch >= '0'&&ch <= '9'));
              id[i] = '\0';
              for(i=0;i<strlen(id);i++){
                     if(id[i]>='A'&&id[i]<='Z'){
                     }
                     id0[i] = tolower(id[i]);
              }
              id0[i] = '\0';
              int found = 0;
              for(i=0;i<KEYNUM;i++){
                     if(strcmp(key[i],id0) == 0){
                            found = 1;
                            break;
                     }
              }
              if(found) sy = ksy[i];
              else sy = IDEN;
              printf("%d %s %s\n",printnum,printsym[sy],id);
       }
       else if(ch == '='){
              getch();
              if(ch == '='){
                     sy = EQL;
                     printf("%d %s\n",printnum,printsym[sy]);
                     getch();
              }
              else{
                     sy = BECOM;
                     printf("%d %s\n",printnum,printsym[sy]);
              }
       }
       else if(ch == '!'){
              getch();
              if(ch == '='){
                     sy = NEQ;
                     printf("%d %s\n",printnum,printsym[sy]);
                     getch();
              }
              else{
                error(ILLEGAL_ERROR);
                //容错处理
                sy = NEQ;
                printf("%d %s\n",printnum,printsym[sy]);
              }
       }
       else if(ch == '>'){
              getch();
              if(ch == '='){
                     sy = GEQ;
                     printf("%d %s\n",printnum,printsym[sy]);
                     getch();
              }
              else{
                     sy = GTR;
                     printf("%d %s\n",printnum,printsym[sy]);
              }
       }
       else if(ch == '<'){
              getch();
              if(ch == '='){
                     sy = LEQ;
                     printf("%d %s\n",printnum,printsym[sy]);
                     getch();
              }
              else{
                     sy = LSS;
                     printf("%d %s\n",printnum,printsym[sy]);
              }
       }
       else if(ch == '('){
              getch();
              sy = LPAR;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == ')'){
              getch();
              sy = RPAR;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == '['){
              getch();
              sy = LBRA;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == ']'){
              getch();
              sy = RBRA;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == '{'){
              getch();
              sy = LBPA;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == '}'){
              getch();
              sy = RBPA;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == ','){
              getch();
              sy = COMMA;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == ';'){
              getch();
              sy  = SEMI;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch >= '0'&&ch <= '9'){
              int k = 0;//整数的位数
              inum = 0;
              sy = ICON;
              do{
                     inum = inum*10+ch-'0';
                     k++;
                     getch();
              }while(ch >= '0'&&ch <= '9'&&inum <= MAXINT&&k<=MAXINTN);
              if((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || ch == '_'){//the iden begins with integer
            error(IDEN_WRONG_ERROR);
              }
              printf("%d %s %d\n",printnum,printsym[sy],inum);
       }
       else if(ch == '\''){
              getch();
              if(!(ch == '+'||ch == '-'||ch == '*'||ch == '/'||(ch >= 'a'&&ch <= 'z')||(ch >= 'A'&&ch <= 'Z')||(ch >= '0'&&ch <= '9')||ch == '_')){
                    error(ILLEGAL_ERROR);
              }
            inum = ch;
            getch();
            if(ch == '\''){
                sy = CCON;
                printf("%d %s %c\n",printnum,printsym[sy],inum);
                getch();
            }
            else{
                error(SQUOTE_LOST_ERROR);
                //容错处理
                sy = CCON;
                printf("%d %s %c\n",printnum,printsym[sy],inum);
            }
       }
       else if(ch == '\"'){
              getch();
              //char str[LINEL];
              int i = 0;
              while(ch >= 32&&ch <= 126&&ch != 34&&i < LINEL){
                     str[i++] = ch;
                     getch();
              }
              if(ch == '\"'){
                     sy = SCON;
                     str[i] = '\0';
                     printf("%d %s %s\n",printnum,printsym[sy],str);
                     getch();
              }
              else{
                error(DQUOTE_LOST_ERROR);
                //容错处理（这里的容错似乎没用，因为其他字符可以读进字符串）
                sy = SCON;
                str[i] = '\0';
                printf("%d %s %s\n",printnum,printsym[sy],str);
              }
       }
       else if(ch == '+'){
              getch();
              sy = PLUS;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == '-'){
              getch();
              sy = MINUS;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == '*'){
              getch();
              sy = TIMES;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else if(ch == '/'){
              getch();
              sy = DIV;
              printf("%d %s\n",printnum,printsym[sy]);
       }
       else{//出现了文法中不允许的符号
              if(ch != '\0'){
                    error(ILLEGAL_ERROR);
              }
              //int ans = ch;
              //fprintf(error_message,"the last symbol is %d\n",ans);
       }

}

#endif // CIFAFENXI_H_INCLUDED
