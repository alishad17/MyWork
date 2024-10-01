proc iml;

/*for corr 0*/
n=1000 ;
m={100,200,300,400};
s={10 0 0 0,
  0 10 0 0,
   0 0 10 0,
   0 0 0 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 
 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;


total_cl_avg=J(5,1,0)||cl_avg;
print total_cl_avg;



/*for corr 1*/
n=1000 ;
m={100,200,300,400};
s={10 1 1 1,
  1 10 1 1,
   1 1 10 1,
   1 1 1 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 
 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;

total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;



/*for corr 2*/
n=1000 ;
m={100,200,300,400};
s={10 2 2 2,
  2 10 2 2,
   2 2 10 2,
   2 2 2 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 
 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;

total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;



/*for corr 3*/
n=1000 ;
m={100,200,300,400};
s={10 3 3 3,
  3 10 3 3,
   3 3 10 3,
   3 3 3 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 
 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;

total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;


/*for corr 4*/
n=1000 ;
m={100,200,300,400};
s={10 04 04 04,
  04 10 04 04,
   04 04 10 04,
   04 04 04 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 

 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;


total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;



/*for corr 5*/
n=1000 ;
m={100,200,300,400};
s={10 05 05 05,
  05 10 05 05,
   05 05 10 05,
   05 05 05 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 

 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;


total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;



/*for corr 6*/
n=1000 ;
m={100,200,300,400};
s={10 06 06 06,
  06 10 06 06,
   06 06 10 06,
   06 06 06 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 

 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;

total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;


/*for corr 7*/
n=1000 ;
m={100,200,300,400};
s={10 07 07 07,
  07 10 07 07,
   07 07 10 07,
   07 07 07 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 

 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;


total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;


/*for corr 8*/
n=1000 ;
m={100,200,300,400};
s={10 08 08 08,
  08 10 08 08,
   8 08 10 08,
   08 8 8 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 

 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;

total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;


/*for corr 9*/
n=1000 ;
m={100,200,300,400};
s={10 9 9 9,
  9 10 9 9,
   9 9 10 9,
   9 9 9 10} ;
 call vnormal(x,m,s,n,181) ;
  
 x = J(n,1,1) || x ;
 k=ncol(x) ; 

 beta = {3000,
            5,
            4,
            3,
            2} ;
 sigma=15;


cl_avg = J(5,1,0);
 it=100 ;
 do i = 1 to it  ;
  u = rannor(J(n,1,567567))*sigma ;
  y = x*beta+u ;

 bh = inv(x`*x)*x`*y ;
 uh = y - x*bh ;
 sih2 = uh[##]/(n-k) ;
 sebh = sqrt(sih2*vecdiag(inv(x`*x))) ;

cll=bh-tinv(0.95,(n-k))*sebh;
clu=bh+tinv(0.95,(n-k))*sebh;

confidence_lvl_len=clu-cll;
cl_avg = cl_avg + confidence_lvl_len; 

end ;/*the do loop ends here*/

cl_avg=cl_avg/it;


total_cl_avg=total_cl_avg||cl_avg;
print total_cl_avg;

nm={"na" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9"};
print total_cl_avg[colname=nm];

nm={"0" "1" "2" "3" "4" "5" "6" "7" "8" "9"};
create avglen from total_cl_avg[colname=nm];
append from total_cl_avg;