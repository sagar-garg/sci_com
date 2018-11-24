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
    t=ti:dt(max(size(dt))):tf;
    anay=ana(ti,tf,dt(max(size(dt))));
if m==1
    figure(i);
    hold on
    plot(t,anay);
    title('Explicit Euler');
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    xlim([ti-2*dt(max(size(dt))),tf+2*dt(max(size(dt)))]);
    ylim([0,anay(max(size(anay)))+1]);
    for j=1:max(size(dt))
    t=ti:dt(j):tf;
    plot(t,ex_eu(y0,ti,tf,dt(j)),'o--')
    end
    legend({'y = Analytical',['dt = ',num2str(dt(1))],['dt = ',num2str(dt(2))],['dt = ',num2str(dt(3))],['dt = ',num2str(dt(4))]},'Location','southeast')
    hold off
elseif m==2
    figure(i);
    hold on
    plot(t,anay);
    title('Heun Method');
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    xlim([ti-2*dt(max(size(dt))),tf+2*dt(max(size(dt)))]);
    ylim([0,anay(max(size(anay)))+1]);
    for j=1:max(size(dt))
    t=ti:dt(j):tf;
    plot(t,heun(y0,ti,tf,dt(j)),'--s')
    end
    legend({'y = Analytical',['dt = ',num2str(dt(1))],['dt = ',num2str(dt(2))],['dt = ',num2str(dt(3))],['dt = ',num2str(dt(4))]},'Location','southeast')
    hold off
elseif m==3
    figure(i);
    hold on
    plot(t,anay);
    title('Runge Kutta-4 Method');
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    xlim([ti-2*dt(max(size(dt))),tf+2*dt(max(size(dt)))]);
    ylim([0,anay(max(size(anay)))+1]);
    for j=1:max(size(dt))
    t=ti:dt(j):tf;
    plot(t,r_k(y0,ti,tf,dt(j)),'--*')
    end
    legend({'y = Analytical',['dt = ',num2str(dt(1))],['dt = ',num2str(dt(2))],['dt = ',num2str(dt(3))],['dt = ',num2str(dt(4))]},'Location','southeast')
    hold off
else
    disp('Please specify a method')
end