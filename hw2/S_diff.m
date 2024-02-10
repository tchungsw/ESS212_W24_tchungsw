function S = S_diff(n)
if n == 0
    S = 0;
elseif n == 1 
    S = 1;
else 
    S = 2*S_diff(n-1) + 2*S_diff(n-2);
end