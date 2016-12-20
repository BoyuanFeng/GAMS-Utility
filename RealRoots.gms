$ontext
-Fill in lower and upper bound for root search ("lobound" and "upbound")

-Set "incr" to adjust the step increment size for the search. Smaller increments
decreases risk of missing one of two roots that are very close to eachother.

-Set the coefficients for the function (a0-a20). For instance f(x)= -3+2x^2 will
coefficients a0 = -3, a2=2 and the rest =0.

-Run the program - the results will be displayed as "root"

$offtext

$if not set lobound $set lobound -200
$if not set upbound $set upbound  200
$if not set incr $set incr 0.1
$if not set a0 $set a0 -3
$if not set a1 $set a1 0
$if not set a2 $set a2 2
$if not set a3 $set a3 0
$if not set a4 $set a4 0
$if not set a5 $set a5 0
$if not set a6 $set a6 0
$if not set a7 $set a7 0
$if not set a8 $set a8 0
$if not set a9 $set a9 0
$if not set a10 $set a10 0
$if not set a11 $set a11 0
$if not set a12 $set a12 0
$if not set a13 $set a13 0
$if not set a14 $set a14 0
$if not set a15 $set a15 0
$if not set a16 $set a16 0
$if not set a17 $set a17 0
$if not set a18 $set a18 0
$if not set a19 $set a19 0
$if not set a20 $set a20 0



$Eval troll round( ((%upbound%)-(%lobound%))/%incr% )

set i /1 * %troll%/   ;
parameters
r(i)
val(i)
value(i)
root(i)
lol(i)
count
troll;

variable
x
err
error;

equation
poly
erroreq;

poly..
err=e=%a4%*power(x,4)+(%a3%)*power(x,3)+(%a2%)*power(x,2)+(%a1%)*power(x,1)+(%a0%)
+(%a5%)*power(x,5)+(%a6%)*power(x,6)+(%a7%)*power(x,7)+(%a8%)*power(x,8)+(%a9%)*power(x,9)
+(%a10%)*power(x,10)+(%a11%)*power(x,11)+(%a12%)*power(x,12)+(%a13%)*power(x,13)+(%a14%)*power(x,14)
+(%a15%)*power(x,15)+(%a16%)*power(x,16)+(%a17%)*power(x,17)+(%a18%)*power(x,18)+(%a19%)*power(x,19)+(%a20%)*power(x,20);

erroreq..
error=e=abs(err);

x.up=%upbound%    ;
x.lo=%lobound%    ;


lol("1")=%lobound%
loop(i,
lol(i+1)=lol(i)+%incr%
        );

value(i)=(%a4%)*power(lol(i),4)+(%a3%)*power(lol(i),3)+(%a2%)*power(lol(i),2)+(%a1%)*power(lol(i),1)+(%a0%)
+(%a5%)*power(lol(i),5)+(%a6%)*power(lol(i),6)+(%a7%)*power(lol(i),7)+(%a8%)*power(lol(i),8)+(%a9%)*power(lol(i),9)
+(%a10%)*power(lol(i),10)+(%a11%)*power(lol(i),11)+(%a12%)*power(lol(i),12)+(%a13%)*power(lol(i),13)+(%a14%)*power(lol(i),14)
+(%a15%)*power(lol(i),15)+(%a16%)*power(lol(i),16)+(%a17%)*power(lol(i),17)+(%a18%)*power(lol(i),18)+(%a19%)*power(lol(i),19)+(%a20%)*power(lol(i),20);

count=0;

model pol /all/

loop(i,

if(abs(value(i))<100,
x.lo=lol(i)-0.501*(%incr%);
x.up=lol(i)+0.501*(%incr%);
x.l=lol(i);
solve pol using dnlp minimizing error;
r(i)=x.l;

if(error.l < 1e-10,
root(i)=r(i);
val(i)=error.l;
count=count+1;
else root(i)=no;
);
 );
  );

display root ;

$offlisting
