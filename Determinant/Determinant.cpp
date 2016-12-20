#include <iostream>			//Could only be compiled in C++11, because of the stod function.
#include <vector>
#include <fstream>
#include <string>
#include <cmath>
using namespace std;

double det(double A[], int n) {			//A is a 2d array with n*n.
	double result = 0;
	int sign = -1;
	const int Length = n-1;
	double M[Length*Length];
	double multiplier;
	if(n == 1)
		return A[0];
	for(int j = 0; j < n; ++j ) {
		sign = sign*(-1);
		
		//Define the cofactor
		int k,l;
		
		
		for(k = 0; k < n-1; ++k) {
			for(l = 0; l < j; ++l){
				M[k*Length+l] = A[(k+1)*n+l];
			}
		}
		for(k = 0; k < n-1; ++k) {
			for(l = j; l < n-1; ++l) {
				M[k*Length+l] = A[(k+1)*n+l+1];
			}
		}	
		multiplier = det(M,Length);
		result += sign*A[j]*multiplier;		
	}
	return result;
}

void PrintDataIntoFile(string FileName, double Result) {
	ofstream myfile;
	myfile.open (FileName);
	myfile << "scalar Result /" << Result << "/;";
	myfile.close();
}

void PrintDataIntoFile1() {
	ofstream myfile;
	string FileName = "Test1.gms";
	myfile.open (FileName);
	myfile << "$include data.inc" << endl << "execute_unload 'Result.gdx', Result;";
	myfile.close();
}


struct Element{
	string ColName;
	string RowName;
	double NumDouble;	
};

Element Parse(string data) {	//Expected data format: "SEATTLE     NEW-YORK            2.50"
	Element ElementInstance;

	string ColName,RowName, Num;
	int begin, end;
	begin = 0;
	for(end = begin; data[end] != ' '; ++end) {
		RowName += data[end];
	}
	begin = end;
	while(data[begin] == ' ') 
		++begin;
	for(end = begin; data[end] != ' '; ++end) {
		ColName += data[end];
	}
	begin = end;
	while(data[begin] == ' ') 
		++begin;
	for(end = begin; data[end] != '\0'; ++end) {
		Num += data[end];
	}
		
	double NumDouble = stod (Num);		//Function in C++11 std library.

	ElementInstance.ColName = ColName;
	ElementInstance.RowName = RowName;
	ElementInstance.NumDouble = NumDouble;
	
	return ElementInstance;
}

void PrintElement(Element ElementInstance) {
	cout << "RowName = " << ElementInstance.RowName << "   " << "ColName = " << ElementInstance.ColName << "   " 
		<< "Number = " << ElementInstance.NumDouble << endl;	
}

vector<Element> GetDataFromFile(char *FileName) {
	vector<Element> VectorElement;
	string line;
	ifstream myfile (FileName);
	while (getline(myfile,line)) {
		Element ElementInstance = Parse(line);
		VectorElement.push_back(ElementInstance);
	}
	myfile.close();
	return VectorElement;
}

int main()
{
	PrintDataIntoFile1();
	char FileName[] = "results.txt";
	vector<Element> VectorElement = GetDataFromFile(FileName);
	const int n = VectorElement.size();
	double a[n];
	for(int i = 0; i < n; ++i) {
		a[i] = VectorElement[i].NumDouble;
	}
	
	
	const int Length = sqrt(n);
	if(abs(sqrt(n)-Length) > 0.1){
		cout << "Not N*N!!!" << endl;
	} else {
		double result = det(a,Length);
		PrintDataIntoFile("data.inc",result);
	}
	return 0;
}