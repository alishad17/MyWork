goptions reset=all;

%web_drop_table(WORK.IMPORT);

options validvarname=v7;
FILENAME REFFILE '/home/u49596556/sasuser.v94/musickvideos.csv' encoding='wlatin1';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.videos;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.videos; RUN;

proc reg data=videos;
model y= x;
run;

data videos;
set work.videos;
x=song_length;
y=file_size;
run;

proc iml;
use work.videos;
read all into x_and_y;
x=x_and_y[,2];
y=x_and_y[,1];
n=nrow(x_and_y);
nsim = 50000;
call randseed(7);
  *create empty matrices;
  random_y = j(n, nsim);
  beta2test = j(1, nsim);
  sum_y = j(1, nsim);
  sum_xy = j(1, nsim);
  sum_x = sum(x);
  sum_x2 = sum(x##2);
  do j = 1 to nsim;
    random_y[,j] = sample(y, n, "WOR")`; *randimization => sampling without replacement;
    sum_y[j] = sum(random_y[,j]);
    sum_xy[j] = x`*random_y[,j];
    beta2test[,j] = ((n * sum_xy[j] - sum_x * sum_y[j]) / (n * sum_x2 - sum_x ## 2)); *calculate beta2 for this iteration;
  end;
  beta2hat = 0.09607076; *value from proc reg;
  pvalue = sum(beta2test >= beta2hat) / nsim; *p-value is proportion of permutations where beta2 is greater than beta2 from original data;
  print pvalue;
  Call histogram(beta2test);
quit;