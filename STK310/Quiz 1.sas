data quiz1;
input x y @@;
cards;
12 70 13 75 11.5 65 14 80 12.5 72 12 68 13.5 77 12.5 73 11.8 67 14.2 82 13.8 79 12.3 70 11.7 64 12.8 74 13.2 76 14.5 83 12.1 68 11.9 66 13.1 75 12.7 71
;
run;

proc reg data = quiz1;
model y = x/ covb;
run;

proc iml;
varNames = {"x" "y"}; *reading dataset into a matrix;
use quiz1;
read all var varNames into MD [colname=varNames];
print MD;

i7 = sum(MD[,1]#MD[,2]); *Sigma Xi Yi;
print i7;
g = mean(MD[,2]); *Ybar;
ii7 =  sum(((MD[,2]-g)##2)#MD[,1]);
print ii7;

proc iml;
h9 = -6.83277 + 14.2#(6.23934);
print h9;

r10 = 82 - 81.765858;
print r10;

i7 = sum(MD[,1]#MD[,2]); *Sigma Xi Yi;
print i7;

proc univariate data = quiz1 normal;
run;

i7 = sum(x#y); *Sigma Xi Yi;
print i7;