/**********************************************************************/
/*** NUMBAS Quiz 4                                                  ***/
/**********************************************************************/

*===>; proc import datafile="/home/u63312465/STK210/Practical 5/Quiz4.csv"
       out=Jobs
       dbms=csv
       replace;
run;

create Jobs from Jobs;
append from Jobs;

data JobsNew; set Jobs;
Happy=mean(Score1,Score2,Score3,Score4);
if Happy < 40 then HappyGrp = 1;
if 40<=Happy<60 then HappyGrp = 2;
if Happy>=60 then HappyGrp = 3;
run;

proc means data = JobsNew;
var Score1;

proc corr data = JobsNew;
var Score2 Score4;

proc univariate data = JobsNew;
var Happy;

proc freq data = JobsNew;
table HappyGrp;

proc means data=JobsNew P90;
class JobLevel;
var Age;

proc freq data=JobsNew;
tables Degree * JobLevel;





proc print data=JobsNew (obs=10);
title "The first 10 observations of the SAS dataset JobsNew";
run;
