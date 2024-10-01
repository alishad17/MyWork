options ls=72 nosdate pageno=1 ;


data a ;


input y x ;

z0 = x + lag(x) + lag2(x) + lag3(x) + lag4(x) + lag5(x) + lag6(x);
z1 = lag(x) + 2*lag2(x) + 3*lag3(x) + 4*lag4(x) + 5*lag5(x) + 6*lag6(x);
z2 = lag(x) + 4*lag2(x) + 9*lag3(x) + 16*lag4(x) + 25*lag5(x) + 36*lag6(x);

datalines ;
170666    159  
166893    182  
170337    203  
176950    221  
170245    167  
173640    203  
177714    190  
176321    183  
173521    187  
175926    224  
179271    196  
179414    201  
186057    221  
191173    214  
184192    181  
 ;

proc print ;
title "LA q2" ;
run ;

proc reg data = a;
model y = z0 z1 z2;

proc iml;
*parameter estimates;
z0h = 160.57332; *from proc reg;
z1h = 24.61634;
z2h = -9.13257;
B0 = z0h + z1h*(0) + z2h*(0**2);
B1 = z0h + z1h*(1) + z2h*(1**2);
B2 = z0h + z1h*(2) + z2h*(2**2);
B3 = z0h + z1h*(3) + z2h*(3**2);
B4 = z0h + z1h*(4) + z2h*(4**2);
B5 = z0h + z1h*(5) + z2h*(5**2);
B6 = z0h + z1h*(6) + z2h*(6**2);
print B0 B1 B2 B3 B4 B5 B6;

