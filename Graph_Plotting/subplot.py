import sys
import os
import math

import numpy as np
import matplotlib
import matplotlib.pyplot as plt

def main(input_data_path, output_image_path):

    fileobj = open(input_data_path, 'r')
    
    data_x = []
    data_y = []
    
    for line in fileobj:
    	s = line.rstrip('\n')
        lst = s.split()
        if (len(lst) == 2):
        	data_x.append(float(lst[0]))
        	data_y.append(float(lst[1]))

    fig, ax = plt.subplots()
    ax.plot(data_x, data_y, '.')
    plt.savefig(output_image_path)
    plt.show()
    
main(sys.argv[1], sys.argv[2])
