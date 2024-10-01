*===>; proc import datafile="/home/u63312465/STK220/Practical 6/Quiz6.csv"
       out=Quiz6 dbms=csv replace;
       run;

proc iml;

*** Theoretical Values ***;
*===>; nX= 25;         *===>; nY= 20 ;
*===>; muX= 400 ;        *===>; muY= 540 ;
*===>; sigmaX= 150 ;     *===>; sigmaY= 120 ;
print nX nY, muX muY, sigmaX sigmaY;

P26 = 1 - cdf('chisq', 26, 24);
VS2X = (2*(sigmaX##4))/(nX-1);
p = (19600#24/(150##2));
P19 = cdf('chisq',p,24);
Q20 = quantile('chisq', 0.2, 24);
print P26 VS2X p P19 Q20;

*** Empirical values ***;
use Quiz6; read all var _num_ into DDD;
X=DDD[,1:nX];      Y=DDD[,nX+1:nX+nY];
meanX=(mean(x`))`; varianceX=(var(x`))`;
meanY=(mean(y`))`; varianceY=(var(y`))`;

create D6 var{meanX varianceX meanY varianceY}; append;

V= ((nX-1)/varianceX)#(sigmaX##2);
muV = mean(V);
print muV;

data grp; set ;
if V > 26 then grp1 = 1; else grp1 = 0;

proc means data = grp;
var grp1;

