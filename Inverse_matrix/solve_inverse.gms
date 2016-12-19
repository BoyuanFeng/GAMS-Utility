alias (i,k);
parameters inverse_matrix(i,j),cininverse;
loop((i,j),
inverse_matrix(i,j)=A(i,j);
);
loop(k,
cininverse=1/inverse_matrix(k,k);
inverse_matrix(k,k)=cininverse;
loop(i,
if(ord(i)<>ord(k),
inverse_matrix(i,k)=-cininverse*inverse_matrix(i,k);
);
);
loop((i,j),
if(ord(i)<>ord(k),
if(ord(j)<>ord(k),
inverse_matrix(i,j)=inverse_matrix(i,j)+inverse_matrix(i,k)*inverse_matrix(k,j);
);
);
);
loop(j,
if(ord(j)<>ord(k),
inverse_matrix(k,j)=cininverse*inverse_matrix(k,j);
);
);
);
display inverse_matrix;