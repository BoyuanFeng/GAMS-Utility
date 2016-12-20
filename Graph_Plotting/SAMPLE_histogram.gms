$if not set N $set N 1000
set i /1*%N%/;
parameters histogram_x(i);

loop(i,
    histogram_x(i) = normal(0, 10);
);

********************************
* Histogram generator
********************************
* Target attribute: @parameter histogram_x(i)
* Output image:     histogram_graph.png

$include histogram.gms

execute "rm SAMPLE_histogram.lst"