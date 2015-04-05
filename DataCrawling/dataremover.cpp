#include<iostream>
#include<vector>
#include<fstream>
#include<string>
#include<cstring>

using namespace std;

int main()
{
	ifstream myfile;
	ofstream myf2;
	string s1, s2;
	cout << "enter the input and output file name in txt format" << endl;
	getline(cin, s1);
	getline(cin, s2);
	myf2.open(s2.c_str());
	myfile.open(s1.c_str());
	string line;
	while(getline(myfile, line)){
		string str = "";
		int j = 0;
		for(int i = 0; i < line.size(); i++){
			if(line[i] != ',' && line[i] != '\"' && line[i] != '\''){
				str += line[i];
				j++;
			}
		}
		str += "\n";
		myf2 << str;
	}
	return 0;
}
