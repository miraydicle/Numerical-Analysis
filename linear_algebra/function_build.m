function [m] = function_build(a,ix)
    m = eye(size(a, 1));
    m(ix+1:end, ix) = - a(ix+1:end,ix);
    m(ix+1:end, ix) = m(ix+1:end, ix) / a(ix, ix);
end
