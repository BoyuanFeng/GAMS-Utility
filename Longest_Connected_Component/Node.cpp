#include <vector>
#include <string>
#include "Node.h"


using namespace std;


/*
 * Node class
 *
 * A node is a point on a graph that may be connected to other nodes.
 * A node's connection to other graphs is defined by 2 vectors
 * with pointers to other nodes, one of nodes pointing to it,
 * and one with nodes which it points to. Nodes also have
 * a unique number which serves as a method of identification,
 * as well as a boolean which signifies whether or not it has beend
 * scanned over in a search.
 */



//Constructor
Node::Node(int num, bool mark) {
	number = num;
	next = new vector<Node*>;
	prev = new vector<Node*>;
	marked = mark;
};

//Destructor
Node::~Node() {
	delete next;
	delete prev; 
      
};


//Accessor Functions
int Node::getNum() 
{
	return number;

};

bool Node::getMark()
{
	return marked;

};

//Setter Function
void Node::setMark(bool m)
{

	marked = m;
};
