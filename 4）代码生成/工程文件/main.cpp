/*待办事项
(0)四元式生成、#声明查重
(1)###（无需解决）标识符名称和预定义名称相同时，会直接视符号为预定义名称，因此应保证标识符名称和预定义名称不相同(相同则报错)
(2)#判断语句是函数调用语句还是赋值语句时，可以直接根据符号表中的参数名来判断。若此语句所在模块中，
	#在此语句之前有该IDEN的声明和赋值操作，那么即使定义了该IDEN函数，仍把同一模块中后面所有的IDEN视为变量而不是函数名（c语言特性）
(3)报错：数组赋值越界报错
(4)测试代码中没有（<表达式>）的出现
(5)测试代码中没有 外部变量因子、赋值、读的出现，需要构建外部变量表
*/

/*文法细节解读
(1)未赋值的char数组元素值为ascii0
(2)未赋值的int值为0
(3)未赋值的char值为ascii0
(4)此文法中，函数定义时的传入参数类型为普通变量（只有一个标识符，不可能是数组）
(5)此文法中，if等语句块中没有常量和变量的定义，因此常量和变量的level不会超过1，并且伴随着符号表的回退，形成了只要向上寻找就可以找到正确标识符的结构
(6)for语句头部的"＜标识符＞＝＜表达式＞"和"＜标识符＞＝＜标识符＞(+|-)＜步长＞"中的＜标识符＞只能是普通变量
(7)读语句中的标识符只能是普通标识符
(8)关于四元式和mips指令，目前有如下猜测：
        ＜条件＞    ::=  ＜表达式＞＜关系运算符＞＜表达式＞里的表达式是否要检查类型？
        目前默认for语句中的循环变量是int类型

(9)表达式的类型，如果是类似'c'的单个字符的话则为TYPE_CHAR，其他情况均为TYPE_INT
*/

/*
c语言语法细节解读
(1)标识符不管什么种类，总是寻找离当前位置最近的
(2)对应待办事项(1)，宏定义的符号出现在字符串中时，不将其转换为宏定义，因此不会影响标识符名称
(3)数组下标可以是char
*/

#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
#include"yufafenxi.h"
#include"siyuanshi.h"
#include"mips.h"
using namespace std;

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
	fout.open("16061182_result.asm",ios::out);
	fin.unsetf(ios::skipws);//取消忽略空白符
	setup();
	readfile();
	getch();
	getsym();
	program();

	print_str_con();
	cout << "--------------------" << endl;
	cout << get_firstpara("getint") << "    " << get_funcend("getint") << endl;
	cout << get_firstpara("getcha") << "    " << get_funcend("getcha") << endl;
	cout << get_firstpara("print1") << "    " << get_funcend("print1") << endl;
	cout << get_firstpara("print2") << "    " << get_funcend("print2") << endl;
	cout << get_firstpara("main") << "    " << get_funcend("main") << endl;
	cout << get_para_offset("print1","c",0) << endl;
	cout << get_para_offset("print1","var2",7) << endl;
	cout << get_para_offset("main","o",0) << endl;
	cout << para_offsets[0].name << "   " << para_offsets[1].name << endl;
	generatemips();

	fin.close();
	return 0;
}
