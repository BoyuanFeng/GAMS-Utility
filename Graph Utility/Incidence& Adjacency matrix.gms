$ontext
Given the nodes and arcs information of a graph, this utility would automatically generate
the corresponding adjacency matrix and the incidence matrix.

$offtext
Set
*v nodes /n1*n11/
*arcs(v,v) /n1.n4,n1.n7,n2.n1,n3.n1,n7.n4,n3.n2,n3.n5,n5.n2,n6.n3,n5.n6,n7.n6,n5.n8,
*n8.n9,n9.n5,n6.n9,n10.n9,n7.n10,n8.n11,n11.n10/
*;
v /a,b,d,g,f,h,i,j/
arcs(v,v) /b.a,d.a,a.f,d.f,i.b,d.i,d.g,g.f,j.b,i.j,i.g,h.g,h.j/
;
alias(i,j,v);

*********define the adjacency matrix and the incidence matrix********
parameters
Adj(i,j)
;

parameters
Inc(v,i,j)
;

loop((i,j), if(arcs(i,j), Adj(i,j)=1));

display Adj;

loop(v, loop((i,j)$arcs(i,j), if(ord(v)=ord(i), Inc(i,j,v)=1); if(ord(v)=ord(j), Inc(i,j,v)=-1)));

display Inc;
