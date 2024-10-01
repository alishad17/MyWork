
**GRAPHS;

proc iml; **parabola and derivative (straight line);
x=do(1,9,0.1); *(domain of x, and increments);
y=-x##2 + 10*x - 9;
yy=-2*x+10; *(derivate of x);
title 'Plot the quadratic function f(x)';
call Series(x,y);
title 'Plot the derivative of f(x)';
call Series(x,yy);

proc iml; **exponetial graph;
*===>; theta=3;
x=do(theta/2,theta*2,0.1);
y=1/theta*exp(theta/x);
title 'Plot the exponential function f(x)';
call Series(x,y);

** AVERAGE RATE OF CHANGE;
proc iml;

x = 4; *x value
fx = -x**2 + 2*x +8;  *function;
d = 0.025;  *width of interval;

do i= 1 to 9;  *number of iterations;
h = -d;  *negative d for left approach, positive for right;
xh = x+h;
fxh = -xh**2 + 2*xh +8;  *altered function;
ARC = (fxh - fx)/h;
print  i d h x xh fx fxh ARC[f= 8.3];
d = d/2;
end;

** RIEMANN SUM **;

proc iml;
*===>; lower=-8;
*===>; upper=-2;
*===>; number=8; *number of intervals;
w=(upper-lower)/number;
blocks=(1:number)`;
ul=lower+w*blocks;
ll=ul - J(number,1,w);
ml=(ll+ul)/2;
*===>; x=ll; *ul for righ, ll for left;
*===>; fv=x**3 + x**2 - 74*x - 144; abs_fv=abs(x**3 + x**2 - 74*x - 144); *functions;
av=w#fv; abs_av=w#abs_fv;
area=sum(av); *this is the answer for riemann sum or integral;
abs_area=sum(abs_av); *answer for area;
print lower upper number w,
blocks ll ul ml fv av area,
blocks ll ul ml abs_fv abs_av abs_area;
quit;



** EXPONENTIAL FUNCTIONS **;

proc iml; *calc value of sigma e^3
*===>; x = 3; 
direct = exp(x); *original function
print x, direct;
sum = 0;
do i= 0 to 10; *number of iterations (11)
term = x**i/fact(i);
sum = sum+term;
print i term sum;
end;
run;

proc iml; *TAYLOR SERIES
*===>; x = 3;
direct = exp(x);
i = (0:10)`;
a = x##i;
b = fact(i);
term = a/b;
sum = sum(term);
print i a b term sum;
run;

** ALL EXPERIMENTAL OUTCOMES FOR SET OF MATRICES **;
proc iml;
c={'c1' 'c2'}; *define matrices;
v={'v1' 'v2' 'v3'};
d={'d1' 'd2' 'd3' 'd4' };
print 'All the experimental outcomes';
do i=1 to ncol(c); * Use NCOL function to calculate # columns;
  do j=1 to ncol(v);
    do k=1 to ncol(d);
      print (c[i]) (v[j]) (d[k]);
    end;
  end;
end;

** MISC STATISTICS **;
proc iml;
x =  *matrix we are working with
n =  *number of observations

sumx = sum(x);
sumx2 = x`*x;
sumx10_20 = sum(x[10:20]);
xbar = sumx/n;
cssx=(x-J(n,1,xbar))`*(x-J(n,1,xbar));
varx = cssx/(n-1);
stdx = sqrt(varx);
print sumx sumx2 sumx10_20 xbar cssx varx stdx;

** EXPECTED VALUES **;
*create matrix of x values(x) and matrix of probs (f);
proc iml;

muX = 0;
do i = 1 to n; *n is number of x values;
muX=x[i]*f[i]+muX;
end;
print muX;

*variance;
varX=0;
do i=1 to n;
sqdi=(x[i]-muX)**2;
varX=sqdi*f[i]+varX;
end;
print var

