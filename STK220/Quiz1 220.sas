/*******************************************************************************/
/* You may use QUIZ1.SAS to help you with Quiz1.                               */
/*******************************************************************************/

*===>;  proc import datafile="/home/u63312465/STK220/Practical 1/Quiz 1/Quiz1.csv"
        out=Quiz1
        dbms=csv
        replace;
run;

proc means data=Quiz1 maxdec=4;
var X1 X2 X3;
run;

proc iml;
use Quiz1; read all var {X1 X2 X3};
meanX1=mean(X1);
meanX2=mean(X2);
meanX3=mean(X3);
print meanX1 [f=8.4]  meanX2 [f=8.4] meanX3 [f=8.4];

a = meanX1 + meanX2 + meanX3;
print a [f = 8.4];

Y = X1 + X2 + X3;
create Ycol from Y[colname = 'Y'];
append from Y;
proc means data = ycol;

data Ycol2; set Ycol;
  if Y>=14 then grp1=1; else grp1=0;
  if Y<=25 and Y>=16 then grp2=1; else grp2=0;
run;


proc freq data = ycol2;
tables grp1 grp2;

