proc iml;
*question 1, determine if sig more;
n7 = 25;
xb7 = 99;
sd7 = 10;
mu7 = 96;
a7 = 0.1;

ts7 = (xb7 - mu7)/(sd7/sqrt(n7));
crit7 = quantile('normal', (1 - a7));
if abs(ts7) > abs(crit7) then ans7 = 'Reject Ho'; else ans7 = 'Do not reject Ho';
print ts7 crit7;

p7 = 1 - cdf('normal', ts7);
if p7 < a7 then ans7 = 'Reject Ho'; else ans7 = 'Do not reject Ho';
print p7 ans7;

*Two sided*;

crit7 = quantile('normal', (1 - a7/2));
me = crit7#(sd7/sqrt(n7));
u = xb7 + me;
l = xb7 - me;
print me u l;