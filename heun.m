function [val,t]=heun(y0,ti,tf,dt)
% The function defines the Heun's Method for approximation of ODE.
% The Input parameter for the function are:
%  y0  = Initial Value of Function,
%  ti  = Starting Time.
%  tf  = End Time.
%  dt  = Time Step Size
% The function can be used to get return as vector containing Function approximation and time stamps of these evaluatons.
val=[];
t=ti:dt:tf;
%%disp('here_huen')
for i=1:max(size(t))
    if i==1
        val(i)=y0;
    else
        val(i)=val(i-1)+(dt/2*(differ(t(i-1),val(i-1))+differ(t(i),val(i-1)+dt*differ(t(i-1),val(i-1)))));
    end
end
