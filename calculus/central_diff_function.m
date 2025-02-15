function [output] = central_diff_function(f,x,h)

 output = (f(x+h)-f(x-h))/(2*h);

end

