function [x,y] = leastsquare_function(X,Y)

n = length(X);
A = zeros(2,2);
B = zeros(2,1);

for i=1:2
    for j=1:2
        A(i,j) = sum(X.^(i+j-2));
    end
end

for k=1:2
    B(k) = sum((X.^(k-1)).*Y);
end

U = A\B;
P = flip(U);
x = linspace(X(1),X(n),100);
y = polyval(P,x);

end

