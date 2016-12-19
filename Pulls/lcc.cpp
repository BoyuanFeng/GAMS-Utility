/* FILE INFORMATION:
 * 
 * This program reads an input file (input.txt) containing 
 * a list of comma-separated connections between nodes, 
 * then calculates the largest connected component 
 * contained in the list of connections. This result 
 * will be printed stdout, as well as into an output 
 * file, output.txt.
 * 
 * 
 * OTHER ASSOCIATED FILES
 *
 * -Node.h, a header file declaring a class node 
 *  to be used when creating a connected graph
 * 
 * -Node.cpp, a .cpp file to implement the Node class
 * 
 * -lcc.inc (lccMac.inc or lccWin.inc), the file which calls 
 *  the executable compiled from this file, along with Node.cpp
 *
 * -Any .gms test/demo files
 * 
 * 
 *  REQUIREMENTS 
 * 
 * -Bash environment to run GAMS files & executables
 * -GAMS command line compiler to create input files
 * -C++ compiler (g++)  
 * -NOTE: input.txt is created and filled by GAMS code. 
 *  Because of this, it will only be possible to use 
 *  numbers to indicate nodes, as GAMS only allows set 
 *  values which are numbers to be printed using .val set 
 *  attribute. 
 *   
 *
 * Written by: Nathaniel Gale
 * 
 *
 */

#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <vector>
#include "Node.h"


using namespace std;

int main(int argc, char* argv[]) 
{
	//Allocate new vector, used to hold references to Nodes
	
	vector <Node*>* nodes = new vector<Node*>;
	
	//Set up I/O streams
		
	if (argc != 3) 
	{
		cerr << "Usage: lcc <input.txt> <output.txt>" << endl;
		exit(1);
	}

	ifstream input(argv[1]);
	
	string line;
	ofstream output;

	//Parse input file
	while (getline(input, line)) 
	{	
	
		char * lineMod = new char [line.length()+1];
 		
		strcpy(lineMod, line.c_str());
		
		char * p = strtok(lineMod, ",");

		int a = atoi(p);

		if (p != NULL) p = strtok(NULL, ",");		
		
		int b = atoi(p);

		bool isMadeA = false;
		bool isMadeB = false;		
		Node* n1;
		Node* n2;
		
		for (int i = 0; i < nodes->size(); i++)
		{	
				
			if (nodes->at(i)->getNum() == a) 
			{
				isMadeA = true;
				n1 = nodes->at(i);
			}
			else if (nodes->at(i)->getNum() == b) 
			{
				isMadeB = true;
				n2 = nodes->at(i);
			}
				
		}		
		
		if (isMadeA == false)
		{
			n1 = new Node(a, false);
			nodes->push_back(n1);
		}
			
		if (isMadeB == false)
		{	
			n2 = new Node(b, false);
			nodes->push_back(n2);
				 
		} 
		
		n1->next->push_back(n2);
		n2->prev->push_back(n1);

		delete[] lineMod;
		
	}	

	//Set up vectors to read input	

	vector <Node*> lcc;
	vector <Node*> nodesMarked;
	vector <Node*> connected;

	//A stack for largest connected components, if there is more than 1
        vector <vector <Node*> > lccStack;

	for (int i = 0; i < nodes->size(); i++) 
	{ 
		//Perform depth-first search to look for longest connected 
 		//component, repeat for each component 	
	
		nodesMarked.insert(nodesMarked.begin(), nodes->at(i));
		
		while (nodesMarked.size() > 0) 
		{
			
			Node* v = nodesMarked.at(0);
			
			nodesMarked.erase(nodesMarked.begin());

			if (v->getMark() == false)
			{
				v->setMark(true);
				connected.push_back(v);

				for (int j = 0; j < v->next->size(); j++) 
				{
					nodesMarked.insert(nodesMarked.begin(), 
					v->next->at(j));


				}
				//Mark previous nodes if not marked
				for (int k = 0; k < v->prev->size(); k++) 	
				{
					if (v->prev->at(k)->getMark() == false)
						nodesMarked.insert(nodesMarked.begin(),
						v->prev->at(k));

				}
			}
		}
		//Replace largest component with current one if larger
		if (connected.size() > lcc.size()) 
		{	
			lcc.clear();
			lccStack.clear();
			lcc = connected;
			lccStack.push_back(lcc);
			connected.clear();
		} 
		//If current component is the same size, add to stack
		else if (connected.size() == lcc.size())
		{	
			lccStack.push_back(connected);
			

		}
		
	
	}
	
	//Open output stream, print result to stdout, output file	
	//Use size of lccStack to determine if special case is present or not
	output.open(argv[2]);
	if (lccStack.size() > 1) 
	{
		cout << "There are multiple components of the same maximal size\n" << 
		"printing all:" << endl;
		output << "There are multiple components of the same maximal size\n" <<
		"printing all:" << endl;
		
		for (int i = 0; i < lccStack.size(); i++) 
		{
			for (int j = 0; j < lccStack.at(i).size(); j++)
			{
				if (j < lccStack.at(i).size() - 1)
				{
					output << lccStack.at(i).at(j)->getNum() << ", ";
					cout << lccStack.at(i).at(j)->getNum() << ", ";

				}
				else 
				{
					output << lccStack.at(i).at(j)->getNum() << endl;
					cout << lccStack.at(i).at(j)->getNum() << endl;
				}
			}
		}
	
	}
	else 
	{	

		cout << "Largest connected component:\n";
		output << "Largest connected component:\n";
        	for (int k = 0; k < lcc.size(); k++)
        	{
			if (k < lcc.size()-1)
			{
                        	output << lcc.at(k)->getNum() << ", ";
				cout << lcc.at(k)->getNum() << ", ";
                	}
			else
                	{
		        	output << lcc.at(k)->getNum() << endl;
				cout << lcc.at(k)->getNum() << endl;
			}
        	}
	}

	//Free allocated memory, close I/O streams

	output.close();
	input.close();

	for (int i = 0; i < nodes->size(); i++)
		delete nodes->at(i);

	
	delete nodes;

	return 0;
};





