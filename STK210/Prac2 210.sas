/******************************************************************************/
/*** NUMBAS Practical Test 2                                                ***/
/******************************************************************************/

proc iml;
call randseed(123,1); X=round(randfun({300,10},'Uniform',10,100));
print 'The first 5 rows and columns of the matrix X' (X[1:5,1:5]);

*** Do your calculations here. ***;

Q1 = MEAN(X[,2]);
Q2 = STD(X[,2]);
Q3 = MEAN(X`[249,]);
Q4 = STD(X`[249,]);
print Q1,Q2,Q3,Q4;
quit;
