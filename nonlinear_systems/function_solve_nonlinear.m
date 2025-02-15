function [x,XStore,i,B_norm] = function_solve_nonlinear(F,x,e,h,n)

XStore=zeros(length(x),n);

XStore(:,1)=x;

 for i=1:n
    
     [B,B_norm]=function_create_B(F,x);
     J=function_create_J(F,x,h);
     y=function_solve_linear(J,B);
     if B_norm<e
         XStore=XStore(:,1:i);
         break
     end
     x=x+y;
     XStore(:,i+1)=x;
 end

end

