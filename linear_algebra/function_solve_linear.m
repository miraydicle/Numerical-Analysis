function [x] = function_solve_linear(a,b)

    x = zeros(size(a, 1), 1);
    [an, bn] = function_gaussian_elimination(a, b);

    for ix = size(a, 1):-1:1
        x(ix) = bn(ix)/an(ix, ix);
        for j = 1:ix-1
            bn(j) = bn(j) - x(ix) * an(j, ix);
        end
    end
    
end

