/*待办事项
(0)四元式生成、声明查重
(1)标识符名称和预定义名称相同时，会直接视符号为预定义名称，因此应保证标识符名称和预定义名称不相同(相同则报错)
(2)判断语句是函数调用语句还是赋值语句时，可以直接根据符号表中的参数名来判断。若此语句所在模块中，
	在此语句之前有该IDEN的声明和赋值操作，那么即使定义了该IDEN函数，仍把同一模块中后面所有的IDEN视为变量而不是函数名（c语言特性）
*/

/*文法细节解读
(1)未赋值的char数组元素值为ascii0
(2)未赋值的int值为0
(3)未赋值的char值为ascii0
(4)此文法中，函数定义时的传入参数类型为普通变量（只有一个标识符，不可能是数组）
(5)此文法中，if等语句块中没有常量和变量的定义，因此常量和变量的level不会超过1
*/
#include<iostream>
#include<string.h>
#include<fstream>
#include"define.h"
#include"yufafenxi.h"
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
	fin.unsetf(ios::skipws);//取消忽略空白符
	setup();
	readfile();
	getch();
	getsym();
	program();

	fin.close();
	return 0;
}
