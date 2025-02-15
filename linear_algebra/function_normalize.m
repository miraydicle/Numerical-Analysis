function [an,bn] = function_normalize(a,b)
    max_row = max(abs(a)');
    an = a./(max_row');
    bn = b./(max_row');   
end

