function [output] = lagrange_derivative_function(f,x,h)

 output = (-3*f(x)+4*f(x+h)-f(x+2*h))/(2*h);

end

