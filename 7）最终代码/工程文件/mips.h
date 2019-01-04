//Ĭ��ÿ������ĩβ����return���
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
#define KIND_FUNCPARA 1//�����Ĳ�������������Ĳ����Ͷ���ı���
#define KIND_FACTOR 2//������ʽ��ʱʹ�õ���ʱֵ

/*typedef struct{
    char name[IDENL];
    int kind;
    int type;
    int offset;//���������ջջ�׵�ƫ��
}mark;
typedef struct{
    mark marks[MAXYUNXINGZHAN];//����ջ
    int index;//����
    int offset;//���������ջջ�׵�ƫ��
    //char func_name_tab[IDENL];//��������
    //int func_index_tab[IDENL];//�����ĵ�һ���������������ջջ�׵�ƫ��
    //int func_num;//����ջ�б���ĺ���������
}yunxingzhan;

yunxingzhan STACK;
int reg_to_mem[MAXMIDCODETAB];//��Ԫʽ�Ĵ������ڴ�ӳ���*/

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
    STACK.offset += 4;//���$sp
    return STACK.offset - 4;
}*/

/*int func_offset;//��ǰ������һ���������$sp��ƫ��
void setfunc_offset(){
    func_offset = STACK.offset;//��¼��ǰ������һ��������ƫ��
}*/
/*void enterfuncname(char *_name){
    int i = STACK.func_num;
    strcpy(STACK.func_name_tab[i],name);//��¼��������
    STACK.func_index_tab[i] = STACK.offset;//��¼ƫ������
}*/

/*void getoffset(char *_name){//���ݲ��������ƻ�ò�����ƫ��
    int i;
    for(i=func_offset/4;i<STACK.index;i++){
        if(strcmp(_name,STACK.marks[i].name) == 0){//�ҵ����ӣ���������Ļ����ҵ�[0]���ƫ�ƣ�
            return STACK.marks[i].offset;
        }
    }
    return -1;
}*/

char current_funcname[IDENL];//��ǰ����������Ԫʽ��������������
int current_paraoffset;//��ǰ���������ռ�֮���ջλ��
int current_stacktop;//��ǰ�ķ���ջ��ջ�����Ѿ���ֵ��-4������¿�λ�ã�
int first_para;//�������õĵ�һ��������־
int first_para_offset;//�������õ�һ��������ƫ��
int not_first_func = 0;//�ǵ�һ��������־����һ������ǰû��jr $ra��



