function [output] = double_integral_function(f,a,b,m,n,steps_x,steps_y)

 h = (b-a)/steps_x;
 k = (n-m)/steps_y;
 output = 0;

 for i=1:steps_x
     for j=1:steps_y
         output = output + (h*k*f(a+i*h,m+j*k));
     end
 end

end

