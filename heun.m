function [val,t]=heun(y0,ti,tf,dt)
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
