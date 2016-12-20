import sys
import os
import math

import numpy as np
import matplotlib
import matplotlib.pyplot as plt

def main(input_data_path, output_image_path):

    fileobj = open(input_data_path, 'r')
    
    data_y = []
    
    for line in fileobj:
    	s = line.rstrip('\n')
        lst = s.split()
        if (len(lst) == 1):
        	data_y.append(float(lst[0]))

    fig, ax = plt.subplots()
    ax.plot(range(1,len(data_y)+1), data_y, 'o-')
    plt.savefig(output_image_path)
    plt.show()
    
main(sys.argv[1], sys.argv[2])
