$ontext
Shortest path with unit cost algorithm: Breadth-first search. Finding the shortest
distance(number of arcs in the path) from the root node to any other node.
In this utility I give, in the end I get p and x. P denoting the predecessor of this
current vetex; Binary matrix denoting whether the corresponding arc in the digraph is
in the spanning tree generated from the shortest path problem.
$offtext

*****input the graph data
Set
v nodes /n1*n11/
arcs(v,v) /n1.n4,n1.n7,n2.n1,n3.n1,n7.n4,n3.n2,n3.n5,n5.n2,n6.n3,n5.n6,n7.n6,n5.n8,
n8.n9,n9.n5,n6.n9,n10.n9,n7.n10,n8.n11,n11.n10/
s(v) root search nodes  /n1/
;
alias(i,j,v);
parameters
p(v) /n1 0,n2*n11 -1/
;

binary variables
x(i,j)
;

while(card(s)>0,loop(v$s(v), s(v)=no; loop(i, if(p(i)$(arcs(v,i))=-1, s(i)=yes; p(i)=ord(v);));););

display p;

loop((i,j), x.fx(i,j)$(p(i)=ord(j))=1);

display x.l;
