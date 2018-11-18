function f=differ(t,p)
if t==0
    f=p;
    %disp('here_diff')
elseif t>0
    %disp('here_diff')
    f=(1-(p)/10)*p;
end
