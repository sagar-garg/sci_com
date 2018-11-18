function [val,t]=ex_eu(y0,ti,tf,dt)
% The function defines the Explicit Euler Method for approximation of ODE.
% The Input parameter for the function are:
%  y0  = Initial Value of Function,
%  ti  = Starting Time.
%  tf  = End Time.
%  dt  = Time Step Size
% The function can be used to get return as vector containing Function approximation and time stamps of these evaluatons. 
val=[y0];
t=ti:dt:tf;
%disp('here_ex_eu')
for i=2:max(size(t))
        val=[val,val(i-1)+dt*differ(t(i-1),val(i-1))];
end