# GAMS 2D Graph Plotting Utility
Author: Zhilin Jiang
Part of the CS 524 GAMS Utility Project, Fall 2016, University of Wisconsin-Madison

A GAMS utility that draws various types of graphs from given GAMS parameter data values. 
The graph is written to specified path as a .png file, and is also presented in a simple MatPlotLib GUI window allowing zooming, view shifting, adjusting page margin, and saving as image file. 

## Dependencies
* GAMS
* Python (2.x or 3.x)
* NumPy
* MatPlotLib 2.x
  Installation instructions of MatPlotLib can be found at: http://matplotlib.org/users/installing.html

## Subplot Generator
Draws a 2D plot graph of points specified by:
* parameter subplot_x(i) 
* parameter subplot_y(i)
See SAMPLE_subplot.gms for sample usage. 
![alt text][subplotgraph]
[subplotgraph]: http://i.imgur.com/BqO3jrH.png "Subplot Graph Example"

## Linegraph Generator
Draws a 2D line graph of points specified by:
* parameter linegraph_y(i) , with values matched to x-axis position 1, 2, 3... in order. 
See SAMPLE_linegraph.gms for sample usage. 
![alt text][linegraphgraph]
[linegraphgraph]: http://i.imgur.com/XBuqKfE.png "Line Graph Example"

## Histogram Generator
Draws a histogram for the values of an attribute specified by:
* parameter histogram_y(i)
See SAMPLE_histogram.gms for sample usage. 
![alt text][histogramgraph]
[histogramgraph]: http://i.imgur.com/COOqhCv.png "Histogram Graph Example"
