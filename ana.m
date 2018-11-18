function [q,t]=ana(ti,tf,dt)
%Given the following parameters this function Provides the analytical
%solution.
% ti = Starting Time.
% tf = End Time.
% dt = Step Size

    syms t % to make t as a variable
    f=@(t)(10.0./((1.0)+9.0.*exp(-t))); % analytical solution definition.
    t=ti:dt:tf; % definition of the time domain
    q=f(t); % return vector which is value of function at discrete points



