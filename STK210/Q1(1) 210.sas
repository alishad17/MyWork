/***********************************************/
/* You can use this SAS program for Question 1 */
/***********************************************/

proc iml;
print 'Practical 9: Question 1';

print 'Question 1(a)';
xt=0:5; * row vector; print xt;
x=xt`;  * column vector;
p={0.18,0.39,0.24,0.14,0.04,0.01};
char_x='0':'5'; 
print 'The column vector x:' x 'The vector with probabilites:' p[rowname=char_x];

print 'Question 1(b)';

****************************************************************************;
* Note: You may use x=*+1 for the row number since the first category is x=0;
****************************************************************************;
Q1bi=p[3+1];
Q1bii=sum(p[1:3+1]);
Q1biii= sum(p[3:5]);
Q1biv = sum(p[4:6]);
print Q1bi Q1bii Q1biii Q1biv;

print 'Question 1(c)';
f=cusum(p);
print f[rowname=char_x];

print 'Question 1(d)';
****************************************************************************;
* Note: You may use x=*+1 for the row number since the first category is x=0;
****************************************************************************;
Q1div=f[3+1]-f[2+1];
Q1dv=f[3+1];
Q1dvi = f[5] - f[2];
Q1dvii= 1 - f[3];
print Q1div Q1dv Q1dvi Q1dvii;

print 'Question 1(e)';
call randseed(101,1); v = randfun(8, 'Table', p);
Q1e = v- J(8,1,1); *because our table starts from 0 and not 1, we need to subtract 1;
print v Q1e;

print 'Question 1(f)';
call randseed(242,1); w=randfun(1000,'Table',p);
X=w-J(1000,1,1);
create DiCarlo from X[colname='Sold'];
append from X; 
print 'The 500th observation' (X[500]);
quit;

ods graphics off;
proc univariate data=DiCarlo;
var sold;
histogram / midpoints = 0,1,2,3,4,5 interbar = 10 cfill = red; *hist goes in proc univariate;
title 'Histogram';
run;

proc freq data = DiCarlo;
tables sold; *use tables not var;

data prob; set DiCarlo;  *calculating empirical probs - until proc means;
if 2<=sold<5 then grp1=1; else grp1=0;
if sold>=3 then grp2=1; else grp2=0;

proc freq data = prob;
tables grp1 grp2;
title 'Q1fv';

proc means data = prob;
var grp1 grp2;
title 'Q1fv'



