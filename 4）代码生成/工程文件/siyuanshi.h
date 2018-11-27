#ifndef SIYUANSHI_H_INCLUDED
#define SIYUANSHI_H_INCLUDED
#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
using namespace std;

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
    char kinds[30][IDENL] = {//需要更新
        "CONST",
        "VAR",
        "ARRAY",
        "FUNC",
        "CALL",
        "PARA",
        "PUSH_CON",
        "PUSH_VAR",
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
        "JUMP"
    };
    char types[3][IDENL] = {
        "INT",
        "CHAR",
        "VOID"
    };
    /*for(i=0;i<midtab.index;i++){//打印四元式表内容
        cout << "   kind:" << kinds[_kind] << " type:" << types[_type] << " name1:" << _name1 << " name2:" << _name2 << " t1:" << _t1 << " t2:" << _t2 <<" value:" << _value << endl;
    }*/
}

#endif // SIYUANSHI_H_INCLUDED
