$ontext
In this utility I'm trying to write something for finding the minimum spanning tree on a
positive weighted graph. Actually this utility could been used to deal with problems not
only in undirected graph but also directed graph, as long as the nodes and edge sets are
well given and the root node is given in advance.
This utility is based on the Prim's algorithm.Other efficient algorithms are also encouraged.
$offtext

* input nodes and edges data
Set
v nodes in the graph /a,b,d,f,h,g,k/
;
alias(i,j,v);

Set
e(i,j) edges in the graph /a.b,b.d,a.d,b.h,d.h,d.g,a.g,a.f,g.f,h.k,g.k,f.k,h.g/
;
Set
s1(v) the nodes to be searched in the latter process  /b,d,f,h,g,k/
s(v)  the nodes have been searched in previous process /a/
s2(v)
;
s2(j)= s(j);


loop((i,j), e(i,j)$(e(j,i)) = yes);

parameters
c(i,j) /a.b 16,b.d 28,a.d 22,b.h 31,d.h 32,d.g 23,a.g 29,a.f 20,g.f 35,h.k 18,g.k 12,f.k 25,h.g 15/;

loop((i,j), c(i,j)$(c(j,i)) = c(j,i));


binary variables
x(i,j) denoting the flow is from node i to j
;

scalar a;
while(card(s)<card(v),
        a = smin((s,s1)$(c(s,s1)),c(s,s1));
        loop((s2,s1), s(s1)$(c(s2,s1)=a)=yes);
        x.fx(s,s1)$(c(s,s1)=a) = yes;
        s2(j)= s(j);
        loop((s,j),s1(j)$(c(s,j)=a)=no);
);



display x.l,s,s1,s2;








