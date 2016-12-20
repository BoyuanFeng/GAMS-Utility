KMeanCluster
Written by: Boyuan Feng
 
	A utility which implements k-mean cluster and gives the separation of index. The utility was developed using C++, and is comprised of the following files:
KMeanCluster.cpp – The main C++ file. We can compile this file using C++ 11 and get the exe file “KMeanCluster.exe”.
KMeanCluster.exe – The main execution file. This file reads data from txt file and implements the k-mean cluster. Then, this file will write the result in a txt file, which could be read by GAMS.
KMeanCluster.gms – This file would write the data and index into a txt file, which could be read and parsed by “KMeanCluster.exe”. Then, this file will execute “KMeanCluster.exe”, which would produce a txt-file1 containing the separation of indices.
Test.gms – This file would give an example of using this utitlity.
The C++ program has the following library dependencies:
<iostream>
<fstream>
<string>
<cmath>
<vector>
The setup and execution sequence is as follows:
Download the contents of the “KMeanCluster” folder from the repository
Create a new working directory to hold all downloaded files.
In order to use this utility, we need to use “$include KMeanCluster.gms” in the first run, and use
“$include KMeanClusterData.txt” and
“display Category0,Category1,Category2;” in the second run. The reason is that GAMS execute exe file in execution time and read data in compile time. In other words, the GAMS would try to read in result before we execute the exe file and get the result. So we need to use “$include KMeanCluster.gms” first and, then, use the other two command.
ATTENTION:
KMeanClusterI is the number of vectors.
KMeanClusterJ is the length of vectors.
KMeanClusterData stores all the data.
KMeanClusterK is a scalar storing the K, which is the number of groups.
The separation would be stored in Category0, Category1, …
See files Test.gms for examples of how to correctly use the utility.
