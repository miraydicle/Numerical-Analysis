function [sol,count,is_valid] = fixed_point_function(g,x0,e,n)

 sol=0;
 count=0;
 is_valid=-1;

 for i=1:n
     x1 = g(x0);
     if abs(x1-x0)<e
         sol=x1;
         count=i;
         is_valid=0;
         break
     end
     x0=x1;
 end

end

