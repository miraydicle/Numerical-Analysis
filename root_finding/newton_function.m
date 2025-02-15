function [sol,count,is_valid] = newton_function(f,df,x0,e,n)

 sol=0;
 count=0;
 is_valid=-1;

 for i=1:n
     x1 = x0 - f(x0)/df(x0);
     if abs(f(x1)-f(x0))<e
         sol=x1;
         count=i;
         is_valid=0;
         break
     end
     if df(x1)==0
         is_valid=-1;
     end
     x0=x1;
 end

end

