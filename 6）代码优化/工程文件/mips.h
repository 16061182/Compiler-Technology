//默认每个函数末尾都有return语句
#ifndef MIPS_H_INCLUDED
#define MIPS_H_INCLUDED

#include<iostream>
#include<string.h>
#include<fstream>
#include "define.h"
#include "cifafenxi.h"
#include "yufafenxi.h"
#include "siyuanshi.h"
using namespace std;
#define KIND_FUNCPARA 1//函数的参数，包括传入的参数和定义的变量
#define KIND_FACTOR 2//计算表达式等时使用的临时值

/*typedef struct{
    char name[IDENL];
    int kind;
    int type;
    int offset;//相对于运行栈栈底的偏移
}mark;
typedef struct{
    mark marks[MAXYUNXINGZHAN];//运行栈
    int index;//索引
    int offset;//相对于运行栈栈底的偏移
    //char func_name_tab[IDENL];//函数名表
    //int func_index_tab[IDENL];//函数的第一个参数相对于运行栈栈底的偏移
    //int func_num;//运行栈中保存的函数的数量
}yunxingzhan;

yunxingzhan STACK;
int reg_to_mem[MAXMIDCODETAB];//四元式寄存器到内存映射表*/

/*int enterstack(int i,int _kind){
    midcode mc = midtab.midcodes[i];
    char _name[IDENL];
    strcpy(_name,mc.name1);
    int _type = mc.type;

    int i = STACK.index;
    strcpy(STACK.marks[i].name,_name);
    STACK.marks[i].kind = _kind;
    STACK.marks[i].type = _type;
    STACK.marks[i].offset = STACK.offset;
    STACK.index ++;
    STACK.offset += 4;//相对$sp
    return STACK.offset - 4;
}*/

/*int func_offset;//当前函数第一个参数相对$sp的偏移
void setfunc_offset(){
    func_offset = STACK.offset;//记录当前函数第一个参数的偏移
}*/
/*void enterfuncname(char *_name){
    int i = STACK.func_num;
    strcpy(STACK.func_name_tab[i],name);//记录函数名表
    STACK.func_index_tab[i] = STACK.offset;//记录偏移量表
}*/

/*void getoffset(char *_name){//根据参数的名称获得参数的偏移
    int i;
    for(i=func_offset/4;i<STACK.index;i++){
        if(strcmp(_name,STACK.marks[i].name) == 0){//找到因子（若是数组的话则找到[0]项的偏移）
            return STACK.marks[i].offset;
        }
    }
    return -1;
}*/

char current_funcname[IDENL];//当前分析到的四元式所属函数的名称
int current_paraoffset;//当前函数参数空间之后的栈位置
int current_stacktop;//当前的符号栈的栈顶（已经有值，-4获得最新空位置）
int first_para;//函数调用的第一个参数标志
int first_para_offset;//函数调用第一个参数的偏移
int not_first_func = 0;//非第一个函数标志（第一个参数前没有jr $ra）



