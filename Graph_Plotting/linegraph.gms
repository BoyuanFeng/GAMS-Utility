file datafile /linegraph_data.in/;
put datafile;
loop((i),
     put linegraph_y(i)/
);
putclose;

execute "python linegraph.py linegraph_data.in linegraph_graph.png";
execute "rm linegraph_data.in";
