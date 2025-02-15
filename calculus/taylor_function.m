function [output] = taylor_function(f,x,h)

 output = (f(x-h)-2*f(x)+f(x+h))/(h^2);

end

