function [X,Y] = euler_function(df,y0,h,n)

X=0:h:n;
Y=zeros(0,n);
Y(0)=y0;

for i=1:n
    Y(i+1)=Y(i)+h*df(X(i));
end

end

