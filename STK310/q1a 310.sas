options ls=72 nodate pageno=1 ;


data a;

input y x ;


datalines;
113030    195
115906    213
121999    232
125210    228
122836    200
127528    234
125335    207
127382    229
124247    214
124377    208
118880    197
 ;

 proc print ;
 title "LA q1 " ;

data a;
set a;
ly = lag(y);

proc reg data = a;
model y = x ly;

proc iml;
*parameter estimates;
alphastar = -3159.82537; *intercept value;
lambda = 0.66915; *ly value;
B0 = 205.21856; *x value;
B1 = B0*(lambda**1);
B2 = B0*(lambda**2);
B3 = B0*(lambda**3);
B4 = B0*(lambda**4);
alpha = alphastar/(1-lambda);
print lambda B0 B1 B2 B3 B4 alpha;

*Final model: Ythat = alpha + B0Xt + B1Xt-1 + B2Xt-2...;

