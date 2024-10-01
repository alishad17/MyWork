data a ;
input x	y ;
cards ;
224 391
215 395
137 246
323 582
268 489
197 355
181 328
252 463
259 466
90 154
85 160
168 300
158 284
193 361
240 433
78 151
60 100
194 346
117 202
65 124
283 502
148 288
164 291
246 446
112 202
154 296
232 476
351 756
304 653
110 201
162 308
118 242
281 593
224 473
138 296
248 529
203 435
226 483
181 374
117 239
318 692
171 373
247 522
132 268
229 472
206 437
250 533
185 399
182 382
98 196
; 
run ;
proc means data=a ;
run ;

*Question 1;

*a - estimate function;
proc reg data = a;
model y = x / clb;
output out=datares r=residual;

data resnew;
set datares;
u2 = residual*residual;

proc gplot data = resnew;
plot residual*x;
plot u2*X;

*Question c - Goldfeld Quandt Test;

proc sort data=a ;
by x ;
run ;

proc reg data=a  (obs=21);
 model y = x ;
 title " First 21 observations " ;
run ;
proc reg data=a  (firstobs=30); *30 = n - obs + 1;
 model y = x ;
 title " Last 21 observations " ;
run ;

proc iml;
*lambda = MSElast/MSEfirst;
lambda = 1948.25447/350.75045;
print lambda;
pval = 1 - probf(lambda,19,19);
print pval;
fval = finv((1 - 0.05),19,19); *get the fvalue, if lambda>fval it indicates heteroscedasticity;
print fval;

*H0: No heteroscedasticiy of the form error variance pos/neg related to X
H1: Heteroscedasticiy of the form error variance pos/neg related to X;
*p val  = 0.0002, reject Ho, HS is present;

*Question d- transforming mdoel;
*case 3 - dividing by sqrt xi;

data at;
set datares;
yt = y/sqrt(x);
xt=  x/sqrt(x);
ot = 1/sqrt(x);

proc reg data = at;
model yt = xt ot / noint clb; *Our model yt is a funciton of two terms with x in it;

*case 2 - diviidng by xi;
data at2;
set datares;
yt2 = y/x;
ot2 = 1/x;

proc reg data = at2;
model yt2 = ot2 / clb;

*Question f;azzz
proc iml;
house = -17.039 + 2.052*(350);
print house;

*Question 2;

data d;
input x y z w;
cards;
10 100 10 0.1
20 220 11 0.05
30 350 11.6667 0.03333
5 40 8 0.2
5 30 6 0.2
30 400 13.3333 0.03333
;

proc reg data =d ;
model y = x;
output out = res2 r=residuals2;

** question b - graph of estimated disturbance terms;
data dnew;
set res2;
dt = residuals2*residuals2;

proc gplot data = dnew;
plot dt*x;

** question c ;
*sd proportional to X- case 2;

data d2;
set res2;
yn = y/x;
xn = 1/x;

proc reg data = d2;
model yn = xn / clb;

** question d;
*Difference in parameters between og model and transformed is that transformed prediction takes HS into
account using WLS. Variances are not biased;

** Question 3;
*Park Test Using IML;







