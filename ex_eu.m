function [val,t]=ex_eu(y0,ti,tf,dt)
val=[y0];
t=ti:dt:tf;
%disp('here_ex_eu')
for i=2:max(size(t))
        val=[val,val(i-1)+dt*differ(t(i-1),val(i-1))];
end