**Practical worksheet 1;


**Question 1;
data ma1;
n = 300;
seed = 0;
theta0 = 42; *Theta 0 is your mean;
theta = 0.3; *Theta is your MA Parameter;
var_at = 25; *White noise variance;
at_1=sqrt(var_at)*rannor(seed); *Initialise lagged term, uses normal distribution;

do t=-49 to n;
at = sqrt(var_at)*rannor(seed);
zt= theta0 + at - theta*at_1;
if t>0 then output;
at_1 = at;
end;
run;

symbol1 color=black i=join;
proc gplot data = ma1;
plot zt*t;
run;

proc arima data = ma1 plots(only)=series(acf);
identify var=zt nlag = 6;
run;

*Identify the mean of the plotted data;
*mean = 42.05102; *Mean of working series;

*Changes when we changed the number of obersevations to 3000;
*Mean changed (closer to actual value), sd changed, autocorrelation values changed, CI for zero became narrower;

*Changes when we change white nosie variation to 25;
*plot of observed values is a lot narrow, less spikes and spikes are less extreme;
*mean and sd values changed, ac values changed, still significantly 0 but also a bit more higher;


** Question 2 - MA parameter of 0;

data ma0;
n = 300;
seed = 0;
theta0 = 42; *Theta 0 is your mean;
theta = 0; *Theta is your MA Parameter;
var_at = 5; *White noise variance;
at_1=sqrt(var_at)*rannor(seed); *Initialise lagged term, uses normal distribution;

do t=-49 to n;
at = sqrt(var_at)*rannor(seed);
zt= theta0 + at - theta*at_1;
if t>0 then output;
at_1 = at;
end;
run;

symbol1 color=black i=join;
proc gplot data = ma0;
plot zt*t;
run;

proc arima data = ma0 plots(only)=series(acf);
identify var=zt nlag = 6;
run;

*Mean: 41.78637; *When we set the MA parameter to 0, the model is no longer influenced by the lagged white noise term at-1;
*The first autocorrelation is also close to 0;

