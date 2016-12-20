file results /results.txt/;
put results;
loop((i,j),
     put i.tl, j.tl, d(i,j)/
);
putclose;

execute 'Determinant';
execute 'gams Determinant1.gms';
scalar Result;
execute_load 'Result.gdx', Result;
display Result;

execute 'rm data.inc';
execute 'rm results.txt';
execute 'rm Determinant.~gm';
execute 'rm Test.~gm';
execute 'rm Test.log';
execute 'rm Test.lst';
execute 'rm Test.lxi';
execute 'rm Test1.gms';
execute 'rm Test1.lst';
execute 'rm Result.gdx';
