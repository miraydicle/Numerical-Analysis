function [B,B_norm] = function_create_B(F,x)

 n=size(x,1);
 B=zeros(n,1);

 for i=1:n
     B(i,:)=-F{i}(x);
 end
 B_norm=norm(B);

end

