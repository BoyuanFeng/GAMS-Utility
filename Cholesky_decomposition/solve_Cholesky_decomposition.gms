parameters lower_triangle_matrix(i,j);
loop((i,j),
lower_triangle_matrix(i,j)=A(i,j);
);
alias (i,k);
parameters ilength;
ilength=0;
loop(i,
ilength=ilength+1;
);
alias (i,i1,i2);
loop((i,j)$((ord(i)=1)and(ord(j)=1)),
lower_triangle_matrix(i,j)=sqrt(lower_triangle_matrix(i,j));
);
loop((i,j)$((ord(i)>1)and(ord(j)=1)),
lower_triangle_matrix(i,j)=lower_triangle_matrix(i,j)/sum((i1,i2)$((ord(i1)=1)and(ord(i2)=1)),lower_triangle_matrix(i1,i2));
);
loop(j$((ord(j)>1)and(ord(j)<ilength)),
lower_triangle_matrix(j,j)=sqrt(lower_triangle_matrix(j,j)-sum(k$(ord(k)<ord(j)),sqr(lower_triangle_matrix(j,k))));
loop(i$(ord(i)>ord(j)),
lower_triangle_matrix(i,j)=(lower_triangle_matrix(i,j)-sum(k$(ord(k)<ord(j)),lower_triangle_matrix(i,k)*lower_triangle_matrix(j,k)))/lower_triangle_matrix(j,j);
);
);
lower_triangle_matrix(i2,i2)$(ord(i2)=ilength)=sqrt(sum(k$(ord(k)=ilength),lower_triangle_matrix(k,k))-sum((i1,k)$((ord(i1)=ilength)and(ord(k)<ilength)),sqr(lower_triangle_matrix(i1,k))));
loop((i,j)$(ord(i)<ord(j)),
lower_triangle_matrix(i,j)=0;
);
display lower_triangle_matrix;

