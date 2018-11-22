function e=err(dt,dtb,ti,tf,val1,val2)
% The function calculates the approximation error for any scheme. The input
% parameters are:
%  dt  = Time Step Size.
%  dtb = Best Time Step Size.
%  ti  = Starting Time
%  tf  = End Time
% val1 = Function Evaluation 1.
% val2 = Function Evaluation 2.
f=0;
t=ti:dt:tf;
tb=ti:dtb:tf;
j=1;
%val1
%val2
for i=1:max(size(t))
    %i
    %j
    %tj=tb(j)
   % ti=t(i)
    while (tb(j)~=t(i)||tb(j)<t(i))  %% This loop is to match time of function evaluation, i.e, it syncronises pk(t)-pk,best(t)
        j=j+1;
        %tj=tb(j)
    end
    %i
    %j
    %val1(i)
    %val2(j)
    if tb(j)==t(i)
        f=f+(val1(i)-val2(j))*(val1(i)-val2(j));
    end
    %sqrt(f)
end
e=sqrt((dt/tf)*f);
