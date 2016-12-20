file datafile /subplot_data.in/;
put datafile;
loop((i),
     put subplot_x(i), subplot_y(i)/
);
putclose;

execute "python subplot.py subplot_data.in subplot_graph.png";
execute "rm subplot_data.in";
