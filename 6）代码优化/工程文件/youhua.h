#ifndef YOUHUA_H_INCLUDED
#define YOUHUA_H_INCLUDED
#include<iostream>
#include<string.h>
#include<fstream>
#include "define.h"
#include "cifafenxi.h"
#include "yufafenxi.h"
#include "siyuanshi.h"
using namespace std;

/*//删除空四元式
void clean_midcode(){

}*/

//常量合并
void const_combine(){
    while(1){
        int flag = 0;
        int i;
        int funcnum = -1;//记录当前是第几个函数（以下标的形式表示）
        for(i = 0 ; i < midtab.index ; i++){
            midcode mid = midtab.midcodes[i];
            if(mid.kind == FUNC) funcnum++;
            if(mid.kind == JIA || mid.kind == JIAN || mid.kind == CHENG || mid.kind == CHU){
                if(reg_is_con[func_regnum[funcnum] + mid.t1] == KIND_CONST && reg_is_con[func_regnum[funcnum] + mid.t2] == KIND_CONST){//两个操作数都是常量
                    int op1 = reg_con_value[func_regnum[funcnum] + mid.t1];
                    int op2 = reg_con_value[func_regnum[funcnum] + mid.t2];
                    int result;
                    switch(mid.kind){
                        case JIA:  result = op1 + op2; break;
                        case JIAN: result = op1 - op2; break;
                        case CHENG:result = op1 * op2; break;
                        case CHU:  result = op1 / op2; break;
                        default: break;
                    }
                    //删除保存了原四元式左右两端操作数的FACTOR_CON类四元式
                    int j;
                    int flag_t1 = 0,flag_t2 = 0;
                    //if(mid.value == mid.t1) flag_t1 = 1;
                    //if(mid.value == mid.t2) flag_t2 = 1;
                    for(j=i-1;j>=0;j--){
                        midcode m = midtab.midcodes[j];
                        if(flag_t1 == 0 && m.kind == FACTOR_CON && m.value == mid.t1){
                            //删除左侧常量四元式
                            midtab.midcodes[j].kind = BLANK;
                            flag_t1 = 1;
                        }
                        if(flag_t2 == 0 && m.kind == FACTOR_CON && m.value == mid.t2){
                            //删除右侧常量四元式
                            midtab.midcodes[j].kind = BLANK;
                            flag_t2 = 1;
                        }
                        if(flag_t1 == 1 && flag_t2 == 1) break;//已经删除完
                    }

                    //更新四元式，把计算操作更新为常量因子（value域仍为保存的寄存器号）
                    midtab.midcodes[i].kind = FACTOR_CON;
                    midtab.midcodes[i].type = INT;
                    midtab.midcodes[i].t1 = result;//常量值
                    //更新标志位
                    reg_is_con[func_regnum[funcnum] + mid.value] = KIND_CONST;
                    reg_con_value[func_regnum[funcnum] + mid.value] = result;
                    //本次遍历有实际意义
                    flag = 1;
                }//if is const
            }//if mid.kind == JIA
        }//for
        if(flag == 0){//本次遍历没有找到可优化部分
            break;
        }
    }//while(1)
}


#endif // YOUHUA_H_INCLUDED
