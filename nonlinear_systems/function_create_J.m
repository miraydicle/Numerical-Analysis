function [J] = function_create_J(F,x,h)

 n=size(x,1);
 J=zeros(n,n);

 dx = [1 0 0;0 1 0;0 0 1];

 for i=1:n
     for j=1:n
         J(i,j)=(F{i}(x + dx(:,j)*h) - F{i}(x - dx(:,j)*h))/(2*h);
     end
 end

end

