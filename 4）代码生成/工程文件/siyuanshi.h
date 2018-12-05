#ifndef SIYUANSHI_H_INCLUDED
#define SIYUANSHI_H_INCLUDED
#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
using namespace std;

char kinds[30][IDENL] = {//需要更新
        "CONST",
        "VAR",
        "ARRAY",
        "FUNC",
        "CALL",
        "PARA",
        "PUSH",
        "ASSIGN",
        "ASSIGN_ARR",
        "JIA",
        "JIAN",
        "CHENG",
        "CHU",
        "FACTOR_CON",
        "FACTOR_VAR",
        "FACTOR_FUNC",
        "FACTOR_ARRAY",
        "FACTOR_EXPR",
        "BEQ",
        "BNE",
        "BGTR",
        "BGEQ",
        "BLSS",
        "BLEQ",
        "JUMP",
        "READ",
        "WRITE",
        "RETURN",
        "LABEL"
};
char types[4][IDENL] = {
        "INT",
        "CHAR",
        "VOID",
        "STR"
};

void entermidcode(midcode_kind _kind,midcode_type _type,char *_name1,char *_name2,int _value,int _t1,int _t2){
    int i;
    int index = midtab.index;
    midtab.midcodes[index].kind = _kind;
    midtab.midcodes[index].type = _type;
    strcpy(midtab.midcodes[index].name1,_name1);
    strcpy(midtab.midcodes[index].name2,_name2);
    midtab.midcodes[index].value = _value;
    midtab.midcodes[index].t1 = _t1;
    midtab.midcodes[index].t2 = _t2;

    midtab.index ++;
    //cout << "   kind:" << kinds[_kind] << " type:" << types[_type] << " name1:" << _name1 << " name2:" << _name2 << " t1:" << _t1 << " t2:" << _t2 <<" value:" << _value << endl;
    /*for(i=0;i<midtab.index;i++){//打印四元式表内容
        cout << "   kind:" << kinds[_kind] << " type:" << types[_type] << " name1:" << _name1 << " name2:" << _name2 << " t1:" << _t1 << " t2:" << _t2 <<" value:" << _value << endl;
    }*/
}

void print_singlemidcode(int i);
void printmidcode(){
    int i;
    for(i=0;i<midtab.index;i++){//打印四元式表内容
        //cout << i << "     kind:" << kinds[midtab.midcodes[i].kind] << " type:" << types[midtab.midcodes[i].type] << " name1:" << midtab.midcodes[i].name1 << " name2:" << midtab.midcodes[i].name2 << " t1:" << midtab.midcodes[i].t1 << " t2:" << midtab.midcodes[i].t2 <<" value:" << midtab.midcodes[i].value << endl;
        print_singlemidcode(i);
    }

}

void print_singlemidcode(int i){
    midcode temp = midtab.midcodes[i];
    midcode_kind kind = temp.kind;
    midcode_type type = temp.type;
    char name1[LINEL];
    char name2[LINEL];
    strcpy(name1,temp.name1);
    strcpy(name2,temp.name2);
    int value = temp.value;
    int t1 = temp.t1;
    int t2 = temp.t2;
    if(kind == CONST){
        cout << i << "  " << "CONST " << types[type] << " " << name1 << " = " << value << endl;
    }
    else if(kind == VAR){
        cout << i << "  " << "VAR " << types[type] << " " << name1 << endl;
    }
    else if(kind == ARRAY){
        cout << i << "  " << "ARRAY " << types[type] << " " << name1 << "[" << value << "]" << endl;
    }
    else if(kind == FUNC){
        cout << i << "  " << "FUNC " << types[type] << " " << name1 << "(" << value << ")" << endl;
    }
    else if(kind == CALL){
        cout << i << "  " << "CALL " << types[type] << " " << name1 << "(" << value << ")" << endl;
    }
    else if(kind == PARA){
        cout << i << "  " << "PARA " << types[type] << " " << name1 << endl;
    }
    else if(kind == PUSH){
        cout << i << "  " << "PUSH " << types[type] << " " << "parareg[" << value << "]" << " from reg[" << t1 << "]" << endl;
    }
    else if(kind == ASSIGN){
        cout << i << "  " << "ASSIGN " << types[type] << " " << name1 << " = " << "reg[" << value << "]" << endl;
    }
    else if(kind == ASSIGN_ARR){
        cout << i << "  " << "ASSIGN_ARR " << types[type] << " " << name1 << "[" << "reg[" << t1 << "]]" << " = " << "reg[" << value << "]" << endl;
    }
    else if(kind == JIA || temp.kind == JIAN || temp.kind == CHENG || temp.kind == CHU){
        cout << i << "  " << "reg[" << value << "] = " << "reg[" << t1 << "] " << kinds[kind] << " reg[" << t2 << "]" << endl;
    }
    else if(kind == FACTOR_CON){
        cout << i << "  " << "FACTOR_CON " << types[type] << " " << t1 << " save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_VAR){
        cout << i << "  " << "FACTOR_VAR " << types[type] << " " << name1 << " save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_FUNC){
        cout << i << "  " << "FACTOR_FUNC " << types[type] << " " << name1 << " save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_ARRAY){
        cout << i << "  " << "FACTOR_ARRAY " << types[type] << " " << name1 << " [reg[" << t1 << "]] save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_EXPR){
        cout << i << "  " << "FACTOR_EXPR " << "reg[" << t1 << "] save in reg[" << value << "]" << endl;
    }
    else if(kind == BEQ || temp.kind == BNE || temp.kind == BGTR || temp.kind == BGEQ || temp.kind == BLSS || temp.kind == BLEQ){
        cout << i << "  " << "IF " << "reg[" << t1 << "] " << kinds[temp.kind] << " reg[" << t2 << "] THEN GOTO " << temp.name1 << endl;
    }
    else if(kind == JUMP){
        cout << i << "  " << "JUMP to " << temp.name1 << endl;
    }
    else if(kind == READ){
        cout << i << "  " << "READ " << types[type] << " " << name1 << endl;
    }
    else if(kind == WRITE){
        if(type == STR){
            cout << i << "  " << "WRITE " << name1 << endl;
        }
        else{
            cout << i << "  " << "WRITE " << types[type] << " reg[" << value << "]" << endl;
        }
    }
    else if(kind == RETURN){
        cout << i << "  " << "RETURN reg[" << t1 << "] TO $V0 AND THEN GOTO " << value << endl;
    }
    else if(kind == LABEL){
        cout << i << "  " << temp.name1 << "    ----------------Label----------------" << endl;
    }
}

