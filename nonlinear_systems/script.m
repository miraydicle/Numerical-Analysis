
f1=@(x) 3.*x(1)-cos(x(2).*x(3))-1/2;
f2=@(x) x(1).^2-81.*(x(2)+0.1).^2+sin(x(3))+1.06;
f3=@(x) exp(-x(1).*x(2))+20.*x(3)+(10.*pi-3)/3;

F={f1,f2,f3};

x=[0.1;0.1;0.1];
e=10^(-4);
h=10^(-4);
n=100;

[X,XStore,step_size,error] = function_solve_nonlinear(F,x,e,h,n);

for i=1:length(X)
    subplot(1,length(X),i);
    plot(XStore(i,1:length(XStore)),1:length(XStore),'-o');
    xlabel(sprintf('X(%d)',i));
    ylabel('Iteration');
    if i==2
        title('Intermediate solutions as it converges');
    end
end
