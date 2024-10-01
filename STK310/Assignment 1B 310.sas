%web_drop_table(D); *Not really necessary unless the table exists;

FILENAME REFFILE '/home/u63312465/STK310/Assignments/Assignment 1B/mcq2(3).csv' encoding= 'wlatin1';

PROC IMPORT DATAFILE= REFFILE
DBMS = CSV
OUT = D;
GETNAMES = YES;
RUN;
proc contents data=D;
run;
options validvarname=any;

** QUESTION 1;
proc iml;

i = 28102/100; *mean = sum/n;
ii = 100 - 6; *n - k;
iii = 144155 - 133425; *Error = total - model;
iv = iii/ii; *MSE = RSS/DF;
v = (0.9216 -1)*((100-6)/(100-1)) +1; *R2 from adjusted;
vi = 1/(1-(0.9966)); *from formula -R2 where x2 is response variable;
vii = 1/(1-(0.9998));
viii = (-0.14)*(3.83153); *parameter estimate of x4: tvlaue*se;
ix = (-1.61478)/(11.35831); *tvalue x5: parameter estimate / se;
xx = 10.57591; *Dependent mean x2: mean of x2 calculated in proc corr;

*Xi;
cixi = (6.52966 - 6.04504)/0.24414; *derive critical value from upper confidence;
xi = 6.04504 - cixi*0.24414; *use CI formula;
*same process for xii;

print v vi vii;

*Q1.2 he problem of multicolinearity is a problem of exact or near exact linear relationship between the explanatory of feature
variables and not problem in the structure of the error terms on another leading to a singular matrix. Perfect MC is when atleast one of the variables are linearly dependent;

*Q1.3 
There could be a case of MC between variables x3 and x6, as they have a very high correlation co-efficient 
indicating there is a strong relationship between the 2. We also have a relatively high R2 value 0f 0.9256.
Furthermore, the VIF values are high, indicating more MC;

*Q1.4 We can drop x6 because of its highest VIF;

*Q1.5 

** QUESTION 2;

proc reg data=D;
model y = x2 / vif covb;
run ;

proc iml;
use D;
read all into DM;
x2 = DM[,1];
y = DM[,2];

*calculate and interpret t-test;
Q3 = abs(x2`*x2);

*QUESTION 3;
data a;
    input income1 income2 house stand prop;
    datalines;
111.004 220.1234 735.779 920.53 1215.86
112.702 227.64225 413.522 690.15 917.67
114.116 219.93375 567.238 903.11 1201.16
115.89 212.39725 496.226 659.05 1099.73
147.286 202.238 414.292 769.92 1077.25
156.125 189.28525 283.223 539.62 973.28
170.381 182.01975 671.121 934.58 1206.01
174.029 185.4567 284.473 707.85 1071.03
212.752 182.1212 492.552 699.23 834.6
214.999 175.88475 767.408 1097.32 1102.11
288.411 174.7265 373.14 760.19 774.12
289.496 170.879 238.515 577.39 828.64
300.932 170.10025 589.865 930.42 1020.1
332.232 165.4444 461.059 920.65 1044.39
355.701 160.9886 345.385 655.05 932.65
371.076 150.2121 531.592 1093.24 1036.68
376.907 150.2111 497.296 727.87 867
380.401 150.233 383.097 903.32 1114.49
383.516 147.374 351.969 575.44 833.46
398.906 140.2346 650.882 950.26 1044.39
403.539 135.0101 439.853 849.32 831.6
408.237 128.188 400.907 571.64 773.7
425.548 128.0202 554.191 948.33 1273.24
428.079 125.0122 734.862 970.72 1124.66
457.141 122.1111 507.147 686.02 1146.86
508.952 111.8215 372.881 520.79 836.79
549.589 103.9725 550.987 1048.71 1023.95
579.735 103.529 400.458 550.31 834.02
610.569 103.1755 445.404 600.35 1064.84
621.502 102.751 535.123 1078.51 1075.3
;
run;

data anew;
set a;
income = income1 + income2;

proc iml;
use a;
read all var {income1 income2 house stand prop} into ma; 
income1 = ma[,1] + ma[,2]; 
create anew var {income1 income2 house stand prop}; 
append from ma; 
close anew; /* Close the new dataset */
quit;







