Determinant
Written by: Boyuan Feng

	A utility which computes the determinant of a matrix. The utility was developed using C++, and is comprised of the following files: 
•	Determinant.cpp – The main C++ file. We can compile this file using C++ 11 and get the exe file “Determinant.exe”.
•	Determinant.exe – The main execution file. This file reads data from txt file and calculate the value of determinant. Then, this file will write the result in a txt file, which could be read by GAMS.
•	Determinant.gms – This file would write the matrix into a txt file, which could be read and parsed by “Determinant.exe”. Then, this file will execute “Determinant.exe”, which would produce a txt-file1 containing the value of determinant. Then, “Determinant.gms” would execute “Determinant1.gms”, which would transform the txt-file1 to gdx. Finally, “Determinant.gms” would read in the gdx file and display the result.
•	Determinant1.gms – This file would transform the txt-file1 to gdx.
•	Test.gms – This file would give an example of using this utitlity.
The C++ program has the following library dependencies:
•	<iostream>
•	<fstream>
•	<string>
•	<cmath>
•	<vector>
The setup and execution sequence is as follows:
•	Download the contents of the “Determinant” folder from the repository
•	Create a new working directory to hold all downloaded files.
•	Use “$include Determinant.gms” to use the utility. 
•	ATTENTION: The name of matrix should be “b”. The index of matrix should be “i”. The value of determinant would be stored in a scalar called “result”.
See files Test.gms for examples of how to correctly set up a graph and call the include file. 
