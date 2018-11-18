function e=err(dt,ti,tf,val1,val2)
f=0;
%q=ana(ti,tf,dt);
%disp('here_err')
for i=1:max(size(val1))
    f=f+(val1(i)-val2(i))*(val1(i)-val2(i));
end
e=sqrt(dt/tf*f);
