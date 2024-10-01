%web_drop_table(D); *Not really necessary unless the table exists;

FILENAME REFFILE '/home/u63312465/STK310/Assignments/Assignment 1/musickvideos (1).csv' encoding= 'wlatin1';

PROC IMPORT DATAFILE= REFFILE
DBMS = CSV
OUT = D;
GETNAMES = YES;
RUN;
proc contents data=D;
run;
options validvarname=any;

*QUESTION 1;

*Q1A - OLS Through Origin;

proc reg data = D;
model 'File Size'n ='Song Length'n / covb noint; *Specify no intercept because it asked through the origin;
run;
*OLS: 0.07718Xi;

*Q1B -  Use OLS regression to calculate the percentage increase in the mean file size for a 1%
increase in the song length.;

goptions reset=all;
data Dnew;
set WORK.D;
x="Song Length"n;
y="File Size"n;
lnx=log(x);
lny=log(y);
keep x y lnx lny;
run; 

proc reg data = Dnew;
model lny = lnx;

alphahat = -4.70380; *Intercept;
beta1hat = exp(alphahat); *Alphahat = lnB1, so unlinearise it for B1 value;
*Yihat = 0.009060748 Xi ^ 1.36, Yihat = beta1hat Xi ^ B2;
*B2 comes from proc reg directly;
*Final answer: 1.36% increase;

*Question 2;
data mouse;
input t Y;
cards;
1 11.33
2 17
3 23 
4 28.52
5 33.33
6 37.90
7 40.48
8 42.40
9 44.43
;
run;

data mouset;
set mouse;
yt = log(Y);
run;

proc reg data = mouset;
model yt=t;
run;

*linear regression model: 2.54590 + 0.16038t;

*instantaneous rate of growth: B2% = 16.038%;

*compound growth rate: (exp(B2) -1 )%;

*weight at birth: intercept of normal model = exp(B1);

*Question 3;
data sound;
input x y;
cards;
2 95
4 82
6 77
8 73
10 71
12 68
14 66
16 65
18 63
20 62
;
run;


data soundn;
set sound;
xn = 1/x;
run;


proc reg data = soundn;
model y = xn;
*Yhat = 61.73009 + 71.49212(1/X);

proc gplot data=sound;
plot y*x / haxis=axis1 vaxis=axis2 vref=61.73009 cvref=orange
 wvref=2; 







