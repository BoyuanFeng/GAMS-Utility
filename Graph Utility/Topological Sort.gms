$ontext
In this utility I want to implement the Topological Sort in the graph problem.
This concept is important in graph theory because once we can get a topological
sort of the graph then it induces that this graph is acyclic; Vicevisa.

$offtext

$include incidence& Adjacency matrix.gms

alias(v1,v);
set
vv;
vv(v) = yes;

Parameter
Q(v);

parameters
INCIDENCE(i,j,v);
INCIDENCE(i,j,v) = Inc.l(i,j,v);

scalar a /1/;
parameters b(i,j);

while(card(INCIDENCE)>0, loop(v$vv(v), loop((i,j), b(i,j)=INCIDENCE(i,j,v)); if(smin((i,j), b(i,j))>-1, Q(v)=a; loop((i,j)$arcs(i,j), if((ord(v)=ord(i))or(ord(v)=ord(j)), loop(v1, INCIDENCE(i,j,v1)=0))); vv(v)=no;  a=a+1 )););

display Q;

$ontext
The return parameters give us the order of the elements in the topological set.

$offtext






