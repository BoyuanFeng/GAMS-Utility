set i /0,1,2/;
parameters x(i) /0 0,1 1,2 2/;
parameters f(i) /0 0,1 1,2 4/;
display x,f;

********************************
*Code for computing Lagrange Interpolation Polynomial
********************************
*The name of indexes must be "i", the name of points must be "x" and
*the name of the function values must be "f".
*The value of Lagrange polynomial coefficients would be stored in
*"coefficients(i)" with ascending powers, which are parameters.

$include E:\GAMS\solve_polynomial_interpolation.gms

********************************
*Code for computing Lagrange Interpolation Polynomial
********************************

