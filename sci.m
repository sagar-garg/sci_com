clc;
clear all;

ti=0; % Starting Time
tf=5; % End time
y0=1; % Initial Value of Function
dt=[1 (1/2) (1/4) (1/8)]; % various time step size
an=ana(ti,tf,dt(max(size(dt)))); % anaytical solution evaluation

% Plot for analytical solution
figure(1)
plot(ti:dt(max(size(dt))):tf,an);
title('Anaytical Solution');
xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
ylabel('p') 
xlim([ti-2*dt(max(size(dt))),tf+2*dt(max(size(dt)))]);
ylim([0,an(max(size(an)))+1]);

% Error Evaluation
e1=[]; % vector to store error for Explicit Euler Method for above time step size
e2=[]; % vector to store error for Heun's Method for above time step size
e3=[]; % vector to store error for Runge Kutta Method for above time step size
for i=1:max(size(dt))
    e1(i)=err(dt(i),dt(max(size(dt))),ti,tf,ex_eu(y0,ti,tf,dt(i)),an);
    e2(i)=err(dt(i),dt(max(size(dt))),ti,tf,heun(y0,ti,tf,dt(i)),an);
    e3(i)=err(dt(i),dt(max(size(dt))),ti,tf,r_k(y0,ti,tf,dt(i)),an);
end

% plots for different methods
k=2;
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

% Variable vi stores all the values needed for time step size dt(i)
v1=[dt(1),e1(1),nan,eb1(1)]'; 
v2=[dt(2),e1(2),r_e1(1),eb1(2)]';
v3=[dt(3),e1(3),r_e1(2),eb1(3)]';
v4=[dt(4),e1(4),r_e1(3),eb1(4)]';
r_name={'dt';'error';'error red.';'error app.'};

% Table 1
disp('Table t1 = explicit Euler method (q = 1).');
t1=table(v1,v2,v3,v4,'RowNames',r_name)

% Table 2
disp('Table t2 = method of Heun (q = 2)');
v1=[dt(1),e2(1),nan,eb2(1)]'; 
v2=[dt(2),e2(2),r_e2(1),eb2(2)]';
v3=[dt(3),e2(3),r_e2(2),eb2(3)]';
v4=[dt(4),e2(4),r_e2(3),eb2(4)]';
t2=table(v1,v2,v3,v4,'RowNames',r_name)

% Table 3
disp('Table t3 = Runge-Kutta method (q = 4)');
v1=[dt(1),e3(1),nan,eb3(1)]'; 
v2=[dt(2),e3(2),r_e3(1),eb3(2)]';
v3=[dt(3),e3(3),r_e3(2),eb3(3)]';
v4=[dt(4),e3(4),r_e3(3),eb3(4)]';
t3=table(v1,v2,v3,v4,'RowNames',r_name)

clear j;
clear i;
clear k;
clear v1;
clear v2;
clear v3;
clear v4;