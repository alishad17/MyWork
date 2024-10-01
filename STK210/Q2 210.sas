/***********************************************/
/* You can use this SAS program for Question 2 */
/***********************************************/
proc iml;
print 'Practical 10: Question 2';

print 'Question 2(a)';
Q2ai=cdf('exponential',40,20);
print Q2ai;

print 'Question 2(b)';
Q1=quantile('exponential',0.25,20);
Q3=quantile('exponential',0.75,20);
IQR=Q3-Q1;
print Q1 Q3 IQR;

print 'Question 2(c)';
f_0=pdf('exponential', 0,20);
f_10=pdf('exponential',10,20);
print f_0 f_10;

print 'Question 2(d)';
theta=20;
mean=theta;
variance=theta**2;
print mean variance;

print 'Question 2(e)';
/**************************************************************/
/* pdf=1/theta*exp(-y/theta)                                  */
/* CDF=1-exp(-y/theta);                                       */
/* quantile=theta*log(1/(1-p));                               */
/**************************************************************/
  
print 'Q2eii:  ' ((1-exp(-30/theta))-(1-exp(-10/theta)));
print 'Q2ev:   ' (theta*log(1/(1-0.75)));
print 'Q2evi:  ' (1/theta*exp(-10/theta));

print 'Question 2(f)';
n=10; theta=20;

print 'Question 2(g)';
call randseed(123,1); w=randfun(1000,'exponential',20);
print 'Observations 251-260: ' (w[251:260]);
create Battery from w[colname={'hours'}];
append from w;
quit;

ods graphics off;
proc univariate data=Battery;
var hours;
histogram / endpoints=0 to 140 by 10 cfill=red;
title 'Lifetime of an alkaline battery';
run;

data Battery2; set  Battery;
  if hours>25 then grp3=1; else grp3=0;
  if abs(hours-20)<=5 then grp4=1; else grp4=0;
  if hours>35 then grp5=1; else grp5=0; 
run;

proc freq data=Battery2;
tables grp3 grp4;
title 'Empirical probabilities of the lifetime of an alkaline battery';
run;
proc freq data=Battery2;
where hours>10;
tables grp5;
run;

*** Alternatively ***;
proc means data=Battery2;
var grp3 grp4;
run;
proc means data=Battery2;
where hours>10;
var grp5;
run;
