$ontext
Test file for largest connected component.
Creates a set of nodes and arcs between nodes,
Creates input/output files, calls executable.

NOTES:
-I/O files must be named input/output.txt.
-set containing arcs must be written to input.txt file in the manner
displayed below
-set of nodes must be given integer values in the same fashion as below

Written by:
Nathaniel Gale

$offtext

set nodes /1*25/;


alias(nodes,i,j);


set arcs(i,j)
/
1.2,
2.3,
3.4,
4.5,
5.6,
6.7,
7.8,
9.10,
10.11,
11.12,
9.12
/;

*create input text file
$call rm input.txt output.txt
$call touch input.txt output.txt

file input /input.txt/;

put input;

loop((i,j),

        if (arcs(i,j),
                put i.val","j.val /;
        );

);
putclose;

execute 'lcc';




