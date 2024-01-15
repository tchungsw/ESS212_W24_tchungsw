function C = PT_C(n,k) 
    if n > 1
        if k == n
            C = 1;
        elseif k > 0
            C = PT_C(n-1, k-1) + PT_C(n-1, k);
        else
            C = 1;
        end
    else
        C = 1;
    end
end