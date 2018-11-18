function []=pl_ap(y0,ti,tf,dt,m,i)
% This function is for plotting the curves based on various methods
% implemented in the program. The input parameters are:
%  y0  = Initial Value of Function,
%  ti  = Starting Time.
%  tf  = End Time.
%  dt  = Time Step Size
%  m   = Method (Explicit Euler, Heun's, Runge Kutta, or all)
%  i   = counter to control the figure number.
%  'm' takes value from 1 to 4 where 1 = Plot for Explicit Euler, 2 = Plot
%  for Heun's Method, 3 = Plot for Runge Kutta Method and 4 = Plot for all
%  three methods with analytical solution on same figure..
t=ti:dt:tf;
anay=ana(ti,tf,dt);
if m==1
    figure(i);
    plot(t,ex_eu(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['Explicit Euler for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Explicit Euler','y = Analytical'},'Location','southeast')
elseif m==2
    figure(i);
    plot(t,heun(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['Heun for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Heun','y = Analytical'},'Location','southeast')
elseif m==3
    figure(i);
    plot(t,r_k(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['Runge Kutta-4 for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Runge Kutta','y = Analytical'},'Location','southeast')
else
    figure(i);
    plot(t,ex_eu(y0,ti,tf,dt),t,heun(y0,ti,tf,dt),t,r_k(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['All Method for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Explicit Euler','y = Heun','y = Runge Kutta','y = Analytical'},'Location','southeast')
end