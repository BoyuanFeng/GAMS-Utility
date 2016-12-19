$ontext
Shortest dipath problem in a digraph. Based upon the Ford's alorithm.

$offtext
**************HERE I GIVE TWO DATA SET TO VERIFY THE EFFICIENCY OF THE ALGORITHM**********

*Set v nodes /n1,n2,n3,n4/; alias(i,j,v);Set arcs(i,j) /n1.n2,n1.n3,n3.n2,n2.n4/;
*parameters c(i,j) /n1.n2 3,n1.n3 1,n3.n2 1,n2.n4 2/,y(i) /n1 0,n2 100,n3 100,n4 100/,p(i);
Set v nodes /n1*n11/; alias(i,j,v);Set arcs(i,j)
/n1.n4,n1.n7,n2.n1,n3.n1,n7.n4,n3.n2,n3.n5,n5.n2,n6.n3,n5.n6,n7.n6,n5.n8,
n8.n9,n9.n5,n6.n9,n10.n9,n7.n10,n8.n11,n11.n10/;
parameters c(i,j)
/n1.n4 13,n1.n7 2,n2.n1 1,n3.n1 25,n7.n4 12,n3.n2 2,n3.n5 30,n5.n2 5,n6.n3 11,n5.n6 4,n7.n6 17,n5.n8 14,
n8.n9 3,n9.n5 15,n6.n9 9,n10.n9 8,n7.n10 8,n8.n11 6,n11.n10 7/ ,
y(i),p(i);

y('n1') = 0;
y(i)$(ord(i)>1) = 1000;
p('n1') = 0;
p(i)$(ord(i)>1) = -1;

scalar k /0/;

while(k<card(v), k = k+1;
loop((i,j)$arcs(i,j), if(y(i)+c(i,j) < y(j), p(j) = ord(i); y(j) = y(i)+c(i,j)));
);

display p;


















