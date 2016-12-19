$ontext
Intermediate file between user's inputs and C++ file - MAC version
Creates input/output files, prints graph connections to input,
calls executable.

NOTES:
-set containing arcs must be written to input.txt file in the manner
displayed below
-set of nodes must be given integer values in the same fashion as below
-set of arcs must be printed with separating commas as shown below


ARGUMENTS
1- set i: set to project graph over
2- arcs: set of connections between nodes
3- input file name
4- output file name

Written by:
Nathaniel Gale

$offtext

$set i %1

alias (i,j);


*create input/output text file
$call rm %3 %4
$call touch %3 %4

file input /%3/;

put input;

loop((i,j),

        if (%2(i,j),
                put i.val","j.val /;
        );

);
putclose;

*Include input & output files as arguments
execute 'lcc %3 %4';

