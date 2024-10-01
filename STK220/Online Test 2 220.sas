proc iml;

** THEORETICAL **;
*NB: PROBBNRM is for STANDARDISED NORMAL ~ BVN(0,0,1,1,rho);

*Define parameters;
uX = 30; uY = 45; 
varX = 25; varY=36; sX = sqrt(varX); sY = sqrt(varY);
rho = -0.72;

*Population mean vector; PopMean=uX//uY;
*Population sd vector; PopStd=sX//sY;

*Correlation matrix;
PopCorr=I(2); *Start with a blank identity matrix to make your correlation matrix;
PopCorr[1,2]=rho; PopCorr[2,1]=rho; *replace relevant values with corr co-efficient;

*Covariance matrix;
DiagStd=diag(PopStd);
PopCov=DiagStd*PopCorr*DiagStd; *create covariance matrix from correlation matrix;

print PopMean PopStd PopCorr PopCov;

*Marginal X ~ N(uX, varX); *Marginal Y ~ N(uY, varY);

*Following are done for non-standardised. We are standardising in function;
*P(a<X<b, c<Y<d);
Q1 = PROBBNRM((35-ux)/sx,(45-uy)/sy,rho) - PROBBNRM((35-ux)/sx,(56-uy)/sy,rho) - PROBBNRM((40-ux)/sx,(45-uy)/sy,rho) + PROBBNRM((40-ux)/sx,(56-uy)/sy,rho);
*P(X<a, c<Y<d);
Q2 = PROBBNRM((35-ux)/sx,(50-uy)/sy,rho) - PROBBNRM((35-ux)/sx,(40-uy)/sy,rho);
*P(a<X<b, Y<d);
Q3 = PROBBNRM((38-ux)/sx,(50-uy)/sy,rho) - PROBBNRM((32-ux)/sx,(50-uy)/sy,rho);
*P(X>a); *Can just use marginal when dealing with one variable;
Q4 = 1 - CDF('Normal',uX,varX,35);
*P(c<Y<d);
Q5 = *cdf('Normal', uY, varY, 48) - ;cdf('Normal', uY, varY, 44);
print Q1 Q2 Q3 Q4 Q5;

** EMPIRICAL DISTRIBUTION **;
N=25000; *number in sample;
call randseed(482,1);
X=RANDNORMAL(N,PopMean,PopCov);
X=round(X);

*Basic statistical measures;
SampleMean=mean(x);
SampleVar=var(x);
SampleStd=std(x);
SampleCov=cov(x);
SampleCorr=corr(x);

print SampleMean SampleVar SampleStd SampleCov SampleCorr;

create bvn from x[Colname={'X' 'Y'}];
append from x;