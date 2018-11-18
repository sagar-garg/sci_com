function [q,t]=ana(ti,tf,dt)
    syms t
    %disp('here_ana')
    f=@(t)(10.0./((1.0)+9.0.*exp(-t)));
    t=ti:dt:tf;
    q=f(t);



