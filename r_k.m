function [val,t]=r_k(y0,ti,tf,dt)

% The function defines the Runge Kutta 4th order Method for approximation of ODE.
% The Input parameter for the function are:
%  y0  = Initial Value of Function,
%  ti  = Starting Time.
%  tf  = End Time.
%  dt  = Time Step Size
% The function can be used to get return as vector containing Function approximation and time stamps of these evaluatons.
val=[y0];
t=ti:dt:tf;
%disp('here_r_k')
for i= 2:max(size(t))
    y1=differ(t(i-1),val(i-1));
    y2=differ(t(i-1)+dt/2,val(i-1)+(dt/2)*y1);
    y3=differ(t(i-1)+dt/2,val(i-1)+(dt/2)*y2);
    y4=differ(t(i),val(i-1)+dt*y3);
    val(i)=val(i-1)+(dt/6*(y1+2*y2+2*y3+y4));
end
