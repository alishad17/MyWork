* QUESTION 1 - NEGATIVE BINOMIAL;
proc iml;
k = 5; p = 0.4; n=39;
x=(k:n)`; pdf=comb(x-1,k-1)#(p**k)#((1-p)**(x-k)); cdf=cusum(pdf); 
  *print 'Theoretical distribution:' x pdf [format=6.4] cdf [format=6.4];
 
 Qai = pdf[7-4];
 Qaii = cdf[8-4];
 Qaiii = 1 - cdf[6-4];
 Qaiv = 14;
 Qav = k/0.4; *expected value;
 Qavi = sqrt((k/p)#((1/p)-1)); *standard deviation;
 print Qai Qaii Qaiii Qaiv Qav Qavi;
 
 r=10000;
 call randseed(346,1); x=randfun(r,'table',pdf);
 x=x+(k-1);
 print 'The first ten simulated values' (x[1:10]);

Qbi = j(1, 1, .);
call qntl(Qbi, x, 0.7);
Qbii = mean(x);
Qbiii = sqrt(var(x));
print Qbi Qbii Qbiii;

 * QUESTION 2 - POISSON;
 proc iml;
 lambda = 10; n = 24;
 x=(0:n)`; pdf=pdf('POISSON',x,lambda); cdf=cdf('POISSON',x,lambda);
 print 'Theoretical distribution:' x pdf [format=6.4] cdf [format=6.4];
 
Q2ai = pdf[15+1];
Q2aii = cdf[21] - cdf[5];
Q2aiii = 8;
Q2aiv = lambda; *expected value;
Q2av = sqrt(lambda); *sd;
print Q2ai Q2aii Q2aiii Q2aiv Q2av;

r = 10000;
call randseed(401,1); x = randfun(r, 'POISSON', lambda);
create d from x[colname={'x'}];
append from x;

Q2bi = j(1, 1, .);
call qntl(Q2bi, x, 0.25);
Q2bii = mean(x);
Q2biii = sqrt(var(x));
print Q2bi Q2bii Q2biii;

 *QUESTION 3 - BINOMIAL DISTRIBUTION;
 proc iml;
 n = 200; p = 0.04;
 x = (0:n)`; pdf=pdf('binomial',x,p,n); cdf=cdf('binomial',x,p,n);
 *print 'Theoretical distribution:' x pdf [format=6.4] cdf [format=6.4];
 
 Q3ai = pdf[8];
 Q3aii = cdf[9];
 Q3aiii = 1 - cdf[7];
 Q3aiv = 9;
 Q3av = n*p; *mean;
 Q3avi = sqrt(n*p*(1-p)); *standard deviation;
 print Q3ai Q3aii Q3aiii Q3aiv Q3av Q3avi;
 
 r = 10000;
call randseed(401,1); x = randfun(r, 'binomial', p, n);
create e from x[colname={'x'}];
append from x;

Q3bi = j(1, 1, .);
call qntl(Q3bi, x, 0.7);
Q3bii = mean(x);
Q3biii = sqrt(var(x));
print Q3bi Q3bii Q3biii;

*Converting to Poisson;
proc iml;
 n = 200; p = 0.04;
 lambda3 = n*p; n3 = 21;
 x3=(0:n3)`; pdf=pdf('POISSON',x3,lambda3); cdf=cdf('POISSON',x3,lambda3);
 print 'Theoretical distribution:' x3 pdf [format=6.4] cdf [format=6.4];
 
Q3ci = pdf[8];
Q3cii = cdf[9];
Q3ciii = 1 - cdf[7];
Q3civ = 9;
Q3cv = lambda3;
Q3cvi = sqrt(lambda3);
print Q3ci Q3cii Q3ciii Q3civ Q3cv Q3cvi;



 
 
 
 




 

