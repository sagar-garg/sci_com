function f=differ(t,p)
% The function returns the value of derivative f'(t,p) at any given time t
% and parameter p. 
if t==0
    f=p;
elseif t>0
    f=(1-(p)/10)*p;
end
