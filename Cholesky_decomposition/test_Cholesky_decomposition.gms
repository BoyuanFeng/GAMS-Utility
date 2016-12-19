set i /1,2,3/;
alias (i,j);
table A(i,j)
         1       2       3
1        4       -1      1
2        -1      4.25    2.75
3        1       2.75    3.5;
display A;

********************************
*Code for computing Cholesky decomposition
********************************
*The name of indexes must be "i" and "j", and the name of matrix must be "A".
*The inverse matrix would be stored in "lower_triangle_matrix(i,j)", which are parameters.

$include E:\GAMS\solve_Cholesky_decomposition.gms

********************************
*Code for computing Cholesky decomposition
********************************
