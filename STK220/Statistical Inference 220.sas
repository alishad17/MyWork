*ASSIGNMENT 9*;
proc iml;

*Question 6 - two sided single sample mu*;

sd6 = 0.16;
n6 = 25;
xb6 = 8.091;
a6 = 0.01;
*Ho: u = 8, Ha: u != 8;
u6 = 8;

ts6 = (xb6 - u6)/(sd6/sqrt(n6));
crit6 = quantile('normal', (1-a6/2));
if abs(ts6) > abs(crit6) then ans6 = 'Reject Ho'; else ans6 = 'Do not reject Ho';
print crit6;


*pvalu approach*;
p6 = 2#(1-cdf('normal', ts6));
if p6 < a6 then ans6 = 'Reject Ho'; else ans6 = 'Do not reject Ho';
print ts6 p6;

*confidence interval approach;
l6 = xb6 + crit6#(sd6/sqrt(n6));
up6 = xb6 - crit6#(sd6/sqrt(n6));
if l6 < u6 < up6 then ans6 = 'Reject Ho'; else ans6 = 'Do not reject Ho';
print l6 up6 ans6;

*Question 7 - one sided lower;
proc iml;

n7 = 100;
xb7 = 21819;
sd7 = 1295;
mu7 = 22000;
a7 = 0.05;
*Ho: mu = 22000, Ha: mu < 22000;

ts7 = (xb7 - mu7)/(sd7/sqrt(n7));
crit7 = quantile('normal', (1 - a7));
if abs(ts7) > abs(crit7) then ans7 = 'Reject Ho'; else ans7 = 'Do not reject Ho';
print ts7 crit7;

p7 = cdf('normal', (1-a7));
if p7 < a7 then ans7 = 'Reject Ho'; else ans7 = 'Do not reject Ho';
print p7 ans7;

*Question 8 - difference in mu (two sample);
proc iml;

n1 = 50; xb1 = 2.61; sd1 = 0.12; v1 = sd1**2;
n2 = 40; xb2 = 2.55; sd2 = 0.14; v2 = sd2**2;
a = 0.05;
*Ho = u1 - u2 = 0, Ha = u1 - u2 != 0;

ts = (xb1 - xb2)/sqrt((v1/n1)+(v2/n2));
crit = quantile('normal', (1-a/2));
if abs(ts) > abs(crit) then ans = 'Reject Ho'; else ans = 'Do not reject Ho';
print ts crit ans;

p = 2#(1 - cdf('normal', ts));
if p < a then ans = 'Reject Ho'; else ans = 'Do not reject Ho';
print p ans;


*Question 9 - difference in mu, two sample, upper ;
proc iml;
n1 = 40; xb1 = 9.1; sd1 = 1.9; v1 = sd1##2;
n2 = 50; xb2 = 8; sd2 = 2.1; v2 = sd2##2;
a = 0.01;
*Ho: u1 - u2 = 0, Ha: u1 - u2 > 0;

ts = (xb1 - xb2)/sqrt((v1/n1)+(v2/n2));
crit = quantile('normal', (1-a));
if abs(ts) > abs(crit) then ans = 'Reject Ho'; else ans = 'Do not reject Ho';
print ts crit ans;

p = 1 - (cdf('normal', ts));
if p < a then ans = 'Reject Ho'; else ans = 'Do not reject Ho';
print p ans;




