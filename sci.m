ti=0;
tf=5;
y0=1;
% part c
dt=[1 (1/2) (1/4) (1/8)];
e1=[];
e2=[];
e3=[];
for i=1:max(size(dt))
    %disp('here')
    e1(i)=err(dt(i),ti,tf,ex_eu(y0,ti,tf,dt(i)),ana(ti,tf,dt(i)));
    e2(i)=err(dt(i),ti,tf,heun(y0,ti,tf,dt(i)),ana(ti,tf,dt(i)));
    e3(i)=err(dt(i),ti,tf,r_k(y0,ti,tf,dt(i)),ana(ti,tf,dt(i)));
end
e1
e2
e3
pl_ap(y0,ti,tf,dt(2),5)
r_e1=[];
r_e2=[];
r_e3=[];
for i=2:max(size(dt))
    %disp('here')
    r_e1(i-1)=rel_err(e1(i-1),e1(i));
    r_e2(i-1)=rel_err(e2(i-1),e2(i));
    r_e3(i-1)=rel_err(e3(i-1),e3(i));
end
r_e1
r_e2
r_e3
e1=[];
e2=[];
e3=[];
for i=1:max(size(dt))
    %disp('here')
    e1(i)=err(dt(i),ti,tf,ex_eu(y0,ti,tf,dt(i)),ex_eu(y0,ti,tf,dt(max(size(dt)))));
    e2(i)=err(dt(i),ti,tf,heun(y0,ti,tf,dt(i)),heun(y0,ti,tf,dt(max(size(dt)))));
    e3(i)=err(dt(i),ti,tf,r_k(y0,ti,tf,dt(i)),r_k(y0,ti,tf,dt(max(size(dt)))));
end
e1
e2
e3