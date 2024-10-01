/******************************************************************************/
/*** NUMBAS Quiz 1                                                          ***/
/******************************************************************************/

proc iml;
call randseed(123,1); 
U=round(randfun({500,20},'Uniform',10,100),0.00001);
print 'The first five rows and columns of the matrix U' ,, (U[1:5,1:5]);

*** Do your calculations here. ***;

x = U[344,14];
y = U[138,6];
z = U[180,15];

print x , y , z;

ai = (69x**3)+(81x*2)+ (38x);
print ai;

aii = sqrt((y + ((96/73)*z))/46);

print aii;

bi = U[279,+];
bii = U[281,+];
print bi , bii;

V = U[137:214,];
vMax = MAX(V);
vMin = MIN(V);
print vMax, vMin;
quit;

quit;
