file datafile /histogram_data.in/;
put datafile;
loop((i),
     put histogram_x(i)/
);
putclose;

* use $call with '=' to make sure GAMS waits until the python script finishes
execute "python histogram.py histogram_data.in histogram_graph.png"
execute "rm histogram_data.in"
