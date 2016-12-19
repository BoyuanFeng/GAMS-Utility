set i /1,2,3/;
alias (i,j);
table A(i,j)
         1       2       3
1        1       1       1
2        1       2       3
3        1       10      100;
display A;

********************************
*Code for computing Inverse Matrix
********************************
*The name of indexes must be "i" and "j", and the name of matrix must be "A".
*The inverse matrix would be stored in "inverse_matrix(i,j)", which are parameters.

$include E:\GAMS\solve_inverse.gms

********************************
*Code for computing Inverse Matrix
********************************

