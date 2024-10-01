 ** NEGATIVE BINOMIAL **;
 proc iml;
 k = 10; p = 0.75; n=25;
x=(k:n)`; pdf=comb(x-1,k-1)#(p**k)#((1-p)**(x-k)); cdf=cusum(pdf); 
 *print 'Theoretical distribution:' x pdf [format=6.4] cdf [format=6.4];
 r=15000;
 call randseed(239,1); x=randfun(r,'table',pdf);
 x=x+(k-1);
 create Negbin from x[colname={'x'}];
append from x;
 print 'The first ten simulated empirical values' (x[1:10]);
 
 proc univariate data = Negbin;
 var x;
 
 ** GEOMETRIC **;
 proc iml;
 n = 17; p = 0.45;
 y = (1:n)`; pdf=p*(1-p)**(y-1); cdf= cusum(pdf);
*print 'Theoretical distribution:' y pdf [format=6.4] cdf [format=6.4];
r=1000; call randseed(972,1); y = randfun(r, 'table', pdf);
create Geom from y[colname={'y'}]; append from y;
print 'The first ten simulated empirical values' (y[1:10]);

proc univariate data = Geom;
var y;

** POISSON **;
proc iml;
 lambda = 5; n = 20;
 x=(0:n)`; pdf=pdf('POISSON',x,lambda); cdf=cdf('POISSON',x,lambda);
 print 'Theoretical distribution:' x pdf [format=6.4] cdf [format=6.4];
 r = 5000;
call randseed(647,1); x = randfun(r, 'POISSON', lambda);
create d from x[colname={'x'}];
append from x;

proc univariate data = d;
vary x;


 