void generatemips(){
    int i;
    fout << ".data" << endl;

    /*�����������塢�������塢���鶨��
    */
    for(i = 0;midtab.midcodes[i].kind == CONST || midtab.midcodes[i].kind == VAR || midtab.midcodes[i].kind == ARRAY;i++){ ; }

    /*��ӡȫ�ֱ����������ַ�����������
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
            //itoa(extern_vars[ans].arraysize*4,no,10);//��Ҫ����Ŀռ��С
            fout << "   " << name << ": .space " << extern_vars[ans].arraysize*4 << endl;//�ڶ�������ռ�
        }
    }

    /*��ӡ�ַ�����������*/
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
            if(str_cons[ans][j] != '\\'){//���Ƿ�б��
                str[k++] = str_cons[ans][j];
            }
            else{//�Ƿ�б��
                str[k++] = '\\';//���һ����б��
                str[k++] = str_cons[ans][j];
            }
        }
        str[k] = '\0';//���Ͻ�����
        //cout << str  << " len is " << strlen(str) << endl;
        fout << "   " << name << ": .asciiz \"" << str << "\"" << endl;
    }

    /*��ת��main����*/
    fout << ".text" << endl;
    fout << "   jal .func_main" << endl;
    fout << "   j end" << endl;

    /*���ֺ����Ķ���*/
    int startpoint = i;
    for(;i < midtab.index;i++){
        midcode mid = midtab.midcodes[i];
        fprint_singlemidcode(i);//��ӡ��Ԫʽ��Ϣ
        /*��������*/
        if(mid.kind == FUNC){
            if(not_first_func){//������0���ӵڶ���������ʼ
                fout << "   jr $ra" << endl;
                fout << endl;
            }
            not_first_func = 1;
            char name[MIPS_IDENL] = {'.','f','u','n','c','_'};
            strcat(name,mid.name1);//����ǰ׺
            fout << name << ":" << endl;
            strcpy(current_funcname,mid.name1);//��¼��ǰ���������Ա��ȡ����ƫ��
            current_paraoffset = get_funcend(current_funcname);//��ȡ��ǰ������ʱ��������ʼ�ĵ�ַ
            current_stacktop = current_paraoffset;
        }
        /*��������*/
        else if(mid.kind == FACTOR_VAR){
            int para_offset = get_para_offset(current_funcname,mid.name1,0);//��ȡ������ջ�ռ��ƫ��
            fout << "   lw $t3 " << para_offset << "($sp)" << endl;
            int save_offset = current_paraoffset - mid.value*4;
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*�ⲿ��������*/
        else if(mid.kind == FACTOR_VAR_EXTERN){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//��ñ�����label
            fout << "   lw $t3 " << name << endl;
            int save_offset = current_paraoffset - mid.value*4;
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*��������*/
        else if(mid.kind == FACTOR_CON){
            int para_value = mid.t1;
            fout << "   li $t0 " << para_value << endl;
            int save_offset = current_paraoffset - mid.value*4;
            fout << "   sw $t0 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*��������*/
        else if(mid.kind == FACTOR_ARRAY){
            int index_offset = current_paraoffset - mid.t1 * 4;//��ȡ�±�λ��
            fout << "   lw $t3 " << index_offset << "($sp)" << endl;
            fout << "   sll $t3 $t3 2" << endl;//�����±��4
            fout << "   sub $t3 $sp $t3" << endl;
            int array_offset = get_para_offset(current_funcname,mid.name1,0);//��ȡ����λ��
            fout << "   lw $t3 " << array_offset << "($t3)" << endl;
            int save_offset = current_paraoffset - mid.value * 4;//��ȡ�洢λ��
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*�ⲿ��������*/
        else if(mid.kind == FACTOR_ARRAY_EXTERN){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//����ռ��label
            int index_offset = current_paraoffset - mid.t1 * 4;//��ȡ�±�λ��
            fout << "   lw $t3 " << index_offset << "($sp)" << endl;
            fout << "   sll $t3 $t3 2" << endl;
            fout << "   lw $t3 " << name << "($t3)" << endl;//$t3��������Ԫ�ص�ֵ
            int save_offset = current_paraoffset - mid.value * 4;//��ȡ�洢λ��
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*��������*/
        else if(mid.kind == FACTOR_FUNC){
            int v0_offset = current_paraoffset - mid.value * 4;
            fout << "   sw $v0 " << v0_offset << "($sp)" << endl;
            current_stacktop = v0_offset;
        }
        /*���ʽ����*/
        else if(mid.kind == FACTOR_EXPR){
            int value_offset = current_paraoffset - mid.t1 * 4;//���ʽֵ��ƫ��
            fout << "   lw $t0 " << value_offset << "($sp)" << endl;
            int save_offset = current_paraoffset - mid.value * 4;//���Ӵ洢λ��
            fout << "   sw $t0 " << save_offset << "($sp)" << endl;
            current_stacktop = save_offset;
        }
        /*��תָ��*/
        else if(mid.kind == BGEQ || mid.kind == BGTR || mid.kind == BLEQ || mid.kind == BLSS || mid.kind == BEQ || mid.kind == BNE){
            char t0[10],t1[10];
            if(mid.t1 != 0){
                int offset_1 = current_paraoffset - mid.t1 * 4;
                fout << "   lw $t0 " << offset_1 << "($sp)" << endl;
                strcpy(t0,"$t0");
            }
            else{
                strcpy(t0,"$0");//t1Ϊ0����0�żĴ���
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
        /*�������*/
        else if(mid.kind == RETURN){
            int para_offset = current_paraoffset - mid.t1 * 4;
            fout << "   lw $v0 " << para_offset << "($sp)" << endl;
            fout << "   jr $ra" << endl;
        }
        /*��������ת*/
        else if(mid.kind == JUMP){
            fout << "   j " << mid.name1 << endl;
        }
        /*��ǩ*/
        else if(mid.kind == LABEL){
            fout << mid.name1 << ":" << endl;
        }
        /*�Ӽ��˳�*/
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
            if(first_para == 0){//�ǵ�һ������
                fout << "   sw $ra " << current_stacktop - 4 << "($sp)" << endl;
                current_stacktop -= 4;
                first_para = 1;//���ñ�־λ
                int expr_offset = current_paraoffset - mid.t1 * 4;
                fout << "   lw $t0 " << expr_offset << "($sp)" << endl;
                fout << "   sw $t0 " << current_stacktop - 4 << "($sp)" << endl;
                first_para_offset = current_stacktop - 4;//��¼��һ��������λ�ã�����ջ��λ�ã�
                current_stacktop -= 4;
            }
            else{
                int expr_offset = current_paraoffset - mid.t1 * 4;
                fout << "   lw $t0 " << expr_offset << "($sp)" << endl;
                fout << "   sw $t0 " << current_stacktop - 4 << "($sp)" << endl;
                current_stacktop -= 4;
            }
        }
        /*��������*/
        else if(mid.kind == CALL){
            char name[MIPS_IDENL] = {'.','f','u','n','c','_'};
            strcat(name,mid.name1);
            if(mid.value == 0){//����û�в�������Ҫ����������sw $ra���
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
                current_stacktop = first_para_offset + 8;//��¼��ǰջ��λ��
                first_para_offset = 0;//���õ�һ������λ��
                first_para = 0;//���ñ�־λ
            }
        }
        /*��ֵ���*/
        else if(mid.kind == ASSIGN){
            int value_offset = current_paraoffset - mid.value * 4;
            fout << "   lw $t3 " << value_offset << "($sp)" << endl;
            int save_offset = get_para_offset(current_funcname,mid.name1,0);//��ȡ����ֵ���ŵ�λ��
            fout << "   sw $t3 " << save_offset << "($sp)" << endl;
        }
        /*�ⲿ������ֵ���*/
        else if(mid.kind == ASSIGN_EXTERN){
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//����ռ��label
            int value_offset = current_paraoffset - mid.value * 4;
            fout << "   lw $t3 " << value_offset << "($sp)" << endl;
            fout << "   sw $t3 " << name << endl;
        }
        /*���鸳ֵ���*/
        else if(mid.kind == ASSIGN_ARR){
            int index_offset = current_paraoffset - mid.t1 * 4;//�����±�
            fout << "   lw $t0 " << index_offset << "($sp)" << endl;
            int expr_offset = current_paraoffset - mid.value * 4;
            fout << "   lw $t1 " << expr_offset << "($sp)" << endl;
            fout << "   sll $t0 $t0 2" << endl;//�����±�*4
            fout << "   sub $t0 $sp $t0" << endl;
            int array_offset = get_para_offset(current_funcname,mid.name1,0);//��ȡ�����ƫ��
            fout << "   sw $t1 " << array_offset << "($t0)" << endl;
        }
        /*�ⲿ���鸳ֵ���*/
        else if(mid.kind == ASSIGN_ARR_EXTERN){
            int index_offset = current_paraoffset - mid.t1 * 4;//�����±�
            fout << "   lw $t0 " << index_offset << "($sp)" << endl;
            int expr_offset = current_paraoffset - mid.value * 4;//���ʽ��ֵ
            fout << "   lw $t1 " << expr_offset << "($sp)" << endl;
            fout << "   sll $t0 $t0 2" << endl;//�����±�*4
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//����label
            fout << "   sw $t1 " << name << "($t0)" << endl;
        }
        /*д���*/
        else if(mid.kind == WRITE){
            if(mid.type == STR){//��ӡ�ַ���
                fout << "   li $v0 4" << endl;
                int ans = find_str_con(mid.name1);
                char name[MIPS_IDENL] = {'.','s','t','r','_'};
                char no[MIPS_IDENL];
                string per = to_string(ans);
                strcpy(no,per.c_str());
                //itoa(ans,no,10);
                strcat(name,no);//������ַ����Ĵ���
                fout << "   la $a0 " << name << endl;
                fout << "   syscall" << endl;
                if(mid.t2 != 1){//��Ҫ����
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
        /*�����*/
        else if(mid.kind == READ){
            if(mid.type == INT){
                fout << "   li $v0 5" << endl;
            }
            else if(mid.type == CHAR){
                fout << "   li $v0 12" << endl;
            }
            fout << "   syscall" << endl;
            int para_offset = get_para_offset(current_funcname,mid.name1,0);//��ȡ������ƫ��
            fout << "   sw $v0 " << para_offset << "($sp)" << endl;
        }
        /*�ⲿ���������*/
        else if(mid.kind == READ_EXTERN){
            if(mid.type == INT){
                fout << "   li $v0 5" << endl;
            }
            else if(mid.type == CHAR){
                fout << "   li $v0 12" << endl;
            }
            fout << "   syscall" << endl;
            char name[MIPS_IDENL] = {'.','v','a','r','_'};
            strcat(name,mid.name1);//��ȡ������ǩ
            fout << "   sw $v0 " << name << endl;
        }
        fout << endl;//ÿ�������ӡ����
    }
    fout << "   jr $ra" << endl;//main����Ҫ����ȥ
    fout << endl;
    fout << "end:" << endl;
}
#endif // MIPS_H_INCLUDED
