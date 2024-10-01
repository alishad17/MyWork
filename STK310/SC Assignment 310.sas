title1 'SC Asssignment ';
options ls=64 nodate ps=1000 pageno=1 nocenter;
title ;
footnote ;
quit ;
dm 'odsresults;clear';


data sc1;
input t	x y ;
cards;
1 107 5557
2 114 5911
3 105 5440
4 149 7631
5 114 5906
6 123 6367
7 97 5064
8 45 2452
9 100 5198
10 87 4557
11 105 5474
12 65 3480
13 41 2303
14 106 5521
15 96 5039
16 96 5053
17 128 6646
18 70 3746
19 103 5392
20 91 4787
	;

proc reg data= sc1 ;
 model y = x / dw clb;
run ;

*Question 1;

*Question a: OLS model - straight from proc reg;

*Question b: DW statistic;
*if DW statistic is between 0&2, only dealing with posiitve sc, between 2&4 only negative;

*Ho: No positive SC, Ha: positive SC;
dw = 0.518; *from proc reg;
*dl = 1.201, du = 1.411 : From table where n = 20, k` = 1;
*Reject Ho;


*Question c - rho hat;
rh = 0.720; *1st order ac from proc reg;

*Question d - estimate function accounting for sc excl. Paris Winsten transformation;
data sc2 ;
 set sc1 ;
 ys = y - 0.720 * lag(y) ; *where 0.720 is rho hat;
 xs = x - 0.720 * lag(x) ;
 
proc reg data= sc2 ;
 model ys = xs / dw clb;
 output out=transres r=res p=pred;
run ;

*: Y* = 67.73584 + 49.83153X*;

*Question e - sc of residuals of transformed model;
data transres;
set transres;
lres = lag(res);

proc reg data = transres;
model res = lres / noint dw;

*Question f - final model (transformed back to Beta parameters);
*B1 = 67.73584/(1-0.720);
*Y = 241.914 + 49.832X;


proc iml;
use sc1;
read all into data;

n=nrow(data);

x=j(n,1,1)||data[,2]; *The j part accounts for intercept;
y=data[,3];
bh=inv(x`*x)*x`*y; *bhat calculation;
print bh ;
u=y-x*bh; *y - yhat;
ut2=u`*u; 
print u ut2;

utu= u[2:n,]`*u[1:n-1,] ; *ut x u(t-1);

rho=utu/ut2; 
dw=2*(1-rho) ;

print utu rho dw ;

print "Step 1: Estimate OLS and rhohat", bh rho;
print "Initial model", "Y_hat =" (bh[1,1]) "+" (bh[2,1]) "X" ;


print "Step 2:Estimate the GLS estimators - Exc PW"; 

xs=J(n-1,1,1) || (x[2:n,2]-rho*x[1:n-1,2]); *[2:n] is ut. [1:n-1] is u(t-1);
ys=y[2:n,1]-rho*y[1:n-1,1];

gls=inv(xs`*xs)*xs`*ys;
print /*xs ys*/ gls;

bh[1,1]=gls[1,1]/(1-rho); *convert bh1 back for final model;
bh[2,1]=gls[2,1]; *bh2 stays the same;
print "Transform back into beta parameters" bh;

print "Final model - exc PW", "Y_hat =" (bh[1,1]) "+" (bh[2,1]) "X" ;







