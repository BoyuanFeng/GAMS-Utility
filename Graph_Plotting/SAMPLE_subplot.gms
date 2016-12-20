$if not set N $set N 1000
set i /1*%N%/;
parameters subplot_x(i), subplot_y(i);

loop(i,
* Try out different scenarios here! 

*    subplot_x(i) = uniform(-100,100);
*    subplot_y(i) = uniform(-100,100);

*    subplot_x(i) = ord(i);
*    subplot_y(i) = subplot_x(i) + uniform(-100,100);
    
    subplot_x(i) = ord(i);
    subplot_y(i) = normal(subplot_x(i), 100);
);

********************************
* 2D subplot generator
********************************
* Attribute on horizontal axis: @parameter subplot_x(i)
* Attribute on vertical axis:   @parameter subplot_y(i)
* Output image:                 subplot_graph.png

$include subplot.gms

execute "rm SAMPLE_subplot.lst"