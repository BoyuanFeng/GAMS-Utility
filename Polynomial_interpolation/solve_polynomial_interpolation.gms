parameters coefficients(i);
alias (i,j,k);
loop(i,
coefficients(i)=0;
);
parameters wki(k,i);
loop((k,i),
wki(k,i)=0;
);
parameters matrixQ(i,j);
loop((i,j)$(ord(j)=1),
matrixQ(i,j)=f(i);
);
loop((i,j)$((ord(i)>1)and(ord(j)>1)),
if(ord(j)<=ord(i),
matrixQ(i,j)=(matrixQ(i,j-1)-matrixQ(i-1,j-1))/(x(i)-x(i-(ord(j)-1)));
);
);     
loop(k,
         loop(i,
                 if(((ord(k)=1)and(ord(i)=1)),
                         wki(k,i)=1;
                 );
                 if(((ord(k)>1)and(ord(i)<=ord(k))and(ord(i)=1)),
                         wki(k,i)=-wki(k-1,i)*x(k-1);
                 );
                 if(((ord(k)>1)and(ord(i)<=ord(k))and(ord(i)>1)),
                         wki(k,i)=wki(k-1,i-1)-wki(k-1,i)*x(k-1);
                 );
         );
);
loop((k,i),
coefficients(i)=coefficients(i)+matrixQ(i,i)*wki(k,i);
);
display coefficients;

