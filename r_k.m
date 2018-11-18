function [val,t]=r_k(y0,ti,tf,dt)
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
