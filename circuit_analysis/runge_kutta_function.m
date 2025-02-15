function [X,Y] = runge_kutta_function(f,t0,y0,h,tn)

n=(tn-t0)/h;
X=1:h:n;

t=zeros(1,n);
Y=zeros(1,n);
t(1)=t0;
Y(1)=y0;

for i=1:n
    t(i+1)=t0+i*h;
    k1=f(t(i),Y(i));
    k2=f(t(i)+(h/2),Y(i)+(h/2)*k1);
    k3=f(t(i)+(h/2),Y(i)+(h/2)*k2);
    k4=f(t(i)+(h),Y(i)+h*k3);
    Y(i+1)=Y(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
end

end

