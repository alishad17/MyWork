options pagesize=1000 nocenter;

*** Example 5.14 Newspaper A B C ***;

proc iml;

n=8;
prob={0.5,0.3,0.2}; *probs of x1,x2,x3;

**Question 1***;
print 'Practical 2';
print 'Question1';
Q1a=fact(n)/(fact(5)*fact(2)*fact(1))*(0.5**5)*(0.3**2)*(0.2**1); *prob of x1=5,x2=2,x3=1;

print Q1a;

***Question 2***;
print 'Question2';
********************************;
*** Theoretical Distribution ***;
********************************;

f=j(n+1,n+1,.); *need to create a place to store values of joint prob distribution;
do x1=0 to n;
  do x2=0 to n;
    x3=n-x1-x2; *define x3;
    row=x1+1; col=x2+1; *row and column counter - add 1 so we don't have a row 0/column 0 because thats where our x values start;
    if x1+x2<=n then do; *valid probability distributions;
	   a=fact(x1)*fact(x2)*fact(x3);
	   b=(prob[1]##x1)*(prob[2]##x2)*(prob[3]##x3);
       f[row,col]=(fact(n)/a)*b;
	end;
    else f[row,col]=0;
  end;
end;
print f[format=6.4];

check=f[+];  ***The probabilities must add up to 1;
print check;


**Question 3**;
print 'Question3';
Q3a=f[5+1,2+1];  ** f(5,2,1) ***;
print Q3a;

**Question 4**;
print 'Question4';
Q4a=sum(f[6+1:n+1,]); *** P(X1>5) ***;

**Alternative methods to calculate the probabilities**;

Q4a1 = cdf('binomial', 5,0.5,n); *** P(X1>5) ***;
Q4cb=pdf('BINOMIAL',7,0.3,n);  *** P(X2=7) ***;
print Q4a Q4a1 Q4cb;

**Question 5**;
print 'Question5';
Q5a=sum(f[2:4,3:6]);
print Q5a ;

**Question 6**;
print 'Question6';
*** Marginal of X1 ***;
gx1=f[,+]; *method 1;
gx1a= f*J(9,1,1);*method 2;
Q6a=sum(gx1[7:9]);
Q6b=sum(gx1[4:8]);
print gx1[format=6.4] gx1a[format=6.4],,Q6a Q6b;

**Question 7**;
print 'Question7';
*** Marginal of X2 ***; *column totals;
gx2=f[+,]; *method 1;
gx2a=J(1,9,1)*f; *method 2;
print gx2[format=6.4], gx2a[format=6.4];


**Alternative method to calculate the marginal distributions of X1 and X2**;
codes=0:n; print codes[format=3.0];

*** X1 BIN(8,0.5) ***;
gx1_BIN=pdf('BINOMIAL',codes`,0.5,8);
print gx1_BIN[format=6.4];

*** X2 BIN(8,0.3) ***;
hx2_BIN=pdf('BINOMIAL',codes,0.3,8);
print hx2_BIN[format=6.4];

**Question 8**;
print'Question8';
*** Expected value and Variance ***;
Mean=n*prob;
Cov=n*(diag(prob)-prob*prob`); 
**Alternative methods to obtain the variances**;
Var=vecdiag(Cov);
VarB=n*prob#(J(3,1,1)-prob); *the J matrix is just the 1 we need; 
Stdev=sqrt(Var);
print Mean, Cov, Var, VarB, Stdev;

**Question 9**;
print 'Question9';
*** Correlation ***;
Q9a=Cov[1,3]/(Stdev[1]*Stdev[3]); *correlation between the two values;
Q9aa=Cov[1,3]/(sqrt(Cov[1,1])*sqrt(Cov[3,3])); **Alternative method to calculate Q9a**;
print Q9a Q9aa;

**Question 10**;
print 'Question10';
*** Variances and Covariances ***;
C={1.5,2,3};
P={2.5,3,5};
Q10a=C`*Mean;
Q10b=C`*Cov*C;
print C P ,,Q10a Q10b;


**Question 11**; *generating sample;
print 'Question11';
call randseed(123,1);
r = 1000;
x = RandMultinomial(r,n,prob);
SampleMean=mean(x);
SampleVar=var(x);
SampleStd=std(x);
SampleCov=cov(x);
SampleCorr=corr(x);
print SampleMean SampleVar SampleStd SampleCov SampleCorr;
create newspaper from x[Colname={'X1' 'X2' 'X3'}];
append from x;
quit;

proc corr data=newspaper;
   var x1 x2 x3;
run;

proc freq data=newspaper;
tables x1*x2/ norow nocol;
run;


**Question 12** ; 
data a; set newspaper;
if x1=5 and x2=2 then grp1=1; else grp1=0;
run;


proc freq data=a;
tables grp1;
run;

proc means data=a;
var grp1;
run;





