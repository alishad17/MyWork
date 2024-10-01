proc iml;
*===>; lower=-5;
*===>; upper=-9;
*===>; number=9;
w=(upper-lower)/number;
blocks=(1:number)`;
ul=lower+w*blocks;
ll=ul - J(number,1,w);
ml=(ll+ul)/2;
*===>; x=ll;
*===>; fv=7 + 6#x + x##2;
av=w#fv;
area=sum(av);
print lower upper number w,
blocks ll ul ml fv av,
area;
quit;
