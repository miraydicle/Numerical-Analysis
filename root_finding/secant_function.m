function [sol,count,is_valid] = secant_function(f,x0,x1,e,n)

 sol=0;
 count=0;
 is_valid=-1;

 for i=1:n
     x2 = (x0*f(x1)-x1*f(x0))/(f(x1)-f(x0));
     if abs(f(x2))<e
         sol=x2;
         count=i;
         is_valid=0;
         break
     end
     x0=x1;
     x1=x2;
 end

end

