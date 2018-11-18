function []=pl_ap(y0,ti,tf,dt,m)
t=ti:dt:tf;
anay=ana(ti,tf,dt);
if m==1
    figure(1);
    plot(t,ex_eu(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['Explicit Euler for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Explicit Euler','y = Analytical'},'Location','southeast')
elseif m==2
    figure(1);
    plot(t,heun(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['Heun for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Heun','y = Analytical'},'Location','southeast')
elseif m==3
    figure(1);
    plot(t,r_k(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['Runge Kutta-4 for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Runge Kutta','y = Analytical'},'Location','southeast')
else
    figure(1);
    plot(t,ex_eu(y0,ti,tf,dt),t,heun(y0,ti,tf,dt),t,r_k(y0,ti,tf,dt),t,anay)
    xlim([ti-2*dt,tf+2*dt]);
    ylim([0,anay(max(size(anay)))+1]);
    title(['All Method for dt= ', num2str(dt)]);
    xlabel([num2str(ti) ,' < t < ', num2str(tf)]) 
    ylabel('p') 
    legend({'y = Explicit Euler','y = Heun','y = Runge Kutta','y = Analytical'},'Location','southeast')
end