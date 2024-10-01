** Assignment 1;

%web_drop_table(D); *Not really necessary unless the table exists;

FILENAME REFFILE '/home/u63312465/STK310/Assignments/Assignment 1/musickvideos (1).csv' encoding= 'wlatin1';

PROC IMPORT DATAFILE= REFFILE
DBMS = CSV
OUT = D;
GETNAMES = YES;
RUN;
proc contents data=D;
run;


** Calculate the average file size and the average song length as well as the standard
deviations of these two variables. ;

*Mine;
proc means data = D mean std;
run;


** Use the Shapiro-Wilk normality test to test whether the distributions of the file sizes and
the song lengths are normal.;

proc univariate data = D normal;
run; *SPECIFY the var;
*Memo;
proc univariate data = D normal;
var 'File Size'n 'Song Length'n;

* Reject both, 0.0003 and 0.0080 are both less than 0.05, so not deemed significant. 

** Compare the averages and standard deviations of the file sizes and of the song lengths for
the 13 videos with high picture and audio quality with the averages and standard
deviations of the file sizes and of the song lengths for the 13 videos with low picture and
audio quality.; 

proc sort data=D;
  by 'Video Quality'n;
run;

proc means data=D(where=("Video Quality"n = 'High')) n mean std;
run;
proc means data=D(where=("Video Quality"n = 'Low')) n mean std;
run;

*MEMO;
proc sort data=D;
  by 'Video Quality'n;
run;
proc means data = D mean std;
var 'File Size'n 'Song Length'n ;
by 'Video Quality'n;
run;


**Draw box plots to compare the distributional properties of the file sizes and of the song
lengths between the 13 high quality videos and the 13 low quality videos. ;
data Dsort; set D;
proc sort data=Dsort;
by 'File Size'n;
proc sort data=Dsort;
by 'Song Length'n ;
proc sort data=Dsort;
by 'Video Quality'n;
run;
e;
proc Boxplot data = Dsort;
plot 'File Size'n * 'Video Quality'n;
run;
proc Boxplot data = Dsort;
plot 'Song Length'n  * 'Video Quality'n;
run;

** Use t-tests to test whether the average file size of high-quality videos differs significantly
from the average file size of low quality videos and to test whether the average song length
of high quality videos differs significantly from the average song length of low quality
videos. ;

proc ttest data=D plot=none;
class 'Video Quality'n;
var 'File Size'n ;
*p value (0.0947) > 0.05, Dor not reject at 5% significance level;

proc ttest data=D plot=none;
class 'Video Quality'n;
var 'Song Length'n ;

** Draw a scatter diagram of the file sizes against the song lengths;

proc gplot data = D;
plot 'File Size'n * 'Song Length'n;
run;

*h Repeat (g), but distinguish on the scatter diagram between the high quality and low
quality videos. ;

symbol1 i=none v=star w=2 color=blue;
symbol2 i=none v=star w=2 color=red;
symbol3 i=none v=star w=2 color=green;

proc gplot data = D;
plot 'File Size'n * 'Song Length'n =  'Video Quality'n;
run;




