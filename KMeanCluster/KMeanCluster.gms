file KMeanClusterResults /KMeanClusterResults.txt/;
put KMeanClusterResults;
loop((KMeanClusterI,KMeanClusterJ),
     put KMeanClusterI.tl, KMeanClusterJ.tl, KMeanClusterData(KMeanClusterI,KMeanClusterJ)/
);
putclose;

file KMeanClusterNum /KMeanClusterNum.txt/;
put KMeanClusterNum;
put KMeanClusterK/
putclose;

execute 'KMeanCluster';

*scalar Result;
*execute_load 'Result.gdx', Result;
*display Result;