void generatemips(){
    int i;
    fout << ".data" << endl;

    /*跳过常量定义、变量定义、数组定义
    */
    for(i = 0;midtab.midcodes[i].kind == CONST || midtab.midcodes[i].kind == VAR || midtab.midcodes[i].kind == ARRAY;i++){ ; }

    /*打印全局变量声明和字符串常量声明
    * var_a: .word 0
    * var_beq_4706: .space 40
    */
    int ans;
    for(ans = 0;ans < extern_var_index;ans++){
        if(extern_vars[ans].kind == KIND_VAR){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,extern_vars[ans].name);//var_beq_4706_1
            fout << "   " << name << ": .word " << 0 << endl;
        }
        else if(extern_vars[ans].kind == KIND_ARRAY){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,extern_vars[ans].name);
            /*char no[MIPS_IDENL];
            string per = to_string(extern_vars[ans].arraysize*4);
            strcpy(no,per.c_str());*/
            //itoa(extern_vars[ans].arraysize*4,no,10);//需要申请的空间大小
            fout << "   " << name << ": .space " << extern_vars[ans].arraysize*4 << endl;//在堆中申请空间
        }
    }

    /*打印字符串常量声明*/
    for(ans = 0;ans < str_con_index;ans++){
        char name[MIPS_IDENL] = {'.','s','t','r','_'};
        char no[MIPS_IDENL];
        string per = to_string(ans);
        strcpy(no,per.c_str());
        //itoa(ans,no,10);
        strcat(name,no);
        char str[LINEL];
        memset(str,65,sizeof(str));
        int j,k=0;
        for(j=0;j<strlen(str_cons[ans]);j++){
            if(str_cons[ans][j] != '\\'){//不是反斜杠
                str[k++] = str_cons[ans][j];
            }
            else{//是反斜杠
                str[k++] = '\\';//多加一个反斜杠
                str[k++] = str_cons[ans][j];
            }
        }
        str[k] = '\0';//加上结束符
        //cout << str  << " len is " << strlen(str) << endl;
        fout << "   " << name << ": .asciiz \"" << str << "\"" << endl;
    }

    /*跳转到main函数*/
    fout << ".text" << endl;
    fout << "   jal .func_main" << endl;
    fout << "   j end" << endl;

    /*各种函数的定义*/
    int startpoint = i;
    for(;i < midtab.index;i++){
        midcode mid = midtab.midcodes[i];
        fprint_singlemidcode(i);//打印四元式信息
        /*函数定义*/
        if(mid.kind == FUNC){
            if(not_first_func){//不等于0，从第二个函数开始
                fout << "   jr $ra" << endl;
                fout << endl;
            }
            not_first_func = 1;
            char name[MIPS_IDENL] = {'.','f','u','n','c','_'};
            strcat(name,mid.name1);//加上前缀
            fout << name << ":" << endl;
            strcpy(current_funcname,mid.name1);//记录当前函数名称以便获取参数偏移
            current_paraoffset = get_funcend(current_funcname);//获取当前函数临时数据区开始的地址
            current_stacktop = current_paraoffset;
        }
        /*变量因子*/
        else if(mid.kind == FACTOR_VAR){
            int para_offset = get_para_offset(current_funcname,mid.name1,0);//获取参数在栈空间的偏移
            fout << "   lw $t3 " << para_offset << "($sp)" << endl;
            int save_offset = current_paraoffset - mid.value*4;
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*外部变量因子*/
        else if(mid.kind == FACTOR_VAR_EXTERN){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//获得变量的label
            fout << "   lw $t3 " << name << endl;
            int save_offset = current_paraoffset - mid.value*4;
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*常量因子*/
        else if(mid.kind == FACTOR_CON){
            int para_value = mid.t1;
            fout << "   li $t0 " << para_value << endl;
            int save_offset = current_paraoffset - mid.value*4;
            fout << "   sw $t0 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*数组因子*/
        else if(mid.kind == FACTOR_ARRAY){
            int index_offset = current_paraoffset - mid.t1 * 4;//获取下标位置
            fout << "   lw $t3 " << index_offset << "($sp)" << endl;
            fout << "   sll $t3 $t3 2" << endl;//数组下标乘4
            fout << "   sub $t3 $sp $t3" << endl;
            int array_offset = get_para_offset(current_funcname,mid.name1,0);//获取数组位置
            fout << "   lw $t3 " << array_offset << "($t3)" << endl;
            int save_offset = current_paraoffset - mid.value * 4;//获取存储位置
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*外部数组因子*/
        else if(mid.kind == FACTOR_ARRAY_EXTERN){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//数组空间的label
            int index_offset = current_paraoffset - mid.t1 * 4;//获取下标位置
            fout << "   lw $t3 " << index_offset << "($sp)" << endl;
            fout << "   sll $t3 $t3 2" << endl;
            fout << "   lw $t3 " << name << "($t3)" << endl;//$t3读到数组元素的值
            int save_offset = current_paraoffset - mid.value * 4;//获取存储位置
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*函数因子*/
        else if(mid.kind == FACTOR_FUNC){
            int v0_offset = current_paraoffset - mid.value * 4;
            fout << "   sw $v0 " << v0_offset << "($sp)" << endl;
            current_stacktop = v0_offset;
        }
        /*表达式因子*/
        else if(mid.kind == FACTOR_EXPR){
            int value_offset = current_paraoffset - mid.t1 * 4;//表达式值的偏移
            fout << "   lw $t0 " << value_offset << "($sp)" << endl;
            int save_offset = current_paraoffset - mid.value * 4;//因子存储位置
            fout << "   sw $t0 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*跳转指令*/
        else if(mid.kind == BGEQ || mid.kind == BGTR || mid.kind == BLEQ || mid.kind == BLSS || mid.kind == BEQ || mid.kind == BNE){
            char t0[10],t1[10];
            if(mid.t1 != 0){
                int offset_1 = current_paraoffset - mid.t1 * 4;
                fout << "   lw $t0 " << offset_1 << "($sp)" << endl;
                strcpy(t0,"$t0");
            }
            else{
                strcpy(t0,"$0");//t1为0代表0号寄存器
            }
            if(mid.t2 != 0){
                int offset_2 = current_paraoffset - mid.t2 * 4;
                fout << "   lw $t1 " << offset_2 << "($sp)" << endl;
                strcpy(t1,"$t1");
            }
            else{
                strcpy(t1,"$0");
            }

            switch(mid.kind){
                case BGEQ: fout << "    bge " << t0 << " " << t1 << " " << mid.name1 << endl; break;
                case BGTR: fout << "    bgt " << t0 << " " << t1 << " " << mid.name1 << endl; break;
                case BLEQ: fout << "    ble " << t0 << " " << t1 << " " << mid.name1 << endl; break;
                case BLSS: fout << "    blt " << t0 << " " << t1 << " " << mid.name1 << endl; break;
                case BEQ:  fout << "    beq " << t0 << " " << t1 << " " << mid.name1 << endl; break;
                case BNE:  fout << "    bne " << t0 << " " << t1 << " " << mid.name1 << endl; break;
                default: break;
            }
        }
        /*返回语句*/
        else if(mid.kind == RETURN){
            int para_offset = current_paraoffset - mid.t1 * 4;
            fout << "   lw $v0 " << para_offset << "($sp)" << endl;
            fout << "   jr $ra" << endl;
        }
        /*无条件跳转*/
        else if(mid.kind == JUMP){
            fout << "   j " << mid.name1 << endl;
        }
        /*标签*/
        else if(mid.kind == LABEL){
            fout << mid.name1 << ":" << endl;
        }
        /*加减乘除*/
        else if(mid.kind == JIA || mid.kind == JIAN || mid.kind == CHENG || mid.kind == CHU){
            int offset_1 = current_paraoffset - mid.t1 * 4;
            fout << "   lw $t0 " << offset_1 << "($sp)" << endl;
            int offset_2 = current_paraoffset - mid.t2 * 4;
            fout << "   lw $t1 " << offset_2 << "($sp)" << endl;
            switch(mid.kind){
                case JIA:   fout << "   add $t2 $t0 $t1" << endl; break;
                case JIAN:  fout << "   sub $t2 $t0 $t1" << endl; break;
                case CHENG: fout << "   mult $t0 $t1" << endl;
                            fout << "   mflo $t2" << endl; break;
                case CHU:   fout << "   div $t0 $t1" << endl;
                            fout << "   mflo $t2" << endl; break;
                default:    break;
            }
            int save_offset = current_paraoffset - mid.value * 4;
            fout << "   sw $t2 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*PUSH*/
        else if(mid.kind == PUSH){
            if(first_para == 0){//是第一个参数
                fout << "   sw $ra " << current_stacktop - 4 << "($sp)" << endl;
                current_stacktop -= 4;
                first_para = 1;//设置标志位
                int expr_offset = current_paraoffset - mid.t1 * 4;
                fout << "   lw $t0 " << expr_offset << "($sp)" << endl;
                fout << "   sw $t0 " << current_stacktop - 4 << "($sp)" << endl;
                first_para_offset = current_stacktop - 4;//记录第一个参数的位置（新增栈的位置）
                current_stacktop -= 4;
            }
            else{
                int expr_offset = current_paraoffset - mid.t1 * 4;
                fout << "   lw $t0 " << expr_offset << "($sp)" << endl;
                fout << "   sw $t0 " << current_stacktop - 4 << "($sp)" << endl;
                current_stacktop -= 4;
            }
        }
        /*函数调用*/
        else if(mid.kind == CALL){
            char name[MIPS_IDENL] = {'.','f','u','n','c','_'};
            strcat(name,mid.name1);
            if(mid.value == 0){//函数没有参数，需要在这里生成sw $ra语句
                fout << "   sw $ra " << current_stacktop - 4 << "($sp)" << endl;
                fout << "   addi $sp $sp " << current_stacktop - 8 << endl;
                fout << "   jal " << name << endl;
                fout << "   subi $sp $sp " << current_stacktop - 8 << endl;
                fout << "   lw $ra " << current_stacktop - 4 << "($sp)" << endl;
            }
            else{
                fout << "   addi $sp $sp " << first_para_offset << endl;
                fout << "   jal " << name << endl;
                fout << "   subi $sp $sp " << first_para_offset << endl;
                fout << "   lw $ra " << first_para_offset + 4 << "($sp)" << endl;
                current_stacktop = first_para_offset + 8;//记录当前栈顶位置
                first_para_offset = 0;//重置第一个参数位置
                first_para = 0;//重置标志位
            }
        }
        /*赋值语句*/
        else if(mid.kind == ASSIGN){
            int value_offset = current_paraoffset - mid.value * 4;
            fout << "   lw $t3 " << value_offset << "($sp)" << endl;
            int save_offset = get_para_offset(current_funcname,mid.name1,0);//获取被赋值符号的位置
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
        }
        /*外部变量赋值语句*/
        else if(mid.kind == ASSIGN_EXTERN){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//数组空间的label
            int value_offset = current_paraoffset - mid.value * 4;
            fout << "   lw $t3 " << value_offset << "($sp)" << endl;
            fout << "   sw $t3 " << name << endl;
        }
        /*数组赋值语句*/
        else if(mid.kind == ASSIGN_ARR){
            int index_offset = current_paraoffset - mid.t1 * 4;//数组下标
            fout << "   lw $t0 " << index_offset << "($sp)" << endl;
            int expr_offset = current_paraoffset - mid.value * 4;
            fout << "   lw $t1 " << expr_offset << "($sp)" << endl;
            fout << "   sll $t0 $t0 2" << endl;//数组下标*4
            fout << "   sub $t0 $sp $t0" << endl;
            int array_offset = get_para_offset(current_funcname,mid.name1,0);//获取数组的偏移
            fout << "   sw $t1 " << array_offset << "($t0)" << endl;
        }
        /*外部数组赋值语句*/
        else if(mid.kind == ASSIGN_ARR_EXTERN){
            int index_offset = current_paraoffset - mid.t1 * 4;//数组下标
            fout << "   lw $t0 " << index_offset << "($sp)" << endl;
            int expr_offset = current_paraoffset - mid.value * 4;//表达式的值
            fout << "   lw $t1 " << expr_offset << "($sp)" << endl;
            fout << "   sll $t0 $t0 2" << endl;//数组下标*4
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//数组label
            fout << "   sw $t1 " << name << "($t0)" << endl;
        }
        /*写语句*/
        else if(mid.kind == WRITE){
            if(mid.type == STR){//打印字符串
                fout << "   li $v0 4" << endl;
                int ans = find_str_con(mid.name1);
                char name[MIPS_IDENL] = {'.','s','t','r','_'};
                char no[MIPS_IDENL];
                string per = to_string(ans);
                strcpy(no,per.c_str());
                //itoa(ans,no,10);
                strcat(name,no);//获得了字符串的代号
                fout << "   la $a0 " << name << endl;
                fout << "   syscall" << endl;
                if(mid.t2 != 1){//需要换行
                    fout << "   li $v0 11" << endl;
                    fout << "   li $a0 10" << endl;
                    fout << "   syscall" << endl;
                }

            }
            else if(mid.type == INT){
                fout << "   li $v0 1" << endl;
                int para_offset = current_paraoffset - mid.value * 4;
                fout << "   lw $a0 " << para_offset << "($sp)" << endl;
                fout << "   syscall" << endl;
                fout << "   li $v0 11" << endl;
                fout << "   li $a0 10" << endl;
                fout << "   syscall" << endl;
            }
            else if(mid.type == CHAR){
                fout << "   li $v0 11" << endl;
                int para_offset = current_paraoffset - mid.value * 4;
                fout << "   lw $a0 " << para_offset << "($sp)" << endl;
                fout << "   syscall" << endl;
                fout << "   li $v0 11" << endl;
                fout << "   li $a0 10" << endl;
                fout << "   syscall" << endl;
            }
        }
        /*读语句*/
        else if(mid.kind == READ){
            if(mid.type == INT){
                fout << "   li $v0 5" << endl;
            }
            else if(mid.type == CHAR){
                fout << "   li $v0 12" << endl;
            }
            fout << "   syscall" << endl;
            int para_offset = get_para_offset(current_funcname,mid.name1,0);//获取变量的偏移
            fout << "   sw $v0 " << para_offset << "($sp)" << endl;
        }
        /*外部变量读语句*/
        else if(mid.kind == READ_EXTERN){
            if(mid.type == INT){
                fout << "   li $v0 5" << endl;
            }
            else if(mid.type == CHAR){
                fout << "   li $v0 12" << endl;
            }
            fout << "   syscall" << endl;
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//获取变量标签
            fout << "   sw $v0 " << name << endl;
        }
        fout << endl;//每条语句后打印空行
    }
    fout << "   jr $ra" << endl;//main函数要跳回去
    fout << endl;
    fout << "end:" << endl;
}
#endif // MIPS_H_INCLUDED
