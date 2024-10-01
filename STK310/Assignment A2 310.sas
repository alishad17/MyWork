
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

** Question 1A - correlation co-efficent;

proc corr data = D;
var 'Song Length'n 'File Size'n;
run;
*r = 0.70427, positive linear relation;

** OLS regression line;

proc reg data = D;
model 'File Size'n ='Song Length'n / covb;
run;
*For every unit increase in song length, there is a 0.09619 increase in file size on average.;


proc iml;
*Estimated variance - ALSO MSE;
*df = n-2;
*sigma2 = ; *error sum of squares/df, MSE, RootMSE^2;
print sigma2;

*Variance of B1 and B2;
varB1 = 5.50112**2; *standard error from proc reg;
varB2 = 0.01977**2;
print varB1 varB2;

covB1B2 = -(xbar)#(varB2);
print covB1B2;
*Also, covariance of estimates (intercept & song_length);

proc means data = D mean;
var Song_Length;


proc sgplot data=D;
   reg y='File Size'n x='Song Length'n;
run;

** Question 2;
*Our method of exlusion: where Artist_or_Band ne 'Rammstein';

*Memo method: 
data exclRamm;
*set D;
*od = 1;
*if Artist_or_Band = "Rammstein" then od = 0;

run; 
proc reg data=D;
   model File_Size = Song_Length;
   where Artist_or_Band ne 'Beck';
run;

proc corr data = D;
var Song_Length File_Size;
where Artist_or_Band ne 'Rammstein';
run;

proc means data = D mean;
var Song_Length;
where Artist_or_Band ne 'Rammstein';
run;

proc sgplot data=D;
   reg y=File_Size x=Song_Length;
   where Artist_or_Band ne 'Rammstein';
run;


** Question 3;

proc univariate data = D;

proc iml;
varNames = {"Song Length"n "File Size"n}; *reading dataset into a matrix;
use D;
read all var varNames into MD [colname=varNames];
print MD;

a = 26; *n;
* a = nrow(MD);

b = sum(MD[,1]); *sigma Xi;
c = sum(MD[,2]); *sigma Yi;
d = sum(MD[,1]##2); *sigma Xi squared;
* d= ssq(MD[,1]);

e = sum(MD[,1]#MD[,2]); *Sigma Xi Yi;
f = mean(MD[,1]); *Xbar;
g = mean(MD[,2]); *Ybar;
h =(a#e-b#c)/(a#d-b##2); *beta 2;
i = ((1/a)#c) - ((1/a)#h#b); *beta 1;
j = sum((MD[,1]-f)##2); *sigma small xi; 
k = sum((MD[,2]-g)##2); *sigma small yi & TSS/SST;
l = (h##2)#j; *ESS (formula: Beta 2 squared Multiplied by sigma small xi);
m = sum((MD[,2]-(h#MD[,1])-i)##2); *RSS (sum of mu hat squared);
n = 1 - (m/k); *R^2, co-efficent of determination; *in this case, 1 - (RSS/TSS);
o = m/(a-2); *MSE, sigma hat squared; 
p = sqrt((o#d)/(a#j)); *Beta 1 standard error;
q = sqrt(o/j); *Beta 2 standard error;
r = (-f)#q##2; *cov B1 and B2;
print a b c d e h i j k l m n o p q r;


proc iml;
varNames = {"Song_Length" "File_Size"};
use D (where = (Artist_or_Band ne 'BECK');
read all var varNames into MD [colname=varNames];
print MD;

a = 24;
b = sum(MD[,1]) + 227;
c = sum(MD[,2]);
d = sum(MD[,1]##2);
e = sum(MD[,1]#MD[,2]);
g = mean(MD[,2]);
h = ((a#e)-(b#c))/((a#d) - (b##2));
i = ((1/a)#c) - ((1/a)#h#b);
k = sum((MD[,2]-g)##2);
m = sum((MD[,2]-(h#MD[,1])-i)##2);
n = 1 - (m/k);
o = m/(a-2);

print b c e m n o;










