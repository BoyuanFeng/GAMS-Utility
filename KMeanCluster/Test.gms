set KMeanClusterI /0*9/;
set KMeanClusterJ /0*4/;
parameter KMeanClusterData(KMeanClusterI,KMeanClusterJ);
KMeanClusterData(KMeanClusterI,KMeanClusterJ) = uniform(0,1);
display KMeanClusterData;
scalar KMeanClusterK  /3/;






$include KMeanCluster.gms
*$include KMeanClusterData.txt
*display Category0,Category1,Category2;

