data dog;
input Weight Height  Length @@;
cards;
12.5    45.2    60.8 18.3    52.7    68.4 22.0    58.1    74.2 15.8    47.5    62.3 28.6    64.3    82.7 19.2    53.8    70.1 24.9    60.4    76.9 13.7    46.3    61.5 17.1    50.8    66.2 26.3    62.7    80.3 20.4    55.2    71.8 23.8    59.0    75.6 14.6    48.7    63.7 27.4    63.1    81.1 21.7    56.5    73.0 25.1    61.7    78.5 16.4    49.9    65.0 29.9    65.8    84.4 22.9    57.3    73.8 18.0    51.4    67.6 30.7    67.3    88.9 23.3    58.7    75.0 19.9    54.3    70.9 27.8    64.7    83.3 20.8    55.9    72.4 24.4    61.2    77.8 15.2    48.1    63.0 28.2    63.9    82.1 21.1    56.1    73.4 25.6    62.3    79.2 16.9    50.5    66.0 29.0    65.1    83.7 22.4    57.9    74.6 18.6    52.0    68.0 30.4    66.6    87.3 23.0    57.5    74.0 19.6    53.0    69.4 27.0    63.5    81.7 20.0    54.6    71.2 24.6    60.0    76.4 15.4    48.4    63.3 28.8    64.4    82.9
;
run;

proc reg data = dog;
model Weight = Height/alpha = 0.1 clb cli clm;

proc iml;
teststat = (0.80353	 - 1)/0.01333; *SE comes from proc reg;
critv = tinv(1-0.1/2,42-2);
print teststat critv;
pval = 2#(1-probt(abs(teststat),42-2));
print pval;




varNames =  {'Weight' 'Height' 'Length'};
use dog;
read all var varNames into MD[colname = varNames];



sigma2 = 0.28135;* From proc reg;
xbar = mean(MD[,2]);
sigmax2 = ssq(MD[,2]-xbar);
sigmaYo = sigma2#(1 + (1/42)+(((45.2 - xbar)##2)/sigmax2));
print sigma2 xbar sigmax2 sigmaYo;


proc reg data = dog;
model Weight = Height Length /clb cli clm;
output out=dogs r=residual;

proc univariate data = dogs normal;
var residual;


