ti=0; % Starting Time
tf=5; % End time
y0=1; % Initial Value of Function
dt=[1 (1/2) (1/4) (1/8)]; % various time step size
e1=[]; % vector to store error for Explicit Euler Method for above time step size
e2=[]; % vector to store error for Heun's Method for above time step size
e3=[]; % vector to store error for Runge Kutta Method for above time step size
%i=4
%eu=ex_eu(y0,ti,tf,dt(i));
%he=heun(y0,ti,tf,dt(i));
%rk4=r_k(y0,ti,tf,dt(i)),ana(ti,tf,dt(i));
% Error Evaluation
for i=1:max(size(dt))
    e1(i)=err(dt(i),dt(max(size(dt))),ti,tf,ex_eu(y0,ti,tf,dt(i)),ana(ti,tf,dt(max(size(dt)))));
    e2(i)=err(dt(i),dt(max(size(dt))),ti,tf,heun(y0,ti,tf,dt(i)),ana(ti,tf,dt(max(size(dt)))));
    e3(i)=err(dt(i),dt(max(size(dt))),ti,tf,r_k(y0,ti,tf,dt(i)),ana(ti,tf,dt(max(size(dt)))));
end
% Uncomment the loop below for plots
k=1;
for j=1:3
    pl_ap(y0,ti,tf,dt,j,k)
     k=k+1;
end
% relative error calculation when time step is halved
r_e1=[];
r_e2=[];
r_e3=[];
for i=2:max(size(dt))
        r_e1(i-1)=rel_err(e1(i-1),e1(i));
        r_e2(i-1)=rel_err(e2(i-1),e2(i));
        r_e3(i-1)=rel_err(e3(i-1),e3(i));
end


% Error estimation relative to the best case corresponding to each method
% based of minimum time step size
eb1=[];
eb2=[];
eb3=[];
for i=1:max(size(dt))
    eb1(i)=err(dt(i),dt(max(size(dt))),ti,tf,ex_eu(y0,ti,tf,dt(i)),ex_eu(y0,ti,tf,dt(max(size(dt)))));
    eb2(i)=err(dt(i),dt(max(size(dt))),ti,tf,heun(y0,ti,tf,dt(i)),heun(y0,ti,tf,dt(max(size(dt)))));
    eb3(i)=err(dt(i),dt(max(size(dt))),ti,tf,r_k(y0,ti,tf,dt(i)),r_k(y0,ti,tf,dt(max(size(dt)))));
end
clear i;
clear k;