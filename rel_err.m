function r=rel_err(e1,e2)
% The function is for evaluation of relative error between the two
% quantitiies.
if e1==0
    r=inf;
else
    r=abs(e2-e1)/e1;
end