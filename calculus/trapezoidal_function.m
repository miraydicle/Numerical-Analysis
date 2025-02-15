function [output] = trapezoidal_function(f,trap,a,b)

 h = (b-a)/trap;
 sum = 0;

 for i=1:trap-1
     sum = sum + f(a+i*h);
 end

 output = (h/2)*(f(a) + 2*sum + f(b));

end