void fprint_singlemidcode(int i){
    midcode temp = midtab.midcodes[i];
    midcode_kind kind = temp.kind;
    midcode_type type = temp.type;
    char name1[LINEL];
    char name2[LINEL];
    strcpy(name1,temp.name1);
    strcpy(name2,temp.name2);
    int value = temp.value;
    int t1 = temp.t1;
    int t2 = temp.t2;
    if(kind == CONST){
        fout << "#------------" << i << "  " << "CONST " << types[type] << " " << name1 << " = " << value << endl;
    }
    else if(kind == VAR){
        fout << "#------------" << i << "  " << "VAR " << types[type] << " " << name1 << endl;
    }
    else if(kind == ARRAY){
        fout << "#------------" << i << "  " << "ARRAY " << types[type] << " " << name1 << "[" << value << "]" << endl;
    }
    else if(kind == FUNC){
        fout << "#------------" << i << "  " << "FUNC " << types[type] << " " << name1 << "(" << value << ")" << endl;
    }
    else if(kind == CALL){
        fout << "#------------" << i << "  " << "CALL " << types[type] << " " << name1 << "(" << value << ")" << endl;
    }
    else if(kind == PARA){
        fout << "#------------" << i << "  " << "PARA " << types[type] << " " << name1 << endl;
    }
    else if(kind == PUSH){
        fout << "#------------" << i << "  " << "PUSH " << types[type] << " " << "parareg[" << value << "]" << " from reg[" << t1 << "]" << endl;
    }
    else if(kind == ASSIGN){
        fout << "#------------" << i << "  " << "ASSIGN " << types[type] << " " << name1 << " = " << "reg[" << value << "]" << endl;
    }
    else if(kind == ASSIGN_ARR){
        fout << "#------------" << i << "  " << "ASSIGN_ARR " << types[type] << " " << name1 << "[" << "reg[" << t1 << "]]" << " = " << "reg[" << value << "]" << endl;
    }
    else if(kind == JIA || temp.kind == JIAN || temp.kind == CHENG || temp.kind == CHU){
        fout << "#------------" << i << "  " << "reg[" << value << "] = " << "reg[" << t1 << "] " << kinds[kind] << " reg[" << t2 << "]" << endl;
    }
    else if(kind == FACTOR_CON){
        fout << "#------------" << i << "  " << "FACTOR_CON " << types[type] << " " << t1 << " save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_VAR){
        fout << "#------------" << i << "  " << "FACTOR_VAR " << types[type] << " " << name1 << " save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_FUNC){
        fout << "#------------" << i << "  " << "FACTOR_FUNC " << types[type] << " " << name1 << " save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_ARRAY){
        fout << "#------------" << i << "  " << "FACTOR_ARRAY " << types[type] << " " << name1 << " [reg[" << t1 << "]] save in reg[" << value << "]" << endl;
    }
    else if(kind == FACTOR_EXPR){
        fout << "#------------" << i << "  " << "FACTOR_EXPR " << "reg[" << t1 << "] save in reg[" << value << "]" << endl;
    }
    else if(kind == BEQ || temp.kind == BNE || temp.kind == BGTR || temp.kind == BGEQ || temp.kind == BLSS || temp.kind == BLEQ){
        fout << "#------------" << i << "  " << "IF " << "reg[" << t1 << "] " << kinds[temp.kind] << " reg[" << t2 << "] THEN GOTO " << temp.name1 << endl;
    }
    else if(kind == JUMP){
        fout << "#------------" << i << "  " << "JUMP to " << temp.name1 << endl;
    }
    else if(kind == READ){
        fout << "#------------" << i << "  " << "READ " << types[type] << " " << name1 << endl;
    }
    else if(kind == WRITE){
        if(type == STR){
            fout << "#------------" << i << "  " << "WRITE " << name1 << endl;
        }
        else{
            fout << "#------------" << i << "  " << "WRITE " << types[type] << " reg[" << value << "]" << endl;
        }
    }
    else if(kind == RETURN){
        fout << "#------------" << i << "  " << "RETURN reg[" << t1 << "] TO $V0 AND THEN GOTO " << value << endl;
    }
    else if(kind == LABEL){
        fout << "#------------" << i << "  " << temp.name1 << "    ----------------Label----------------" << endl;
    }
}

#endif // SIYUANSHI_H_INCLUDED
