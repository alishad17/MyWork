** Practical 2;

data ar1;
n = ;
seed = 0;
theta0 =;
phi=;
mean_zt = theta0/(1-phi);
vat_at = ;
zt_l = mean_zt;
do t = to n;
at = sqrt(var_at)*rannor(seed);
zt = theta0 + phi * zt_l + at;
if t > 0 then output;
zt_l = zt;
end;
run;

symbol color=black;
proc gplot data = ar1;
plot zt*t;
run;

proc arima dat = ar1 plots(only)=series(acf pacf);
identify var=zt nlag=6;
run;