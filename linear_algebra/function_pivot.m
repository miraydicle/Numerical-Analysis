function [ip] = function_pivot(size, step, ix)
    ip = eye(size);
    ip(step,step) = 0;
    ip(step,ix) = 1;
    ip(ix, ix) = 0;
    ip(ix,step) = 1;
end

