#include <iostream>
#include <vector>
#include <cmath>
#include <fstream>
#include <string>
using namespace std;


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


void Check(vector<vector<double>> data, const int k)
{
	try {
		if(data.size() < k) {
			throw 20;
		}
	}
	catch (int param) { cout << "Number of vectors is less than number of categories!"; }
}

void PrintVector(vector<double> x)
{
	for(int i = 0; i<x.size();++i){
		cout << x[i] << endl;
	}
}

double distance(vector<double> x, vector<double>y, const int Length)
{
	double summation = 0;
	for(int i = 0; i < Length; ++i){
		summation += (x[i] - y[i])*(x[i] - y[i]);
	}
	summation = sqrt(summation);
	return summation;	
}

vector<vector<double>> ReadIn(int &Length, int &n) {
	char FileName[] = "KMeanClusterResults.txt";
	vector<Element> VectorElement = GetDataFromFile(FileName);
	const int Size = VectorElement.size();
	vector<string> rowname;
	vector<string> colname;
	for(int i = 0;i<Size;++i) {
		if(VectorElement[i].RowName == VectorElement[0].RowName) {
			colname.push_back(VectorElement[i].ColName);
		}
	}
	Length = colname.size();
	for(int i = 0;i*Length < Size; ++i) {
		rowname.push_back(VectorElement[i*Length].RowName);
	}
	n = rowname.size();
	
	vector<vector<double>> data;
	vector<double> Temp;
	for(int i = 0; i<n; ++i) {
		Temp = {};
		for(int j = 0; j<Length; ++j) {
			Temp.push_back(VectorElement[i*Length+j].NumDouble);
		}
		data.push_back(Temp);
	}
	return data;	
}

int GetCategory(vector<double> x, vector<vector<double>> Category, const int k, const int Length)
{
	int SmallI = 0;
	double SmallDistance = 100000000;
	for(int i = 0; i<k; ++i) {
		double d = distance(x,Category[i],Length);
		if(d<SmallDistance){
			SmallI = i;
			SmallDistance = d;
		}
	}
	return SmallI;
}

void PrintIndex(vector<vector<int>> Index, const int k)
{
	for(int j = 0; j<k; ++j) {
	cout << "The category " << j << " contains:" << endl;
		for(int i = 0; i< Index[j].size(); ++i){
			cout << Index[j][i] << endl;
		}
	}
}

vector<vector<double>> InitializeCategory (vector<vector<double>> data, const int k) 
{
	vector<vector<double>> Category;
	for(int i = 0; i<k; ++i){
		Category.push_back(data[i]);
	}
	return Category;	
}

vector<vector<int>> SeparateAll_Index(vector<vector<double>> data, vector<vector<double>> Category,const int k, const int Length, const int n)
{
	vector<vector<int>> Index;
	vector<int> Temp = {};
	for(int i = 0; i< k; ++i){
		Index.push_back(Temp);
	}
	for(int i = 0; i<n; ++i){
		int j = GetCategory(data[i],Category,k,Length);
		Index[j].push_back(i);
	}
	return Index;
}

vector<double> Mean(const int n, const int Length,vector<vector<double>> data)
{
	vector<double> z;
	double Temp;
	for(int i = 0; i < Length; ++i){
		Temp = 0;
		for(int j = 0; j < n; ++j) {
			Temp += data[j][i]; 		
		}
		Temp = Temp/n;
		z.push_back(Temp);
	}
	return z;
}

//Category is used to store the mean of each category
vector<vector<double>> GetNewCategory(vector<vector<double>> data, vector<vector<int>> Index, int k, int Length, int n)
{
	vector<vector<double>> Category;
	vector<vector<double>> Temp;
	vector<double> mmean;
	for(int i =0; i<k; ++i){
		Temp = {};
		int Temp1;
		for(int j = 0; j < Index[i].size(); ++j) {
			Temp1 = Index[i][j];
			Temp.push_back(data[Temp1]);
		}
		mmean = Mean(Temp.size(),Length,Temp);
		Category.push_back(mmean);
	}
	return Category;
}

void GetK(int &k){
	char FileName[] = "KMeanClusterNum.txt";
	ifstream myfile (FileName);
	string line;

	/*
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
	*/
	
	getline(myfile,line);
	k = stoi(line);
	myfile.close();
}


void PrintDataIntoFile(string FileName, vector<vector<int>> NewIndex) {
	ofstream myfile;
	myfile.open (FileName);
	int k = NewIndex.size();
	
	//set Category1(KMeanClusterI) /1,2,3/;

	for(int i = 0; i<k; ++i) {
		myfile << "set Category" << i << "(KMeanClusterI) /";
		for(int j = 0; j<NewIndex[i].size()-1; ++j) {
			myfile << NewIndex[i][j] << ",";
		}
		myfile << NewIndex[i][NewIndex[i].size()-1] << "/;\n";
	}
	myfile.close();
}

void PrintDataIntoFile1() {
	ofstream myfile;
	string FileName = "Test1.gms";
	myfile.open (FileName);
	myfile << "$include data.inc" << endl << "execute_unload 'Result.gdx', Result;";
	myfile.close();
}

int main()
{
	int k,Length,n;
	GetK(k);
	
	vector<vector<double>> data = ReadIn(Length,n);
	
	Check(data, k);
	
	vector<vector<double>> Category = InitializeCategory(data,k);
	
	vector<vector<int>> NewIndex = SeparateAll_Index(data,Category,k,Length,n);
	vector<vector<int>> OldIndex = {{}};
	
	
	while(1) {
		if(NewIndex == OldIndex) {
			break;
		}
		if(NewIndex != OldIndex) {
			OldIndex = NewIndex;
			NewIndex = SeparateAll_Index(data,Category,k,Length,n);
			Category = GetNewCategory(data, NewIndex, k, Length, n);
		}
	}
	
	PrintDataIntoFile("KMeanClusterData.txt",NewIndex);
	
	
	
	return 0;
}