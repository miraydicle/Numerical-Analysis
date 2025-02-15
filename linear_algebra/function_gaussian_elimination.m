function [an,bn] = function_gaussian_elimination(a,b)
    [an, bn] = function_normalize(a, b);    
    
    for ix=1:size(an, 1)-1
        [~, max_ix] = max(abs(an(ix:size(an, 1),ix:size(an, 1))));
        if max_ix(1) ~= 1
            IP = function_pivot(size(an,1), ix, ix + max_ix(1) - 1);
            an = IP * an;
            bn = IP * bn;
        end
        M = function_build(an, ix);
        an = M * an;
        bn = M * bn;
    end
end

