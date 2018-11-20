function e=err(dt,ti,tf,val1,val2)
% The function calculates the approximation error for any scheme. The input
% parameters are:
%  dt  = Time Step Size.
%  ti  = Starting Time
%  tf  = End Time
% val1 = Function Evaluation 1.
% val2 = Function Evaluation 2.
f=0;
for i=1:max(size(val1))
    f=f+(val1(i)-val2(i))*(val1(i)-val2(i));
    %sqrt(f)
end
e=sqrt((dt/tf)*f);
