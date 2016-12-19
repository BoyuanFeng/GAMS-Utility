#ifndef NODE_H
#define NODE_H


#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <string>


using namespace std;

class Node
{
        public:
            Node(int num, bool mark);
            ~Node();
            vector <Node*>* next;
            vector <Node*>* prev;
	
			int getNum();
			bool getMark();
			void setMark(bool m);


	private:
		
		int number;
		bool marked;

};


#endif

