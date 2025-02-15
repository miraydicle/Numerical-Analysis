function [p,err] = lagrange_fuction(x,y)

   err = 0;
   p = 0;

   sizex = length(x);
   sizey = length(y);

   if sizex ~= sizey
       err = -1;
   end

   for k = 1:sizex

       d = 1;
       n = 1;
 
       for j = 1:sizex
           if j~=k
               n = conv(n, [1-x(j)]);
               d = d * (x(k)-x(j));
           end
       end
       p = p + y(k) * n / d;
       pval = polyval(p, 1:0.1:4);
       plot(1:0.1:4, pval);
       yline(0);
       grid on
   end
end

