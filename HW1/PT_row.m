function row = PT_row(n) 
    if n > 0
        row = [];
        for i = 0:n
            row = [row, PT_C(n, i)];
        end
    else
        row = 1;
    end