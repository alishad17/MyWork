/*******************************************************************************/
/* You may use QUIZ1.SAS to help you with Quiz1.                               */
/*******************************************************************************/

/* Substitution note: the original PROC IMPORT read a local CSV at
   /home/u63312465/STK220/Practical 1/Quiz 1/Quiz1.csv. That path isn't available
   here, so this bundle builds the Quiz1 dataset inline with DATALINES instead --
   same X1/X2/X3 shape the rest of the script (unmodified below) expects. */
data Quiz1;
input X1 X2 X3;
datalines;
3.1 4.2 2.9
5.4 3.8 6.1
2.7 5.0 4.4
6.2 2.5 3.3
4.8 6.7 5.2
3.9 4.1 2.6
7.0 5.5 4.9
2.2 3.6 3.1
5.1 4.7 6.3
4.4 2.9 3.8
6.6 5.3 4.0
3.5 4.9 5.7
5.9 3.2 2.8
4.1 6.0 4.5
2.9 3.4 5.1
6.4 4.6 3.9
3.3 5.8 4.2
5.6 2.7 3.6
4.7 4.4 5.9
3.0 3.9 4.1
;
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
quit;

proc means data = ycol;
run;

data Ycol2; set Ycol;
  if Y>=14 then grp1=1; else grp1=0;
  if Y<=25 and Y>=16 then grp2=1; else grp2=0;
run;


proc freq data = ycol2;
tables grp1 grp2;
run;
