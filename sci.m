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
    e1(i)=err(dt(i),ti,tf,ex_eu(y0,ti,tf,dt(i)),ana(ti,tf,dt(i)));
    e2(i)=err(dt(i),ti,tf,heun(y0,ti,tf,dt(i)),ana(ti,tf,dt(i)));
    e3(i)=err(dt(i),ti,tf,r_k(y0,ti,tf,dt(i)),ana(ti,tf,dt(i)));
end
% Uncomment the loop below for plots
k=1;
%for i=1:max(size(dt))
%for j=1:4
%    pl_ap(y0,ti,tf,dt(i),j,k)
 %   k=k+1;
%end
%end
% relative error calculation when time step is halved
r_e1=[];
r_e2=[];
r_e3=[];
for i=2:max(size(dt))+1
    if i<5
        r_e1(i-1)=rel_err(e1(i-1),e1(i));
        r_e2(i-1)=rel_err(e2(i-1),e2(i));
        r_e3(i-1)=rel_err(e3(i-1),e3(i));
    else
        r_e1(i-1)=rel_err(e1(i-1),err(dt(i-1)/2,ti,tf,ex_eu(y0,ti,tf,dt(i-1)/2),ana(ti,tf,dt(i-1)/2)));
        r_e2(i-1)=rel_err(e2(i-1),err(dt(i-1)/2,ti,tf,heun(y0,ti,tf,dt(i-1)/2),ana(ti,tf,dt(i-1)/2)));
        r_e3(i-1)=rel_err(e3(i-1),err(dt(i-1)/2,ti,tf,r_k(y0,ti,tf,dt(i-1)/2),ana(ti,tf,dt(i-1)/2)));
    end
end


% Error estimation relative to the best case corresponding to each method
% based of minimum time step size
eb1=[];
eb2=[];
eb3=[];
for i=1:max(size(dt))
    eb1(i)=err(dt(i),ti,tf,ex_eu(y0,ti,tf,dt(i)),ex_eu(y0,ti,tf,dt(max(size(dt)))));
    eb2(i)=err(dt(i),ti,tf,heun(y0,ti,tf,dt(i)),heun(y0,ti,tf,dt(max(size(dt)))));
    eb3(i)=err(dt(i),ti,tf,r_k(y0,ti,tf,dt(i)),r_k(y0,ti,tf,dt(max(size(dt)))));
end
clear i;
clear k;