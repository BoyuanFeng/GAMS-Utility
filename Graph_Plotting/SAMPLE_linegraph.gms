$if not set N $set N 30
set i /1*%N%/;
parameters linegraph_y(i);

loop(i,
    linegraph_y(i) = ord(i) + uniform(1,10);
);

********************************
* Time series graph generator
********************************
* Attribute on vertical axis:   @parameter linegraph_y(i)
* Output image:                 linegraph_graph.png

$include linegraph.gms

execute "rm SAMPLE_linegraph.lst"