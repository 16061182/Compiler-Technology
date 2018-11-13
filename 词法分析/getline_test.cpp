#include<iostream>
#include<fstream>
using namespace std;
ifstream fin;
int main(){
	char word[50];
	fin.open("16061182_test.txt",ios::in);
	while(fin.getline(word,1024)!=NULL){
		puts(word);
	}
}
