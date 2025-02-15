%% Euler Method for 1st order

f=input('Enter function: ');
df=input('Enter derivative of function: ');
y0=input('Enter initial value of dependent variable: ');
h=input('Enter step size: ');
n=input('Enter length of X: ');

[X,Y]=euler_function(df,y0,h,n);

fplot(f,[0 n]);
hold on
plot(X,Y,'*r');


%% Runge-Kutta Method for 4th order

f=input('Enter function: ');
t0=input('Enter initial value of independent variable: ');
y0=input('Enter initial value of dependent variable: ');
h=input('Enter step size: ');
tn=input('Enter length of X: ');

[X,Y]=runge_kutta_function(f,t0,y0,h,tn);

fplot(f,[1 n]);
hold on
plot(X,Y,'*r');