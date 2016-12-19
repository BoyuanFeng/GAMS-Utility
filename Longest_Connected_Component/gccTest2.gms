$ontext

Largest connected component test file # 2, testing with cycle in arcs

Written by: 
Nathanie Gale

$offtext


*IMPORTANT: Since .val set attribute only works
*with elements that are numbers, nodes must but defined as numbers

set nodes /1*20/;

alias (nodes, i, j);

set arcs(i,j)
/
1.4
4.8
8.17
17.12
12.18
18.2
2.1
/;

$batinclude lccMac.inc i arcs 'input.txt' 'output.txt'

